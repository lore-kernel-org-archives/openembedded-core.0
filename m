Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9E5D60203
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 22:35:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a9so1206033wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 14:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bj3LC1fod0aOpbvxhNDCDhKo4GZtWCstrUKX6ymvWLI=;
	b=mp4KEyGIJBnnowVsFKijIGjJ1TCIJuroeqGHhV/pb0lv9zurEZ75lodWuSE3kG0jTb
	IUs3LaFo8NFDQeJxPmoJEfdzzpEzoNFIq/CZBvt92Sp3ej2R95kBOqzufOpW7RshNbT4
	kI+/JrWSjH/vzRSHYQKCv2jsVIRVP3jhXVx0mMj80udpssUi0oGYVITWYI9nZdE3ddFS
	Bmf2TfWE6gkspLP+AErDog40w489QEvqS+q5E9uMWY7x7bFKb2Bp28Rf2LGgk9R8Y29A
	hCFYRoo8XZsnK0G69rDSl8+kp3Svu6M2qDyr6C5Y1O7jnPTx9PLvrKv69qnNKH2RjKmK
	/dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bj3LC1fod0aOpbvxhNDCDhKo4GZtWCstrUKX6ymvWLI=;
	b=bGiy6ycUKZEhlWzAqAbVvCm3k4JZ2RxqHU82feK2saVSTgoPPsUJB8UEryglVpOXz4
	a7QMTOvw3M4YKHXVhXeOOwETyKbnTHF8Gmbur8ZF5sZP8daGxKLkrFL0RGTaJS6XW86x
	PNPaE59V/5X9tpi/rfU+fNf88iT/iocwJjoA3iit3nxQvx3pShMhIKfOB84d3ZXPIYVO
	aVilX7+rDsmG97hi/xpywT7K/Rxj6v2x4QQ9w4jM9nujUcJz63j64QfFw1OUwu0rTEno
	IZDn2yOpC2oUil3+v+wNrC/MyY6dYpUqLSAUWmBCESy/Y6gIXIlnK/1q7exKlFh6vfPe
	yIFQ==
X-Gm-Message-State: APjAAAVgXf6B5gRUd5XolX4mIyX+E6zbVPN1J6pXx10kOrtmoTJ+AlGN
	M14tmDt2OYZatIbqoahORfNWzZS8WrU=
X-Google-Smtp-Source: APXvYqyHRCVR+fsZeNsXY9swxE4Ur7+fokiF1PlvcamLJfverbAy59RR4rPYbdXbLozaT9qs0lbEew==
X-Received: by 2002:a05:600c:cd:: with SMTP id
	u13mr1187627wmm.24.1580769334290; 
	Mon, 03 Feb 2020 14:35:34 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id z10sm981542wmk.31.2020.02.03.14.35.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 14:35:32 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 22:35:26 +0000
Message-Id: <20200203223526.49375-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] systemd: Upgrade 243.2 -> 243.4-latest
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
X-List-Received-Date: Mon, 03 Feb 2020 22:35:35 -0000

Update to latest on the 243 stable branch. This includes (amongst other
fixes) seccomp filter changes which fix failures with glibc 2.31, e.g.

  systemd-journald[543]: Assertion 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at src/basic/time-util.c:55, function now(). Aborting.

Refresh:
  0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
  0001-do-not-disable-buffer-in-writing-files.patch

Drop 0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch,
fixed in 5c0224c7bf3c ("Handle d_type == DT_UNKNOWN correctly").

Drop 0001-seccomp-more-comprehensive-protection-against-libsec.patch,
fixed in 70e8c1978a9a ("seccomp: real syscall numbers are >= 0").

Drop 0004-rules-whitelist-hd-devices.patch and
0005-rules-watch-metadata-changes-in-ide-devices.patch which cause
ide-cd to flap with tray open messages (and don't appear to be required
any more)

Commits from v243-stable:

  70e8c1978a9a seccomp: real syscall numbers are >= 0
  a0a1977d9a5d seccomp: more comprehensive protection against libseccomp's __NR_xyz namespace invasion
  7f936c60d597 network: set ipv6 mtu after link-up or device mtu change
  b59d88cc62a4 man: fix typo in net-naming-scheme man page
  c5e5ac095821 man: fix typos (#14304)
  9a2f26564d5a ipv4ll: do not reset conflict counter on restart
  bc9e1ebfdd3b Fix typo (duplicate "or")
  c6cb71b7e741 network: if /sys is rw, then udev should be around
  67dcdfd95629 nspawn: do not fail if udev is not running
  a7938a1bc6d3 Create parent directories when creating systemd-private subdirs
  53aa44f8738a network: do not return error but return UINT64_MAX if speed meter is disabled
  65abf126744f core: swap priority can be negative
  b1cf452ff5f6 systemctl: enhance message about kexec missing kernel
  07a0e5b42523 man: use mkswap@ instead of makeswap@
  57dc017c6bac journald: don't ask for the machine ID if we don't need it
  ac392a57c08c journalctl: pager_close() calls fflush(stdout) anyway as first thing
  ee7dfadc8237 journald: remove unused field
  471073f1b52b journalctl: return EOPNOTSUPP if pcre is not enabled
  002ededb61a0 man: drop reference to machined, add one for journald instead
  fd3bd4be3bff pid1: make TimeoutAbortSec settable for transient units
  eb2ef4d6643e pid1: fix setting of DefaultTimeoutAbortSec
  1d75e29b2378 shared/ask-password-api: modify keyctl break value
  a16b1ee7e565 cryptsetup: reduce the chance that we will be OOM killed
  4836fb010ae8 core: write out correct field name when creating transient service units
  3e2c547f6d3c udevd: don't use monitor after manager_exit()
  d42f7d45a8e2 Revert "udevd: fix crash when workers time out after exit is signal caught"
  c9a287eee8fd man/systemd.link: Add missing verb *be*
  a67a3ae04b89 man: document all pager variables for systemctl and systemd
  3a8fce3f38b6 core.timer: fix "systemd-analyze dump" and docs syntax inconsistencies wrt OnTimezoneChange=
  fdffd284b682 core/service: downgrade "scheduling restart" message to debug
  733e7f19d3cf travis: add missing closing quote sign
  0d7b7817fc34 systemd-tmpfiles: don't install timer when service isn't installed either
  0e7f83cd2b31 pam_systemd: prolong method call timeout when allocating session
  e51d9bf9e5ac man: add entry about SpeedMeter=
  aa1fc791c7a1 udev: silence warning about PROGRAM+= or IMPORT+= rules
  b9a619bb6738 udevadm: ignore EROFS and return earlier
  1ec5b9f80cb5 basic: add vmware hypervisor detection from device-tree
  7fa7080248aa umount: be happy if /proc/swaps doesn't exist
  71ccd774bb33 shutdown: make logging more useful if NULL swap/mount table files are specified
  38453c6d42e4 man: share description of $SYSTEMD_COLORS in other tools
  b50ca0152681 core: do not propagate polkit error to caller
  99b72a66ca55 ask-password: don't hit assert() when we query pw which the user C-d and caching is enabled
  288edd686911 man: mention $RUNTIME_DIRECTORY & friends in environment list
  37aeadd433d3 cryptsetup-generator: guess whether the keyfile argument is two items or one
  a87e8fdc72d7 verify: fix segmentation fault
  3aea728cd2d2 timedated: it might be that tzinfo files are just not installed
  cc103c72abc1 timedated: handle UTC specially, when generating /etc/localtime
  f5a4caa5418b time-util: treat /etc/localtime missing as UTC
  2139d58652bb bpf: fix off-by-one in class whitelisting
  cb7693595db9 bpf: fix device type filter
  56e1ba304b00 core: constify bpf program arrays
  b06b7ace92c1 run: propagate return code/status from the child
  5db454b8031c udevd: fix crash when workers time out after exit is signal caught
  b774282a855e udev: ignore error caused by device disconnection
  8d88a2ecd7ce udev: fix error code in the log message
  c41484a2f3d7 udev: ignore ENOENT when chmod_and_chown() device node
  f218b65b3246 udev: do not append newline when write attributes
  ce4d17ddbc16 time-util: uniquify timezone list, in case UTC is listed in timezone1970.tab, too
  28f0b34c57bc time-util: always accept UTC as valid timezone
  8b888d236007 seccomp: add all *time64 syscalls
  53d8feeb2334 libblkid: open device in nonblock mode.
  b9478046b03d man: describe ordering in case of Conflicts=
  fa3e5bd2bbb4 man: put description of Wants= above Requires=
  bdebd2c325fc meson: remove strange dep that causes meson to enter infinite loop
  26bc77d8e5af man: fix option typo in pam_systemd man page
  9c12127e3d2e man: save pull-raw example file without underscores
  4c106cbcf1af man: small grammatical/word choice fixes to crypttab man page
  03cc374fca74 shared/format-table: disable ellipsization when piped
  0a5497d3fa4b sd-device-enumerator: do not return error when a device is removed
  7b0d0331d051 bootctl: create leading dirs when "bootctl random-seed" is called if needed
  5aab35aac9db core, job: fix breakage of ordering dependencies by systemctl reload command
  cd86ae937305 journalctl: allow running vacuum on remote journals, too
  fc0451bc0a3f allow an empty DefaultInstance= in configuration files
  587266c24aae man/systemd.net-naming-scheme: fix typo
  e0e63f0f9bb9 nspawn: respect quiet on capabilities warning
  37e50c05b564 nspawn: mangle slice name
  4fefc493541e mkosi: Find hostname command on Arch Linux
  c430e8affba4 Fix mkosi on Arch Linux
  1765b8d803dd Update to Fedora31
  0b9a2a9a9868 sd-boot: Silence compiler warning when building with -O2
  24e02f8d49b6 sd-boot: Don't loudly complain if RNG protocol isn't available
  14e377ef3519 sd-boot: Only disable optimization on debug builds
  a39008ddecb9 meson: correct man page deps
  4c1dcc06fa30 sd-event: don't invalidate source type on disconnect
  fb89ee34cedc analyze: fix minor memleak
  a449299bc087 analyze: sort list of unknown syscalls kernel implements
  51ea58a04b18 seccomp: add new Linux 5.3 syscalls to syscall filter lists
  819695c8b027 resolved: check for IP in certificate when using DoT with GnuTLS
  37f817e21097 resolved: require at least version 3.6.0 of GnuTLS for DNS-over-TLS
  32056809baa2 coverity: replace python with jq
  d2b4d7ee17de network-generator: Add missing help for --root
  f1b18c206208 modules-load: do not fail service if modules are not present
  606de6626714 pid1: order .automount units after local-fs-pre.target
  1366b81f2bc5 shared/install: failing with -ELOOP can be due to the use of an alias in install_error()
  84d5cd699e25 shared/install: fix error codes returned by install_context_apply()
  417779c58a86 man: alias names can't be used with enable command
  00af6c447f25 resolved: set stream type during DnsStream creation
  66dd9d7d25fd sd-device: allow sd_device_get_devtype to be called with NULL arg and do not assert
  048f9da1a4b3 Remove unused plymouth_running() function
  34fa67bbe732 machine-id-setup: avoid unexpected aborting
  24c99fa2ef3d test-socket-util: avoid writing past the defined buffer
  ce82233f99b3 test: drop duplicated 's'
  75a0e7209114 nspawn: fix handling of --console=help
  f41a282875fc Revert "sysusers: properly mark generated accounts as locked"
  fc2dceac6172 Remove unprintable non-ASCII char from special glyph ASCII fallback table
  dedf5b511e6f logind: fix emission of PropertiesChanged for users
  6e3cfe2e58f5 logind: fix emission of PropertiesChanged on seats
  a9152084d7e9 resolved: fix connection failures with TLS 1.3 and GnuTLS
  961879ed9ddb udev: tag any display devices as master-of-seat when nomodeset is used
  8aa7bafa1295 systemd-fsck: fix systemd-fsck/fsck pipe bad closure
  19590e289ace ceph is a network filesystem
  339606ad9e99 portabled: allow to detach an image with a unit in linked-runtime state
  bd9692734ac5 network: ndisc: do not drop all prefixes when a prefix matches a blacklist
  5e6d4f8b79e0 systemctl: fix memleak caused by wrong cleanup func
  47d0e23d26af udev: fix memleak caused by wrong cleanup function
  a6fb0542c5ef parse_hwdb: fix compatibility with pyparsing 2.4.*
  cb1d892f1780 parse_hwdb: process files in order
  ef677436aa20 test: Pass personality test even when i686 userland runs on x86_64 kernel
  3f6398c450b8 docs: fix inadvertent change in uid range
  25bb377a73e7 cgroup: fix typo in BPF firewall support warning message
  6d97aca0d503 fix build with compilers with default stack-protector enabled
  fbad077cec34 nspawn: surrender controlling terminal to PID2 when using the PID1 stub
  0553c3c66889 pid1: fix DefaultTasksMax initialization
  f406a691a722 src/core/automount: use DirectoryMode when calling mkdir -p
  20438f96c326 udevadm trigger: do not propagate EACCES and ENODEV
  6480630bc397 hwdb: Correct WWWW Pattern In Documentation Comment
  9d8e889810b5 nspawn: consistenly fail if parsing the environment fails
  40e169b30423 nspawn: default to unified hierarchy if --as-pid2 is used
  b5df1037a0c0 cgroup: Mark memory protections as explicitly set in transient units
  f14e3e02cca7 cgroup: Respect DefaultMemoryMin when setting memory.min
  ea248e53bf76 cgroup: Check ancestor memory min for unified memory config
  de1d25a506db cgroup: docs: memory.high doc fixups
  2ab45f38d8c4 cgroup: docs: Mention unbounded protection for memory.{low,min}
  19a43dc38a13 Consider smb3 as remote filesystem
  5c0224c7bf3c Handle d_type == DT_UNKNOWN correctly
  8282bc61df10 util-lib: Don't propagate EACCES from find_binary PATH lookup to caller
  9d0ae987a634 network: drop noisy log message
  f67f0e4ec45a Updated log message when the timesync happens for the first time (#13624)
  e151bf467494 units: make systemd-binfmt.service easier to work with no autofs
  2b8e574d8242 Corect man page reference in systemd-nologin.conf comments
  a0577353f191 man: Add a missing space in machinectl(1)
  693e98398869 log: Add missing "%" in "%m" log format strings
  ea7151b8c435 pid1: do not warn if /run/systemd/relabel-extra.d/ doesn't exist
  b90549290e33 man: fix typo

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- drop 0004-rules-whitelist-hd-devices.patch and
  0005-rules-watch-metadata-changes-in-ide-devices.patch which cause
  ide-cd to flap with tray open messages (and don't appear to be
  required any more)
- refresh 0001-do-not-disable-buffer-in-writing-files.patch (Khem Raj
  <raj.khem@gmail.com>)

 ...md-boot_243.2.bb => systemd-boot_243.4.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 ...tall-dependency-links-at-install-tim.patch |  30 ++--
 ...-not-disable-buffer-in-writing-files.patch |  88 ++++------
 ...prehensive-protection-against-libsec.patch | 152 ------------------
 ...ider-symlink-on-filesystems-like-NFS.patch |  42 -----
 .../0004-rules-whitelist-hd-devices.patch     |  34 ----
 ...atch-metadata-changes-in-ide-devices.patch |  45 ------
 .../{systemd_243.2.bb => systemd_243.4.bb}    |   4 -
 9 files changed, 45 insertions(+), 354 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_243.2.bb => systemd-boot_243.4.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
 rename meta/recipes-core/systemd/{systemd_243.2.bb => systemd_243.4.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.2.bb b/meta/recipes-core/systemd/systemd-boot_243.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_243.2.bb
rename to meta/recipes-core/systemd/systemd-boot_243.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 18f17d28ac53..2fca6dca64b7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,10 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "fab6f010ac6c3bc93a10868de722d7c8c3622eb9"
+SRCREV = "70e8c1978a9a688662eb1b3983370dd1cc415083"
 SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
+PV = "243.4+git${SRCPV}"
+
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 73e65ff79859..ea37680221f2 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -24,10 +24,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  units/systemd-binfmt.service.in         | 4 ++++
  3 files changed, 9 insertions(+), 4 deletions(-)
 
-diff --git a/units/meson.build b/units/meson.build
-index e1ee9f86c3..6bb7771b36 100644
---- a/units/meson.build
-+++ b/units/meson.build
+Index: systemd-stable/units/meson.build
+===================================================================
+--- systemd-stable.orig/units/meson.build
++++ systemd-stable/units/meson.build
 @@ -46,8 +46,7 @@ units = [
          ['poweroff.target',                     '',
           'runlevel0.target'],
@@ -48,10 +48,10 @@ index e1ee9f86c3..6bb7771b36 100644
          ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
          ['systemd-boot-system-token.service',    'ENABLE_EFI',
-diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 30a6bc9918..4231f3b70f 100644
---- a/units/proc-sys-fs-binfmt_misc.automount
-+++ b/units/proc-sys-fs-binfmt_misc.automount
+Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
+===================================================================
+--- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
++++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
 @@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
  
  [Automount]
@@ -59,19 +59,19 @@ index 30a6bc9918..4231f3b70f 100644
 +
 +[Install]
 +WantedBy=sysinit.target
-diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index e940c7c9ad..6be7f5cc9b 100644
---- a/units/systemd-binfmt.service.in
-+++ b/units/systemd-binfmt.service.in
-@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
+Index: systemd-stable/units/systemd-binfmt.service.in
+===================================================================
+--- systemd-stable.orig/units/systemd-binfmt.service.in
++++ systemd-stable/units/systemd-binfmt.service.in
+@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
  Conflicts=shutdown.target
 +Wants=proc-sys-fs-binfmt_misc.automount
  After=proc-sys-fs-binfmt_misc.automount
+ After=proc-sys-fs-binfmt_misc.mount
  Before=sysinit.target shutdown.target
- ConditionPathIsReadWrite=/proc/sys/
-@@ -28,3 +29,6 @@ Type=oneshot
+@@ -29,3 +30,6 @@ Type=oneshot
  RemainAfterExit=yes
  ExecStart=@rootlibexecdir@/systemd-binfmt
  TimeoutSec=90s
diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
index 2f4daf866588..d6d68a09ac9b 100644
--- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -38,11 +38,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c           |  2 +-
  17 files changed, 36 insertions(+), 36 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 7b5839ccd6..18f6e8ffc8 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -860,7 +860,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -860,7 +860,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -51,7 +49,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
          if (r < 0)
                  return r;
  
-@@ -1142,7 +1142,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1142,7 +1142,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -60,7 +58,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -1160,7 +1160,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1160,7 +1160,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -69,7 +67,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
                  if (r < 0)
                          return r;
  
-@@ -1187,7 +1187,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1187,7 +1187,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -78,7 +76,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
          if (r < 0)
                  return r;
  
-@@ -1197,7 +1197,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1197,7 +1197,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -87,7 +85,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
          if (r < 0)
                  return r;
  
-@@ -2053,7 +2053,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -2053,7 +2053,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -105,11 +103,9 @@ index 7b5839ccd6..18f6e8ffc8 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 42ce53d5aa..57512532a6 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -125,11 +121,9 @@ index 42ce53d5aa..57512532a6 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
-index 123d00e13e..e7ea78f349 100644
 --- a/src/basic/smack-util.c
 +++ b/src/basic/smack-util.c
-@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -138,8 +132,6 @@ index 123d00e13e..e7ea78f349 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/basic/util.c b/src/basic/util.c
-index 93d610bc98..97dca64f73 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
 @@ -294,7 +294,7 @@ void disable_coredumps(void) {
@@ -151,11 +143,9 @@ index 93d610bc98..97dca64f73 100644
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index aa9d811f2e..8c7f2dae7a 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
-@@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
+@@ -48,7 +48,7 @@ static int delete_rule(const char *rule)
          if (!fn)
                  return log_oom();
  
@@ -164,7 +154,7 @@ index aa9d811f2e..8c7f2dae7a 100644
  }
  
  static int apply_rule(const char *rule) {
-@@ -56,7 +56,7 @@ static int apply_rule(const char *rule) {
+@@ -56,7 +56,7 @@ static int apply_rule(const char *rule)
  
          (void) delete_rule(rule);
  
@@ -182,11 +172,9 @@ index aa9d811f2e..8c7f2dae7a 100644
  
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
-diff --git a/src/core/main.c b/src/core/main.c
-index bcce7178a8..4199cedab9 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1285,7 +1285,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1303,7 +1303,7 @@ static int bump_unix_max_dgram_qlen(void
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -195,7 +183,7 @@ index bcce7178a8..4199cedab9 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1509,7 +1509,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1527,7 +1527,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -204,11 +192,9 @@ index bcce7178a8..4199cedab9 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index b95e6239d4..fdbdaaaccb 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -327,17 +327,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -230,8 +216,6 @@ index b95e6239d4..fdbdaaaccb 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 17e7cd1a00..87a7667716 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -243,11 +227,9 @@ index 17e7cd1a00..87a7667716 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index c4a7f2f3d3..bcac758284 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -256,11 +238,9 @@ index c4a7f2f3d3..bcac758284 100644
          if (r < 0) {
                  if (r == -ELOOP)
                          return -EINVAL;
-diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 30b9a66334..cc1d577933 100644
 --- a/src/login/logind-dbus.c
 +++ b/src/login/logind-dbus.c
-@@ -1325,7 +1325,7 @@ static int trigger_device(Manager *m, sd_device *d) {
+@@ -1323,7 +1323,7 @@ static int trigger_device(Manager *m, sd
                  if (!t)
                          return -ENOMEM;
  
@@ -269,11 +249,9 @@ index 30b9a66334..cc1d577933 100644
          }
  
          return 0;
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 0462b46413..7c53d41483 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -282,11 +260,9 @@ index 0462b46413..7c53d41483 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 2aec8041f0..841542f2f3 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2357,7 +2357,7 @@ static int reset_audit_loginuid(void) {
+@@ -2403,7 +2403,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -295,7 +271,7 @@ index 2aec8041f0..841542f2f3 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3566,13 +3566,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3612,13 +3612,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -311,11 +287,9 @@ index 2aec8041f0..841542f2f3 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
-index 93bdcf11bf..68cddb7a9f 100644
 --- a/src/shared/sysctl-util.c
 +++ b/src/shared/sysctl-util.c
-@@ -88,7 +88,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+@@ -88,7 +88,7 @@ int sysctl_write_ip_property(int af, con
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -324,11 +298,9 @@ index 93bdcf11bf..68cddb7a9f 100644
  }
  
  int sysctl_read(const char *property, char **content) {
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index b9fe96635d..f168d7f890 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -54,7 +54,7 @@ static int write_hibernate_location_info(void) {
+@@ -54,7 +54,7 @@ static int write_hibernate_location_info
  
          /* if it's a swap partition, we just write the disk to /sys/power/resume */
          if (streq(type, "partition")) {
@@ -337,7 +309,7 @@ index b9fe96635d..f168d7f890 100644
                  if (r < 0)
                          return log_debug_errno(r, "Failed to write partition device to /sys/power/resume: %m");
  
-@@ -98,14 +98,14 @@ static int write_hibernate_location_info(void) {
+@@ -98,14 +98,14 @@ static int write_hibernate_location_info
  
          offset = fiemap->fm_extents[0].fe_physical / page_size();
          xsprintf(offset_str, "%" PRIu64, offset);
@@ -363,7 +335,7 @@ index b9fe96635d..f168d7f890 100644
                  if (k >= 0)
                          return 0;
  
-@@ -140,7 +140,7 @@ static int write_state(FILE **f, char **states) {
+@@ -140,7 +140,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -372,24 +344,20 @@ index b9fe96635d..f168d7f890 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
-index 77d95e513f..25ce4abfb1 100644
 --- a/src/udev/udevadm-trigger.c
 +++ b/src/udev/udevadm-trigger.c
-@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
+@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerato
                  if (!filename)
                          return log_oom();
  
 -                r = write_string_file(filename, action, WRITE_STRING_FILE_DISABLE_BUFFER);
 +                r = write_string_file(filename, action, 0);
                  if (r < 0) {
-                         log_full_errno(r == -ENOENT ? LOG_DEBUG : LOG_ERR, r,
-                                        "Failed to write '%s' to '%s': %m", action, filename);
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index cb5123042a..ea309a9e7f 100644
+                         bool ignore = IN_SET(r, -ENOENT, -EACCES, -ENODEV, -EROFS);
+ 
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
-@@ -1113,7 +1113,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
+@@ -1113,7 +1113,7 @@ static int synthesize_change_one(sd_devi
  
          filename = strjoina(syspath, "/uevent");
          log_device_debug(dev, "device is closed, synthesising 'change' on %s", syspath);
@@ -398,11 +366,9 @@ index cb5123042a..ea309a9e7f 100644
          if (r < 0)
                  return log_device_debug_errno(dev, r, "Failed to write 'change' to %s: %m", filename);
          return 0;
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 75d052ae70..5a15c939d8 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -117,7 +117,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -117,7 +117,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
diff --git a/meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch b/meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch
deleted file mode 100644
index f359d2879b8a..000000000000
--- a/meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 4df8fe8415eaf4abd5b93c3447452547c6ea9e5f Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Thu, 14 Nov 2019 17:51:30 +0100
-Subject: [PATCH] seccomp: more comprehensive protection against libseccomp's
- __NR_xyz namespace invasion
-
-A follow-up for 59b657296a2fe104f112b91bbf9301724067cc81, adding the
-same conditioning for all cases of our __NR_xyz use.
-
-Fixes: #14031
-
-Reference:
-https://github.com/systemd/systemd/pull/14032/commits/62f66fdbcc33580467c01b1f149474b6c973df5a
-
-Upstream-Status: Backport
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- src/basic/missing_syscall.h | 10 +++++-----
- src/test/test-seccomp.c     | 19 ++++++++++---------
- 2 files changed, 15 insertions(+), 14 deletions(-)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 6d9b125..1255d8b 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -274,7 +274,7 @@ static inline int missing_renameat2(int oldfd, const char *oldname, int newfd, c
- 
- #if !HAVE_KCMP
- static inline int missing_kcmp(pid_t pid1, pid_t pid2, int type, unsigned long idx1, unsigned long idx2) {
--#  ifdef __NR_kcmp
-+#  if defined __NR_kcmp && __NR_kcmp > 0
-         return syscall(__NR_kcmp, pid1, pid2, type, idx1, idx2);
- #  else
-         errno = ENOSYS;
-@@ -289,7 +289,7 @@ static inline int missing_kcmp(pid_t pid1, pid_t pid2, int type, unsigned long i
- 
- #if !HAVE_KEYCTL
- static inline long missing_keyctl(int cmd, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned long arg5) {
--#  ifdef __NR_keyctl
-+#  if defined __NR_keyctl && __NR_keyctl > 0
-         return syscall(__NR_keyctl, cmd, arg2, arg3, arg4, arg5);
- #  else
-         errno = ENOSYS;
-@@ -300,7 +300,7 @@ static inline long missing_keyctl(int cmd, unsigned long arg2, unsigned long arg
- }
- 
- static inline key_serial_t missing_add_key(const char *type, const char *description, const void *payload, size_t plen, key_serial_t ringid) {
--#  ifdef __NR_add_key
-+#  if defined __NR_add_key && __NR_add_key > 0
-         return syscall(__NR_add_key, type, description, payload, plen, ringid);
- #  else
-         errno = ENOSYS;
-@@ -311,7 +311,7 @@ static inline key_serial_t missing_add_key(const char *type, const char *descrip
- }
- 
- static inline key_serial_t missing_request_key(const char *type, const char *description, const char * callout_info, key_serial_t destringid) {
--#  ifdef __NR_request_key
-+#  if defined __NR_request_key && __NR_request_key > 0
-         return syscall(__NR_request_key, type, description, callout_info, destringid);
- #  else
-         errno = ENOSYS;
-@@ -496,7 +496,7 @@ enum {
- static inline long missing_set_mempolicy(int mode, const unsigned long *nodemask,
-                            unsigned long maxnode) {
-         long i;
--#  ifdef __NR_set_mempolicy
-+#  if defined __NR_set_mempolicy && __NR_set_mempolicy > 0
-         i = syscall(__NR_set_mempolicy, mode, nodemask, maxnode);
- #  else
-         errno = ENOSYS;
-diff --git a/src/test/test-seccomp.c b/src/test/test-seccomp.c
-index 018c20f..c669204 100644
---- a/src/test/test-seccomp.c
-+++ b/src/test/test-seccomp.c
-@@ -28,7 +28,8 @@
- #include "tmpfile-util.h"
- #include "virt.h"
- 
--#if SCMP_SYS(socket) < 0 || defined(__i386__) || defined(__s390x__) || defined(__s390__)
-+/* __NR_socket may be invalid due to libseccomp */
-+#if !defined(__NR_socket) || __NR_socket <= 0 || defined(__i386__) || defined(__s390x__) || defined(__s390__)
- /* On these archs, socket() is implemented via the socketcall() syscall multiplexer,
-  * and we can't restrict it hence via seccomp. */
- #  define SECCOMP_RESTRICT_ADDRESS_FAMILIES_BROKEN 1
-@@ -304,14 +305,14 @@ static void test_protect_sysctl(void) {
-         assert_se(pid >= 0);
- 
-         if (pid == 0) {
--#if __NR__sysctl > 0
-+#if defined __NR__sysctl && __NR__sysctl > 0
-                 assert_se(syscall(__NR__sysctl, NULL) < 0);
-                 assert_se(errno == EFAULT);
- #endif
- 
-                 assert_se(seccomp_protect_sysctl() >= 0);
- 
--#if __NR__sysctl > 0
-+#if defined __NR__sysctl && __NR__sysctl > 0
-                 assert_se(syscall(__NR__sysctl, 0, 0, 0) < 0);
-                 assert_se(errno == EPERM);
- #endif
-@@ -640,7 +641,7 @@ static void test_load_syscall_filter_set_raw(void) {
-                 assert_se(poll(NULL, 0, 0) == 0);
- 
-                 assert_se(s = hashmap_new(NULL));
--#if SCMP_SYS(access) >= 0
-+#if defined __NR_access && __NR_access > 0
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_access + 1), INT_TO_PTR(-1)) >= 0);
- #else
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_faccessat + 1), INT_TO_PTR(-1)) >= 0);
-@@ -656,7 +657,7 @@ static void test_load_syscall_filter_set_raw(void) {
-                 s = hashmap_free(s);
- 
-                 assert_se(s = hashmap_new(NULL));
--#if SCMP_SYS(access) >= 0
-+#if defined __NR_access && __NR_access > 0
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_access + 1), INT_TO_PTR(EILSEQ)) >= 0);
- #else
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_faccessat + 1), INT_TO_PTR(EILSEQ)) >= 0);
-@@ -672,7 +673,7 @@ static void test_load_syscall_filter_set_raw(void) {
-                 s = hashmap_free(s);
- 
-                 assert_se(s = hashmap_new(NULL));
--#if SCMP_SYS(poll) >= 0
-+#if defined __NR_poll && __NR_poll > 0
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(-1)) >= 0);
- #else
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) >= 0);
-@@ -689,7 +690,7 @@ static void test_load_syscall_filter_set_raw(void) {
-                 s = hashmap_free(s);
- 
-                 assert_se(s = hashmap_new(NULL));
--#if SCMP_SYS(poll) >= 0
-+#if defined __NR_poll && __NR_poll > 0
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(EILSEQ)) >= 0);
- #else
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(EILSEQ)) >= 0);
-@@ -767,8 +768,8 @@ static int real_open(const char *path, int flags, mode_t mode) {
-          * testing purposes that calls the real syscall, on architectures where SYS_open is defined. On
-          * other architectures, let's just fall back to the glibc call. */
- 
--#ifdef SYS_open
--        return (int) syscall(SYS_open, path, flags, mode);
-+#if defined __NR_open && __NR_open > 0
-+        return (int) syscall(__NR_open, path, flags, mode);
- #else
-         return open(path, flags, mode);
- #endif
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch b/meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch
deleted file mode 100644
index ba20a0bb46ce..000000000000
--- a/meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d0122c077d2d8fd0fd29b463c501e7ddf9177ff3 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 24 Sep 2019 17:04:50 +0800
-Subject: [PATCH] unit-file.c: consider symlink on filesystems like NFS
-
-Some filesystems do not fully support readdir, according to the manual,
-so we should also consider DT_UNKNOWN to correctly handle symlinks.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/13637]
----
- src/shared/unit-file.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/shared/unit-file.c b/src/shared/unit-file.c
-index 4a5f23e6c1..8373103000 100644
---- a/src/shared/unit-file.c
-+++ b/src/shared/unit-file.c
-@@ -247,6 +247,7 @@ int unit_file_build_name_map(
-                         _cleanup_free_ char *_filename_free = NULL, *simplified = NULL;
-                         const char *suffix, *dst = NULL;
-                         bool valid_unit_name;
-+                        struct stat sb;
- 
-                         valid_unit_name = unit_name_is_valid(de->d_name, UNIT_NAME_ANY);
- 
-@@ -279,7 +280,10 @@ int unit_file_build_name_map(
-                         if (hashmap_contains(ids, de->d_name))
-                                 continue;
- 
--                        if (de->d_type == DT_LNK) {
-+                        if (de->d_type == DT_LNK ||
-+                            (de->d_type == DT_UNKNOWN &&
-+                             lstat(filename, &sb) == 0 &&
-+                             (sb.st_mode & S_IFMT) == S_IFLNK)) {
-                                 /* We don't explicitly check for alias loops here. unit_ids_map_get() which
-                                  * limits the number of hops should be used to access the map. */
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
deleted file mode 100644
index f9c5996ffb22..000000000000
--- a/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dc0a6a9fe4da9738efaba942233ad39da625a918 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 21 Feb 2019 16:28:21 +0800
-Subject: [PATCH 4/5] rules: whitelist hd* devices
-
-qemu by default emulates IDE and the linux-yocto kernel(s) use
-CONFIG_IDE instead of the more modern libsata, so disks appear as
-/dev/hd*. Patch rejected upstream because CONFIG_IDE is deprecated.
-
-Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[rebased for systemd 241]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- rules/60-persistent-storage.rules | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index 7802b1c94f..c0534ae26a 100644
---- a/rules/60-persistent-storage.rules
-+++ b/rules/60-persistent-storage.rules
-@@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
- ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1", GOTO="persistent_storage_end"
- 
- SUBSYSTEM!="block", GOTO="persistent_storage_end"
--KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*", GOTO="persistent_storage_end"
-+KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*|hd*", GOTO="persistent_storage_end"
- 
- # ignore partitions that span the entire disk
- TEST=="whole_disk", GOTO="persistent_storage_end"
diff --git a/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
deleted file mode 100644
index 96175b5b5ebc..000000000000
--- a/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d1bccc721dd8f43fee29c5df0e9b78345e69f4b6 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 21 Feb 2019 16:38:38 +0800
-Subject: [PATCH 5/5] rules: watch metadata changes in ide devices
-
-Formatting IDE storage does not trigger "change" uevents. As a result
-clients using udev API don't get any updates afterwards and get outdated
-information about the device.
-...
-root@qemux86-64:~# mkfs.ext4 -F /dev/hda1
-Creating filesystem with 262144 4k blocks and 65536 inodes
-Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
-
-root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
-ls: cannot access '/dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2': No such file or directory
-...
-Include hd* in a match for watch option assignment.
-
-Upstream-Status: Denied
-
-qemu by default emulates IDE and the linux-yocto kernel(s) use
-CONFIG_IDE instead of the more modern libsata, so disks appear as
-/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
-is deprecated.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-[rebased for systemd 241]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- rules/60-block.rules | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rules/60-block.rules b/rules/60-block.rules
-index 3134ab995e..cd72a494a1 100644
---- a/rules/60-block.rules
-+++ b/rules/60-block.rules
-@@ -9,5 +9,5 @@ ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block",
- 
- # watch metadata changes, caused by tools closing the device node which was opened for writing
- ACTION!="remove", SUBSYSTEM=="block", \
--  KERNEL=="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*", \
-+  KERNEL=="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*|hd*", \
-   OPTIONS+="watch"
diff --git a/meta/recipes-core/systemd/systemd_243.2.bb b/meta/recipes-core/systemd/systemd_243.4.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_243.2.bb
rename to meta/recipes-core/systemd/systemd_243.4.bb
index e31fac8c5617..a0d10e03beb4 100644
--- a/meta/recipes-core/systemd/systemd_243.2.bb
+++ b/meta/recipes-core/systemd/systemd_243.4.bb
@@ -20,10 +20,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://0004-rules-whitelist-hd-devices.patch \
-           file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
-           file://0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch \
-           file://0001-seccomp-more-comprehensive-protection-against-libsec.patch \
            file://99-default.preset \
            "
 
-- 
2.17.1


