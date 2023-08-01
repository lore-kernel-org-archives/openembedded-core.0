Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159A9C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 04:19:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5679.1690863540262930869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 21:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jyusEDXS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=757755136f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3713kQI7010173
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 04:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=Tw+pKHIqgkiYlo09to
	aK4xWbq3mfmgEL0zcOfFYwSlA=; b=jyusEDXS8WefXRWCMtNmG47IF/T1X6f1AL
	+TQD/X6vmn4d3mhGmpZ9S/QhFXlApKP2RiwAQVnlRjty9555uOw9xxR+uXmcOStB
	4BD7TGPMkmNCSfoGTPh79cU77uwFKcj1tlfGOAW6D7K0IypGQraqUydtxDwj1I0Z
	N7eSVoZqLHr1MWhUC23pOQS4CyoiiNQvJiafTmJKjha7TqlYmkyieO37ywC67evr
	nWj/9/bebHSQaif6aI21dNrW5hrg0vY20mTMVpOp4KZv6uWmqb59Bpe/FIYBYOJg
	fy8FHtwopblPd+SgLH/UC61m6Pb10iD5emywbv2NAYTXD1ilpKhA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr62auh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 04:18:59 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 21:18:56 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] qemu: fix CVE-2023-3255
Date: Tue, 1 Aug 2023 04:18:44 +0000
Message-ID: <20230801041844.1487042-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: VA7Vrefx36dweGF4DchC4Z1_MVPDFAYs
X-Proofpoint-ORIG-GUID: VA7Vrefx36dweGF4DchC4Z1_MVPDFAYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_01,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308010039
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3713kQI7010173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 04:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185189

VNC: infinite loop in inflate_buffer() leads to denial of service

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3255

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/d921fea338c1059a27ce7b75309=
d7a2e485f710b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3255.patch             | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index d5d210194b..83959f3c68 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -95,6 +95,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_=
phy.patch \
            file://CVE-2023-0330.patch \
            file://CVE-2023-3301.patch \
+           file://CVE-2023-3255.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2023-3255.patch
new file mode 100644
index 0000000000..f030df111f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
@@ -0,0 +1,64 @@
+From d921fea338c1059a27ce7b75309d7a2e485f710b Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Tue, 4 Jul 2023 10:41:22 +0200
+Subject: [PATCH] ui/vnc-clipboard: fix infinite loop in inflate_buffer
+ (CVE-2023-3255)
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
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/d921fea33=
8c1059a27ce7b75309d7a2e485f710b]
+
+CVE: CVE-2023-3255
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ ui/vnc-clipboard.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
+index 8aeadfaa21..c759be3438 100644
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
2.40.0


