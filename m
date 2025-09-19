Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C901ACAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 08:24:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11363.1758270245353383668
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 01:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U8PPPvVb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357ce531b=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J6YBl11246934
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fZJqIRx6sxxXd2p2hAJE
	EaChySsB4Sw2cHhYZiVqD98=; b=U8PPPvVbRb4cAkwxdap3TJQTjEdZnmLBGelv
	l73+txzxJJjXnSkxF/NAM2uM3W/VdYuRYbH70xQadO8JuHlWLQIV6AgTpu+Gwgm4
	/c/qT9DLW9c0ArNp7BdH0i85CFnCe38PupZyCoHQmlGLqjpaX6BlyzIx/0PHOcYi
	in0uVZgYqrHuhE8Ipb8cPaWUTLVpOTucgr70b+O240CW7NjwverVzBgO10ZRJ/wt
	yJJlnvzxLT3Jv6EeU8IxjYwmM6wzqJWaMRXeUCWDkXc6eqZMq5JyGOgmd3B3xMRD
	doo88KVvqoTOVFpSODHR3bDT7zwlulsbN4LxE45uw+LTxCqInw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vmrg9uc-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:24:04 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 19 Sep 2025 01:24:01 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] grub2: fix CVE-2024-56738
Date: Fri, 19 Sep 2025 13:53:26 +0530
Message-ID: <20250919082326.350288-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=ZP7XmW7b c=1 sm=1 tr=0 ts=68cd1324 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=rfopBRLC-93ZHpjoEacA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA3NSBTYWx0ZWRfX3RSD0EmMYh/P
 96cjPjdBg7tBdIbeu6xl9iKe2429CO3tF0rWnS96dBkCMwwqzn+bDU77K72u9R3bI7p7PI9l/8D
 M6YEP7sDRCnNYrr1wwUUH4Ncgdzc8B5tdwLk9594fC2zjZ4/56/r/mfqao6kdTryf7bLwIjz55y
 SZLxm3oCyI/VDn2OpA5VTnqLqpC7xFDT0Yf4pG9KSHyLp0DRLzLDrb8nig7H2C8bGyFabmAKI6e
 QzjdBSH8lu7d/MqQVTnZvjsIo/hHlRIQOgycb5SmkRyN8BBSfoBo6j3Wx2TWoJDDi5VJmWckmNT
 x99Zd+Y1BMPMiq5X6c4FjvoNu4fvpB1u2NSayYO/w5y6F+2WKwCPlvA6mqcfOo=
X-Proofpoint-GUID: 08AOsnrNSbRPk1JzXXzgSNwC6Z-jCrzy
X-Proofpoint-ORIG-GUID: 08AOsnrNSbRPk1JzXXzgSNwC6Z-jCrzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223729

From: Yogita Urade <yogita.urade@windriver.com>

Backport an algorithmic change to grub_crypto_memcmp() so that it
completes in constant time and thus isn't susceptible to side-channel
attacks.

reference:
https://git.openembedded.org/openembedded-core/commit/?id=30a1cc225a2bd5d044bf608d863a67df3f9c03be

Upstream patch:
https://cgit.git.savannah.gnu.org/cgit/grub.git/commit/?id=0739d24cd1648531d0708d1079ff6bbfa6140268

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../grub/files/CVE-2024-56738.patch           | 75 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
new file mode 100644
index 0000000000..1212b2d3e5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
@@ -0,0 +1,75 @@
+From 4cef2fc7308b2132317ad166939994f098b41561 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 9 Sep 2025 14:23:14 +0100
+Subject: [PATCH] CVE-2024-56738
+
+Backport an algorithmic change to grub_crypto_memcmp() so that it completes in
+constant time and thus isn't susceptible to side-channel attacks.
+
+This is a partial backport of grub 0739d24cd
+("libgcrypt: Adjust import script, definitions and API users for libgcrypt 1.11")
+
+CVE: CVE-2024-56738
+Upstream-Status: Backport [0739d24cd]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ grub-core/lib/crypto.c | 23 ++++++++++++++++-------
+ include/grub/crypto.h  |  2 +-
+ 2 files changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
+index ca334d5..1bfa922 100644
+--- a/grub-core/lib/crypto.c
++++ b/grub-core/lib/crypto.c
+@@ -433,19 +433,28 @@ grub_crypto_gcry_error (gcry_err_code_t in)
+   return GRUB_ACCESS_DENIED;
+ }
+
++/*
++ * Compare byte arrays of length LEN, return 1 if it's not same,
++ * 0, otherwise.
++ */
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n)
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len)
+ {
+-  register grub_size_t counter = 0;
+-  const grub_uint8_t *pa, *pb;
++  const grub_uint8_t *a = b1;
++  const grub_uint8_t *b = b2;
++  int ab, ba;
++  grub_size_t i;
+
+-  for (pa = a, pb = b; n; pa++, pb++, n--)
++  /* Constant-time compare. */
++  for (i = 0, ab = 0, ba = 0; i < len; i++)
+     {
+-      if (*pa != *pb)
+-	counter++;
++      /* If a[i] != b[i], either ab or ba will be negative. */
++      ab |= a[i] - b[i];
++      ba |= b[i] - a[i];
+     }
+
+-  return !!counter;
++  /* 'ab | ba' is negative when buffers are not equal, extract sign bit.  */
++  return ((unsigned int)(ab | ba) >> (sizeof(unsigned int) * 8 - 1)) & 1;
+ }
+
+ #ifndef GRUB_UTIL
+diff --git a/include/grub/crypto.h b/include/grub/crypto.h
+index 21cd1f7..432912b 100644
+--- a/include/grub/crypto.h
++++ b/include/grub/crypto.h
+@@ -393,7 +393,7 @@ grub_crypto_pbkdf2 (const struct gcry_md_spec *md,
+		    grub_uint8_t *DK, grub_size_t dkLen);
+
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
+
+ int
+ grub_password_get (char buf[], unsigned buf_size);
+--
+2.40.0
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index cb61080aeb..1b019752b7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -59,6 +59,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0678_CVE-2025-1125.patch \
            file://CVE-2025-0690.patch \
            file://CVE-2025-1118.patch \
+           file://CVE-2024-56738.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.40.0


