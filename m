Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E27D960AF4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 16:48:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f129so819667wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QJqsMD2oOXdkL+F6rqskDDkLqhRtCCVQVF5ycrcszlk=;
	b=Bjv22KltheDVjteiufU1mzt/zFSuXeu7+q1WfJxI5nnktew+cOJ+Ulo3XSDwwn76ye
	JKW7mvlcERVqaNnniFRZKSUJl78s79+PePxh7J5QwxkCV5c8UCdclCSPr8VdXu9R+UTy
	N2iDhPmaLSwDz0Zc/IDAaRhtTQPKzYwglP4G002hNlyT2LM5E02oFgpQ1tbdNd8x+2qz
	RQIcMxRarlgehAnhTOmwndSA0AY2Or6xqQtfeGjtDT9KC0KZjFV7AqVMYwkJyLe1ChBg
	8Y2pd5YrW2v8m9kUYexs3hscm1GorOl5UfXDsXzHHcnbqMGaGZ8QWxOHLGZe1AfrSekZ
	t78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QJqsMD2oOXdkL+F6rqskDDkLqhRtCCVQVF5ycrcszlk=;
	b=df4X5YkZwbEoxv+wnQ3uDVI4UUb0j5xFFzBs6V14UWe+4whCSHaB2h5KuH/jHJJi7s
	pW01NZKrdtaBNJhFW9VldYXvwpa+Z6DYtolDnshxUWf5Jvc4maVeuN4zq4+yr6gxyWI5
	gTRfK7WHfjF8Jxr5H0D6HatD/LyDOKPzOlJta7R4rqu77nB91ksouecYzr93ntXMbiJo
	kMMcj0VLx+ecn0wUN8DkyZ9YVJCBpQ/WyeQ8Iq6tueKzWN3JuWpc0STJkoxZu7oGQfQQ
	wToaage+2MFKZhCF5w2LcfVbHOXMPJlw759kNBU7EOmLKEgxuuezHoDLJhZW9fLj5SaY
	dTog==
X-Gm-Message-State: APjAAAWVGBkDWNvaKO3ugCqGGJHeuYeWbWEtkb6K9LKrm6qk90zFLuLB
	B+W7Kpt8sQjcobkmZQDDVL/HI1iA
X-Google-Smtp-Source: APXvYqz+cFy15XinnQ/oMaEnw1zGOBOfxYp6r0VfFGL/oBQyE6slIwSTK1e/WRVFKSFF+DsJBaop5w==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr5680853wmk.34.1581007699275; 
	Thu, 06 Feb 2020 08:48:19 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id a184sm94842wmf.29.2020.02.06.08.48.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 08:48:18 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2020 16:48:13 +0000
Message-Id: <20200206164813.128977-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: upgrade 243.4 -> 244.1
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
X-List-Received-Date: Thu, 06 Feb 2020 16:48:20 -0000

Drop 0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch a
variant on which was introduced in 2c1047310970 ("Upgrade to systemd
211+") in 2014. The oldest supported build machine is now CentOS 7 which
has --relative support in ln, so there no longer appears to be any need
for this change.

Rebase/refresh musl patches:

- replace missing.h with specific missing_... header
- fix additional WRITE_STRING_FILE_DISABLE_BUFFER
- fix more places that need netinet/if_ether.h

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...md-boot_243.4.bb => systemd-boot_244.1.bb} |   0
 ...md-conf_243.2.bb => systemd-conf_244.1.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   6 +-
 ...tall-dependency-links-at-install-tim.patch |  33 +-
 ...-not-disable-buffer-in-writing-files.patch | 168 ++++----
 ...002-don-t-use-glibc-specific-qsort_r.patch |  26 +-
 ...ogin-brightness.c-include-sys-wait.h.patch |   8 +-
 ...instead-of-looking-for-relative-opti.patch |  63 ---
 ...implment-systemd-sysv-install-for-OE.patch |  10 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |  37 +-
 ...03-src-basic-copy.c-include-signal.h.patch |  12 +-
 ...k-parse_printf_format-implementation.patch |  29 +-
 ...set-util.h-add-__cpu_mask-definition.patch |  10 +-
 ...missing.h-check-for-missing-strndupa.patch | 381 ++++++++++++++----
 .../0006-Include-netinet-if_ether.h.patch     | 101 +++--
 ...LOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch |  30 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |  10 +-
 ..._register_atfork-for-non-glibc-build.patch |  14 +-
 ...11-Use-uintmax_t-for-handling-rlim_t.patch |  22 +-
 ...sable-tests-for-missing-typedefs-in-.patch |  15 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  20 +-
 ...patible-basename-for-non-glibc-syste.patch |  18 +-
 ...uffering-when-writing-to-oom_score_a.patch |   9 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  14 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  10 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |  10 +-
 ...definition-of-prctl_mm_map-structure.patch |  10 +-
 ...ead-of-TIME_T_MAX-for-timerfd_settim.patch |  10 +-
 .../0024-test-json.c-define-M_PIl.patch       |  12 +-
 .../{systemd_243.4.bb => systemd_244.1.bb}    |   2 +-
 30 files changed, 659 insertions(+), 431 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_243.4.bb => systemd-boot_244.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.2.bb => systemd-conf_244.1.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 rename meta/recipes-core/systemd/{systemd_243.4.bb => systemd_244.1.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.4.bb b/meta/recipes-core/systemd/systemd-boot_244.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_243.4.bb
rename to meta/recipes-core/systemd/systemd-boot_244.1.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_243.2.bb b/meta/recipes-core/systemd/systemd-conf_244.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_243.2.bb
rename to meta/recipes-core/systemd/systemd-conf_244.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 2fca6dca64b7..8c05a96ecc4f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "70e8c1978a9a688662eb1b3983370dd1cc415083"
-SRCBRANCH = "v243-stable"
+SRCREV = "639dc9f4bfd2c09535bee079ae9bc7006b520a66"
+SRCBRANCH = "v244-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-PV = "243.4+git${SRCPV}"
-
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index ea37680221f2..6eaaec71c533 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,8 +1,8 @@
-From 98254e4798e79d52ac6b562616cd244120f6e239 Mon Sep 17 00:00:00 2001
+From c73a87871df31b4f8d96c9d443759c6f702935f6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH 1/5] binfmt: Don't install dependency links at install time 
- for the binfmt services
+Subject: [PATCH] binfmt: Don't install dependency links at install time for
+ the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
 like a traditional service.
@@ -18,16 +18,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  units/meson.build                       | 6 ++----
  units/proc-sys-fs-binfmt_misc.automount | 3 +++
  units/systemd-binfmt.service.in         | 4 ++++
  3 files changed, 9 insertions(+), 4 deletions(-)
 
-Index: systemd-stable/units/meson.build
-===================================================================
---- systemd-stable.orig/units/meson.build
-+++ systemd-stable/units/meson.build
+diff --git a/units/meson.build b/units/meson.build
+index 6a3a0d0dea22..bbb1b78618c3 100644
+--- a/units/meson.build
++++ b/units/meson.build
 @@ -46,8 +46,7 @@ units = [
          ['poweroff.target',                     '',
           'runlevel0.target'],
@@ -48,10 +49,10 @@ Index: systemd-stable/units/meson.build
          ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
          ['systemd-boot-system-token.service',    'ENABLE_EFI',
-Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
-===================================================================
---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
-+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 30a6bc991844..4231f3b70fe9 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
 @@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
  
  [Automount]
@@ -59,11 +60,11 @@ Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
 +
 +[Install]
 +WantedBy=sysinit.target
-Index: systemd-stable/units/systemd-binfmt.service.in
-===================================================================
---- systemd-stable.orig/units/systemd-binfmt.service.in
-+++ systemd-stable/units/systemd-binfmt.service.in
-@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index 0c0f26451b67..763c4c466c16 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
+@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
  Conflicts=shutdown.target
diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
index d6d68a09ac9b..f1c7181ef971 100644
--- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 85e3c3046562ec24fc2f09ebfd08bf9f168091d5 Mon Sep 17 00:00:00 2001
+From f4a0caaea346b70cf5064f9159a53a1b8020071e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -18,8 +18,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
- src/basic/cgroup-util.c                 | 14 +++++++-------
+ src/basic/cgroup-util.c                 | 10 +++++-----
  src/basic/procfs-util.c                 |  4 ++--
  src/basic/smack-util.c                  |  2 +-
  src/basic/util.c                        |  2 +-
@@ -31,25 +32,19 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/login/logind-dbus.c                 |  2 +-
  src/nspawn/nspawn-cgroup.c              |  2 +-
  src/nspawn/nspawn.c                     |  6 +++---
+ src/shared/cgroup-setup.c               |  4 ++--
  src/shared/sysctl-util.c                |  2 +-
- src/sleep/sleep.c                       | 10 +++++-----
+ src/sleep/sleep.c                       |  8 ++++----
  src/udev/udevadm-trigger.c              |  2 +-
  src/udev/udevd.c                        |  2 +-
  src/vconsole/vconsole-setup.c           |  2 +-
- 17 files changed, 36 insertions(+), 36 deletions(-)
+ 18 files changed, 35 insertions(+), 35 deletions(-)
 
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index a5141f4cbedd..04c06e7a55cb 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -860,7 +860,7 @@ int cg_attach(const char *controller, co
- 
-         xsprintf(c, PID_FMT "\n", pid);
- 
--        r = write_string_file(fs, c, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(fs, c, 0);
-         if (r < 0)
-                 return r;
- 
-@@ -1142,7 +1142,7 @@ int cg_install_release_agent(const char
+@@ -739,7 +739,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -58,7 +53,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -1160,7 +1160,7 @@ int cg_install_release_agent(const char
+@@ -757,7 +757,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -67,7 +62,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
  
-@@ -1187,7 +1187,7 @@ int cg_uninstall_release_agent(const cha
+@@ -784,7 +784,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -76,7 +71,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -1197,7 +1197,7 @@ int cg_uninstall_release_agent(const cha
+@@ -794,7 +794,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -85,7 +80,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -2053,7 +2053,7 @@ int cg_set_attribute(const char *control
+@@ -1650,7 +1650,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -94,18 +89,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-@@ -2697,7 +2697,7 @@ int cg_enable_everywhere(
-                                         return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
-                         }
- 
--                        r = write_string_stream(f, s, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                        r = write_string_stream(f, s, 0);
-                         if (r < 0) {
-                                 log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
-                                                 FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index da7e836f143e..2138f20bcc03 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limi
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -121,9 +109,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  uint64_t threads_max;
  
+diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
+index da9a2139d31a..5e91f5b8f5d9 100644
 --- a/src/basic/smack-util.c
 +++ b/src/basic/smack-util.c
-@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const
+@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -132,9 +122,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
+diff --git a/src/basic/util.c b/src/basic/util.c
+index 2b3b3918a32f..aff8d0fcd473 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
-@@ -294,7 +294,7 @@ void disable_coredumps(void) {
+@@ -267,7 +267,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
  
@@ -143,9 +135,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
+diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
+index 7ff844c78c3a..5c5721d7c2f7 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
-@@ -48,7 +48,7 @@ static int delete_rule(const char *rule)
+@@ -47,7 +47,7 @@ static int delete_rule(const char *rule) {
          if (!fn)
                  return log_oom();
  
@@ -154,7 +148,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  static int apply_rule(const char *rule) {
-@@ -56,7 +56,7 @@ static int apply_rule(const char *rule)
+@@ -55,7 +55,7 @@ static int apply_rule(const char *rule) {
  
          (void) delete_rule(rule);
  
@@ -163,7 +157,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to add binary format: %m");
  
-@@ -213,7 +213,7 @@ static int run(int argc, char *argv[]) {
+@@ -212,7 +212,7 @@ static int run(int argc, char *argv[]) {
                  }
  
                  /* Flush out all rules */
@@ -172,9 +166,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
+diff --git a/src/core/main.c b/src/core/main.c
+index c24b696b1663..195be7d2df0d 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1303,7 +1303,7 @@ static int bump_unix_max_dgram_qlen(void
+@@ -1303,7 +1303,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -183,7 +179,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1527,7 +1527,7 @@ static void initialize_core_pattern(bool
+@@ -1527,7 +1527,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -192,9 +188,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
+diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
+index 4427397f2715..8aeb5c829513 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -327,17 +327,17 @@ int mac_smack_setup(bool *loaded_policy)
+@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -216,6 +214,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
+diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
+index 17e7cd1a009b..87a766771663 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -227,9 +227,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
+diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
+index f35612fe12bc..20351bf7fa70 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value
+@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -238,9 +240,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  if (r == -ELOOP)
                          return -EINVAL;
+diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
+index 69b59948786f..b4973c596d48 100644
 --- a/src/login/logind-dbus.c
 +++ b/src/login/logind-dbus.c
-@@ -1323,7 +1323,7 @@ static int trigger_device(Manager *m, sd
+@@ -1322,7 +1322,7 @@ static int trigger_device(Manager *m, sd_device *d) {
                  if (!t)
                          return -ENOMEM;
  
@@ -249,9 +253,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          }
  
          return 0;
+diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
+index f5048d9473cb..b6383ab5c97e 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -260,9 +266,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 873a76596f0b..4e496548bb94 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2403,7 +2403,7 @@ static int reset_audit_loginuid(void) {
+@@ -2425,7 +2425,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -271,7 +279,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3612,13 +3612,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3633,13 +3633,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -287,9 +295,33 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
+diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
+index e8398cbde5ba..ba682ec0c9e7 100644
+--- a/src/shared/cgroup-setup.c
++++ b/src/shared/cgroup-setup.c
+@@ -267,7 +267,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+ 
+         xsprintf(c, PID_FMT "\n", pid);
+ 
+-        r = write_string_file(fs, c, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(fs, c, 0);
+         if (r < 0)
+                 return r;
+ 
+@@ -817,7 +817,7 @@ int cg_enable_everywhere(
+                                         return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
+                         }
+ 
+-                        r = write_string_stream(f, s, WRITE_STRING_FILE_DISABLE_BUFFER);
++                        r = write_string_stream(f, s, 0);
+                         if (r < 0) {
+                                 log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
+                                                 FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
+diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
+index 12fb3ef7ea0e..132ac847c091 100644
 --- a/src/shared/sysctl-util.c
 +++ b/src/shared/sysctl-util.c
-@@ -88,7 +88,7 @@ int sysctl_write_ip_property(int af, con
+@@ -87,7 +87,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -298,35 +330,29 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int sysctl_read(const char *property, char **content) {
+diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
+index 89b80367f8f4..33dbb21364d0 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -54,7 +54,7 @@ static int write_hibernate_location_info
+@@ -45,7 +45,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+         assert(hibernate_location->swap);
+         assert(hibernate_location->resume);
  
-         /* if it's a swap partition, we just write the disk to /sys/power/resume */
-         if (streq(type, "partition")) {
--                r = write_string_file("/sys/power/resume", device, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                r = write_string_file("/sys/power/resume", device, 0);
-                 if (r < 0)
-                         return log_debug_errno(r, "Failed to write partition device to /sys/power/resume: %m");
- 
-@@ -98,14 +98,14 @@ static int write_hibernate_location_info
+-        r = write_string_file("/sys/power/resume", hibernate_location->resume, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/power/resume", hibernate_location->resume, 0);
+         if (r < 0)
+                 return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
+                                        hibernate_location->swap->device, hibernate_location->resume);
+@@ -72,7 +72,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+         }
  
-         offset = fiemap->fm_extents[0].fe_physical / page_size();
-         xsprintf(offset_str, "%" PRIu64, offset);
+         xsprintf(offset_str, "%" PRIu64, hibernate_location->resume_offset);
 -        r = write_string_file("/sys/power/resume_offset", offset_str, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file("/sys/power/resume_offset", offset_str, 0);
          if (r < 0)
-                 return log_debug_errno(r, "Failed to write offset '%s': %m", offset_str);
- 
-         log_debug("Wrote calculated resume_offset value to /sys/power/resume_offset: %s", offset_str);
- 
-         xsprintf(device_str, "%lx", (unsigned long)stb.st_dev);
--        r = write_string_file("/sys/power/resume", device_str, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/sys/power/resume", device_str, 0);
-         if (r < 0)
-                 return log_debug_errno(r, "Failed to write device '%s': %m", device_str);
- 
-@@ -121,7 +121,7 @@ static int write_mode(char **modes) {
+                 return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
+                                        hibernate_location->swap->device, offset_str);
+@@ -89,7 +89,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -335,7 +361,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (k >= 0)
                          return 0;
  
-@@ -140,7 +140,7 @@ static int write_state(FILE **f, char **
+@@ -108,7 +108,7 @@ static int write_state(FILE **f, char **states) {
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -344,9 +370,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
+diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
+index 60c68b5029cf..fdca03d3d42c 100644
 --- a/src/udev/udevadm-trigger.c
 +++ b/src/udev/udevadm-trigger.c
-@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerato
+@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
                  if (!filename)
                          return log_oom();
  
@@ -355,9 +383,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0) {
                          bool ignore = IN_SET(r, -ENOENT, -EACCES, -ENODEV, -EROFS);
  
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c
+index 7678331897f5..6871cde7aa65 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
-@@ -1113,7 +1113,7 @@ static int synthesize_change_one(sd_devi
+@@ -1089,7 +1089,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
  
          filename = strjoina(syspath, "/uevent");
          log_device_debug(dev, "device is closed, synthesising 'change' on %s", syspath);
@@ -366,9 +396,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_device_debug_errno(dev, r, "Failed to write 'change' to %s: %m", filename);
          return 0;
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
+index 9d706085fb47..30dcfa86f4d0 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -117,7 +117,7 @@ static int toggle_utf8_vc(const char *na
+@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index c6213ab88e7e..6b85ff0f8915 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,7 +1,7 @@
-From 1eb84534dea05d41afed1d898cba212ad7d310dd Mon Sep 17 00:00:00 2001
+From 49501c80d32c1bc5ecb07f40c324feb82af0b057 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
-Subject: [PATCH 02/24] don't use glibc-specific qsort_r
+Subject: [PATCH] don't use glibc-specific qsort_r
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -10,14 +10,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
 ---
- src/basic/sort-util.h              | 14 --------------
- src/libsystemd/sd-hwdb/hwdb-util.c | 19 ++++++++++++++-----
- src/shared/format-table.c          | 36 ++++++++++++++++++++++++------------
+ src/basic/sort-util.h              | 14 ------------
+ src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-----
+ src/shared/format-table.c          | 36 ++++++++++++++++++++----------
  3 files changed, 38 insertions(+), 31 deletions(-)
 
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index e029f8646e..27d68b341c 100644
+index e029f8646eb0..27d68b341cf3 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -54,17 +54,3 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
@@ -39,7 +40,7 @@ index e029f8646e..27d68b341c 100644
 -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
 diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
-index c83575c7c8..72f8f3a050 100644
+index c83575c7c876..72f8f3a05048 100644
 --- a/src/libsystemd/sd-hwdb/hwdb-util.c
 +++ b/src/libsystemd/sd-hwdb/hwdb-util.c
 @@ -128,9 +128,13 @@ static void trie_free(struct trie *trie) {
@@ -83,10 +84,10 @@ index c83575c7c8..72f8f3a050 100644
  }
  
 diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index a5c0a99b08..d595cbe372 100644
+index 4617ae8badc4..17d6b9616256 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -850,31 +850,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+@@ -1109,31 +1109,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
          return CMP(index_a, index_b);
  }
  
@@ -130,7 +131,7 @@ index a5c0a99b08..d595cbe372 100644
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1107,7 +1109,12 @@ int table_print(Table *t, FILE *f) {
+@@ -1533,7 +1535,12 @@ int table_print(Table *t, FILE *f) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -144,7 +145,7 @@ index a5c0a99b08..d595cbe372 100644
          }
  
          if (t->display_map)
-@@ -1534,7 +1541,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+@@ -1997,7 +2004,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -158,6 +159,3 @@ index a5c0a99b08..d595cbe372 100644
          }
  
          if (t->display_map)
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-sys-wait.h.patch b/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-sys-wait.h.patch
index dcae668dcb91..ba7424d8767a 100644
--- a/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-sys-wait.h.patch
+++ b/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-sys-wait.h.patch
@@ -1,4 +1,7 @@
-Include sys/wait.h
+From 106922335ec502bcb4451c54a89be49f88fa54de Mon Sep 17 00:00:00 2001
+From: Scott Murray <scott.murray@konsulko.com>
+Date: Fri, 13 Sep 2019 19:26:27 -0400
+Subject: [PATCH] Include sys/wait.h
 
 Fixes:
 src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
@@ -8,12 +11,13 @@ src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in
 Upstream-Status: Pending
 
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/login/logind-brightness.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/login/logind-brightness.c b/src/login/logind-brightness.c
-index 8dfa97d7ae..bddd4a2727 100644
+index 3f4b65e1fdf1..5af7e3d5ce3f 100644
 --- a/src/login/logind-brightness.c
 +++ b/src/login/logind-brightness.c
 @@ -1,5 +1,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
deleted file mode 100644
index 49a334d0909e..000000000000
--- a/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From bdbafe18c3bf99b3b691cd52b9ccff60f313892d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 27 Jun 2018 16:09:24 +0800
-Subject: [PATCH 2/5] use lnr wrapper instead of looking for --relative option
- for ln
-
-Remove file manually to avoid the 'File Exists' error when creating
-symlink. This is because the original 'ln' command uses '-f' option.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- meson.build                 | 4 ----
- tools/meson-make-symlink.sh | 3 ++-
- units/meson-add-wants.sh    | 7 ++++++-
- 3 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index e5ceb1e169..79b762faeb 100644
---- a/meson.build
-+++ b/meson.build
-@@ -579,10 +579,6 @@ endforeach
- 
- conf.set_quoted('TELINIT', get_option('telinit-path'))
- 
--if run_command('ln', '--relative', '--help').returncode() != 0
--        error('ln does not support --relative (added in coreutils 8.16)')
--endif
--
- ############################################################
- 
- gperf = find_program('gperf')
-diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
-index da0d13a341..90bc0a93c2 100755
---- a/tools/meson-make-symlink.sh
-+++ b/tools/meson-make-symlink.sh
-@@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
- if [ "$(dirname $1)" = . ]; then
-     ln -vfs -T "$1" "${DESTDIR:-}$2"
- else
--    ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
-+    rm -f "${DESTDIR:-}$2"
-+    lnr "${DESTDIR:-}$1" "${DESTDIR:-}$2"
- fi
-diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
-index a483d75b86..3c01c523f1 100755
---- a/units/meson-add-wants.sh
-+++ b/units/meson-add-wants.sh
-@@ -25,4 +25,9 @@ case "$target" in
-         ;;
- esac
- 
--ln -vfs --relative "$unitpath" "$dir"
-+if [ -d "$dir" ]; then
-+        rm -f "$dir/$unit"
-+        lnr "$unitpath" "$dir/$unit"
-+else
-+        lnr "$unitpath" "$dir"
-+fi
diff --git a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
index 6695d5680443..c6204786b3cd 100644
--- a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
@@ -1,7 +1,7 @@
-From 47864989388bcd04d647ecf618ad7e260399dbb6 Mon Sep 17 00:00:00 2001
+From f9078501a1495c9991431d1435d081cd2e830328 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 3/5] implment systemd-sysv-install for OE
+Subject: [PATCH] implment systemd-sysv-install for OE
 
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -9,12 +9,13 @@ to check the status of the sysv service
 Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/systemctl/systemd-sysv-install.SKELETON | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
-index 8c16cf9..9f078a1 100755
+index 8c16cf99913f..9f078a121469 100755
 --- a/src/systemctl/systemd-sysv-install.SKELETON
 +++ b/src/systemctl/systemd-sysv-install.SKELETON
 @@ -32,17 +32,17 @@ case "$1" in
@@ -38,6 +39,3 @@ index 8c16cf9..9f078a1 100755
          ;;
      *)
          usage ;;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index 2e39f7a2e19b..140489514335 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,24 +1,28 @@
-From a9421d55102fc84f77f7c21a2479fcd00652b896 Mon Sep 17 00:00:00 2001
+From 233de872b9b033ec842c2135152d2e006ac44c16 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH 03/24] missing_type.h: add __compare_fn_t and comparison_fn_t
+Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
 
 Make it work with musl where comparison_fn_t and __compare_fn_t
 is not provided.
 
 Upstream-Status: Inappropriate [musl specific]
 
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+[Rebased for v244]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
 ---
  src/basic/missing_type.h | 9 +++++++++
  src/basic/sort-util.h    | 1 +
+ src/core/kmod-setup.c    | 1 +
  src/journal/catalog.c    | 1 +
- 3 files changed, 11 insertions(+)
+ 4 files changed, 12 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index bf8a6caa1b..2134fe5095 100644
+index bf8a6caa1b46..c487e65e7bde 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -10,3 +10,12 @@
@@ -35,29 +39,38 @@ index bf8a6caa1b..2134fe5095 100644
 +typedef int (*__compar_fn_t)(const void *, const void *);
 +#endif
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index e029f86..7247d40 100644
+index 27d68b341cf3..307ea4ac0e8e 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
  #include <stdlib.h>
  
  #include "macro.h"
-+#include "missing.h"
++#include "missing_type.h"
  
  void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
                   __compar_d_fn_t compar, void *arg);
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index 128674327362..09ccd613e32c 100644
+--- a/src/core/kmod-setup.c
++++ b/src/core/kmod-setup.c
+@@ -10,6 +10,7 @@
+ #include "kmod-setup.h"
+ #include "macro.h"
+ #include "string-util.h"
++#include "missing_type.h"
+ 
+ #if HAVE_KMOD
+ #include "module-util.h"
 diff --git a/src/journal/catalog.c b/src/journal/catalog.c
-index 7beffc1e1a..4818a2e5cc 100644
+index 70b2c8b46c4e..d574a64586f1 100644
 --- a/src/journal/catalog.c
 +++ b/src/journal/catalog.c
-@@ -29,6 +29,7 @@
+@@ -28,6 +28,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "tmpfile-util.h"
-+#include "missing.h"
++#include "missing_type.h"
  
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch b/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
index 7ee0d48fa671..538a99c7d7e0 100644
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
@@ -1,4 +1,7 @@
-Include signal.h
+From 082d2eb2a65525890a913723764e67a36ee75384 Mon Sep 17 00:00:00 2001
+From: Scott Murray <scott.murray@konsulko.com>
+Date: Fri, 13 Sep 2019 19:26:27 -0400
+Subject: [PATCH] Include signal.h
 
 Fixes several signal set related errors:
 src/basic/copy.c:92:19: error: implicit declaration of function 'sigemptyset' [-Werror=implicit-function-declaration]
@@ -9,17 +12,18 @@ src/basic/copy.c:95:13: error: implicit declaration of function 'sigtimedwait' [
 Upstream-Status: Pending
 
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/copy.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/basic/copy.c b/src/basic/copy.c
-index ca311e021e..3cf7fc1697 100644
+index 9028868f696d..5168586fa522 100644
 --- a/src/basic/copy.c
 +++ b/src/basic/copy.c
-@@ -12,6 +12,7 @@
+@@ -8,6 +8,7 @@
+ #include <sys/sendfile.h>
  #include <sys/xattr.h>
- #include <time.h>
  #include <unistd.h>
 +#include <signal.h>
  
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index a2aad40ac252..71e52c49674e 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,7 +1,7 @@
-From 7bcf3b166694090497a0acd2c5299e4e04fcc9b6 Mon Sep 17 00:00:00 2001
+From 142dcaef0d24a78d3c0c94168b66fdf234497e97 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:04:21 +0800
-Subject: [PATCH 04/24] add fallback parse_printf_format implementation
+Subject: [PATCH] add fallback parse_printf_format implementation
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -10,11 +10,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  meson.build                     |   1 +
  src/basic/meson.build           |   5 +
- src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++++++++++
- src/basic/parse-printf-format.h |  57 +++++++++
+ src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++
+ src/basic/parse-printf-format.h |  57 +++++++
  src/basic/stdio-util.h          |   2 +-
  src/journal/journal-send.c      |   2 +-
  6 files changed, 338 insertions(+), 2 deletions(-)
@@ -22,10 +23,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index 79b762faeb..7f8c679411 100644
+index 21d6968abdf4..bab0bf84806c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -613,6 +613,7 @@ endif
+@@ -628,6 +628,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -34,10 +35,10 @@ index 79b762faeb..7f8c679411 100644
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index d6caf28f14..32c1acf349 100644
+index f70d1b8bf8a0..4cd57373e10d 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -312,6 +312,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
+@@ -311,6 +311,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
  endforeach
  
  basic_sources += generated_gperf_headers
@@ -51,7 +52,7 @@ index d6caf28f14..32c1acf349 100644
          'gcrypt-util.h')
 diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
 new file mode 100644
-index 0000000000..49437e5445
+index 000000000000..49437e544540
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -330,7 +331,7 @@ index 0000000000..49437e5445
 +}
 diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
 new file mode 100644
-index 0000000000..47be7522d7
+index 000000000000..47be7522d7fa
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -392,7 +393,7 @@ index 0000000000..47be7522d7
 +
 +#endif /* HAVE_PRINTF_H */
 diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index c3b9448d4f..2937aa13b1 100644
+index c3b9448d4f4f..2937aa13b178 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,13 +1,13 @@
@@ -411,7 +412,7 @@ index c3b9448d4f..2937aa13b1 100644
  #define snprintf_ok(buf, len, fmt, ...) \
          ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
 diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index 5ef11fa1a4..6384ab620c 100644
+index 912ecef73cce..43ed756bda53 100644
 --- a/src/journal/journal-send.c
 +++ b/src/journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -420,9 +421,9 @@ index 5ef11fa1a4..6384ab620c 100644
  #include <fcntl.h>
 -#include <printf.h>
  #include <stddef.h>
- #include <sys/socket.h>
  #include <sys/un.h>
-@@ -21,6 +20,7 @@
+ #include <unistd.h>
+@@ -20,6 +19,7 @@
  #include "stdio-util.h"
  #include "string-util.h"
  #include "tmpfile-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
index 0f75e8c12dee..685df01a10ee 100644
--- a/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
@@ -1,4 +1,7 @@
-Handle __cpu_mask usage
+From 6883ffc99168056101c667c6421f8353d5ad675a Mon Sep 17 00:00:00 2001
+From: Scott Murray <scott.murray@konsulko.com>
+Date: Fri, 13 Sep 2019 19:26:27 -0400
+Subject: [PATCH] Handle __cpu_mask usage
 
 Fixes errors:
 
@@ -15,13 +18,14 @@ add a typedef to cpu-set-util.h defining __cpu_mask appropriately.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/shared/cpu-set-util.h | 2 ++
  src/test/test-sizeof.c    | 2 +-
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
-index 27812dfd59..f698f9df83 100644
+index 27812dfd5923..0ab40731ea93 100644
 --- a/src/shared/cpu-set-util.h
 +++ b/src/shared/cpu-set-util.h
 @@ -6,6 +6,8 @@
@@ -34,7 +38,7 @@ index 27812dfd59..f698f9df83 100644
  typedef struct CPUSet {
          cpu_set_t *set;
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index a710db5370..d1601ad929 100644
+index a710db5370b8..d1601ad9292d 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -1,6 +1,5 @@
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index adfc3b78618f..aa4bb063c92d 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,7 +1,7 @@
-From 399fd3eda3045636a70da438a0fd1406cc332ed1 Mon Sep 17 00:00:00 2001
+From 9597196234a0ccf30d7f65cf185a8c24cb3158b3 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
-Subject: [PATCH 05/24] src/basic/missing.h: check for missing strndupa
+Subject: [PATCH] src/basic/missing.h: check for missing strndupa
 
 include missing.h  for definition of strndupa
 
@@ -13,28 +13,47 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+[rebased for systemd 244]
+
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
+ src/basic/cgroup-util.c                    |  1 +
  src/basic/env-util.c                       |  1 +
+ src/basic/log.c                            |  1 +
  src/basic/missing_stdlib.h                 | 12 ++++++++++++
  src/basic/mkdir.c                          |  1 +
  src/basic/parse-util.c                     |  1 +
  src/basic/proc-cmdline.c                   |  1 +
  src/basic/procfs-util.c                    |  1 +
+ src/basic/selinux-util.c                   |  1 +
  src/basic/time-util.c                      |  1 +
+ src/boot/bless-boot.c                      |  1 +
  src/core/dbus-cgroup.c                     |  1 +
+ src/core/dbus-execute.c                    |  1 +
  src/core/dbus-util.c                       |  1 +
+ src/core/execute.c                         |  1 +
  src/core/kmod-setup.c                      |  1 +
  src/core/service.c                         |  1 +
+ src/coredump/coredump-vacuum.c             |  1 +
+ src/journal-remote/journal-remote-main.c   |  1 +
  src/journal/journalctl.c                   |  1 +
  src/libsystemd/sd-bus/bus-message.c        |  1 +
  src/libsystemd/sd-bus/bus-objects.c        |  1 +
+ src/libsystemd/sd-bus/bus-socket.c         |  1 +
+ src/libsystemd/sd-bus/sd-bus.c             |  1 +
  src/libsystemd/sd-bus/test-bus-benchmark.c |  1 +
  src/locale/keymap-util.c                   |  1 +
  src/login/pam_systemd.c                    |  1 +
  src/network/generator/network-generator.c  |  1 +
  src/nspawn/nspawn-settings.c               |  1 +
+ src/nss-mymachines/nss-mymachines.c        |  1 +
+ src/portable/portable.c                    |  1 +
+ src/resolve/resolvectl.c                   |  1 +
+ src/shared/bus-unit-procs.c                |  1 +
+ src/shared/bus-unit-util.c                 |  1 +
+ src/shared/bus-util.c                      |  1 +
  src/shared/dns-domain.c                    |  1 +
  src/shared/journal-importer.c              |  1 +
  src/shared/logs-show.c                     |  1 +
@@ -46,13 +65,13 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 32 files changed, 43 insertions(+)
+ 48 files changed, 59 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 7f8c679411..81c061b768 100644
+index bab0bf84806c..f4e1736cf09e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -506,6 +506,7 @@ foreach ident : [
+@@ -517,6 +517,7 @@ foreach ident : [
                                   #include <unistd.h>'''],
          ['get_mempolicy',     '''#include <stdlib.h>
                                   #include <unistd.h>'''],
@@ -61,31 +80,55 @@ index 7f8c679411..81c061b768 100644
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
 diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index dfd6805398..c2b2ace6ec 100644
+index 048441429025..01d74ea0ed4e 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -17,6 +17,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static int find_pci_or_platform_parent(sd_device *device, sd_device **ret) {
          const char *subsystem, *sysname, *value;
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index 54fc6ecf8b20..a5141f4cbedd 100644
+--- a/src/basic/cgroup-util.c
++++ b/src/basic/cgroup-util.c
+@@ -37,6 +37,7 @@
+ #include "strv.h"
+ #include "unit-name.h"
+ #include "user-util.h"
++#include "missing_stdlib.h"
+ 
+ static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
+         _cleanup_free_ char *fs = NULL;
 diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index a6503cf2b6..ceef9a62c8 100644
+index b8dc98915f81..5049b37594bc 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
-@@ -16,6 +16,7 @@
+@@ -15,6 +15,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "utf8.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  #define VALID_CHARS_ENV_NAME                    \
          DIGITS LETTERS                          \
+diff --git a/src/basic/log.c b/src/basic/log.c
+index 17557e1844b2..6cec4d324aab 100644
+--- a/src/basic/log.c
++++ b/src/basic/log.c
+@@ -34,6 +34,7 @@
+ #include "terminal-util.h"
+ #include "time-util.h"
+ #include "utf8.h"
++#include "missing_stdlib.h"
+ 
+ #define SNDBUF_SIZE (8*1024*1024)
+ 
 diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 188a8d4406..1e16ec287a 100644
+index 188a8d44066a..1e16ec287aad 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -105,338 +148,506 @@ index 188a8d4406..1e16ec287a 100644
 +  })
 +#endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 6b82eab640..51c6b78615 100644
+index fa682d4c438e..37902551490a 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
-@@ -14,6 +14,7 @@
+@@ -13,6 +13,7 @@
  #include "stat-util.h"
  #include "stdio-util.h"
  #include "user-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
          struct stat st;
 diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 115a1494a2..07a34bfd53 100644
+index aec6099c9cc1..744b9b134ce4 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
-@@ -20,6 +20,7 @@
+@@ -18,6 +18,7 @@
  #include "process-util.h"
  #include "stat-util.h"
  #include "string-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  int parse_boolean(const char *v) {
          if (!v)
 diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 09169cf963..f411ba897f 100644
+index d3d99d9a7f90..e0b9efad03a2 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
  #include "string-util.h"
  #include "util.h"
  #include "virt.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  int proc_cmdline(char **ret) {
          const char *e;
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 7aaf95bfce..42ce53d5aa 100644
+index 7aaf95bfced2..da7e836f143e 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
  #include "procfs-util.h"
  #include "stdio-util.h"
  #include "string-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
+index f35e760233be..e4b0a8aa445e 100644
+--- a/src/basic/selinux-util.c
++++ b/src/basic/selinux-util.c
+@@ -26,6 +26,7 @@
+ #include "selinux-util.h"
+ #include "stdio-util.h"
+ #include "time-util.h"
++#include "missing_stdlib.h"
+ 
+ #if HAVE_SELINUX
+ DEFINE_TRIVIAL_CLEANUP_FUNC(char*, freecon);
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index 3018e81acb..4e2b3b66c1 100644
+index bfe2c60da173..d7ef30d2fe52 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
-@@ -28,6 +28,7 @@
+@@ -26,6 +26,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "time-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static clockid_t map_clock_id(clockid_t c) {
  
+diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
+index b96e1f927fff..cba979baca3e 100644
+--- a/src/boot/bless-boot.c
++++ b/src/boot/bless-boot.c
+@@ -18,6 +18,7 @@
+ #include "util.h"
+ #include "verbs.h"
+ #include "virt.h"
++#include "missing_stdlib.h"
+ 
+ static char **arg_path = NULL;
+ 
 diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 2f2313c599..c9937f9d62 100644
+index 27dc9e43c3e2..b1a83023600b 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -15,6 +15,7 @@
  #include "fileio.h"
  #include "limits-util.h"
  #include "path-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
- static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_cgroup_device_policy, cgroup_device_policy, CGroupDevicePolicy);
+ BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
+ 
+diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
+index 1d0bc1ede3cb..313654913345 100644
+--- a/src/core/dbus-execute.c
++++ b/src/core/dbus-execute.c
+@@ -41,6 +41,7 @@
+ #include "unit-printf.h"
+ #include "user-util.h"
+ #include "utf8.h"
++#include "missing_stdlib.h"
  
+ BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
+ static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
 diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index 7862beaacb..19f6968cfe 100644
+index 7862beaacb6d..3b1ea53a5f0d 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -7,6 +7,7 @@
  #include "unit-printf.h"
  #include "user-util.h"
  #include "unit.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
+diff --git a/src/core/execute.c b/src/core/execute.c
+index abc164ff5bef..f04b8ba05002 100644
+--- a/src/core/execute.c
++++ b/src/core/execute.c
+@@ -88,6 +88,7 @@
+ #include "unit.h"
+ #include "user-util.h"
+ #include "utmp-wtmp.h"
++#include "missing_stdlib.h"
+ 
+ #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
+ #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
 diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index a91cfebc67..a45961013f 100644
+index 09ccd613e32c..f4e64fa283e9 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
- #include "kmod-setup.h"
  #include "macro.h"
  #include "string-util.h"
-+#include "missing.h"
+ #include "missing_type.h"
++#include "missing_stdlib.h"
  
  #if HAVE_KMOD
- #include <libkmod.h>
+ #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 73b3c9c316..ef74f00a08 100644
+index 49ad166c2604..c3b14067e201 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
-@@ -43,6 +43,7 @@
+@@ -41,6 +41,7 @@
  #include "unit.h"
  #include "utf8.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
+diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
+index 35885dfb47c4..bb9f0660a6a0 100644
+--- a/src/coredump/coredump-vacuum.c
++++ b/src/coredump/coredump-vacuum.c
+@@ -16,6 +16,7 @@
+ #include "string-util.h"
+ #include "time-util.h"
+ #include "user-util.h"
++#include "missing_stdlib.h"
+ 
+ #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
+ #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index ac2bf648d2af..06c86f0201af 100644
+--- a/src/journal-remote/journal-remote-main.c
++++ b/src/journal-remote/journal-remote-main.c
+@@ -21,6 +21,7 @@
+ #include "stat-util.h"
+ #include "string-table.h"
+ #include "strv.h"
++#include "missing_stdlib.h"
+ 
+ #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
+ #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 6d6bb1cf63..6666349a35 100644
+index 95b6bfee172a..e0bcfb9d4233 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
-@@ -70,6 +70,7 @@
+@@ -68,6 +68,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "varlink.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  
 diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index eb029e4453..f31fe9d5a8 100644
+index eb029e445326..8da2c5d51a75 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -21,6 +21,7 @@
  #include "strv.h"
  #include "time-util.h"
  #include "utf8.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index ae643cacc7..1b752271a5 100644
+index ae643cacc740..f766e235206d 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -13,6 +13,7 @@
  #include "set.h"
  #include "string-util.h"
  #include "strv.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
+diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
+index 18d30d010a20..be2ab703f8ed 100644
+--- a/src/libsystemd/sd-bus/bus-socket.c
++++ b/src/libsystemd/sd-bus/bus-socket.c
+@@ -28,6 +28,7 @@
+ #include "string-util.h"
+ #include "user-util.h"
+ #include "utf8.h"
++#include "missing_stdlib.h"
+ 
+ #define SNDBUF_SIZE (8*1024*1024)
+ 
+diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
+index 058492a83eec..54c896f572b9 100644
+--- a/src/libsystemd/sd-bus/sd-bus.c
++++ b/src/libsystemd/sd-bus/sd-bus.c
+@@ -41,6 +41,7 @@
+ #include "process-util.h"
+ #include "string-util.h"
+ #include "strv.h"
++#include "missing_stdlib.h"
+ 
+ #define log_debug_bus_message(m)                                         \
+         do {                                                             \
 diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 8de0a859ee..4fd0a2e692 100644
+index 8de0a859ee94..58044b6ba908 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
  #include "missing_resource.h"
  #include "time-util.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  #define MAX_SIZE (2*1024*1024)
  
 diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index f8c36c94f5..41f5606aea 100644
+index 519dd0d188cf..a8f536915bb2 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
-@@ -22,6 +22,7 @@
+@@ -21,6 +21,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "tmpfile-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
 diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index 3f762cbbc3..005cfea658 100644
+index aa6e5ea7aca8..c439c21b2872 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -28,6 +28,7 @@
  #include "hostname-util.h"
  #include "login-util.h"
  #include "macro.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  #include "parse-util.h"
  #include "path-util.h"
  #include "process-util.h"
 diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 0b5af33566..9c808cd014 100644
+index 81afa9530762..2c5328f97c63 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
  #include "string-table.h"
  #include "string-util.h"
  #include "strv.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  /*
    # .network
 diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 3a99736813..279fea4d88 100644
+index 5fb5b49bbcc3..785ccc2da307 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
  #include "strv.h"
  #include "user-util.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  Settings *settings_new(void) {
          Settings *s;
+diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
+index 364356da5622..47d4ea44e40f 100644
+--- a/src/nss-mymachines/nss-mymachines.c
++++ b/src/nss-mymachines/nss-mymachines.c
+@@ -19,6 +19,7 @@
+ #include "signal-util.h"
+ #include "string-util.h"
+ #include "user-util.h"
++#include "missing_stdlib.h"
+ 
+ NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
+ NSS_GETPW_PROTOTYPES(mymachines);
+diff --git a/src/portable/portable.c b/src/portable/portable.c
+index 34b123e84692..5a48504d00ac 100644
+--- a/src/portable/portable.c
++++ b/src/portable/portable.c
+@@ -29,6 +29,7 @@
+ #include "strv.h"
+ #include "tmpfile-util.h"
+ #include "user-util.h"
++#include "missing_stdlib.h"
+ 
+ static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
+ 
+diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
+index 0a96a18b3836..432d6ebc3730 100644
+--- a/src/resolve/resolvectl.c
++++ b/src/resolve/resolvectl.c
+@@ -31,6 +31,7 @@
+ #include "strv.h"
+ #include "terminal-util.h"
+ #include "verbs.h"
++#include "missing_stdlib.h"
+ 
+ static int arg_family = AF_UNSPEC;
+ static int arg_ifindex = 0;
+diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
+index b21fe393265f..af2640005c1d 100644
+--- a/src/shared/bus-unit-procs.c
++++ b/src/shared/bus-unit-procs.c
+@@ -10,6 +10,7 @@
+ #include "sort-util.h"
+ #include "string-util.h"
+ #include "terminal-util.h"
++#include "missing_stdlib.h"
+ 
+ struct CGroupInfo {
+         char *cgroup_path;
+diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
+index 22a15493d7f3..3f4c51975675 100644
+--- a/src/shared/bus-unit-util.c
++++ b/src/shared/bus-unit-util.c
+@@ -34,6 +34,7 @@
+ #include "unit-def.h"
+ #include "user-util.h"
+ #include "utf8.h"
++#include "missing_stdlib.h"
+ 
+ int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
+         assert(message);
+diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
+index aea46d311996..223426298144 100644
+--- a/src/shared/bus-util.c
++++ b/src/shared/bus-util.c
+@@ -34,6 +34,7 @@
+ #include "stdio-util.h"
+ #include "strv.h"
+ #include "user-util.h"
++#include "missing_stdlib.h"
+ 
+ static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+         sd_event *e = userdata;
 diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index f62ad0a0f5..f1a27e158d 100644
+index b812665315f6..8e68f7f8fc6c 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
-@@ -24,6 +24,7 @@
+@@ -23,6 +23,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "utf8.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
 diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index 7c4fc7021d..a6ff2214df 100644
+index 7c4fc7021dec..3fbaf5a63969 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -14,6 +14,7 @@
  #include "parse-util.h"
  #include "string-util.h"
  #include "unaligned.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
 diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index b615c70dff..75b26e9c21 100644
+index 95b2e3376e9a..facc23aaecd5 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
-@@ -39,6 +39,7 @@
+@@ -37,6 +37,7 @@
  #include "time-util.h"
  #include "utf8.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
 diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 7c20b100b4..e4209d3a95 100644
+index 1fe9db179176..67954b5cab93 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
-@@ -25,6 +25,7 @@
+@@ -23,6 +23,7 @@
  #include "strv.h"
  #include "terminal-util.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static pid_t pager_pid = 0;
  
 diff --git a/src/shared/path-lookup.c b/src/shared/path-lookup.c
-index 6bf0ff0316..f6c8009cd2 100644
+index 5b1620974536..0e7cd1c2af12 100644
 --- a/src/shared/path-lookup.c
 +++ b/src/shared/path-lookup.c
-@@ -20,6 +20,7 @@
+@@ -19,6 +19,7 @@
  #include "tmpfile-util.h"
  #include "user-util.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
 diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 7cb7d8a477..8b12b91084 100644
+index 7cb7d8a477e9..8e7d7f9e7ca6 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
  #include "sort-util.h"
  #include "uid-range.h"
  #include "user-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
 diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index abbbc9f2d6..6179b5851e 100644
+index 2fb9c854fa50..58cef31458f7 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
-@@ -28,6 +28,7 @@
+@@ -26,6 +26,7 @@
  #include "socket-util.h"
  #include "string-util.h"
  #include "util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  #define BUFFER_SIZE (256 * 1024)
  
 diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index 52217429b1..a05e7782f6 100644
+index 52217429b154..70708dedf318 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
  #include "hexdecoct.h"
  #include "macro.h"
  #include "string-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
 diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index e8f1ce1354..8693cb02a4 100644
+index ca38f5608791..9d8cf4d2807b 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
-@@ -23,6 +23,7 @@
+@@ -22,6 +22,7 @@
  #include "strv.h"
  #include "sysexits.h"
  #include "udev-builtin.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
 diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index 8cfa2cdf23..b0670c77ec 100644
+index 58d484280aa5..90eab6806b55 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
-@@ -35,6 +35,7 @@
+@@ -34,6 +34,7 @@
  #include "udev-util.h"
  #include "udev-watch.h"
  #include "user-util.h"
-+#include "missing.h"
++#include "missing_stdlib.h"
  
  typedef struct Spawn {
          sd_device *device;
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 1642f10535..fe2aa75478 100644
+index 6168b332d3b2..245fe0a64d22 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -28,6 +28,7 @@
- #include "udev-event.h"
+@@ -30,6 +30,7 @@
  #include "udev-rules.h"
  #include "user-util.h"
-+#include "missing.h"
+ #include "virt.h"
++#include "missing_stdlib.h"
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 6d73d715ce37..ea003fd7dab7 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,4 +1,7 @@
-Include netinet/if_ether.h
+From 3932ce7f6c8ace5e1210aad20e1a141cb29329b1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Oct 2017 22:10:42 -0700
+Subject: [PATCH] Include netinet/if_ether.h
 
 Fixes
 /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
@@ -26,11 +29,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/libsystemd-network/sd-dhcp6-client.c  | 1 -
  src/libsystemd/sd-netlink/netlink-types.c | 1 +
  src/machine/machine-dbus.c                | 1 +
+ src/network/netdev/bond.c                 | 1 +
+ src/network/netdev/bridge.c               | 1 +
  src/network/netdev/macsec.c               | 1 +
+ src/network/netdev/netdev-gperf.gperf     | 1 +
  src/network/netdev/netdev.c               | 1 +
  src/network/networkd-brvlan.c             | 1 +
  src/network/networkd-dhcp-common.c        | 1 +
@@ -38,26 +45,27 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/network/networkd-dhcp6.c              | 2 +-
  src/network/networkd-link.c               | 2 +-
  src/network/networkd-network.c            | 1 +
+ src/network/test-network-tables.c         | 1 +
  src/shared/ethtool-util.c                 | 1 +
  src/shared/ethtool-util.h                 | 1 +
  src/udev/net/link-config.c                | 1 +
  src/udev/udev-builtin-net_setup_link.c    | 1 +
- 15 files changed, 14 insertions(+), 4 deletions(-)
+ 19 files changed, 18 insertions(+), 4 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index d7a5349c70..68b41dfb6c 100644
+index 5417ba8c5feb..d3aba928dd96 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
-@@ -6,7 +6,6 @@
+@@ -5,7 +5,6 @@
+ 
  #include <errno.h>
- #include <string.h>
  #include <sys/ioctl.h>
 -#include <linux/if_arp.h>
  #include <linux/if_infiniband.h>
  
  #include "sd-dhcp6-client.h"
 diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index de9b8b21ab..f64f6500f7 100644
+index a55460f03407..6f9cd527c800 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
@@ -69,19 +77,41 @@ index de9b8b21ab..f64f6500f7 100644
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
 diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 0d58b5eb8b..01093c1f62 100644
+index 3b2ac3829859..760ccb445cd0 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
-@@ -4,6 +4,7 @@
- #include <string.h>
+@@ -3,6 +3,7 @@
+ #include <errno.h>
  #include <sys/mount.h>
  #include <sys/wait.h>
 +#include <netinet/if_ether.h>
  
  /* When we include libgen.h because we need dirname() we immediately
   * undefine basename() since libgen.h defines it as a macro to the POSIX
+diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
+index 185b155440e7..dc1cd236c814 100644
+--- a/src/network/netdev/bond.c
++++ b/src/network/netdev/bond.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <netinet/if_ether.h>
+ #include "alloc-util.h"
+ #include "bond.h"
+ #include "conf-parser.h"
+diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
+index 59a40faef8fa..8e821a3216b3 100644
+--- a/src/network/netdev/bridge.c
++++ b/src/network/netdev/bridge.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <netinet/if_ether.h>
+ #include <net/if.h>
+ 
+ #include "bridge.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index cf281e75a6..269dc618ff 100644
+index 25dc23ff0338..f20d11fbcf53 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,5 +1,6 @@
@@ -91,8 +121,20 @@ index cf281e75a6..269dc618ff 100644
  #include <netinet/in.h>
  #include <linux/if_ether.h>
  #include <linux/if_macsec.h>
+diff --git a/src/network/netdev/netdev-gperf.gperf b/src/network/netdev/netdev-gperf.gperf
+index 09a5f4822e03..873299b1f98a 100644
+--- a/src/network/netdev/netdev-gperf.gperf
++++ b/src/network/netdev/netdev-gperf.gperf
+@@ -2,6 +2,7 @@
+ #if __GNUC__ >= 7
+ _Pragma("GCC diagnostic ignored \"-Wimplicit-fallthrough\"")
+ #endif
++#include <netinet/if_ether.h>
+ #include <stddef.h>
+ #include "bond.h"
+ #include "bridge.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 7735b455b7..ed4eda4a44 100644
+index 6908c4e811b0..e0d8c459ab63 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -1,5 +1,6 @@
@@ -103,7 +145,7 @@ index 7735b455b7..ed4eda4a44 100644
  #include <netinet/in.h>
  
 diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index c3c5d535ac..ebea408c89 100644
+index c3c5d535ac66..ebea408c89a8 100644
 --- a/src/network/networkd-brvlan.c
 +++ b/src/network/networkd-brvlan.c
 @@ -4,6 +4,7 @@
@@ -115,19 +157,19 @@ index c3c5d535ac..ebea408c89 100644
  #include <stdbool.h>
  
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 626b975839..42fe92f320 100644
+index 6465a8cfe9c7..bd4b2cdfac15 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
-@@ -1,6 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1+ */
- 
+@@ -4,6 +4,7 @@
+ #include "escape.h"
+ #include "in-addr-util.h"
  #include "networkd-dhcp-common.h"
 +#include <netinet/if_ether.h>
  #include "networkd-network.h"
  #include "parse-util.h"
  #include "string-table.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 662770b50e..c6ab62a94d 100644
+index 8ca87d99d4db..a66284896cf3 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -1,8 +1,8 @@
@@ -139,9 +181,9 @@ index 662770b50e..c6ab62a94d 100644
 -#include <linux/if_arp.h>
  
  #include "alloc-util.h"
- #include "hostname-util.h"
+ #include "dhcp-client-internal.h"
 diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
-index 8ad736a82b..f41b4d834e 100644
+index 647623ac3778..325c641c6231 100644
 --- a/src/network/networkd-dhcp6.c
 +++ b/src/network/networkd-dhcp6.c
 @@ -3,9 +3,9 @@
@@ -156,7 +198,7 @@ index 8ad736a82b..f41b4d834e 100644
  
  #include "sd-dhcp6-client.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index f5bb78890a..f13a36b791 100644
+index 2e60adbf7818..05aa8672d585 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -1,8 +1,8 @@
@@ -170,7 +212,7 @@ index f5bb78890a..f13a36b791 100644
  
  #include "alloc-util.h"
 diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
-index 2b8d0eb2fb..2f79ef25cd 100644
+index 6e443975f171..d1aab0ca5ba2 100644
 --- a/src/network/networkd-network.c
 +++ b/src/network/networkd-network.c
 @@ -1,5 +1,6 @@
@@ -180,8 +222,17 @@ index 2b8d0eb2fb..2f79ef25cd 100644
  #include <net/if.h>
  #include <netinet/in.h>
  #include <linux/netdevice.h>
+diff --git a/src/network/test-network-tables.c b/src/network/test-network-tables.c
+index 25b939639775..530e4928835c 100644
+--- a/src/network/test-network-tables.c
++++ b/src/network/test-network-tables.c
+@@ -1,3 +1,4 @@
++#include <netinet/if_ether.h>
+ #include "bond.h"
+ #include "dhcp6-internal.h"
+ #include "dhcp6-protocol.h"
 diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
-index b0961df72e..53fcbbd84b 100644
+index 3119b2b92e3b..927ddd067eef 100644
 --- a/src/shared/ethtool-util.c
 +++ b/src/shared/ethtool-util.c
 @@ -1,5 +1,6 @@
@@ -192,7 +243,7 @@ index b0961df72e..53fcbbd84b 100644
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
 diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
-index 8b32b243f3..262b819976 100644
+index d408bcd90a0b..7a1e399af023 100644
 --- a/src/shared/ethtool-util.h
 +++ b/src/shared/ethtool-util.h
 @@ -2,6 +2,7 @@
@@ -204,7 +255,7 @@ index 8b32b243f3..262b819976 100644
  
  #include "conf-parser.h"
 diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
-index d44af64d5e..fd052f1591 100644
+index 7b07e2f38fa8..18680a8e5484 100644
 --- a/src/udev/net/link-config.c
 +++ b/src/udev/net/link-config.c
 @@ -1,5 +1,6 @@
@@ -215,7 +266,7 @@ index d44af64d5e..fd052f1591 100644
  #include <netinet/ether.h>
  
 diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index ee3ca9fa38..9aa4e82874 100644
+index ee3ca9fa3846..9aa4e828741f 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
index 34f7f5fb7486..580c49fecfbd 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
@@ -1,8 +1,7 @@
-From f8a239b182158ca0a537ba053cb0e6bad9c3a2fb Mon Sep 17 00:00:00 2001
+From 77f98727f1d19a8fb327b55c92f1a9ee7b859e9f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH 07/24] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not 
- defined
+Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
 
 If the standard library doesn't provide brace
 expansion users just won't get it.
@@ -17,6 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/glob-util.c     | 12 ++++++++++++
  src/test/test-glob-util.c | 16 ++++++++++++++++
@@ -24,10 +24,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 38 insertions(+)
 
 diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index b335af8d97..2cdfc11f16 100644
+index e3aa6c2e152b..38070b79c83a 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
-@@ -14,6 +14,12 @@
+@@ -12,6 +12,12 @@
  #include "path-util.h"
  #include "strv.h"
  
@@ -40,7 +40,7 @@ index b335af8d97..2cdfc11f16 100644
  static void closedir_wrapper(void* v) {
          (void) closedir(v);
  }
-@@ -21,6 +27,7 @@ static void closedir_wrapper(void* v) {
+@@ -19,6 +25,7 @@ static void closedir_wrapper(void* v) {
  int safe_glob(const char *path, int flags, glob_t *pglob) {
          int k;
  
@@ -48,7 +48,7 @@ index b335af8d97..2cdfc11f16 100644
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -34,9 +41,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -64,10 +64,10 @@ index b335af8d97..2cdfc11f16 100644
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
 diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index b4f41445fe..f0d474ed14 100644
+index 667d15335fbf..76a84443aacf 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
-@@ -13,6 +13,12 @@
+@@ -12,6 +12,12 @@
  #include "rm-rf.h"
  #include "tmpfile-util.h"
  
@@ -80,7 +80,7 @@ index b4f41445fe..f0d474ed14 100644
  static void test_glob_exists(void) {
          char name[] = "/tmp/test-glob_exists.XXXXXX";
          int fd = -1;
-@@ -40,11 +46,13 @@ static void test_glob_no_dot(void) {
+@@ -39,11 +45,13 @@ static void test_glob_no_dot(void) {
          const char *fn;
  
          _cleanup_globfree_ glob_t g = {
@@ -94,7 +94,7 @@ index b4f41445fe..f0d474ed14 100644
          };
  
          int r;
-@@ -52,11 +60,19 @@ static void test_glob_no_dot(void) {
+@@ -51,11 +59,19 @@ static void test_glob_no_dot(void) {
          assert_se(mkdtemp(template));
  
          fn = strjoina(template, "/*");
@@ -115,10 +115,10 @@ index b4f41445fe..f0d474ed14 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 3c30612af1..14bc428085 100644
+index 193ed0bc781b..2f94fd2efd8f 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
-@@ -63,6 +63,12 @@
+@@ -58,6 +58,12 @@
  #include "umask-util.h"
  #include "user-util.h"
  
@@ -131,7 +131,7 @@ index 3c30612af1..14bc428085 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1853,7 +1859,9 @@ finish:
+@@ -1850,7 +1856,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -141,7 +141,7 @@ index 3c30612af1..14bc428085 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1873,7 +1881,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1870,7 +1878,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index d5f2349f2b58..1f618932ea58 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,7 +1,7 @@
-From 6cd17c753d2c0a90fc791f69bbc694cbc8556a4f Mon Sep 17 00:00:00 2001
+From 7c440cfc53aa52c9dc91c3a8c105bcf314c53af6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH 08/24] add missing FTW_ macros for musl
+Subject: [PATCH] add missing FTW_ macros for musl
 
 This is to avoid build failures like below for musl.
 
@@ -10,12 +10,13 @@ This is to avoid build failures like below for musl.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_type.h | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index c487e65..23602eb 100644
+index c487e65e7bde..23602ebbd533 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
@@ -42,6 +43,3 @@ index c487e65..23602eb 100644
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 8bacd0289d67..0de1121906d3 100644
--- a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,20 +1,21 @@
-From f1f4b4f9684fed185bfa8b9ed409cdf241657e99 Mon Sep 17 00:00:00 2001
+From 5166a6657570d4072cdce118621791e4a8186e07 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
-Subject: [PATCH 10/24] fix missing of __register_atfork for non-glibc builds
+Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/process-util.c | 7 +++++++
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 78ce43b..aec2daf 100644
+index 9b6c4c31f713..24fec5ecb53a 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -22,6 +22,9 @@
+@@ -18,6 +18,9 @@
  #if HAVE_VALGRIND_VALGRIND_H
  #include <valgrind/valgrind.h>
  #endif
@@ -24,7 +25,7 @@ index 78ce43b..aec2daf 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1160,11 +1163,15 @@ void reset_cached_pid(void) {
+@@ -1114,11 +1117,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -40,6 +41,3 @@ index 78ce43b..aec2daf 100644
  
  pid_t getpid_cached(void) {
          static bool installed = false;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
index d6eda9c038fb..e00600ab7c32 100644
--- a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,7 +1,7 @@
-From e3f847bd0338d27aff3335b42661d8a4b66b965e Mon Sep 17 00:00:00 2001
+From f6df7f25a6bb00d5540915216adfff8afefec2b0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH 11/24] Use uintmax_t for handling rlim_t
+Subject: [PATCH] Use uintmax_t for handling rlim_t
 
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -20,6 +20,7 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/format-util.h |  8 +-------
  src/basic/rlimit-util.c | 10 +++++-----
@@ -27,10 +28,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 8 insertions(+), 14 deletions(-)
 
 diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index dece5d3..dbb87bc 100644
+index 59622508a333..779b6826d50e 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -42,13 +42,7 @@
+@@ -44,13 +44,7 @@
  #  define PRI_TIMEX "li"
  #endif
  
@@ -46,10 +47,10 @@ index dece5d3..dbb87bc 100644
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 74b3a02..b02c03c 100644
+index 2dc13eabc30d..0633cc67f417 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  s = strdup("infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -67,7 +68,7 @@ index 74b3a02..b02c03c 100644
  
          if (!s)
                  return -ENOMEM;
-@@ -404,7 +404,7 @@ int rlimit_nofile_safe(void) {
+@@ -403,7 +403,7 @@ int rlimit_nofile_safe(void) {
  
          rl.rlim_cur = FD_SETSIZE;
          if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
@@ -77,10 +78,10 @@ index 74b3a02..b02c03c 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index a708231..e2b8748 100644
+index f04b8ba05002..084cf1420078 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -4220,9 +4220,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -4455,9 +4455,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -92,6 +93,3 @@ index a708231..e2b8748 100644
                  }
  
          if (c->ioprio_set) {
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 914589dbd38e..aa23c7ab7d08 100644
--- a/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,22 +1,22 @@
-From d3d65d4036670cbd5129fe55c09ca391286ef4b3 Mon Sep 17 00:00:00 2001
+From 7874912817b5ac7ed7f8557359a12d9d4b2f53eb Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
-Subject: [PATCH 14/24] test-sizeof.c: Disable tests for missing typedefs in
- musl
+Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/test/test-sizeof.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 35b0876..e78e7ca 100644
+index 7fc16a62b656..a710db5370b8 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
-@@ -41,8 +41,10 @@ int main(void) {
+@@ -42,8 +42,10 @@ int main(void) {
          info(unsigned);
          info(long unsigned);
          info(long long unsigned);
@@ -27,7 +27,7 @@ index 35b0876..e78e7ca 100644
  
          info(float);
          info(double);
-@@ -60,7 +62,9 @@ int main(void) {
+@@ -61,7 +63,9 @@ int main(void) {
          info(ssize_t);
          info(time_t);
          info(usec_t);
@@ -37,6 +37,3 @@ index 35b0876..e78e7ca 100644
          info(pid_t);
          info(uid_t);
          info(gid_t);
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index fd407f604d66..efeef072950b 100644
--- a/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 48c628f532f6025c2d1646b6819cd81eb789d7fb Mon Sep 17 00:00:00 2001
+From e6f871078d8d6f076c84f908fa57af15417ab87d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH 15/24] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
 
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -25,16 +25,17 @@ just historical and not actually necessary or desired behaviour?
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  src/basic/fs-util.h          | 22 +++++++++++++++++++++-
  src/shared/base-filesystem.c |  6 +++---
  2 files changed, 24 insertions(+), 4 deletions(-)
 
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 7ad030b..d4cb1e9 100644
+index 78d68be9fd85..c5dc84d41868 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -32,7 +32,27 @@ int fchmod_opath(int fd, mode_t m);
+@@ -40,7 +40,27 @@ int fchmod_opath(int fd, mode_t m);
  
  int fd_warn_permissions(const char *path, int fd);
  
@@ -64,10 +65,10 @@ index 7ad030b..d4cb1e9 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 89d7a7d..34b4ad5 100644
+index 657407da2d37..fbd5782d84fc 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -53,7 +53,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -54,7 +54,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (i = 0; i < ELEMENTSOF(table); i ++) {
@@ -76,7 +77,7 @@ index 89d7a7d..34b4ad5 100644
                          continue;
  
                  if (table[i].target) {
-@@ -61,7 +61,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -62,7 +62,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -85,7 +86,7 @@ index 89d7a7d..34b4ad5 100644
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -72,7 +72,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -73,7 +73,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                                          if (!p)
                                                  return log_oom();
  
@@ -94,6 +95,3 @@ index 89d7a7d..34b4ad5 100644
                                                  continue;
                                  }
  
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index d5565698aa28..19a3eef84701 100644
--- a/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,8 +1,7 @@
-From af76c973e41929360a6e021f2ff9a7fc1d7994e9 Mon Sep 17 00:00:00 2001
+From ec335ef3bb903a7eaf054103cc51411e71e6448c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH 16/24] Define glibc compatible basename() for non-glibc
- systems
+Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
 
 Fixes builds with musl, even though systemd is adamant about
 using non-posix basename implementation, we have a way out
@@ -10,25 +9,24 @@ using non-posix basename implementation, we have a way out
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- src/machine/machine-dbus.c | 4 ++++
- 1 file changed, 4 insertions(+)
+ src/machine/machine-dbus.c | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 7a558df..eca7d4b 100644
+index 760ccb445cd0..0df20f3864b3 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
-@@ -11,6 +11,10 @@
+@@ -11,6 +11,11 @@
  #include <libgen.h>
  #undef basename
  
 +#if !defined(__GLIBC__)
++#include <string.h>
 +#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
 +#endif
 +
  #include "alloc-util.h"
  #include "bus-common-errors.h"
  #include "bus-internal.h"
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 24e24e8e5a4a..56f45381de0a 100644
--- a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From c7a4efb8bccb52e1714c151929c23e12bde59b82 Mon Sep 17 00:00:00 2001
+From a6f3359042219abaa8ae06dfcce41a4721e8c21f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH 17/24] Do not disable buffering when writing to oom_score_adj
+Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
 
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -19,15 +19,16 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index b1c08fcade..0a7a1f7d89 100644
+index 24fec5ecb53a..642b02443c85 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1474,7 +1474,7 @@ int set_oom_score_adjust(int value) {
+@@ -1492,7 +1492,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
diff --git a/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 5901772998c4..84a492f2904f 100644
--- a/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From fffb2810611b4a26f5c6c0958093b5b3b7d4cd99 Mon Sep 17 00:00:00 2001
+From 4938705454cf46cfe8deac8ce457d5d2432cbead Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 18/24] distinguish XSI-compliant strerror_r from GNU-specifi
+Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
  strerror_r
 
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -18,16 +18,17 @@ assigned to (char *) variable, resulting in segment fault.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/journal/journal-send.c        | 5 +++++
  src/libsystemd/sd-bus/bus-error.c | 5 +++++
  2 files changed, 10 insertions(+)
 
 diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index 3fea912..4f1e592 100644
+index 43ed756bda53..227ea64dbb48 100644
 --- a/src/journal/journal-send.c
 +++ b/src/journal/journal-send.c
-@@ -337,7 +337,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
+@@ -336,7 +336,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
                  char* j;
  
                  errno = 0;
@@ -41,7 +42,7 @@ index 3fea912..4f1e592 100644
                          char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
  
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index dc95237..bdda30f 100644
+index f760f0fdd21c..28a5159c4480 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
 @@ -379,7 +379,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
@@ -57,6 +58,3 @@ index dc95237..bdda30f 100644
                  if (errno == ERANGE || strlen(x) >= k - 1) {
                          free(m);
                          k *= 2;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index 35cc66ff6652..3b8064677f16 100644
--- a/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,7 +1,7 @@
-From 969ab9e68249fd383f4b513b1c9306bdac4ae9b2 Mon Sep 17 00:00:00 2001
+From 1c4c73a7cc0fb59eb68ab70699f7f51af5c163b2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
-Subject: [PATCH 19/24] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
+Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
 
 for currently unknown reasons they get exported to the shared libries
 even without being listed in the sym file
@@ -11,12 +11,13 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/libsystemd/sd-bus/bus-error.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index bdda30f..e21853c 100644
+index 28a5159c4480..962a4de10c56 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
 @@ -54,8 +54,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
@@ -30,6 +31,3 @@ index bdda30f..e21853c 100644
  
  /* Additional maps registered with sd_bus_error_add_map() are in this
   * NULL terminated array */
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
index 753d5116ac91..db4041bbb1bb 100644
--- a/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,7 +1,7 @@
-From 75c06e3e2a4760b36fffd95cdf5535b8ad73c481 Mon Sep 17 00:00:00 2001
+From 8303d49cabaf3ab8890ba1d266972c721dfe6ee8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
-Subject: [PATCH 20/24] missing_type.h: add __compar_d_fn_t definition
+Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
 
 Fix the following compile failure:
 src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
@@ -9,12 +9,13 @@ src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_type.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index 7d7c1e4..85902ab 100644
+index 23602ebbd533..917d314a81bf 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -13,6 +13,7 @@
@@ -25,6 +26,3 @@ index 7d7c1e4..85902ab 100644
  #endif
  
  #ifndef __COMPAR_FN_T
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
index cdddf838907d..7dacc3683737 100644
--- a/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,7 +1,7 @@
-From 3fbf61d54b82fc9bf21d8039bfd89dc9efc5bbcd Mon Sep 17 00:00:00 2001
+From 6364ff5534678c158a7fb8d4e50d0a6ce72c1ad8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH 21/24] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH] avoid redefinition of prctl_mm_map structure
 
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -9,12 +9,13 @@ error: redefinition of 'struct prctl_mm_map'
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_prctl.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
-index f80cd17..47e4893 100644
+index f80cd17f346b..47e489354053 100644
 --- a/src/basic/missing_prctl.h
 +++ b/src/basic/missing_prctl.h
 @@ -1,7 +1,9 @@
@@ -27,6 +28,3 @@ index f80cd17..47e4893 100644
  
  /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
  #ifndef PR_CAP_AMBIENT
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
index e266b9b125d5..33c575871c64 100644
--- a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
+++ b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
@@ -1,4 +1,4 @@
-From 6bcf562bd1e541c7aa46923d9a14201c7f785261 Mon Sep 17 00:00:00 2001
+From 3cc30186f9d9adb565dc29f2d4e68889974676ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 16 Dec 2019 12:49:07 -0800
 Subject: [PATCH] Use INT_MAX instead of TIME_T_MAX for timerfd_settime timeout
@@ -11,15 +11,16 @@ purposes
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
 ---
  src/basic/time-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index bfe2c60da1..8cf682b36a 100644
+index d7ef30d2fe52..4d3219f114b5 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
-@@ -1486,7 +1486,7 @@ int time_change_fd(void) {
+@@ -1487,7 +1487,7 @@ int time_change_fd(void) {
  
          /* We only care for the cancellation event, hence we set the timeout to the latest possible value. */
          static const struct itimerspec its = {
@@ -28,6 +29,3 @@ index bfe2c60da1..8cf682b36a 100644
          };
  
          _cleanup_close_ int fd;
--- 
-2.24.1
-
diff --git a/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
index 0e5629d37b5b..80beada3d386 100644
--- a/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
@@ -1,7 +1,7 @@
-From 902412c271e0c5d9cb93b10ec0fb5b119b393474 Mon Sep 17 00:00:00 2001
+From a05cc5fb3dc0e51682c40196285cdda34ec90783 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
-Subject: [PATCH 24/24] test-json.c: define M_PIl
+Subject: [PATCH] test-json.c: define M_PIl
 
 Fix the following compile failure:
 src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this function); did you mean 'M_PI'?
@@ -9,15 +9,16 @@ src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this functi
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/test/test-json.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-json.c b/src/test/test-json.c
-index 9b8a2a9..efc746c 100644
+index a6613043b924..ca823ea79f05 100644
 --- a/src/test/test-json.c
 +++ b/src/test/test-json.c
-@@ -11,6 +11,10 @@
+@@ -12,6 +12,10 @@
  #include "tests.h"
  #include "util.h"
  
@@ -28,6 +29,3 @@ index 9b8a2a9..efc746c 100644
  static void test_tokenizer(const char *data, ...) {
          unsigned line = 0, column = 0;
          void *state = NULL;
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd_243.4.bb b/meta/recipes-core/systemd/systemd_244.1.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_243.4.bb
rename to meta/recipes-core/systemd/systemd_244.1.bb
index a0d10e03beb4..b6865194822b 100644
--- a/meta/recipes-core/systemd/systemd_243.4.bb
+++ b/meta/recipes-core/systemd/systemd_244.1.bb
@@ -18,7 +18,6 @@ SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
-           file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://99-default.preset \
            "
@@ -591,6 +590,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/ata_id \
                ${rootlibexecdir}/udev/cdrom_id \
                ${rootlibexecdir}/udev/collect \
+               ${rootlibexecdir}/udev/fido_id \
                ${rootlibexecdir}/udev/findkeyboards \
                ${rootlibexecdir}/udev/keyboard-force-release.sh \
                ${rootlibexecdir}/udev/keymap \
-- 
2.17.1


