Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B624EC04A94
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:00:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12057.1691650835991986201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 00:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Mpkqu/AK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758670bc78=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37A5f83t004421
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	PPS06212021; bh=4AYzGdyt2LNjzBYvQ3AHfjYBqYM6QY7PjkWHsKZ9yJE=; b=
	Mpkqu/AKFctezVKboAJC00i5zzxboeW2WnW6Yzpz/KSVgNs2aNaE/lUXhskkhmLw
	OHozXi/QIXaj2XJrumlirMS37Rk2HWlwqC5W8mf5Dup9DzsFZ6/8zKyAzVnPj5SH
	grn9mHUGdwyFq/FFwifAR7RiP1ahPbnfWnyg0PfhlCq4Pb922tmmNsmjv8Iv1gnJ
	Ytl3o6EQccVtfWH6pJvNi5LShfjr4DYeulVG2q6iLgz9C3twvQrqsjzUyCPDkVXe
	MK2Gyy9TqFwiFcAOpQw2HrVOXgHIWz87UPU4EYqmVvpaQOY0WpEheh0a/7QJz6JL
	eMERGOqH2JFJtmSWRFg56g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd64knw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 00:00:32 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 2/3] qemu: fix CVE-2023-3255
Date: Thu, 10 Aug 2023 07:00:11 +0000
Message-ID: <20230810070012.3740596-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230810070012.3740596-1-yogita.urade@windriver.com>
References: <20230810070012.3740596-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: gAZsJV-8QoLshjPqjyHK1wcT_sMsYDRw
X-Proofpoint-ORIG-GUID: gAZsJV-8QoLshjPqjyHK1wcT_sMsYDRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_05,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=878 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308100057
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37A5f83t004421
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185726

QEMU: VNC: infinite loop in inflate_buffer() leads to denial of service

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-3255

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3255.patch             | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index f5b408036a..0112c29a8c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://ppc.patch \
 	   file://CVE-2023-0330.patch \
 	   file://CVE-2023-3301.patch \
+	   file://CVE-2023-3255.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2023-3255.patch
new file mode 100644
index 0000000000..661af629b0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
@@ -0,0 +1,65 @@
+From d921fea338c1059a27ce7b75309d7a2e485f710b Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Wed, 2 Aug 2023 12:29:55 +0000
+Subject: [PATCH] ui/vnc-clipboard: fix infinite loop in inflate_buffer
+ (CVE-2023-3255) MIME-Version: 1.0 Content-Type: text/plain; charset=3DU=
TF-8
+ Content-Transfer-Encoding: 8bit MIME-Version: 1.0 Content-Type: text/pl=
ain;
+ charset=3DUTF-8 Content-Transfer-Encoding: 8bit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A wrong exit condition may lead to an infinite loop when inflating a
+valid zlib buffer containing some extra bytes in the `inflate_buffer`
+function. The bug only occurs post-authentication. Return the buffer
+immediately if the end of the compressed data has been reached
+(Z_STREAM_END).
+
+Fixes: CVE-2023-3255
+Fixes: 0bf41cab ("ui/vnc: clipboard support")
+Reported-by: Kevin Denis <kevin.denis@synacktiv.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Tested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-ID: <20230704084210.101822-1-mcascell@redhat.com>
+
+CVE: CVE-2023-3255
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/d921fea33=
8c1059a27ce7b75309d7a2e485f710b]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ ui/vnc-clipboard.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
+index 8aeadfaa2..c759be343 100644
+--- a/ui/vnc-clipboard.c
++++ b/ui/vnc-clipboard.c
+@@ -50,8 +50,11 @@ static uint8_t *inflate_buffer(uint8_t *in, uint32_t =
in_len, uint32_t *size)
+         ret =3D inflate(&stream, Z_FINISH);
+         switch (ret) {
+         case Z_OK:
+-        case Z_STREAM_END:
+             break;
++        case Z_STREAM_END:
++            *size =3D stream.total_out;
++            inflateEnd(&stream);
++            return out;
+         case Z_BUF_ERROR:
+             out_len <<=3D 1;
+             if (out_len > (1 << 20)) {
+@@ -66,11 +69,6 @@ static uint8_t *inflate_buffer(uint8_t *in, uint32_t =
in_len, uint32_t *size)
+         }
+     }
+
+-    *size =3D stream.total_out;
+-    inflateEnd(&stream);
+-
+-    return out;
+-
+ err_end:
+     inflateEnd(&stream);
+ err:
+--
+2.40.0
--=20
2.35.5


