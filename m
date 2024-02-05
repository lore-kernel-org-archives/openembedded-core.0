Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAE7C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:03:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.94])
 by mx.groups.io with SMTP id smtpd.web11.63067.1707141825118635892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Wst7G1DZ;
 spf=pass (domain: axis.com, ip: 40.107.21.94, mailfrom: tobias.hagelborn@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfQTaRdCwfrbeyCLZR4t7wxmD1xxxtjiw3FyqzWQDjIXFpJIg3rggjI2telrV4jW+9qyV0/oJ/UeYU+MGAiccilWoj0GqIhAj4GRP2idHOFOZvdPNECxz+gsE7Qee8IYNjYK4HEQcwOGm89M5OyZA37qoS9O5NmelOskZUmkHx5D61G9e4cjrOLamTMjXaW1OXOTpPV5Si+WENkLzkOM/1R47wbgIcrR8U/7HyYAVs6TKJPHt5TRfmCjrk1WzxVRPWuNIqTBvT1I2uQQv343dBNBnqroE+mOhq4yMJfMW9ojc0C2m0ynBOyX59OxNXn5Ew+Lqoxb+HwRJJSbjSGHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuG6BdKSiAVIoYtT8zhesIN7RCqw7xOZfiZYkxpoPiE=;
 b=kqmiYZjXREQ0kQuNk83/ROho+VbluLtE4k6Y+26aUa50ZY1VgaPqfuWFPYbRJ4/E0FQ90ruARkidA6MdTW5Fa/DQ2SzuoNpAUsqd0iGxY4INFmuSctfe6XZ/5TAz9llXJJFgMsfpKB6lyQGoHlGoQJACK/aTWrb6ss7P0cW/k/ro3XmCoXxfME+gDPR5KWt+qx2CYjPujHNNPWgUTaTQmWWlr9Hk7Oouu8ukv3vWPn2q8bHXgg9SEs3M3jFm0Dg7GVzVU6GAKj51cVwwdim29o9+zdtUON5IFJBUblJOeL/PWgfzHFl5Tk8kNQJdv1gh71BDBfSFZpnBcbXZG+mvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuG6BdKSiAVIoYtT8zhesIN7RCqw7xOZfiZYkxpoPiE=;
 b=Wst7G1DZI+q/ZmKntFWjXfR6AdTzXHCdTTqM54i60jycifXFeVVU8gVRUoPprQ6aJ6KmhttDhLwE2Eg4mHN2lzifN2rrDAZ9XmJLD/A1aYgc3oeCwuwpQzb1koVh3flRQnjB8KNyXkPiIc+5ouyzzdjMwYx1NfSZ9zi1JRBetuk=
Received: from DB9PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:1da::17)
 by PR3PR02MB6249.eurprd02.prod.outlook.com (2603:10a6:102:5d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Mon, 5 Feb
 2024 14:03:41 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::a9) by DB9PR05CA0012.outlook.office365.com
 (2603:10a6:10:1da::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34 via Frontend
 Transport; Mon, 5 Feb 2024 14:03:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 5 Feb 2024 14:03:41 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Feb
 2024 15:03:40 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Feb 2024 15:03:40 +0100
Received: from pc37511-1950.se.axis.com (pc37511-1950.se.axis.com [10.94.62.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D7A5A139DC
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Feb 2024 15:03:40 +0100 (CET)
Received: by pc37511-1950.se.axis.com (Postfix, from userid 11324)
	id D3AE1B257EA; Mon,  5 Feb 2024 15:03:40 +0100 (CET)
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] sstate.bbclass: Only sign packages at the time of their creation
Date: Mon, 5 Feb 2024 15:03:34 +0100
Message-ID: <20240205140334.2033629-1-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|PR3PR02MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 89072c16-0037-4f34-8c6c-08dc26534236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+fkgW79f6VK2BpeaXBcG68rMUIXZOSOvPbk7bHXGnsdlnSxZkSObY10HL7Y/UgJnQ2dnwmgRwtY6bsi1XtCrnZKO7v8+jZq+FkLOp0xf9B7avtUpFSf+9zeYfs93+0YcxPOQnjXIs3V91pYPZw3U+gx52bCssNp4zZWONCHHrlU3O2o6NseDI4Ook3vzYWXjyP8Wz+q3hkdvDN13jzfnVA7hBxTpy0EzXNDsnoO39Bu4E0e/pnzeMUDpYOLKc7jjYHNJwaZJXzHXq3s5PSoSy6DDobTPUSYweHu9LwLRVvIqLzDflfHO6EHMbsO1/2Tv9QztW1t9oAhbc2KR9UIz9Xs0N9JLoIUI/NOKa7GKjcPRi4/J6b5dIKYOY2hK++DrihnVQpQZunx9ub7eLPFxaY+HD0JLCydHka7YBdF9Gh259yExJwSkaKehH1OwHvHdn/AZtd8XWDvxhIVeZGfS24Xyg+/sHjS3YnwPceOZ3zYXcYVZIjkwSWpwP3rhXR/eGQB1xmfEkB2tFO4EEfvsSmKVFX9M7I1+KMmbCaVgziw05hB0Y+NGvcIvxeUOz1dM+kZgy3ykPtZbGZ+8qfgm9iuAPaAdNTjYm6SDGvqfPtJgB98XTYH6httUhDAf5O5BjOEYqP9FMJA6GzqqaxwiSujh/k4d5mclYMl7WIeY3OgzrKabSp4dZUN+QqhDUDD7SE0Muqen1jl3SdkoY1vvg6LJK+Kb2lm4WKLQ0NTNNRfp2fEGvQskW80qdBhPQCBP0OFVMo8o5ZHAFJ8WNaWQsQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(478600001)(70586007)(26005)(1076003)(41300700001)(2616005)(356005)(47076005)(82740400003)(336012)(426003)(81166007)(36860700001)(8936002)(8676002)(70206006)(42186006)(316002)(6916009)(2906002)(5660300002)(6666004)(83380400001)(6266002)(36756003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 14:03:41.4155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89072c16-0037-4f34-8c6c-08dc26534236
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 14:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194937

The purpose of the change is to never sign a package not created by
the build itself.

sstate_create_package is refactored into Python and re-designed
to handle signing inside the function. Thus, the signing should never apply
to existing sstate packages. The function is therefore renamed into
sstate_create_and_sign_package.
The creation of the archive remains in a separate shellscript function.

Co-authored-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---

Changes since v1 based on Richard's review comments:

- No temporary sub-directory creation unless signing is enabled
- No datastore copy
- Incorporated sstate_create_pkgdirs into sstate_create_and_sign_package
  sstate_create_and_sign_package was the only user and now that it is all
  Python function, it can also host the sstate_create_pkgdirs functionality
- Added co-author and signed-off
- Generally, we have tried to stay close to the original file behavior in
  terms of rename and hardlink into place. (The update_file() helper functi=
on)

  Validation:
  - Run in our environment since 2 weeks back with no known issues
    so far. ~ 5000 image builds / day, both signed and unsigned.

 meta/classes-global/sstate.bbclass | 140 +++++++++++++++++++----------
 1 file changed, 94 insertions(+), 46 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index efe7f69775..96655ff24f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -703,9 +703,7 @@ def sstate_package(ss, d):
     if d.getVar('SSTATE_SKIP_CREATION') =3D=3D '1':
         return
=20
-    sstate_create_package =3D ['sstate_report_unihash', 'sstate_create_pkg=
dirs', 'sstate_create_package']
-    if d.getVar('SSTATE_SIG_KEY'):
-        sstate_create_package.append('sstate_sign_package')
+    sstate_create_package =3D ['sstate_report_unihash', 'sstate_create_and=
_sign_package']
=20
     for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
              sstate_create_package + \
@@ -810,26 +808,100 @@ python sstate_task_postfunc () {
 }
 sstate_task_postfunc[dirs] =3D "${WORKDIR}"
=20
-python sstate_create_pkgdirs () {
-    # report_unihash can change SSTATE_PKG and mkdir -p in shell doesn't o=
wn intermediate directories
-    # correctly so do this in an intermediate python task
-    with bb.utils.umask(0o002):
-        bb.utils.mkdirhier(os.path.dirname(d.getVar('SSTATE_PKG')))
+# Create a sstate package
+# If enabled, sign the package.
+# Package and signature are created in a sub-directory
+# and renamed in place once created.
+python sstate_create_and_sign_package () {
+    from pathlib import Path
+
+    # Best effort touch
+    def touch(file):
+        try:
+            file.touch()
+        except:
+            pass
+
+    def update_file(src, dst, force=3DFalse):
+        if dst.is_symlink() and not dst.exists():
+            force=3DTrue
+        try:
+            # This relies on that src is a temporary file that can be rena=
med
+            # or left as is.
+            if force:
+                src.rename(dst)
+            else:
+                os.link(src, dst)
+            return True
+        except:
+            pass
+
+        if dst.exists():
+            touch(dst)
+
+        return False
+
+    sign_pkg =3D (
+        bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG")) and
+        bool(d.getVar("SSTATE_SIG_KEY"))
+    )
+
+    sstate_pkg =3D Path(d.getVar("SSTATE_PKG"))
+    sstate_pkg_sig =3D Path(str(sstate_pkg) + ".sig")
+    if sign_pkg:
+        if sstate_pkg.exists() and sstate_pkg_sig.exists():
+            touch(sstate_pkg)
+            touch(sstate_pkg_sig)
+            return
+    else:
+        if sstate_pkg.exists():
+            touch(sstate_pkg)
+            return
+
+    # Create the required sstate directory if it is not present.
+    if not sstate_pkg.parent.is_dir():
+        with bb.utils.umask(0o002):
+            bb.utils.mkdirhier(str(sstate_pkg.parent))
+
+    if sign_pkg:
+        from tempfile import TemporaryDirectory
+        with TemporaryDirectory(dir=3Dsstate_pkg.parent) as tmp_dir:
+            tmp_pkg =3D Path(tmp_dir) / sstate_pkg.name
+            d.setVar("TMP_SSTATE_PKG", str(tmp_pkg))
+            bb.build.exec_func('sstate_archive_package', d)
+
+            from oe.gpg_sign import get_signer
+            signer =3D get_signer(d, 'local')
+            signer.detach_sign(str(tmp_pkg), d.getVar('SSTATE_SIG_KEY'), N=
one,
+                                d.getVar('SSTATE_SIG_PASSPHRASE'), armor=
=3DFalse)
+
+            tmp_pkg_sig =3D Path(tmp_dir) / sstate_pkg_sig.name
+            if not update_file(tmp_pkg_sig, sstate_pkg_sig):
+                # If the created signature file could not be copied into p=
lace,
+                # then we should not use the sstate package either.
+                return
+
+            # If the .sig file was updated, then the sstate package must a=
lso
+            # be updated.
+            update_file(tmp_pkg, sstate_pkg, force=3DTrue)
+    else:
+        from tempfile import NamedTemporaryFile
+        with NamedTemporaryFile(prefix=3Dsstate_pkg.name, dir=3Dsstate_pkg=
.parent) as tmp_pkg_fd:
+            tmp_pkg =3D tmp_pkg_fd.name
+            d.setVar("TMP_SSTATE_PKG", str(tmp_pkg))
+            bb.build.exec_func('sstate_archive_package',d)
+            update_file(tmp_pkg, sstate_pkg)
+            # update_file() may have renamed tmp_pkg, which must exist whe=
n the
+            # NamedTemporaryFile() context handler ends.
+            touch(Path(tmp_pkg))
+
 }
=20
-#
 # Shell function to generate a sstate package from a directory
 # set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
-#
-sstate_create_package () {
-	# Exit early if it already exists
-	if [ -e ${SSTATE_PKG} ]; then
-		touch ${SSTATE_PKG} 2>/dev/null || true
-		return
-	fi
-
-	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
-
+# The calling function handles moving the sstate package into the final
+# destination.
+sstate_archive_package () {
 	OPT=3D"-cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
@@ -840,42 +912,18 @@ sstate_create_package () {
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
 		set +e
-		tar -I "$ZSTD" $OPT -f $TFILE *
+		tar -I "$ZSTD" $OPT -f ${TMP_SSTATE_PKG} *
 		ret=3D$?
 		if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
 			exit 1
 		fi
 		set -e
 	else
-		tar -I "$ZSTD" $OPT --file=3D$TFILE --files-from=3D/dev/null
-	fi
-	chmod 0664 $TFILE
-	# Skip if it was already created by some other process
-	if [ -h ${SSTATE_PKG} ] && [ ! -e ${SSTATE_PKG} ]; then
-		# There is a symbolic link, but it links to nothing.
-		# Forcefully replace it with the new file.
-		ln -f $TFILE ${SSTATE_PKG} || true
-	elif [ ! -e ${SSTATE_PKG} ]; then
-		# Move into place using ln to attempt an atomic op.
-		# Abort if it already exists
-		ln $TFILE ${SSTATE_PKG} || true
-	else
-		touch ${SSTATE_PKG} 2>/dev/null || true
+		tar -I "$ZSTD" $OPT --file=3D${TMP_SSTATE_PKG} --files-from=3D/dev/null
 	fi
-	rm $TFILE
+	chmod 0664 ${TMP_SSTATE_PKG}
 }
=20
-python sstate_sign_package () {
-    from oe.gpg_sign import get_signer
-
-
-    signer =3D get_signer(d, 'local')
-    sstate_pkg =3D d.getVar('SSTATE_PKG')
-    if os.path.exists(sstate_pkg + '.sig'):
-        os.unlink(sstate_pkg + '.sig')
-    signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY', False), None=
,
-                       d.getVar('SSTATE_SIG_PASSPHRASE'), armor=3DFalse)
-}
=20
 python sstate_report_unihash() {
     report_unihash =3D getattr(bb.parse.siggen, 'report_unihash', None)
--=20
2.30.2


