Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EE7C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 06:09:53 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.75])
 by mx.groups.io with SMTP id smtpd.web10.16384.1703225383735770783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 22:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=OQqXQ5y9;
 spf=pass (domain: axis.com, ip: 40.107.247.75, mailfrom: tobias.hagelborn@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRJuKwwvQntpWjh57gc8OgZnX+negrN9wlavesXINng5NYC9E/4MqmfmPmuaWBsVxYuLfyl59BmJS41e/9i7eyf9d8lK0AX/BS+Up5i0pYJHn7OKBzBrMmaRf26lDVngjPUvi0GCXnmQzt6NZ/7DDM91l1GR6XUvmBkIP8a+zdlMdJQw1rHl9Qf+AbpzLa7yFpEfx9pzbyNvG7vOkrbKlu8i9mpilckl2hDg35SqqaVfPBFBVO6cJHBJkn6LjZI1r/SMLKMkxW2b16uUDVUriYhCRLg2hPsUkdIKn3ydpDJF+z8zxcI4u9EbXsq73VBVpZ9zKGp4K2ZJIi0rAQkk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAjZwUSOZhET9VxCKInde+psiwRfXL5ZCCavHK91eG4=;
 b=QS4YkSTY7lyME5qJp8SO/js0VCLg2KqyIdO3ZULSy8bZn1eXjhsNapbu9HwNCnQUdaPnw1vNNQRyM07iQdHYbPZ/SPMJtHBqnWOr4iq7OBMulN0HUZJrzLABLzPZV0Q81UkiQtAS5OVZSNacaphlwvlmBVyfE3fYJM+eKzYIkHZaHWPqHy6P715dEMz/qcGh0A5UPXLunUQyF4TZwntv6gH5akPEXaDVNLjjwa3G4B+JGAfkcYb33OY6b5C61+7IbYsxPv868ffDUC29TmW7RI5DtWhc0azpWP59y8g0SWV8XDV6Chs5HWHKkcVqd200cJr+8nQcCc5rKTq7dakEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAjZwUSOZhET9VxCKInde+psiwRfXL5ZCCavHK91eG4=;
 b=OQqXQ5y9uAvxVwMxkNLqGRRgdp5+SGrfB7O2hf8Fi98TsZlbLG01u9E8pHRj30Q3+qjxB8k2J9E8/i3DsplQVFTn7kOklXJ1bbAGo9dNQ5KYQSq1wSyO/fnPCEpIwMu5WFpCjYKDXmg+3GL6VEHfUcTyY5C+8yReFPKAEbDHJFw=
Received: from AM0PR02CA0206.eurprd02.prod.outlook.com (2603:10a6:20b:28f::13)
 by PA4PR02MB6800.eurprd02.prod.outlook.com (2603:10a6:102:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 06:09:40 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::c5) by AM0PR02CA0206.outlook.office365.com
 (2603:10a6:20b:28f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Fri, 22 Dec 2023 06:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Fri, 22 Dec 2023 06:09:39 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 22 Dec
 2023 07:09:39 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 22 Dec 2023 07:09:39 +0100
Received: from pc37511-1950.se.axis.com (pc37511-1950.se.axis.com [10.94.62.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 194E7107A6
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 07:09:39 +0100 (CET)
Received: by pc37511-1950.se.axis.com (Postfix, from userid 11324)
	id 1CD52B257EA; Fri, 22 Dec 2023 07:09:39 +0100 (CET)
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sstate.bbclass: Only sign packages at the time of their creation
Date: Fri, 22 Dec 2023 07:09:32 +0100
Message-ID: <20231222060932.1504845-2-tobias.hagelborn@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231222060932.1504845-1-tobias.hagelborn@axis.com>
References: <20231222060932.1504845-1-tobias.hagelborn@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A63:EE_|PA4PR02MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: df283713-ef7b-4024-1291-08dc02b494ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XjDrztbw/zew0Om+QaKd35C4KTKXOslKTlGneGmLnl0KKeFadc3MjUBWdUOZGmZiMZdEf+JL6z08Vf6hWbDfNfmxj8VPDrkRhDuiFdhAATwRhM5j9KdBWK06cHKb1OvC/YfGf11RcUj3cwTvI7cDbMGXNdkF7CPo+nduF4zSWkLgVeeTzNAjB1w3phLCb6Gg/8R9VbZT+xTl2j6//lWs0NUEpPF+Mu7LWp6WVTaE19y80DJrz2+fzTFoxX9f8fockrxyk8jy3DmQA11kNfjchifulf+cMbPEAILDWjzt+DYQ/HT2BUaUyDYwpiRcThPG3qHjzh8yQTyGpRnayZNb8Ij87YUG1VSNVt1fy+msSJtc26zfU75Rwlo8WpW00ygGXpUke2B0wfQ4boMQSpzv322RY8X49xrDiE8eCwQ422TNWj0wLnBLSUq941L2zoqplEgc1IV0UMAJi2yUTeDbmGv/VWu0ZQKJtcmlXr6hCH0STUDnoDdjx2WvS9yC5z9BpFh0DSGaOUaj9lwkgl92LfVgV/RgTeRnFddjX3H0fsK5LWlrG6fYi7S4VGBKggAXH7++G52kx36pf3ka3sgFeXXdFjpHYiSKiq3hDuOZX6UHa4QZ2GtLrk5ZTn2JGRW3DrgnWJsL0RZBSy7W5R6zUYkxkhqqWlkXmgyOMIJRtFX9Q+S82X8R97DYBoNtfkMBitG2T7/r0zEGiexnbW+BYqVsRL6mCm25H5rYFQSQv2BFYT2jfoti9N/M+XPGmHvRCKCcWzqjORLEcJyzrslfmw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(46966006)(40470700004)(36840700001)(8936002)(8676002)(36860700001)(70206006)(70586007)(6916009)(316002)(42186006)(356005)(82740400003)(2906002)(41300700001)(86362001)(36756003)(81166007)(44832011)(5660300002)(2616005)(47076005)(1076003)(26005)(83380400001)(478600001)(6666004)(40480700001)(336012)(6266002)(426003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 06:09:39.4738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df283713-ef7b-4024-1291-08dc02b494ef
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 06:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192860

From: Tobias Hagelborn <tobiasha@axis.com>

The purpose of the change is to never sign a package not created by
the build itself.

sstate_create_package is refactored into Python and re-designed
to handle signing inside the function. Thus, the signing should never
apply to existing sstate packages. The function is therefore renamed
into sstate_create_and_sign_package.
The creation of the archive remains in a separate shellscript function.

Co-authored-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
 meta/classes-global/sstate.bbclass | 128 ++++++++++++++++++++---------
 1 file changed, 87 insertions(+), 41 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 9330433bb2..bc7bdbe7d5 100644
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
+    sstate_create_package =3D ['sstate_report_unihash', 'sstate_create_pkg=
dirs', 'sstate_create_and_sign_package']
=20
     for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
              sstate_create_package + \
@@ -817,19 +815,91 @@ python sstate_create_pkgdirs () {
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
+# Create sstate package
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
+    verify_sig =3D (
+        bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG")) and
+        bool(d.getVar("SSTATE_SIG_KEY"))
+    )
=20
+    sstate_pkg =3D Path(d.getVar("SSTATE_PKG"))
+    sstate_pkg_sig =3D Path(str(sstate_pkg) + ".sig")
+    if verify_sig:
+        if sstate_pkg.exists() and sstate_pkg_sig.exists():
+            touch(sstate_pkg)
+            touch(sstate_pkg_sig)
+            return
+    else:
+        if sstate_pkg.exists():
+            touch(sstate_pkg)
+            return
+
+    from tempfile import TemporaryDirectory
+    if not sstate_pkg.parent.is_dir():
+        sstate_pkg.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
+
+    with TemporaryDirectory(dir=3Dsstate_pkg.parent) as tmp_dir:
+        tmp_pkg =3D Path(tmp_dir) / sstate_pkg.name
+        localdata =3D d.createCopy()
+        localdata.setVar("SSTATE_PKG", str(tmp_pkg))
+        bb.build.exec_func('sstate_archive_package', localdata)
+
+        force =3D False
+        if verify_sig:
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
+            force =3D True
+
+        update_file(tmp_pkg, sstate_pkg, force)
+}
+
+# Shell function to generate a sstate package from a directory
+# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
+# The calling function handles moving the sstate package into the final
+# destination.
+sstate_archive_package () {
 	OPT=3D"-cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
@@ -840,42 +910,18 @@ sstate_create_package () {
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
 		set +e
-		tar -I "$ZSTD" $OPT -f $TFILE *
+		tar -I "$ZSTD" $OPT -f ${SSTATE_PKG} *
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
+		tar -I "$ZSTD" $OPT --file=3D${SSTATE_PKG} --files-from=3D/dev/null
 	fi
-	rm $TFILE
+	chmod 0664 ${SSTATE_PKG}
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


