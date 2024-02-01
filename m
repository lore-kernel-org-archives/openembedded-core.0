Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B785C47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:39:09 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.123])
 by mx.groups.io with SMTP id smtpd.web11.9254.1706765941463640342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Tu+WyXdO;
 spf=pass (domain: axis.com, ip: 40.107.105.123, mailfrom: tobias.hagelborn@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GI1kWzQkn9iBTJoyGahdkF7/bj9xg5WWhF/3aMH2D2aN2cGxq/c43IO3BoCnAf3RFOEhehHMVayyOlS0Mu2GIzq8BZEnq34t2eMhmB+zO7dVrfnKBkE92i4rxdgjQrGlIHeHNPg3HRgko1wNDZn9V1+g0PoctoKP8skXNvXi9Xog3KOLLtehDWo5Ap+dK8r7Yub3UtJbWV3fqAwC4eJ2PyuuK0ItShG24qS7RwitrqxZI2nqrfz4Vx4Qur2DGHBmcdv/olVqAgQz8Oeu0UBzCUNNzite0731Uv+Wp4NOc1tzNB6mi+SPYogm/Y4W/b4enuu/oACma9TZJfPUr9nYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifF79FDyZwBpkJssHK5UkoLRtk1ObAZp+Lq7t4RahpQ=;
 b=m/1q9VeFiIfqKiW6KTkv39T0ONzzByo18M8gTDYTXHINmtnmly5qIEcZkzPXQVnXetEvQGpD/O4U42ryyYy4mIrj36VpRHKndy7Zb25txNv9BTJaWV+8AWjpP4CeIRxFNDDOnNgNc6JvqusUgyd643yGH04qJuOn7zWrP5dQ4HxOdaM2ySKEb4AZNzfEB/6V33vhXNXdq9B4c0cOYQD3gkaSNvymBh2orR0zIXCIWiGEDWA9l8y9QCXCSFD6KGK2DhQxagI2Kba8mxvNjmv7qIl6lOf76ib5FYMVfSGCHg67j+j7LsETIw4Ymc9uAkv/Onx/f9Nk0fdUWhjU5pyTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifF79FDyZwBpkJssHK5UkoLRtk1ObAZp+Lq7t4RahpQ=;
 b=Tu+WyXdOrMqdI/avx2c8UsZTzfAk+RQgjU7YFNCN7bAYtgLi+MBfvgWzvYQTeyP7hygObKrrDftiAN7W2JuVct5kUkdyTLoqIHwin3qGMlht/9JXhfjnX6Te19W/xz8EdkKlEPlMYwP69+8SfJn8APdfrUgPy9aGzy0lcL4gBsc=
Received: from AM5PR0601CA0071.eurprd06.prod.outlook.com (2603:10a6:206::36)
 by AS8PR02MB8565.eurprd02.prod.outlook.com (2603:10a6:20b:54a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 05:38:57 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:206:0:cafe::5e) by AM5PR0601CA0071.outlook.office365.com
 (2603:10a6:206::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Thu, 1 Feb 2024 05:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7270.0 via Frontend Transport; Thu, 1 Feb 2024 05:38:57 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Feb
 2024 06:38:56 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Feb
 2024 06:38:56 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Feb 2024 06:38:56 +0100
Received: from pc37511-1950.se.axis.com (pc37511-1950.se.axis.com [10.94.62.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B651313588
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 06:38:56 +0100 (CET)
Received: by pc37511-1950.se.axis.com (Postfix, from userid 11324)
	id B1ABBB257EA; Thu,  1 Feb 2024 06:38:56 +0100 (CET)
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] sstate.bbclass: Only sign packages at the time of their creation
Date: Thu, 1 Feb 2024 06:38:43 +0100
Message-ID: <20240201053843.455797-1-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|AS8PR02MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c06033c-80cc-4248-7abf-08dc22e815c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NbgGViaf6iIHQW/MtPpeDRODRjZ4KWmamvcl1O411AnPrgMAlxhtexx6zowmlyTQvgm2U6R0PhZWYCxkKKjgB8hrkZncMyOkBo0oYgGC7648TuSmTKeM0JyDUO7btlnkGakhS3MQFI8GX09kA5WsSBUsffFas6Bgd1X4a1O2Ju9QaPjR206lS1ivmyt6zR0Wra51RvOk4A18Jyb6kLmptg1RvjOu6CGcWFOIwALhjig9OByt/YROwRl7NsKEZd8cc0vK5Gn+lam6SWZb/Nx6NQ0EU/UFLnLZJIHVUEajopbSx0MqLzd93qDsjTALrBpcOmmx5r1oRRlm3A4nUyDSsefTsEZ+o1OhWbKP3PCLD+FjLRHYQdGg1PTchvQKTRNvwP6vUPrWLJQbJ+X94k/a57BpGJzCrzE8zadT3xU0ZDCvQoukY4M1Gub4jdYfD6mPk/YAYpsf8L3dYnHh4jIXJiQWNCmr2TH4VM+gf2fdFHb+alfK6Jfy2Vgh65FJgU5UB3WkYuyZ7M9yyTuKdXHfC2O0pIZN6ZIZMSBmfHvawLN33K/Xt8VCZFYLyNykMTJDL48+FAPjux82Z6oq5OTe78hygPhQfmwvifBHX/ggbyYM8iZpDvJzNGgIaRFLjhty/vuErgQ72iws3uRjBeBohF2ATP7hVbV3vIneI3SdvPFFEDih6PdrsjZ4lTNDnpb9NAxmS1Wodn0Tl5z0aWbPiptx9KQQ54AsnSrjAHCbF0z+9uhl4rbXncJeE5B9fWjy6zV3xoIxy91t436lEmaDag==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82310400011)(36840700001)(46966006)(40470700004)(70206006)(70586007)(47076005)(42186006)(6916009)(316002)(478600001)(6666004)(8676002)(8936002)(336012)(2906002)(2616005)(83380400001)(6266002)(1076003)(426003)(82740400003)(36860700001)(26005)(5660300002)(81166007)(356005)(41300700001)(40480700001)(36756003)(40460700003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 05:38:57.2254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c06033c-80cc-4248-7abf-08dc22e815c4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194572

The purpose of the change is to never sign a package not created by
the build itself.

sstate_create_package is refactored into Python and re-designed
to handle signing inside the function. Thus, the signing should never apply
to existing sstate packages. The function is therefore renamed into
sstate_create_and_sign_package.
The creation of the archive remains in a separate shellscript function.
---
Changes since v1 based on Rickard's review comments:

- No temporary sub-directory creation unless signing is enabled
- No datastore copy
- Incorporated sstate_create_pkgdirs into sstate_create_and_sign_package
  sstate_create_and_sign_package was the only user and now that it is all
  Python function, it can also host the sstate_create_pkgdirs functionality
- Generally, we have tried to stay close to the original file behavior in
  terms of rename and hardlink into place. (The update_file() helper functi=
on)

  Validation:
  - Run in our environment since a few days back with no known issues
    so far. ~ 5000 image builds / day, both signed and unsigned.

 meta/classes-global/sstate.bbclass | 137 ++++++++++++++++++++---------
 1 file changed, 96 insertions(+), 41 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index efe7f69775..13dd3fdaf4 100644
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
@@ -817,19 +815,100 @@ python sstate_create_pkgdirs () {
         bb.utils.mkdirhier(os.path.dirname(d.getVar('SSTATE_PKG')))
 }
=20
-#
-# Shell function to generate a sstate package from a directory
-# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
-#
-sstate_create_package () {
-	# Exit early if it already exists
-	if [ -e ${SSTATE_PKG} ]; then
-		touch ${SSTATE_PKG} 2>/dev/null || true
-		return
-	fi
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
=20
-	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
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
+}
=20
+# Shell function to generate a sstate package from a directory
+# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
+# The calling function handles moving the sstate package into the final
+# destination.
+sstate_archive_package () {
 	OPT=3D"-cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
@@ -840,42 +919,18 @@ sstate_create_package () {
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


