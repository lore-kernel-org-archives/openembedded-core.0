Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E55ACD1297
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 02:02:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.155554.1712714518679422414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 19:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fZ2TQv0m;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712714518; x=1744250518;
  h=from:to:cc:subject:date:message-id;
  bh=AAfuCbgLglMiv+BH3nT9OOA8KL+4WrQuRK/EK+87FSg=;
  b=fZ2TQv0mM86OUiAGkukyGo605W8fF39ugoQaldQK2P2b0GbLka1laxW1
   aW/lVhd9TT3O8SXmBjefsMyX/Mqw0jr5DAFhdgWtj4l+nk0aX4VPSBe41
   s/auyJRrw7vovq+hpCYlyH5rFKb2v4N+srQb6lx+zOe7TP8kM5eKzlQ1g
   bAYAqyLQh2r4vJu9fqXDvrCl9p7xFXGHJRQseLsZx2lX+U8n1V3Emyfyl
   iFEqumZ4t1fnNvLIFdy3YPlLMVWxQqPvQYgIOaoSh+LMLTy77eCZDt6qy
   +HqjJGJI1jKRwZJA88OqaGE/Sjkanj6foqOLGjvHbxMZ8T9fxLjy/Y9Yj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="134474386"
X-IronPort-AV: E=Sophos;i="6.07,190,1708354800"; 
   d="scan'208";a="134474386"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 11:01:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 675AFDD93F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:01:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BBC7D52FF
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B456E200932D1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:01:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 600251A000D;
	Wed, 10 Apr 2024 10:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] dropbear: upgrade 2022.83 -> 2024.84
Date: Wed, 10 Apr 2024 10:01:39 +0800
Message-Id: <1712714500-23312-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28308.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28308.004
X-TMASE-Result: 10--10.132000-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yTo39wOA02LhSV3lGyX22ZdkDFfw8NSG/Nnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQFH0
	IKehhaoYgRR2pqoQBmXCydXjZHFqSO4kcA8kjsz8dZEkR8Y/meYQNFYyKS8+vDOItw0nH9LE6tN
	XWm3vJYospy5fJnP2kL/8yUNGojyaGnc61hHySTFRF81tbZq+QGfcmnqTCNVYR34ro7k23naYnm
	MLJRh+J/I+yd0mcY0X5RO5JptTFogkClU3H8XT/dqNHliz4AWcWUg/hm489yDclhAqYjfRnT5Hb
	kNX9+joQ9y3d/U5o2MV7aFLwD4J7Afq3I7FZWGPvVbHa5Rs8tyBr3Ab7SNDagW6bY8SOq3WjxYy
	RBa/qJV/Hpl/zcOjl5MIx11wv+CM7AFczfjr/7IfWdJhpsYl9FXGMUkOsLQWLr4/ftCn2OWldkK
	xCycDOrxCfPXwkF30=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 02:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198076

From: Wang Mingyu <wangmy@fujitsu.com>

0001-urandom-xauth-changes-to-options.h.patch
dropbear-disable-weak-ciphers.patch
0005-dropbear-enable-pam.patch
0006-dropbear-configuration-file.patch
refreshed for 2024.84

CVE-2023-36328.patch
removed since it's included in 2024.84

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-urandom-xauth-changes-to-options.h.patch |  14 +-
 .../dropbear/0005-dropbear-enable-pam.patch   |   8 +-
 .../0006-dropbear-configuration-file.patch    |   8 +-
 .../dropbear/dropbear/CVE-2023-36328.patch    | 144 ------------------
 .../dropbear-disable-weak-ciphers.patch       |   8 +-
 ...ropbear_2022.83.bb => dropbear_2024.84.bb} |   3 +-
 6 files changed, 20 insertions(+), 165 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
 rename meta/recipes-core/dropbear/{dropbear_2022.83.bb => dropbear_2024.84.bb} (97%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 99adcfd770..c74f09e484 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -2,14 +2,14 @@ Subject: [PATCH 1/6] urandom-xauth-changes-to-options.h
 
 Upstream-Status: Inappropriate [configuration]
 ---
- default_options.h | 2 +-
+ src/default_options.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/default_options.h b/default_options.h
-index 349338c..5ffac25 100644
---- a/default_options.h
-+++ b/default_options.h
-@@ -289,7 +289,7 @@ group1 in Dropbear server too */
+diff --git a/src/default_options.h b/src/default_options.h
+index 6e970bb..ccc8b47 100644
+--- a/src/default_options.h
++++ b/src/default_options.h
+@@ -311,7 +311,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
@@ -19,5 +19,5 @@ index 349338c..5ffac25 100644
  
  /* If you want to enable running an sftp server (such as the one included with
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 32c3ea5f08..fe667ddc25 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -11,13 +11,13 @@ Upstream-Status: Pending
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- default_options.h | 4 ++--
+ src/default_options.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/default_options.h b/default_options.h
+diff --git a/src/default_options.h b/src/default_options.h
 index 0e3d027..349338c 100644
---- a/default_options.h
-+++ b/default_options.h
+--- a/src/default_options.h
++++ b/src/default_options.h
 @@ -210,7 +210,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index deed78ffb9..f54f634a4e 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -12,13 +12,13 @@ Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 ---
- svr-authpam.c | 2 +-
+ src/svr-authpam.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/svr-authpam.c b/svr-authpam.c
+diff --git a/srec/svr-authpam.c b/src/svr-authpam.c
 index d201bc9..165ec5c 100644
---- a/svr-authpam.c
-+++ b/svr-authpam.c
+--- a/src/svr-authpam.c
++++ b/src/svr-authpam.c
 @@ -223,7 +223,7 @@ void svr_auth_pam(int valid_user) {
  	}
  
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch b/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
deleted file mode 100644
index ec50d69816..0000000000
--- a/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From beba892bc0d4e4ded4d667ab1d2a94f4d75109a9 Mon Sep 17 00:00:00 2001
-From: czurnieden <czurnieden@gmx.de>
-Date: Fri, 8 Sep 2023 10:07:32 +0000
-Subject: [PATCH] Fix possible integer overflow
-
-CVE: CVE-2023-36328
-
-Upstream-Status: Backport [https://github.com/libtom/libtommath/commit/beba892bc0d4e4ded4d667ab1d2a94f4d75109a9]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- libtommath/bn_mp_2expt.c                | 4 ++++
- libtommath/bn_mp_grow.c                 | 4 ++++
- libtommath/bn_mp_init_size.c            | 5 +++++
- libtommath/bn_mp_mul_2d.c               | 4 ++++
- libtommath/bn_s_mp_mul_digs.c           | 4 ++++
- libtommath/bn_s_mp_mul_digs_fast.c      | 4 ++++
- libtommath/bn_s_mp_mul_high_digs.c      | 4 ++++
- libtommath/bn_s_mp_mul_high_digs_fast.c | 4 ++++
- 8 files changed, 33 insertions(+)
-
-diff --git a/libtommath/bn_mp_2expt.c b/libtommath/bn_mp_2expt.c
-index 0ae3df1..ca6fbc3 100644
---- a/libtommath/bn_mp_2expt.c
-+++ b/libtommath/bn_mp_2expt.c
-@@ -12,6 +12,10 @@ mp_err mp_2expt(mp_int *a, int b)
- {
-    mp_err    err;
-
-+   if (b < 0) {
-+      return MP_VAL;
-+   }
-+
-    /* zero a as per default */
-    mp_zero(a);
-
-diff --git a/libtommath/bn_mp_grow.c b/libtommath/bn_mp_grow.c
-index 9e904c5..2b16826 100644
---- a/libtommath/bn_mp_grow.c
-+++ b/libtommath/bn_mp_grow.c
-@@ -9,6 +9,10 @@ mp_err mp_grow(mp_int *a, int size)
-    int     i;
-    mp_digit *tmp;
-
-+   if (size < 0) {
-+      return MP_VAL;
-+   }
-+
-    /* if the alloc size is smaller alloc more ram */
-    if (a->alloc < size) {
-       /* reallocate the array a->dp
-diff --git a/libtommath/bn_mp_init_size.c b/libtommath/bn_mp_init_size.c
-index d622687..5fefa96 100644
---- a/libtommath/bn_mp_init_size.c
-+++ b/libtommath/bn_mp_init_size.c
-@@ -6,6 +6,11 @@
- /* init an mp_init for a given size */
- mp_err mp_init_size(mp_int *a, int size)
- {
-+
-+   if (size < 0) {
-+      return MP_VAL;
-+   }
-+
-    size = MP_MAX(MP_MIN_PREC, size);
-
-    /* alloc mem */
-diff --git a/libtommath/bn_mp_mul_2d.c b/libtommath/bn_mp_mul_2d.c
-index 87354de..2744163 100644
---- a/libtommath/bn_mp_mul_2d.c
-+++ b/libtommath/bn_mp_mul_2d.c
-@@ -9,6 +9,10 @@ mp_err mp_mul_2d(const mp_int *a, int b, mp_int *c)
-    mp_digit d;
-    mp_err   err;
-
-+   if (b < 0) {
-+      return MP_VAL;
-+   }
-+
-    /* copy */
-    if (a != c) {
-       if ((err = mp_copy(a, c)) != MP_OKAY) {
-diff --git a/libtommath/bn_s_mp_mul_digs.c b/libtommath/bn_s_mp_mul_digs.c
-index 64509d4..2d2f5b0 100644
---- a/libtommath/bn_s_mp_mul_digs.c
-+++ b/libtommath/bn_s_mp_mul_digs.c
-@@ -16,6 +16,10 @@ mp_err s_mp_mul_digs(const mp_int *a, const mp_int *b, mp_int *c, int digs)
-    mp_word r;
-    mp_digit tmpx, *tmpt, *tmpy;
-
-+   if (digs < 0) {
-+      return MP_VAL;
-+   }
-+
-    /* can we use the fast multiplier? */
-    if ((digs < MP_WARRAY) &&
-        (MP_MIN(a->used, b->used) < MP_MAXFAST)) {
-diff --git a/libtommath/bn_s_mp_mul_digs_fast.c b/libtommath/bn_s_mp_mul_digs_fast.c
-index b2a287b..d6dd3cc 100644
---- a/libtommath/bn_s_mp_mul_digs_fast.c
-+++ b/libtommath/bn_s_mp_mul_digs_fast.c
-@@ -26,6 +26,10 @@ mp_err s_mp_mul_digs_fast(const mp_int *a, const mp_int *b, mp_int *c, int digs)
-    mp_digit W[MP_WARRAY];
-    mp_word  _W;
-
-+   if (digs < 0) {
-+      return MP_VAL;
-+   }
-+
-    /* grow the destination as required */
-    if (c->alloc < digs) {
-       if ((err = mp_grow(c, digs)) != MP_OKAY) {
-diff --git a/libtommath/bn_s_mp_mul_high_digs.c b/libtommath/bn_s_mp_mul_high_digs.c
-index 2bb2a50..c9dd355 100644
---- a/libtommath/bn_s_mp_mul_high_digs.c
-+++ b/libtommath/bn_s_mp_mul_high_digs.c
-@@ -15,6 +15,10 @@ mp_err s_mp_mul_high_digs(const mp_int *a, const mp_int *b, mp_int *c, int digs)
-    mp_word  r;
-    mp_digit tmpx, *tmpt, *tmpy;
-
-+   if (digs < 0) {
-+      return MP_VAL;
-+   }
-+
-    /* can we use the fast multiplier? */
-    if (MP_HAS(S_MP_MUL_HIGH_DIGS_FAST)
-        && ((a->used + b->used + 1) < MP_WARRAY)
-diff --git a/libtommath/bn_s_mp_mul_high_digs_fast.c b/libtommath/bn_s_mp_mul_high_digs_fast.c
-index a2c4fb6..afe3e4b 100644
---- a/libtommath/bn_s_mp_mul_high_digs_fast.c
-+++ b/libtommath/bn_s_mp_mul_high_digs_fast.c
-@@ -19,6 +19,10 @@ mp_err s_mp_mul_high_digs_fast(const mp_int *a, const mp_int *b, mp_int *c, int
-    mp_digit W[MP_WARRAY];
-    mp_word  _W;
-
-+   if (digs < 0) {
-+      return MP_VAL;
-+   }
-+
-    /* grow the destination as required */
-    pa = a->used + b->used;
-    if (c->alloc < pa) {
---
-2.35.5
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
index 5c60868ed8..f998caa255 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -10,13 +10,13 @@ and we want to support the stong algorithms.
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
 ---
- default_options.h | 2 +-
+ src/default_options.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/default_options.h b/default_options.h
+diff --git a/src/default_options.h b/src/default_options.h
 index d417588..bc5200f 100644
---- a/default_options.h
-+++ b/default_options.h
+--- a/src/default_options.h
++++ b/src/default_options.h
 @@ -180,7 +180,7 @@ IMPORTANT: Some options will require "make clean" after changes */
   * Small systems should generally include either curve25519 or ecdh for performance.
   * curve25519 is less widely supported but is faster
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2024.84.bb
similarity index 97%
rename from meta/recipes-core/dropbear/dropbear_2022.83.bb
rename to meta/recipes-core/dropbear/dropbear_2024.84.bb
index 528eff1a10..69c7b04c55 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.84.bb
@@ -21,10 +21,9 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
-           file://CVE-2023-36328.patch \
            "
 
-SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
+SRC_URI[sha256sum] = "16e22b66b333d6b7e504c43679d04ed6ca30f2838db40a21f935c850dfc01009"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.34.1


