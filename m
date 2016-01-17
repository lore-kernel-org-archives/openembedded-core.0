Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id C09CE731C8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:13 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id yy13so325927687pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cX6rqi8y6XHY0Ab4bc239zds840XdOVYzX3hjCgkLCc=;
	b=YYf4Ew1KVr3VdoHheEx4/gM4VwI3q6BA5Yy7aJqpki/uJV0TLzbEbmjSrLokEO5mYy
	uSMm1kK0+r4pzG2ruM0XObTkIGasn9bMKk3AUVw5zcMKPF52KC7CcgAfAed0dkdJuwzY
	sqLzofuFabttI3W4wgunq1cEhf4t0teYAIXSOwoyravrbAc4hzh46WosKq/avqDjWJVF
	8JuNvOK2wOYGmia4lFiQuo2cGd0I6It8L6b5XfL2E3ZM/XbK7EJ/Ocf7tFOntDf/DwAi
	6em/l9nOdYRX8+qjULPU6BMkxVipEtT6mE95fVW8Z0IVnAtIPBZ4Fnck1BWcexIdxVy/
	UYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=cX6rqi8y6XHY0Ab4bc239zds840XdOVYzX3hjCgkLCc=;
	b=B5A0D+Ogjh6yB2ykH8a/ILIrTOQ9DppeLT2eV5F9e1/H8J684MT10ojVRA4Mz3ypbq
	UhEhZ6+RXyC4TT8jwVDIwOwW/ilXfRNiPoRANsq61B5wvRg0mCp9ZAIp5NPUUsaT6BuI
	HWbISL4UDsX1JRdl2Vh8v7grSJYMTI2ja9wKdgEu14moBCWRt+CHdrTjo6nTmV+Cc/9m
	LevEmxqLQ9r2LB78LJF9xskX9S89bSRxMnFMdZCOdLJgtUHlS6W/maCA/XpFS5n5Vcog
	nHL17t6HCMeZRRMFcNnle8nYgwYXxHULWnG/oStMYhG1ggggQHY0SRKoHpwyeMeQl7KL
	0B8A==
X-Gm-Message-State: ALoCoQkVo4EFVgeb7TazkvTpUKXhcUdz6y56aUR+N4+bkcjprojJ+yV+MCy7BkgniRln4X+x5LCJu20hwhY8cffuy94yODvLKw==
X-Received: by 10.66.255.97 with SMTP id ap1mr28554962pad.135.1453030634266;
	Sun, 17 Jan 2016 03:37:14 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:48 -0800
Message-Id: <07d854174cf74c1a89798d2687fe8a374edac748.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 15/73] systemd: Update and fix build with uclibc
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/0001-define-exp10-if-missing.patch     |  4 +-
 ...r-getty-to-agetty-in-console-setup-system.patch |  4 +-
 ...pper-instead-of-looking-for-relative-opti.patch | 61 ++++++++++++++++++++++
 ...v-when-secure-versions-are-not-available.patch} | 21 ++++----
 ...c-Change-the-default-device-timeout-to-2.patch} |  4 +-
 ...-install-dependency-links-at-install-tim.patch} |  6 +--
 ...eck-for-additional-features-that-uclibc-.patch} | 12 ++---
 ...n-Use-execvpe-only-when-libc-supports-it.patch} |  4 +-
 ...unimplemented-_SC_PHYS_PAGES-system-conf.patch} |  4 +-
 ...010-implment-systemd-sysv-install-for-OE.patch} |  4 +-
 ...es-Build-conditionally-when-HAVE_MYHOSTN.patch} |  6 +--
 ...patch => 0012-rules-whitelist-hd-devices.patch} |  4 +-
 ...or-add-support-for-executing-scripts-und.patch} |  4 +-
 ...-Make-root-s-home-directory-configurable.patch} | 14 ++---
 ...015-systemd-user-avoid-using-system-auth.patch} |  4 +-
 ...vert-rules-remove-firmware-loading-rules.patch} |  4 +-
 ...remove-userspace-firmware-loading-suppor.patch} | 16 +++---
 ...sing.h-for-getting-secure_getenv-definiti.patch | 25 +++++++++
 ...il-don-t-fail-if-libc-doesn-t-support-IDN.patch | 34 ++++++++++++
 meta/recipes-core/systemd/systemd_228.bb           | 46 ++++++++--------
 20 files changed, 201 insertions(+), 80 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 rename meta/recipes-core/systemd/systemd/{0003-Use-getenv-when-secure-versions-are-not-available.patch => 0004-Use-getenv-when-secure-versions-are-not-available.patch} (56%)
 rename meta/recipes-core/systemd/systemd/{0004-core-device.c-Change-the-default-device-timeout-to-2.patch => 0005-core-device.c-Change-the-default-device-timeout-to-2.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch => 0006-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (92%)
 rename meta/recipes-core/systemd/systemd/{0006-configure-Check-for-additional-features-that-uclibc-.patch => 0007-configure-Check-for-additional-features-that-uclibc-.patch} (72%)
 rename meta/recipes-core/systemd/systemd/{0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch => 0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch => 0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0009-implment-systemd-sysv-install-for-OE.patch => 0010-implment-systemd-sysv-install-for-OE.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch => 0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0011-rules-whitelist-hd-devices.patch => 0012-rules-whitelist-hd-devices.patch} (91%)
 rename meta/recipes-core/systemd/systemd/{0012-sysv-generator-add-support-for-executing-scripts-und.patch => 0013-sysv-generator-add-support-for-executing-scripts-und.patch} (98%)
 rename meta/recipes-core/systemd/systemd/{0013-Make-root-s-home-directory-configurable.patch => 0014-Make-root-s-home-directory-configurable.patch} (95%)
 rename meta/recipes-core/systemd/systemd/{0014-systemd-user-avoid-using-system-auth.patch => 0015-systemd-user-avoid-using-system-auth.patch} (87%)
 rename meta/recipes-core/systemd/systemd/{0015-Revert-rules-remove-firmware-loading-rules.patch => 0016-Revert-rules-remove-firmware-loading-rules.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (96%)
 create mode 100644 meta/recipes-core/systemd/systemd/0018-include-missing.h-for-getting-secure_getenv-definiti.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch b/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
index 8bb775f..2822169 100644
--- a/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
+++ b/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
@@ -1,7 +1,7 @@
-From ddad25c809846e08ea39bef49cc668f95d53304a Mon Sep 17 00:00:00 2001
+From 9c89ac1ecb76d25511c146e1b641a7d5237c4be0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 00:42:49 +0000
-Subject: [PATCH 01/16] define exp10 if missing
+Subject: [PATCH 01/37] define exp10 if missing
 
 Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
 
diff --git a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
index 55ff0ce..451193e 100644
--- a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
+++ b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
@@ -1,7 +1,7 @@
-From bfb6562cdbec73d03765ce707e9e0cac138fd223 Mon Sep 17 00:00:00 2001
+From 32409e584db04c9f7c2cadd39b8ccb580db5c83c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:29:15 +0000
-Subject: [PATCH 02/16] units: Prefer getty to agetty in console setup systemd
+Subject: [PATCH 02/37] units: Prefer getty to agetty in console setup systemd
  units
 
 Upstream-Status: Inappropriate [configuration specific]
diff --git a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
new file mode 100644
index 0000000..4ac9321
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -0,0 +1,61 @@
+From 123b979f36d2db8900e602ea8053c2372cecdd26 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Dec 2015 04:20:28 +0000
+Subject: [PATCH 03/37] use lnr wrapper instead of looking for --relative
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
+index 00a92e3..f332b79 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -251,7 +251,7 @@ define move-to-rootlibdir
+ 		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
+ 		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
+ 		rm -f $(DESTDIR)$(libdir)/$$libname && \
+-		$(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
++		lnr $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
+ 		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
+ 	fi
+ endef
+@@ -325,7 +325,7 @@ define install-relative-aliases
+ 	while [ -n "$$1" ]; do \
+ 		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
+ 		rm -f $(DESTDIR)$$dir/$$2 && \
+-		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
++		lnr $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
+ 		shift 2 || exit $$?; \
+ 	done
+ endef
+@@ -2806,7 +2806,7 @@ systemd_dbus1_generator_LDADD = \
+ dbus1-generator-install-hook:
+ 	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
+ 	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+-	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
++	$(AM_V_LN)lnr $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+ 
+ dbus1-generator-uninstall-hook:
+ 	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+diff --git a/configure.ac b/configure.ac
+index 3128ca8..f7aa12a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
+ 
+-AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
+-
+ M4_DEFINES=
+ 
+ AC_CHECK_TOOL(OBJCOPY, objcopy)
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
similarity index 56%
rename from meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch
rename to meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
index cbf69d1..ad898b8 100644
--- a/meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch
+++ b/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
@@ -1,7 +1,7 @@
-From 9e79bb4bea758f25803e9f7ff2c5835ac4204230 Mon Sep 17 00:00:00 2001
+From 3d1fb8d7c0a8d4b2f256eab86905fe569d41065d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Sep 2015 19:10:04 +0000
-Subject: [PATCH 03/16] Use getenv when secure versions are not available
+Subject: [PATCH 04/37] Use getenv when secure versions are not available
 
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
+index 09a233b..ab6ff8d 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -582,13 +582,14 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+@@ -582,12 +582,11 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
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
 2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0005-core-device.c-Change-the-default-device-timeout-to-2.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch
rename to meta/recipes-core/systemd/systemd/0005-core-device.c-Change-the-default-device-timeout-to-2.patch
index 74629fc..0414b0c 100644
--- a/meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ b/meta/recipes-core/systemd/systemd/0005-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -1,7 +1,7 @@
-From ef867afd27e8fed558e82430759d8d2c7efb6608 Mon Sep 17 00:00:00 2001
+From 118be6eb12746750018c5068ab63003ef63525db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 04:09:19 +0000
-Subject: [PATCH 04/16] core/device.c: Change the default device timeout to 240
+Subject: [PATCH 05/37] core/device.c: Change the default device timeout to 240
  sec.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
diff --git a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0006-binfmt-Don-t-install-dependency-links-at-install-tim.patch
similarity index 92%
rename from meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
rename to meta/recipes-core/systemd/systemd/0006-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 0b75fac..a5e790f 100644
--- a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0006-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,7 +1,7 @@
-From 319873d22a6b1225ae41aa38bc976e723326ba20 Mon Sep 17 00:00:00 2001
+From dad101dfad17312581ba25b09be84c1dc9b72041 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:03:44 +0000
-Subject: [PATCH 05/16] binfmt: Don't install dependency links at install time
+Subject: [PATCH 06/37] binfmt: Don't install dependency links at install time
  for the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 00a92e3..4c1143a 100644
+index f332b79..c62d459 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -4455,10 +4455,6 @@ INSTALL_DIRS += \
diff --git a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch b/meta/recipes-core/systemd/systemd/0007-configure-Check-for-additional-features-that-uclibc-.patch
similarity index 72%
rename from meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
rename to meta/recipes-core/systemd/systemd/0007-configure-Check-for-additional-features-that-uclibc-.patch
index a2c40b5..a2d97b7 100644
--- a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-configure-Check-for-additional-features-that-uclibc-.patch
@@ -1,7 +1,7 @@
-From d1fe5d2dd38cdef984296f453c65ccaebb71d1a9 Mon Sep 17 00:00:00 2001
+From 4425894feddbbaedfa1fd7776d40b42feb871a74 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:05:45 +0000
-Subject: [PATCH 06/16] configure: Check for additional features that uclibc
+Subject: [PATCH 07/37] configure: Check for additional features that uclibc
  doesnt support
 
 This helps in supporting uclibc which does not have all features that
@@ -15,12 +15,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 3128ca8..49f73a4 100644
+index f7aa12a..0f75cb2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -112,6 +112,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
- 
- AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
+@@ -110,6 +110,24 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
  
 +# check for few functions not implemented in uClibc
 +
diff --git a/meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch
rename to meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
index 85d3907..72d2f14 100644
--- a/meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch
+++ b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
@@ -1,7 +1,7 @@
-From 529e7e2f7f6a5dc0e4527ff5c2237b19ece2f112 Mon Sep 17 00:00:00 2001
+From 75e4d779c9681a61777ac6eb4571e7a7434fe13c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:10:37 +0000
-Subject: [PATCH 07/16] nspawn: Use execvpe only when libc supports it
+Subject: [PATCH 08/37] nspawn: Use execvpe only when libc supports it
 
 Upstream-Status: Denied [no desire for uclibc support]
 
diff --git a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch b/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
rename to meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
index 8d71ecb..3a1ee2a 100644
--- a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
+++ b/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
@@ -1,7 +1,7 @@
-From 83944758dc0703afea81f3c7aa0ad926bc5df757 Mon Sep 17 00:00:00 2001
+From abdd9c23e0d17fa97ee8148770481a2877f9b60a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 00:47:53 +0000
-Subject: [PATCH 08/16] util: bypass unimplemented _SC_PHYS_PAGES system
+Subject: [PATCH 09/37] util: bypass unimplemented _SC_PHYS_PAGES system
  configuration API on uclibc
 
 Upstream-Status: Inappropriate [uclibc-specific]
diff --git a/meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch
rename to meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
index a139684..0ef642b 100644
--- a/meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
@@ -1,7 +1,7 @@
-From 81c3d92b5bc5786cbd93b1e5ed82884e8caf2254 Mon Sep 17 00:00:00 2001
+From dc37aa73dd37625bf1c516a85263cda7dc24de1f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 09/16] implment systemd-sysv-install for OE
+Subject: [PATCH 10/37] implment systemd-sysv-install for OE
 
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
diff --git a/meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
rename to meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
index 8cec071..87d1d74 100644
--- a/meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
+++ b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
@@ -1,7 +1,7 @@
-From d4b7f9b771a538c2356c4c77461f3b4790043556 Mon Sep 17 00:00:00 2001
+From ea87f3675829724158f3b14aa712e7a56e1f2202 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 00:50:01 +0000
-Subject: [PATCH 10/16] nss-mymachines: Build conditionally when
+Subject: [PATCH 11/37] nss-mymachines: Build conditionally when
  HAVE_MYHOSTNAME is set
 
 Fixes build failures when building with --disable-myhostname
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4c1143a..cf559be 100644
+index c62d459..c74cb43 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -4961,6 +4961,7 @@ SYSTEM_UNIT_ALIASES += \
diff --git a/meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
similarity index 91%
rename from meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch
rename to meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
index 03fdbff..e63cceb 100644
--- a/meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
@@ -1,7 +1,7 @@
-From ae6c9dcb00919e1dd2793fd1b82125d123f69a90 Mon Sep 17 00:00:00 2001
+From 346ff06084ba4f9a8b91717df3388d90bc8f0876 Mon Sep 17 00:00:00 2001
 From: Patrick Ohly <patrick.ohly@intel.com>
 Date: Wed, 16 Sep 2015 13:55:58 +0200
-Subject: [PATCH 11/16] rules: whitelist hd* devices
+Subject: [PATCH 12/37] rules: whitelist hd* devices
 
 qemu by default emulates IDE and the linux-yocto kernel(s) use
 CONFIG_IDE instead of the more modern libsata, so disks appear as
diff --git a/meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
similarity index 98%
rename from meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch
rename to meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
index 82feff0..476ed05 100644
--- a/meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch
+++ b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
@@ -1,7 +1,7 @@
-From 9e6c907ff1f17deb96c66a607653db4c7da34289 Mon Sep 17 00:00:00 2001
+From 0049d2c4f21c22191e023a8eb8e9157783f26ab5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 05:09:53 +0000
-Subject: [PATCH 12/16] sysv-generator: add support for executing scripts under
+Subject: [PATCH 13/37] sysv-generator: add support for executing scripts under
  /etc/rcS.d/
 
 To be compatible, all services translated from scripts under /etc/rcS.d would
diff --git a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
similarity index 95%
rename from meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
rename to meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
index ea0b3e2..a0c796a 100644
--- a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
@@ -1,7 +1,7 @@
-From 1ba00ff6ed3f0626892f57cdd8d9788692c7bf14 Mon Sep 17 00:00:00 2001
+From 197215f360821b1f892ec31145dd7cd1bf66810a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 05:18:20 +0000
-Subject: [PATCH 13/16] Make root's home directory configurable
+Subject: [PATCH 14/37] Make root's home directory configurable
 
 OpenEmbedded has a configurable home directory for root. Allow
 systemd to be built using its idea of what root's home directory
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 20 insertions(+), 11 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index cf559be..a511c3d 100644
+index c74cb43..2cc61ac 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -210,6 +210,7 @@ AM_CPPFLAGS = \
@@ -46,10 +46,10 @@ index cf559be..a511c3d 100644
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
 diff --git a/configure.ac b/configure.ac
-index 49f73a4..a3e639d 100644
+index 0f75cb2..20a921e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1434,6 +1434,11 @@ AC_ARG_WITH([rootlibdir],
+@@ -1432,6 +1432,11 @@ AC_ARG_WITH([rootlibdir],
          [with_rootlibdir=${libdir}])
  AX_NORMALIZE_PATH([with_rootlibdir])
  
@@ -61,7 +61,7 @@ index 49f73a4..a3e639d 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1517,6 +1522,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1515,6 +1520,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
@@ -69,7 +69,7 @@ index 49f73a4..a3e639d 100644
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1606,6 +1612,7 @@ AC_MSG_RESULT([
+@@ -1604,6 +1610,7 @@ AC_MSG_RESULT([
          includedir:              ${includedir}
          lib dir:                 ${libdir}
          rootlib dir:             ${with_rootlibdir}
diff --git a/meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
similarity index 87%
rename from meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch
rename to meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
index 11be097..cae93e3 100644
--- a/meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch
+++ b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
@@ -1,7 +1,7 @@
-From 548a8d5d456c531444498b3ce8cec3f3dd374cf8 Mon Sep 17 00:00:00 2001
+From 86d38ea2128332975342175a8349e3919a6b2ab5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:26:25 +0000
-Subject: [PATCH 14/16] systemd-user: avoid using system-auth
+Subject: [PATCH 15/37] systemd-user: avoid using system-auth
 
 In OE, we don't provide system-auth, instead, we use common-* files.
 So modify systemd-user file to use common-* files.
diff --git a/meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch b/meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch
rename to meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
index 7cc3922..5fccc1d 100644
--- a/meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
@@ -1,7 +1,7 @@
-From 6b2b8d20f884bd5a3d928175e422023f6c9d056b Mon Sep 17 00:00:00 2001
+From 2ca57f968c29a26d67e3a7a3bc3217ac1f886b55 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Thu, 19 Mar 2015 15:01:29 +1100
-Subject: [PATCH 15/16] Revert "rules: remove firmware loading rules"
+Subject: [PATCH 16/37] Revert "rules: remove firmware loading rules"
 
 This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
 Userspace firmware loading support is needed for Linux < 3.7.
diff --git a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
similarity index 96%
rename from meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
rename to meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 6e5a8fb..93b4fa3 100644
--- a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -1,7 +1,7 @@
-From d3661ec7fb4557c47f001986cbb8a684b8dbae4a Mon Sep 17 00:00:00 2001
+From 6dba4a34e1685eacf1524704e5bcfe290864ee17 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 05:33:32 +0000
-Subject: [PATCH 16/16] Revert "udev: remove userspace firmware loading
+Subject: [PATCH 17/37] Revert "udev: remove userspace firmware loading
  support"
 
 This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
@@ -15,16 +15,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
+index 2cc61ac..db9d204 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -3650,6 +3650,18 @@ libudev_core_la_LIBADD = \
@@ -81,10 +81,10 @@ index 369805f..ce97674 100644
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
 diff --git a/configure.ac b/configure.ac
-index a3e639d..00736f5 100644
+index 20a921e..1bde875 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1317,6 +1317,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
+@@ -1315,6 +1315,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
  AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
  
  # ------------------------------------------------------------------------------
@@ -110,7 +110,7 @@ index a3e639d..00736f5 100644
  have_manpages=no
  AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable manpages]))
  AS_IF([test "x$enable_manpages" != xno], [
-@@ -1616,6 +1635,9 @@ AC_MSG_RESULT([
+@@ -1614,6 +1633,9 @@ AC_MSG_RESULT([
          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
diff --git a/meta/recipes-core/systemd/systemd/0018-include-missing.h-for-getting-secure_getenv-definiti.patch b/meta/recipes-core/systemd/systemd/0018-include-missing.h-for-getting-secure_getenv-definiti.patch
new file mode 100644
index 0000000..7e9132c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0018-include-missing.h-for-getting-secure_getenv-definiti.patch
@@ -0,0 +1,25 @@
+From a2bfd7e43780eccc5a1100f51604a513e050d460 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Dec 2015 22:51:55 +0000
+Subject: [PATCH 18/37] include missing.h for getting secure_getenv definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/user-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/user-util.c b/src/basic/user-util.c
+index c3d0ec3..e0755e7 100644
+--- a/src/basic/user-util.c
++++ b/src/basic/user-util.c
+@@ -40,6 +40,7 @@
+ #include "path-util.h"
+ #include "string-util.h"
+ #include "user-util.h"
++#include "missing.h"
+ 
+ bool uid_is_valid(uid_t uid) {
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
new file mode 100644
index 0000000..e92b668
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
@@ -0,0 +1,34 @@
+From 41626df8d8e159cc958d483f7059f94583ab0795 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Sat, 12 Sep 2015 19:56:52 +0000
+Subject: [PATCH 19/37] socket-util: don't fail if libc doesn't support IDN
+
+Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/socket-util.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
+index be144e1..45538da 100644
+--- a/src/basic/socket-util.c
++++ b/src/basic/socket-util.c
+@@ -46,6 +46,15 @@
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
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index aa2e846..0c6fbde 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -24,34 +24,37 @@ SECTION = "base/shell"
 
 inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
-SRCREV = "dd050decb6ad131ebdeabb71c4f9ecb4733269c0"
+SRCREV = "720e593603dbfc2d2b2a7b9f6e911ad7f09c61b2"
 
 PV = "228+git${SRCPV}"
 
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
+           file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
+           file://0004-Use-getenv-when-secure-versions-are-not-available.patch \
+           file://0006-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
+           file://0007-configure-Check-for-additional-features-that-uclibc-.patch \
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
+           file://0018-include-missing.h-for-getting-secure_getenv-definiti.patch \
+           file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
           "
 SRC_URI_append_libc-uclibc = "\
-            file://0001-define-exp10-if-missing.patch \
-            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-            file://0003-Use-getenv-when-secure-versions-are-not-available.patch \
-           "
-SRC_URI_append_qemuall = " file://0004-core-device.c-Change-the-default-device-timeout-to-2.patch "
+           file://0001-define-exp10-if-missing.patch \
+           file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
+          "
+SRC_URI_append_qemuall = " file://0005-core-device.c-Change-the-default-device-timeout-to-2.patch "
 
 S = "${WORKDIR}/git"
 
@@ -131,6 +134,10 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname --disable-sysusers"
 
+EXTRA_OECONF_append_libc-musl = "\
+            --disable-selinux --disable-smack --disable-myhostname \
+            --disable-sysusers \
+           "
 # per the systemd README, define VALGRIND=1 to run under valgrind
 CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
 
@@ -147,9 +154,6 @@ do_configure_prepend() {
 	else
 		cp -r ${S}/units ${S}/units.pre_sed
 	fi
-	sed -i '/ln --relative --help/d' ${S}/configure.ac
-	sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
-	sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
 }
 
 do_install() {
-- 
2.7.0


