Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC3C78AA5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=32755; q=dns/txt;
	s=iport; t=1520358653; x=1521568253;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=ms9bTzpzbx8USAl1yiYkc2uGvQ+vGVxCrU8fIdeH21o=;
	b=Cm0NetgKpLYl/keOnPK1fyVLq952A8ayx0/eEBTvQl2/gO4yJzGsO4eF
	zKt/kfVAvnRgJBMcojXWDxQYbf+eHfsfgrLxbxP7wlMJseKE3L/EjEXJz
	yMtcSv8nMpQeLSjheTgNYFNzeNr1M6dzFIlAKy7umSGkDHCaaxf53jnC8 E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BLAgCN1J5a/5xdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZnAom3GCAoEWjBiIHBSCAQobgWSDMQKDAyE1FwECAQEBAQE?=
	=?us-ascii?q?BAmsnhSMBBhoBDFIQHAMBAhYZTwgZhRurCDqEcoN0giaFMYIuhjSFEgoEdoUuB?=
	=?us-ascii?q?IgcB4VZdUaLMAmGVIorAoFlToNngx6FPpEpAhEZAYEuIAMzgVJNIxWCfQmCWoI?=
	=?us-ascii?q?GHzeJXCuCHgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.47,432,1515456000"; d="scan'208";a="364343556"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 17:50:51 +0000
Received: from kamensky-w541.cisco.com ([10.24.22.184]) (authenticated bits=0)
	by rcdn-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id w26HofYn007528
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 6 Mar 2018 17:50:50 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 09:50:38 -0800
Message-Id: <1520358641-7062-3-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
References: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [RFC PATCH 2/5] systemtap: support --sysroot option in variety of situations in cross build
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
X-List-Received-Date: Tue, 06 Mar 2018 17:50:51 -0000

For details on issues fixed please look at commit message of individual
patches.

Upstream-Status: Submitted [systemtap@sourceware.org]

Change-Id: Id2fd0fbddb33e4a4387b732005a6e902a5c6129c
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 ...-short-release-r-option-handling-in-case-.patch |  61 ++++++++
 ...-short-release-r-option-handling-in-case-.patch |  68 +++++++++
 ...uginfo-lookup-with-sysroot-case-do-not-re.patch |  97 +++++++++++++
 ...ay-adding-sysroot-path-to-module-name-in-.patch | 124 ++++++++++++++++
 ...dle-symbolic-links-with-absolute-name-rel.patch | 159 +++++++++++++++++++++
 ...p_umodule_relocate-needs-receive-target-f.patch |  58 ++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   6 +
 7 files changed, 573 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-in-case-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0002-sysroot-fix-short-release-r-option-handling-in-case-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0003-sysroot-debuginfo-lookup-with-sysroot-case-do-not-re.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0004-sysroot-delay-adding-sysroot-path-to-module-name-in-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0005-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0006-sysroot-_stp_umodule_relocate-needs-receive-target-f.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-in-case-.patch b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-in-case-.patch
new file mode 100644
index 0000000..607c2cd
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-in-case-.patch
@@ -0,0 +1,61 @@
+From 8fccac2483354a8a3e2419c36c867c81045dbe7f Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Thu, 8 Feb 2018 20:00:46 -0800
+Subject: [PATCH 1/6] sysroot: fix short release -r option handling in case of
+ sysroot read System.map symbols
+
+Add sysroot to system_map_path + "/boot/System.map" case. Otherwise
+stap tries to look symbols on host system and it produce error like this:
+
+> Kernel symbol table /boot/System.map-4.9.78-yocto-standard unavailable, (No such file or directory)
+
+Here are steps to reproduce the issue. Note <sysroot> is produced by yocto
+poky build. Under <sysroot>/lib/modules/4.9.78-yocto-standard/build there
+is no System.map file; instead it is installed under <sysroot>/boot directory.
+
+[kamensky@coreos-lnx2 tests]$ cat meminfo.stp
+probe kernel.function("meminfo_proc_show") {
+        println("meminfo_proc_show called")
+}
+[kamensky@coreos-lnx2 tests]$ export SYSTEMTAP_DEBUGINFO_PATH=+:.debug:build
+[kamensky@coreos-lnx2 tests]$ /home/wd8/systemtap/20180208_2/packages/bin/stap --sysroot=/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs -a x86_64 -r 4.9.78-yocto-standard -B CROSS_COMPILE=x86_64-poky-linux- --sysenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin --sysenv=LD_LIBRARY_PATH=/lib:/usr/lib -p4 -v -v -m meminfo meminfo.stp
+Systemtap translator/driver (version 3.3/0.170, commit release-3.2-92-g26c5e3c03c94 + changes)
+Copyright (C) 2005-2017 Red Hat, Inc. and others
+This is free software; see the source for copying conditions.
+tested kernel versions: 2.6.18 ... 4.14-rc4
+enabled features: BPF PYTHON2 PYTHON3 LIBXML2 NLS
+Created temporary directory "/tmp/staprq4IGE"
+Session arch: x86_64 release: 4.9.78-yocto-standard
+Kernel symbol table /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs//lib/modules/4.9.78-yocto-standard/build/System.map unavailable, (No such file or directory)
+Kernel symbol table /boot/System.map-4.9.78-yocto-standard unavailable, (No such file or directory)
+WARNING: Kernel function symbol table missing [man warning::symbols]
+<snip>
+semantic error: while resolving probe point: identifier 'kernel' at meminfo.stp:1:7
+   thrown from: ../systemtap/elaborate.cxx:1080
+        source: probe kernel.function("meminfo_proc_show") {
+                      ^
+
+semantic error: missing x86_64 kernel/module debuginfo [man warning::debuginfo] under '/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs//lib/modules/4.9.78-yocto-standard/build'
+   thrown from: ../systemtap/dwflpp.cxx:340
+
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ session.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/session.cxx b/session.cxx
+index c7eaf6f..37caf3f 100644
+--- a/session.cxx
++++ b/session.cxx
+@@ -2038,7 +2038,7 @@ systemtap_session::parse_kernel_functions ()
+ 	clog << _F("Kernel symbol table %s unavailable, (%s)",
+ 		   system_map_path.c_str(), strerror(errno)) << endl;
+ 
+-      system_map_path = "/boot/System.map-" + kernel_release;
++      system_map_path = sysroot + "/boot/System.map-" + kernel_release;
+       system_map.clear();
+       system_map.open(system_map_path.c_str(), ifstream::in);
+       if (! system_map.is_open())
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0002-sysroot-fix-short-release-r-option-handling-in-case-.patch b/meta/recipes-kernel/systemtap/systemtap/0002-sysroot-fix-short-release-r-option-handling-in-case-.patch
new file mode 100644
index 0000000..5a71b14
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0002-sysroot-fix-short-release-r-option-handling-in-case-.patch
@@ -0,0 +1,68 @@
+From 0edd8b2c5d122c8b8c1b6a44b16bd05ce36f1616 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Thu, 8 Feb 2018 20:13:40 -0800
+Subject: [PATCH 2/6] sysroot: fix short release -r option handling in case of
+ sysroot pass proper kernel modules
+
+In case of -r option getting short release (opposite to full path of
+kernel build tree) stap passes short release name to
+dwfl_linux_kernel_report_offline function and this function tries to
+look up symbols in the host file system ignoring sysroot setting.
+
+Fix: in case of non empty, non "/" sysroot construct full path to
+kernel modules directory and store it into elfutils_kernel_path variable.
+
+Here are steps how to reproduce the issue. Note <sysroot> is produced by
+yocto poky build.
+
+[kamensky@coreos-lnx2 tests]$ cat meminfo.stp
+probe kernel.function("meminfo_proc_show") {
+        println("meminfo_proc_show called")
+}
+[kamensky@coreos-lnx2 tests]$ /home/wd8/systemtap/20180208_2/packages/bin/stap --sysroot=/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs -a x86_64 -r 4.9.78-yocto-standard -B CROSS_COMPILE=x86_64-poky-linux- --sysenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin --sysenv=LD_LIBRARY_PATH=/lib:/usr/lib -p4 -v -m meminfo meminfo.stp
+Pass 1: parsed user script and 480 library scripts using 230196virt/93452res/5364shr/88624data kb, in 340usr/30sys/375real ms.
+semantic error: while resolving probe point: identifier 'kernel' at meminfo.stp:1:7
+        source: probe kernel.function("meminfo_proc_show") {
+                      ^
+
+Running command under strace shows that stap is trying to open linux symbol file
+on host file system, instead of looking at sysroot location:
+
+19517 openat(AT_FDCWD, "/boot/vmlinux-4.9.78-yocto-standard.debug", O_RDONLY) = -1 ENOENT (No such file or directory)
+19517 openat(AT_FDCWD, "/boot/vmlinux-4.9.78-yocto-standard", O_RDONLY) = -1 ENOENT (No such file or directory)
+
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ setupdwfl.cxx | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/setupdwfl.cxx b/setupdwfl.cxx
+index 11e0bb2..f00cf75 100644
+--- a/setupdwfl.cxx
++++ b/setupdwfl.cxx
+@@ -359,9 +359,19 @@ setup_dwfl_kernel (unsigned *modules_found, systemtap_session &s)
+   // passs the plain kernel_release here.  So instead we have to
+   // hard-code this magic here.
+    string lib_path = "/lib/modules/" + s.kernel_release + "/build";
+-   if (s.kernel_build_tree == string(s.sysroot + lib_path) ||
+-       (s.kernel_build_tree == lib_path
+-	&& s.sysroot == "/"))
++   if (s.kernel_build_tree == string(s.sysroot + lib_path))
++     {
++       // If we have sysroot set does not make sense to pass
++       // short release to dwfl, it won't take a sysroot into
++       // account. Let's construct full path in such case.
++       if (s.sysroot != "" && s.sysroot != "/")
++	 elfutils_kernel_path = string(s.sysroot + "/lib/modules/" + s.kernel_release);
++       else
++	 elfutils_kernel_path = s.kernel_release;
++     }
++   else
++     if (s.kernel_build_tree == lib_path
++	 && s.sysroot == "/")
+       elfutils_kernel_path = s.kernel_release;
+    else
+       elfutils_kernel_path = s.kernel_build_tree;
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0003-sysroot-debuginfo-lookup-with-sysroot-case-do-not-re.patch b/meta/recipes-kernel/systemtap/systemtap/0003-sysroot-debuginfo-lookup-with-sysroot-case-do-not-re.patch
new file mode 100644
index 0000000..a3f23fb
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0003-sysroot-debuginfo-lookup-with-sysroot-case-do-not-re.patch
@@ -0,0 +1,97 @@
+From 6a873f2bd03c76b18b7d6ad2187b00d6a3e2a8d0 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Thu, 8 Feb 2018 20:09:19 -0800
+Subject: [PATCH 3/6] sysroot: debuginfo lookup with sysroot case do not remove
+ sysroot from file_name
+
+If sysroot option is passed, and debug symbols reside in sysroot along
+with executable <foo> in <foo_dir>/.debug/<foo_file> directory, stap
+fails to find debuginfo because it strips out sysroot path from file_name
+so dwfl_standard_find_debuginfo ends up looking at host
+<foo_dir>/.debug/<foo_file> rather then checking
+<sysroot>/<foo_dir>/.debug/<foo_file>.
+
+Note in cross compile environment, it is good idea to set and export
+proper SYSTEMTAP_DEBUGINFO_PATH variable because usual built defaults that
+work for native distros very often not applicable to cross sysroot
+based environment. For example for yocto poky/OE build the following
+setting seems proper "+:.debug:build".
+
+Here are steps how to reproduce the issue. Note <sysroot> is produced by
+yocto poky build.
+
+[kamensky@coreos-lnx2 tests]$ ls /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir.coreutils
+/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir.coreutils
+[kamensky@coreos-lnx2 tests]$ ls /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/.debug/mkdir.coreutils
+/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/.debug/mkdir.coreutils
+[kamensky@coreos-lnx2 tests]$ /home/wd8/systemtap/20180208_2/packages/bin/stap --sysroot=/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs -a x86_64 -r 4.9.78-yocto-standard -B CROSS_COMPILE=x86_64-poky-linux- --sysenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin --sysenv=LD_LIBRARY_PATH=/lib:/usr/lib -v -l 'process("/bin/mkdir.coreutils").function("*")'
+Pass 1: parsed user script and 480 library scripts using 230184virt/93416res/5344shr/88612data kb, in 350usr/30sys/378real ms.
+process("/bin/mkdir.coreutils").function("_fini")
+process("/bin/mkdir.coreutils").function("_init")
+process("/bin/mkdir.coreutils").function("fts_children")
+process("/bin/mkdir.coreutils").function("fts_close")
+process("/bin/mkdir.coreutils").function("fts_open")
+process("/bin/mkdir.coreutils").function("fts_read")
+process("/bin/mkdir.coreutils").function("fts_set")
+Pass 2: analyzed script: 7 probes, 0 functions, 0 embeds, 0 globals using 233484virt/97928res/6212shr/91912data kb, in 20usr/0sys/26real ms.
+
+running above example under strace shows that stap tries to access
+/bin/.debug/mkdir.coreutils on host, rather then sysroot
+
+13064 openat(AT_FDCWD, "/bin/mkdir.coreutils", O_RDONLY) = -1 ENOENT (No such file or directory)
+13064 openat(AT_FDCWD, "/bin/.debug/mkdir.coreutils", O_RDONLY) = -1 ENOENT (No such file or directory)
+13064 openat(AT_FDCWD, "/bin/mkdir.coreutils", O_RDONLY) = -1 ENOENT (No such file or directory)
+13064 openat(AT_FDCWD, "/bin/build/mkdir.coreutils", O_RDONLY) = -1 ENOENT (No such file or directory)
+13064 openat(AT_FDCWD, "/bin/mkdir.coreutils", O_RDONLY) = -1 ENOENT (No such file or directory)
+
+After fix applied stap is able to find /bin/.debug/mkdir.coreutils under
+sysroot:
+
+[kamensky@coreos-lnx2 tests]$ /home/wd8/systemtap/20180208_2/packages/bin/stap --sysroot=/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs -a x86_64 -r 4.9.78-yocto-standard -B CROSS_COMPILE=x86_64-poky-linux- --sysenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin --sysenv=LD_LIBRARY_PATH=/lib:/usr/lib -v -l 'process("/bin/mkdir.coreutils").function("*")' | wc
+Pass 1: parsed user script and 480 library scripts using 230184virt/93440res/5368shr/88612data kb, in 330usr/40sys/371real ms.
+Pass 2: analyzed script: 401 probes, 0 functions, 0 embeds, 0 globals using 235092virt/99484res/6256shr/93520data kb, in 30usr/0sys/35real ms.
+    249     249   29671
+
+Also verified on target that script like example below, once compiled
+against sysroot on host and copied back on target can trace 'mkdir'
+invocation functions:
+
+[kamensky@coreos-lnx2 tests]$ cat mkdir1.stp
+probe process("/bin/mkdir.coreutils").function("*").call {
+  printf ("%s -> %s\n", thread_indent(1), ppfunc())
+}
+probe process("/bin/mkdir.coreutils").function("*").return {
+  printf ("%s <- %s\n", thread_indent(-1), ppfunc())
+}
+
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ setupdwfl.cxx | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/setupdwfl.cxx b/setupdwfl.cxx
+index f00cf75..e5bfa28 100644
+--- a/setupdwfl.cxx
++++ b/setupdwfl.cxx
+@@ -637,18 +637,6 @@ internal_find_debuginfo (Dwfl_Module *mod,
+ 
+   call_dwfl_standard_find_debuginfo:
+ 
+-  if (current_session_for_find_debuginfo)
+-    {
+-      string sysroot = current_session_for_find_debuginfo->sysroot + "/*";
+-      int    found   = fnmatch(sysroot.c_str(), file_name, 0);
+-
+-      if (found)
+-	{
+-	  file_name = file_name
+-	    + current_session_for_find_debuginfo->sysroot.length() - 1;
+-	}
+-    }
+-
+   /* Call the original dwfl_standard_find_debuginfo */
+   return dwfl_standard_find_debuginfo(mod, userdata, modname, base,
+               file_name, debuglink_file,
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0004-sysroot-delay-adding-sysroot-path-to-module-name-in-.patch b/meta/recipes-kernel/systemtap/systemtap/0004-sysroot-delay-adding-sysroot-path-to-module-name-in-.patch
new file mode 100644
index 0000000..629d5a5
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0004-sysroot-delay-adding-sysroot-path-to-module-name-in-.patch
@@ -0,0 +1,124 @@
+From 03b84b2ca963ec4c4c0a2949063f3f2d0c19a4e9 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Thu, 8 Feb 2018 20:05:39 -0800
+Subject: [PATCH 4/6] sysroot: delay adding sysroot path to module name in case
+ of non absolute executable
+
+Current stap code adds sysroot prematurely for probes that specify
+non absolute path name, i.e like "foo", so when find_executable called
+it receives full path as <sysroot>/foo and find_executable does not
+search PATH while applying sysroot.
+
+Fix delays adding sysroot till path inside of sysroot is searched first.
+
+Also fix missing sysroot addition in glob expansion case.
+
+Note in case of sysroot cross compile environment it is highly recommended
+to pass --sysenv=PATH=xxx:yyy and --sysenv=LD_LIBRARY_PATH=zzz to use
+search path appropriate for target system, rather then host setting on
+system where stap runs.
+
+Here are steps how to reproduce the issue. Note <sysroot> is produced by
+yocto poky build.
+
+[kamensky@coreos-lnx2 tests]$ cat mkdir2.stp
+probe process("mkdir.coreutils").function("*").call {
+  printf ("%s -> %s\n", thread_indent(1), ppfunc())
+}
+probe process("mkdir.coreutils").function("*").return {
+  printf ("%s <- %s\n", thread_indent(-1), ppfunc())
+}
+[kamensky@coreos-lnx2 tests]$ ls /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir.coreutils
+/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir.coreutils
+[kamensky@coreos-lnx2 tests]$ ls /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/.debug/mkdir.coreutils
+/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/.debug/mkdir.coreutils
+[kamensky@coreos-lnx2 tests]$ /home/wd8/systemtap/20180208_2/packages/bin/stap --sysroot=/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs -a x86_64 -r 4.9.78-yocto-standard -B CROSS_COMPILE=x86_64-poky-linux- --sysenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin --sysenv=LD_LIBRARY_PATH=/lib:/usr/lib -v -p4 -m mkdir2 mkdir2.stp
+Pass 1: parsed user script and 480 library scripts using 230196virt/93536res/5448shr/88624data kb, in 330usr/30sys/364real ms.
+semantic error: resolution failed in DWARF builder
+
+semantic error: while resolving probe point: identifier 'process' at mkdir2.stp:1:7
+        source: probe process("mkdir.coreutils").function("*").call {
+                      ^
+
+semantic error: no match
+
+semantic error: resolution failed in DWARF builder
+
+semantic error: while resolving probe point: identifier 'process' at :4:7
+        source: probe process("mkdir.coreutils").function("*").return {
+                      ^
+
+semantic error: no match
+
+Pass 2: analyzed script: 0 probes, 0 functions, 0 embeds, 0 globals using 233496virt/97032res/5520shr/91924data kb, in 20usr/0sys/25real ms.
+Pass 2: analysis failed.  [man error::pass2]
+
+Under strace it shows that stap is not trying to lookup mkdir.coreutils
+inside of sysroot accoring to PATH that was passed through --sysenv:
+
+16048 openat(AT_FDCWD, "/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/mkdir.coreutils", O_RDONLY) = -1 ENOENT (No such file or directory)
+
+i.e it rather just tries <sysroot> + "mkdir.coreutils"
+
+After the fix veried that that above example able to find mkdir.coreutils
+executable in sysroot and corresponding symbols
+
+Also verified that glob matching in sysroot works too for example for
+this test case:
+
+[kamensky@coreos-lnx2 tests]$ cat mkdir3.stp
+probe process("/bin/mkdi*").function("*").call {
+  printf ("%s -> %s\n", thread_indent(1), ppfunc())
+}
+probe process("/bin/mkdi*").function("*").return {
+  printf ("%s <- %s\n", thread_indent(-1), ppfunc())
+}
+
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ tapsets.cxx | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tapsets.cxx b/tapsets.cxx
+index 28296b1..c664df0 100644
+--- a/tapsets.cxx
++++ b/tapsets.cxx
+@@ -746,7 +746,7 @@ base_query::base_query(dwflpp & dw, literal_map_t const & params):
+               pid_val = 0;
+               get_string_param(params, TOK_PROCESS, module_val);
+             }
+-          module_val = find_executable (module_val, "", sess.sysenv);
++          module_val = find_executable (module_val, sess.sysroot, sess.sysenv);
+           if (!is_fully_resolved(module_val, "", sess.sysenv))
+             throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
+                                     module_val.to_string().c_str()));
+@@ -8293,7 +8293,6 @@ dwarf_builder::build(systemtap_session & sess,
+             }
+           else
+             {
+-              module_name = (string)sess.sysroot + (string)module_name;
+               filled_parameters[TOK_PROCESS] = new literal_string(module_name);
+             }
+         }
+@@ -8327,7 +8326,7 @@ dwarf_builder::build(systemtap_session & sess,
+           assert (lit);
+ 
+           // Evaluate glob here, and call derive_probes recursively with each match.
+-          const auto& globs = glob_executable (module_name);
++          const auto& globs = glob_executable (sess.sysroot + string(module_name));
+           unsigned results_pre = finished_results.size();
+           for (auto it = globs.begin(); it != globs.end(); ++it)
+             {
+@@ -8418,7 +8417,8 @@ dwarf_builder::build(systemtap_session & sess,
+ 
+       // PR13338: unquote glob results
+       module_name = unescape_glob_chars (module_name);
+-      user_path = find_executable (module_name, "", sess.sysenv); // canonicalize it
++      user_path = find_executable (module_name, sess.sysroot,
++				   sess.sysenv); // canonicalize it
+       if (!is_fully_resolved(user_path, "", sess.sysenv))
+         throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
+                                 user_path.to_string().c_str()));
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0005-sysroot-handle-symbolic-links-with-absolute-name-rel.patch b/meta/recipes-kernel/systemtap/systemtap/0005-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
new file mode 100644
index 0000000..bd2b731
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0005-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
@@ -0,0 +1,159 @@
+From b9edb57fb3e8e1cb1b8a9d20350bfc7cb3b1a4a7 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Thu, 8 Feb 2018 20:27:55 -0800
+Subject: [PATCH 5/6] sysroot: handle symbolic links with absolute name
+ relative to sysroot
+
+In case of symbolic link found under sysroot point to absolute path,
+instead of trying to look for such absolute path in host system,
+apply sysroot prefix first.
+
+Here are steps how to reproduce the issue. Note <sysroot> is produced by
+yocto poky build.
+
+kamensky@coreos-lnx2 tests]$ ls -l /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir
+lrwxrwxrwx. 1 kamensky kamensky 20 Jan 30 18:29 /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir -> /bin/mkdir.coreutils
+[kamensky@coreos-lnx2 tests]$ ls -l /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir.coreutils
+-rwxr-xr-x. 1 kamensky kamensky 88232 Jan 29 09:58 /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/mkdir.coreutils
+[kamensky@coreos-lnx2 tests]$ ls -l /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/.debug/mkdir.coreutils
+-rwxr-xr-x. 1 kamensky kamensky 383456 Jan 29 09:58 /home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/bin/.debug/mkdir.coreutils
+[kamensky@coreos-lnx2 tests]$ cat mkdir4.stp
+probe process("/bin/mkdir").function("*").call {
+  printf ("%s -> %s\n", thread_indent(1), ppfunc())
+}
+probe process("/bin/mkdir").function("*").return {
+  printf ("%s <- %s\n", thread_indent(-1), ppfunc())
+}
+[kamensky@coreos-lnx2 tests]$ /home/wd8/systemtap/20180208_2/packages/bin/stap --sysroot=/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs -a x86_64 -r 4.9.78-yocto-standard -B CROSS_COMPILE=x86_64-poky-linux- --sysenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin --sysenv=LD_LIBRARY_PATH=/lib:/usr/lib -v -p4 -m mkdir4 mkdir4.stp
+Pass 1: parsed user script and 480 library scripts using 230196virt/93484res/5396shr/88624data kb, in 340usr/30sys/370real ms.
+semantic error: resolution failed in DWARF builder
+
+semantic error: while resolving probe point: identifier 'process' at mkdir4.stp:1:7
+        source: probe process("/bin/mkdir").function("*").call {
+                      ^
+
+semantic error: no match
+
+semantic error: resolution failed in DWARF builder
+
+semantic error: while resolving probe point: identifier 'process' at :4:7
+        source: probe process("/bin/mkdir").function("*").return {
+                      ^
+
+semantic error: no match
+
+Pass 2: analyzed script: 0 probes, 0 functions, 0 embeds, 0 globals using 233496virt/96980res/5468shr/91924data kb, in 20usr/0sys/25real ms.
+Pass 2: analysis failed.  [man error::pass2]
+
+After the fix above sript works fine verified that it traces mkdir
+functions on target.
+
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ util.cxx | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 76 insertions(+)
+
+diff --git a/util.cxx b/util.cxx
+index dd87b38..237cb0f 100644
+--- a/util.cxx
++++ b/util.cxx
+@@ -443,6 +443,64 @@ split_lines(const char *buf, size_t n)
+   return lines;
+ }
+ 
++static string
++follow_link(const string& name, const string& sysroot)
++{
++  char *linkname;
++  ssize_t r;
++  string retpath;
++  struct stat st;
++
++  const char *f = name.c_str();
++
++  lstat(f, &st);
++
++  linkname = (char *) malloc(st.st_size + 1);
++
++  if (linkname)
++    {
++      r = readlink(f, linkname, st.st_size + 1);
++      linkname[st.st_size] = '\0';
++      /*
++       * If we have non-empty sysroot and we got link that
++       * points to absolute path name, we need to look at
++       * this path relative to sysroot itself. access and
++       * stat will follow symbolic links correctly only in
++       * case with empty sysroot.
++       */
++      while (r != -1 && linkname && linkname[0] == '/')
++	{
++	  string fname1 = sysroot + linkname;
++	  const char *f1 = fname1.c_str();
++	  if (access(f1, X_OK) == 0
++	      && stat(f1, &st) == 0
++	      && S_ISREG(st.st_mode))
++	    {
++	      retpath = fname1;
++	      break;
++	    }
++	  else if (lstat(f1, &st) == 0
++		   && S_ISLNK(st.st_mode))
++	    {
++	      free(linkname);
++	      linkname = (char *) malloc(st.st_size + 1);
++	      if (linkname)
++		{
++		  r = readlink(f1, linkname, st.st_size + 1);
++		  linkname[st.st_size] = '\0';
++		}
++	    }
++	  else
++	    {
++	      break;
++	    }
++	}
++    }
++  free(linkname);
++
++  return retpath;
++}
++
+ // Resolve an executable name to a canonical full path name, with the
+ // same policy as execvp().  A program name not containing a slash
+ // will be searched along the $PATH.
+@@ -467,6 +525,14 @@ string find_executable(const string& name, const string& sysroot,
+   if (name.find('/') != string::npos) // slash in the path already?
+     {
+       retpath = sysroot + name;
++
++      const char *f = retpath.c_str();
++      if (sysroot != ""
++	  && lstat(f, &st) == 0
++	  && S_ISLNK(st.st_mode))
++	{
++	  retpath = follow_link(f, sysroot);
++	}
+     }
+   else // Nope, search $PATH.
+     {
+@@ -495,6 +561,16 @@ string find_executable(const string& name, const string& sysroot,
+                   retpath = fname;
+                   break;
+                 }
++              else if (sysroot != ""
++                       && lstat(f, &st) == 0
++                       && S_ISLNK(st.st_mode))
++		{
++		  retpath = follow_link(f, sysroot);
++		  if (retpath != "")
++		    {
++		      break;
++		    }
++		}
+             }
+         }
+     }
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0006-sysroot-_stp_umodule_relocate-needs-receive-target-f.patch b/meta/recipes-kernel/systemtap/systemtap/0006-sysroot-_stp_umodule_relocate-needs-receive-target-f.patch
new file mode 100644
index 0000000..f2e5c71
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0006-sysroot-_stp_umodule_relocate-needs-receive-target-f.patch
@@ -0,0 +1,58 @@
+From 8d6e3b078167e892501242b6cd47ee6726d31170 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Tue, 20 Feb 2018 08:38:27 -0800
+Subject: [PATCH 6/6] sysroot: _stp_umodule_relocate needs receive target file
+ path
+
+Strip of sysroot from module name is required when
+_stp_umodule_relocate call is generated. Otherwise path won't
+match path on target and could will fail to calculated address
+within the file. Note in another place in tapsets.cxx where
+_stp_umodule_relocate is emitted path_remove_sysroot is already
+applied.
+
+Here are steps how to reproduce the issue. Note <sysroot> is produced by
+yocto poky build.
+
+[kamensky@coreos-lnx2 tests]$ cat od.stp
+probe process("/usr/bin/od.coreutils").function("main").call {
+  printf ("%s: flag_dump_strings=0x%x\n", ppfunc(), $flag_dump_strings)
+}
+[kamensky@coreos-lnx2 tests]$ /home/wd8/systemtap/20180208_2/packages/bin/stap --sysroot=/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs -a x86_64 -r 4.9.78-yocto-standard -B CROSS_COMPILE=x86_64-poky-linux- --sysenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin --sysenv=LD_LIBRARY_PATH=/lib:/usr/lib -p4 -k -m od od.stp
+od.ko
+Keeping temporary directory "/tmp/stapdnaaGF"
+[kamensky@coreos-lnx2 tests]$ grep _stp_umodule_relocate /tmp/stapdnaaGF/od_src.c
+  l->__retvalue = uderef(1, ((((int64_t) (/* pragma:vma */ ({ unsigned long addr = 0; addr = _stp_umodule_relocate ("/home/wd8/yocto/20180128/build_x86_64/tmp/work/intel_corei7_64-poky-linux/kdevel-console-devel-image/1.0-r0/rootfs/usr/bin/od.coreutils", 0x212212, current); addr; }))))));
+
+Note above _stp_umodule_relocate call was emitted with file path
+on the host, it will fail once executed on target.
+
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ loc2stap.cxx | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/loc2stap.cxx b/loc2stap.cxx
+index 4818ee0..e2339a4 100644
+--- a/loc2stap.cxx
++++ b/loc2stap.cxx
+@@ -17,6 +17,7 @@
+ 
+ #include "loc2stap.h"
+ #include "dwflpp.h"
++#include "tapsets.h"
+ 
+ #if ! _ELFUTILS_PREREQ(0, 153)
+ #define DW_OP_GNU_entry_value 0xf3
+@@ -106,7 +107,7 @@ location_context::translate_address(Dwarf_Addr addr)
+           c = "/* pragma:vma */ "
+               "({ unsigned long addr = 0; "
+               "addr = _stp_umodule_relocate (\""
+-              + resolve_path(dw->module_name.c_str()) + "\", "
++              + path_remove_sysroot(dw->sess, resolve_path(dw->module_name.c_str())) + "\", "
+               + lex_cast_hex (addr)
+ 	      + ", current); addr; })";
+ 	}
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index af5b004..f774bbc 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -13,6 +13,12 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-buildrun-remove-quotes-around-I-include-line.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            file://0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch \
+           file://0001-sysroot-fix-short-release-r-option-handling-in-case-.patch \
+           file://0002-sysroot-fix-short-release-r-option-handling-in-case-.patch \
+           file://0003-sysroot-debuginfo-lookup-with-sysroot-case-do-not-re.patch \
+           file://0004-sysroot-delay-adding-sysroot-path-to-module-name-in-.patch \
+           file://0005-sysroot-handle-symbolic-links-with-absolute-name-rel.patch \
+           file://0006-sysroot-_stp_umodule_relocate-needs-receive-target-f.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.7.4


