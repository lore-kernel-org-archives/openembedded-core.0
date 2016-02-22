Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id F32E677207
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:36:58 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id y9so123959849qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E3kzxwehubUaaOKe9OYM8mQ5w1cKyUDetReMKz7TSrU=;
	b=fZ3Z9Ig42SF96KyXupaimjF+Hqdqq2ZlGJLYn0x5TtBcnfobA7FQ7Tum8VKgszqfFE
	5FJw5PBqhwBJOvC18GodnDT+9ieDnmRnQ8Szo2hj2yVlu9rempGl6BHDR8I19kWgGIc6
	sYnaaUXsWuyP8zYcTYVxcSkqrpjySKha+Z3lR68wCcMYmVHsIrRumWeoFOvZgliPiI1A
	ZzxkjbQMJg4jtbZTsyeogOD4dviD3TAkvF138pJj+lbJuy6MZaZHSVafUohNiC5IGQ9B
	3HIJ7EptalqIzv2PUOFI+CIiT5JwXjV6dkB8mMaq0ortwFJ8k5mMQSM0Goov2knF2V0x
	T+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E3kzxwehubUaaOKe9OYM8mQ5w1cKyUDetReMKz7TSrU=;
	b=R/uA/3wVGmQE8917wBbm2+NJx0HuxkDvHlP8xYyd02lPsrls8oeNsITMQpKks4HY/g
	u5Z7ZQGuTvAjQEkIKO7iaNMbQxiADENyMlPpXIChp0yWueFaqDexnYiDu5QVc2HfgCqO
	cl0IM6zM+6qmgbkyXMiqDGe9p4nna3jk6QoPeLqP/PWcQtc5bEYJU+ZPW7EYu9IJvn6d
	CXo+DRJ+pZWxDq/wJX0UVwtujRdvLRneiQVb77AdxNnTOGvGIBWKGPJqfR/99uu01oCN
	Uc6id8zM3+HGKBt+iAeoG9joeZlWfGfOpM5mHRO1xb6ZGcNkW0jUwdZ2RwtVoGtl9DJf
	Y7Sw==
X-Gm-Message-State: AG10YORN/JiJted6ZX/jNl1bvrfLPlcl856dWhrxaou+GxgSsejTvCJfSqpDNF1Q0jfpzQ==
X-Received: by 10.140.91.115 with SMTP id y106mr37040972qgd.20.1456177019507; 
	Mon, 22 Feb 2016 13:36:59 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id f3sm7374221qge.44.2016.02.22.13.36.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 13:36:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 21:36:52 +0000
Message-Id: <1456177012-8588-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH V2 1/4] Upgrade systemd to 229
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
X-List-Received-Date: Mon, 22 Feb 2016 21:37:01 -0000

Forward port all existing patches and arrange them such such
uclibc-only and qemu-only patches appear first

Add new patches to fix build on uclibc ( 0019-0022 )

Convert the lnr sed operation into a static patch

Use PACKAGECONFIG setting to disable features for muls and uclibc
instead of modifying EXTRA_OECONF manually

Drop compat from PACKAGECONFIG, this options has been removed
from systemd

Tested/booted sato iamge on all qemus and qemux86-64 on uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes sicne v1:
- Use packageconfig to control options for musl/uclibc
- Document the patch a bit more

 ...c-Change-the-default-device-timeout-to-2.patch} | 10 ++--
 ...r-getty-to-agetty-in-console-setup-system.patch |  6 +-
 ...ng.patch => 0003-define-exp10-if-missing.patch} | 14 ++---
 ...v-when-secure-versions-are-not-available.patch} | 23 ++++----
 ...t-install-dependency-links-at-install-tim.patch | 10 ++--
 ...heck-for-additional-features-that-uclibc-.patch |  8 +--
 ...pper-instead-of-looking-for-relative-opti.patch | 61 ++++++++++++++++++++
 ...n-Use-execvpe-only-when-libc-supports-it.patch} | 18 +++---
 ...unimplemented-_SC_PHYS_PAGES-system-conf.patch} | 10 ++--
 ...010-implment-systemd-sysv-install-for-OE.patch} |  6 +-
 ...es-Build-conditionally-when-HAVE_MYHOSTN.patch} | 12 ++--
 ...patch => 0012-rules-whitelist-hd-devices.patch} |  6 +-
 ...or-add-support-for-executing-scripts-und.patch} | 40 +++++--------
 ...-Make-root-s-home-directory-configurable.patch} | 64 ++++++++++-----------
 ...015-systemd-user-avoid-using-system-auth.patch} |  6 +-
 ...vert-rules-remove-firmware-loading-rules.patch} |  6 +-
 ...remove-userspace-firmware-loading-suppor.patch} | 48 ++++++++--------
 ...patch => 0018-make-test-dir-configurable.patch} | 18 +++---
 .../0019-remove-duplicate-include-uchar.h.patch    | 42 ++++++++++++++
 .../0020-check-for-uchar.h-in-configure.patch      | 44 +++++++++++++++
 ...sing.h-for-getting-secure_getenv-definiti.patch | 27 +++++++++
 ...il-don-t-fail-if-libc-doesn-t-support-IDN.patch | 36 ++++++++++++
 .../systemd/{systemd_228.bb => systemd_229.bb}     | 65 +++++++++++-----------
 23 files changed, 389 insertions(+), 191 deletions(-)
 rename meta/recipes-core/systemd/systemd/{0004-core-device.c-Change-the-default-device-timeout-to-2.patch => 0001-core-device.c-Change-the-default-device-timeout-to-2.patch} (79%)
 rename meta/recipes-core/systemd/systemd/{0001-define-exp10-if-missing.patch => 0003-define-exp10-if-missing.patch} (72%)
 rename meta/recipes-core/systemd/systemd/{0003-Use-getenv-when-secure-versions-are-not-available.patch => 0004-Use-getenv-when-secure-versions-are-not-available.patch} (56%)
 create mode 100644 meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 rename meta/recipes-core/systemd/systemd/{0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch => 0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch} (69%)
 rename meta/recipes-core/systemd/systemd/{0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch => 0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0009-implment-systemd-sysv-install-for-OE.patch => 0010-implment-systemd-sysv-install-for-OE.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch => 0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch} (73%)
 rename meta/recipes-core/systemd/systemd/{0011-rules-whitelist-hd-devices.patch => 0012-rules-whitelist-hd-devices.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0012-sysv-generator-add-support-for-executing-scripts-und.patch => 0013-sysv-generator-add-support-for-executing-scripts-und.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0013-Make-root-s-home-directory-configurable.patch => 0014-Make-root-s-home-directory-configurable.patch} (81%)
 rename meta/recipes-core/systemd/systemd/{0014-systemd-user-avoid-using-system-auth.patch => 0015-systemd-user-avoid-using-system-auth.patch} (87%)
 rename meta/recipes-core/systemd/systemd/{0015-Revert-rules-remove-firmware-loading-rules.patch => 0016-Revert-rules-remove-firmware-loading-rules.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0001-make-test-dir-configurable.patch => 0018-make-test-dir-configurable.patch} (82%)
 create mode 100644 meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
 rename meta/recipes-core/systemd/{systemd_228.bb => systemd_229.bb} (93%)

diff --git a/meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
similarity index 79%
rename from meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch
rename to meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
index 74629fc..f7ef7a3 100644
--- a/meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -1,7 +1,7 @@
-From ef867afd27e8fed558e82430759d8d2c7efb6608 Mon Sep 17 00:00:00 2001
+From 3bc4552117879f57522b5972b724729ca993f1ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 04:09:19 +0000
-Subject: [PATCH 04/16] core/device.c: Change the default device timeout to 240
+Subject: [PATCH 01/36] core/device.c: Change the default device timeout to 240
  sec.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/core/device.c b/src/core/device.c
-index bcd4d11..f41bb54 100644
+index d201dc5..340d62a 100644
 --- a/src/core/device.c
 +++ b/src/core/device.c
-@@ -114,7 +114,7 @@ static void device_init(Unit *u) {
+@@ -112,7 +112,7 @@ static void device_init(Unit *u) {
           * indefinitely for plugged in devices, something which cannot
           * happen for the other units since their operations time out
           * anyway. */
@@ -29,5 +29,5 @@ index bcd4d11..f41bb54 100644
          u->ignore_on_isolate = true;
  }
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
index 55ff0ce..28939eb 100644
--- a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
+++ b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
@@ -1,7 +1,7 @@
-From bfb6562cdbec73d03765ce707e9e0cac138fd223 Mon Sep 17 00:00:00 2001
+From e5f405aba347d216e7f2b73d7dd681b13be442e3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:29:15 +0000
-Subject: [PATCH 02/16] units: Prefer getty to agetty in console setup systemd
+Subject: [PATCH 02/36] units: Prefer getty to agetty in console setup systemd
  units
 
 Upstream-Status: Inappropriate [configuration specific]
@@ -40,5 +40,5 @@ index 4522d0d..e6d499d 100644
  Restart=always
  UtmpIdentifier=%I
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
similarity index 72%
rename from meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
rename to meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
index 8bb775f..f183261 100644
--- a/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
+++ b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
@@ -1,7 +1,7 @@
-From ddad25c809846e08ea39bef49cc668f95d53304a Mon Sep 17 00:00:00 2001
+From 699893a05edac5194f9670529bacfaeb67252edb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 00:42:49 +0000
-Subject: [PATCH 01/16] define exp10 if missing
+Subject: [PATCH 03/36] define exp10 if missing
 
 Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
 
@@ -16,12 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index d539ed0..09a233b 100644
+index f3d3236..ee7e7ea 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -1125,3 +1125,8 @@ static inline key_serial_t request_key(const char *type, const char *description
- #ifndef KEY_SPEC_USER_KEYRING
- #define KEY_SPEC_USER_KEYRING -4
+@@ -1169,3 +1169,8 @@ static inline key_serial_t request_key(const char *type, const char *description
+ #endif
+ 
  #endif
 +
 +#ifdef __UCLIBC__
@@ -29,5 +29,5 @@ index d539ed0..09a233b 100644
 +#define exp10(x) (exp((x) * log(10)))
 +#endif /* __UCLIBC__ */
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
similarity index 56%
rename from meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch
rename to meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
index cbf69d1..989a1fa 100644
--- a/meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch
+++ b/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
@@ -1,7 +1,7 @@
-From 9e79bb4bea758f25803e9f7ff2c5835ac4204230 Mon Sep 17 00:00:00 2001
+From bb8d8148b16572ae17d3c308552cf73915386b05 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Sep 2015 19:10:04 +0000
-Subject: [PATCH 03/16] Use getenv when secure versions are not available
+Subject: [PATCH 04/36] Use getenv when secure versions are not available
 
 musl doesnt implement secure version, so we default
 to it if configure does not detect a secure imeplementation
@@ -9,30 +9,27 @@ to it if configure does not detect a secure imeplementation
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Denied
 ---
- src/basic/missing.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+ src/basic/missing.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 09a233b..3c37466 100644
+index ee7e7ea..3170429 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -582,13 +582,14 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+@@ -585,12 +585,11 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
          return syscall(__NR_name_to_handle_at, fd, name, handle, mnt_id, flags);
  }
  #endif
 -
--#ifndef HAVE_SECURE_GETENV
-+#ifdef HAVE_SECURE_GETENV
+ #ifndef HAVE_SECURE_GETENV
  #  ifdef HAVE___SECURE_GETENV
  #    define secure_getenv __secure_getenv
  #  else
- #    error "neither secure_getenv nor __secure_getenv are available"
+-#    error "neither secure_getenv nor __secure_getenv are available"
++#    define secure_getenv getenv
  #  endif
-+#else
-+#  define secure_getenv getenv
  #endif
  
- #ifndef CIFS_MAGIC_NUMBER
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 0b75fac..f69e26e 100644
--- a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,7 +1,7 @@
-From 319873d22a6b1225ae41aa38bc976e723326ba20 Mon Sep 17 00:00:00 2001
+From 3436b12d40bf4f4ab7e3e16600e5f6c35a470da4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:03:44 +0000
-Subject: [PATCH 05/16] binfmt: Don't install dependency links at install time
+Subject: [PATCH 05/36] binfmt: Don't install dependency links at install time
  for the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
@@ -24,10 +24,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 00a92e3..4c1143a 100644
+index 03341fc..629740f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -4455,10 +4455,6 @@ INSTALL_DIRS += \
+@@ -4387,10 +4387,6 @@ INSTALL_DIRS += \
  	$(prefix)/lib/binfmt.d \
  	$(sysconfdir)/binfmt.d
  
@@ -70,5 +70,5 @@ index d53073e..8c57ee0 100644
 +[Install]
 +WantedBy=sysinit.target
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch b/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
index a2c40b5..0d63755 100644
--- a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
+++ b/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
@@ -1,7 +1,7 @@
-From d1fe5d2dd38cdef984296f453c65ccaebb71d1a9 Mon Sep 17 00:00:00 2001
+From bb6f1d8a000b337280541afde7cccdcfe03cdeb1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:05:45 +0000
-Subject: [PATCH 06/16] configure: Check for additional features that uclibc
+Subject: [PATCH 06/36] configure: Check for additional features that uclibc
  doesnt support
 
 This helps in supporting uclibc which does not have all features that
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 3128ca8..49f73a4 100644
+index f51533c..0239fd0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -112,6 +112,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
@@ -44,5 +44,5 @@ index 3128ca8..49f73a4 100644
  
  AC_CHECK_TOOL(OBJCOPY, objcopy)
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
new file mode 100644
index 0000000..12f6ace
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -0,0 +1,61 @@
+From fa5e137fbd2fb081ae897575377d718ee8cb6349 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Dec 2015 04:20:28 +0000
+Subject: [PATCH 07/36] use lnr wrapper instead of looking for --relative
+ option for ln
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am  | 6 +++---
+ configure.ac | 2 --
+ 2 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 629740f..82b6553 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -243,7 +243,7 @@ define move-to-rootlibdir
+ 		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
+ 		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
+ 		rm -f $(DESTDIR)$(libdir)/$$libname && \
+-		$(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
++		lnr $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
+ 		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
+ 	fi
+ endef
+@@ -317,7 +317,7 @@ define install-relative-aliases
+ 	while [ -n "$$1" ]; do \
+ 		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
+ 		rm -f $(DESTDIR)$$dir/$$2 && \
+-		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
++		lnr $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
+ 		shift 2 || exit $$?; \
+ 	done
+ endef
+@@ -2781,7 +2781,7 @@ systemd_dbus1_generator_LDADD = \
+ dbus1-generator-install-hook:
+ 	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
+ 	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+-	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
++	$(AM_V_LN)lnr $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+ 
+ dbus1-generator-uninstall-hook:
+ 	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+diff --git a/configure.ac b/configure.ac
+index 0239fd0..c5ab9d0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
+ 
+-AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
+-
+ # check for few functions not implemented in uClibc
+ 
+ AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
similarity index 69%
rename from meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch
rename to meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
index 85d3907..6e6f199 100644
--- a/meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch
+++ b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
@@ -1,7 +1,7 @@
-From 529e7e2f7f6a5dc0e4527ff5c2237b19ece2f112 Mon Sep 17 00:00:00 2001
+From ae999ff50efb9cc82537adef7696c6f732afcfc8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:10:37 +0000
-Subject: [PATCH 07/16] nspawn: Use execvpe only when libc supports it
+Subject: [PATCH 08/36] nspawn: Use execvpe only when libc supports it
 
 Upstream-Status: Denied [no desire for uclibc support]
 
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index a4e13bd..4def6ba 100644
+index 5a68fec..65e65ec 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -112,6 +112,8 @@ typedef enum LinkJournal {
+@@ -111,6 +111,8 @@ typedef enum LinkJournal {
          LINK_GUEST
  } LinkJournal;
  
@@ -22,8 +22,8 @@ index a4e13bd..4def6ba 100644
 +
  static char *arg_directory = NULL;
  static char *arg_template = NULL;
- static char *arg_user = NULL;
-@@ -2595,7 +2597,12 @@ static int inner_child(
+ static char *arg_chdir = NULL;
+@@ -2637,7 +2639,12 @@ static int inner_child(
                  a[0] = (char*) "/sbin/init";
                  execve(a[0], a, env_use);
          } else if (!strv_isempty(arg_parameters))
@@ -34,8 +34,8 @@ index a4e13bd..4def6ba 100644
 +                execvp(arg_parameters[0], arg_parameters);
 +#endif /* HAVE_EXECVPE */
          else {
-                 chdir(home ?: "/root");
-                 execle("/bin/bash", "-bash", NULL, env_use);
+                 if (!arg_chdir)
+                         chdir(home ?: "/root");
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch b/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
rename to meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
index 8d71ecb..116f3d4 100644
--- a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
+++ b/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
@@ -1,7 +1,7 @@
-From 83944758dc0703afea81f3c7aa0ad926bc5df757 Mon Sep 17 00:00:00 2001
+From 3498f488b27f90398d7c8d1d06aac5ab684370e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 00:47:53 +0000
-Subject: [PATCH 08/16] util: bypass unimplemented _SC_PHYS_PAGES system
+Subject: [PATCH 09/36] util: bypass unimplemented _SC_PHYS_PAGES system
  configuration API on uclibc
 
 Upstream-Status: Inappropriate [uclibc-specific]
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 15 insertions(+)
 
 diff --git a/src/basic/util.c b/src/basic/util.c
-index 9e0b576..65f0edf 100644
+index ea1bed7..fdaf340 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
-@@ -769,10 +769,25 @@ uint64_t physical_memory(void) {
+@@ -767,10 +767,25 @@ uint64_t physical_memory(void) {
          /* We return this as uint64_t in case we are running as 32bit
           * process on a 64bit kernel with huge amounts of memory */
  
@@ -42,5 +42,5 @@ index 9e0b576..65f0edf 100644
  
  int update_reboot_param_file(const char *param) {
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch
rename to meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
index a139684..75fa3a5 100644
--- a/meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
@@ -1,7 +1,7 @@
-From 81c3d92b5bc5786cbd93b1e5ed82884e8caf2254 Mon Sep 17 00:00:00 2001
+From 5f94f5ad46c1ded54c3797979d384e4c1eb77bb0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 09/16] implment systemd-sysv-install for OE
+Subject: [PATCH 10/36] implment systemd-sysv-install for OE
 
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -39,5 +39,5 @@ index a53a3e6..5d877b0 100755
      *)
          usage ;;
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
similarity index 73%
rename from meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
rename to meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
index 8cec071..34ae645 100644
--- a/meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
+++ b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
@@ -1,7 +1,7 @@
-From d4b7f9b771a538c2356c4c77461f3b4790043556 Mon Sep 17 00:00:00 2001
+From 2b2450f6b7197bff4637c0283e8784500471d083 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 00:50:01 +0000
-Subject: [PATCH 10/16] nss-mymachines: Build conditionally when
+Subject: [PATCH 11/36] nss-mymachines: Build conditionally when
  HAVE_MYHOSTNAME is set
 
 Fixes build failures when building with --disable-myhostname
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4c1143a..cf559be 100644
+index 82b6553..b3f3343 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -4961,6 +4961,7 @@ SYSTEM_UNIT_ALIASES += \
+@@ -4876,6 +4876,7 @@ SYSTEM_UNIT_ALIASES += \
  BUSNAMES_TARGET_WANTS += \
  	org.freedesktop.machine1.busname
  
@@ -25,7 +25,7 @@ index 4c1143a..cf559be 100644
  libnss_mymachines_la_SOURCES = \
  	src/nss-mymachines/nss-mymachines.sym \
  	src/nss-mymachines/nss-mymachines.c
-@@ -4981,6 +4982,7 @@ lib_LTLIBRARIES += \
+@@ -4896,6 +4897,7 @@ lib_LTLIBRARIES += \
  	libnss_mymachines.la
  
  endif
@@ -34,5 +34,5 @@ index 4c1143a..cf559be 100644
  polkitpolicy_in_files += \
  	src/machine/org.freedesktop.machine1.policy.in
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch
rename to meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
index 03fdbff..6143088 100644
--- a/meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
@@ -1,7 +1,7 @@
-From ae6c9dcb00919e1dd2793fd1b82125d123f69a90 Mon Sep 17 00:00:00 2001
+From 5ebc0d87565a73710dea602c00b1586d5a1364e5 Mon Sep 17 00:00:00 2001
 From: Patrick Ohly <patrick.ohly@intel.com>
 Date: Wed, 16 Sep 2015 13:55:58 +0200
-Subject: [PATCH 11/16] rules: whitelist hd* devices
+Subject: [PATCH 12/36] rules: whitelist hd* devices
 
 qemu by default emulates IDE and the linux-yocto kernel(s) use
 CONFIG_IDE instead of the more modern libsata, so disks appear as
@@ -28,5 +28,5 @@ index 0b14bb4..1c4d97a 100644
  # ignore partitions that span the entire disk
  TEST=="whole_disk", GOTO="persistent_storage_end"
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch
rename to meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
index 82feff0..ac67f65 100644
--- a/meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch
+++ b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
@@ -1,7 +1,7 @@
-From 9e6c907ff1f17deb96c66a607653db4c7da34289 Mon Sep 17 00:00:00 2001
+From 6736de4a3caf9a0b3c888c6cc05103ab1b86907d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 05:09:53 +0000
-Subject: [PATCH 12/16] sysv-generator: add support for executing scripts under
+Subject: [PATCH 13/36] sysv-generator: add support for executing scripts under
  /etc/rcS.d/
 
 To be compatible, all services translated from scripts under /etc/rcS.d would
@@ -12,14 +12,14 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/sysv-generator/sysv-generator.c | 50 +++++++++++++++++++++++++++++--------
- 1 file changed, 39 insertions(+), 11 deletions(-)
+ src/sysv-generator/sysv-generator.c | 47 ++++++++++++++++++++++++++++---------
+ 1 file changed, 36 insertions(+), 11 deletions(-)
 
 diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
-index 5075548..32d3687 100644
+index b5925a4..ea06d6a 100644
 --- a/src/sysv-generator/sysv-generator.c
 +++ b/src/sysv-generator/sysv-generator.c
-@@ -46,7 +46,8 @@
+@@ -44,7 +44,8 @@
  
  typedef enum RunlevelType {
          RUNLEVEL_UP,
@@ -29,7 +29,7 @@ index 5075548..32d3687 100644
  } RunlevelType;
  
  static const struct {
-@@ -61,6 +62,9 @@ static const struct {
+@@ -59,6 +60,9 @@ static const struct {
          { "rc4.d",  SPECIAL_MULTI_USER_TARGET, RUNLEVEL_UP },
          { "rc5.d",  SPECIAL_GRAPHICAL_TARGET,  RUNLEVEL_UP },
  
@@ -39,7 +39,7 @@ index 5075548..32d3687 100644
          /* Standard SysV runlevels for shutdown */
          { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
          { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
-@@ -69,7 +73,7 @@ static const struct {
+@@ -67,7 +71,7 @@ static const struct {
             directories in this order, and we want to make sure that
             sysv_start_priority is known when we first load the
             unit. And that value we only know from S links. Hence
@@ -47,8 +47,8 @@ index 5075548..32d3687 100644
 +           UP/SYSINIT must be read before DOWN */
  };
  
- const char *arg_dest = "/tmp";
-@@ -88,6 +92,8 @@ typedef struct SysvStub {
+ static const char *arg_dest = "/tmp";
+@@ -86,6 +90,8 @@ typedef struct SysvStub {
          bool has_lsb;
          bool reload;
          bool loaded;
@@ -57,17 +57,7 @@ index 5075548..32d3687 100644
  } SysvStub;
  
  static void free_sysvstub(SysvStub *s) {
-@@ -204,6 +210,9 @@ static int generate_unit_file(SysvStub *s) {
-         if (s->description)
-                 fprintf(f, "Description=%s\n", s->description);
- 
-+        if (!s->default_dependencies)
-+                fprintf(f, "DefaultDependencies=no\n");
-+
-         if (!isempty(before))
-                 fprintf(f, "Before=%s\n", before);
-         if (!isempty(after))
-@@ -722,17 +731,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
+@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
                  if (s->has_lsb && other->has_lsb)
                          continue;
  
@@ -105,7 +95,7 @@ index 5075548..32d3687 100644
  
                  /* FIXME: Maybe we should compare the name here lexicographically? */
          }
-@@ -799,6 +822,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
+@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
                                  return log_oom();
  
                          service->sysv_start_priority = -1;
@@ -114,7 +104,7 @@ index 5075548..32d3687 100644
                          service->name = name;
                          service->path = fpath;
                          name = fpath = NULL;
-@@ -882,9 +907,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
+@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
  
                                  if (de->d_name[0] == 'S')  {
  
@@ -128,7 +118,7 @@ index 5075548..32d3687 100644
                                          r = set_ensure_allocated(&runlevel_services[i], NULL);
                                          if (r < 0) {
                                                  log_oom();
-@@ -898,7 +925,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
+@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
                                          }
  
                                  } else if (de->d_name[0] == 'K' &&
@@ -139,5 +129,5 @@ index 5075548..32d3687 100644
                                          r = set_ensure_allocated(&shutdown_services, NULL);
                                          if (r < 0) {
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
similarity index 81%
rename from meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
rename to meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
index ea0b3e2..4a576aa 100644
--- a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
@@ -1,7 +1,7 @@
-From 1ba00ff6ed3f0626892f57cdd8d9788692c7bf14 Mon Sep 17 00:00:00 2001
+From 786883cfa13e21f060ee6da6cabb94845f4349a0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 05:18:20 +0000
-Subject: [PATCH 13/16] Make root's home directory configurable
+Subject: [PATCH 14/36] Make root's home directory configurable
 
 OpenEmbedded has a configurable home directory for root. Allow
 systemd to be built using its idea of what root's home directory
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 20 insertions(+), 11 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index cf559be..a511c3d 100644
+index b3f3343..a99e8eb 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -210,6 +210,7 @@ AM_CPPFLAGS = \
+@@ -202,6 +202,7 @@ AM_CPPFLAGS = \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
@@ -37,7 +37,7 @@ index cf559be..a511c3d 100644
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
  	-I $(top_builddir)/src/basic \
-@@ -5876,6 +5877,7 @@ EXTRA_DIST += \
+@@ -5713,6 +5714,7 @@ EXTRA_DIST += \
  substitutions = \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
@@ -46,10 +46,10 @@ index cf559be..a511c3d 100644
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
 diff --git a/configure.ac b/configure.ac
-index 49f73a4..a3e639d 100644
+index c5ab9d0..16c83bb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1434,6 +1434,11 @@ AC_ARG_WITH([rootlibdir],
+@@ -1470,6 +1470,11 @@ AC_ARG_WITH([rootlibdir],
          [with_rootlibdir=${libdir}])
  AX_NORMALIZE_PATH([with_rootlibdir])
  
@@ -61,7 +61,7 @@ index 49f73a4..a3e639d 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1517,6 +1522,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1553,6 +1558,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
@@ -69,7 +69,7 @@ index 49f73a4..a3e639d 100644
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1606,6 +1612,7 @@ AC_MSG_RESULT([
+@@ -1643,6 +1649,7 @@ AC_MSG_RESULT([
          includedir:              ${includedir}
          lib dir:                 ${libdir}
          rootlib dir:             ${with_rootlibdir}
@@ -78,10 +78,10 @@ index 49f73a4..a3e639d 100644
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
 diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index 56e1a3b..c3d0ec3 100644
+index 19155bc..55672b3 100644
 --- a/src/basic/user-util.c
 +++ b/src/basic/user-util.c
-@@ -124,7 +124,7 @@ int get_user_creds(
+@@ -122,7 +122,7 @@ int get_user_creds(
                          *gid = 0;
  
                  if (home)
@@ -90,7 +90,7 @@ index 56e1a3b..c3d0ec3 100644
  
                  if (shell)
                          *shell = "/bin/sh";
-@@ -355,7 +355,7 @@ int get_home_dir(char **_h) {
+@@ -353,7 +353,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -100,10 +100,10 @@ index 56e1a3b..c3d0ec3 100644
                          return -ENOMEM;
  
 diff --git a/src/core/namespace.c b/src/core/namespace.c
-index 81ba09e..1a1f276 100644
+index b573f00..0f70b14 100644
 --- a/src/core/namespace.c
 +++ b/src/core/namespace.c
-@@ -494,7 +494,7 @@ int setup_namespace(
+@@ -409,7 +409,7 @@ int setup_namespace(
                          home_dir = strjoina("-", home_dir);
                          run_user_dir = prefix_roota(root_directory, "/run/user");
                          run_user_dir = strjoina("-", run_user_dir);
@@ -113,10 +113,10 @@ index 81ba09e..1a1f276 100644
  
                          r = append_mounts(&m, STRV_MAKE(home_dir, run_user_dir, root_dir),
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 4def6ba..2081953 100644
+index 65e65ec..12f0ee8 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2530,7 +2530,7 @@ static int inner_child(
+@@ -2564,7 +2564,7 @@ static int inner_child(
          if (envp[n_env])
                  n_env ++;
  
@@ -125,17 +125,17 @@ index 4def6ba..2081953 100644
              (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
              (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
                  return log_oom();
-@@ -2604,7 +2604,7 @@ static int inner_child(
-                 execvp(arg_parameters[0], arg_parameters);
+@@ -2647,7 +2647,7 @@ static int inner_child(
  #endif /* HAVE_EXECVPE */
          else {
--                chdir(home ?: "/root");
-+                chdir(home ?: ROOTHOMEDIR);
+                 if (!arg_chdir)
+-                        chdir(home ?: "/root");
++                        chdir(home ?: ROOTHOMEDIR);
+ 
                  execle("/bin/bash", "-bash", NULL, env_use);
                  execle("/bin/sh", "-sh", NULL, env_use);
-         }
 diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
-index 5c80722..efde5f0 100644
+index a345ec2..3caae7d 100644
 --- a/units/console-shell.service.m4.in
 +++ b/units/console-shell.service.m4.in
 @@ -15,8 +15,8 @@ After=rc-local.service
@@ -143,14 +143,14 @@ index 5c80722..efde5f0 100644
  
  [Service]
 -Environment=HOME=/root
--WorkingDirectory=/root
+-WorkingDirectory=-/root
 +Environment=HOME=@roothomedir@
-+WorkingDirectory=@roothomedir@
++WorkingDirectory=-@roothomedir@
  ExecStart=-@SULOGIN@
  ExecStopPost=-@SYSTEMCTL@ poweroff
  Type=idle
 diff --git a/units/emergency.service.in b/units/emergency.service.in
-index 8dc3cbd..eb046c2 100644
+index fb390ea..5623a57 100644
 --- a/units/emergency.service.in
 +++ b/units/emergency.service.in
 @@ -14,8 +14,8 @@ Conflicts=rescue.service
@@ -158,14 +158,14 @@ index 8dc3cbd..eb046c2 100644
  
  [Service]
 -Environment=HOME=/root
--WorkingDirectory=/root
+-WorkingDirectory=-/root
 +Environment=HOME=@roothomedir@
-+WorkingDirectory=@roothomedir@
++WorkingDirectory=-@roothomedir@
  ExecStartPre=-/bin/plymouth --wait quit
  ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
  ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
 diff --git a/units/rescue.service.in b/units/rescue.service.in
-index 432e4f3..afa3e82 100644
+index 92553f6..590ae17 100644
 --- a/units/rescue.service.in
 +++ b/units/rescue.service.in
 @@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
@@ -173,12 +173,12 @@ index 432e4f3..afa3e82 100644
  
  [Service]
 -Environment=HOME=/root
--WorkingDirectory=/root
+-WorkingDirectory=-/root
 +Environment=HOME=@roothomedir@
-+WorkingDirectory=@roothomedir@
++WorkingDirectory=-@roothomedir@
  ExecStartPre=-/bin/plymouth quit
- ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
+ ExecStartPre=-/bin/echo -e 'Welcome to rescue mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
  ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
similarity index 87%
rename from meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch
rename to meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
index 11be097..a351237 100644
--- a/meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch
+++ b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
@@ -1,7 +1,7 @@
-From 548a8d5d456c531444498b3ce8cec3f3dd374cf8 Mon Sep 17 00:00:00 2001
+From f70a1a9605cd3adac450c49a5a69da6e9acda517 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:26:25 +0000
-Subject: [PATCH 14/16] systemd-user: avoid using system-auth
+Subject: [PATCH 15/36] systemd-user: avoid using system-auth
 
 In OE, we don't provide system-auth, instead, we use common-* files.
 So modify systemd-user file to use common-* files.
@@ -32,5 +32,5 @@ index 7933508..16b73d2 100644
 -session  include system-auth
 +session  include common-session
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch b/meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch
rename to meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
index 7cc3922..66905b5 100644
--- a/meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
@@ -1,7 +1,7 @@
-From 6b2b8d20f884bd5a3d928175e422023f6c9d056b Mon Sep 17 00:00:00 2001
+From 7311ecc745c17d6ed9fd9cf43039648483a87605 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Thu, 19 Mar 2015 15:01:29 +1100
-Subject: [PATCH 15/16] Revert "rules: remove firmware loading rules"
+Subject: [PATCH 16/36] Revert "rules: remove firmware loading rules"
 
 This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
 Userspace firmware loading support is needed for Linux < 3.7.
@@ -24,5 +24,5 @@ index 0000000..f0ae684
 +
 +SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
rename to meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 6e5a8fb..8e6289d 100644
--- a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -1,7 +1,7 @@
-From d3661ec7fb4557c47f001986cbb8a684b8dbae4a Mon Sep 17 00:00:00 2001
+From 9a3a4e16b36e762291cd1574ec71d7954f8b5363 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 05:33:32 +0000
-Subject: [PATCH 16/16] Revert "udev: remove userspace firmware loading
+Subject: [PATCH 17/36] Revert "udev: remove userspace firmware loading
  support"
 
 This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
@@ -15,19 +15,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  Makefile.am                      |  12 +++
  README                           |   6 +-
  TODO                             |   1 +
- configure.ac                     |  25 +++++++
+ configure.ac                     |  22 ++++++
  src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
  src/udev/udev-builtin.c          |   3 +
  src/udev/udev.h                  |   6 ++
  src/udev/udevd.c                 |  13 ++++
- 8 files changed, 217 insertions(+), 3 deletions(-)
+ 8 files changed, 214 insertions(+), 3 deletions(-)
  create mode 100644 src/udev/udev-builtin-firmware.c
 
 diff --git a/Makefile.am b/Makefile.am
-index a511c3d..6181e55 100644
+index a99e8eb..b5c6ba7 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -3650,6 +3650,18 @@ libudev_core_la_LIBADD = \
+@@ -3573,6 +3573,18 @@ libudev_core_la_LIBADD = \
  	$(BLKID_LIBS) \
  	$(KMOD_LIBS)
  
@@ -47,10 +47,10 @@ index a511c3d..6181e55 100644
  libudev_core_la_SOURCES += \
  	src/udev/udev-builtin-kmod.c
 diff --git a/README b/README
-index bf67f8c..87b6f70 100644
+index 41fb07a..10230ac 100644
 --- a/README
 +++ b/README
-@@ -51,14 +51,14 @@ REQUIREMENTS:
+@@ -50,14 +50,14 @@ REQUIREMENTS:
            CONFIG_PROC_FS
            CONFIG_FHANDLE (libudev, mount and bind mount handling)
  
@@ -69,10 +69,10 @@ index bf67f8c..87b6f70 100644
  
          Some udev rules and virtualization detection relies on it:
 diff --git a/TODO b/TODO
-index 369805f..ce97674 100644
+index 92cc8cc..25f6849 100644
 --- a/TODO
 +++ b/TODO
-@@ -635,6 +635,7 @@ Features:
+@@ -628,6 +628,7 @@ Features:
  * rename "userspace" to "core-os"
  
  * udev:
@@ -81,10 +81,10 @@ index 369805f..ce97674 100644
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
 diff --git a/configure.ac b/configure.ac
-index a3e639d..00736f5 100644
+index 16c83bb..36d20b5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1317,6 +1317,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
+@@ -1353,6 +1353,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
  AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
  
  # ------------------------------------------------------------------------------
@@ -109,8 +109,8 @@ index a3e639d..00736f5 100644
 +# ------------------------------------------------------------------------------
  have_manpages=no
  AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable manpages]))
- AS_IF([test "x$enable_manpages" != xno], [
-@@ -1616,6 +1635,9 @@ AC_MSG_RESULT([
+ AC_PATH_PROG([XSLTPROC], [xsltproc])
+@@ -1653,6 +1672,9 @@ AC_MSG_RESULT([
          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
@@ -281,10 +281,10 @@ index 0000000..bd8c2fb
 +        .run_once = true,
 +};
 diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
-index 18fb661..d0280bf 100644
+index e6b36f1..cd9947e 100644
 --- a/src/udev/udev-builtin.c
 +++ b/src/udev/udev-builtin.c
-@@ -33,6 +33,9 @@ static const struct udev_builtin *builtins[] = {
+@@ -31,6 +31,9 @@ static const struct udev_builtin *builtins[] = {
          [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
  #endif
          [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
@@ -295,10 +295,10 @@ index 18fb661..d0280bf 100644
          [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
          [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
 diff --git a/src/udev/udev.h b/src/udev/udev.h
-index 4f40020..8f3560f 100644
+index 1f9c812..fa35a88 100644
 --- a/src/udev/udev.h
 +++ b/src/udev/udev.h
-@@ -149,6 +149,9 @@ enum udev_builtin_cmd {
+@@ -147,6 +147,9 @@ enum udev_builtin_cmd {
          UDEV_BUILTIN_BLKID,
  #endif
          UDEV_BUILTIN_BTRFS,
@@ -308,7 +308,7 @@ index 4f40020..8f3560f 100644
          UDEV_BUILTIN_HWDB,
          UDEV_BUILTIN_INPUT_ID,
          UDEV_BUILTIN_KEYBOARD,
-@@ -177,6 +180,9 @@ struct udev_builtin {
+@@ -175,6 +178,9 @@ struct udev_builtin {
  extern const struct udev_builtin udev_builtin_blkid;
  #endif
  extern const struct udev_builtin udev_builtin_btrfs;
@@ -319,10 +319,10 @@ index 4f40020..8f3560f 100644
  extern const struct udev_builtin udev_builtin_input_id;
  extern const struct udev_builtin udev_builtin_keyboard;
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index 366e7fb..7ca1b51 100644
+index bb92f16..84024ac 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
-@@ -127,6 +127,9 @@ struct event {
+@@ -125,6 +125,9 @@ struct event {
          bool is_block;
          sd_event_source *timeout_warning;
          sd_event_source *timeout;
@@ -332,7 +332,7 @@ index 366e7fb..7ca1b51 100644
  };
  
  static inline struct event *node_to_event(struct udev_list_node *node) {
-@@ -615,6 +618,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
+@@ -613,6 +616,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
          event->devnum = udev_device_get_devnum(dev);
          event->is_block = streq("block", udev_device_get_subsystem(dev));
          event->ifindex = udev_device_get_ifindex(dev);
@@ -343,7 +343,7 @@ index 366e7fb..7ca1b51 100644
  
          log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
               udev_device_get_action(dev), udev_device_get_subsystem(dev));
-@@ -700,6 +707,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
+@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
                          return true;
                  }
  
@@ -357,5 +357,5 @@ index 366e7fb..7ca1b51 100644
                  if (event->devpath[common] == '/') {
                          event->delaying_seqnum = loop_event->seqnum;
 -- 
-2.6.4
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0001-make-test-dir-configurable.patch b/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
similarity index 82%
rename from meta/recipes-core/systemd/systemd/0001-make-test-dir-configurable.patch
rename to meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
index 7d06371..5f3f2e8 100644
--- a/meta/recipes-core/systemd/systemd/0001-make-test-dir-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
@@ -1,7 +1,7 @@
-From 3eeec270d3af166e3bc09537626850562487742b Mon Sep 17 00:00:00 2001
+From 569cd3cf9806a02226d26c4104dbe44262f93d33 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Fri, 22 Jan 2016 16:44:11 +0800
-Subject: [PATCH] make test dir configurable
+Subject: [PATCH 18/36] make test dir configurable
 
 Upstream-Status: Pending
 
@@ -15,10 +15,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 931d13f..7155ec7 100644
+index b5c6ba7..d3cd961 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -209,7 +209,7 @@ AM_CPPFLAGS = \
+@@ -203,7 +203,7 @@ AM_CPPFLAGS = \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
  	-DROOTHOMEDIR=\"$(roothomedir)\" \
@@ -28,10 +28,10 @@ index 931d13f..7155ec7 100644
  	-I $(top_builddir)/src/basic \
  	-I $(top_srcdir)/src/basic \
 diff --git a/configure.ac b/configure.ac
-index 76090a1..b02968d 100644
+index 36d20b5..d96dc5a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1411,6 +1411,11 @@ AC_ARG_WITH([roothomedir],
+@@ -1494,6 +1494,11 @@ AC_ARG_WITH([roothomedir],
          [],
          [with_roothomedir=/root])
  
@@ -43,7 +43,7 @@ index 76090a1..b02968d 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1503,6 +1508,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
+@@ -1578,6 +1583,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
  AC_SUBST([roothomedir], [$with_roothomedir])
@@ -51,7 +51,7 @@ index 76090a1..b02968d 100644
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1593,6 +1599,7 @@ AC_MSG_RESULT([
+@@ -1669,6 +1675,7 @@ AC_MSG_RESULT([
          lib dir:                 ${libdir}
          rootlib dir:             ${with_rootlibdir}
          root home dir:           ${with_roothomedir}
@@ -60,5 +60,5 @@ index 76090a1..b02968d 100644
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
 -- 
-1.9.1
+1.8.3.1
 
diff --git a/meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch b/meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch
new file mode 100644
index 0000000..17592f8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch
@@ -0,0 +1,42 @@
+From 3ca534935460647fed66e31aaa90b364e29eab5c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Feb 2016 05:59:01 +0000
+Subject: [PATCH 1/2] remove duplicate include uchar.h
+
+missing.h already includes it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/basic/escape.h | 1 -
+ src/basic/utf8.h   | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/src/basic/escape.h b/src/basic/escape.h
+index deaa4de..36d437c 100644
+--- a/src/basic/escape.h
++++ b/src/basic/escape.h
+@@ -23,7 +23,6 @@
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <sys/types.h>
+-#include <uchar.h>
+ 
+ #include "string-util.h"
+ #include "missing.h"
+diff --git a/src/basic/utf8.h b/src/basic/utf8.h
+index 12c272d..bea93a6 100644
+--- a/src/basic/utf8.h
++++ b/src/basic/utf8.h
+@@ -22,7 +22,6 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+-#include <uchar.h>
+ 
+ #include "macro.h"
+ #include "missing.h"
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch b/meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch
new file mode 100644
index 0000000..a027fad
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch
@@ -0,0 +1,44 @@
+From e06eec89a22719c38e257fe07afff18e359114cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Feb 2016 06:02:38 +0000
+Subject: [PATCH 2/2] check for uchar.h in configure
+
+Use ifdef to include uchar.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac        | 1 +
+ src/basic/missing.h | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index ecc3e6b..62f934e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -297,6 +297,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" = "xyes"])
+ 
+ # ------------------------------------------------------------------------------
+ 
++AC_CHECK_HEADERS([uchar.h], [], [])
+ AC_CHECK_HEADERS([sys/capability.h], [], [AC_MSG_ERROR([*** POSIX caps headers not found])])
+ AC_CHECK_HEADERS([linux/btrfs.h], [], [])
+ AC_CHECK_HEADERS([linux/memfd.h], [], [])
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index f704422..a1baa95 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -34,7 +34,9 @@
+ #include <stdlib.h>
+ #include <sys/resource.h>
+ #include <sys/syscall.h>
++#ifdef HAVE_UCHAR_H
+ #include <uchar.h>
++#endif
+ #include <unistd.h>
+ 
+ #ifdef HAVE_AUDIT
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch b/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
new file mode 100644
index 0000000..5797a29
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
@@ -0,0 +1,27 @@
+From 6cedbaee7964f6a6c61b9f2c8f0b87cef9370424 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Dec 2015 22:51:55 +0000
+Subject: [PATCH 26/38] include missing.h for getting secure_getenv definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/basic/user-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/user-util.c b/src/basic/user-util.c
+index 55672b3..22c4a23 100644
+--- a/src/basic/user-util.c
++++ b/src/basic/user-util.c
+@@ -38,6 +38,7 @@
+ #include "path-util.h"
+ #include "string-util.h"
+ #include "user-util.h"
++#include "missing.h"
+ 
+ bool uid_is_valid(uid_t uid) {
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/systemd/systemd/0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
new file mode 100644
index 0000000..96fc3d8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
@@ -0,0 +1,36 @@
+From 71e710a6c8a3879af7d50c4cb995e0615deba5c3 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Sat, 12 Sep 2015 19:56:52 +0000
+Subject: [PATCH 29/38] socket-util: don't fail if libc doesn't support IDN
+
+Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/basic/socket-util.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
+index 5851268..aefaca5 100644
+--- a/src/basic/socket-util.c
++++ b/src/basic/socket-util.c
+@@ -44,6 +44,15 @@
+ #include "string-util.h"
+ #include "user-util.h"
+ #include "util.h"
++/* Don't fail if the standard library
++ * doesn't support IDN */
++#ifndef NI_IDN
++#define NI_IDN 0
++#endif
++
++#ifndef NI_IDN_USE_STD3_ASCII_RULES
++#define NI_IDN_USE_STD3_ASCII_RULES 0
++#endif
+ 
+ int socket_address_parse(SocketAddress *a, const char *s) {
+         char *e, *n;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_229.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd_228.bb
rename to meta/recipes-core/systemd/systemd_229.bb
index b160816..16af0ac 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -24,35 +24,40 @@ SECTION = "base/shell"
 
 inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion
 
-SRCREV = "dd050decb6ad131ebdeabb71c4f9ecb4733269c0"
+SRCREV = "714c62b46379abb7558c544665522aca91691e10"
 
-PV = "228+git${SRCPV}"
+PV = "229+git${SRCPV}"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
-           file://0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
-           file://0006-configure-Check-for-additional-features-that-uclibc-.patch \
-           file://0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
-           file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
-           file://0009-implment-systemd-sysv-install-for-OE.patch \
-           file://0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch \
-           file://0011-rules-whitelist-hd-devices.patch \
-           file://0012-sysv-generator-add-support-for-executing-scripts-und.patch \
-           file://0013-Make-root-s-home-directory-configurable.patch \
-           file://0014-systemd-user-avoid-using-system-auth.patch \
-           file://0015-Revert-rules-remove-firmware-loading-rules.patch \
-           file://0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://0001-make-test-dir-configurable.patch \ 
-          "
+           file://0003-define-exp10-if-missing.patch \
+           file://0004-Use-getenv-when-secure-versions-are-not-available.patch \
+           file://0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
+           file://0006-configure-Check-for-additional-features-that-uclibc-.patch \
+           file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
+           file://0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
+           file://0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
+           file://0010-implment-systemd-sysv-install-for-OE.patch \
+           file://0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch \
+           file://0012-rules-whitelist-hd-devices.patch \
+           file://0013-sysv-generator-add-support-for-executing-scripts-und.patch \
+           file://0014-Make-root-s-home-directory-configurable.patch \
+           file://0015-systemd-user-avoid-using-system-auth.patch \
+           file://0016-Revert-rules-remove-firmware-loading-rules.patch \
+           file://0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
+           file://0018-make-test-dir-configurable.patch \
+           file://0019-remove-duplicate-include-uchar.h.patch \
+           file://0020-check-for-uchar.h-in-configure.patch \
+           file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
+           file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
+"
 SRC_URI_append_libc-uclibc = "\
-            file://0001-define-exp10-if-missing.patch \
-            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-            file://0003-Use-getenv-when-secure-versions-are-not-available.patch \
-           "
-SRC_URI_append_qemuall = " file://0004-core-device.c-Change-the-default-device-timeout-to-2.patch "
+           file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
+"
+SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 S = "${WORKDIR}/git"
 
@@ -60,13 +65,13 @@ LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "compat xz ldconfig \
+PACKAGECONFIG ??= "xz \
+                   ldconfig \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
                    ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'efi', '', d)} \
-                   sysusers \
                    binfmt \
                    randomseed \
                    machined \
@@ -74,7 +79,7 @@ PACKAGECONFIG ??= "compat xz ldconfig \
                    quotacheck \
                    bootchart \
                    hostnamed \
-                   myhostname \
+                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers', '', d)} \
                    hibernate \
                    timedated \
                    timesyncd \
@@ -86,7 +91,10 @@ PACKAGECONFIG ??= "compat xz ldconfig \
                    firstboot \
                    utmp \
                    polkit \
-                  "
+"
+PACKAGECONFIG_remove_libc-musl = "selinux"
+PACKAGECONFIG_remove_libc-musl = "smack"
+
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
@@ -133,7 +141,6 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
 PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
-PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[coredump] = "--enable-coredump,--disable-coredump"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
@@ -173,9 +180,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-firmware-path=/lib/firmware \
                  --with-testdir=${PTEST_PATH} \
                "
-# uclibc does not have NSS
-EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname --disable-sysusers"
-
 # per the systemd README, define VALGRIND=1 to run under valgrind
 CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
 
@@ -192,9 +196,6 @@ do_configure_prepend() {
 	else
 		cp -r ${S}/units ${S}/units.pre_sed
 	fi
-	sed -i '/ln --relative --help/d' ${S}/configure.ac
-	sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
-	sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
 }
 
 do_install() {
-- 
1.8.3.1


