Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 911A07458B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 15:58:32 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a22-v6so6014804pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZsIV/u2Ybe5iP1S4AEdct9bKS5jFpnIbrhYLSpdjjM0=;
	b=IaW+TkBGZ3kcnsw2P/OadKPx7ZlI8kwNGOHVLG4azVCy9LGf8R6kjs+OvWXNxGFrcj
	TYAz4sgSODLOl6cSk0HGm8nY1uMhQUkf42p6ejeGyJeTkHi3Zz/NBz9J5alVqGCaERm/
	vsHaqQuprDS2u2XNdxjJFEOEMs5Ah6O2xdeGO1Kun+SKxUbO5srnAzSDYHoYdgdAq/Yz
	05RfZTdM8Y6udCFQjsw/7oTezZ1gjOeoe7L9ckYCRAgXQz3xh71izbg0dhZgqyQ6fCrd
	5HkmBJRuvXDDsSaIywlFxO8sJddlYhHXXU/IP4Awi9IgbhSwZZ3LiTmh6LG/gkuA6IoZ
	nEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZsIV/u2Ybe5iP1S4AEdct9bKS5jFpnIbrhYLSpdjjM0=;
	b=l2aDTpXN32PDQW+RVxOl+OH5fdJ2YMtQAKCb7I/Rs34f3cmFLUdSfAHmyuTJuUI0S2
	dyjZecNdMaRtVa5pWD9Z8b8w89wTD4abHC9j+DKCD/DMjbYo9P3paF1w+94Hg8tptn04
	UCjRsMWX8+u2m5TCb2oKRhkNXoju26e/sr7v14yyYHaWksI2BKpp2aNO0eCplDooShGM
	ePwQ0FalcTkDoPOQJ2CTvzerHsxZqDbnSmNXO7nC1TRl7z46Ho6yKyLoyVvYpuX8X6aF
	h3Q7fLeYIRewbLaZ36Wg+uDW0qGAu7/sWNC9mTmmGQAYf1XfI2XMkwsDE0gqyah50rJM
	u+WA==
X-Gm-Message-State: ALKqPweuM87DV1KiBTnJ9lcvEJawTCZMpVc9Y6aLoBGWwtMPRgGaI8yN
	rRvFMnj4IDLrYG+6O8K6BQirjw==
X-Google-Smtp-Source: AB8JxZr6kpV0vZUUFtoSOcm/SHHMN9soSRp8EZUhzQVTGcqJbkt8jIdU8XxhUQ3xMJHPU/NTmN+Kng==
X-Received: by 2002:a63:9d8e:: with SMTP id
	i136-v6mr10817069pgd.288.1527523113720; 
	Mon, 28 May 2018 08:58:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm63041892pfa.107.2018.05.28.08.58.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 08:58:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 08:58:31 -0700
Message-Id: <20180528155833.24224-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/3] systemd: Fix build with gcc8
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
X-List-Received-Date: Mon, 28 May 2018 15:58:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ange-the-default-device-timeout-to-2.patch |   9 +-
 ...ation-compile-failure-by-typecasting.patch | 173 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb      |   1 +
 3 files changed, 177 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
index b7b1ea0886..98c83620ff 100644
--- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -1,4 +1,4 @@
-From 9820c165a9e559cf851e3beb60fad2571de4ded2 Mon Sep 17 00:00:00 2001
+From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 04:09:19 +0000
 Subject: [PATCH] core/device.c: Change the default device timeout to 240 sec.
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/core/device.c b/src/core/device.c
-index 77601c552..98bf49ba2 100644
+index a43664d3b..4b16a8aec 100644
 --- a/src/core/device.c
 +++ b/src/core/device.c
-@@ -112,7 +112,7 @@ static void device_init(Unit *u) {
+@@ -113,7 +113,7 @@ static void device_init(Unit *u) {
           * indefinitely for plugged in devices, something which cannot
           * happen for the other units since their operations time out
           * anyway. */
@@ -28,6 +28,3 @@ index 77601c552..98bf49ba2 100644
  
          u->ignore_on_isolate = true;
  }
--- 
-2.16.1
-
diff --git a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
new file mode 100644
index 0000000000..e56061f41b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
@@ -0,0 +1,173 @@
+From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17 00:00:00 2001
+From: Patrick Uiterwijk <patrick@puiterwijk.org>
+Date: Thu, 22 Feb 2018 19:41:30 +0100
+Subject: [PATCH] Fix format-truncation compile failure by typecasting USB IDs
+ (#8250)
+
+This patch adds safe_atoux16 for parsing an unsigned hexadecimal 16bit int, and
+uses that for parsing USB device and vendor IDs.
+
+This fixes a compile error with gcc-8 because while we know that USB IDs are 2 bytes,
+the compiler does not know that.
+
+../src/udev/udev-builtin-hwdb.c:80:38: error: '%04X' directive output may be
+truncated writing between 4 and 8 bytes into a region of size between 2 and 6
+[-Werror=format-truncation=]
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/5547c12503a683290eaed47954ffcfb2d1bc03cd]
+
+Signed-off-by: Adam Williamson <awilliam@redhat.com>
+Signed-off-by: Patrick Uiterwijk <puiterwijk@redhat.com>
+---
+ src/basic/parse-util.c       | 24 ++++++++++++++++++++++
+ src/basic/parse-util.h       |  2 ++
+ src/test/test-parse-util.c   | 39 ++++++++++++++++++++++++++++++++++++
+ src/udev/udev-builtin-hwdb.c | 13 ++++++------
+ 4 files changed, 71 insertions(+), 7 deletions(-)
+
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index 97533721d..ff3fc298a 100644
+--- a/src/basic/parse-util.c
++++ b/src/basic/parse-util.c
+@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *ret) {
+         return 0;
+ }
+ 
++int safe_atoux16(const char *s, uint16_t *ret) {
++        char *x = NULL;
++        unsigned long l;
++
++        assert(s);
++        assert(ret);
++
++        s += strspn(s, WHITESPACE);
++
++        errno = 0;
++        l = strtoul(s, &x, 16);
++        if (errno > 0)
++                return -errno;
++        if (!x || x == s || *x != 0)
++                return -EINVAL;
++        if (s[0] == '-')
++                return -ERANGE;
++        if ((unsigned long) (uint16_t) l != l)
++                return -ERANGE;
++
++        *ret = (uint16_t) l;
++        return 0;
++}
++
+ int safe_atod(const char *s, double *ret_d) {
+         _cleanup_(freelocalep) locale_t loc = (locale_t) 0;
+         char *x = NULL;
+diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h
+index 1eda1d7f9..727422056 100644
+--- a/src/basic/parse-util.h
++++ b/src/basic/parse-util.h
+@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);
+ int safe_atou16(const char *s, uint16_t *ret);
+ int safe_atoi16(const char *s, int16_t *ret);
+ 
++int safe_atoux16(const char *s, uint16_t *ret);
++
+ static inline int safe_atou32(const char *s, uint32_t *ret_u) {
+         assert_cc(sizeof(uint32_t) == sizeof(unsigned));
+         return safe_atou(s, (unsigned*) ret_u);
+diff --git a/src/test/test-parse-util.c b/src/test/test-parse-util.c
+index 937500213..a99cea5a1 100644
+--- a/src/test/test-parse-util.c
++++ b/src/test/test-parse-util.c
+@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {
+         assert_se(r == -EINVAL);
+ }
+ 
++static void test_safe_atoux16(void) {
++        int r;
++        uint16_t l;
++
++        r = safe_atoux16("1234", &l);
++        assert_se(r == 0);
++        assert_se(l == 0x1234);
++
++        r = safe_atoux16("abcd", &l);
++        assert_se(r == 0);
++        assert_se(l == 0xabcd);
++
++        r = safe_atoux16("  1234", &l);
++        assert_se(r == 0);
++        assert_se(l == 0x1234);
++
++        r = safe_atoux16("12345", &l);
++        assert_se(r == -ERANGE);
++
++        r = safe_atoux16("-1", &l);
++        assert_se(r == -ERANGE);
++
++        r = safe_atoux16("  -1", &l);
++        assert_se(r == -ERANGE);
++
++        r = safe_atoux16("junk", &l);
++        assert_se(r == -EINVAL);
++
++        r = safe_atoux16("123x", &l);
++        assert_se(r == -EINVAL);
++
++        r = safe_atoux16("12.3", &l);
++        assert_se(r == -EINVAL);
++
++        r = safe_atoux16("", &l);
++        assert_se(r == -EINVAL);
++}
++
+ static void test_safe_atou64(void) {
+         int r;
+         uint64_t l;
+@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {
+         test_safe_atolli();
+         test_safe_atou16();
+         test_safe_atoi16();
++        test_safe_atoux16();
+         test_safe_atou64();
+         test_safe_atoi64();
+         test_safe_atod();
+diff --git a/src/udev/udev-builtin-hwdb.c b/src/udev/udev-builtin-hwdb.c
+index ca7f7c230..dbfe02429 100644
+--- a/src/udev/udev-builtin-hwdb.c
++++ b/src/udev/udev-builtin-hwdb.c
+@@ -27,6 +27,7 @@
+ 
+ #include "alloc-util.h"
+ #include "hwdb-util.h"
++#include "parse-util.h"
+ #include "string-util.h"
+ #include "udev-util.h"
+ #include "udev.h"
+@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct udev_device *dev,
+ 
+ static const char *modalias_usb(struct udev_device *dev, char *s, size_t size) {
+         const char *v, *p;
+-        int vn, pn;
++        uint16_t vn, pn;
+ 
+         v = udev_device_get_sysattr_value(dev, "idVendor");
+         if (!v)
+@@ -71,12 +72,10 @@ static const char *modalias_usb(struct udev_device *dev, char *s, size_t size) {
+         p = udev_device_get_sysattr_value(dev, "idProduct");
+         if (!p)
+                 return NULL;
+-        vn = strtol(v, NULL, 16);
+-        if (vn <= 0)
+-                return NULL;
+-        pn = strtol(p, NULL, 16);
+-        if (pn <= 0)
+-                return NULL;
++        if (safe_atoux16(v, &vn) < 0)
++		return NULL;
++        if (safe_atoux16(p, &pn) < 0)
++		return NULL;
+         snprintf(s, size, "usb:v%04Xp%04X*", vn, pn);
+         return s;
+ }
+-- 
+2.17.0
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index b7c2113255..c4743a6b9d 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -52,6 +52,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0032-memfd.patch \
            file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch \
            file://libmount.patch \
+           file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.17.0


