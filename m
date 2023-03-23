Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E34C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 22:50:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.87811.1679611804538538181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 15:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Cn+zjw5y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2446e44d88=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLGXgD005175
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 15:50:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=3mg4gQ281TUxL9YvsvyJti5EZN/lZWDSR3RIeuCXoHs=;
 b=Cn+zjw5ypUpLkglhIg/wg9uVa5Da+IMsbJydSYpwIJwukIGJEZ1R+/FUusc1vWtf7glt
 7Bh1eh/9G2r1Glqv0jQHjEA+kNuSgvrOiV2RRg0v0rDq9AN6K8B4ZY10DXVKYtGmLLlV
 4P6MULxOW/VrUiaPSU1fOAFdtqb+IoBflA1fa8gVcNWabAFCaKpDNww5xQdO9VCyxnfL
 1dGQ1fPyEYmrwEMgvbfji9L4VrMaO3qsfZNsX1UTMPFoa+Uloh/zQ4HIr3kUEThz22a3
 PTLZ8mb8vqCBbsk437rYddYu7QshlMDe8UlOYAwj1wNzVq99zY6bne3B/lDWX3a/YDJu yA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pgxhur2d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 15:50:04 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 23 Mar 2023 15:50:03 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Thu, 23 Mar 2023 15:50:03 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] phpmyadmin: fix CVE-2023-25727
Date: Thu, 23 Mar 2023 15:50:03 -0700
Message-ID: <20230323225003.733704-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: uu-gH9xWlj92EP9CrVKJL3Llpyn0OtKS
X-Proofpoint-GUID: uu-gH9xWlj92EP9CrVKJL3Llpyn0OtKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_13,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=621 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303230165
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32NLGXgD005175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 22:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179010

From: Dragos-Marian Panait <dragos.panait@windriver.com>

In phpMyAdmin before 4.9.11 and 5.x before 5.2.1,
an authenticated user can trigger XSS by
uploading a crafted .sql file through the drag-and-drop interface.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-25727

Upstream patch:
https://github.com/phpmyadmin/phpmyadmin/commit/efa2406695551667f72649775=
0d3db91fb6f662e

Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../phpmyadmin/CVE-2023-25727.patch           | 37 +++++++++++++++++++
 .../phpmyadmin/phpmyadmin_5.1.3.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-=
2023-25727.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2023-25=
727.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2023-257=
27.patch
new file mode 100644
index 000000000..707334a51
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2023-25727.pat=
ch
@@ -0,0 +1,37 @@
+From 0842f11158699a979437125756b26eeabedab9ab Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Maur=3DC3=3DADcio=3D20Meneghini=3D20Fauth?=3D <maurici=
o@fauth.dev>
+Date: Fri, 5 Aug 2022 20:18:16 -0300
+Subject: [PATCH] Fix not escaped title when using drag and drop upload
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Maur=C3=ADcio Meneghini Fauth <mauricio@fauth.dev>
+
+Upstream-Status: Backport
+CVE: CVE-2023-25727
+
+Reference to upstream patch:
+https://github.com/phpmyadmin/phpmyadmin/commit/efa2406695551667f7264977=
50d3db91fb6f662e
+
+Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
+---
+ js/src/drag_drop_import.js | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/drag_drop_import.js b/js/src/drag_drop_import.js
+index 55250c2..9b8710e 100644
+--- a/js/src/drag_drop_import.js
++++ b/js/src/drag_drop_import.js
+@@ -130,7 +130,7 @@ var DragDropImport =3D {
+                                 var filename =3D $this.parent('span').a=
ttr('data-filename');
+                                 $('body').append('<div class=3D"pma_dro=
p_result"><h2>' +
+                                 Messages.dropImportImportResultHeader +=
 ' - ' +
+-                                filename + '<span class=3D"close">x</sp=
an></h2>' + value.message + '</div>');
++                                Functions.escapeHtml(filename) + '<span=
 class=3D"close">x</span></h2>' + value.message + '</div>');
+                                 $('.pma_drop_result').draggable();  // =
to make this dialog draggable
+                             }
+                         });
+--=20
+2.39.1
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb b/=
meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
index 7ccc05ec3..3f1919439 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
=20
 SRC_URI =3D "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${=
PV}-all-languages.tar.xz \
            file://apache.conf \
+           file://CVE-2023-25727.patch \
 "
=20
 SRC_URI[sha256sum] =3D "c562feddc0f8ff5e69629113f273a0d024a65fb928c48e89=
ce614744d478296f"
--=20
2.25.1


