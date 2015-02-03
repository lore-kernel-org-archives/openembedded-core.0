Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A324D605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 21:23:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2015 13:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,515,1418112000"; d="scan'208";a="646867837"
Received: from localhost.jf.intel.com (HELO [10.7.201.167]) ([10.7.201.167])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2015 13:23:33 -0800
Message-ID: <54D13C54.2020508@linux.intel.com>
Date: Tue, 03 Feb 2015 13:23:32 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Bruno Bottazzini <bruno.bottazzini@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>	<1422987664-26903-1-git-send-email-bruno.bottazzini@intel.com>
	<1422987664-26903-2-git-send-email-bruno.bottazzini@intel.com>
In-Reply-To: <1422987664-26903-2-git-send-email-bruno.bottazzini@intel.com>
Subject: Re: [PATCH] systemd: update version from 216 to 218
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
X-List-Received-Date: Tue, 03 Feb 2015 21:23:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2015 10:21 AM, Bruno Bottazzini wrote:
> Spliting into packages to be able to choose what to be installed.
> The final result may get smaller, if the user wanted to.
> By default it will install the whole systemd which may be big.
> ---
>   ...r-executing-scripts-under-etc-systemd-218.patch |  131 ++
>   .../systemd/systemd_218-pam-fix-fallocate.patch    |   91 ++
>   meta/recipes-core/systemd/systemd_218.bb           | 1251 ++++++++++++++++++++
>   3 files changed, 1473 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
>   create mode 100644 meta/recipes-core/systemd/systemd_218.bb
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
> new file mode 100644
> index 0000000..d50f2cb
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
> @@ -0,0 +1,131 @@
> +From 0dec519c563654148d3cdd363d2598b50313de60 Mon Sep 17 00:00:00 2001
> +From: Bruno Bottazzini <bruno.bottazzini@intel.com>
> +Date: Mon, 2 Feb 2015 13:53:24 -0200
> +Subject: [PATCH 1/1] add support for executing scripts under /etc/rcS.d/
> +
> +To be compatible, all services translated from scripts under /etc/rcS.d would
> +run before services translated from scripts under /etc/rcN.d.
> +---
> + src/sysv-generator/sysv-generator.c | 46 ++++++++++++++++++++++++++++---------
> + 1 file changed, 35 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
> +index b8b77aa..9494afb 100644
> +--- a/src/sysv-generator/sysv-generator.c
> ++++ b/src/sysv-generator/sysv-generator.c
> +@@ -42,7 +42,8 @@
> +
> + typedef enum RunlevelType {
> +         RUNLEVEL_UP,
> +-        RUNLEVEL_DOWN
> ++        RUNLEVEL_DOWN,
> ++        RUNLEVEL_SYSINIT
> + } RunlevelType;
> +
> + static const struct {
> +@@ -57,6 +58,9 @@ static const struct {
> +         { "rc4.d",  SPECIAL_RUNLEVEL4_TARGET, RUNLEVEL_UP },
> +         { "rc5.d",  SPECIAL_RUNLEVEL5_TARGET, RUNLEVEL_UP },
> +
> ++        /* Debian style rcS.d, also adopted by OE */
> ++        { "rcS.d",  SPECIAL_SYSINIT_TARGET,   RUNLEVEL_SYSINIT},
> ++
> +         /* Standard SysV runlevels for shutdown */
> +         { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
> +         { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
> +@@ -65,7 +69,7 @@ static const struct {
> +            directories in this order, and we want to make sure that
> +            sysv_start_priority is known when we first load the
> +            unit. And that value we only know from S links. Hence
> +-           UP must be read before DOWN */
> ++           UP/SYSINIT must be read before DOWN */
> + };
> +
> + typedef struct SysvStub {
> +@@ -81,6 +85,8 @@ typedef struct SysvStub {
> +         char **conflicts;
> +         bool has_lsb;
> +         bool reload;
> ++        bool default_dependencies;
> ++        bool from_rcsd;
> + } SysvStub;
> +
> + const char *arg_dest = "/tmp";
> +@@ -189,6 +195,8 @@ static int generate_unit_file(SysvStub *s) {
> +                 "Description=%s\n",
> +                 s->path, s->description);
> +
> ++        if (!s->default_dependencies)
> ++                fprintf(f, "DefaultDependencies=no\n");
> +         if (!isempty(before))
> +                 fprintf(f, "Before=%s\n", before);
> +         if (!isempty(after))
> +@@ -717,15 +725,26 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
> +                         r = strv_extend(&s->after, other->name);
> +                         if (r < 0)
> +                                 return log_oom();
> +-                }
> +-                else if (other->sysv_start_priority > s->sysv_start_priority) {
> +-                        r = strv_extend(&s->before, other->name);
> ++               } else if (other->from_rcsd && !s->from_rcsd) {
> ++                        r = strv_extend(&s->after, other->name);
> +                         if (r < 0)
> +                                 return log_oom();
> +-                }
> +-                else
> +-                        continue;
> +-
> ++        } else {
> ++          /* All scripts under /etc/rcS.d should execute before scripts under
> ++           * /etc/rcN.d */
> ++                 if (!other->from_rcsd && s->from_rcsd) {
> ++                         r = strv_extend(&s->before, other->name);
> ++                                if (r < 0)
> ++                                        return log_oom();
> ++                        }
> ++                        else if (other->sysv_start_priority > s->sysv_start_priority) {
> ++                                r = strv_extend(&s->before, other->name);
> ++                                if (r < 0)
> ++                                        return log_oom();
> ++                        }
> ++                        else
> ++                                continue;
> ++               }
> +                 /* FIXME: Maybe we should compare the name here lexicographically? */
> +         }
> +
> +@@ -784,6 +803,8 @@ static int enumerate_sysv(LookupPaths lp, Hashmap *all_services) {
> +                                 return log_oom();
> +
> +                         service->sysv_start_priority = -1;
> ++                        service->default_dependencies = true;
> ++                        service->from_rcsd = false;
> +                         service->name = name;
> +                         service->path = fpath;
> +
> +@@ -869,9 +890,11 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
> +
> +                                 if (de->d_name[0] == 'S')  {
> +
> +-                                        if (rcnd_table[i].type == RUNLEVEL_UP) {
> ++                                        if (rcnd_table[i].type == RUNLEVEL_UP || rcnd_table[i].type == RUNLEVEL_SYSINIT) {
> +                                                 service->sysv_start_priority =
> +                                                         MAX(a*10 + b, service->sysv_start_priority);
> ++                                                service->default_dependencies = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?false:true;
> ++                                                service->from_rcsd = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?true:false;
> +                                         }
> +
> +                                         r = set_ensure_allocated(&runlevel_services[i], NULL);
> +@@ -883,7 +906,8 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
> +                                                 goto finish;
> +
> +                                 } else if (de->d_name[0] == 'K' &&
> +-                                           (rcnd_table[i].type == RUNLEVEL_DOWN)) {
> ++                                        (rcnd_table[i].type == RUNLEVEL_DOWN ||
> ++                                         rcnd_table[i].type == RUNLEVEL_SYSINIT)) {
> +
> +                                         r = set_ensure_allocated(&shutdown_services, NULL);
> +                                         if (r < 0)
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
> new file mode 100644
> index 0000000..2fbf4b4
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
> @@ -0,0 +1,91 @@
> +From 84c87cf474f9ffd23332a40b7e06900ff8272a69 Mon Sep 17 00:00:00 2001
> +From: Bruno Bottazzini <bruno.bottazzini@intel.com>
> +Date: Fri, 30 Jan 2015 18:14:42 -0200
> +Subject: [PATCH 1/1] This patch is uclibc specific, thus not suitable for
> + upstream.
> +
> +---
> + src/journal/journal-file.c  | 15 ++++++++++++++-
> + src/journal/journald-kmsg.c | 16 ++++++++++++++--
> + 2 files changed, 28 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
> +index ec12e89..3d21528 100644
> +--- a/src/journal/journal-file.c
> ++++ b/src/journal/journal-file.c
> +@@ -35,6 +35,7 @@
> + #include "lookup3.h"
> + #include "compress.h"
> + #include "fsprg.h"
> ++#include "config.h"
> +
> + #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
> + #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
> +@@ -354,7 +355,7 @@ static int journal_file_fstat(JournalFile *f) {
> +
> + static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
> +         uint64_t old_size, new_size;
> +-        int r;
> ++        int r = 0;
> +
> +         assert(f);
> +
> +@@ -418,9 +419,21 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
> +         /* Note that the glibc fallocate() fallback is very
> +            inefficient, hence we try to minimize the allocation area
> +            as we can. */
> ++#ifdef HAVE_POSIX_FALLOCATE
> +         r = posix_fallocate(f->fd, old_size, new_size - old_size);
> +         if (r != 0)
> +                 return -r;
> ++#else
> ++        /* Write something every 512 bytes to make sure the block is allocated */
> ++        uint64_t len = new_size - old_size;
> ++        uint64_t offset = old_size;
> ++        for (offset += (len-1) % 512; len > 0; offset += 512) {
> ++                len -= 512;
> ++                if (pwrite(f->fd, "", 1, offset) != 1)
> ++                        return -errno;
> ++        }
> ++
> ++#endif /* HAVE_POSIX_FALLOCATE */
> +
> +         f->header->arena_size = htole64(new_size - le64toh(f->header->header_size));
> +
> +diff --git a/src/journal/journald-kmsg.c b/src/journal/journald-kmsg.c
> +index aca4571..f3c2c19 100644
> +--- a/src/journal/journald-kmsg.c
> ++++ b/src/journal/journald-kmsg.c
> +@@ -437,6 +437,7 @@ fail:
> + int server_open_kernel_seqnum(Server *s) {
> +         _cleanup_close_ int fd;
> +         uint64_t *p;
> ++        int r = 0;
> +
> +         assert(s);
> +
> +@@ -449,8 +450,19 @@ int server_open_kernel_seqnum(Server *s) {
> +                 log_error_errno(errno, "Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
> +                 return 0;
> +         }
> +-
> +-        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
> ++#ifdef HAVE_POSIX_FALLOCATE
> ++        r = posix_fallocate(fd, 0, sizeof(uint64_t));
> ++#else
> ++       /* Use good old method to write zeros into the journal file
> ++          perhaps very inefficient yet working. */
> ++       char *buf = alloca(sizeof(uint64_t));
> ++       off_t oldpos = lseek(fd, 0, SEEK_CUR);
> ++       bzero(buf, sizeof(uint64_t));
> ++       lseek(fd, 0, SEEK_SET);
> ++       r = write(fd, buf, sizeof(uint64_t));
> ++       lseek(fd, oldpos, SEEK_SET);
> ++#endif /* HAVE_POSIX_FALLOCATE */
> ++       if (r < 0) {
> +                 log_error_errno(errno, "Failed to allocate sequential number file, ignoring: %m");
> +                 return 0;
> +         }
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_218.bb b/meta/recipes-core/systemd/systemd_218.bb
> new file mode 100644
> index 0000000..9f9dbb0
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd_218.bb
> @@ -0,0 +1,1251 @@
> +SUMMARY = "System and service manager for Linux, replacing SysVinit"
> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
> +
> +LICENSE = "GPLv2 & LGPLv2.1 & MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
> +                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
> +                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
> +
> +PE = "1"
> +
> +DEPENDS = "docbook-sgml-dtd-4.1-native intltool-native gperf-native libcap qemu-native curl glibc"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +
> +SECTION = "base/shell"
> +
> +inherit gtk-doc pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
> +
> +SRCREV = "820aced6f6067a6b7c57b7d36e44f64378870cbf"
> +
> +PV = "218+git${SRCPV}"
> +
> +SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
> +           file://systemd-pam-configure-check-uclibc.patch \
> +           file://systemd-pam-fix-execvpe.patch \
> +           file://systemd-pam-fix-mkostemp.patch \
> +           file://systemd_218-pam-fix-fallocate.patch \
> +           file://optional_secure_getenv.patch \
> +           file://uclibc-get-physmem.patch \
> +           file://0001-add-support-for-executing-scripts-under-etc-systemd-218.patch \
> +           file://0001-systemd-user-avoid-using-system-auth.patch \
> +           file://touchscreen.rules \
> +           file://00-create-volatile.conf \
> +           file://init \
> +           file://run-ptest \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +SRC_URI_append_libc-uclibc = "\
> +                             file://systemd-pam-fix-getty-unit.patch \
> +                            "
> +LDFLAGS_append_libc-uclibc = " -lrt"
> +
> +GTKDOC_DOCDIR = "${S}/docs/"
> +
> +# regardless of PACKAGECONFIG, libgcrypt is always required to expand
> +# the AM_PATH_LIBGCRYPT autoconf macro
> +DEPENDS += "libgcrypt"
> +
> +PACKAGECONFIG ??= "acl blkid efi kmod gcrypt lz4 xz libidn"
> +
> +PACKAGECONFIG[glib] = "--enable-gudev,--disable-gudev,glib-2.0"
> +
> +
> +########################################################################
> +# Highly Recommended Section
> +########################################################################
> +
> +# ACL (Access Control List), see http://savannah.nongnu.org/projects/acl
> +# used by systemd, journald and logind to provide fine grained access to files.
> +# NOTE: do not remove unless you know what you are doing.
> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
> +
> +# blkid from util-linux to read block devices, see ftp://ftp.kernel.org/pub/linux/utils/util-linux
> +# required to:
> +#  - discover and mount GPT partitions as /, /home and /srv based on GUIDs.
> +#  - nspawn to locate partitions
> +#  - udev to probe and use block devices
> +# NOTE: do not remove unless you know what you are doing.
> +PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
> +
> +# EFI support in systemd and udev, includes discovery and mount of partitions and efivars.
> +# NOTE: do not remove unless you know what you are doing.
> +PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
> +
> +# kmod to load kernel modules, provides modprobe, insmod et al, see https://www.kernel.org/pub/linux/utils/kernel/kmod/
> +# required to:
> +#  - let systemd load required modules automatically (ipv6, unix, kdbus...)
> +#  - let udev load modules for devices (hotplug and coldplug) using a built-in
> +# NOTE: do not remove unless you know what you are doing.
> +PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"
> +
> +# D-Bus policy and authentication framework, see http://www.freedesktop.org/wiki/Software/polkit/
> +# WARN: no package "polkit" in poky
> +PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,,polkit"
> +
> +
> +########################################################################
> +# Security Section
> +########################################################################
> +
> +# SELinux (Security Enhanced Linux), see http://selinuxproject.org/page/Main_Page
> +# WARN: no package "libselinux" in poky
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
> +
> +# See http://people.redhat.com/sgrubb/audit/
> +# WARN: no package "libaudit" in poky
> +PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,libaudit"
> +
> +# SMACK (Simplified Mandatory Access Control Kernel), see http://schaufler-ca.com/
> +# needs Kernel CONFIG_SECURITY_SMACK and /etc/smack/accesses.d/ to be useful, otherwise is unused.
> +PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
> +
> +# IMA (Integrity Measurement Architecture) setup, see http://linux-ima.sourceforge.net/
> +# needs Kernel CONFIG_IMA and /etc/ima/ima-policy to be useful, otherwise is unused.
> +PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
> +
> +# AppArmor, proactively protects the operating system and applications
> +# from external or internal threats, even zero-day attacks, by
> +# enforcing good behavior and preventing even unknown application flaws
> +# from being exploited. See http://wiki.apparmor.net/index.php/Main_Page
> +# needs Kernel CONFIG_SECURITY_APPARMOR to be useful, otherwise is unused.
> +# WARN: no package "libapparmor" in poky
> +PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
> +
> +# SECCOMP provides syscall filtering and sandboxing, see http://sourceforge.net/projects/libseccomp/
> +# It is used by browsers to implement their plugins.
> +# systemd will allow restricting the syscalls available to an application with a line like below
> +# in [Service] block:
> +#    SystemCallFilter=brk mmap access open fstat close read fstat mprotect arch_prctl munmap write
> +# needs Kernel CONFIG_SECCOMP, CONFIG_SECCOMP_FILTER and CONFIG_HAVE_ARCH_SECCOMP_FILTER to be useful.
> +# WARN: no package "libseccomp" in poky
> +PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
> +
> +
> +########################################################################
> +# Journal Section
> +########################################################################
> +
> +# extract ELF symbols and store the stack trace along the coredump
> +PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils (>= 0.158)"
> +
> +# Sign the journal for anti-tampering
> +PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
> +
> +# Compress the journal (and coredumps stored in the journal) using lz4
> +PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
> +
> +# Compress the journal (and coredumps stored in the journal) using xz (lzma)
> +# xz has lower priority than lz4 for compression, but having both may help to extract and decompress
> +# journal entries generated in other systems.
> +PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
> +
> +# when generating gcrypt verification keys (journalctl --setup-keys), output the secret
> +# as QR code so it can be easily scanned by a phone or systems with digital camera and QR scanner.
> +# WARN: no package "libqrencode" in poky
> +PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,libqrencode"
> +
> +
> +########################################################################
> +# Resolve Daemon Section
> +########################################################################
> +
> +# IDN (Internationalized Domain Name) see http://www.gnu.org/software/libidn/
> +PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
> +
> +CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
> +
> +# Helper variables to clarify locations.  This mirrors the logic in systemd's
> +# build system.
> +rootprefix ?= "${base_prefix}"
> +rootlibdir ?= "${base_libdir}"
> +rootlibexecdir = "${rootprefix}/lib"
> +
> +EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
> +                 --with-rootlibdir=${rootlibdir} \
> +                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
> +                 --disable-manpages \
> +                 --disable-introspection \
> +                 --disable-kdbus \
> +                 --disable-terminal \
> +                 --enable-split-usr \
> +                 --without-python \
> +                 --enable-libcurl \
> +                 --enable-coredump \
> +                 --enable-ldconfig \
> +                 --enable-backlight \
> +                 --enable-binfmt \
> +                 --enable-bootchart \
> +                 --enable-firstboot \
> +                 --enable-hostnamed \
> +                 --enable-localed \
> +                 --enable-logind \
> +                 --enable-machined \
> +                 --enable-networkd \
> +                 --enable-quotacheck \
> +                 --enable-randomseed \
> +                 --enable-resolved \
> +                 --enable-rfkill \
> +                 --enable-sysusers \
> +                 --enable-vconsole \
> +                 --with-sysvrcnd-path=${sysconfdir} \
> +                 ac_cv_path_KILL=${base_bindir}/kill \
> +               "
> +
> +# uclibc does not have NSS
> +EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
> +
> +do_configure_prepend() {
> +	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
> +	export NM="${HOST_PREFIX}gcc-nm"
> +	export AR="${HOST_PREFIX}gcc-ar"
> +	export RANLIB="${HOST_PREFIX}gcc-ranlib"
> +	export KMOD="${base_bindir}/kmod"
> +	if [ -d ${S}/units.pre_sed ] ; then
> +		cp -r ${S}/units.pre_sed ${S}/units
> +	else
> +		cp -r ${S}/units ${S}/units.pre_sed
> +	fi
> +	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
> +	sed -i '/ln --relative --help/d' ${S}/configure.ac
> +	sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
> +	sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
> +}
> +
> +do_install() {
> +	autotools_do_install
> +	install -d ${D}/${base_sbindir}
> +
> +	# Provide support for initramfs
> +	[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
> +	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
> +
> +	# Create machine-id
> +	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
> +	touch ${D}${sysconfdir}/machine-id
> +
> +	install -m 0644 ${WORKDIR}/*.rules ${D}${rootlibexecdir}/udev/rules.d/
> +
> +	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${exec_prefix}/lib/tmpfiles.d/
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
> +		install -d ${D}${sysconfdir}/init.d
> +		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
> +		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
> +	fi
> +
> +	# Move libgudev back to ${rootlibdir} to keep backward compatibility
> +	if ${@bb.utils.contains('PACKAGECONFIG','glib','true','false',d)}; then
> +		if [ ${rootlibdir} != ${exec_prefix}/lib ]; then
> +			mv -t ${D}${rootlibdir} ${D}${exec_prefix}/lib/libgudev*
> +		fi
> +	fi
> +
> +        # Delete journal README, as log can be symlinked inside volatile.
> +        rm -f ${D}/${localstatedir}/log/README
> +}
> +
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}/test
> +       cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
> +       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
> +       install -d ${D}${PTEST_PATH}/build-aux
> +       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
> +       cp -rf ${B}/rules ${D}${PTEST_PATH}/
> +       # This directory needs to be there for udev-test.pl to work.
> +       install -d ${D}${libdir}/udev/rules.d
> +       cp ${B}/Makefile ${D}${PTEST_PATH}/
> +       cp ${S}/test/sys.tar.xz ${D}${PTEST_PATH}/test
> +       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
> +       sed -i 's#${S}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
> +       sed -i 's#${B}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
> +}
> +
> +python populate_packages_prepend (){
> +    systemdlibdir = d.getVar("rootlibdir", True)
> +    do_split_packages(d, systemdlibdir, '^lib(udev|gudev|systemd|nss)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
> +}
> +PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd|nss).*"
> +
> +########################################################################
> +# Base Packages
> +########################################################################
> +
> +PACKAGES =+ "${PN}-generators-filesystems"
> +SUMMARY_${PN}-generators-filesystems = "systemd's generator for filesystem services based on fstab and GPT"
> +RDEPENDS_${PN}-generators-filesystems = "${PN}-services-fsck"
> +FILES_${PN}-generators-filesystems = "\
> +        ${rootlibexecdir}/systemd/system-generators/systemd-fstab-generator \
> +        ${rootlibexecdir}/systemd/system-generators/systemd-gpt-auto-generator \
> +        ${rootlibexecdir}/systemd/systemd-remount-fs \
> +        ${systemd_unitdir}/system/local-fs.target.wants/systemd-remount-fs.service \
> +        ${systemd_unitdir}/system/systemd-remount-fs.service \
> +"
> +
> +PACKAGES =+ "${PN}-generators-getty"
> +SUMMARY_${PN}-generators-getty = "systemd's generator TTY services"
> +RDEPENDS_${PN}-generators-getty = "${PN}-services-getty"
> +FILES_${PN}-generators-getty = "\
> +        ${rootlibexecdir}/systemd/system-generators/systemd-getty-generator \
> +"
> +
> +PACKAGES =+ "${PN}-tools"
> +SUMMARY_${PN}-tools = "systemd command line tools (cgls, delta, run, analyze...)"
> +RRECOMMENDS_${PN}-tools = "${PN}-services-base"
> +FILES_${PN}-tools = "\
> +        ${base_bindir}/systemd-machine-id-setup \
> +        ${bindir}/busctl \
> +        ${bindir}/coredumpctl \
> +        ${bindir}/systemd-analyze \
> +        ${bindir}/systemd-cat \
> +        ${bindir}/systemd-cgls \
> +        ${bindir}/systemd-cgtop \
> +        ${bindir}/systemd-delta \
> +        ${bindir}/systemd-detect-virt \
> +        ${bindir}/systemd-path \
> +        ${bindir}/systemd-run \
> +        ${rootlibexecdir}/systemd/systemd-ac-power \
> +        ${rootlibexecdir}/systemd/systemd-activate \
> +        ${rootlibexecdir}/systemd/systemd-reply-password \
> +        ${rootprefix}/bin/systemd-escape \
> +        ${rootprefix}/bin/systemd-notify \
> +"
> +
> +########################################################################
> +# Services Packages
> +########################################################################
> +
> +PACKAGES =+ "${PN}-services-ask-password"
> +SUMMARY_${PN}-services-ask-password = "systemd's service and tool to query the user for a system password"
> +RRECOMMENDS_${PN}-services-ask-password = "${PN}-services-base"
> +FILES_${PN}-services-ask-password = "\
> +        ${rootprefix}/bin/systemd-ask-password \
> +        ${rootprefix}/bin/systemd-tty-ask-password-agent \
> +        ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
> +        ${systemd_unitdir}/system/systemd-ask-password-console.path \
> +        ${systemd_unitdir}/system/systemd-ask-password-console.service \
> +        ${systemd_unitdir}/system/systemd-ask-password-wall.path \
> +        ${systemd_unitdir}/system/systemd-ask-password-wall.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-backlight"
> +SUMMARY_${PN}-services-backlight = "systemd's backlight state save/restore service"
> +FILES_${PN}-services-backlight = "\
> +        ${systemd_unitdir}/system/systemd-backlight@.service \
> +        ${rootlibexecdir}/systemd/systemd-backlight \
> +"
> +
> +PACKAGES =+ "${PN}-services-binfmt"
> +SUMMARY_${PN}-services-binfmt = "systemd's service to configure additional binary formats for executables"
> +RRECOMMENDS_${PN}-services-binfmt = "kernel-module-binfmt-misc"
> +FILES_${PN}-services-binfmt = "\
> +        ${sysconfdir}/binfmt.d/ \
> +        ${exec_prefix}/lib/binfmt.d/ \
> +        ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.automount \
> +        ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.mount \
> +        ${systemd_unitdir}/system/sysinit.target.wants/proc-sys-fs-binfmt_misc.automount \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-binfmt.service \
> +        ${systemd_unitdir}/system/systemd-binfmt.service \
> +        ${rootlibexecdir}/systemd/systemd-binfmt \
> +"
> +
> +PACKAGES =+ "${PN}-services-bootchart"
> +SUMMARY_${PN}-services-bootchart = "systemd's boot performance service and graphing tool"
> +CONFFILES_${PN}-services-bootchart = "${sysconfdir}/systemd/bootchart.conf"
> +FILES_${PN}-services-bootchart = "\
> +        ${sysconfdir}/systemd/bootchart.conf \
> +        ${rootlibexecdir}/systemd/systemd-bootchart \
> +"
> +
> +PACKAGES =+ "${PN}-services-coredump"
> +SUMMARY_${PN}-services-coredump = "systemd's coredump log hook and service"
> +RDEPENDS_${PN}-services-coredump = "${PN}-services-sysctl"
> +CONFFILES_${PN}-services-coredump = "${sysconfdir}/systemd/coredump.conf"
> +FILES_${PN}-services-coredump = "\
> +        ${exec_prefix}/lib/sysctl.d/50-coredump.conf \
> +        ${sysconfdir}/systemd/coredump.conf \
> +        ${rootlibexecdir}/systemd/systemd-coredump \
> +"
> +
> +PACKAGES =+ "${PN}-services-cryptsetup"
> +SUMMARY_${PN}-services-cryptsetup = "systemd's disk decryption service"
> +ALLOW_EMPTY_${PN}-services-cryptsetup = "1"
> +FILES_${PN}-services-cryptsetup = "\
> +        ${rootlibexecdir}/systemd/system-generators/systemd-cryptsetup-generator \
> +        ${systemd_unitdir}/system/cryptsetup-pre.target \
> +        ${systemd_unitdir}/system/cryptsetup.target \
> +        ${systemd_unitdir}/system/sysinit.target.wants/cryptsetup.target \
> +        ${rootlibexecdir}/systemd/systemd-cryptsetup \
> +"
> +
> +PACKAGES =+ "${PN}-services-dbus"
> +SUMMARY_${PN}-services-dbus = "systemd's DBus daemon system service"
> +# NOTE: dbus dependency will go away when kdbus is in use
> +RDEPENDS_${PN}-services-dbus = "dbus"
> +FILES_${PN}-services-dbus = "\
> +        ${datadir}/dbus-1/services/org.freedesktop.systemd1.service \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.systemd1.service \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
> +        ${systemd_unitdir}/system/sockets.target.wants/dbus.socket \
> +        ${systemd_unitdir}/system/dbus.target.wants/dbus.socket \
> +        ${systemd_unitdir}/system/multi-user.target.wants/dbus.service \
> +        ${systemd_unitdir}/system/dbus.socket \
> +        ${systemd_unitdir}/system/dbus.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-debug"
> +SUMMARY_${PN}-services-debug = "systemd's debug service"
> +RRECOMMENDS_${PN}-services-debug = "${PN}-services-base ${PN}-tools"
> +FILES_${PN}-services-debug = "\
> +        ${rootlibexecdir}/systemd/system-generators/systemd-debug-generator \
> +        ${systemd_unitdir}/system/debug-shell.service \
> +        ${systemd_unitdir}/system/sys-kernel-config.mount \
> +        ${systemd_unitdir}/system/sys-kernel-debug.mount \
> +        ${systemd_unitdir}/system/sysinit.target.wants/sys-kernel-config.mount \
> +        ${systemd_unitdir}/system/sysinit.target.wants/sys-kernel-debug.mount \
> +"
> +
> +PACKAGES =+ "${PN}-services-firstboot"
> +SUMMARY_${PN}-services-firstboot = "systemd's service to initialize basic system settings"
> +FILES_${PN}-services-firstboot = "\
> +        ${base_bindir}/systemd-firstboot \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-firstboot.service \
> +        ${systemd_unitdir}/system/systemd-firstboot.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-fsck"
> +SUMMARY_${PN}-services-fsck = "systemd's filesystem check service"
> +RRECOMMENDS_${PN}-services-fsck = "util-linux-fsck e2fsprogs-e2fsck"
> +FILES_${PN}-services-fsck = "\
> +        ${systemd_unitdir}/system/systemd-fsck-root.service \
> +        ${systemd_unitdir}/system/systemd-fsck@.service \
> +        ${rootlibexecdir}/systemd/systemd-fsck \
> +"
> +
> +PACKAGES =+ "${PN}-services-fuse"
> +SUMMARY_${PN}-services-fuse = "systemd's FUSE (filesystem in userspace) service"
> +FILES_${PN}-services-fuse = "\
> +        ${systemd_unitdir}/system/sysinit.target.wants/sys-fs-fuse-connections.mount \
> +        ${systemd_unitdir}/system/sys-fs-fuse-connections.mount \
> +"
> +
> +PACKAGES =+ "${PN}-services-getty"
> +SUMMARY_${PN}-services-getty = "systemd's getty service"
> +RRECOMMENDS_${PN}-services-getty = "util-linux-agetty ${PN}-generators-getty"
> +FILES_${PN}-services-getty = "\
> +        ${systemd_unitdir}/system/autovt@.service \
> +        ${systemd_unitdir}/system/console-getty.service \
> +        ${systemd_unitdir}/system/container-getty@.service \
> +        ${systemd_unitdir}/system/getty@.service \
> +        ${systemd_unitdir}/system/serial-getty@.service \
> +        ${sysconfdir}/systemd/system/getty.target.wants/ \
> +"
> +
> +PACKAGES =+ "${PN}-services-hostnamed"
> +SUMMARY_${PN}-services-hostnamed = "systemd's hostname management service"
> +RDEPENDS_${PN}-services-hostnamed = "${PN}-services-dbus"
> +CONFFILES_${PN}-services-hostnamed = "${sysconfdir}/dbus-1/system.d/org.freedesktop.hostname1.conf"
> +FILES_${PN}-services-hostnamed = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.hostname1.conf \
> +        ${bindir}/hostnamectl \
> +        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.hostname1.busname \
> +        ${systemd_unitdir}/system/dbus-org.freedesktop.hostname1.service \
> +        ${systemd_unitdir}/system/org.freedesktop.hostname1.busname \
> +        ${systemd_unitdir}/system/systemd-hostnamed.service \
> +        ${rootlibexecdir}/systemd/systemd-hostnamed \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.hostname1.service \
> +        ${datadir}/polkit-1/actions/org.freedesktop.hostname1.policy \
> +"
> +
> +PACKAGES =+ "${PN}-services-journal"
> +SUMMARY_${PN}-services-journal = "systemd's journal (logging) service"
> +CONFFILES_${PN}-services-journal = "${sysconfdir}/systemd/journald.conf"
> +FILES_${PN}-services-journal = "\
> +        ${base_bindir}/journalctl \
> +        ${rootlibexecdir}/systemd/systemd-journald \
> +        ${sysconfdir}/systemd/journald.conf \
> +        ${systemd_unitdir}/system/sockets.target.wants/systemd-journald-dev-log.socket \
> +        ${systemd_unitdir}/system/sockets.target.wants/systemd-journald.socket \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-journal-catalog-update.service \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-journal-flush.service \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-journald.service \
> +        ${systemd_unitdir}/system/systemd-journal-catalog-update.service \
> +        ${systemd_unitdir}/system/systemd-journal-flush.service \
> +        ${systemd_unitdir}/system/systemd-journald-dev-log.socket \
> +        ${systemd_unitdir}/system/systemd-journald.service \
> +        ${systemd_unitdir}/system/systemd-journald.socket \
> +        ${exec_prefix}/lib/systemd/catalog/ \
> +"
> +
> +
> +PACKAGES =+ "${PN}-services-journal-remote"
> +SUMMARY_${PN}-services-journal-remote = "systemd's service and tools to receive journal messages over the network"
> +RDEPENDS_${PN}-services-journal-remote = "${PN}-services-journal"
> +# NOTE: if no sysusers or tmpfiles, then users/groups and FS structure must be setup
> +RRECOMMENDS_${PN}-services-journal-remote = "${PN}-services-sysusers ${PN}-services-tmpfiles"
> +CONFFILES_${PN}-services-journal-remote = "${sysconfdir}/systemd/journald-remote.conf"
> +FILES_${PN}-services-journal-remote = "\
> +        ${exec_prefix}/lib/sysusers.d/systemd-remote.conf \
> +        ${exec_prefix}/lib/tmpfiles.d/systemd-remote.conf \
> +        ${rootlibexecdir}/systemd/systemd-journal-remote \
> +        ${sysconfdir}/systemd/journal-remote.conf \
> +"
> +
> +PACKAGES =+ "${PN}-services-journal-upload"
> +SUMMARY_${PN}-services-journal-upload = "systemd's service and tools to send journal messages over the network"
> +RDEPENDS_${PN}-services-journal-upload = "${PN}-services-journal"
> +# NOTE: if no sysusers, then users/groups must be setup
> +RRECOMMENDS_${PN}-services-journal-upload = "${PN}-services-sysusers"
> +CONFFILES_${PN}-services-journal-upload = "${sysconfdir}/systemd/journald-upload.conf"
> +FILES_${PN}-services-journal-upload = "\
> +        ${rootlibexecdir}/systemd/systemd-journal-upload \
> +        ${sysconfdir}/systemd/journal-upload.conf \
> +        ${systemd_unitdir}/system/systemd-journal-upload.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-ldconfig"
> +SUMMARY_${PN}-services-ldconfig = "systemd's service to run ldconfig after updates"
> +FILES_${PN}-services-ldconfig = "\
> +        ${systemd_unitdir}/system/sysinit.target.wants/ldconfig.service \
> +        ${systemd_unitdir}/system/ldconfig.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-localed"
> +SUMMARY_${PN}-services-localed = "systemd's locale management service"
> +RDEPENDS_${PN}-services-localed = "${PN}-services-dbus"
> +CONFFILES_${PN}-services-localed = "${sysconfdir}/dbus-1/system.d/org.freedesktop.locale1.conf"
> +FILES_${PN}-services-localed = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.locale1.conf \
> +        ${bindir}/localectl \
> +        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.locale1.busname \
> +        ${systemd_unitdir}/system/dbus-org.freedesktop.locale1.service \
> +        ${systemd_unitdir}/system/org.freedesktop.locale1.busname \
> +        ${systemd_unitdir}/system/systemd-localed.service \
> +        ${rootlibexecdir}/systemd/systemd-localed \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.locale1.service \
> +        ${datadir}/polkit-1/actions/org.freedesktop.locale1.policy \
> +        ${datadir}/systemd/kbd-model-map \
> +"
> +
> +PACKAGES =+ "${PN}-services-logind"
> +SUMMARY_${PN}-services-logind = "systemd's login management service"
> +RDEPENDS_${PN}-services-logind = "${PN}-services-dbus ${PN}-services-tmpfiles"
> +RRECOMMENDS_${PN}-services-logind = "udev"
> +CONFFILES_${PN}-services-logind = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.login1.conf \
> +        ${sysconfdir}/systemd/logind.conf \
> +"
> +FILES_${PN}-services-logind = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.login1.conf \
> +        ${sysconfdir}/systemd/logind.conf \
> +        ${base_bindir}/loginctl \
> +        ${base_bindir}/systemd-inhibit \
> +        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.login1.busname \
> +        ${systemd_unitdir}/system/dbus-org.freedesktop.login1.service \
> +        ${systemd_unitdir}/system/multi-user.target.wants/systemd-logind.service \
> +        ${systemd_unitdir}/system/multi-user.target.wants/systemd-user-sessions.service \
> +        ${systemd_unitdir}/system/org.freedesktop.login1.busname \
> +        ${systemd_unitdir}/system/systemd-logind.service \
> +        ${systemd_unitdir}/system/systemd-user-sessions.service \
> +        ${systemd_unitdir}/system/user@.service \
> +        ${rootlibexecdir}/systemd/systemd-logind \
> +        ${rootlibexecdir}/systemd/systemd-user-sessions \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.login1.service \
> +        ${datadir}/polkit-1/actions/org.freedesktop.login1.policy \
> +        ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
> +        ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
> +        ${rootlibexecdir}/udev/rules.d/71-seat.rules \
> +        ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
> +"
> +
> +PACKAGES =+ "${PN}-services-machined"
> +SUMMARY_${PN}-services-machined = "systemd's virtual machine and container management service"
> +RDEPENDS_${PN}-services-machined = "${PN}-services-dbus"
> +CONFFILES_${PN}-services-machined = "${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf"
> +FILES_${PN}-services-machined = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
> +        ${base_bindir}/machinectl \
> +        ${exec_prefix}/lib/libnss_mymachines.so.2 \
> +        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.machine1.busname \
> +        ${systemd_unitdir}/system/dbus-org.freedesktop.machine1.service \
> +        ${systemd_unitdir}/system/machine.slice \
> +        ${systemd_unitdir}/system/org.freedesktop.machine1.busname \
> +        ${systemd_unitdir}/system/systemd-machined.service \
> +        ${rootlibexecdir}/systemd/systemd-machined \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-modules-load"
> +SUMMARY_${PN}-services-modules-load = "systemd's kernel module loading service"
> +FILES_${PN}-services-modules-load = "\
> +        ${sysconfdir}/modules-load.d/ \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-modules-load.service \
> +        ${systemd_unitdir}/system/systemd-modules-load.service \
> +        ${rootlibexecdir}/systemd/systemd-modules-load \
> +        ${exec_prefix}/lib/modules-load.d \
> +"
> +
> +PACKAGES =+ "${PN}-services-modules-static-nodes"
> +SUMMARY_${PN}-services-modules-static-nodes = "systemd's kernel module static nodes creation service"
> +RDEPENDS_${PN}-services-modules-static-nodes = "kmod ${PN}-services-tmpfiles"
> +FILES_${PN}-services-modules-static-nodes = "\
> +        ${systemd_unitdir}/system/sysinit.target.wants/kmod-static-nodes.service \
> +        ${systemd_unitdir}/system/kmod-static-nodes.service \
> +"
> +
> +
> +PACKAGES =+ "${PN}-services-multi-seat-x"
> +SUMMARY_${PN}-services-multi-seat-x = "systemd's X11 multi-seat support service"
> +RDEPENDS_${PN}-services-multi-seat-x = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/xserver', '', d)}"
> +FILES_${PN}-services-multi-seat-x = "\
> +        ${rootlibexecdir}/systemd/systemd-multi-seat-x \
> +"
> +
> +PACKAGES =+ "${PN}-services-networkd"
> +SUMMARY_${PN}-services-networkd = "systemd's network management (static, DHCP, bridge...) service"
> +# NOTE: if no sysusers, then users/groups must be setup
> +RRECOMMENDS_${PN}-services-networkd = "${PN}-services-sysusers"
> +FILES_${PN}-services-networkd = "\
> +        ${sysconfdir}/systemd/network/ \
> +        ${sysconfdir}/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service \
> +        ${sysconfdir}/systemd/system/multi-user.target.wants/systemd-networkd.service \
> +        ${base_bindir}/networkctl \
> +        ${rootlibexecdir}/systemd/network/80-container-host0.network \
> +        ${rootlibexecdir}/systemd/network/80-container-ve.network \
> +        ${rootlibexecdir}/systemd/network/99-default.link \
> +        ${systemd_unitdir}/system/systemd-networkd-wait-online.service \
> +        ${systemd_unitdir}/system/systemd-networkd.service \
> +        ${rootlibexecdir}/systemd/systemd-networkd \
> +        ${rootlibexecdir}/systemd/systemd-networkd-wait-online \
> +        ${exec_prefix}/lib/systemd/network \
> +"
> +
> +PACKAGES =+ "${PN}-services-nspawn"
> +SUMMARY_${PN}-services-nspawn = "systemd's namespace spawing service and tool"
> +FILES_${PN}-services-nspawn = "\
> +        ${systemd_unitdir}/system/systemd-nspawn@.service \
> +        ${bindir}/systemd-nspawn \
> +"
> +
> +PACKAGES =+ "${PN}-services-quota"
> +SUMMARY_${PN}-services-quota = "systemd's file system quota enable and check service"
> +RDEPENDS_${PN}-services-quota = "quota"
> +FILES_${PN}-services-quota = "\
> +        ${systemd_unitdir}/system/quotaon.service \
> +        ${systemd_unitdir}/system/systemd-quotacheck.service \
> +        ${rootlibexecdir}/systemd/systemd-quotacheck \
> +"
> +
> +PACKAGES =+ "${PN}-services-randomseed"
> +SUMMARY_${PN}-services-randomseed = "systemd's random seed save/restore service"
> +FILES_${PN}-services-randomseed = "\
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-random-seed.service \
> +        ${systemd_unitdir}/system/systemd-random-seed.service \
> +        ${rootlibexecdir}/systemd/systemd-random-seed \
> +"
> +
> +PACKAGES =+ "${PN}-services-readahead"
> +SUMMARY_${PN}-services-readahead = "systemd's disk read ahead service"
> +FILES_${PN}-services-readahead = "\
> +        ${systemd_unitdir}/system/systemd-readahead-collect.service \
> +        ${systemd_unitdir}/system/systemd-readahead-done.service \
> +        ${systemd_unitdir}/system/systemd-readahead-done.timer \
> +        ${systemd_unitdir}/system/systemd-readahead-drop.service \
> +        ${systemd_unitdir}/system/systemd-readahead-replay.service \
> +        ${rootlibexecdir}/systemd/systemd-readahead \
> +"
> +
> +PACKAGES =+ "${PN}-services-resolved"
> +SUMMARY_${PN}-services-resolved = "systemd's network name resolution management service"
> +# NOTE: if no sysusers or tmpfiles, then users/groups and FS structure must be setup
> +RRECOMMENDS_${PN}-services-resolved = "${PN}-services-dbus ${PN}-services-sysusers ${PN}-services-tmpfiles"
> +CONFFILES_${PN}-services-resolved = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
> +        ${sysconfdir}/systemd/resolved.conf \
> +"
> +FILES_${PN}-services-resolved = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
> +        ${sysconfdir}/systemd/resolved.conf \
> +        ${sysconfdir}/systemd/system/multi-user.target.wants/systemd-resolved.service \
> +        ${exec_prefix}/lib/libnss_resolve.so.2 \
> +        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.resolve1.busname \
> +        ${systemd_unitdir}/system/dbus-org.freedesktop.resolve1.service \
> +        ${systemd_unitdir}/system/org.freedesktop.resolve1.busname \
> +        ${systemd_unitdir}/system/systemd-resolved.service \
> +        ${rootlibexecdir}/systemd/systemd-resolve-host \
> +        ${rootlibexecdir}/systemd/systemd-resolved \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.resolve1.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-rfkill"
> +SUMMARY_${PN}-services-rfkill = "systemd's rfkill state save/restore service"
> +FILES_${PN}-services-rfkill = "\
> +        ${systemd_unitdir}/system/systemd-rfkill@.service \
> +        ${rootlibexecdir}/systemd/systemd-rfkill \
> +"
> +
> +PACKAGES =+ "${PN}-services-sleep"
> +SUMMARY_${PN}-services-sleep = "systemd's sleep, suspend and hiberate services"
> +FILES_${PN}-services-sleep = "\
> +        ${systemd_unitdir}/system/systemd-hybrid-sleep.service \
> +        ${systemd_unitdir}/system/systemd-suspend.service \
> +        ${systemd_unitdir}/system/systemd-hibernate.service \
> +        ${systemd_unitdir}/system-sleep/ \
> +        ${rootlibexecdir}/systemd/systemd-sleep \
> +"
> +
> +PACKAGES =+ "${PN}-services-sysctl"
> +SUMMARY_${PN}-services-sysctl = "systemd's kernel parameters configuration service"
> +FILES_${PN}-services-sysctl = "\
> +        ${sysconfdir}/sysctl.d/ \
> +        ${exec_prefix}/lib/sysctl.d/ \
> +        ${exec_prefix}/lib/sysctl.d/50-default.conf \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-sysctl.service \
> +        ${systemd_unitdir}/system/systemd-sysctl.service \
> +        ${rootlibexecdir}/systemd/systemd-sysctl \
> +"
> +
> +PACKAGES =+ "${PN}-services-sysusers"
> +SUMMARY_${PN}-services-sysusers = "systemd's service and tool to allocate system users and groups"
> +FILES_${PN}-services-sysusers = "\
> +        ${base_bindir}/systemd-sysusers \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-sysusers.service \
> +        ${systemd_unitdir}/system/systemd-sysusers.service \
> +        ${exec_prefix}/lib/sysusers.d/basic.conf \
> +        ${exec_prefix}/lib/sysusers.d/systemd.conf \
> +"
> +
> +PACKAGES =+ "${PN}-services-sysvcompat"
> +SUMMARY_${PN}-services-sysvcompat = "systemd's SYSV legacy and compatibility service"
> +# NOTE: if no sysusers or tmpfiles, then users/groups and FS structure must be setup
> +RRECOMMENDS_${PN}-services-sysvcompat = "${PN}-services-sysusers ${PN}-services-tmpfiles"
> +FILES_${PN}-services-sysvcompat = "\
> +        ${rootlibexecdir}/systemd/systemd-bus-proxyd \
> +        ${rootlibexecdir}/systemd/systemd-socket-proxyd \
> +        ${bindir}/systemd-stdio-bridge \
> +        ${rootlibexecdir}/systemd/system-generators/systemd-rc-local-generator \
> +        ${rootlibexecdir}/systemd/system-generators/systemd-sysv-generator \
> +        ${rootlibexecdir}/systemd/systemd-initctl \
> +        ${rootlibexecdir}/systemd/systemd-update-utmp \
> +        ${systemd_unitdir}/system/halt-local.service \
> +        ${systemd_unitdir}/system/rc-local.service \
> +        ${systemd_unitdir}/system/runlevel1.target.wants/systemd-update-utmp-runlevel.service \
> +        ${systemd_unitdir}/system/runlevel2.target.wants/systemd-update-utmp-runlevel.service \
> +        ${systemd_unitdir}/system/runlevel3.target.wants/systemd-update-utmp-runlevel.service \
> +        ${systemd_unitdir}/system/runlevel4.target.wants/systemd-update-utmp-runlevel.service \
> +        ${systemd_unitdir}/system/runlevel5.target.wants/systemd-update-utmp-runlevel.service \
> +        ${systemd_unitdir}/system/sockets.target.wants/systemd-initctl.socket \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-update-utmp.service \
> +        ${systemd_unitdir}/system/systemd-initctl.service \
> +        ${systemd_unitdir}/system/systemd-initctl.socket \
> +        ${systemd_unitdir}/system/systemd-update-utmp-runlevel.service \
> +        ${systemd_unitdir}/system/systemd-update-utmp.service \
> +        ${exec_prefix}/lib/tmpfiles.d/legacy.conf \
> +"
> +
> +PACKAGES =+ "${PN}-services-timedated"
> +SUMMARY_${PN}-services-timedated = "systemd's time and date management service"
> +RDEPENDS_${PN}-services-timedated = "${PN}-services-dbus"
> +CONFFILES_${PN}-services-timedated = "${sysconfdir}/dbus-1/system.d/org.freedesktop.timedate1.conf"
> +FILES_${PN}-services-timedated = "\
> +        ${sysconfdir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
> +        ${bindir}/timedatectl \
> +        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.timedate1.busname \
> +        ${systemd_unitdir}/system/dbus-org.freedesktop.timedate1.service \
> +        ${systemd_unitdir}/system/org.freedesktop.timedate1.busname \
> +        ${systemd_unitdir}/system/systemd-timedated.service \
> +        ${rootlibexecdir}/systemd/systemd-timedated \
> +        ${datadir}/dbus-1/system-services/org.freedesktop.timedate1.service \
> +        ${datadir}/polkit-1/actions/org.freedesktop.timedate1.policy \
> +"
> +
> +PACKAGES =+ "${PN}-services-timesyncd"
> +SUMMARY_${PN}-services-timesyncd = "systemd's NTP sync service"
> +# NOTE: if no sysusers, then users/groups must be setup
> +RRECOMMENDS_${PN}-services-timesyncd = "${PN}-services-sysusers"
> +CONFFILES_${PN}-services-timesyncd = "${sysconfdir}/systemd/timesyncd.conf"
> +FILES_${PN}-services-timesyncd = "\
> +        ${sysconfdir}/systemd/system/sysinit.target.wants/systemd-timesyncd.service \
> +        ${sysconfdir}/systemd/timesyncd.conf \
> +        ${systemd_unitdir}/system/systemd-timesyncd.service \
> +        ${rootlibexecdir}/systemd/systemd-timesyncd \
> +"
> +
> +PACKAGES =+ "${PN}-services-tmpfiles"
> +SUMMARY_${PN}-services-tmpfiles = "systemd's service to create, delete and clean up volatile/tmp files/dirs"
> +FILES_${PN}-services-tmpfiles = "\
> +        ${sysconfdir}/tmpfiles.d/ \
> +        ${base_bindir}/systemd-tmpfiles \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-tmpfiles-setup-dev.service \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-tmpfiles-setup.service \
> +        ${systemd_unitdir}/system/systemd-tmpfiles-clean.service \
> +        ${systemd_unitdir}/system/systemd-tmpfiles-clean.timer \
> +        ${systemd_unitdir}/system/systemd-tmpfiles-setup-dev.service \
> +        ${systemd_unitdir}/system/systemd-tmpfiles-setup.service \
> +        ${systemd_unitdir}/system/timers.target.wants/systemd-tmpfiles-clean.timer \
> +        ${exec_prefix}/lib/tmpfiles.d/etc.conf \
> +        ${exec_prefix}/lib/tmpfiles.d/systemd-nologin.conf \
> +        ${exec_prefix}/lib/tmpfiles.d/systemd.conf \
> +        ${exec_prefix}/lib/tmpfiles.d/tmp.conf \
> +        ${exec_prefix}/lib/tmpfiles.d/var.conf \
> +        ${exec_prefix}/lib/tmpfiles.d/00-create-volatile.conf \
> +        ${exec_prefix}/lib/tmpfiles.d/x11.conf \
> +"
> +
> +PACKAGES =+ "${PN}-services-udev"
> +SUMMARY_${PN}-services-udev = "systemd's udev services"
> +RDEPENDS_${PN}-services-udev = "udev"
> +FILES_${PN}-services-udev = "\
> +        ${systemd_unitdir}/system/initrd-udevadm-cleanup-db.service \
> +        ${systemd_unitdir}/system/systemd-udev-hwdb-update.service \
> +        ${systemd_unitdir}/system/systemd-udev-settle.service \
> +        ${systemd_unitdir}/system/systemd-udev-trigger.service \
> +        ${systemd_unitdir}/system/systemd-udevd-control.socket \
> +        ${systemd_unitdir}/system/systemd-udevd-kernel.socket \
> +        ${systemd_unitdir}/system/systemd-udevd.service \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-udevd.service \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-udev-trigger.service \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-udev-hwdb-update.service \
> +        ${systemd_unitdir}/system/sockets.target.wants/systemd-udevd-kernel.socket \
> +        ${systemd_unitdir}/system/sockets.target.wants/systemd-udevd-control.socket \
> +"
> +
> +PACKAGES =+ "${PN}-services-update"
> +SUMMARY_${PN}-services-update = "systemd's post update service"
> +FILES_${PN}-services-update = "\
> +        ${rootlibexecdir}/systemd/system-generators/systemd-system-update-generator \
> +        ${rootlibexecdir}/systemd/systemd-update-done \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-update-done.service \
> +        ${systemd_unitdir}/system/systemd-update-done.service \
> +"
> +
> +PACKAGES =+ "${PN}-services-vconsole"
> +SUMMARY_${PN}-services-vconsole = "systemd's service to configure the virtual console (keyboard/font)"
> +RDEPENDS_${PN}-services-vconsole = "kbd kbd-consolefonts kbd-keymaps"
> +FILES_${PN}-services-vconsole = "\
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service \
> +        ${systemd_unitdir}/system/systemd-vconsole-setup.service \
> +        ${rootlibexecdir}/systemd/systemd-vconsole-setup \
> +"
> +
> +########################################################################
> +# Standard BitBake Packages
> +########################################################################
> +
> +FILES_${PN}-dbg += "\
> +        ${base_libdir}/security/.debug/ \
> +        ${libdir}/systemd/ptest/.debug \
> +        ${rootlibdir}/.debug \
> +        ${systemd_unitdir}/*/.debug \
> +        ${systemd_unitdir}/.debug \
> +"
> +
> +FILES_${PN}-dev += "\
> +        ${base_libdir}/security/*.la \
> +        ${datadir}/dbus-1/interfaces/ \
> +"
> +
> +# The test cases need perl and bash to run correctly.
> +RDEPENDS_${PN}-ptest += "perl bash"
> +FILES_${PN}-ptest += "\
> +        ${libdir}/udev/rules.d \
> +"
> +
> +########################################################################
> +# Misc Packages
> +########################################################################
> +
> +PACKAGES =+ "${PN}-bash"
> +SUMMARY_${PN}-bash = "systemd bash shell commands completion"
> +FILES_${PN}-bash = "\
> +        ${datadir}/bash-completion/completions/bootctl \
> +        ${datadir}/bash-completion/completions/busctl \
> +        ${datadir}/bash-completion/completions/coredumpctl \
> +        ${datadir}/bash-completion/completions/hostnamectl \
> +        ${datadir}/bash-completion/completions/journalctl \
> +        ${datadir}/bash-completion/completions/kernel-install \
> +        ${datadir}/bash-completion/completions/localectl \
> +        ${datadir}/bash-completion/completions/loginctl \
> +        ${datadir}/bash-completion/completions/machinectl \
> +        ${datadir}/bash-completion/completions/systemctl \
> +        ${datadir}/bash-completion/completions/systemd-* \
> +        ${datadir}/bash-completion/completions/timedatectl \
> +"
> +
> +PACKAGES =+ "${PN}-initramfs"
> +SUMMARY_${PN}-initramfs = "systemd's initramfs support"
> +FILES_${PN}-initramfs = "/init"
> +RDEPENDS_${PN}-initramfs = "${PN}"
> +
> +PACKAGES =+ "${PN}-kernel-install"
> +SUMMARY_${PN}-kernel-install = "systemd tool to add/remove kernel and initramfs images to/from /boot"
> +RDEPENDS_${PN}-kernel-install = "bash kmod"
> +FILES_${PN}-kernel-install = "\
> +        ${bindir}/kernel-install \
> +        ${sysconfdir}/kernel/install.d/ \
> +        ${exec_prefix}/lib/kernel/install.d/ \
> +"
> +
> +PACKAGES =+ "${PN}-pam"
> +SUMMARY_${PN}-pam = "systemd PAM modules and configuration"
> +FILES_${PN}-pam = "\
> +        ${sysconfdir}/pam.d \
> +        ${base_libdir}/security/pam_systemd.so \
> +"
> +
> +PACKAGES =+ "${PN}-preset"
> +SUMMARY_${PN}-preset = "systemd's service enablement presets"
> +FILES_${PN}-preset = "${systemd_unitdir}/system-preset/90-systemd.preset"
> +
> +PACKAGES =+ "${PN}-rpm-macros"
> +SUMMARY_${PN}-rpm-macros = "systemd RPM macros"
> +FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm/macros.d/macros.systemd"
> +
> +PACKAGES =+ "${PN}-zsh"
> +SUMMARY_${PN}-zsh = "systemd zsh shell commands completion"
> +FILES_${PN}-zsh = "\
> +        ${datadir}/zsh/site-functions/_bootctl \
> +        ${datadir}/zsh/site-functions/_busctl \
> +        ${datadir}/zsh/site-functions/_coredumpctl \
> +        ${datadir}/zsh/site-functions/_hostnamectl \
> +        ${datadir}/zsh/site-functions/_journalctl \
> +        ${datadir}/zsh/site-functions/_kernel-install \
> +        ${datadir}/zsh/site-functions/_localectl \
> +        ${datadir}/zsh/site-functions/_loginctl \
> +        ${datadir}/zsh/site-functions/_machinectl \
> +        ${datadir}/zsh/site-functions/_sd_* \
> +        ${datadir}/zsh/site-functions/_systemctl \
> +        ${datadir}/zsh/site-functions/_systemd \
> +        ${datadir}/zsh/site-functions/_systemd-* \
> +        ${datadir}/zsh/site-functions/_timedatectl \
> +"
> +
> +
> +########################################################################
> +# Aggregation of Split Packages
> +########################################################################
> +
> +PACKAGES =+ "${PN}-services-essential"
> +SUMMARY_${PN}-services-essential = "systemd's essential services aggregation"
> +ALLOW_EMPTY_${PN}-services-essential = "1"
> +RDEPENDS_${PN}-services-essential = "\
> +        ${PN}-generators-filesystems \
> +        ${PN}-preset \
> +        ${PN}-services-fsck \
> +        ${PN}-services-journal \
> +        ${PN}-services-modules-load \
> +        ${PN}-services-randomseed \
> +        ${PN}-services-sleep \
> +        ${PN}-services-sysctl \
> +        ${PN}-services-sysusers \
> +        ${PN}-services-tmpfiles \
> +        ${PN}-services-udev \
> +        udev-rules-systemd \
> +"
> +
> +PACKAGES =+ "${PN}-services-base"
> +SUMMARY_${PN}-services-base = "systemd's base services aggregation"
> +ALLOW_EMPTY_${PN}-services-base = "1"
> +RDEPENDS_${PN}-services-base = "${PN}-services-essential \
> +        ${PN}-services-ask-password \
> +        ${PN}-services-backlight \
> +        ${PN}-services-binfmt \
> +        ${PN}-services-coredump \
> +        ${PN}-services-dbus \
> +        ${PN}-services-firstboot \
> +        ${PN}-services-fuse \
> +        ${PN}-services-hostnamed \
> +        ${PN}-services-ldconfig \
> +        ${PN}-services-localed \
> +        ${PN}-services-logind \
> +        ${PN}-services-networkd \
> +        ${PN}-services-quota \
> +        ${PN}-services-resolved \
> +        ${PN}-services-rfkill \
> +        ${PN}-services-timedated \
> +        ${PN}-services-timesyncd \
> +        ${PN}-services-update \
> +        ${PN}-services-vconsole \
> +"
> +
> +PACKAGES =+ "${PN}-services-all"
> +SUMMARY_${PN}-services-all = "systemd's all services and tools aggregation"
> +ALLOW_EMPTY_${PN}-services-all = "1"
> +RDEPENDS_${PN}-services-all = "${PN}-services-base \
> +        ${PN}-services-bootchart \
> +        ${PN}-services-cryptsetup \
> +        ${PN}-services-debug \
> +        ${PN}-services-journal-remote \
> +        ${PN}-services-journal-upload \
> +        ${PN}-services-machined \
> +        ${PN}-services-nspawn \
> +        ${PN}-services-sysvcompat \
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${PN}-services-multi-seat-x', '', d)} \
> +        ${PN}-tools \
> +"
> +
> +
> +########################################################################
> +# Core Package
> +########################################################################
> +
> +CONFFILES_${PN} = "\
> +        ${sysconfdir}/machine-id \
> +        ${sysconfdir}/systemd/system.conf \
> +        ${sysconfdir}/systemd/user.conf \
> +"
> +
> +FILES_${PN} = "\
> +        ${base_bindir}/systemctl \
> +        ${base_bindir}/systemd-hwdb \
> +        ${bindir}/bootctl \
> +        ${datadir}/${BPN} \
> +        ${datadir}/factory \
> +        ${exec_prefix}/lib/libnss_myhostname* \
> +        ${libdir}/systemd/user-generators/ \
> +        ${libdir}/systemd/user/ \
> +        ${localstatedir} \
> +        ${rootlibexecdir}/systemd/systemd \
> +        ${rootlibexecdir}/systemd/systemd-cgroups-agent \
> +        ${rootlibexecdir}/systemd/systemd-shutdown \
> +        ${rootlibexecdir}/systemd/systemd-shutdownd \
> +        ${rootlibexecdir}/systemd/systemd-machine-id-commit \
> +        ${rootlibexecdir}/systemd/systemd-hibernate-resume \
> +        ${rootlibexecdir}/systemd/systemd-importd \
> +        ${rootlibexecdir}/systemd/import-pubring.gpg \
> +        ${rootlibexecdir}/systemd/systemd-pull \
> +        ${sysconfdir}/init.d/README \
> +        ${sysconfdir}/machine-id \
> +        ${sysconfdir}/systemd/system.conf \
> +        ${sysconfdir}/systemd/system/ \
> +        ${sysconfdir}/systemd/user.conf \
> +        ${sysconfdir}/systemd/user/ \
> +        ${sysconfdir}/xdg/systemd/ \
> +        ${systemd_unitdir}/system-generators/ \
> +        ${systemd_unitdir}/system-preset/ \
> +        ${systemd_unitdir}/system-shutdown/ \
> +        ${systemd_unitdir}/system/ \
> +"
> +
> +#RDEPENDS_${PN} += "volatile-binds"
> +
> +RRECOMMENDS_${PN} += "\
> +        ${PN}-services-base \
> +        ${PN}-services-essential \
> +        ${PN}-generators-getty \
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PN}-pam', '', d)} \
> +        ${PN}-services-getty \
> +        ${PN}-tools \
> +        kernel-module-autofs4 \
> +        kernel-module-ipv6 \
> +        kernel-module-unix \
> +        os-release \
> +        udev (= ${EXTENDPKGV}) \
> +        udev-hwdb \
> +"
> +
> +ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
> +
> +ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
> +ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
> +ALTERNATIVE_PRIORITY[init] ?= "300"
> +
> +ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
> +ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
> +ALTERNATIVE_PRIORITY[halt] ?= "300"
> +
> +ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
> +ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
> +ALTERNATIVE_PRIORITY[reboot] ?= "300"
> +
> +ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
> +ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
> +ALTERNATIVE_PRIORITY[shutdown] ?= "300"
> +
> +ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
> +ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
> +ALTERNATIVE_PRIORITY[poweroff] ?= "300"
> +
> +ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
> +ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
> +ALTERNATIVE_PRIORITY[runlevel] ?= "300"
> +
> +
> +########################################################################
> +# UDEV Section
> +########################################################################
> +
> +PACKAGES =+ "udev-dbg"
> +SUMMARY_udev-dbg = "Dynamic device management - Debugging files"
> +RRECOMMENDS_udev-dbg += "${PN}-dbg"
> +FILES_udev-dbg = "\
> +        ${rootlibexecdir}/udev/.debug \
> +        ${base_sbindir}/.debug/udevd \
> +        ${base_bindir}/.debug/udevadm \
> +        ${rootlibexecdir}/systemd/.debug/systemd-udevd \
> +        ${base_libdir}/.debug/libudev* \
> +        ${base_libdir}/.debug/libgudev* \
> +        ${exec_prefix}/lib/.debug/libgudev* \
> +"
> +
> +PACKAGES =+ "udev-dev"
> +SUMMARY_udev-dev = "Dynamic device management - Development files"
> +RRECOMMENDS_udev-dev += "${PN}-dev"
> +FILES_udev-dev = "\
> +        ${datadir}/pkgconfig/*udev* \
> +        ${libdir}/pkgconfig/*udev* \
> +        ${libdir}/lib*udev*.la \
> +        ${includedir}/*udev* \
> +"
> +
> +PACKAGES =+ "udev-hwdb"
> +SUMMARY_udev-hwdb = "Dynamic device management - Hardware database"
> +RDEPENDS_udev-hwdb = "udev"
> +FILES_udev-hwdb = "\
> +        ${rootlibexecdir}/udev/hwdb.d/ \
> +"
> +
> +pkg_postinst_udev-hwdb () {
> +	if test -n "$D"; then
> +		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
> +			--root $D
> +	else
> +		udevadm hwdb --update
> +	fi
> +}
> +
> +pkg_prerm_udev-hwdb () {
> +	if test -n "$D"; then
> +		exit 1
> +	fi
> +
> +	rm -f ${sysconfdir}/udev/hwdb.bin
> +}
> +
> +PACKAGES =+ "udev-bash"
> +SUMMARY_udev-bash = "Dynamic device management - Bash shell commands completion"
> +FILES_udev-bash = "${datadir}/bash-completion/completions/udevadm"
> +
> +PACKAGES =+ "udev-zsh"
> +SUMMARY_udev-zsh = "Dynamic device management - zsh shell commands completion"
> +FILES_udev-zsh = "${datadir}/zsh/site-functions/_udevadm"
> +
> +
> +########################################################################
> +# UDEV Rules Packages
> +# split rules that require external programs or dependencies.
> +# those that use only builtins are not split
> +########################################################################
> +
> +PACKAGES =+ "udev-rules-accelerometer"
> +SUMMARY_udev-rules-accelerometer = "Dynamic device management - accelerometer rules"
> +FILES_udev-rules-accelerometer = "\
> +        ${rootlibexecdir}/udev/accelerometer \
> +        ${rootlibexecdir}/udev/rules.d/61-accelerometer.rules \
> +"
> +
> +PACKAGES =+ "udev-rules-cdrom"
> +SUMMARY_udev-rules-cdrom = "Dynamic device management - cdrom rules"
> +FILES_udev-rules-cdrom = "\
> +        ${rootlibexecdir}/udev/cdrom_id \
> +        ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
> +"
> +
> +PACKAGES =+ "udev-rules-mtd"
> +SUMMARY_udev-rules-mtd = "Dynamic device management - mtd rules"
> +FILES_udev-rules-mtd = "\
> +        ${rootlibexecdir}/udev/mtd_probe \
> +        ${rootlibexecdir}/udev/rules.d/75-probe_mtd.rules \
> +"
> +
> +PACKAGES =+ "udev-rules-persistent-storage"
> +SUMMARY_udev-rules-persistent-storage = "Dynamic device management - persistent storage rules"
> +FILES_udev-rules-persistent-storage = "\
> +        ${rootlibexecdir}/udev/ata_id \
> +        ${rootlibexecdir}/udev/scsi_id \
> +        ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
> +        ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
> +"
> +
> +PACKAGES =+ "udev-rules-systemd"
> +SUMMARY_udev-rules-systemd = "Dynamic device management - systemd rules"
> +RDEPENDS_udev-rules-systemd = "${PN} ${PN}-services-sysctl"
> +FILES_udev-rules-systemd = "\
> +        ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
> +"
> +
> +PACKAGES =+ "udev-rules-v4l"
> +SUMMARY_udev-rules-v4l = "Dynamic device management - v4l rules"
> +FILES_udev-rules-v4l = "\
> +        ${rootlibexecdir}/udev/v4l_id \
> +        ${rootlibexecdir}/udev/rules.d/*-persistent-v4l.rules \
> +"
> +
> +PACKAGES =+ "udev-rules-all"
> +SUMMARY_udev-rules-all = "Dynamic device management - all rules aggregation"
> +ALLOW_EMPTY_udev-rules-all = "1"
> +RDEPENDS_udev-rules-all = "\
> +        udev-rules-accelerometer \
> +        udev-rules-cdrom \
> +        udev-rules-mtd \
> +        udev-rules-persistent-storage \
> +        udev-rules-systemd \
> +        udev-rules-v4l \
> +"
> +
> +PACKAGES =+ "udev"
> +SUMMARY_udev = "Dynamic device management"
> +RPROVIDES_udev = "hotplug"
> +PROVIDES = "udev"
> +CONFFILES_udev = "${sysconfdir}/udev/udev.conf"
> +FILES_udev = "\
> +        ${base_bindir}/udevadm \
> +        ${base_sbindir}/udevd \
> +        ${rootlibexecdir}/systemd/systemd-udevd \
> +        ${rootlibexecdir}/udev/collect \
> +        ${rootlibexecdir}/udev/rules.d/42-usb-hid-pm.rules \
> +        ${rootlibexecdir}/udev/rules.d/50-firmware.rules \
> +        ${rootlibexecdir}/udev/rules.d/50-udev-default.rules \
> +        ${rootlibexecdir}/udev/rules.d/60-drm.rules \
> +        ${rootlibexecdir}/udev/rules.d/60-keyboard.rules \
> +        ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
> +        ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
> +        ${rootlibexecdir}/udev/rules.d/60-persistent-serial.rules \
> +        ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
> +        ${rootlibexecdir}/udev/rules.d/75-net-description.rules \
> +        ${rootlibexecdir}/udev/rules.d/75-tty-description.rules \
> +        ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
> +        ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
> +        ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
> +        ${rootlibexecdir}/udev/rules.d/95-udev-late.rules \
> +        ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
> +        ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
> +        ${rootlibexecdir}/udev/rules.d/touchscreen.rules \
> +        ${sysconfdir}/init.d/systemd-udevd \
> +        ${sysconfdir}/udev \
> +"
> +
> +RRECOMMENDS_udev = "\
> +        udev-hwdb \
> +        udev-rules-all \
> +"
> +
> +INITSCRIPT_PACKAGES = "udev"
> +INITSCRIPT_NAME_udev = "systemd-udevd"
> +INITSCRIPT_PARAMS_udev = "start 03 S ."
> +
> +python __anonymous() {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
> +
> +# As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
> +# that we don't build both udev and systemd in world builds.
> +python () {
> +    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
> +        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
> +}
>

Bruno, could you create separate patches for the upgrade and for the 
repackaging? Also what type of testing has been done for partial installs?



