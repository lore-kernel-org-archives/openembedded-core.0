Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 415216BA9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 10:21:50 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x3IALowh026803
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 18 Apr 2019 12:21:51 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x3IALoR1000495;
	Thu, 18 Apr 2019 12:21:50 +0200
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1BCD49A3B67;
	Thu, 18 Apr 2019 12:21:49 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 12:19:06 +0200
Message-Id: <20190418101906.15246-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] systemd: upgrade to 242
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
X-List-Received-Date: Thu, 18 Apr 2019 10:21:52 -0000

PATCH REBASED:
==============
0001-do-not-disable-buffer-in-writing-files.patch
0002-don-t-use-glibc-specific-qsort_r.patch
0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
0004-add-fallback-parse_printf_format-implementation.patch
0005-rules-watch-metadata-changes-in-ide-devices.patch
0005-src-basic-missing.h-check-for-missing-strndupa.patch
0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
0021-avoid-redefinition-of-prctl_mm_map-structure.patch
0024-test-json.c-define-M_PIl.patch

PATCH DROPPED:
==============
0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
0001-meson-declare-version.h-as-dependency-for-systemd.patch
0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch

PATCH ADDED:
0025-fs-utilh-add-missing-sys-stat-include.patch

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../{systemd-boot_241.bb => systemd-boot_242.bb}   |   0
 .../{systemd-conf_241.bb => systemd-conf_242.bb}   |   0
 meta/recipes-core/systemd/systemd.inc              |   4 +-
 ...01-do-not-disable-buffer-in-writing-files.patch | 208 ++++---------
 ...re-version.h-as-dep-for-various-targets-t.patch | 118 --------
 ...clare-version.h-as-dependency-for-systemd.patch |  32 --
 .../0002-don-t-use-glibc-specific-qsort_r.patch    |  39 ++-
 ...e.h-add-__compare_fn_t-and-comparison_fn_.patch |  32 +-
 ...llback-parse_printf_format-implementation.patch |  22 +-
 ...les-watch-metadata-changes-in-ide-devices.patch |   4 +-
 ...asic-missing.h-check-for-missing-strndupa.patch | 326 +++++++++++++++++++--
 ...-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch |  55 ++--
 ...il-don-t-fail-if-libc-doesn-t-support-IDN.patch |   8 +-
 ...exdecoct.c-Include-missing.h-for-strndupa.patch |  28 --
 ...ble-buffering-when-writing-to-oom_score_a.patch |   9 +-
 ...id-redefinition-of-prctl_mm_map-structure.patch |  19 +-
 .../systemd/0024-test-json.c-define-M_PIl.patch    |   8 +-
 ...025-fs-utilh-add-missing-sys-stat-include.patch |  28 ++
 .../systemd/{systemd_241.bb => systemd_242.bb}     |   4 +-
 19 files changed, 492 insertions(+), 452 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_241.bb => systemd-boot_242.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_241.bb => systemd-conf_242.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
 rename meta/recipes-core/systemd/{systemd_241.bb => systemd_242.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_241.bb b/meta/recipes-core/systemd/systemd-boot_242.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_241.bb
rename to meta/recipes-core/systemd/systemd-boot_242.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_241.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_241.bb
rename to meta/recipes-core/systemd/systemd-conf_242.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 5bd88ed6ed..193087ab05 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
-SRCBRANCH = "v241-stable"
+SRCREV = "1e5d2d656420d0e755dbcf72aeba3c3aba54e956"
+SRCBRANCH = "v242-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
index a6857b1f47..68ca604d6d 100644
--- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -14,6 +14,8 @@ This is specific to musl.
 Upstream-Status: Inappropriate [musl]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Rebased for v242]
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 ---
  src/basic/cgroup-util.c                 | 14 +++++++-------
  src/basic/procfs-util.c                 |  4 ++--
@@ -25,21 +27,20 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/hibernate-resume/hibernate-resume.c |  2 +-
  src/libsystemd/sd-device/sd-device.c    |  2 +-
  src/login/logind-dbus.c                 |  2 +-
- src/network/networkd-ipv6-proxy-ndp.c   |  2 +-
- src/network/networkd-link.c             | 18 +++++++++---------
  src/nspawn/nspawn-cgroup.c              |  2 +-
  src/nspawn/nspawn.c                     |  6 +++---
+ src/shared/sysctl-util.c                |  2 +-
  src/sleep/sleep.c                       | 12 ++++++------
  src/udev/udevadm-trigger.c              |  2 +-
  src/udev/udevd.c                        |  6 +++---
  src/vconsole/vconsole-setup.c           |  2 +-
- 18 files changed, 48 insertions(+), 48 deletions(-)
+ 17 files changed, 39 insertions(+), 39 deletions(-)
 
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 8ce7ccb..b633226 100644
+index fc28109..44fe985 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -818,7 +818,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -822,7 +822,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -48,7 +49,7 @@ index 8ce7ccb..b633226 100644
          if (r < 0)
                  return r;
  
-@@ -1100,7 +1100,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1104,7 +1104,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -57,7 +58,7 @@ index 8ce7ccb..b633226 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -1118,7 +1118,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1122,7 +1122,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -66,7 +67,7 @@ index 8ce7ccb..b633226 100644
                  if (r < 0)
                          return r;
  
-@@ -1145,7 +1145,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1149,7 +1149,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -75,7 +76,7 @@ index 8ce7ccb..b633226 100644
          if (r < 0)
                  return r;
  
-@@ -1155,7 +1155,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1159,7 +1159,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -84,7 +85,7 @@ index 8ce7ccb..b633226 100644
          if (r < 0)
                  return r;
  
-@@ -2012,7 +2012,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -2016,7 +2016,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -93,7 +94,7 @@ index 8ce7ccb..b633226 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-@@ -2660,7 +2660,7 @@ int cg_enable_everywhere(
+@@ -2664,7 +2664,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
  
@@ -103,10 +104,10 @@ index 8ce7ccb..b633226 100644
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 42ce53d..5751253 100644
+index 7aaf95b..25fc3de 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -85,13 +85,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -136,10 +137,10 @@ index 123d00e..e7ea78f 100644
                  return r;
  
 diff --git a/src/basic/util.c b/src/basic/util.c
-index e577c93..3c64f91 100644
+index 93d610b..97dca64 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
-@@ -631,7 +631,7 @@ void disable_coredumps(void) {
+@@ -294,7 +294,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
  
@@ -149,10 +150,10 @@ index e577c93..3c64f91 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
 diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index af31f09..eec5738 100644
+index 66e2f01..5daa43b 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
-@@ -47,7 +47,7 @@ static int delete_rule(const char *rule) {
+@@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
          if (!fn)
                  return log_oom();
  
@@ -161,7 +162,7 @@ index af31f09..eec5738 100644
  }
  
  static int apply_rule(const char *rule) {
-@@ -55,7 +55,7 @@ static int apply_rule(const char *rule) {
+@@ -56,7 +56,7 @@ static int apply_rule(const char *rule) {
  
          (void) delete_rule(rule);
  
@@ -170,7 +171,7 @@ index af31f09..eec5738 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to add binary format: %m");
  
-@@ -212,7 +212,7 @@ static int run(int argc, char *argv[]) {
+@@ -213,7 +213,7 @@ static int run(int argc, char *argv[]) {
                  }
  
                  /* Flush out all rules */
@@ -180,10 +181,10 @@ index af31f09..eec5738 100644
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
 diff --git a/src/core/main.c b/src/core/main.c
-index 561f956..db6f113 100644
+index 46db471..726ccaf 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1468,7 +1468,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1469,7 +1469,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -192,7 +193,7 @@ index 561f956..db6f113 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1683,7 +1683,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1684,7 +1684,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -202,10 +203,10 @@ index 561f956..db6f113 100644
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
 diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 49b37ae..c96eedc 100644
+index cd7fb01..077e861 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -350,17 +350,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -351,17 +351,17 @@ int mac_smack_setup(bool *loaded_policy) {
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -241,10 +242,10 @@ index 17e7cd1..87a7667 100644
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index 2a69f2e..9d55340 100644
+index c2315c0..00f81b4 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1836,7 +1836,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -1852,7 +1852,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -254,10 +255,10 @@ index 2a69f2e..9d55340 100644
                  if (r == -ELOOP)
                          return -EINVAL;
 diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 8ab498f..d27ef9c 100644
+index 2cebcce..7111fc1 100644
 --- a/src/login/logind-dbus.c
 +++ b/src/login/logind-dbus.c
-@@ -1231,7 +1231,7 @@ static int trigger_device(Manager *m, sd_device *d) {
+@@ -1285,7 +1285,7 @@ static int trigger_device(Manager *m, sd_device *d) {
                  if (!t)
                          return -ENOMEM;
  
@@ -266,109 +267,11 @@ index 8ab498f..d27ef9c 100644
          }
  
          return 0;
-diff --git a/src/network/networkd-ipv6-proxy-ndp.c b/src/network/networkd-ipv6-proxy-ndp.c
-index f594b27..c283cc3 100644
---- a/src/network/networkd-ipv6-proxy-ndp.c
-+++ b/src/network/networkd-ipv6-proxy-ndp.c
-@@ -43,7 +43,7 @@ static int ipv6_proxy_ndp_set(Link *link) {
-         v = ipv6_proxy_ndp_is_needed(link);
-         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/proxy_ndp");
- 
--        r = write_string_file(p, one_zero(v), WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, one_zero(v), WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot configure proxy NDP for interface: %m");
- 
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 22392d7..e0ed551 100644
---- a/src/network/networkd-link.c
-+++ b/src/network/networkd-link.c
-@@ -274,7 +274,7 @@ static int link_enable_ipv6(Link *link) {
- 
-         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/disable_ipv6");
- 
--        r = write_string_file(p, one_zero(disabled), WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, one_zero(disabled), WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot %s IPv6 for interface %s: %m",
-                                        enable_disable(!disabled), link->ifname);
-@@ -1272,7 +1272,7 @@ static int link_set_proxy_arp(Link *link) {
- 
-         p = strjoina("/proc/sys/net/ipv4/conf/", link->ifname, "/proxy_arp");
- 
--        r = write_string_file(p, one_zero(link->network->proxy_arp), WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, one_zero(link->network->proxy_arp), WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot configure proxy ARP for interface: %m");
- 
-@@ -2541,7 +2541,7 @@ static int link_set_ipv4_forward(Link *link) {
-          * primarily to keep IPv4 and IPv6 packet forwarding behaviour
-          * somewhat in sync (see below). */
- 
--        r = write_string_file("/proc/sys/net/ipv4/ip_forward", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/proc/sys/net/ipv4/ip_forward", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot turn on IPv4 packet forwarding, ignoring: %m");
- 
-@@ -2563,7 +2563,7 @@ static int link_set_ipv6_forward(Link *link) {
-          * same behaviour there and also propagate the setting from
-          * one to all, to keep things simple (see above). */
- 
--        r = write_string_file("/proc/sys/net/ipv6/conf/all/forwarding", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/proc/sys/net/ipv6/conf/all/forwarding", "1", WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot configure IPv6 packet forwarding, ignoring: %m");
- 
-@@ -2583,7 +2583,7 @@ static int link_set_ipv6_privacy_extensions(Link *link) {
-         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/use_tempaddr");
-         xsprintf(buf, "%u", (unsigned) link->network->ipv6_privacy_extensions);
- 
--        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot configure IPv6 privacy extension for interface: %m");
- 
-@@ -2607,7 +2607,7 @@ static int link_set_ipv6_accept_ra(Link *link) {
-         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/accept_ra");
- 
-         /* We handle router advertisements ourselves, tell the kernel to GTFO */
--        r = write_string_file(p, "0", WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, "0", WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot disable kernel IPv6 accept_ra for interface: %m");
- 
-@@ -2635,7 +2635,7 @@ static int link_set_ipv6_dad_transmits(Link *link) {
-         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/dad_transmits");
-         xsprintf(buf, "%i", link->network->ipv6_dad_transmits);
- 
--        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot set IPv6 dad transmits for interface: %m");
- 
-@@ -2663,7 +2663,7 @@ static int link_set_ipv6_hop_limit(Link *link) {
-         p = strjoina("/proc/sys/net/ipv6/conf/", link->ifname, "/hop_limit");
-         xsprintf(buf, "%i", link->network->ipv6_hop_limit);
- 
--        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, buf, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot set IPv6 hop limit for interface: %m");
- 
-@@ -2689,7 +2689,7 @@ static int link_set_ipv6_mtu(Link *link) {
- 
-         xsprintf(buf, "%" PRIu32, link->network->ipv6_mtu);
- 
--        r = write_string_file(p, buf, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, buf, 0);
-         if (r < 0)
-                 log_link_warning_errno(link, r, "Cannot set IPv6 MTU for interface: %m");
- 
 diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 97fa092..b841f51 100644
+index 168125d..dd0ab79 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
          (void) mkdir_parents(fn, 0755);
  
          sprintf(pid_string, PID_FMT, pid);
@@ -378,10 +281,10 @@ index 97fa092..b841f51 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index e0c2d71..213790c 100644
+index 3b0ecb1..a1b5240 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2117,7 +2117,7 @@ static int reset_audit_loginuid(void) {
+@@ -2341,7 +2341,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -390,7 +293,7 @@ index e0c2d71..213790c 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3195,13 +3195,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3531,13 +3531,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -406,11 +309,24 @@ index e0c2d71..213790c 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
+diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
+index 9be4055..f935cde 100644
+--- a/src/shared/sysctl-util.c
++++ b/src/shared/sysctl-util.c
+@@ -73,7 +73,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+ 
+         log_debug("Setting '%s' to '%s'", p, value);
+ 
+-        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
++        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+ }
+ 
+ int sysctl_read(const char *property, char **content) {
 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 5b7984a..bf818aa 100644
+index 11aabaf..6aa5d37 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -43,7 +43,7 @@ static int write_hibernate_location_info(void) {
+@@ -48,7 +48,7 @@ static int write_hibernate_location_info(void) {
  
          /* if it's a swap partition, we just write the disk to /sys/power/resume */
          if (streq(type, "partition")) {
@@ -419,7 +335,7 @@ index 5b7984a..bf818aa 100644
                  if (r < 0)
                          return log_debug_errno(r, "Faileed to write partitoin device to /sys/power/resume: %m");
  
-@@ -79,12 +79,12 @@ static int write_hibernate_location_info(void) {
+@@ -84,12 +84,12 @@ static int write_hibernate_location_info(void) {
  
          offset = fiemap->fm_extents[0].fe_physical / page_size();
          xsprintf(offset_str, "%" PRIu64, offset);
@@ -434,7 +350,7 @@ index 5b7984a..bf818aa 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write device '%s': %m", device_str);
  
-@@ -98,7 +98,7 @@ static int write_mode(char **modes) {
+@@ -103,7 +103,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -443,7 +359,7 @@ index 5b7984a..bf818aa 100644
                  if (k >= 0)
                          return 0;
  
-@@ -117,7 +117,7 @@ static int write_state(FILE **f, char **states) {
+@@ -122,7 +122,7 @@ static int write_state(FILE **f, char **states) {
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -452,7 +368,7 @@ index 5b7984a..bf818aa 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-@@ -212,7 +212,7 @@ static int rtc_write_wake_alarm(uint64_t sec) {
+@@ -217,7 +217,7 @@ static int rtc_write_wake_alarm(uint64_t sec) {
  
          xsprintf(buf, "%" PRIu64, sec);
  
@@ -462,10 +378,10 @@ index 5b7984a..bf818aa 100644
                  return log_error_errno(r, "Failed to write '%s' to /sys/class/rtc/rtc0/wakealarm: %m", buf);
  
 diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
-index 9532946..2e576bb 100644
+index b7dafb7..bab4907 100644
 --- a/src/udev/udevadm-trigger.c
 +++ b/src/udev/udevadm-trigger.c
-@@ -42,7 +42,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
+@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
                  if (!filename)
                          return log_oom();
  
@@ -475,10 +391,10 @@ index 9532946..2e576bb 100644
                          log_debug_errno(r, "Failed to write '%s' to '%s', ignoring: %m", action, filename);
                          continue;
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index 0303f36..687d009 100644
+index 140ec35..33063a9 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
-@@ -1218,7 +1218,7 @@ static int synthesize_change(sd_device *dev) {
+@@ -1185,7 +1185,7 @@ static int synthesize_change(sd_device *dev) {
                   */
                  log_debug("Device '%s' is closed, synthesising 'change'", devname);
                  strscpyl(filename, sizeof(filename), syspath, "/uevent", NULL);
@@ -487,7 +403,7 @@ index 0303f36..687d009 100644
  
                  FOREACH_DEVICE(e, d) {
                          const char *t, *n, *s;
-@@ -1233,7 +1233,7 @@ static int synthesize_change(sd_device *dev) {
+@@ -1200,7 +1200,7 @@ static int synthesize_change(sd_device *dev) {
  
                          log_debug("Device '%s' is closed, synthesising partition '%s' 'change'", devname, n);
                          strscpyl(filename, sizeof(filename), s, "/uevent", NULL);
@@ -496,7 +412,7 @@ index 0303f36..687d009 100644
                  }
  
                  return 0;
-@@ -1241,7 +1241,7 @@ static int synthesize_change(sd_device *dev) {
+@@ -1208,7 +1208,7 @@ static int synthesize_change(sd_device *dev) {
  
          log_debug("Device %s is closed, synthesising 'change'", devname);
          strscpyl(filename, sizeof(filename), syspath, "/uevent", NULL);
@@ -506,10 +422,10 @@ index 0303f36..687d009 100644
          return 0;
  }
 diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index ebdeba3..aa879e6 100644
+index 67dc2e4..01b83d0 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -114,7 +114,7 @@ static int toggle_utf8(const char *name, int fd, bool utf8) {
+@@ -116,7 +116,7 @@ static int toggle_utf8(const char *name, int fd, bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -519,5 +435,5 @@ index ebdeba3..aa879e6 100644
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch b/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
deleted file mode 100644
index 01936f2857..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 9f86d8769ab830a724c84f849975b5595e26b47c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Sun, 24 Feb 2019 22:49:38 +0100
-Subject: [PATCH] meson: declare version.h as dep for various targets that
- include build.h
-
-Should fix #11565.
-
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build          | 19 +++++++++++++------
- src/core/meson.build |  3 ++-
- src/udev/meson.build |  1 +
- 3 files changed, 16 insertions(+), 7 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 30df834..232f3e1 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1637,7 +1637,8 @@ exe = executable('systemd-analyze',
-                  include_directories : includes,
-                  link_with : [libcore,
-                               libshared],
--                 dependencies : [threads,
-+                 dependencies : [versiondep,
-+                                 threads,
-                                  librt,
-                                  libseccomp,
-                                  libselinux,
-@@ -2183,7 +2184,8 @@ if conf.get('ENABLE_IMPORTD') == 1
-                                   systemd_pull_sources,
-                                   include_directories : includes,
-                                   link_with : [libshared],
--                                  dependencies : [libcurl,
-+                                  dependencies : [versiondep,
-+                                                  libcurl,
-                                                   libz,
-                                                   libbzip2,
-                                                   libxz,
-@@ -2232,7 +2234,8 @@ if conf.get('ENABLE_REMOTE') == 1 and conf.get('HAVE_LIBCURL') == 1
-                          systemd_journal_upload_sources,
-                          include_directories : includes,
-                          link_with : [libshared],
--                         dependencies : [threads,
-+                         dependencies : [versiondep,
-+                                         threads,
-                                          libcurl,
-                                          libgnutls,
-                                          libxz,
-@@ -2558,6 +2561,7 @@ exe = executable('systemd-stdio-bridge',
-                  'src/stdio-bridge/stdio-bridge.c',
-                  include_directories : includes,
-                  link_with : [libshared],
-+                 dependencies : [versiondep],
-                  install_rpath : rootlibexecdir,
-                  install : true)
- public_programs += exe
-@@ -2641,7 +2645,8 @@ exe = executable('systemd-udevd',
-                  link_with : [libudev_core,
-                               libsystemd_network,
-                               libudev_static],
--                 dependencies : [threads,
-+                 dependencies : [versiondep,
-+                                 threads,
-                                  libkmod,
-                                  libidn,
-                                  libacl,
-@@ -2658,7 +2663,8 @@ exe = executable('udevadm',
-                  link_with : [libudev_core,
-                               libsystemd_network,
-                               libudev_static],
--                 dependencies : [threads,
-+                 dependencies : [versiondep,
-+                                 threads,
-                                  libkmod,
-                                  libidn,
-                                  libacl,
-@@ -2798,7 +2804,8 @@ foreach tuple : tests
-                         sources,
-                         include_directories : incs,
-                         link_with : link_with,
--                        dependencies : dependencies,
-+                        dependencies : [versiondep,
-+                                        dependencies],
-                         c_args : defs,
-                         build_by_default : want_tests != 'false',
-                         install_rpath : rootlibexecdir,
-diff --git a/src/core/meson.build b/src/core/meson.build
-index 85021bd..88fb093 100644
---- a/src/core/meson.build
-+++ b/src/core/meson.build
-@@ -150,7 +150,8 @@ libcore = static_library(
-         load_fragment_gperf_c,
-         load_fragment_gperf_nulstr_c,
-         include_directories : includes,
--        dependencies : [threads,
-+        dependencies : [versiondep,
-+                        threads,
-                         librt,
-                         libseccomp,
-                         libpam,
-diff --git a/src/udev/meson.build b/src/udev/meson.build
-index 9d3f6d1..973a75e 100644
---- a/src/udev/meson.build
-+++ b/src/udev/meson.build
-@@ -180,6 +180,7 @@ foreach prog : [['ata_id/ata_id.c'],
-                    prog,
-                    include_directories : includes,
-                    c_args : ['-DLOG_REALM=LOG_REALM_UDEV'],
-+                   dependencies : [versiondep],
-                    link_with : [libudev_static],
-                    install_rpath : udev_rpath,
-                    install : true,
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch b/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch
deleted file mode 100644
index 8874dff9a5..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e14d724a932a255eec4d60b08e128519c33e88ee Mon Sep 17 00:00:00 2001
-From: Michael Olbrich <m.olbrich@pengutronix.de>
-Date: Mon, 25 Feb 2019 11:59:23 +0100
-Subject: [PATCH] meson: declare version.h as dependency for systemd
-
-This is a followup to #11815 and adds the last missing dependency.
-With this #11565 is hopefully really fixed.
-
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 232f3e1..70148be 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1618,7 +1618,8 @@ executable('systemd',
-            include_directories : includes,
-            link_with : [libcore,
-                         libshared],
--           dependencies : [threads,
-+           dependencies : [versiondep,
-+                           threads,
-                            librt,
-                            libseccomp,
-                            libselinux,
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 36e0699da9..c6213ab88e 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -8,20 +8,23 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Rebased for v242]
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 ---
- src/basic/util.h                   | 14 --------------
+ src/basic/sort-util.h              | 14 --------------
  src/libsystemd/sd-hwdb/hwdb-util.c | 19 ++++++++++++++-----
  src/shared/format-table.c          | 36 ++++++++++++++++++++++++------------
  3 files changed, 38 insertions(+), 31 deletions(-)
 
-diff --git a/src/basic/util.h b/src/basic/util.h
-index dc33d66..9f6a6ce 100644
---- a/src/basic/util.h
-+++ b/src/basic/util.h
-@@ -116,20 +116,6 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
+index e029f8646e..27d68b341c 100644
+--- a/src/basic/sort-util.h
++++ b/src/basic/sort-util.h
+@@ -54,17 +54,3 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+                 int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
                  qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
- 
+-
 -static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
 -        if (nmemb <= 1)
 -                return;
@@ -35,15 +38,11 @@ index dc33d66..9f6a6ce 100644
 -                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
 -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
--
- /* Normal memcpy requires src to be nonnull. We do nothing if n is 0. */
- static inline void memcpy_safe(void *dst, const void *src, size_t n) {
-         if (n == 0)
 diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
-index f852967..b570ce1 100644
+index c83575c7c8..72f8f3a050 100644
 --- a/src/libsystemd/sd-hwdb/hwdb-util.c
 +++ b/src/libsystemd/sd-hwdb/hwdb-util.c
-@@ -126,9 +126,13 @@ static void trie_free(struct trie *trie) {
+@@ -128,9 +128,13 @@ static void trie_free(struct trie *trie) {
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -60,7 +59,7 @@ index f852967..b570ce1 100644
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -156,7 +160,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -158,7 +162,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                          .value_off = v,
                  };
  
@@ -72,7 +71,7 @@ index f852967..b570ce1 100644
                  if (val) {
                          /* At this point we have 2 identical properties on the same match-string.
                           * Since we process files in order, we just replace the previous value. */
-@@ -182,7 +189,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -184,7 +191,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                  .line_number = line_number,
          };
          node->values_count++;
@@ -84,10 +83,10 @@ index f852967..b570ce1 100644
  }
  
 diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index 7d52980..75dbfe1 100644
+index a5c0a99b08..d595cbe372 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -848,31 +848,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+@@ -850,31 +850,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
          return CMP(index_a, index_b);
  }
  
@@ -131,7 +130,7 @@ index 7d52980..75dbfe1 100644
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1105,7 +1107,12 @@ int table_print(Table *t, FILE *f) {
+@@ -1107,7 +1109,12 @@ int table_print(Table *t, FILE *f) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -145,7 +144,7 @@ index 7d52980..75dbfe1 100644
          }
  
          if (t->display_map)
-@@ -1532,7 +1539,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+@@ -1534,7 +1541,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -160,5 +159,5 @@ index 7d52980..75dbfe1 100644
  
          if (t->display_map)
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index 5246b4b26c..2e39f7a2e1 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -9,14 +9,16 @@ is not provided.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Rebased for v242]
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 ---
  src/basic/missing_type.h | 9 +++++++++
- src/basic/util.h         | 1 +
+ src/basic/sort-util.h    | 1 +
  src/journal/catalog.c    | 1 +
  3 files changed, 11 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index bf8a6ca..c487e65 100644
+index bf8a6caa1b..2134fe5095 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -10,3 +10,12 @@
@@ -32,30 +34,30 @@ index bf8a6ca..c487e65 100644
 +#define __COMPAR_FN_T
 +typedef int (*__compar_fn_t)(const void *, const void *);
 +#endif
-diff --git a/src/basic/util.h b/src/basic/util.h
-index 9f6a6ce..2c5dc32 100644
---- a/src/basic/util.h
-+++ b/src/basic/util.h
-@@ -26,6 +26,7 @@
- #include "format-util.h"
+diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
+index e029f86..7247d40 100644
+--- a/src/basic/sort-util.h
++++ b/src/basic/sort-util.h
+@@ -4,6 +4,7 @@
+ #include <stdlib.h>
+ 
  #include "macro.h"
- #include "time-util.h"
 +#include "missing.h"
  
- size_t page_size(void) _pure_;
- #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
+ void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
+                  __compar_d_fn_t compar, void *arg);
 diff --git a/src/journal/catalog.c b/src/journal/catalog.c
-index 4062f12..034e00c 100644
+index 7beffc1e1a..4818a2e5cc 100644
 --- a/src/journal/catalog.c
 +++ b/src/journal/catalog.c
-@@ -26,6 +26,7 @@
+@@ -29,6 +29,7 @@
+ #include "string-util.h"
  #include "strv.h"
  #include "tmpfile-util.h"
- #include "util.h"
 +#include "missing.h"
  
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index bb738e22c1..fa8217e3da 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index 3386546..44b24ee 100644
+index 79195c9748..0bffbf29c5 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -667,6 +667,7 @@ foreach header : ['crypt.h',
+@@ -685,6 +685,7 @@ foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
                    'linux/can/vxcan.h',
@@ -32,10 +32,10 @@ index 3386546..44b24ee 100644
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index e5852f3..2192a0c 100644
+index 91e0df3d2f..a732b554da 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -284,6 +284,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
+@@ -298,6 +298,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
  endforeach
  
  basic_sources += generated_gperf_headers
@@ -49,7 +49,7 @@ index e5852f3..2192a0c 100644
          'gcrypt-util.h')
 diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
 new file mode 100644
-index 0000000..49437e5
+index 0000000000..49437e5445
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -328,7 +328,7 @@ index 0000000..49437e5
 +}
 diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
 new file mode 100644
-index 0000000..47be752
+index 0000000000..47be7522d7
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -390,7 +390,7 @@ index 0000000..47be752
 +
 +#endif /* HAVE_PRINTF_H */
 diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index dc67b6e..cf8d514 100644
+index c3b9448d4f..2937aa13b1 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,13 +1,13 @@
@@ -403,13 +403,13 @@ index dc67b6e..cf8d514 100644
  #include <sys/types.h>
  
  #include "macro.h"
- #include "util.h"
+ #include "memory-util.h"
 +#include "parse-printf-format.h"
  
  #define snprintf_ok(buf, len, fmt, ...) \
          ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
 diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index 8618454..3fea912 100644
+index 5ef11fa1a4..6384ab620c 100644
 --- a/src/journal/journal-send.c
 +++ b/src/journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -421,13 +421,13 @@ index 8618454..3fea912 100644
  #include <sys/socket.h>
  #include <sys/un.h>
 @@ -21,6 +20,7 @@
+ #include "stdio-util.h"
  #include "string-util.h"
  #include "tmpfile-util.h"
- #include "util.h"
 +#include "parse-printf-format.h"
  
  #define SNDBUF_SIZE (8*1024*1024)
  
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
index 2123052ff6..5312083fdd 100644
--- a/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
@@ -38,8 +38,8 @@ index a1458e9..3ba4b6b4 100644
  ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block", ATTR{block/*/uevent}="change"
  
  # watch metadata changes, caused by tools closing the device node which was opened for writing
--ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*", OPTIONS+="watch"
-+ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*|hd*", OPTIONS+="watch"
+-ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*|nbd*", OPTIONS+="watch"
++ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*|nbd*|hd*", OPTIONS+="watch"
 -- 
 2.7.4
 
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index f20897b5f8..a2e25a97df 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -9,21 +9,45 @@ Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Rebased for v242]
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 ---
- meson.build                |  1 +
- src/basic/missing_stdlib.h | 12 ++++++++++++
- src/basic/mkdir.c          |  1 +
- src/basic/parse-util.c     |  1 +
- src/basic/procfs-util.c    |  1 +
- src/shared/pager.c         |  1 +
- src/shared/uid-range.c     |  1 +
- 7 files changed, 18 insertions(+)
+ meson.build                                |  1 +
+ src/backlight/backlight.c                  |  1 +
+ src/basic/env-util.c                       |  1 +
+ src/basic/missing_stdlib.h                 | 12 ++++++++++++
+ src/basic/mkdir.c                          |  1 +
+ src/basic/parse-util.c                     |  1 +
+ src/basic/proc-cmdline.c                   |  1 +
+ src/basic/procfs-util.c                    |  1 +
+ src/basic/time-util.c                      |  1 +
+ src/core/dbus-cgroup.c                     |  1 +
+ src/core/dbus-util.c                       |  1 +
+ src/core/kmod-setup.c                      |  1 +
+ src/core/service.c                         |  1 +
+ src/journal/journalctl.c                   |  1 +
+ src/libsystemd/sd-bus/bus-message.c        |  1 +
+ src/libsystemd/sd-bus/bus-objects.c        |  1 +
+ src/libsystemd/sd-bus/test-bus-benchmark.c |  1 +
+ src/locale/keymap-util.c                   |  1 +
+ src/nspawn/nspawn-settings.c               |  1 +
+ src/shared/dns-domain.c                    |  1 +
+ src/shared/journal-importer.c              |  1 +
+ src/shared/logs-show.c                     |  1 +
+ src/shared/pager.c                         |  1 +
+ src/shared/path-lookup.c                   |  1 +
+ src/shared/uid-range.c                     |  1 +
+ src/socket-proxy/socket-proxyd.c           |  1 +
+ src/test/test-hexdecoct.c                  |  1 +
+ src/udev/udev-builtin-path_id.c            |  1 +
+ src/udev/udev-rules.c                      |  1 +
+ 29 files changed, 40 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 44b24ee..70fb218 100644
+index 79195c9..80d9564 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -558,6 +558,7 @@ foreach ident : [
+@@ -572,6 +572,7 @@ foreach ident : [
                                   #include <unistd.h>'''],
          ['explicit_bzero' ,   '''#include <string.h>'''],
          ['reallocarray',      '''#include <malloc.h>'''],
@@ -31,8 +55,32 @@ index 44b24ee..70fb218 100644
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
+diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
+index dfd6805..c2b2ace 100644
+--- a/src/backlight/backlight.c
++++ b/src/backlight/backlight.c
+@@ -17,6 +17,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ static int find_pci_or_platform_parent(sd_device *device, sd_device **ret) {
+         const char *subsystem, *sysname, *value;
+diff --git a/src/basic/env-util.c b/src/basic/env-util.c
+index fd449dc..e2b0722 100644
+--- a/src/basic/env-util.c
++++ b/src/basic/env-util.c
+@@ -16,6 +16,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "utf8.h"
++#include "missing.h"
+ 
+ #define VALID_CHARS_ENV_NAME                    \
+         DIGITS LETTERS                          \
 diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index c0ffe86..d50274b 100644
+index 188a8d4..1e16ec2 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -52,10 +100,10 @@ index c0ffe86..d50274b 100644
 +  })
 +#endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 4bb65d5..3038ab9 100644
+index 6b82eab..51c6b78 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
-@@ -13,6 +13,7 @@
+@@ -14,6 +14,7 @@
  #include "stat-util.h"
  #include "stdio-util.h"
  #include "user-util.h"
@@ -75,6 +123,18 @@ index 87724af..d9c53bc 100644
  
  int parse_boolean(const char *v) {
          if (!v)
+diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
+index 1670001..b51feaa 100644
+--- a/src/basic/proc-cmdline.c
++++ b/src/basic/proc-cmdline.c
+@@ -15,6 +15,7 @@
+ #include "string-util.h"
+ #include "util.h"
+ #include "virt.h"
++#include "missing.h"
+ 
+ int proc_cmdline(char **ret) {
+         const char *e;
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
 index 7aaf95b..42ce53d 100644
 --- a/src/basic/procfs-util.c
@@ -87,30 +147,258 @@ index 7aaf95b..42ce53d 100644
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index daf952b..374b97f 100644
+--- a/src/basic/time-util.c
++++ b/src/basic/time-util.c
+@@ -28,6 +28,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "time-util.h"
++#include "missing.h"
+ 
+ static clockid_t map_clock_id(clockid_t c) {
+ 
+diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
+index 4615aea..bc1364f 100644
+--- a/src/core/dbus-cgroup.c
++++ b/src/core/dbus-cgroup.c
+@@ -15,6 +15,7 @@
+ #include "fileio.h"
+ #include "limits-util.h"
+ #include "path-util.h"
++#include "missing.h"
+ 
+ static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_cgroup_device_policy, cgroup_device_policy, CGroupDevicePolicy);
+ 
+diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
+index f4fbb72..0a1e3b5 100644
+--- a/src/core/dbus-util.c
++++ b/src/core/dbus-util.c
+@@ -7,6 +7,7 @@
+ #include "unit-printf.h"
+ #include "user-util.h"
+ #include "unit.h"
++#include "missing.h"
+ 
+ int bus_property_get_triggered_unit(
+                 sd_bus *bus,
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index a91cfeb..a459610 100644
+--- a/src/core/kmod-setup.c
++++ b/src/core/kmod-setup.c
+@@ -11,6 +11,7 @@
+ #include "kmod-setup.h"
+ #include "macro.h"
+ #include "string-util.h"
++#include "missing.h"
+ 
+ #if HAVE_KMOD
+ #include <libkmod.h>
+diff --git a/src/core/service.c b/src/core/service.c
+index 0289990..0e725b5 100644
+--- a/src/core/service.c
++++ b/src/core/service.c
+@@ -42,6 +42,7 @@
+ #include "unit.h"
+ #include "utf8.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
+         [SERVICE_DEAD] = UNIT_INACTIVE,
+diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
+index 0048909..0e85eb7 100644
+--- a/src/journal/journalctl.c
++++ b/src/journal/journalctl.c
+@@ -67,6 +67,7 @@
+ #include "tmpfile-util.h"
+ #include "unit-name.h"
+ #include "user-util.h"
++#include "missing.h"
+ 
+ #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
+ 
+diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
+index 427d42f..b050568 100644
+--- a/src/libsystemd/sd-bus/bus-message.c
++++ b/src/libsystemd/sd-bus/bus-message.c
+@@ -21,6 +21,7 @@
+ #include "strv.h"
+ #include "time-util.h"
+ #include "utf8.h"
++#include "missing.h"
+ 
+ static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
+ 
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index d9fc256..e9c6932 100644
+--- a/src/libsystemd/sd-bus/bus-objects.c
++++ b/src/libsystemd/sd-bus/bus-objects.c
+@@ -13,6 +13,7 @@
+ #include "set.h"
+ #include "string-util.h"
+ #include "strv.h"
++#include "missing.h"
+ 
+ static int node_vtable_get_userdata(
+                 sd_bus *bus,
+diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
+index 8de0a85..4fd0a2e 100644
+--- a/src/libsystemd/sd-bus/test-bus-benchmark.c
++++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
+@@ -14,6 +14,7 @@
+ #include "missing_resource.h"
+ #include "time-util.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ #define MAX_SIZE (2*1024*1024)
+ 
+diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
+index b8bd181..fe0cae0 100644
+--- a/src/locale/keymap-util.c
++++ b/src/locale/keymap-util.c
+@@ -23,6 +23,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "tmpfile-util.h"
++#include "missing.h"
+ 
+ static bool startswith_comma(const char *s, const char *prefix) {
+         s = startswith(s, prefix);
+diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
+index 476cb07..91e28de 100644
+--- a/src/nspawn/nspawn-settings.c
++++ b/src/nspawn/nspawn-settings.c
+@@ -16,6 +16,7 @@
+ #include "strv.h"
+ #include "user-util.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ Settings *settings_new(void) {
+         Settings *s;
+diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
+index 4b31cb3..989ebf3 100644
+--- a/src/shared/dns-domain.c
++++ b/src/shared/dns-domain.c
+@@ -24,6 +24,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "utf8.h"
++#include "missing.h"
+ 
+ int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
+         const char *n;
+diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
+index 8638cd3..d03774a 100644
+--- a/src/shared/journal-importer.c
++++ b/src/shared/journal-importer.c
+@@ -13,6 +13,7 @@
+ #include "parse-util.h"
+ #include "string-util.h"
+ #include "unaligned.h"
++#include "missing.h"
+ 
+ enum {
+         IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
+diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
+index 5fb736f..19cb165 100644
+--- a/src/shared/logs-show.c
++++ b/src/shared/logs-show.c
+@@ -38,6 +38,7 @@
+ #include "time-util.h"
+ #include "utf8.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
+ #define PRINT_LINE_THRESHOLD 3
 diff --git a/src/shared/pager.c b/src/shared/pager.c
-index bf2597e..fa9e321 100644
+index 2abb0f6..a00c95f 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
-@@ -24,6 +24,7 @@
- #include "string-util.h"
+@@ -25,6 +25,7 @@
  #include "strv.h"
  #include "terminal-util.h"
+ #include "util.h"
 +#include "missing.h"
  
  static pid_t pager_pid = 0;
  
+diff --git a/src/shared/path-lookup.c b/src/shared/path-lookup.c
+index 442fde7..0eb1188 100644
+--- a/src/shared/path-lookup.c
++++ b/src/shared/path-lookup.c
+@@ -20,6 +20,7 @@
+ #include "tmpfile-util.h"
+ #include "user-util.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ int xdg_user_runtime_dir(char **ret, const char *suffix) {
+         const char *e;
 diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 5fa7bd2..9c63b9e 100644
+index 7cb7d8a..8b12b91 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
+ #include "sort-util.h"
  #include "uid-range.h"
  #include "user-util.h"
- #include "util.h"
 +#include "missing.h"
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
+diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
+index abbbc9f..6179b58 100644
+--- a/src/socket-proxy/socket-proxyd.c
++++ b/src/socket-proxy/socket-proxyd.c
+@@ -28,6 +28,7 @@
+ #include "socket-util.h"
+ #include "string-util.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ #define BUFFER_SIZE (256 * 1024)
+ 
+diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
+index 5221742..a05e778 100644
+--- a/src/test/test-hexdecoct.c
++++ b/src/test/test-hexdecoct.c
+@@ -6,6 +6,7 @@
+ #include "hexdecoct.h"
+ #include "macro.h"
+ #include "string-util.h"
++#include "missing.h"
+ 
+ static void test_hexchar(void) {
+         assert_se(hexchar(0xa) == 'a');
+diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
+index 7ce1c56..cc19b8e 100644
+--- a/src/udev/udev-builtin-path_id.c
++++ b/src/udev/udev-builtin-path_id.c
+@@ -23,6 +23,7 @@
+ #include "strv.h"
+ #include "sysexits.h"
+ #include "udev-builtin.h"
++#include "missing.h"
+ 
+ _printf_(2,3)
+ static void path_prepend(char **path, const char *fmt, ...) {
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index ee87d7c..9aced10 100644
+--- a/src/udev/udev-rules.c
++++ b/src/udev/udev-rules.c
+@@ -40,6 +40,7 @@
+ #include "udev.h"
+ #include "user-util.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ #define PREALLOC_TOKEN          2048
+ #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
index 765e4767fd..aa2b4cbcf1 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
@@ -16,28 +16,29 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/basic/glob-util.c     | 12 +++++++++++-
- src/test/test-glob-util.c | 17 +++++++++++++++--
- src/tmpfiles/tmpfiles.c   |  9 +++++++++
- 3 files changed, 35 insertions(+), 3 deletions(-)
+ src/basic/glob-util.c     | 13 ++++++++++++-
+ src/test/test-glob-util.c | 16 ++++++++++++++++
+ src/tmpfiles/tmpfiles.c   | 10 ++++++++++
+ 3 files changed, 38 insertions(+), 1 deletion(-)
 
 diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index 9fac676..962d8b9 100644
+index 32c53f8..ae358d9 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
-@@ -10,6 +10,11 @@
- #include "macro.h"
+@@ -13,6 +13,12 @@
  #include "path-util.h"
  #include "strv.h"
+ 
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
 +#ifndef GLOB_BRACE
 +#define GLOB_BRACE 0
 +#endif
- 
++
  static void closedir_wrapper(void* v) {
          (void) closedir(v);
-@@ -18,6 +23,7 @@ static void closedir_wrapper(void* v) {
+ }
+@@ -20,6 +26,7 @@ static void closedir_wrapper(void* v) {
  int safe_glob(const char *path, int flags, glob_t *pglob) {
          int k;
  
@@ -45,7 +46,7 @@ index 9fac676..962d8b9 100644
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -31,10 +37,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -33,10 +40,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -62,26 +63,25 @@ index 9fac676..962d8b9 100644
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
 diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index b4f4144..955b3ba 100644
+index b4f4144..f0d474e 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
-@@ -12,6 +12,11 @@
- #include "macro.h"
+@@ -13,6 +13,12 @@
  #include "rm-rf.h"
  #include "tmpfile-util.h"
+ 
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
 +#ifndef GLOB_BRACE
 +#define GLOB_BRACE 0
 +#endif
- 
++
  static void test_glob_exists(void) {
          char name[] = "/tmp/test-glob_exists.XXXXXX";
-@@ -38,25 +43,33 @@ static void closedir_wrapper(void* v) {
- static void test_glob_no_dot(void) {
-         char template[] = "/tmp/test-glob-util.XXXXXXX";
+         int fd = -1;
+@@ -40,11 +46,13 @@ static void test_glob_no_dot(void) {
          const char *fn;
--
+ 
          _cleanup_globfree_ glob_t g = {
 +#ifdef GLOB_ALTDIRFUNC
                  .gl_closedir = closedir_wrapper,
@@ -91,9 +91,9 @@ index b4f4144..955b3ba 100644
                  .gl_stat = stat,
 +#endif
          };
--
-         int r;
  
+         int r;
+@@ -52,11 +60,19 @@ static void test_glob_no_dot(void) {
          assert_se(mkdtemp(template));
  
          fn = strjoina(template, "/*");
@@ -114,22 +114,23 @@ index b4f4144..955b3ba 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index b66765b..11dbbf4 100644
+index d9d1cc1..477d1e3 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
-@@ -60,6 +60,11 @@
+@@ -63,6 +63,12 @@
  #include "umask-util.h"
  #include "user-util.h"
- #include "util.h"
+ 
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
 +#ifndef GLOB_BRACE
 +#define GLOB_BRACE 0
 +#endif
- 
++
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
-@@ -1853,7 +1858,9 @@ finish:
+  * properly owned directories beneath /tmp, /var/tmp, /run, which are
+@@ -1839,7 +1845,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -139,7 +140,7 @@ index b66765b..11dbbf4 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1873,7 +1880,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1859,7 +1867,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -150,5 +151,5 @@ index b66765b..11dbbf4 100644
          int r = 0, k;
          char **fn;
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
index 57cb5f3734..1dedbd3b9b 100644
--- a/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
+++ b/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
@@ -13,12 +13,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
-index 91bf801..c445fea 100644
+index 904bafb..a7a009d 100644
 --- a/src/basic/socket-util.c
 +++ b/src/basic/socket-util.c
-@@ -33,6 +33,16 @@
+@@ -34,6 +34,16 @@
+ #include "user-util.h"
  #include "utf8.h"
- #include "util.h"
  
 +/* Don't fail if the standard library
 + * doesn't support IDN */
@@ -34,5 +34,5 @@ index 91bf801..c445fea 100644
  #  define IDN_FLAGS NI_IDN
  #else
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch b/meta/recipes-core/systemd/systemd/0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
deleted file mode 100644
index 874c17c420..0000000000
--- a/meta/recipes-core/systemd/systemd/0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e5a48f84db58ffb9128383eaefc123b5829523e5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Oct 2017 12:33:22 -0700
-Subject: [PATCH 13/24] test-hexdecoct.c: Include missing.h for strndupa
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/test/test-hexdecoct.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index 5221742..a05e778 100644
---- a/src/test/test-hexdecoct.c
-+++ b/src/test/test-hexdecoct.c
-@@ -6,6 +6,7 @@
- #include "hexdecoct.h"
- #include "macro.h"
- #include "string-util.h"
-+#include "missing.h"
- 
- static void test_hexchar(void) {
-         assert_se(hexchar(0xa) == 'a');
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 05e6ded71d..b54635e8a9 100644
--- a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -22,10 +22,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index aec2daf..7b4aabf 100644
+index f773eea..79af915 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1538,7 +1538,7 @@ int set_oom_score_adjust(int value) {
+@@ -1546,7 +1546,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -33,7 +33,8 @@ index aec2daf..7b4aabf 100644
 +                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
  }
  
- static const char *const ioprio_class_table[] = {
+ int cpus_in_affinity_mask(void) {
 -- 
-2.7.4
+2.11.0
+
 
diff --git a/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
index a8c53c9314..cdddf83890 100644
--- a/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -11,8 +11,7 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  src/basic/missing_prctl.h | 2 ++
- src/basic/util.h          | 3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ 1 file changed, 2 insertions(+)
 
 diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
 index f80cd17..47e4893 100644
@@ -28,20 +27,6 @@ index f80cd17..47e4893 100644
  
  /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
  #ifndef PR_CAP_AMBIENT
-diff --git a/src/basic/util.h b/src/basic/util.h
-index 2c5dc32..f721184 100644
---- a/src/basic/util.h
-+++ b/src/basic/util.h
-@@ -26,7 +26,8 @@
- #include "format-util.h"
- #include "macro.h"
- #include "time-util.h"
--#include "missing.h"
-+#include "missing_stdlib.h"
-+#include "missing_type.h"
- 
- size_t page_size(void) _pure_;
- #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
index c2ae2bbb7b..0e5629d37b 100644
--- a/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
@@ -14,11 +14,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-json.c b/src/test/test-json.c
-index fdf1b4f..fa541f8 100644
+index 9b8a2a9..efc746c 100644
 --- a/src/test/test-json.c
 +++ b/src/test/test-json.c
-@@ -10,6 +10,10 @@
- #include "strv.h"
+@@ -11,6 +11,10 @@
+ #include "tests.h"
  #include "util.h"
  
 +#ifndef M_PIl
@@ -29,5 +29,5 @@ index fdf1b4f..fa541f8 100644
          unsigned line = 0, column = 0;
          void *state = NULL;
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
new file mode 100644
index 0000000000..1c6a6f50de
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
@@ -0,0 +1,28 @@
+From 2560a6b7b9adc5bd5dec0f87c2e3025ced8a2af2 Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Thu, 18 Apr 2019 10:47:11 +0200
+Subject: [PATCH] fs-utilh: add missing sys/stat include
+
+fix error:
+| error: passing argument 5 of 'chase_symlinks_and_stat' from incompatible pointer type [-Werror=incompatible-pointer-types]
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+---
+ src/basic/fs-util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
+index b965120..e2fdfff 100644
+--- a/src/basic/fs-util.h
++++ b/src/basic/fs-util.h
+@@ -8,6 +8,7 @@
+ #include <stdint.h>
+ #include <sys/inotify.h>
+ #include <sys/types.h>
++#include <sys/stat.h>
+ #include <unistd.h>
+ 
+ #include "errno-util.h"
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_242.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_241.bb
rename to meta/recipes-core/systemd/systemd_242.bb
index 3a58f44a3b..d54076acfc 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -22,8 +22,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
-           file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
-           file://0001-meson-declare-version.h-as-dependency-for-systemd.patch \
            "
 
 # patches needed by musl
@@ -40,7 +38,6 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
                file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
                file://0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
-               file://0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch \
                file://0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
                file://0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
                file://0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
@@ -52,6 +49,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0022-include-sys-wait.h-to-avoid-compile-failure.patch \
                file://0023-socket-util.h-include-string.h.patch \
                file://0024-test-json.c-define-M_PIl.patch \
+               file://0025-fs-utilh-add-missing-sys-stat-include.patch \
                file://0001-do-not-disable-buffer-in-writing-files.patch \
                "
 
-- 
2.11.0


