Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigxy-0001EP-7q
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663903"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:30:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:35 -0800
Message-Id: <59d7b1fc25a7930d1fb86afe20e6bdd938cb3fe5.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/28] insane.bbclass: add QA tests for unsafe references to exec_prefix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 06:38:22 -0000

From: Scott Garman <scott.a.garman@intel.com>

Files under exec_prefix (commonly /usr) may not be available during
system recovery. exec_prefix may also be kept on a separate partition
that is mounted late in the boot process.

This QA test throws an warning if a binary in base_[bindir|sbindir|libdir]
is dynamically linked to a file under exec_prefix. The intention is to
turn this into an error in the near future.

It also checks executable non-binaries (e.g, shell scripts) in the above
base directories with a simple grep test to look for references to
exec_prefix. This test only produces a warning, since false positives
are likely.

This fixes [YOCTO #1008]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/insane.bbclass |  111 ++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5726e69..b8d4507 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -11,6 +11,10 @@
 #  -Check if packages contains .debug directories or .so files
 #   where they should be in -dev or -dbg
 #  -Check if config.log contains traces to broken autoconf tests
+#  -Ensure that binaries in base_[bindir|sbindir|libdir] do not link
+#   into exec_prefix
+#  -Check that scripts in base_[bindir|sbindir|libdir] do not reference
+#   files under exec_prefix
 
 
 #
@@ -19,9 +23,14 @@
 # The package.bbclass can help us here.
 #
 inherit package
-PACKAGE_DEPENDS += "pax-utils-native desktop-file-utils-native"
+PACKAGE_DEPENDS += "pax-utils-native desktop-file-utils-native ${QADEPENDS}"
 PACKAGEFUNCS += " do_package_qa "
 
+# unsafe-references-in-binaries requires prelink-rtld from
+# prelink-native, but we don't want this DEPENDS for -native builds
+QADEPENDS = "prelink-native"
+QADEPENDS_virtclass-native = ""
+QADEPENDS_virtclass-nativesdk = ""
 
 #
 # dictionary for elf headers
@@ -100,7 +109,7 @@ def package_qa_get_machine_dict():
 
 
 # Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths"
+WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts"
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
 
 def package_qa_clean_path(path,d):
@@ -201,6 +210,104 @@ def package_qa_check_perm(path,name,d, elf, messages):
     """
     return
 
+QAPATHTEST[unsafe-references-in-binaries] = "package_qa_check_unsafe_references_in_binaries"
+def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages):
+	"""
+	Ensure binaries in base_[bindir|sbindir|libdir] do not link to files under exec_prefix
+	"""
+	if unsafe_references_skippable(path, name, d):
+		return
+
+	if elf:
+		import subprocess as sub
+		pn = d.getVar('PN', True)
+
+		exec_prefix = d.getVar('exec_prefix', True)
+		sysroot_path = d.getVar('STAGING_DIR_TARGET', True)
+		sysroot_path_usr = sysroot_path + exec_prefix
+
+		try:
+			ldd_output = sub.check_output(["prelink-rtld", "--root", sysroot_path, path])
+		except sub.CalledProcessError as e:
+			if e.returncode != 127:
+				error_msg = pn + ": prelink-rtld aborted when processing %s" % path
+				package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+				return False
+			else:
+				# Sometimes this is done deliberately (e.g, e2fsprogs), so only warn
+				bb.warn("%s has missing library dependencies" % path)
+				return
+		if sysroot_path_usr in ldd_output:
+			error_msg = pn + ": %s links to something under exec_prefix" % path
+			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+			error_msg = "ldd reports: %s" % ldd_output
+			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+			return False
+
+QAPATHTEST[unsafe-references-in-scripts] = "package_qa_check_unsafe_references_in_scripts"
+def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
+	"""
+	Warn if scripts in base_[bindir|sbindir|libdir] reference files under exec_prefix
+	"""
+	if unsafe_references_skippable(path, name, d):
+		return
+
+	if not elf:
+		import stat
+		pn = d.getVar('PN', True)
+
+		# Ensure we're checking an executable script
+		statinfo = os.stat(path)
+		if bool(statinfo.st_mode & stat.S_IXUSR):
+			# grep shell scripts for possible references to /exec_prefix/
+			exec_prefix = d.getVar('exec_prefix', True)
+			statement = "grep -e '%s/' %s > /dev/null" % (exec_prefix, path)
+			if os.system(statement) == 0:
+				error_msg = pn + ": Found a reference to %s/ in %s" % (exec_prefix, path)
+				package_qa_handle_error("unsafe-references-in-scripts", error_msg, d)
+				error_msg = "Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix"
+				package_qa_handle_error("unsafe-references-in-scripts", error_msg, d)
+
+def unsafe_references_skippable(path, name, d):
+	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d):
+		return True
+
+	if "-dbg" in name or "-dev" in name:
+		return True
+
+	# Other package names to skip:
+	if name.startswith("kernel-module-"):
+		return True
+
+	# Skip symlinks
+	if os.path.islink(path):
+		return True
+
+	# Skip unusual rootfs layouts which make these tests irrelevant
+	exec_prefix = d.getVar('exec_prefix', True)
+	if exec_prefix == "":
+		return True
+
+	pkgdest = d.getVar('PKGDEST', True)
+	pkgdest = pkgdest + "/" + name
+	pkgdest = os.path.abspath(pkgdest)
+	base_bindir = pkgdest + d.getVar('base_bindir', True)
+	base_sbindir = pkgdest + d.getVar('base_sbindir', True)
+	base_libdir = pkgdest + d.getVar('base_libdir', True)
+	bindir = pkgdest + d.getVar('bindir', True)
+	sbindir = pkgdest + d.getVar('sbindir', True)
+	libdir = pkgdest + d.getVar('libdir', True)
+
+	if base_bindir == bindir and base_sbindir == sbindir and base_libdir == libdir:
+		return True
+
+	# Skip files not in base_[bindir|sbindir|libdir]
+	path = os.path.abspath(path)
+	if not (base_bindir in path or base_sbindir in path or base_libdir in path):
+		return True
+
+	return False
+
 QAPATHTEST[arch] = "package_qa_check_arch"
 def package_qa_check_arch(path,name,d, elf, messages):
     """
-- 
1.7.6.4



