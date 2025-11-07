Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2E4CCFA18
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:27:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1251.1762529258125853274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 07:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B98431515
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 07:27:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27E3A3F694
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 07:27:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] lib/oe/buildhistory_analysis: add support for SDKs
Date: Fri,  7 Nov 2025 15:27:28 +0000
Message-ID: <20251107152730.1774081-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226057

Add support for SDKs to the buildhistory difference analysis, and show
the difference in total size, package list, and file list.

[ YOCTO #16057 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/buildhistory_analysis.py | 31 +++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhist=
ory_analysis.py
index 4edad01580c..2c5f9c6b169 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -26,14 +26,14 @@ import bb.tinfoil
 list_fields =3D ['DEPENDS', 'RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSU=
GGESTS', 'RREPLACES', 'RCONFLICTS', 'FILES', 'FILELIST', 'USER_CLASSES', =
'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD=
_RECOMMENDATIONS', 'PACKAGE_EXCLUDE']
 list_order_fields =3D ['PACKAGES']
 defaultval_map =3D {'PKG': 'PKG', 'PKGE': 'PE', 'PKGV': 'PV', 'PKGR': 'P=
R'}
-numeric_fields =3D ['PKGSIZE', 'IMAGESIZE']
+numeric_fields =3D ['PKGSIZE', 'IMAGESIZE', 'SDKSIZE']
 # Fields to monitor
-monitor_fields =3D ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES',=
 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG']
+monitor_fields =3D ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES',=
 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'SDKSIZE',=
 'PKG']
 ver_monitor_fields =3D ['PKGE', 'PKGV', 'PKGR']
 # Percentage change to alert for numeric fields
 monitor_numeric_threshold =3D 10
 # Image files to monitor (note that image-info.txt is handled separately=
)
-img_monitor_files =3D ['installed-package-names.txt', 'files-in-image.tx=
t']
+img_monitor_files =3D ['installed-package-names.txt', 'files-in-image.tx=
t', 'files-in-sdk.txt']
=20
 colours =3D {
     'colour_default': '',
@@ -673,6 +673,31 @@ def process_changes(repopath, revision1, revision2=3D=
'HEAD', report_all=3DFalse, rep
                 chg =3D ChangeRecord(path, filename, d.a_blob.data_strea=
m.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8'), Tr=
ue)
                 changes.append(chg)
=20
+        elif path.startswith('sdk/'):
+            filename =3D os.path.basename(d.a_blob.path)
+            if filename in img_monitor_files:
+                if filename =3D=3D 'files-in-sdk.txt':
+                    alines =3D d.a_blob.data_stream.read().decode('utf-8=
').splitlines()
+                    blines =3D d.b_blob.data_stream.read().decode('utf-8=
').splitlines()
+                    filechanges =3D compare_file_lists(alines,blines)
+                    if filechanges:
+                        chg =3D ChangeRecord(path, filename, None, None,=
 True)
+                        chg.filechanges =3D filechanges
+                        changes.append(chg)
+                elif filename =3D=3D 'installed-package-names.txt':
+                    alines =3D d.a_blob.data_stream.read().decode('utf-8=
').splitlines()
+                    blines =3D d.b_blob.data_stream.read().decode('utf-8=
').splitlines()
+                    filechanges =3D compare_lists(alines,blines)
+                    if filechanges:
+                        chg =3D ChangeRecord(path, filename, None, None,=
 True)
+                        chg.filechanges =3D filechanges
+                        changes.append(chg)
+                else:
+                    chg =3D ChangeRecord(path, filename, d.a_blob.data_s=
tream.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8')=
, True)
+                    changes.append(chg)
+            elif filename =3D=3D 'sdk-info.txt':
+                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_bl=
ob, report_all, report_ver))
+
     # Look for added preinst/postinst/prerm/postrm
     # (without reporting newly added recipes)
     addedpkgs =3D []
--=20
2.43.0


