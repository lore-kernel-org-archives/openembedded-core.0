Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 181F361260
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:44:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so12468262wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=79FL4zeL2TBCEzVZQ3803thKsmeaR51WB3GXWTmAoFw=;
	b=p5f3MJzcB1V2y/nMo1XHZFnpB/O1yK5A9A05+he/zDkX5itCcUUb8CYStdoXjsMs7C
	d8TAHAmN8NcLx9LdQ0ESkFPFIc7Irqnczj48y54Z/HKqluH/cc7QIrH4PFuWccVZIPel
	RVt4hK++qnehcs+nm5/+VWY7yUZ4hdm3Hzq13kjxQqpXhyDWGtwBPQrk48RDSzs8voNH
	Z+B+wP70Qj8V4w8Q0phSd3I+pIq/29YJTtQfFqXBXEBQBOzZbOQ/XvkRmjU70GJ1ThWz
	aIuybDC1z0XqRJzUqJKGx9akmaP5ikTRDDT99s6Je0EY6QJPsOILihuqrACLQu42OLcm
	8y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=79FL4zeL2TBCEzVZQ3803thKsmeaR51WB3GXWTmAoFw=;
	b=Yz2qtsUMcT7ti2JXykFH98IJERFVpoDXCdCu2E0cuSDGmDZHsy+GB8XNZzuLQI3iQl
	dQw7MKj/xHlP6APYHnSK5vQqnBR9sXGaDjAaui877mKZo9AjrE99QvE00zj57Nf5zEK4
	8VsVRfmRb2qEF5YYAW74zomCXh6s0j/7DjBYyz/Mxey20Hr+KHnmJqhWUF5JmUB8AeeR
	+r8hzZurzHo2ShYqHFUmFYILM/rIkJA4Ae1D+TBhopRYgRswY6vV71SVTgYJYlMkTBnO
	39DoXw8nVfn/owc53QUy2IHviN2IWSKqlIiCkXUjLHgmvpOykozrc5epyBEmj55uuT3X
	Wgww==
X-Gm-Message-State: APjAAAULQQkQdsGiYLLWS0USJ54ocygfnLcpRkWx71SRQsLImA0F+m6p
	qoawpNVYNEobGy+ryErSyFWVI2aW
X-Google-Smtp-Source: APXvYqy2AGGmEGiAXleFA18DXS9IjDuKm36qJt5kEAkdBaOZYricOqSsE4OQnZj4JiWJFh28ZBK21g==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr10075900wma.5.1581759895712; 
	Sat, 15 Feb 2020 01:44:55 -0800 (PST)
Received: from localhost.localdomain ([46.68.8.24])
	by smtp.gmail.com with ESMTPSA id
	t187sm8573491wmt.25.2020.02.15.01.44.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 01:44:55 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 09:44:49 +0000
Message-Id: <20200215094450.19705-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215094450.19705-1-alex.kiernan@gmail.com>
References: <20200215094450.19705-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4 2/2] systemd: upgrade v244.1 -> v244.3
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
X-List-Received-Date: Sat, 15 Feb 2020 09:44:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop all systemd-boot patches and use MESON_CROSS_... configuration
instead to pick up EFI cc and objcopy. For EFI ld, we can use the
command line efi-ld option, but have to ensure it's something which can
be exec'd directly.

Commits from v244-stable:

  c4280c342bbf Revert "Support Plugable UD-PRO8 dock"
  bb598b56eb3c hibernate-resume-generator: wait "infinitely" for the resume device
  77c04ce5c270 hwdb: update to v245-rc1
  b4eb8848240c Fix typo in function name
  e2d4cb9843c5 polkit: when authorizing via PK let's re-resolve callback/userdata instead of caching it
  83bfc0d8dd02 sd-bus: introduce API for re-enqueuing incoming messages
  5926f9f1723f polkit: use structured initialization
  0697d0d972c8 polkit: on async pk requests, re-validate action/details
  2589995acdb2 polkit: reuse some common bus message appending code
  5b2442d5c3ec bus-polkit: rename return error parameter to ret_error
  0a19ff7004e4 shared: split out polkit stuff from bus-util.c → bus-polkit.c
  1325dfb5778d test: adapt to the new capsh format
  3538fafb4714 meson: update efi path detection to gnu-efi-3.0.11
  3034855a5b62 presets: "disable" all passive targets by default
  c2e304681929 shared/sysctl-util: normalize repeated slashes or dots to a single value
  6f4364046f90 dhcp6: do not use T1 and T2 longer than one provided by the lease
  0ed6cda28dff network: fix implicit type conversion warning by GCC-10
  f6a5c02d26b1 bootspec: parse random-seed-mode line in loader.conf
  ddc5dca8a73b sd-boot: fix typo
  2bbbe9ae41ab test: Synchronize journal before reading from it
  072485d661d7 sd-bus: fix introspection bug in signal parameter names
  80af3cf5e36b efi: fix build.
  d7ede1ade564 generator: order growfs for the root fs after systemd-remount-fs
  e9904998213d loginctl: use /org/freedesktop/login1/session/auto when "lock-session" is called without argument
  82dd4caf014c Documentation update for x-systemd.{before,after}
  a60459764d9d man: fix typo in systemd.netdev Xfrm example
  fc053e2dfb3f timesyncd: log louder when we refuse a server due to root distance
  af0e630693fa resolved: drop DNSSEC root key that is not valid anymore
  ae59f1666ca6 journal: don't use startswith() on something that is not a NUL-terminated string
  536ef6d72bc6 test: add test for https://github.com/systemd/systemd/issues/14560
  b78fe3c1b1a8 core: make sure StandardInput=file: doesn't get dup'ed to stdout/stderr by default
  a1561a08f2d5 pkgconf: add full generator paths
  e5f2d11489ec tree-wide: we forgot to destroy some bus errors
  ea67fd42067b mount: make checks on perpetual mount units more lax
  2f23c648bce4 core: never allow perpetual units to be masked
  9ba11dffb09a typo: "May modify to" -> "May modify"
  84c048799a78 Disable reading SystemdOptions EFI Var when in SecureBoot mode
  4c2d72b53091 sysctl: downgrade message when we have no permission
  c001a285a3a2 Clarify journald.conf MaxLevelStore documentation
  45d52c7615fd logind: refuse overriding idle hint on tty sessions
  b1a0be45b4ee cgroup: update only siblings that got realized once
  e6d694254fe1 mount: mark an existing "mounting" unit from /proc/self/mountinfo as "just_mounted"
  d8fd38769c36 journalctl: Correctly handle combination of --reverse and --lines (fixes #1596)
  cd19bd31d808 journalctl: Correctly handle --show-cursor in combination with --until or --since and --reverse
  1320aa92dc0a core: fix re-realization of cgroup siblings
  14164ec6bc77 core: propagate service state to socket in more load states
  c22bf6b31a45 man: describe "symlink" and "systemctl link" explicitly in UNIT FILE LOAD PATH
  26f3a534f1ab core: be more restrictive on the dependency types we allow to be created transiently
  377cc5d91ea5 udev: don't import parent ID_FS_ data on partitions
  7d5060d53994 man: fix option name
  98c03090274a Support Plugable UD-PRO8 dock
  e9687d09dccf gpt-auto: don't assume XBOOTLDR is vfat
  7057fe863007 man: fix documentation of IBM VIO device naming
  f8d1df1045be man: slightly extend documentation on difference between ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD
  1faf5dde4d4a boot: fix osrel parser
  65d247af1786 udev: do not use exact match of file permission
  6da978f89b48 network: lower the log-level of harmless message
  5d8a614f926c hwdb: ignore keys added in kernel 5.5
  8b1bd1746989 systemctl: skip non-existent units in the 'cat' verb
  b2f342f92b54 systemd.exec: document the file system for EnvironmentFile paths
  945f3a231f6f systemd-analyze: fixed typo in documentation
  2c8ae283b0ee test-condition: fix group check condition
  6b48479f4582 umount: show correct error message
  faba5b2ba8c9 Revert "Drop dbus activation stub service"
  3dd98f1998f9 man: add section about user manager units
  1c80a8ced006 man: add remote-*.targets to the bootup sequence
  9afd65f15e93 time-util: also use 32bit hack on EOVERFLOW
  561923291383 [man] note which UID ranges will get user journals
  588a23ef2684 [man] fix URL
  0130a03179f6 analyze: badness if neither of RootImage and RootDirectory exists
  93074c962e3a network: introduce AddPrefixRoute= and deprecate PrefixRoute=
  a8ad020ea0ba shared/dropin: fix assert for invalid drop-in
  946cdba156dd initrd: make udev cleanup service confict trigger and settle too
  c0a8a92e6027 man: we support growing xfs too these days
  608d88273494 time-util: deal with systems where userspace has 64bit time_t but kernel does not
  cfced59a4bd8 [import] fix stdin/stdout pipe behavior in import/export tar/raw
  73435b219553 systemctl: show what verbs support --dry-run in the help page
  dc56b94e1308 cryptsetup-generator: unconfuse writing of the device timeout
  0757ad565573 shared/install: log syntax error for invalid DefaultInstance=
  d2471109d999 shared/install: provide a nicer error message for invalid WantedBy=/Required= values

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v4:
- add missed commit to join EFI ldflags after stripping command

Changes in v3:
- use MESON_CROSS_... for systemd-boot

Changes in v2:
- fix SRC_URI now v244.3 tag exists on v244-stable

 ...md-boot_244.1.bb => systemd-boot_244.3.bb} | 19 ++---
 ...md-conf_244.1.bb => systemd-conf_244.3.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...c-and-efi_ld-correctly-when-cross-co.patch | 62 ---------------
 ...on-print-EFI-CC-configuration-nicely.patch | 33 --------
 ...meson-use-an-array-option-for-efi-cc.patch | 77 -------------------
 ...fi-objcopy-option-to-specify-objcopy.patch | 48 ------------
 .../{systemd_244.1.bb => systemd_244.3.bb}    |  0
 8 files changed, 7 insertions(+), 234 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_244.1.bb => systemd-boot_244.3.bb} (71%)
 rename meta/recipes-core/systemd/{systemd-conf_244.1.bb => systemd-conf_244.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch
 rename meta/recipes-core/systemd/{systemd_244.1.bb => systemd_244.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_244.1.bb b/meta/recipes-core/systemd/systemd-boot_244.3.bb
similarity index 71%
rename from meta/recipes-core/systemd/systemd-boot_244.1.bb
rename to meta/recipes-core/systemd/systemd-boot_244.3.bb
index 515abc289bef..a77f6fb73d23 100644
--- a/meta/recipes-core/systemd/systemd-boot_244.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot_244.3.bb
@@ -5,27 +5,20 @@ require conf/image-uefi.conf
 
 DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 
-# NOTE: These three patches are in theory not needed, but we haven't
-#       figured out how to correctly pass efi-cc parameter if it's an array.
-SRC_URI += "file://0001-Revert-meson-use-an-array-option-for-efi-cc.patch \
-            file://0001-Revert-meson-print-EFI-CC-configuration-nicely.patch \
-            file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
-            file://0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch \
-            "
-
 inherit meson pkgconfig gettext
 inherit deploy
 
-EFI_CC ?= "${CC}"
+EFI_LDFLAGS = "${@ " ".join(d.getVar('LD').split()[1:])} ${LDFLAGS}"
+MESON_CROSS_BINARIES_append = " efi_cc:CC objcopy:OBJCOPY"
+MESON_CROSS_PROPERTIES_remove = "c_link_args:LDFLAGS"
+MESON_CROSS_PROPERTIES_append = " c_link_args:EFI_LDFLAGS"
+
 EXTRA_OEMESON += "-Defi=true \
                   -Dgnu-efi=true \
                   -Defi-includedir=${STAGING_INCDIR}/efi \
-                  -Defi-ldsdir=${STAGING_LIBDIR} \
                   -Defi-libdir=${STAGING_LIBDIR} \
+                  -Defi-ld=${@ d.getVar('LD').split()[0]} \
                   -Dman=false \
-                  -Defi-cc='${EFI_CC}' \
-                  -Defi-ld='${LD}' \
-                  -Defi-objcopy='${OBJCOPY}' \
                   "
 
 # install to the image as boot*.efi if its the EFI_PROVIDER,
diff --git a/meta/recipes-core/systemd/systemd-conf_244.1.bb b/meta/recipes-core/systemd/systemd-conf_244.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_244.1.bb
rename to meta/recipes-core/systemd/systemd-conf_244.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8c05a96ecc4f..e73b397b5d64 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "639dc9f4bfd2c09535bee079ae9bc7006b520a66"
+SRCREV = "b7ed902b2394f94e7f1fbe6c3194b5cd9a9429e6"
 SRCBRANCH = "v244-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
deleted file mode 100644
index e2e19ba06810..000000000000
--- a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 27 Feb 2018 21:42:23 -0800
-Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when cross-compiling
-
-When cross-compiling, efi_cc and efi_ld may take the form of
-'xxx-gcc --sysroot=xxx', and this would cause run_command and
-the alike fail.
-
-Fix to split them to make commands run correctly.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/boot/efi/meson.build | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
-index 992a3ba4c..9f9ec4911 100644
---- a/src/boot/efi/meson.build
-+++ b/src/boot/efi/meson.build
-@@ -157,7 +157,7 @@ if have_gnu_efi
-                 o_file = custom_target(file + '.o',
-                                        input : file,
-                                        output : file + '.o',
--                                       command : [efi_cc, '-c', '@INPUT@', '-o', '@OUTPUT@']
-+                                       command : efi_cc.split() + ['-c', '@INPUT@', '-o', '@OUTPUT@']
-                                                  + compile_args,
-                                        depend_files : efi_headers)
-                 if (common_sources + systemd_boot_sources).contains(file)
-@@ -168,7 +168,17 @@ if have_gnu_efi
-                 endif
-         endforeach
- 
--        libgcc_file_name = run_command(efi_cc, '-print-libgcc-file-name').stdout().strip()
-+        find_libgcc_cmd_all = efi_cc + ' -print-libgcc-file-name'
-+        find_libgcc_cmd = find_libgcc_cmd_all.split()[0]
-+        find_libgcc_args = []
-+        cmd_args_all = find_libgcc_cmd_all.split()
-+        foreach arg : cmd_args_all
-+                if arg != find_libgcc_cmd
-+                        find_libgcc_args += arg
-+                endif
-+        endforeach
-+
-+        libgcc_file_name = run_command(find_libgcc_cmd, find_libgcc_args).stdout().strip()
-         systemd_boot_efi_name = 'systemd-boot@0@.efi'.format(EFI_MACHINE_TYPE_NAME)
-         stub_efi_name = 'linux@0@.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
-         no_undefined_symbols = find_program('no-undefined-symbols.sh')
-@@ -179,7 +189,7 @@ if have_gnu_efi
-                         tuple[0],
-                         input : tuple[2],
-                         output : tuple[0],
--                        command : [efi_ld, '-o', '@OUTPUT@'] +
-+                        command : efi_ld.split() + ['-o', '@OUTPUT@'] +
-                                   efi_ldflags + tuple[2] +
-                                   ['-lefi', '-lgnuefi', libgcc_file_name])
- 
--- 
-2.13.0
-
diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch b/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
deleted file mode 100644
index ed14e25bce66..000000000000
--- a/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0bf530aac152630500939db31f98d933158fdabd Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 26 Feb 2019 14:27:49 +0800
-Subject: [PATCH] Revert "meson: print EFI CC configuration nicely"
-
-This reverts commit c512dfb9ac948ddb1ced0dab07b9dac88b198293.
-
-This patch is here because we haven't figured out how to pass
-parameter to efi-cc if it's an array in systemd-boot recipe.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 70fb218..30df834 100644
---- a/meson.build
-+++ b/meson.build
-@@ -3138,7 +3138,7 @@ if conf.get('ENABLE_EFI') == 1
-         if have_gnu_efi
-                 status += [
-                         'EFI machine type:                  @0@'.format(EFI_MACHINE_TYPE_NAME),
--                        'EFI CC                             @0@'.format(' '.join(efi_cc)),
-+                        'EFI CC                             @0@'.format(efi_cc),
-                         'EFI lib directory:                 @0@'.format(efi_libdir),
-                         'EFI lds directory:                 @0@'.format(efi_ldsdir),
-                         'EFI include directory:             @0@'.format(efi_incdir)]
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch b/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
deleted file mode 100644
index 0d2ebf62bd1f..000000000000
--- a/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 0030dcbac1a9177ef7a28af209ac67149b899f5f Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 26 Feb 2019 14:17:25 +0800
-Subject: [PATCH] Revert "meson: use an array option for efi-cc"
-
-This reverts commit 595343fb4c99c2679d347ef7c19debfbfed6342e.
-
-This patch is here because we haven't figured out how to pass
-parameter to efi-cc if it's an array in systemd-boot recipe.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson_options.txt        |  2 +-
- src/boot/efi/meson.build | 11 ++++++-----
- 2 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index 044bb79..3d28bfd 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -292,7 +292,7 @@ option('dbus', type : 'combo', choices : ['auto', 'true', 'false'],
- 
- option('gnu-efi', type : 'combo', choices : ['auto', 'true', 'false'],
-        description : 'gnu-efi support for sd-boot')
--option('efi-cc', type : 'array',
-+option('efi-cc', type : 'string',
-        description : 'the compiler to use for EFI modules')
- option('efi-ld', type : 'string',
-        description : 'the linker to use for EFI modules')
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
-index 2140151..d8db3a1 100644
---- a/src/boot/efi/meson.build
-+++ b/src/boot/efi/meson.build
-@@ -34,8 +34,8 @@ stub_sources = '''
- 
- if conf.get('ENABLE_EFI') == 1 and get_option('gnu-efi') != 'false'
-         efi_cc = get_option('efi-cc')
--        if efi_cc.length() == 0
--                efi_cc = cc.cmd_array()
-+        if efi_cc == ''
-+                efi_cc = ' '.join(cc.cmd_array())
-         endif
-         efi_ld = get_option('efi-ld')
-         if efi_ld == ''
-@@ -57,7 +57,8 @@ if conf.get('ENABLE_EFI') == 1 and get_option('gnu-efi') != 'false'
- 
-         efi_libdir = get_option('efi-libdir')
-         if efi_libdir == ''
--                ret = run_command(efi_cc + ['-print-multi-os-directory'])
-+                cmd = 'cd /usr/lib/$(@0@ -print-multi-os-directory) && pwd'.format(efi_cc)
-+                ret = run_command('sh', '-c', cmd)
-                 if ret.returncode() == 0
-                         path = join_paths('/usr/lib', ret.stdout().strip())
-                         ret = run_command('realpath', '-e', path)
-@@ -152,7 +153,7 @@ if have_gnu_efi
-                 o_file = custom_target(file + '.o',
-                                        input : file,
-                                        output : file + '.o',
--                                       command : efi_cc + ['-c', '@INPUT@', '-o', '@OUTPUT@']
-+                                       command : [efi_cc, '-c', '@INPUT@', '-o', '@OUTPUT@']
-                                                  + compile_args,
-                                        depend_files : efi_headers)
-                 if (common_sources + systemd_boot_sources).contains(file)
-@@ -163,7 +164,7 @@ if have_gnu_efi
-                 endif
-         endforeach
- 
--        libgcc_file_name = run_command(efi_cc + ['-print-libgcc-file-name']).stdout().strip()
-+        libgcc_file_name = run_command(efi_cc, '-print-libgcc-file-name').stdout().strip()
-         systemd_boot_efi_name = 'systemd-boot@0@.efi'.format(EFI_MACHINE_TYPE_NAME)
-         stub_efi_name = 'linux@0@.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
-         no_undefined_symbols = find_program('no-undefined-symbols.sh')
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch b/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch
deleted file mode 100644
index 7d764b4115eb..000000000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3f37ad5e083dcad51c21c1050b2829b70d240b52 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Aug 2019 03:10:20 +0000
-Subject: [PATCH] meson: Add -Defi-objcopy option to specify objcopy
-
-This helps in cross compiling for x86 target on a aarch64 host e.g.
-Fixes
-TOPDIR/build/tmp/hosttools/objcopy:src/boot/efi/systemd_boot.so: Invalid bfd target
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson_options.txt        | 2 ++
- src/boot/efi/meson.build | 5 ++++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index d4ec37dda2..dc1c96e112 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -296,6 +296,8 @@ option('efi-cc', type : 'array',
-        description : 'the compiler to use for EFI modules')
- option('efi-ld', type : 'string',
-        description : 'the linker to use for EFI modules')
-+option('efi-objcopy', type : 'string',
-+       description : 'the objcopy to use for EFI')
- option('efi-libdir', type : 'string',
-        description : 'path to the EFI lib directory')
- option('efi-ldsdir', type : 'string',
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
-index 0ae3191635..5a7137bc84 100644
---- a/src/boot/efi/meson.build
-+++ b/src/boot/efi/meson.build
-@@ -88,7 +88,10 @@ if have_gnu_efi
-                 output : 'efi_config.h',
-                 configuration : efi_conf)
- 
--        objcopy = find_program('objcopy')
-+        objcopy = get_option('efi-objcopy')
-+        if objcopy == ''
-+                objcopy = find_program('objcopy', required: true)
-+        endif
- 
-         efi_ldsdir = get_option('efi-ldsdir')
-         arch_lds = 'elf_@0@_efi.lds'.format(gnu_efi_path_arch)
--- 
-2.17.1
-
diff --git a/meta/recipes-core/systemd/systemd_244.1.bb b/meta/recipes-core/systemd/systemd_244.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_244.1.bb
rename to meta/recipes-core/systemd/systemd_244.3.bb
-- 
2.17.1


