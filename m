Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7798C71A50
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 00:23:56 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id b79so3218171pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Nov 2017 17:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9Qv4O8/Eaara4uyBIAesccHRX96u3nd0xppZXVm+eUg=;
	b=kf2kLMLwB3TaPPw975APEDbSCeCcogWPx2Lrm83YJhTWxL6KaMM0xtD5yetFxbdAB8
	4zvMIg+OabF4ibU6hyCGE9d6du0cdNDotmOAtHbMA2XgV97rrBMum3m31o0EkFcIobzd
	cOJ/s2WdQ6mlMzhDC+2uNSYHznN40gTIbh1q/pYduSij25qCkB6rYTaoBZ5yCxLGTSK5
	ypKbLAIESznggW0cnCnhVaQ7Iovxlz0fUQ4PMY9a87TV1j0rVRGdk+K4+Hz6GgZuhzAJ
	NuOd4HCnupFesACoPFvfOxMr3iNR1TFXf/HBABEfXjufa3a8yaJnNpumsS1O1u0qTFCc
	rayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9Qv4O8/Eaara4uyBIAesccHRX96u3nd0xppZXVm+eUg=;
	b=m4Q2+PkDPzdOLw/r83386n8nrCnXn298fjjxbTJU1fEhlfpafOaUm599VkX9tnt3qW
	Ft9Kc4IAKnFsSC6c+AZ4n04zpd9LC/uxSqeXasbQSPi67lHQTa1LsZLEw5+hnEF0ZtgJ
	pDDA7RxIcvAEJiQKfmWQG3aEoq52VS2Zd4HB4EdLL+WnfWXD5Zek4ZpvP612YkXkF1Xy
	8aG13ilyT9jJkeMbZdGVlEmOmlJdIWMXhEx96Sd9C5kqzummlk9ZUxdsCEQ6+Cq/TCI4
	YJc0CPMonyLVOuMMW+Hj0kC5bwoCpeVKVa2NR8FNzi0Ab77yM31cn13hf4Upwgud0wvu
	3a1w==
X-Gm-Message-State: AMCzsaUZa8e7yk9Esygu2tUbKf2gSvUQqNw4x10nwDSPZUUnX6yYoC/o
	2C04pytJ5aeBydSnjzj5DCqJ2Q==
X-Google-Smtp-Source: ABhQp+Ske6uyRA+kNr/9v++3PICU2EjRTW7YCdUvykY5BRbr3BLRPpChbWS9sXNM2iuIB/crCIJTqg==
X-Received: by 10.159.252.8 with SMTP id n8mr1300766pls.18.1509582237803;
	Wed, 01 Nov 2017 17:23:57 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r24sm3597452pfj.106.2017.11.01.17.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 17:23:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 17:23:36 -0700
Message-Id: <1509582216-10840-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH] gmp_4.2.1: prevent calls to mpn_add_nc() if HAVE_NATIVE_mpn_sub_nc is false
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 00:23:57 -0000

When building for aarch64 (ie relying only on generic C code rather
than asm) libgmp.so contains undefined references to __gmpn_add_nc
and __gmpn_sub_nc which causes attempts to link with -lgmp to fail:

 | .../usr/lib/libgmp.so: undefined reference to `__gmpn_sub_nc'
 | .../usr/lib/libgmp.so: undefined reference to `__gmpn_add_nc'

Solution based on a historical patch posted to the gmp mailing list:

  https://gmplib.org/list-archives/gmp-discuss/2006-May/002344.html

Cherry-pick from meta-gplv2:

  http://git.yoctoproject.org/cgit/cgit.cgi/meta-gplv2/commit/?id=d8668018d5d795be2297f878fd871a27edf532bf

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch | 78 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch b/meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch
new file mode 100644
index 0000000..7b879c3
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch
@@ -0,0 +1,78 @@
+From d4f3542fabe0797cf2d60afd957585862bd9a29b Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 25 Aug 2017 16:16:06 -0700
+Subject: [PATCH] prevent calls to mpn_add_nc() if HAVE_NATIVE_mpn_sub_nc is false
+
+When building for aarch64 (ie relying only on generic C code rather
+than asm) libgmp.so contains undefined references to __gmpn_add_nc
+and __gmpn_sub_nc which causes attempts to link with -lgmp to fail:
+
+ | .../usr/lib/libgmp.so: undefined reference to `__gmpn_sub_nc'
+ | .../usr/lib/libgmp.so: undefined reference to `__gmpn_add_nc'
+
+Solution based on a historical patch posted to the gmp mailing list:
+
+  https://gmplib.org/list-archives/gmp-discuss/2006-May/002344.html
+
+Upstream-Status: Inappropriate [Fixed in current versions]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ mpn/generic/addsub_n.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/mpn/generic/addsub_n.c b/mpn/generic/addsub_n.c
+index 27b2c08..0ff7ca0 100644
+--- a/mpn/generic/addsub_n.c
++++ b/mpn/generic/addsub_n.c
+@@ -58,13 +58,13 @@ mpn_addsub_n (mp_ptr r1p, mp_ptr r2p, mp_srcptr s1p, mp_srcptr s2p, mp_size_t n)
+       for (off = 0; off < n; off += PART_SIZE)
+ 	{
+ 	  this_n = MIN (n - off, PART_SIZE);
+-#if HAVE_NATIVE_mpn_add_nc || !HAVE_NATIVE_mpn_add_n
++#if HAVE_NATIVE_mpn_add_nc
+ 	  acyo = mpn_add_nc (r1p + off, s1p + off, s2p + off, this_n, acyo);
+ #else
+ 	  acyn = mpn_add_n (r1p + off, s1p + off, s2p + off, this_n);
+ 	  acyo = acyn + mpn_add_1 (r1p + off, r1p + off, this_n, acyo);
+ #endif
+-#if HAVE_NATIVE_mpn_sub_nc || !HAVE_NATIVE_mpn_sub_n
++#if HAVE_NATIVE_mpn_sub_nc
+ 	  scyo = mpn_sub_nc (r2p + off, s1p + off, s2p + off, this_n, scyo);
+ #else
+ 	  scyn = mpn_sub_n (r2p + off, s1p + off, s2p + off, this_n);
+@@ -81,13 +81,13 @@ mpn_addsub_n (mp_ptr r1p, mp_ptr r2p, mp_srcptr s1p, mp_srcptr s2p, mp_size_t n)
+       for (off = 0; off < n; off += PART_SIZE)
+ 	{
+ 	  this_n = MIN (n - off, PART_SIZE);
+-#if HAVE_NATIVE_mpn_sub_nc || !HAVE_NATIVE_mpn_sub_n
++#if HAVE_NATIVE_mpn_sub_nc
+ 	  scyo = mpn_sub_nc (r2p + off, s1p + off, s2p + off, this_n, scyo);
+ #else
+ 	  scyn = mpn_sub_n (r2p + off, s1p + off, s2p + off, this_n);
+ 	  scyo = scyn + mpn_sub_1 (r2p + off, r2p + off, this_n, scyo);
+ #endif
+-#if HAVE_NATIVE_mpn_add_nc || !HAVE_NATIVE_mpn_add_n
++#if HAVE_NATIVE_mpn_add_nc
+ 	  acyo = mpn_add_nc (r1p + off, s1p + off, s2p + off, this_n, acyo);
+ #else
+ 	  acyn = mpn_add_n (r1p + off, s1p + off, s2p + off, this_n);
+@@ -105,13 +105,13 @@ mpn_addsub_n (mp_ptr r1p, mp_ptr r2p, mp_srcptr s1p, mp_srcptr s2p, mp_size_t n)
+       for (off = 0; off < n; off += PART_SIZE)
+ 	{
+ 	  this_n = MIN (n - off, PART_SIZE);
+-#if HAVE_NATIVE_mpn_add_nc || !HAVE_NATIVE_mpn_add_n
++#if HAVE_NATIVE_mpn_add_nc
+ 	  acyo = mpn_add_nc (tp, s1p + off, s2p + off, this_n, acyo);
+ #else
+ 	  acyn = mpn_add_n (tp, s1p + off, s2p + off, this_n);
+ 	  acyo = acyn + mpn_add_1 (tp, tp, this_n, acyo);
+ #endif
+-#if HAVE_NATIVE_mpn_sub_nc || !HAVE_NATIVE_mpn_sub_n
++#if HAVE_NATIVE_mpn_sub_nc
+ 	  scyo = mpn_sub_nc (r2p + off, s1p + off, s2p + off, this_n, scyo);
+ #else
+ 	  scyn = mpn_sub_n (r2p + off, s1p + off, s2p + off, this_n);
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 5e8ee29..029e728 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/archive/${BP}.tar.bz2 \
            file://Use-__gnu_inline__-attribute.patch \
            file://gmp_fix_for_automake-1.12.patch \
            file://avoid-h-asm-constraint-for-MIPS.patch \
+           file://prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch \
 "
 
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
-- 
1.9.1


