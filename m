Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1FEEE14AE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:26:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3325.1694017578874841805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NreGQweF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7613066e8a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 386CUZbN031975
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Sep 2023 09:26:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=xGTQM
	xV3Irll1XaH8bTN0FFxQ28wTee6iw4OCBy40BE=; b=NreGQweFd36o3IrUy/U30
	CORRj7FRQQqQnS81cnEVbOdwXTkogoiLflePW4mG09uzTKmze5msedvoZBstFxfY
	5ltJHGJd8U8SWBLuOyBkgPekfMkexYZiB7i9A3mK4tN9Ehb8L91SBExImQysysDV
	V9IipZdVvOt2whU6FolvlH+f1hMU8IiXNP26+8YFgmMQ7AOKlPzylUJmBGBNj0C5
	8esmJzrCLE1v+Qo4hkKXerecEbNNTKHKV5nr9OmCb6BwhVGI2YW7kBST15JyXKWx
	m028Oi7MDemMME7HHyiugDcrCdTTFqhES4pc1MFpc1/Awu71Rq1zVxMMrdsyXAj5
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg3fbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:26:18 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 09:26:15 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] dropbear: fix CVE-2023-36328
Date: Wed, 6 Sep 2023 16:25:54 +0000
Message-ID: <20230906162554.648033-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: EnwAUrrXJLI4N8v11cdVRcabSSJJBDBZ
X-Proofpoint-GUID: EnwAUrrXJLI4N8v11cdVRcabSSJJBDBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187322

From: Yogita Urade <yogita.urade@windriver.com>

Integer Overflow vulnerability in mp_grow in libtom libtommath before
commit beba892bc0d4e4ded4d667ab1d2a94f4d75109a9, allows attackers to
execute arbitrary code and cause a denial of service (DoS).

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-36328
https://github.com/libtom/libtommath/pull/546

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2023-36328.patch    | 144 ++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index f3f085b616..e61930f7db 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -29,6 +29,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
 	   file://CVE-2021-36369.patch \
+	   file://CVE-2023-36328.patch \
 	   "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch b/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
new file mode 100644
index 0000000000..4d8c40f70b
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
@@ -0,0 +1,144 @@
+From beba892bc0d4e4ded4d667ab1d2a94f4d75109a9 Mon Sep 17 00:00:00 2001
+From: czurnieden <czurnieden@gmx.de>
+Date: Wed, 6 Sep 2023 10:48:58 +0000
+Subject: [PATCH] Fix possible integer overflow
+
+CVE: CVE-2023-36328
+
+Upstream-Status: Backport [https://github.com/libtom/libtommath/commit/beba892bc0d4e4ded4d667ab1d2a94f4d75109a9]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libtommath/bn_mp_2expt.c                | 4 ++++
+ libtommath/bn_mp_grow.c                 | 4 ++++
+ libtommath/bn_mp_init_size.c            | 5 +++++
+ libtommath/bn_mp_mul_2d.c               | 4 ++++
+ libtommath/bn_s_mp_mul_digs.c           | 4 ++++
+ libtommath/bn_s_mp_mul_digs_fast.c      | 4 ++++
+ libtommath/bn_s_mp_mul_high_digs.c      | 4 ++++
+ libtommath/bn_s_mp_mul_high_digs_fast.c | 4 ++++
+ 8 files changed, 33 insertions(+)
+
+diff --git a/libtommath/bn_mp_2expt.c b/libtommath/bn_mp_2expt.c
+index 0ae3df1..7d4d884 100644
+--- a/libtommath/bn_mp_2expt.c
++++ b/libtommath/bn_mp_2expt.c
+@@ -12,6 +12,10 @@ mp_err mp_2expt(mp_int *a, int b)
+ {
+    mp_err    err;
+
++   if (b < 0) {
++      return MP_VAL;
++   }
++
+    /* zero a as per default */
+    mp_zero(a);
+
+diff --git a/libtommath/bn_mp_grow.c b/libtommath/bn_mp_grow.c
+index 9e904c5..e7b186c 100644
+--- a/libtommath/bn_mp_grow.c
++++ b/libtommath/bn_mp_grow.c
+@@ -9,6 +9,10 @@ mp_err mp_grow(mp_int *a, int size)
+    int     i;
+    mp_digit *tmp;
+
++   if (size < 0) {
++      return MP_VAL;
++   }
++
+    /* if the alloc size is smaller alloc more ram */
+    if (a->alloc < size) {
+       /* reallocate the array a->dp
+diff --git a/libtommath/bn_mp_init_size.c b/libtommath/bn_mp_init_size.c
+index d622687..5fefa96 100644
+--- a/libtommath/bn_mp_init_size.c
++++ b/libtommath/bn_mp_init_size.c
+@@ -6,6 +6,11 @@
+ /* init an mp_init for a given size */
+ mp_err mp_init_size(mp_int *a, int size)
+ {
++
++   if (size < 0) {
++      return MP_VAL;
++   }
++
+    size = MP_MAX(MP_MIN_PREC, size);
+
+    /* alloc mem */
+diff --git a/libtommath/bn_mp_mul_2d.c b/libtommath/bn_mp_mul_2d.c
+index 87354de..2744163 100644
+--- a/libtommath/bn_mp_mul_2d.c
++++ b/libtommath/bn_mp_mul_2d.c
+@@ -9,6 +9,10 @@ mp_err mp_mul_2d(const mp_int *a, int b, mp_int *c)
+    mp_digit d;
+    mp_err   err;
+
++   if (b < 0) {
++      return MP_VAL;
++   }
++
+    /* copy */
+    if (a != c) {
+       if ((err = mp_copy(a, c)) != MP_OKAY) {
+diff --git a/libtommath/bn_s_mp_mul_digs.c b/libtommath/bn_s_mp_mul_digs.c
+index 64509d4..2d2f5b0 100644
+--- a/libtommath/bn_s_mp_mul_digs.c
++++ b/libtommath/bn_s_mp_mul_digs.c
+@@ -16,6 +16,10 @@ mp_err s_mp_mul_digs(const mp_int *a, const mp_int *b, mp_int *c, int digs)
+    mp_word r;
+    mp_digit tmpx, *tmpt, *tmpy;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* can we use the fast multiplier? */
+    if ((digs < MP_WARRAY) &&
+        (MP_MIN(a->used, b->used) < MP_MAXFAST)) {
+diff --git a/libtommath/bn_s_mp_mul_digs_fast.c b/libtommath/bn_s_mp_mul_digs_fast.c
+index b2a287b..d6dd3cc 100644
+--- a/libtommath/bn_s_mp_mul_digs_fast.c
++++ b/libtommath/bn_s_mp_mul_digs_fast.c
+@@ -26,6 +26,10 @@ mp_err s_mp_mul_digs_fast(const mp_int *a, const mp_int *b, mp_int *c, int digs)
+    mp_digit W[MP_WARRAY];
+    mp_word  _W;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* grow the destination as required */
+    if (c->alloc < digs) {
+       if ((err = mp_grow(c, digs)) != MP_OKAY) {
+diff --git a/libtommath/bn_s_mp_mul_high_digs.c b/libtommath/bn_s_mp_mul_high_digs.c
+index 2bb2a50..c9dd355 100644
+--- a/libtommath/bn_s_mp_mul_high_digs.c
++++ b/libtommath/bn_s_mp_mul_high_digs.c
+@@ -15,6 +15,10 @@ mp_err s_mp_mul_high_digs(const mp_int *a, const mp_int *b, mp_int *c, int digs)
+    mp_word  r;
+    mp_digit tmpx, *tmpt, *tmpy;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* can we use the fast multiplier? */
+    if (MP_HAS(S_MP_MUL_HIGH_DIGS_FAST)
+        && ((a->used + b->used + 1) < MP_WARRAY)
+diff --git a/libtommath/bn_s_mp_mul_high_digs_fast.c b/libtommath/bn_s_mp_mul_high_digs_fast.c
+index a2c4fb6..4ce7f59 100644
+--- a/libtommath/bn_s_mp_mul_high_digs_fast.c
++++ b/libtommath/bn_s_mp_mul_high_digs_fast.c
+@@ -19,6 +19,10 @@ mp_err s_mp_mul_high_digs_fast(const mp_int *a, const mp_int *b, mp_int *c, int
+    mp_digit W[MP_WARRAY];
+    mp_word  _W;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* grow the destination as required */
+    pa = a->used + b->used;
+    if (c->alloc < pa) {
+--
+2.35.5
-- 
2.35.5


