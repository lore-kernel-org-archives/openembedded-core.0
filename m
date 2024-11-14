Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17218D68B37
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 16:33:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41243.1731601989013196069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 08:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F8E41474
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 08:33:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04AF33F6A8
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 08:33:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: rewrite sstate_archive_package in python
Date: Thu, 14 Nov 2024 16:33:03 +0000
Message-Id: <20241114163303.3611020-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 16:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207172

As sstate_archive_package just calls tar, writing the function in shell
is actually more complex and opaque than the equivalent python.

Don't check for zstd vs pzstd, we have pzstd in HOSTTOOLS so it will
always be available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/sstate.bbclass | 53 +++++++++++++++---------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
index 8e0391c666f..decfb5adefd 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -844,8 +844,7 @@ python sstate_create_and_sign_package () {
         from tempfile import TemporaryDirectory
         with TemporaryDirectory(dir=3Dsstate_pkg.parent) as tmp_dir:
             tmp_pkg =3D Path(tmp_dir) / sstate_pkg.name
-            d.setVar("TMP_SSTATE_PKG", str(tmp_pkg))
-            bb.build.exec_func('sstate_archive_package', d)
+            sstate_archive_package(tmp_pkg, d)
=20
             from oe.gpg_sign import get_signer
             signer =3D get_signer(d, 'local')
@@ -865,8 +864,7 @@ python sstate_create_and_sign_package () {
         from tempfile import NamedTemporaryFile
         with NamedTemporaryFile(prefix=3Dsstate_pkg.name, dir=3Dsstate_p=
kg.parent) as tmp_pkg_fd:
             tmp_pkg =3D tmp_pkg_fd.name
-            d.setVar("TMP_SSTATE_PKG", str(tmp_pkg))
-            bb.build.exec_func('sstate_archive_package',d)
+            sstate_archive_package(tmp_pkg, d)
             update_file(tmp_pkg, sstate_pkg)
             # update_file() may have renamed tmp_pkg, which must exist w=
hen the
             # NamedTemporaryFile() context handler ends.
@@ -874,32 +872,33 @@ python sstate_create_and_sign_package () {
=20
 }
=20
-# Shell function to generate a sstate package from a directory
-# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
+# Function to generate a sstate package from the current directory.
 # The calling function handles moving the sstate package into the final
 # destination.
-sstate_archive_package () {
-	OPT=3D"-cS"
-	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
-	# Use pzstd if available
-	if [ -x "$(command -v pzstd)" ]; then
-		ZSTD=3D"pzstd -${SSTATE_ZSTD_CLEVEL} -p ${ZSTD_THREADS}"
-	fi
+def sstate_archive_package(sstate_pkg, d):
+    import subprocess
=20
-	# Need to handle empty directories
-	if [ "$(ls -A)" ]; then
-		set +e
-		tar -I "$ZSTD" $OPT -f ${TMP_SSTATE_PKG} *
-		ret=3D$?
-		if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
-			exit 1
-		fi
-		set -e
-	else
-		tar -I "$ZSTD" $OPT --file=3D${TMP_SSTATE_PKG} --files-from=3D/dev/nul=
l
-	fi
-	chmod 0664 ${TMP_SSTATE_PKG}
-}
+    cmd =3D [
+        "tar",
+        "-I", d.expand("pzstd -${SSTATE_ZSTD_CLEVEL} -p${ZSTD_THREADS}")=
,
+        "-cS",
+        "-f", sstate_pkg,
+    ]
+
+    # tar refuses to create an empty archive unless told explicitly
+    files =3D sorted(os.listdir("."))
+    if not files:
+        files =3D ["--files-from=3D/dev/null"]
+
+    try:
+        subprocess.run(cmd + files, check=3DTrue)
+    except subprocess.CalledProcessError as e:
+        # Ignore error 1 as this is caused by files changing
+        # (link count increasing from hardlinks being created).
+        if e.returncode !=3D 1:
+            raise
+
+    os.chmod(sstate_pkg, 0o664)
=20
=20
 python sstate_report_unihash() {
--=20
2.34.1


