Return-Path: <bruno.bottazzini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AFFCD601DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:05:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Feb 2015 09:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="672737290"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2015 09:05:21 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 4 Feb 2015 09:05:21 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.44) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 4 Feb 2015 09:05:20 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Feb 2015 15:04:55 -0200
Message-ID: <1423069496-25819-2-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423069496-25819-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1423069496-25819-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.44]
Subject: [PATCH v2 1/2] systemd: update from 216 to 218
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
X-List-Received-Date: Wed, 04 Feb 2015 17:05:58 -0000
Content-Type: text/plain

---
 ...r-executing-scripts-under-etc-systemd-218.patch | 131 ++++++
 .../systemd/systemd_218-pam-fix-fallocate.patch    |  91 ++++
 meta/recipes-core/systemd/systemd_218.bb           | 482 +++++++++++++++++++++
 3 files changed, 704 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd_218.bb

diff --git a/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
new file mode 100644
index 0000000..d50f2cb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
@@ -0,0 +1,131 @@
+From 0dec519c563654148d3cdd363d2598b50313de60 Mon Sep 17 00:00:00 2001
+From: Bruno Bottazzini <bruno.bottazzini@intel.com>
+Date: Mon, 2 Feb 2015 13:53:24 -0200
+Subject: [PATCH 1/1] add support for executing scripts under /etc/rcS.d/
+
+To be compatible, all services translated from scripts under /etc/rcS.d would
+run before services translated from scripts under /etc/rcN.d.
+---
+ src/sysv-generator/sysv-generator.c | 46 ++++++++++++++++++++++++++++---------
+ 1 file changed, 35 insertions(+), 11 deletions(-)
+
+diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
+index b8b77aa..9494afb 100644
+--- a/src/sysv-generator/sysv-generator.c
++++ b/src/sysv-generator/sysv-generator.c
+@@ -42,7 +42,8 @@
+ 
+ typedef enum RunlevelType {
+         RUNLEVEL_UP,
+-        RUNLEVEL_DOWN
++        RUNLEVEL_DOWN,
++        RUNLEVEL_SYSINIT
+ } RunlevelType;
+ 
+ static const struct {
+@@ -57,6 +58,9 @@ static const struct {
+         { "rc4.d",  SPECIAL_RUNLEVEL4_TARGET, RUNLEVEL_UP },
+         { "rc5.d",  SPECIAL_RUNLEVEL5_TARGET, RUNLEVEL_UP },
+ 
++        /* Debian style rcS.d, also adopted by OE */
++        { "rcS.d",  SPECIAL_SYSINIT_TARGET,   RUNLEVEL_SYSINIT},
++
+         /* Standard SysV runlevels for shutdown */
+         { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
+         { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
+@@ -65,7 +69,7 @@ static const struct {
+            directories in this order, and we want to make sure that
+            sysv_start_priority is known when we first load the
+            unit. And that value we only know from S links. Hence
+-           UP must be read before DOWN */
++           UP/SYSINIT must be read before DOWN */
+ };
+ 
+ typedef struct SysvStub {
+@@ -81,6 +85,8 @@ typedef struct SysvStub {
+         char **conflicts;
+         bool has_lsb;
+         bool reload;
++        bool default_dependencies;
++        bool from_rcsd;
+ } SysvStub;
+ 
+ const char *arg_dest = "/tmp";
+@@ -189,6 +195,8 @@ static int generate_unit_file(SysvStub *s) {
+                 "Description=%s\n",
+                 s->path, s->description);
+ 
++        if (!s->default_dependencies)
++                fprintf(f, "DefaultDependencies=no\n");
+         if (!isempty(before))
+                 fprintf(f, "Before=%s\n", before);
+         if (!isempty(after))
+@@ -717,15 +725,26 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
+                         r = strv_extend(&s->after, other->name);
+                         if (r < 0)
+                                 return log_oom();
+-                }
+-                else if (other->sysv_start_priority > s->sysv_start_priority) {
+-                        r = strv_extend(&s->before, other->name);
++               } else if (other->from_rcsd && !s->from_rcsd) {
++                        r = strv_extend(&s->after, other->name);
+                         if (r < 0)
+                                 return log_oom();
+-                }
+-                else
+-                        continue;
+-
++        } else {
++          /* All scripts under /etc/rcS.d should execute before scripts under
++           * /etc/rcN.d */
++                 if (!other->from_rcsd && s->from_rcsd) {
++                         r = strv_extend(&s->before, other->name);
++                                if (r < 0)
++                                        return log_oom();
++                        }
++                        else if (other->sysv_start_priority > s->sysv_start_priority) {
++                                r = strv_extend(&s->before, other->name);
++                                if (r < 0)
++                                        return log_oom();
++                        }
++                        else
++                                continue;
++               }
+                 /* FIXME: Maybe we should compare the name here lexicographically? */
+         }
+ 
+@@ -784,6 +803,8 @@ static int enumerate_sysv(LookupPaths lp, Hashmap *all_services) {
+                                 return log_oom();
+ 
+                         service->sysv_start_priority = -1;
++                        service->default_dependencies = true;
++                        service->from_rcsd = false;
+                         service->name = name;
+                         service->path = fpath;
+ 
+@@ -869,9 +890,11 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+ 
+                                 if (de->d_name[0] == 'S')  {
+ 
+-                                        if (rcnd_table[i].type == RUNLEVEL_UP) {
++                                        if (rcnd_table[i].type == RUNLEVEL_UP || rcnd_table[i].type == RUNLEVEL_SYSINIT) {
+                                                 service->sysv_start_priority =
+                                                         MAX(a*10 + b, service->sysv_start_priority);
++                                                service->default_dependencies = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?false:true;
++                                                service->from_rcsd = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?true:false;
+                                         }
+ 
+                                         r = set_ensure_allocated(&runlevel_services[i], NULL);
+@@ -883,7 +906,8 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+                                                 goto finish;
+ 
+                                 } else if (de->d_name[0] == 'K' &&
+-                                           (rcnd_table[i].type == RUNLEVEL_DOWN)) {
++                                        (rcnd_table[i].type == RUNLEVEL_DOWN ||
++                                         rcnd_table[i].type == RUNLEVEL_SYSINIT)) {
+ 
+                                         r = set_ensure_allocated(&shutdown_services, NULL);
+                                         if (r < 0)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
new file mode 100644
index 0000000..2fbf4b4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
@@ -0,0 +1,91 @@
+From 84c87cf474f9ffd23332a40b7e06900ff8272a69 Mon Sep 17 00:00:00 2001
+From: Bruno Bottazzini <bruno.bottazzini@intel.com>
+Date: Fri, 30 Jan 2015 18:14:42 -0200
+Subject: [PATCH 1/1] This patch is uclibc specific, thus not suitable for
+ upstream.
+
+---
+ src/journal/journal-file.c  | 15 ++++++++++++++-
+ src/journal/journald-kmsg.c | 16 ++++++++++++++--
+ 2 files changed, 28 insertions(+), 3 deletions(-)
+
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index ec12e89..3d21528 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -35,6 +35,7 @@
+ #include "lookup3.h"
+ #include "compress.h"
+ #include "fsprg.h"
++#include "config.h"
+ 
+ #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
+ #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
+@@ -354,7 +355,7 @@ static int journal_file_fstat(JournalFile *f) {
+ 
+ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
+         uint64_t old_size, new_size;
+-        int r;
++        int r = 0;
+ 
+         assert(f);
+ 
+@@ -418,9 +419,21 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
+         /* Note that the glibc fallocate() fallback is very
+            inefficient, hence we try to minimize the allocation area
+            as we can. */
++#ifdef HAVE_POSIX_FALLOCATE
+         r = posix_fallocate(f->fd, old_size, new_size - old_size);
+         if (r != 0)
+                 return -r;
++#else
++        /* Write something every 512 bytes to make sure the block is allocated */
++        uint64_t len = new_size - old_size;
++        uint64_t offset = old_size;
++        for (offset += (len-1) % 512; len > 0; offset += 512) {
++                len -= 512;
++                if (pwrite(f->fd, "", 1, offset) != 1)
++                        return -errno;
++        }
++
++#endif /* HAVE_POSIX_FALLOCATE */
+ 
+         f->header->arena_size = htole64(new_size - le64toh(f->header->header_size));
+ 
+diff --git a/src/journal/journald-kmsg.c b/src/journal/journald-kmsg.c
+index aca4571..f3c2c19 100644
+--- a/src/journal/journald-kmsg.c
++++ b/src/journal/journald-kmsg.c
+@@ -437,6 +437,7 @@ fail:
+ int server_open_kernel_seqnum(Server *s) {
+         _cleanup_close_ int fd;
+         uint64_t *p;
++        int r = 0;
+ 
+         assert(s);
+ 
+@@ -449,8 +450,19 @@ int server_open_kernel_seqnum(Server *s) {
+                 log_error_errno(errno, "Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
+                 return 0;
+         }
+-
+-        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
++#ifdef HAVE_POSIX_FALLOCATE
++        r = posix_fallocate(fd, 0, sizeof(uint64_t));
++#else
++       /* Use good old method to write zeros into the journal file
++          perhaps very inefficient yet working. */
++       char *buf = alloca(sizeof(uint64_t));
++       off_t oldpos = lseek(fd, 0, SEEK_CUR);
++       bzero(buf, sizeof(uint64_t));
++       lseek(fd, 0, SEEK_SET);
++       r = write(fd, buf, sizeof(uint64_t));
++       lseek(fd, oldpos, SEEK_SET);
++#endif /* HAVE_POSIX_FALLOCATE */
++       if (r < 0) {
+                 log_error_errno(errno, "Failed to allocate sequential number file, ignoring: %m");
+                 return 0;
+         }
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_218.bb b/meta/recipes-core/systemd/systemd_218.bb
new file mode 100644
index 0000000..87d9fe8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd_218.bb
@@ -0,0 +1,482 @@
+SUMMARY = "System and service manager for Linux, replacing SysVinit"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+PE = "1"
+
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SECTION = "base/shell"
+
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
+
+SRCREV = "820aced6f6067a6b7c57b7d36e44f64378870cbf"
+
+PV = "218+git${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
+           file://systemd-pam-configure-check-uclibc.patch \
+           file://systemd-pam-fix-execvpe.patch \
+           file://systemd-pam-fix-mkostemp.patch \
+           file://systemd_218-pam-fix-fallocate.patch \
+           file://optional_secure_getenv.patch \
+           file://uclibc-get-physmem.patch \
+           file://0001-add-support-for-executing-scripts-under-etc-systemd-218.patch \
+           file://0001-systemd-user-avoid-using-system-auth.patch \
+           file://touchscreen.rules \
+           file://00-create-volatile.conf \
+           file://init \
+           file://run-ptest \
+          "
+
+S = "${WORKDIR}/git"
+
+SRC_URI_append_libc-uclibc = "\
+                             file://systemd-pam-fix-getty-unit.patch \
+                            "
+LDFLAGS_append_libc-uclibc = " -lrt"
+
+GTKDOC_DOCDIR = "${S}/docs/"
+
+# regardless of PACKAGECONFIG, libgcrypt is always required to expand
+# the AM_PATH_LIBGCRYPT autoconf macro
+DEPENDS += "libgcrypt curl"
+
+PACKAGECONFIG ??= "acl blkid efi kmod gcrypt lz4 xz libidn"
+
+PACKAGECONFIG[glib] = "--enable-gudev,--disable-gudev,glib-2.0"
+
+
+########################################################################
+# Highly Recommended Section
+########################################################################
+
+# ACL (Access Control List), see http://savannah.nongnu.org/projects/acl
+# used by systemd, journald and logind to provide fine grained access to files.
+# NOTE: do not remove unless you know what you are doing.
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
+
+# blkid from util-linux to read block devices, see ftp://ftp.kernel.org/pub/linux/utils/util-linux
+# required to:
+#  - discover and mount GPT partitions as /, /home and /srv based on GUIDs.
+#  - nspawn to locate partitions
+#  - udev to probe and use block devices
+# NOTE: do not remove unless you know what you are doing.
+PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
+
+# EFI support in systemd and udev, includes discovery and mount of partitions and efivars.
+# NOTE: do not remove unless you know what you are doing.
+PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
+
+# kmod to load kernel modules, provides modprobe, insmod et al, see https://www.kernel.org/pub/linux/utils/kernel/kmod/
+# required to:
+#  - let systemd load required modules automatically (ipv6, unix, kdbus...)
+#  - let udev load modules for devices (hotplug and coldplug) using a built-in
+# NOTE: do not remove unless you know what you are doing.
+PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"
+
+# D-Bus policy and authentication framework, see http://www.freedesktop.org/wiki/Software/polkit/
+# WARN: no package "polkit" in poky
+PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,,polkit"
+
+
+########################################################################
+# Security Section
+########################################################################
+
+# SELinux (Security Enhanced Linux), see http://selinuxproject.org/page/Main_Page
+# WARN: no package "libselinux" in poky
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+
+# See http://people.redhat.com/sgrubb/audit/
+# WARN: no package "libaudit" in poky
+PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,libaudit"
+
+# SMACK (Simplified Mandatory Access Control Kernel), see http://schaufler-ca.com/
+# needs Kernel CONFIG_SECURITY_SMACK and /etc/smack/accesses.d/ to be useful, otherwise is unused.
+PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
+
+# IMA (Integrity Measurement Architecture) setup, see http://linux-ima.sourceforge.net/
+# needs Kernel CONFIG_IMA and /etc/ima/ima-policy to be useful, otherwise is unused.
+PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
+
+# AppArmor, proactively protects the operating system and applications
+# from external or internal threats, even zero-day attacks, by
+# enforcing good behavior and preventing even unknown application flaws
+# from being exploited. See http://wiki.apparmor.net/index.php/Main_Page
+# needs Kernel CONFIG_SECURITY_APPARMOR to be useful, otherwise is unused.
+# WARN: no package "libapparmor" in poky
+PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
+
+# SECCOMP provides syscall filtering and sandboxing, see http://sourceforge.net/projects/libseccomp/
+# It is used by browsers to implement their plugins.
+# systemd will allow restricting the syscalls available to an application with a line like below
+# in [Service] block:
+#    SystemCallFilter=brk mmap access open fstat close read fstat mprotect arch_prctl munmap write
+# needs Kernel CONFIG_SECCOMP, CONFIG_SECCOMP_FILTER and CONFIG_HAVE_ARCH_SECCOMP_FILTER to be useful.
+# WARN: no package "libseccomp" in poky
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
+
+
+########################################################################
+# Journal Section
+########################################################################
+
+# extract ELF symbols and store the stack trace along the coredump
+PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils (>= 0.158)"
+
+# Sign the journal for anti-tampering
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+
+# Compress the journal (and coredumps stored in the journal) using lz4
+PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
+
+# Compress the journal (and coredumps stored in the journal) using xz (lzma)
+# xz has lower priority than lz4 for compression, but having both may help to extract and decompress
+# journal entries generated in other systems.
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+
+# when generating gcrypt verification keys (journalctl --setup-keys), output the secret
+# as QR code so it can be easily scanned by a phone or systems with digital camera and QR scanner.
+# WARN: no package "libqrencode" in poky
+PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,libqrencode"
+
+
+########################################################################
+# Resolve Daemon Section
+########################################################################
+
+# IDN (Internationalized Domain Name) see http://www.gnu.org/software/libidn/
+PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
+
+CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
+
+# Helper variables to clarify locations.  This mirrors the logic in systemd's
+# build system.
+rootprefix ?= "${base_prefix}"
+rootlibdir ?= "${base_libdir}"
+rootlibexecdir = "${rootprefix}/lib"
+
+# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
+EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
+                 --with-rootlibdir=${rootlibdir} \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+                 --disable-manpages \
+                 --disable-introspection \
+                 --disable-kdbus \
+                 --disable-terminal \
+                 --enable-split-usr \
+                 --without-python \
+                 --enable-libcurl \
+                 --enable-coredump \
+                 --enable-ldconfig \
+                 --enable-backlight \
+                 --enable-binfmt \
+                 --enable-bootchart \
+                 --enable-firstboot \
+                 --enable-hostnamed \
+                 --enable-localed \
+                 --enable-logind \
+                 --enable-machined \
+                 --enable-networkd \
+                 --enable-quotacheck \
+                 --enable-randomseed \
+                 --enable-resolved \
+                 --enable-rfkill \
+                 --enable-sysusers \
+                 --enable-vconsole \
+                 --with-sysvrcnd-path=${sysconfdir} \
+                 ac_cv_path_KILL=${base_bindir}/kill \
+               "
+# uclibc does not have NSS
+EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
+
+do_configure_prepend() {
+        export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+        export NM="${HOST_PREFIX}gcc-nm"
+        export AR="${HOST_PREFIX}gcc-ar"
+        export RANLIB="${HOST_PREFIX}gcc-ranlib"
+        export KMOD="${base_bindir}/kmod"
+        if [ -d ${S}/units.pre_sed ] ; then
+                cp -r ${S}/units.pre_sed ${S}/units
+        else
+                cp -r ${S}/units ${S}/units.pre_sed
+        fi
+        sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
+        sed -i '/ln --relative --help/d' ${S}/configure.ac
+        sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
+        sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
+}
+
+do_install() {
+        autotools_do_install
+        install -d ${D}/${base_sbindir}
+
+        # Provide support for initramfs
+        [ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
+        [ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
+
+        # Create machine-id
+        # 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+        touch ${D}${sysconfdir}/machine-id
+
+        install -m 0644 ${WORKDIR}/*.rules ${D}${rootlibexecdir}/udev/rules.d/
+
+        install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${exec_prefix}/lib/tmpfiles.d/
+
+        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+                install -d ${D}${sysconfdir}/init.d
+                install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
+                sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+        fi
+
+        # Move libgudev back to ${rootlibdir} to keep backward compatibility
+        if ${@bb.utils.contains('PACKAGECONFIG','glib','true','false',d)}; then
+                if [ ${rootlibdir} != ${exec_prefix}/lib ]; then
+                        mv -t ${D}${rootlibdir} ${D}${exec_prefix}/lib/libgudev*
+                fi
+        fi
+
+        # Delete journal README, as log can be symlinked inside volatile.
+        rm -f ${D}/${localstatedir}/log/README
+}
+
+do_install_ptest () {
+       install -d ${D}${PTEST_PATH}/test
+       cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
+       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
+       install -d ${D}${PTEST_PATH}/build-aux
+       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+       cp -rf ${B}/rules ${D}${PTEST_PATH}/
+       # This directory needs to be there for udev-test.pl to work.
+       install -d ${D}${libdir}/udev/rules.d
+       cp ${B}/Makefile ${D}${PTEST_PATH}/
+       cp ${S}/test/sys.tar.xz ${D}${PTEST_PATH}/test
+       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
+       sed -i 's#${S}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
+       sed -i 's#${B}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
+}
+
+python populate_packages_prepend (){
+    systemdlibdir = d.getVar("rootlibdir", True)
+    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+}
+PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd|nss).*"
+
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
+             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
+
+SYSTEMD_PACKAGES = "${PN}-binfmt"
+SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} += "--system systemd-journal-gateway"
+GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
+
+FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
+
+# The test cases need perl and bash to run correctly.
+RDEPENDS_${PN}-ptest += "perl bash"
+FILES_${PN}-ptest += "${libdir}/udev/rules.d"
+
+FILES_${PN}-dbg += "${libdir}/systemd/ptest/.debug"
+
+FILES_${PN}-gui = "${bindir}/systemadm"
+
+FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
+                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+
+FILES_${PN}-kernel-install = "${bindir}/kernel-install \
+                              ${sysconfdir}/kernel/ \
+                              ${exec_prefix}/lib/kernel \
+                             "
+FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
+                         "
+
+FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
+
+FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
+                      ${exec_prefix}/lib/binfmt.d \
+                      ${rootlibexecdir}/systemd/systemd-binfmt \
+                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
+                      ${systemd_unitdir}/system/systemd-binfmt.service"
+RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
+
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
+
+CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
+                ${sysconfdir}/systemd/logind.conf \
+                ${sysconfdir}/systemd/system.conf \
+                ${sysconfdir}/systemd/user.conf"
+
+FILES_${PN} = " ${base_bindir}/* \
+                ${datadir}/bash-completion \
+                ${datadir}/dbus-1/services \
+                ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
+                ${datadir}/${BPN} \
+                ${datadir}/factory \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
+                ${sysconfdir}/init.d/README \
+                ${rootlibexecdir}/systemd/* \
+                ${systemd_unitdir}/* \
+                ${base_libdir}/security/*.so \
+                ${libdir}/libnss_* \
+                /cgroup \
+                ${bindir}/systemd* \
+                ${bindir}/coredumpctl \
+                ${bindir}/busctl \
+                ${bindir}/localectl \
+                ${bindir}/hostnamectl \
+                ${bindir}/timedatectl \
+                ${bindir}/bootctl \
+                ${bindir}/kernel-install \
+                ${exec_prefix}/lib/tmpfiles.d/*.conf \
+                ${exec_prefix}/lib/systemd \
+                ${exec_prefix}/lib/modules-load.d \
+                ${exec_prefix}/lib/sysctl.d \
+                ${exec_prefix}/lib/sysusers.d \
+                ${localstatedir} \
+                /lib/udev/rules.d/70-uaccess.rules \
+                /lib/udev/rules.d/71-seat.rules \
+                /lib/udev/rules.d/73-seat-late.rules \
+                /lib/udev/rules.d/99-systemd.rules \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)} \
+               "
+
+FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
+RDEPENDS_${PN} += "volatile-binds"
+
+RRECOMMENDS_${PN} += "systemd-compat-units udev-hwdb\
+                      util-linux-agetty \
+                      util-linux-fsck e2fsprogs-e2fsck \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 os-release \
+"
+
+PACKAGES =+ "udev-dbg udev udev-hwdb"
+
+FILES_udev-dbg += "/lib/udev/.debug"
+
+RPROVIDES_udev = "hotplug"
+
+RDEPENDS_udev-hwdb += "udev"
+
+FILES_udev += "${base_sbindir}/udevd \
+               ${rootlibexecdir}/systemd/systemd-udevd \
+               ${rootlibexecdir}/udev/accelerometer \
+               ${rootlibexecdir}/udev/ata_id \
+               ${rootlibexecdir}/udev/cdrom_id \
+               ${rootlibexecdir}/udev/collect \
+               ${rootlibexecdir}/udev/findkeyboards \
+               ${rootlibexecdir}/udev/keyboard-force-release.sh \
+               ${rootlibexecdir}/udev/keymap \
+               ${rootlibexecdir}/udev/mtd_probe \
+               ${rootlibexecdir}/udev/scsi_id \
+               ${rootlibexecdir}/udev/v4l_id \
+               ${rootlibexecdir}/udev/keymaps \
+               ${rootlibexecdir}/udev/rules.d/4*.rules \
+               ${rootlibexecdir}/udev/rules.d/5*.rules \
+               ${rootlibexecdir}/udev/rules.d/6*.rules \
+               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
+               ${rootlibexecdir}/udev/rules.d/75*.rules \
+               ${rootlibexecdir}/udev/rules.d/78*.rules \
+               ${rootlibexecdir}/udev/rules.d/8*.rules \
+               ${rootlibexecdir}/udev/rules.d/95*.rules \
+               ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
+               ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
+               ${rootlibexecdir}/udev/rules.d/touchscreen.rules \
+               ${sysconfdir}/udev \
+               ${sysconfdir}/init.d/systemd-udevd \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
+               ${base_bindir}/udevadm \
+               ${datadir}/bash-completion/completions/udevadm \
+              "
+
+FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
+
+INITSCRIPT_PACKAGES = "udev"
+INITSCRIPT_NAME_udev = "systemd-udevd"
+INITSCRIPT_PARAMS_udev = "start 03 S ."
+
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
+# TODO:
+# u-a for runlevel and telinit
+
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
+
+ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
+ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
+ALTERNATIVE_PRIORITY[init] ?= "300"
+
+ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
+ALTERNATIVE_PRIORITY[halt] ?= "300"
+
+ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
+ALTERNATIVE_PRIORITY[reboot] ?= "300"
+
+ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
+ALTERNATIVE_PRIORITY[shutdown] ?= "300"
+
+ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
+ALTERNATIVE_PRIORITY[poweroff] ?= "300"
+
+ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
+ALTERNATIVE_PRIORITY[runlevel] ?= "300"
+
+pkg_postinst_udev-hwdb () {
+	if test -n "$D"; then
+		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+			--root $D
+	else
+		udevadm hwdb --update
+	fi
+}
+
+pkg_prerm_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	rm -f ${sysconfdir}/udev/hwdb.bin
+}
+
+# As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
+# that we don't build both udev and systemd in world builds.
+python () {
+    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
+}
-- 
1.9.1


