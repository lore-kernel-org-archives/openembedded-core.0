Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDA374A42
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=27607; q=dns/txt;
	s=iport; t=1522776236; x=1523985836;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=VvIJSLRo66PgeLoBvOd30KcrGUvN3Y39zKCRREm2XwM=;
	b=HLLeP1INkkfJnM56ndg4b2iqoHaE3qZ3/MNFGAwvsPl5MJSk6BKIU4az
	1NWARpvbpQh+LZo3isDOedjs4iIrIANu+GCdvkJ1BDBZwADAlg+EzQB8H
	ozygEu/u0mu/i34tXeGIUlUPP3Gltr4wbE+LlfE+6nnbsPmKQt0s19ZF1 Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AaAgBQuMNa/4cNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNCYW8omGOBdIEPixKHV4FmCxuEaAKEQiE3FQECAQEBAQEBAms?=
	=?us-ascii?q?ohSIBAwMaDVIQHAMBAhYZTwgZhQ2vHDOIRIIlh2GCE4NchF4OIVWFFQKHIoRQY?=
	=?us-ascii?q?YpoCIVSiF0CgS46gx+HLocmiDACERMBgSUyIoFSTSMVgn0JghcXEY4lHzCLeIJ?=
	=?us-ascii?q?FAQE?=
X-IronPort-AV: E=Sophos;i="5.48,402,1517875200"; d="scan'208";a="376142717"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 17:23:55 +0000
Received: from kamensky-w541.cisco.com ([10.82.174.186]) (authenticated bits=0)
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w33HNck3010603
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 3 Apr 2018 17:23:53 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 10:23:35 -0700
Message-Id: <1522776217-23250-4-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
References: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v2 3/5] systemtap: support --sysroot option in variety of situations in cross build
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
X-List-Received-Date: Tue, 03 Apr 2018 17:23:55 -0000

For details on issues fixed please look at commit message of individual
patches.

Upstream-Status: Backport [systemtap@sourceware.org]
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 ...001-Added-a-couple-of-small-sysroot-fixes.patch |  42 +++++++
 ...g-sysroot-path-to-module-name-in-case-of-.patch |  61 ++++++++++
 ...sure-sysroot-paths-don-t-end-with-a-slash.patch | 128 +++++++++++++++++++++
 ...root-when-looking-for-the-System.map-file.patch |  29 +++++
 ...e_relocate-needs-target-file-path-not-hos.patch |  39 +++++++
 ...ookup-with-sysroot-case-do-not-remove-sys.patch |  42 +++++++
 ...-short-release-r-option-handling-follow-u.patch |  40 +++++++
 ...sroot-fix-short-release-r-option-handling.patch |  53 +++++++++
 ...dle-symbolic-links-with-absolute-name-rel.patch | 117 +++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   9 ++
 10 files changed, 560 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch
new file mode 100644
index 0000000..c0ceb5a
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch
@@ -0,0 +1,42 @@
+From a714658727206d2a98a7194b7e6d29dbd3e27b8d Mon Sep 17 00:00:00 2001
+From: David Smith <dsmith@redhat.com>
+Date: Mon, 19 Mar 2018 16:50:05 -0500
+Subject: [PATCH] Added a couple of small sysroot fixes.
+
+* tapsets.cxx (dwarf_builder::build): Fix commit 4ffecddf5.
+  (path_remove_sysroot): Fix extra '/' present at start of paths.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ tapsets.cxx | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+Index: git/tapsets.cxx
+===================================================================
+--- git.orig/tapsets.cxx
++++ git/tapsets.cxx
+@@ -1395,7 +1395,8 @@ string path_remove_sysroot(const systemt
+   string retval = path;
+   if (!sess.sysroot.empty() &&
+       (pos = retval.find(sess.sysroot)) != string::npos)
+-    retval.replace(pos, sess.sysroot.length(), "/");
++    retval.replace(pos, sess.sysroot.length(),
++		   (sess.sysroot.back() == '/' ? "/": ""));
+   return retval;
+ }
+ 
+@@ -8412,8 +8413,11 @@ dwarf_builder::build(systemtap_session &
+ 
+       // PR13338: unquote glob results
+       module_name = unescape_glob_chars (module_name);
+-      user_path = find_executable (module_name, "", sess.sysenv); // canonicalize it
+-      if (!is_fully_resolved(user_path, sess.sysroot, sess.sysenv))
++      user_path = find_executable (module_name, sess.sysroot, sess.sysenv); // canonicalize it
++      // Note we don't need to pass the sysroot to
++      // is_fully_resolved(), since we just passed it to
++      // find_executable().
++      if (!is_fully_resolved(user_path, "", sess.sysenv))
+         throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
+                                 user_path.to_string().c_str()));
+ 
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch
new file mode 100644
index 0000000..89951a2
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch
@@ -0,0 +1,61 @@
+From 4ffecddf5433d65a6f01241990c9d516586b1c79 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Mon, 19 Mar 2018 08:53:51 -0500
+Subject: [PATCH] Delay adding sysroot path to module name in case of non
+ absolute executable
+
+Current stap code adds sysroot prematurely for probes that specify non
+absolute path name, i.e like "foo", so when find_executable called it
+receives full path as <sysroot>/foo and find_executable does not search
+PATH while applying sysroot.
+
+Fix delays adding sysroot till path inside of sysroot is searched first.
+
+Also fix missing sysroot addition in glob expansion case.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ tapsets.cxx | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+Index: git/tapsets.cxx
+===================================================================
+--- git.orig/tapsets.cxx
++++ git/tapsets.cxx
+@@ -746,7 +746,7 @@ base_query::base_query(dwflpp & dw, lite
+               pid_val = 0;
+               get_string_param(params, TOK_PROCESS, module_val);
+             }
+-          module_val = find_executable (module_val, "", sess.sysenv);
++          module_val = find_executable (module_val, sess.sysroot, sess.sysenv);
+           if (!is_fully_resolved(module_val, "", sess.sysenv))
+             throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
+                                     module_val.to_string().c_str()));
+@@ -8287,7 +8287,6 @@ dwarf_builder::build(systemtap_session &
+             }
+           else
+             {
+-              module_name = (string)sess.sysroot + (string)module_name;
+               filled_parameters[TOK_PROCESS] = new literal_string(module_name);
+             }
+         }
+@@ -8321,7 +8320,8 @@ dwarf_builder::build(systemtap_session &
+           assert (lit);
+ 
+           // Evaluate glob here, and call derive_probes recursively with each match.
+-          const auto& globs = glob_executable (module_name);
++          const auto& globs = glob_executable (sess.sysroot
++					       + string(module_name));
+           unsigned results_pre = finished_results.size();
+           for (auto it = globs.begin(); it != globs.end(); ++it)
+             {
+@@ -8413,7 +8413,7 @@ dwarf_builder::build(systemtap_session &
+       // PR13338: unquote glob results
+       module_name = unescape_glob_chars (module_name);
+       user_path = find_executable (module_name, "", sess.sysenv); // canonicalize it
+-      if (!is_fully_resolved(user_path, "", sess.sysenv))
++      if (!is_fully_resolved(user_path, sess.sysroot, sess.sysenv))
+         throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
+                                 user_path.to_string().c_str()));
+ 
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch
new file mode 100644
index 0000000..7cd9030
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch
@@ -0,0 +1,128 @@
+From 41efad04730be89889d1483719f9a6c9396dc250 Mon Sep 17 00:00:00 2001
+From: David Smith <dsmith@redhat.com>
+Date: Wed, 14 Mar 2018 17:05:25 -0500
+Subject: [PATCH] Make sure sysroot paths don't end with a slash.
+
+* session.cxx (parse_cmdline): Make sure a sysroot path does not end with
+  a '/', since we build paths like: sysroot + "/lib/modules". If the
+  sysroot path ends with a '/', we end up with paths like
+  '/SYSROOT//lib/modules'.
+  (setup_kernel_release): Take a string parameter, not a character pointer.
+* session.h: Update setup_kernel_release() prototype.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ session.cxx | 34 ++++++++++++++++++++++++++--------
+ session.h   |  2 +-
+ 2 files changed, 27 insertions(+), 9 deletions(-)
+
+Index: git/session.cxx
+===================================================================
+--- git.orig/session.cxx
++++ git/session.cxx
+@@ -722,6 +722,9 @@ systemtap_session::parse_cmdline (int ar
+   client_options_disallowed_for_unprivileged = "";
+   std::set<std::string> additional_unwindsym_modules;
+   struct rlimit our_rlimit;
++  bool sysroot_option_seen = false;
++  string kernel_release_value;
++
+   while (true)
+     {
+       char * num_endptr;
+@@ -887,7 +890,7 @@ systemtap_session::parse_cmdline (int ar
+ 	    // Note that '-' must come last in a regex bracket expression.
+             assert_regexp_match("-r parameter from client", optarg, "^[a-z0-9_.+-]+$");
+ 	  server_args.push_back (string ("-") + (char)grc + optarg);
+-          setup_kernel_release(optarg);
++	  kernel_release_value = optarg;
+           break;
+ 
+         case 'a':
+@@ -1473,7 +1476,7 @@ systemtap_session::parse_cmdline (int ar
+ 	  if (client_options) {
+ 	      cerr << _F("ERROR: %s invalid with %s", "--sysroot", "--client-options") << endl;
+ 	      return 1;
+-	  } else if (!sysroot.empty()) {
++	  } else if (sysroot_option_seen) {
+ 	      cerr << "ERROR: multiple --sysroot options not supported" << endl;
+ 	      return 1;
+ 	  } else {
+@@ -1487,11 +1490,17 @@ systemtap_session::parse_cmdline (int ar
+ 
+ 	      sysroot = string(spath);
+ 	      free (spath);
+-	      if (sysroot[sysroot.size() - 1] != '/')
+-		  sysroot.append("/");
+ 
+-	      break;
++	      // We do path creation like this:
++	      //   sysroot + "/lib/modules"
++	      // So, we don't want the sysroot path to end with a '/',
++	      // otherwise we'll end up with '/foo//lib/modules'.
++	      if (sysroot.back() == '/') {
++		  sysroot.pop_back();
++	      }
+ 	  }
++	  sysroot_option_seen = true;
++	  break;
+ 
+ 	case LONG_OPT_SYSENV:
+ 	  if (client_options) {
+@@ -1501,7 +1510,7 @@ systemtap_session::parse_cmdline (int ar
+ 	      string sysenv_str = optarg;
+ 	      string value;
+ 	      size_t pos;
+-	      if (sysroot.empty()) {
++	      if (! sysroot_option_seen) {
+ 		  cerr << "ERROR: --sysenv must follow --sysroot" << endl;
+ 		  return 1;
+ 	      }
+@@ -1646,6 +1655,15 @@ systemtap_session::parse_cmdline (int ar
+ 	}
+     }
+ 
++  if (! kernel_release_value.empty())
++  {
++      setup_kernel_release(kernel_release_value);
++  }
++  else if (! sysroot.empty())
++  {
++      kernel_build_tree = sysroot + "/lib/modules/" + kernel_release  + "/build";
++  }
++
+   return 0;
+ }
+ 
+@@ -2152,7 +2170,7 @@ void systemtap_session::insert_loaded_mo
+ }
+ 
+ void
+-systemtap_session::setup_kernel_release (const char* kstr) 
++systemtap_session::setup_kernel_release (const string& kstr) 
+ {
+   // Sometimes we may get dupes here... e.g. a server may have a full
+   // -r /path/to/kernel followed by a client's -r kernel.
+@@ -2183,7 +2201,7 @@ systemtap_session::setup_kernel_release
+   else
+     {
+       update_release_sysroot = true;
+-      kernel_release = string (kstr);
++      kernel_release = kstr;
+       if (!kernel_release.empty())
+         kernel_build_tree = "/lib/modules/" + kernel_release + "/build";
+ 
+Index: git/session.h
+===================================================================
+--- git.orig/session.h
++++ git/session.h
+@@ -144,7 +144,7 @@ public:
+ 
+   // NB: It is very important for all of the above (and below) fields
+   // to be cleared in the systemtap_session ctor (session.cxx).
+-  void setup_kernel_release (const char* kstr);
++  void setup_kernel_release (const std::string& kstr);
+   void insert_loaded_modules ();
+ 
+   // command line parsing
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch
new file mode 100644
index 0000000..b2820b3
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch
@@ -0,0 +1,29 @@
+From 436063d5e4738a9b03535d330a2242be5118e745 Mon Sep 17 00:00:00 2001
+From: David Smith <dsmith@redhat.com>
+Date: Thu, 8 Mar 2018 16:01:58 -0600
+Subject: [PATCH] Use sysroot when looking for the System.map file.
+
+Add sysroot to system_map_path + "/boot/System.map" case. Otherwise
+stap tries to look symbols on host system and it produce error like this:
+
+> Kernel symbol table /boot/System.map-4.9.78-yocto-standard unavailable, (No such file or directory)
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ session.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/session.cxx
+===================================================================
+--- git.orig/session.cxx
++++ git/session.cxx
+@@ -2013,7 +2013,7 @@ systemtap_session::parse_kernel_function
+ 	clog << _F("Kernel symbol table %s unavailable, (%s)",
+ 		   system_map_path.c_str(), strerror(errno)) << endl;
+ 
+-      system_map_path = "/boot/System.map-" + kernel_release;
++      system_map_path = sysroot + "/boot/System.map-" + kernel_release;
+       system_map.clear();
+       system_map.open(system_map_path.c_str(), ifstream::in);
+       if (! system_map.is_open())
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch b/meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch
new file mode 100644
index 0000000..98181a1
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch
@@ -0,0 +1,39 @@
+From 183c7a7a8167333c873525f7908913837b8dc3cb Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Tue, 20 Mar 2018 12:41:05 -0500
+Subject: [PATCH] _stp_umodule_relocate needs target file path, not host file
+ path
+
+Strip of sysroot from module name is required when _stp_umodule_relocate
+call is generated. Otherwise path won't match path on target and could
+will fail to calculated address within the file.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ loc2stap.cxx | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/loc2stap.cxx b/loc2stap.cxx
+index 4818ee0..e09954f 100644
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
+@@ -106,7 +107,9 @@ location_context::translate_address(Dwarf_Addr addr)
+           c = "/* pragma:vma */ "
+               "({ unsigned long addr = 0; "
+               "addr = _stp_umodule_relocate (\""
+-              + resolve_path(dw->module_name.c_str()) + "\", "
++              + path_remove_sysroot(dw->sess,
++				    resolve_path(dw->module_name.c_str()))
++	      + "\", "
+               + lex_cast_hex (addr)
+ 	      + ", current); addr; })";
+ 	}
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch b/meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch
new file mode 100644
index 0000000..160642d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch
@@ -0,0 +1,42 @@
+From b29e448e12040ed8f4d83743a14db0f138a7cc67 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Wed, 14 Mar 2018 16:54:08 -0500
+Subject: [PATCH] debuginfo lookup with sysroot case do not remove sysroot from
+ file_name
+
+If sysroot option is passed, and debug symbols reside in sysroot along
+with executable <foo> in <foo_dir>/.debug/<foo_file> directory,
+stap fails to find debuginfo because it strips out sysroot path
+from file_name so dwfl_standard_find_debuginfo ends up looking at
+host <foo_dir>/.debug/<foo_file> rather then checking
+<sysroot>/<foo_dir>/.debug/<foo_file>.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ setupdwfl.cxx | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/setupdwfl.cxx b/setupdwfl.cxx
+index 11e0bb2..2a87982 100644
+--- a/setupdwfl.cxx
++++ b/setupdwfl.cxx
+@@ -627,18 +627,6 @@ internal_find_debuginfo (Dwfl_Module *mod,
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
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch
new file mode 100644
index 0000000..6fe7d4d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch
@@ -0,0 +1,40 @@
+From 7e11f129ff370ce5f39812ce2ae6ce40818a347f Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Thu, 22 Mar 2018 16:02:02 -0500
+Subject: [PATCH] sysroot: fix short release -r option handling follow up
+
+In case of sysroot set and short release -r option it does not make sense
+to pass short release name into dwfl_linux_kernel_report_offline
+function. This function is not aware about sysroot and it won't look for
+kernel modules under sysroot directory.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ setupdwfl.cxx | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/setupdwfl.cxx b/setupdwfl.cxx
+index c419afa..0cf5810 100644
+--- a/setupdwfl.cxx
++++ b/setupdwfl.cxx
+@@ -367,7 +367,15 @@ setup_dwfl_kernel (unsigned *modules_found, systemtap_session &s)
+   // hard-code this magic here.
+   string lib_path = s.sysroot + "/lib/modules/" + s.kernel_release + "/build";
+   if (s.kernel_build_tree == lib_path)
+-    elfutils_kernel_path = s.kernel_release;
++    {
++      if (s.sysroot != "")
++        // If we have sysroot set does not make sense to pass
++        // short release to dwfl, it won't take a sysroot into
++        // account. Let's construct full path in such case.
++	elfutils_kernel_path = string(s.sysroot + "/lib/modules/" + s.kernel_release);
++      else
++	elfutils_kernel_path = s.kernel_release;
++    }
+   else
+     elfutils_kernel_path = s.kernel_build_tree;
+   offline_modules_found = 0;
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch
new file mode 100644
index 0000000..b31d627
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch
@@ -0,0 +1,53 @@
+From a9ce89bcd2d78728faef59bda60e75510972cd56 Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Wed, 14 Mar 2018 17:09:44 -0500
+Subject: [PATCH] sysroot: fix short release -r option handling
+
+* setupdwfl.cxx (debuginfo_path_insert_sysroot): Add a '/' to the end of
+  the sysroot for path_insert_sysroot().
+  (setup_dwfl_kernel): Simplify logic when finding the kernel path to send
+  to elfutils.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ setupdwfl.cxx | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/setupdwfl.cxx b/setupdwfl.cxx
+index 2a87982..f6c3157 100644
+--- a/setupdwfl.cxx
++++ b/setupdwfl.cxx
+@@ -339,6 +339,13 @@ static char * path_insert_sysroot(string sysroot, string path)
+ 
+ void debuginfo_path_insert_sysroot(string sysroot)
+ {
++  // FIXME: This is a short-term fix, until we expect sysroot paths to
++  // always end with a '/' (and never be empty).
++  //
++  // The path_insert_sysroot() function assumes that sysroot has a '/'
++  // on the end. Make sure that is true.
++  if (sysroot.back() != '/')
++    sysroot.push_back('/');
+   debuginfo_path = path_insert_sysroot(sysroot, debuginfo_path);
+   debuginfo_usr_path = path_insert_sysroot(sysroot, debuginfo_usr_path);
+ }
+@@ -358,13 +365,11 @@ setup_dwfl_kernel (unsigned *modules_found, systemtap_session &s)
+   // no way to set the dwfl_callback.debuginfo_path and always
+   // passs the plain kernel_release here.  So instead we have to
+   // hard-code this magic here.
+-   string lib_path = "/lib/modules/" + s.kernel_release + "/build";
+-   if (s.kernel_build_tree == string(s.sysroot + lib_path) ||
+-       (s.kernel_build_tree == lib_path
+-	&& s.sysroot == "/"))
+-      elfutils_kernel_path = s.kernel_release;
+-   else
+-      elfutils_kernel_path = s.kernel_build_tree;
++  string lib_path = s.sysroot + "/lib/modules/" + s.kernel_release + "/build";
++  if (s.kernel_build_tree == lib_path)
++    elfutils_kernel_path = s.kernel_release;
++  else
++    elfutils_kernel_path = s.kernel_build_tree;
+   offline_modules_found = 0;
+ 
+   // First try to report full path modules.
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
new file mode 100644
index 0000000..8a3d39a
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
@@ -0,0 +1,117 @@
+From 2041085d1a700201dc088991ca8136e7935bf42f Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Wed, 21 Mar 2018 11:35:26 -0500
+Subject: [PATCH] sysroot: handle symbolic links with absolute name relative to
+ sysroot
+
+In case of symbolic link found under sysroot point to absolute path,
+instead of trying to look for such absolute path in host system,
+apply sysroot prefix first.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ util.cxx | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 76 insertions(+)
+
+Index: git/util.cxx
+===================================================================
+--- git.orig/util.cxx
++++ git/util.cxx
+@@ -441,6 +441,64 @@ split_lines(const char *buf, size_t n)
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
+@@ -465,6 +523,14 @@ string find_executable(const string& nam
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
+@@ -493,6 +559,16 @@ string find_executable(const string& nam
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
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index af5b004..23db26e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -13,6 +13,15 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-buildrun-remove-quotes-around-I-include-line.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            file://0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch \
+           file://0001-Use-sysroot-when-looking-for-the-System.map-file.patch \
+           file://0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch \
+           file://0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch \
+           file://0001-sysroot-fix-short-release-r-option-handling.patch \
+           file://0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch \
+           file://0001-Added-a-couple-of-small-sysroot-fixes.patch \
+           file://0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch \
+           file://0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch \
+           file://0001-sysroot-fix-short-release-r-option-handling-follow-u.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.7.4


