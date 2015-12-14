Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id B90607317D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:23:22 +0000 (UTC)
Received: by qkdp187 with SMTP id p187so121559146qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 22:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=XNreM6L3nF0x8C3aKEqzPUJHDnL/zYlFZOipfHu/Dtk=;
	b=yNTfX6M2at+mwQ0FHPhRK9oihXiXXI8UR/EtG4GDXocEuZo1gDSKDennKqBOjf0Idc
	ye54Dd2Ys3B5jeBqQtHT8BBJfjkgADX9hSp7+BsBvluOSYApodw6czLZHAll+SFLa6xo
	uExImkg2/nVJrWaSvrdgZrY2Q0FIOPCmR9Di7JQyi0PMQNIqBTZbSXBIjO2fvX9yZSIS
	H/Xg/dmFiiIvaZ5cZSKqt3KzukOnUH0oqU0M+zYTheZLirrVM/8EEqbgv1oqyEHKC+k5
	xFXPAQhkb7bpzQc1a8zIWdOMU2ra9cTuVasyFFsy15jZ9fJC18bzH0Zgyl3MNP0oFy+L
	3/tg==
X-Received: by 10.55.77.17 with SMTP id a17mr39562503qkb.40.1450074202735;
	Sun, 13 Dec 2015 22:23:22 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	s105sm13252860qge.40.2015.12.13.22.23.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Dec 2015 22:23:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 06:23:12 +0000
Message-Id: <6c5db9084bed25c8ae9fb93cfe2e3d0ba76121d2.1450073907.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
References: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] systemd: Upgrade to 228
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
X-List-Received-Date: Mon, 14 Dec 2015 06:23:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Forward port all patches and format them to be git am'able
Drop patches specific to uclibc's missing features which now
are there in uclibc-ng

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/0001-define-exp10-if-missing.patch     |  33 +++++
 .../systemd/0001-fix-build-on-uClibc-exp10.patch   |  22 ---
 ...-getty-to-agetty-in-console-setup-system.patch} |   6 +-
 ...v-when-secure-versions-are-not-available.patch} |  11 +-
 ...c-Change-the-default-device-timeout-to-2.patch} |  22 +--
 ...-install-dependency-links-at-install-tim.patch} |  35 ++---
 ...eck-for-additional-features-that-uclibc-.patch} |  17 ++-
 ...nal-Use-posix-fallocate-only-if-available.patch |  96 --------------
 ...n-Use-execvpe-only-when-libc-supports-it.patch} |  31 +++--
 ...til-Use-mkostemp-only-if-libc-supports-it.patch |  42 ------
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |  16 +--
 ...009-implment-systemd-sysv-install-for-OE.patch} |  15 ++-
 ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  38 ++++++
 ...patch => 0011-rules-whitelist-hd-devices.patch} |   6 +-
 ...or-add-support-for-executing-scripts-und.patch} |  68 +++++-----
 ...-Make-root-s-home-directory-configurable.patch} | 147 +++++++++++----------
 ...014-systemd-user-avoid-using-system-auth.patch} |  25 ++--
 ...vert-rules-remove-firmware-loading-rules.patch} |   6 +-
 ...remove-userspace-firmware-loading-suppor.patch} | 132 +++++++++---------
 .../systemd/{systemd_225.bb => systemd_228.bb}     |  44 +++---
 20 files changed, 371 insertions(+), 441 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
 rename meta/recipes-core/systemd/systemd/{0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch => 0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0022-Use-getenv-when-secure-versions-are-not-available.patch => 0003-Use-getenv-when-secure-versions-are-not-available.patch} (79%)
 rename meta/recipes-core/systemd/systemd/{qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch => 0004-core-device.c-Change-the-default-device-timeout-to-2.patch} (65%)
 rename meta/recipes-core/systemd/systemd/{0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch => 0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (65%)
 rename meta/recipes-core/systemd/systemd/{0004-configure-Check-for-additional-features-that-uclibc-.patch => 0006-configure-Check-for-additional-features-that-uclibc-.patch} (76%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
 rename meta/recipes-core/systemd/systemd/{0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch => 0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch} (50%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
 rename meta/recipes-core/systemd/systemd/{0012-implment-systemd-sysv-install-for-OE.patch => 0009-implment-systemd-sysv-install-for-OE.patch} (75%)
 create mode 100644 meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
 rename meta/recipes-core/systemd/systemd/{rules-whitelist-hd-devices.patch => 0011-rules-whitelist-hd-devices.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0009-sysv-generator-add-support-for-executing-scripts-und.patch => 0012-sysv-generator-add-support-for-executing-scripts-und.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0010-Make-root-s-home-directory-configurable.patch => 0013-Make-root-s-home-directory-configurable.patch} (64%)
 rename meta/recipes-core/systemd/systemd/{0011-systemd-user-avoid-using-system-auth.patch => 0014-systemd-user-avoid-using-system-auth.patch} (54%)
 rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch => 0015-Revert-rules-remove-firmware-loading-rules.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (79%)
 rename meta/recipes-core/systemd/{systemd_225.bb => systemd_228.bb} (93%)

diff --git a/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch b/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
new file mode 100644
index 0000000..8bb775f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
@@ -0,0 +1,33 @@
+From ddad25c809846e08ea39bef49cc668f95d53304a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Dec 2015 00:42:49 +0000
+Subject: [PATCH 01/16] define exp10 if missing
+
+Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
+
+exp10 extension is not part of uClibc, so compute it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/missing.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index d539ed0..09a233b 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -1125,3 +1125,8 @@ static inline key_serial_t request_key(const char *type, const char *description
+ #ifndef KEY_SPEC_USER_KEYRING
+ #define KEY_SPEC_USER_KEYRING -4
+ #endif
++
++#ifdef __UCLIBC__
++/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
++#define exp10(x) (exp((x) * log(10)))
++#endif /* __UCLIBC__ */
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch b/meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
deleted file mode 100644
index 76ce4b7..0000000
--- a/meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
-
-exp10 extension is not part of uClibc, so compute it.
-
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/src/basic/missing.h
-===================================================================
---- git.orig/src/basic/missing.h
-+++ git/src/basic/missing.h
-@@ -1036,3 +1036,8 @@ static inline int kcmp(pid_t pid1, pid_t
- #ifndef INPUT_PROP_ACCELEROMETER
- #define INPUT_PROP_ACCELEROMETER  0x06
- #endif
-+
-+#ifdef __UCLIBC__
-+/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
-+#define exp10(x) (exp((x) * log(10)))
-+#endif /* __UCLIBC__ */
diff --git a/meta/recipes-core/systemd/systemd/0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch
rename to meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
index b6ab5ef..55ff0ce 100644
--- a/meta/recipes-core/systemd/systemd/0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch
+++ b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
@@ -1,7 +1,7 @@
-From 100e50604efc4032001a2de6a6b47853c0003817 Mon Sep 17 00:00:00 2001
+From bfb6562cdbec73d03765ce707e9e0cac138fd223 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:29:15 +0000
-Subject: [PATCH 01/11] units: Prefer getty to agetty in console setup systemd
+Subject: [PATCH 02/16] units: Prefer getty to agetty in console setup systemd
  units
 
 Upstream-Status: Inappropriate [configuration specific]
@@ -40,5 +40,5 @@ index 4522d0d..e6d499d 100644
  Restart=always
  UtmpIdentifier=%I
 -- 
-2.1.4
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch
similarity index 79%
rename from meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
rename to meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch
index 5af78d5..cbf69d1 100644
--- a/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
+++ b/meta/recipes-core/systemd/systemd/0003-Use-getenv-when-secure-versions-are-not-available.patch
@@ -1,7 +1,7 @@
-From cb71e4beea3b3b11e5951f95c829cd2eee9fcf7b Mon Sep 17 00:00:00 2001
+From 9e79bb4bea758f25803e9f7ff2c5835ac4204230 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Sep 2015 19:10:04 +0000
-Subject: [PATCH 22/31] Use getenv when secure versions are not available
+Subject: [PATCH 03/16] Use getenv when secure versions are not available
 
 musl doesnt implement secure version, so we default
 to it if configure does not detect a secure imeplementation
@@ -9,15 +9,14 @@ to it if configure does not detect a secure imeplementation
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Denied
 ---
-
  src/basic/missing.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index bf9b490..d6dbc7d 100644
+index 09a233b..3c37466 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -584,13 +584,14 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+@@ -582,13 +582,14 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
          return syscall(__NR_name_to_handle_at, fd, name, handle, mnt_id, flags);
  }
  #endif
@@ -35,5 +34,5 @@ index bf9b490..d6dbc7d 100644
  
  #ifndef CIFS_MAGIC_NUMBER
 -- 
-2.5.2
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch
similarity index 65%
rename from meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch
rename to meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch
index c7e1711..74629fc 100644
--- a/meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ b/meta/recipes-core/systemd/systemd/0004-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -1,23 +1,25 @@
-Upstream-Status: Inappropriate [Specific case QEMU/AB]
-
-From 7b8c4e0a67a79a75e1bd77df3a452a5497322108 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Thu, 27 Aug 2015 17:58:26 -0500
-Subject: [PATCH] core/device.c: Change the default device timeout to 240 sec.
+From ef867afd27e8fed558e82430759d8d2c7efb6608 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Dec 2015 04:09:19 +0000
+Subject: [PATCH 04/16] core/device.c: Change the default device timeout to 240
+ sec.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+Upstream-Status: Inappropriate [Specific case QEMU/AB]
+
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/core/device.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/core/device.c b/src/core/device.c
-index e7efcf0..4ed8f08 100644
+index bcd4d11..f41bb54 100644
 --- a/src/core/device.c
 +++ b/src/core/device.c
-@@ -110,7 +110,7 @@ static void device_init(Unit *u) {
+@@ -114,7 +114,7 @@ static void device_init(Unit *u) {
           * indefinitely for plugged in devices, something which cannot
           * happen for the other units since their operations time out
           * anyway. */
@@ -25,7 +27,7 @@ index e7efcf0..4ed8f08 100644
 +        u->job_timeout = (240 * USEC_PER_SEC);
  
          u->ignore_on_isolate = true;
-         u->ignore_on_snapshot = true;
+ }
 -- 
-1.9.1
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
similarity index 65%
rename from meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
rename to meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 0e20fd0..0b75fac 100644
--- a/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,7 +1,7 @@
-From 184a89caacfa00f07e7275bca592bd7dda1b541e Mon Sep 17 00:00:00 2001
+From 319873d22a6b1225ae41aa38bc976e723326ba20 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:03:44 +0000
-Subject: [PATCH 03/11] binfmt: Don't install dependency links at install time
+Subject: [PATCH 05/16] binfmt: Don't install dependency links at install time
  for the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
@@ -23,11 +23,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  units/systemd-binfmt.service.in         | 5 +++++
  3 files changed, 8 insertions(+), 4 deletions(-)
 
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -4271,10 +4271,6 @@ INSTALL_DIRS += \
+diff --git a/Makefile.am b/Makefile.am
+index 00a92e3..4c1143a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4455,10 +4455,6 @@ INSTALL_DIRS += \
  	$(prefix)/lib/binfmt.d \
  	$(sysconfdir)/binfmt.d
  
@@ -38,10 +38,10 @@ Index: git/Makefile.am
  endif
  
  EXTRA_DIST += \
-Index: git/units/proc-sys-fs-binfmt_misc.automount
-===================================================================
---- git.orig/units/proc-sys-fs-binfmt_misc.automount
-+++ git/units/proc-sys-fs-binfmt_misc.automount
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 6be3893..709adef 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
 @@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/proc/sys/
  
  [Automount]
@@ -49,11 +49,11 @@ Index: git/units/proc-sys-fs-binfmt_misc.automount
 +
 +[Install]
 +WantedBy=sysinit.target
-Index: git/units/systemd-binfmt.service.in
-===================================================================
---- git.orig/units/systemd-binfmt.service.in
-+++ git/units/systemd-binfmt.service.in
-@@ -11,6 +11,8 @@ Documentation=man:systemd-binfmt.service
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index d53073e..8c57ee0 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
+@@ -11,6 +11,8 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
  Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
  DefaultDependencies=no
  Conflicts=shutdown.target
@@ -69,3 +69,6 @@ Index: git/units/systemd-binfmt.service.in
 +
 +[Install]
 +WantedBy=sysinit.target
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch b/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
similarity index 76%
rename from meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
rename to meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
index 8078da9..a2c40b5 100644
--- a/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
+++ b/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
@@ -1,7 +1,7 @@
-From 4e2e8dbf3f23ab7dca32286cc0f37bff6ac49e22 Mon Sep 17 00:00:00 2001
+From d1fe5d2dd38cdef984296f453c65ccaebb71d1a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:05:45 +0000
-Subject: [PATCH 04/11] configure: Check for additional features that uclibc
+Subject: [PATCH 06/16] configure: Check for additional features that uclibc
  doesnt support
 
 This helps in supporting uclibc which does not have all features that
@@ -14,11 +14,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)
 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -110,6 +110,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/
+diff --git a/configure.ac b/configure.ac
+index 3128ca8..49f73a4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -112,6 +112,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
  
  AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
  
@@ -43,3 +43,6 @@ Index: git/configure.ac
  M4_DEFINES=
  
  AC_CHECK_TOOL(OBJCOPY, objcopy)
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch b/meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
deleted file mode 100644
index 631dd77..0000000
--- a/meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 34a61b6c9eed3fad360066fb63132ebc7e0aaaa6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:12:48 +0000
-Subject: [PATCH 06/11] journal: Use posix fallocate only if available
-
-Some architecture ports in uclibc did not support it in past
-
-Upstream-Status: Denied [no desire for uclibc support]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/journal/journal-file.c  | 16 +++++++++++++++-
- src/journal/journald-kmsg.c | 15 ++++++++++++++-
- 2 files changed, 29 insertions(+), 2 deletions(-)
-
-diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
-index 2845e05..9431171 100644
---- a/src/journal/journal-file.c
-+++ b/src/journal/journal-file.c
-@@ -36,6 +36,8 @@
- #include "compress.h"
- #include "fsprg.h"
- 
-+#include "config.h"
-+
- #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
- #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
- 
-@@ -354,7 +356,7 @@ static int journal_file_fstat(JournalFile *f) {
- 
- static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
-         uint64_t old_size, new_size;
--        int r;
-+        int r = 0;
- 
-         assert(f);
- 
-@@ -418,9 +420,21 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
-         /* Note that the glibc fallocate() fallback is very
-            inefficient, hence we try to minimize the allocation area
-            as we can. */
-+#ifdef HAVE_POSIX_FALLOCATE
-         r = posix_fallocate(f->fd, old_size, new_size - old_size);
-         if (r != 0)
-                 return -r;
-+#else
-+        /* Write something every 512 bytes to make sure the block is allocated */
-+        uint64_t len = new_size - old_size;
-+        uint64_t offset = old_size;
-+        for (offset += (len-1) % 512; len > 0; offset += 512) {
-+                len -= 512;
-+                if (pwrite(f->fd, "", 1, offset) != 1)
-+                        return -errno;
-+        }
-+
-+#endif /* HAVE_POSIX_FALLOCATE */
- 
-         f->header->arena_size = htole64(new_size - le64toh(f->header->header_size));
- 
-diff --git a/src/journal/journald-kmsg.c b/src/journal/journald-kmsg.c
-index c4216c4..a998ed5 100644
---- a/src/journal/journald-kmsg.c
-+++ b/src/journal/journald-kmsg.c
-@@ -436,6 +436,7 @@ fail:
- int server_open_kernel_seqnum(Server *s) {
-         _cleanup_close_ int fd;
-         uint64_t *p;
-+        int r = 0;
- 
-         assert(s);
- 
-@@ -449,7 +450,19 @@ int server_open_kernel_seqnum(Server *s) {
-                 return 0;
-         }
- 
--        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
-+#ifdef HAVE_POSIX_FALLOCATE
-+        r = posix_fallocate(fd, 0, sizeof(uint64_t));
-+#else
-+        /* Use good old method to write zeros into the journal file
-+           perhaps very inefficient yet working. */
-+        char *buf = alloca(sizeof(uint64_t));
-+        off_t oldpos = lseek(fd, 0, SEEK_CUR);
-+        bzero(buf, sizeof(uint64_t));
-+        lseek(fd, 0, SEEK_SET);
-+        r = write(fd, buf, sizeof(uint64_t));
-+        lseek(fd, oldpos, SEEK_SET);
-+#endif /* HAVE_POSIX_FALLOCATE */
-+        if (r < 0) {
-                 log_error_errno(errno, "Failed to allocate sequential number file, ignoring: %m");
-                 return 0;
-         }
--- 
-2.1.4
-
diff --git a/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch
similarity index 50%
rename from meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
rename to meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch
index 55a0088..85d3907 100644
--- a/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
+++ b/meta/recipes-core/systemd/systemd/0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch
@@ -1,7 +1,7 @@
-From a7417c2e6950d55c22c1b0d15783898b8ff229ef Mon Sep 17 00:00:00 2001
+From 529e7e2f7f6a5dc0e4527ff5c2237b19ece2f112 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:10:37 +0000
-Subject: [PATCH 05/11] nspawn: Use execvpe only when libc supports it
+Subject: [PATCH 07/16] nspawn: Use execvpe only when libc supports it
 
 Upstream-Status: Denied [no desire for uclibc support]
 
@@ -10,29 +10,32 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/nspawn/nspawn.c | 7 +++++++
  1 file changed, 7 insertions(+)
 
-Index: git/src/nspawn/nspawn.c
-===================================================================
---- git.orig/src/nspawn/nspawn.c
-+++ git/src/nspawn/nspawn.c
-@@ -143,6 +143,8 @@ typedef struct CustomMount {
-         char **lower;
- } CustomMount;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index a4e13bd..4def6ba 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -112,6 +112,8 @@ typedef enum LinkJournal {
+         LINK_GUEST
+ } LinkJournal;
  
 +#include "config.h"
 +
  static char *arg_directory = NULL;
  static char *arg_template = NULL;
  static char *arg_user = NULL;
-@@ -4238,7 +4240,12 @@ static int inner_child(
+@@ -2595,7 +2597,12 @@ static int inner_child(
                  a[0] = (char*) "/sbin/init";
                  execve(a[0], a, env_use);
-         } else if (argc > optind)
+         } else if (!strv_isempty(arg_parameters))
 +#ifdef HAVE_EXECVPE
-                 execvpe(argv[optind], argv + optind, env_use);
+                 execvpe(arg_parameters[0], arg_parameters, env_use);
 +#else
 +                environ = env_use;
-+                execvp(argv[optind], argv + optind);
++                execvp(arg_parameters[0], arg_parameters);
 +#endif /* HAVE_EXECVPE */
          else {
-                 chdir(home ? home : "/root");
+                 chdir(home ?: "/root");
                  execle("/bin/bash", "-bash", NULL, env_use);
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
deleted file mode 100644
index b8ab7c4..0000000
--- a/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f771407d3e0288ca0c06a894194d3ddad69b9a8e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:17:05 +0000
-Subject: [PATCH 07/11] util: Use mkostemp only if libc supports it
-
-Upstream-Status: Denied [no desire for uclibc support]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/basic/util.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/basic/util.c b/src/basic/util.c
-index dc65280..72f4665 100644
---- a/src/basic/util.c
-+++ b/src/basic/util.c
-@@ -97,6 +97,8 @@
- #include "def.h"
- #include "sparse-endian.h"
- 
-+#include "config.h"
-+
- int saved_argc = 0;
- char **saved_argv = NULL;
- 
-@@ -6682,7 +6684,13 @@ int mkostemp_safe(char *pattern, int flags) {
- 
-         u = umask(077);
- 
-+#ifdef HAVE_MKOSTEMP
-         fd = mkostemp(pattern, flags);
-+#else
-+        fd = mkstemp(pattern);
-+        if (fd >= 0) fcntl(fd, F_SETFD, flags);
-+#endif /* HAVE_MKOSTEMP */
-+
-         if (fd < 0)
-                 return -errno;
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch b/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
index 3f4d4de..8d71ecb 100644
--- a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
+++ b/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
@@ -1,7 +1,7 @@
-From b45ea3bfd6635744c8a6b74d0ac701b44bb1d294 Mon Sep 17 00:00:00 2001
+From 83944758dc0703afea81f3c7aa0ad926bc5df757 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:19:37 +0000
-Subject: [PATCH 08/11] util: bypass unimplemented _SC_PHYS_PAGES system
+Date: Mon, 14 Dec 2015 00:47:53 +0000
+Subject: [PATCH 08/16] util: bypass unimplemented _SC_PHYS_PAGES system
  configuration API on uclibc
 
 Upstream-Status: Inappropriate [uclibc-specific]
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 15 insertions(+)
 
 diff --git a/src/basic/util.c b/src/basic/util.c
-index 72f4665..cbbe3b1 100644
+index 9e0b576..65f0edf 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
-@@ -6793,10 +6793,25 @@ uint64_t physical_memory(void) {
+@@ -769,10 +769,25 @@ uint64_t physical_memory(void) {
          /* We return this as uint64_t in case we are running as 32bit
           * process on a 64bit kernel with huge amounts of memory */
  
@@ -25,7 +25,7 @@ index 72f4665..cbbe3b1 100644
 +        if (f == NULL)
 +                return 0;
 +        while (!feof(f) && fgets(line, sizeof(line)-1, f)) {
-+                if (sscanf(line, "MemTotal: %l kB", &mem) == 1) {
++                if (sscanf(line, "MemTotal: %li kB", &mem) == 1) {
 +                        mem *= 1024;
 +                        break;
 +                }
@@ -40,7 +40,7 @@ index 72f4665..cbbe3b1 100644
 +#endif
  }
  
- void hexdump(FILE *f, const void *p, size_t s) {
+ int update_reboot_param_file(const char *param) {
 -- 
-2.1.4
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch
similarity index 75%
rename from meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch
rename to meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch
index 68b45a9..a139684 100644
--- a/meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0009-implment-systemd-sysv-install-for-OE.patch
@@ -1,7 +1,7 @@
-From 5f8b9f2d276c0ddbcbf5423733a23f043d688009 Mon Sep 17 00:00:00 2001
+From 81c3d92b5bc5786cbd93b1e5ed82884e8caf2254 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH] implment systemd-sysv-install for OE
+Subject: [PATCH 09/16] implment systemd-sysv-install for OE
 
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/systemctl/systemd-sysv-install.SKELETON | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: git/src/systemctl/systemd-sysv-install.SKELETON
-===================================================================
---- git.orig/src/systemctl/systemd-sysv-install.SKELETON
-+++ git/src/systemctl/systemd-sysv-install.SKELETON
+diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
+index a53a3e6..5d877b0 100755
+--- a/src/systemctl/systemd-sysv-install.SKELETON
++++ b/src/systemctl/systemd-sysv-install.SKELETON
 @@ -30,17 +30,17 @@ case "$1" in
      enable)
          # call the command to enable SysV init script $NAME here
@@ -38,3 +38,6 @@ Index: git/src/systemctl/systemd-sysv-install.SKELETON
          ;;
      *)
          usage ;;
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch b/meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
new file mode 100644
index 0000000..8cec071
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
@@ -0,0 +1,38 @@
+From d4b7f9b771a538c2356c4c77461f3b4790043556 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Dec 2015 00:50:01 +0000
+Subject: [PATCH 10/16] nss-mymachines: Build conditionally when
+ HAVE_MYHOSTNAME is set
+
+Fixes build failures when building with --disable-myhostname
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4c1143a..cf559be 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4961,6 +4961,7 @@ SYSTEM_UNIT_ALIASES += \
+ BUSNAMES_TARGET_WANTS += \
+ 	org.freedesktop.machine1.busname
+ 
++if HAVE_MYHOSTNAME
+ libnss_mymachines_la_SOURCES = \
+ 	src/nss-mymachines/nss-mymachines.sym \
+ 	src/nss-mymachines/nss-mymachines.c
+@@ -4981,6 +4982,7 @@ lib_LTLIBRARIES += \
+ 	libnss_mymachines.la
+ 
+ endif
++endif
+ 
+ polkitpolicy_in_files += \
+ 	src/machine/org.freedesktop.machine1.policy.in
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/rules-whitelist-hd-devices.patch
rename to meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch
index 8975b05..03fdbff 100644
--- a/meta/recipes-core/systemd/systemd/rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0011-rules-whitelist-hd-devices.patch
@@ -1,7 +1,7 @@
-From f77b7e5626e70c3a775e993816a33af5a61dea42 Mon Sep 17 00:00:00 2001
+From ae6c9dcb00919e1dd2793fd1b82125d123f69a90 Mon Sep 17 00:00:00 2001
 From: Patrick Ohly <patrick.ohly@intel.com>
 Date: Wed, 16 Sep 2015 13:55:58 +0200
-Subject: [PATCH] rules: whitelist hd* devices
+Subject: [PATCH 11/16] rules: whitelist hd* devices
 
 qemu by default emulates IDE and the linux-yocto kernel(s) use
 CONFIG_IDE instead of the more modern libsata, so disks appear as
@@ -28,5 +28,5 @@ index 0b14bb4..1c4d97a 100644
  # ignore partitions that span the entire disk
  TEST=="whole_disk", GOTO="persistent_storage_end"
 -- 
-2.1.4
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0009-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0009-sysv-generator-add-support-for-executing-scripts-und.patch
rename to meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch
index 9ea3e83..82feff0 100644
--- a/meta/recipes-core/systemd/systemd/0009-sysv-generator-add-support-for-executing-scripts-und.patch
+++ b/meta/recipes-core/systemd/systemd/0012-sysv-generator-add-support-for-executing-scripts-und.patch
@@ -1,7 +1,7 @@
-From 8791b5b3934c55694872b6915a67340683ead91b Mon Sep 17 00:00:00 2001
+From 9e6c907ff1f17deb96c66a607653db4c7da34289 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:22:52 +0000
-Subject: [PATCH 09/11] sysv-generator: add support for executing scripts under
+Date: Mon, 14 Dec 2015 05:09:53 +0000
+Subject: [PATCH 12/16] sysv-generator: add support for executing scripts under
  /etc/rcS.d/
 
 To be compatible, all services translated from scripts under /etc/rcS.d would
@@ -12,14 +12,14 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/sysv-generator/sysv-generator.c | 50 ++++++++++++++++++++++++++++---------
- 1 file changed, 38 insertions(+), 12 deletions(-)
+ src/sysv-generator/sysv-generator.c | 50 +++++++++++++++++++++++++++++--------
+ 1 file changed, 39 insertions(+), 11 deletions(-)
 
 diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
-index bd67f32..6756cc6 100644
+index 5075548..32d3687 100644
 --- a/src/sysv-generator/sysv-generator.c
 +++ b/src/sysv-generator/sysv-generator.c
-@@ -42,7 +42,8 @@
+@@ -46,7 +46,8 @@
  
  typedef enum RunlevelType {
          RUNLEVEL_UP,
@@ -29,7 +29,7 @@ index bd67f32..6756cc6 100644
  } RunlevelType;
  
  static const struct {
-@@ -57,6 +58,9 @@ static const struct {
+@@ -61,6 +62,9 @@ static const struct {
          { "rc4.d",  SPECIAL_MULTI_USER_TARGET, RUNLEVEL_UP },
          { "rc5.d",  SPECIAL_GRAPHICAL_TARGET,  RUNLEVEL_UP },
  
@@ -39,7 +39,7 @@ index bd67f32..6756cc6 100644
          /* Standard SysV runlevels for shutdown */
          { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
          { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
-@@ -65,7 +69,7 @@ static const struct {
+@@ -69,7 +73,7 @@ static const struct {
             directories in this order, and we want to make sure that
             sysv_start_priority is known when we first load the
             unit. And that value we only know from S links. Hence
@@ -47,19 +47,19 @@ index bd67f32..6756cc6 100644
 +           UP/SYSINIT must be read before DOWN */
  };
  
- typedef struct SysvStub {
-@@ -81,6 +85,8 @@ typedef struct SysvStub {
-         char **conflicts;
+ const char *arg_dest = "/tmp";
+@@ -88,6 +92,8 @@ typedef struct SysvStub {
          bool has_lsb;
          bool reload;
+         bool loaded;
 +        bool default_dependencies;
 +        bool from_rcsd;
  } SysvStub;
  
- const char *arg_dest = "/tmp";
-@@ -183,6 +189,9 @@ static int generate_unit_file(SysvStub *s) {
-                 "Description=%s\n",
-                 s->path, s->description);
+ static void free_sysvstub(SysvStub *s) {
+@@ -204,6 +210,9 @@ static int generate_unit_file(SysvStub *s) {
+         if (s->description)
+                 fprintf(f, "Description=%s\n", s->description);
  
 +        if (!s->default_dependencies)
 +                fprintf(f, "DefaultDependencies=no\n");
@@ -67,7 +67,7 @@ index bd67f32..6756cc6 100644
          if (!isempty(before))
                  fprintf(f, "Before=%s\n", before);
          if (!isempty(after))
-@@ -704,18 +713,30 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
+@@ -722,17 +731,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
                  if (s->has_lsb && other->has_lsb)
                          continue;
  
@@ -79,15 +79,14 @@ index bd67f32..6756cc6 100644
 +                        r = strv_extend(&s->before, other->name);
                          if (r < 0)
                                  return log_oom();
--                }
--                else if (other->sysv_start_priority > s->sysv_start_priority) {
+ 
+-                } else if (other->sysv_start_priority > s->sysv_start_priority) {
 -                        r = strv_extend(&s->before, other->name);
 +                } else if (other->from_rcsd && !s->from_rcsd) {
 +                        r = strv_extend(&s->after, other->name);
                          if (r < 0)
                                  return log_oom();
--                }
--                else
+-                } else
 -                        continue;
 +                } else {
 +                        if (other->sysv_start_priority < s->sysv_start_priority) {
@@ -102,11 +101,11 @@ index bd67f32..6756cc6 100644
 +                        }
 +                        else
 +                                continue;
-+                 }
++                }
  
                  /* FIXME: Maybe we should compare the name here lexicographically? */
          }
-@@ -778,6 +799,8 @@ static int enumerate_sysv(LookupPaths lp, Hashmap *all_services) {
+@@ -799,6 +822,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
                                  return log_oom();
  
                          service->sysv_start_priority = -1;
@@ -114,22 +113,23 @@ index bd67f32..6756cc6 100644
 +                        service->from_rcsd = false;
                          service->name = name;
                          service->path = fpath;
- 
-@@ -864,9 +887,11 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+                         name = fpath = NULL;
+@@ -882,9 +907,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
  
                                  if (de->d_name[0] == 'S')  {
  
--                                        if (rcnd_table[i].type == RUNLEVEL_UP) {
+-                                        if (rcnd_table[i].type == RUNLEVEL_UP)
 +                                        if (rcnd_table[i].type == RUNLEVEL_UP || rcnd_table[i].type == RUNLEVEL_SYSINIT) {
-                                                 service->sysv_start_priority =
-                                                         MAX(a*10 + b, service->sysv_start_priority);
+                                                 service->sysv_start_priority = MAX(a*10 + b, service->sysv_start_priority);
+-
 +                                                service->default_dependencies = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?false:true;
 +                                                service->from_rcsd = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?true:false;
-                                         }
- 
++                                        }
                                          r = set_ensure_allocated(&runlevel_services[i], NULL);
-@@ -878,7 +903,8 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
-                                                 goto finish;
+                                         if (r < 0) {
+                                                 log_oom();
+@@ -898,7 +925,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
+                                         }
  
                                  } else if (de->d_name[0] == 'K' &&
 -                                           (rcnd_table[i].type == RUNLEVEL_DOWN)) {
@@ -137,7 +137,7 @@ index bd67f32..6756cc6 100644
 +                                            rcnd_table[i].type == RUNLEVEL_SYSINIT)) {
  
                                          r = set_ensure_allocated(&shutdown_services, NULL);
-                                         if (r < 0)
+                                         if (r < 0) {
 -- 
-2.1.4
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
similarity index 64%
rename from meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
rename to meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
index ed7ff5b..ea0b3e2 100644
--- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
@@ -1,7 +1,7 @@
-From 3dc731c1d270e2e143de621db9bd898299fd849d Mon Sep 17 00:00:00 2001
+From 1ba00ff6ed3f0626892f57cdd8d9788692c7bf14 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:24:49 +0000
-Subject: [PATCH 10/11] Make root's home directory configurable
+Date: Mon, 14 Dec 2015 05:18:20 +0000
+Subject: [PATCH 13/16] Make root's home directory configurable
 
 OpenEmbedded has a configurable home directory for root. Allow
 systemd to be built using its idea of what root's home directory
@@ -17,19 +17,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am                       | 2 ++
  configure.ac                      | 7 +++++++
- src/core/unit-printf.c            | 2 +-
+ src/basic/user-util.c             | 4 ++--
+ src/core/namespace.c              | 2 +-
  src/nspawn/nspawn.c               | 4 ++--
- src/basic/util.c                 | 4 ++--
  units/console-shell.service.m4.in | 4 ++--
  units/emergency.service.in        | 4 ++--
  units/rescue.service.in           | 4 ++--
  8 files changed, 20 insertions(+), 11 deletions(-)
 
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -208,6 +208,7 @@ AM_CPPFLAGS = \
+diff --git a/Makefile.am b/Makefile.am
+index cf559be..a511c3d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -210,6 +210,7 @@ AM_CPPFLAGS = \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
@@ -37,7 +37,7 @@ Index: git/Makefile.am
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
  	-I $(top_builddir)/src/basic \
-@@ -5615,6 +5616,7 @@ EXTRA_DIST += \
+@@ -5876,6 +5877,7 @@ EXTRA_DIST += \
  substitutions = \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
@@ -45,11 +45,11 @@ Index: git/Makefile.am
         '|bindir=$(bindir)|' \
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -1383,6 +1383,11 @@ AC_ARG_WITH([rootlibdir],
+diff --git a/configure.ac b/configure.ac
+index 49f73a4..a3e639d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1434,6 +1434,11 @@ AC_ARG_WITH([rootlibdir],
          [with_rootlibdir=${libdir}])
  AX_NORMALIZE_PATH([with_rootlibdir])
  
@@ -61,7 +61,7 @@ Index: git/configure.ac
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1474,6 +1479,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1517,6 +1522,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
@@ -69,7 +69,7 @@ Index: git/configure.ac
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1563,6 +1569,7 @@ AC_MSG_RESULT([
+@@ -1606,6 +1612,7 @@ AC_MSG_RESULT([
          includedir:              ${includedir}
          lib dir:                 ${libdir}
          rootlib dir:             ${with_rootlibdir}
@@ -77,46 +77,11 @@ Index: git/configure.ac
          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
-Index: git/src/core/unit-printf.c
-===================================================================
---- git.orig/src/core/unit-printf.c
-+++ git/src/core/unit-printf.c
-@@ -237,7 +237,7 @@ static int specifier_user_home(char spec
-                  * best of it if we can, but fail if we can't */
- 
-                 if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
--                        n = strdup("/root");
-+                        n = strdup(ROOTHOMEDIR);
-                 else
-                         return -EOPNOTSUPP;
- 
-Index: git/src/nspawn/nspawn.c
-===================================================================
---- git.orig/src/nspawn/nspawn.c
-+++ git/src/nspawn/nspawn.c
-@@ -4176,7 +4176,7 @@ static int inner_child(
-         if (envp[n_env])
-                 n_env ++;
- 
--        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
-+        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
-             (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
-             (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
-                 return log_oom();
-@@ -4247,7 +4247,7 @@ static int inner_child(
-                 execvp(argv[optind], argv + optind);
- #endif /* HAVE_EXECVPE */
-         else {
--                chdir(home ? home : "/root");
-+                chdir(home ? home : ROOTHOMEDIR);
-                 execle("/bin/bash", "-bash", NULL, env_use);
-                 execle("/bin/sh", "-sh", NULL, env_use);
-         }
-Index: git/src/basic/util.c
-===================================================================
---- git.orig/src/basic/util.c
-+++ git/src/basic/util.c
-@@ -3233,7 +3233,7 @@ int get_user_creds(
+diff --git a/src/basic/user-util.c b/src/basic/user-util.c
+index 56e1a3b..c3d0ec3 100644
+--- a/src/basic/user-util.c
++++ b/src/basic/user-util.c
+@@ -124,7 +124,7 @@ int get_user_creds(
                          *gid = 0;
  
                  if (home)
@@ -125,7 +90,7 @@ Index: git/src/basic/util.c
  
                  if (shell)
                          *shell = "/bin/sh";
-@@ -4069,7 +4069,7 @@ int get_home_dir(char **_h) {
+@@ -355,7 +355,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -134,10 +99,45 @@ Index: git/src/basic/util.c
                  if (!h)
                          return -ENOMEM;
  
-Index: git/units/console-shell.service.m4.in
-===================================================================
---- git.orig/units/console-shell.service.m4.in
-+++ git/units/console-shell.service.m4.in
+diff --git a/src/core/namespace.c b/src/core/namespace.c
+index 81ba09e..1a1f276 100644
+--- a/src/core/namespace.c
++++ b/src/core/namespace.c
+@@ -494,7 +494,7 @@ int setup_namespace(
+                         home_dir = strjoina("-", home_dir);
+                         run_user_dir = prefix_roota(root_directory, "/run/user");
+                         run_user_dir = strjoina("-", run_user_dir);
+-                        root_dir = prefix_roota(root_directory, "/root");
++                        root_dir = prefix_roota(root_directory, ROOTHOMEDIR);
+                         root_dir = strjoina("-", root_dir);
+ 
+                         r = append_mounts(&m, STRV_MAKE(home_dir, run_user_dir, root_dir),
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 4def6ba..2081953 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -2530,7 +2530,7 @@ static int inner_child(
+         if (envp[n_env])
+                 n_env ++;
+ 
+-        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
++        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
+             (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
+             (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
+                 return log_oom();
+@@ -2604,7 +2604,7 @@ static int inner_child(
+                 execvp(arg_parameters[0], arg_parameters);
+ #endif /* HAVE_EXECVPE */
+         else {
+-                chdir(home ?: "/root");
++                chdir(home ?: ROOTHOMEDIR);
+                 execle("/bin/bash", "-bash", NULL, env_use);
+                 execle("/bin/sh", "-sh", NULL, env_use);
+         }
+diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
+index 5c80722..efde5f0 100644
+--- a/units/console-shell.service.m4.in
++++ b/units/console-shell.service.m4.in
 @@ -15,8 +15,8 @@ After=rc-local.service
  Before=getty.target
  
@@ -149,10 +149,10 @@ Index: git/units/console-shell.service.m4.in
  ExecStart=-@SULOGIN@
  ExecStopPost=-@SYSTEMCTL@ poweroff
  Type=idle
-Index: git/units/emergency.service.in
-===================================================================
---- git.orig/units/emergency.service.in
-+++ git/units/emergency.service.in
+diff --git a/units/emergency.service.in b/units/emergency.service.in
+index 8dc3cbd..eb046c2 100644
+--- a/units/emergency.service.in
++++ b/units/emergency.service.in
 @@ -14,8 +14,8 @@ Conflicts=rescue.service
  Before=shutdown.target
  
@@ -164,11 +164,11 @@ Index: git/units/emergency.service.in
  ExecStartPre=-/bin/plymouth --wait quit
  ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
  ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
-Index: git/units/rescue.service.in
-===================================================================
---- git.orig/units/rescue.service.in
-+++ git/units/rescue.service.in
-@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.serv
+diff --git a/units/rescue.service.in b/units/rescue.service.in
+index 432e4f3..afa3e82 100644
+--- a/units/rescue.service.in
++++ b/units/rescue.service.in
+@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
  Before=shutdown.target
  
  [Service]
@@ -179,3 +179,6 @@ Index: git/units/rescue.service.in
  ExecStartPre=-/bin/plymouth quit
  ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
  ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd/0011-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch
similarity index 54%
rename from meta/recipes-core/systemd/systemd/0011-systemd-user-avoid-using-system-auth.patch
rename to meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch
index e562bca..11be097 100644
--- a/meta/recipes-core/systemd/systemd/0011-systemd-user-avoid-using-system-auth.patch
+++ b/meta/recipes-core/systemd/systemd/0014-systemd-user-avoid-using-system-auth.patch
@@ -1,7 +1,7 @@
-From 7e202f71785bf5a67c8a4f6b58d3585608fbfdc4 Mon Sep 17 00:00:00 2001
+From 548a8d5d456c531444498b3ce8cec3f3dd374cf8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:26:25 +0000
-Subject: [PATCH 11/11] systemd-user: avoid using system-auth
+Subject: [PATCH 14/16] systemd-user: avoid using system-auth
 
 In OE, we don't provide system-auth, instead, we use common-* files.
 So modify systemd-user file to use common-* files.
@@ -11,21 +11,26 @@ Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/login/systemd-user | 4 ++--
+ src/login/systemd-user.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/login/systemd-user b/src/login/systemd-user
-index 8112d74..99635af 100644
---- a/src/login/systemd-user
-+++ b/src/login/systemd-user
-@@ -2,5 +2,5 @@
+diff --git a/src/login/systemd-user.m4 b/src/login/systemd-user.m4
+index 7933508..16b73d2 100644
+--- a/src/login/systemd-user.m4
++++ b/src/login/systemd-user.m4
+@@ -2,10 +2,10 @@
  #
  # Used by systemd --user instances.
  
 -account  include system-auth
--session  include system-auth
 +account  include common-account
+ 
+ m4_ifdef(`HAVE_SELINUX',
+ session  required pam_selinux.so close
+ session  required pam_selinux.so nottys open
+ )m4_dnl
+-session  include system-auth
 +session  include common-session
 -- 
-2.1.4
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch b/meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
rename to meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch
index fe2ba53..7cc3922 100644
--- a/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
+++ b/meta/recipes-core/systemd/systemd/0015-Revert-rules-remove-firmware-loading-rules.patch
@@ -1,7 +1,7 @@
-From 4f0a722489154da99e7f6b3051afde984eed2f74 Mon Sep 17 00:00:00 2001
+From 6b2b8d20f884bd5a3d928175e422023f6c9d056b Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Thu, 19 Mar 2015 15:01:29 +1100
-Subject: [PATCH] Revert "rules: remove firmware loading rules"
+Subject: [PATCH 15/16] Revert "rules: remove firmware loading rules"
 
 This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
 Userspace firmware loading support is needed for Linux < 3.7.
@@ -24,5 +24,5 @@ index 0000000..f0ae684
 +
 +SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
 -- 
-2.3.3
+2.6.4
 
diff --git a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
similarity index 79%
rename from meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
rename to meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 6308cc7..03ab0d4 100644
--- a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -1,7 +1,8 @@
-From 7f074def4e32045353ba4336d703e17b8de7ec4e Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Thu, 19 Mar 2015 15:01:33 +1100
-Subject: [PATCH] Revert "udev: remove userspace firmware loading support"
+From d3661ec7fb4557c47f001986cbb8a684b8dbae4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Dec 2015 05:33:32 +0000
+Subject: [PATCH 16/16] Revert "udev: remove userspace firmware loading
+ support"
 
 This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
 Userspace firmware loading support is needed for Linux < 3.7.
@@ -9,23 +10,24 @@ Userspace firmware loading support is needed for Linux < 3.7.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am                      |  12 +++
- README                           |   9 ++-
+ README                           |   6 +-
  TODO                             |   1 +
- configure.ac                     |  20 +++++
+ configure.ac                     |  25 +++++++
  src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
  src/udev/udev-builtin.c          |   3 +
  src/udev/udev.h                  |   6 ++
  src/udev/udevd.c                 |  13 ++++
- 8 files changed, 214 insertions(+), 4 deletions(-)
+ 8 files changed, 217 insertions(+), 3 deletions(-)
  create mode 100644 src/udev/udev-builtin-firmware.c
 
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -3470,6 +3470,18 @@ libudev_core_la_LIBADD = \
+diff --git a/Makefile.am b/Makefile.am
+index a511c3d..6181e55 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3650,6 +3650,18 @@ libudev_core_la_LIBADD = \
  	$(BLKID_LIBS) \
  	$(KMOD_LIBS)
  
@@ -44,21 +46,11 @@ Index: git/Makefile.am
  if HAVE_KMOD
  libudev_core_la_SOURCES += \
  	src/udev/udev-builtin-kmod.c
-Index: git/README
-===================================================================
---- git.orig/README
-+++ git/README
-@@ -36,7 +36,8 @@ LICENSE:
-         - except src/udev/* which is (currently still) GPLv2, GPLv2+
- 
- REQUIREMENTS:
--        Linux kernel >= 3.7
-+        Linux kernel >= 3.0
-+        Linux kernel >= 3.3 for loop device partition support features with nspawn
-         Linux kernel >= 3.8 for Smack support
- 
-         Kernel Config Options:
-@@ -51,14 +52,14 @@ REQUIREMENTS:
+diff --git a/README b/README
+index bf67f8c..87b6f70 100644
+--- a/README
++++ b/README
+@@ -51,14 +51,14 @@ REQUIREMENTS:
            CONFIG_PROC_FS
            CONFIG_FHANDLE (libudev, mount and bind mount handling)
  
@@ -76,24 +68,24 @@ Index: git/README
            CONFIG_FW_LOADER_USER_HELPER=n
  
          Some udev rules and virtualization detection relies on it:
-Index: git/TODO
-===================================================================
---- git.orig/TODO
-+++ git/TODO
-@@ -754,6 +754,7 @@ Features:
- * ExecOnFailure=/usr/bin/foo
+diff --git a/TODO b/TODO
+index 369805f..ce97674 100644
+--- a/TODO
++++ b/TODO
+@@ -635,6 +635,7 @@ Features:
+ * rename "userspace" to "core-os"
  
  * udev:
 +  - remove src/udev/udev-builtin-firmware.c (CONFIG_FW_LOADER_USER_HELPER=n)
    - move to LGPL
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -1268,6 +1268,26 @@ fi
- AM_CONDITIONAL(HAVE_MYHOSTNAME, [test "$have_myhostname" = "yes"])
+diff --git a/configure.ac b/configure.ac
+index a3e639d..00736f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1317,6 +1317,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
+ AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
  
  # ------------------------------------------------------------------------------
 +AC_ARG_WITH(firmware-path,
@@ -114,23 +106,28 @@ Index: git/configure.ac
 +AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
 +AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
 +
-+
 +# ------------------------------------------------------------------------------
- AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database support])],
-        enable_hwdb=$enableval, enable_hwdb=yes)
- AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
-@@ -1574,6 +1594,7 @@ AC_MSG_RESULT([
+ have_manpages=no
+ AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable manpages]))
+ AS_IF([test "x$enable_manpages" != xno], [
+@@ -1616,6 +1635,12 @@ AC_MSG_RESULT([
+         SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
-         sphinx binary:           ${SPHINX_BUILD}
++<<<<<<< HEAD
++=======
++        Installation Python:     ${PYTHON_BINARY}
++        sphinx binary:           ${SPHINX_BUILD}
 +        firmware path:           ${FIRMWARE_PATH}
++>>>>>>> parent of be2ea72... udev: remove userspace firmware loading support
          PAM modules dir:         ${with_pamlibdir}
          PAM configuration dir:   ${with_pamconfdir}
          D-Bus policy dir:        ${with_dbuspolicydir}
-Index: git/src/udev/udev-builtin-firmware.c
-===================================================================
+diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-firmware.c
+new file mode 100644
+index 0000000..bd8c2fb
 --- /dev/null
-+++ git/src/udev/udev-builtin-firmware.c
++++ b/src/udev/udev-builtin-firmware.c
 @@ -0,0 +1,154 @@
 +/*
 + * firmware - Kernel firmware loader
@@ -286,11 +283,11 @@ Index: git/src/udev/udev-builtin-firmware.c
 +        .help = "kernel firmware loader",
 +        .run_once = true,
 +};
-Index: git/src/udev/udev-builtin.c
-===================================================================
---- git.orig/src/udev/udev-builtin.c
-+++ git/src/udev/udev-builtin.c
-@@ -30,6 +30,9 @@ static const struct udev_builtin *builti
+diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
+index 18fb661..d0280bf 100644
+--- a/src/udev/udev-builtin.c
++++ b/src/udev/udev-builtin.c
+@@ -33,6 +33,9 @@ static const struct udev_builtin *builtins[] = {
          [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
  #endif
          [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
@@ -300,11 +297,11 @@ Index: git/src/udev/udev-builtin.c
          [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
          [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
          [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
-Index: git/src/udev/udev.h
-===================================================================
---- git.orig/src/udev/udev.h
-+++ git/src/udev/udev.h
-@@ -146,6 +146,9 @@ enum udev_builtin_cmd {
+diff --git a/src/udev/udev.h b/src/udev/udev.h
+index 4f40020..8f3560f 100644
+--- a/src/udev/udev.h
++++ b/src/udev/udev.h
+@@ -149,6 +149,9 @@ enum udev_builtin_cmd {
          UDEV_BUILTIN_BLKID,
  #endif
          UDEV_BUILTIN_BTRFS,
@@ -314,7 +311,7 @@ Index: git/src/udev/udev.h
          UDEV_BUILTIN_HWDB,
          UDEV_BUILTIN_INPUT_ID,
          UDEV_BUILTIN_KEYBOARD,
-@@ -174,6 +177,9 @@ struct udev_builtin {
+@@ -177,6 +180,9 @@ struct udev_builtin {
  extern const struct udev_builtin udev_builtin_blkid;
  #endif
  extern const struct udev_builtin udev_builtin_btrfs;
@@ -324,11 +321,11 @@ Index: git/src/udev/udev.h
  extern const struct udev_builtin udev_builtin_hwdb;
  extern const struct udev_builtin udev_builtin_input_id;
  extern const struct udev_builtin udev_builtin_keyboard;
-Index: git/src/udev/udevd.c
-===================================================================
---- git.orig/src/udev/udevd.c
-+++ git/src/udev/udevd.c
-@@ -116,6 +116,9 @@ struct event {
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c
+index 366e7fb..7ca1b51 100644
+--- a/src/udev/udevd.c
++++ b/src/udev/udevd.c
+@@ -127,6 +127,9 @@ struct event {
          bool is_block;
          sd_event_source *timeout_warning;
          sd_event_source *timeout;
@@ -338,7 +335,7 @@ Index: git/src/udev/udevd.c
  };
  
  static inline struct event *node_to_event(struct udev_list_node *node) {
-@@ -607,6 +610,10 @@ static int event_queue_insert(Manager *m
+@@ -615,6 +618,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
          event->devnum = udev_device_get_devnum(dev);
          event->is_block = streq("block", udev_device_get_subsystem(dev));
          event->ifindex = udev_device_get_ifindex(dev);
@@ -349,7 +346,7 @@ Index: git/src/udev/udevd.c
  
          log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
               udev_device_get_action(dev), udev_device_get_subsystem(dev));
-@@ -692,6 +699,12 @@ static bool is_devpath_busy(Manager *man
+@@ -700,6 +707,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
                          return true;
                  }
  
@@ -362,3 +359,6 @@ Index: git/src/udev/udevd.c
                  /* parent device event found */
                  if (event->devpath[common] == '/') {
                          event->delaying_seqnum = loop_event->seqnum;
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_228.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd_225.bb
rename to meta/recipes-core/systemd/systemd_228.bb
index 428158a..551a82f 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -24,39 +24,38 @@ SECTION = "base/shell"
 
 inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
-SRCREV = "e1439a1472c5f691733b8ef10e702beac2496a63"
+SRCREV = "dd050decb6ad131ebdeabb71c4f9ecb4733269c0"
 
-PV = "225+git${SRCPV}"
+PV = "228+git${SRCPV}"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
-           file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
-           file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
-           file://0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
-           file://0006-journal-Use-posix-fallocate-only-if-available.patch \
-           file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
+           file://0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
+           file://0006-configure-Check-for-additional-features-that-uclibc-.patch \
+           file://0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
            file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
-           file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
-           file://0010-Make-root-s-home-directory-configurable.patch \
-           file://0011-systemd-user-avoid-using-system-auth.patch \
-           file://0012-implment-systemd-sysv-install-for-OE.patch \
-           file://0014-Revert-rules-remove-firmware-loading-rules.patch \
-           file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
+           file://0009-implment-systemd-sysv-install-for-OE.patch \
+           file://0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch \
+           file://0011-rules-whitelist-hd-devices.patch \
+           file://0012-sysv-generator-add-support-for-executing-scripts-und.patch \
+           file://0013-Make-root-s-home-directory-configurable.patch \
+           file://0014-systemd-user-avoid-using-system-auth.patch \
+           file://0015-Revert-rules-remove-firmware-loading-rules.patch \
+           file://0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://rules-whitelist-hd-devices.patch \
           "
-SRC_URI_append_qemuall = " file://qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch"
+SRC_URI_append_libc-uclibc = "\
+            file://0001-define-exp10-if-missing.patch \
+            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
+            file://0003-Use-getenv-when-secure-versions-are-not-available.patch \
+           "
+SRC_URI_append_qemuall = " file://0004-core-device.c-Change-the-default-device-timeout-to-2.patch "
 
 S = "${WORKDIR}/git"
 
-SRC_URI_append_libc-uclibc = "\
-            file://0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-            file://0022-Use-getenv-when-secure-versions-are-not-available.patch \
-            file://0001-fix-build-on-uClibc-exp10.patch \
-           "
-LDFLAGS_append_libc-uclibc = " -lrt"
+LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
@@ -65,7 +64,6 @@ PACKAGECONFIG ??= "xz ldconfig \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                   "
-
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
@@ -127,7 +125,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-firmware-path=/lib/firmware \
                "
 # uclibc does not have NSS
-EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
+EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname --disable-sysusers"
 
 # per the systemd README, define VALGRIND=1 to run under valgrind
 CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
-- 
2.6.4


