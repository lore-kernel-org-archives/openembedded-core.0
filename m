Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QziCl-0002aQ-8o
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 06:51:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2011 21:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="44911307"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2011 21:45:41 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Sep 2011 23:45:27 -0500
Message-ID: <1315025127.31478.141.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 1/2] systemtap: upgrade to 1.6
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
X-List-Received-Date: Sat, 03 Sep 2011 04:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Also enable for arm, since systemtap now works on arm and remove the
gcc-4.6 compile fix patch since the problems it addresses have been
fixed upstream.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../fix_for_compilation_with_gcc-4.6.0.patch       |  119 --------------------
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   15 +--
 2 files changed, 7 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch b/meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch
deleted file mode 100644
index a322175..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-Upstream-Status: Pending
-
-Fix following compiler errors with gcc 4.6.0:
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/09
-
-| tapsets.cxx: In member function 'void sdt_query::handle_probe_entry()':
-| tapsets.cxx:5295:8: error: variable 'kprobe_found' set but not used [-Werror=unused-but-set-variable]
-| tapsets.cxx: In member function 'virtual void hwbkpt_builder::build(systemtap_session&, probe*, probe_point*, const literal_map_t&, std::vector<derived_probe*>&)':
-| tapsets.cxx:7655:18: error: variable 'has_symbol_str' set but not used [-Werror=unused-but-set-variable]
-| cc1plus: all warnings being treated as errors
-| 
-| make[2]: *** [stap-tapsets.o] Error 1
-| translate.cxx: In member function 'virtual void c_unparser::visit_print_format(print_format*)':
-| translate.cxx:4431:6: error: variable 'width_ix' set but not used [-Werror=unused-but-set-variable]
-| cc1plus: all warnings being treated as errors
-| 
-| make[2]: *** [stap-translate.o] Error 1
-| common.c: In function 'fatal_handler':
-| common.c:397:13: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| make[3]: *** [common.o] Error 1
-| make[3]: *** Waiting for unfinished jobs....
-| common.c: In function 'fatal_handler':
-| common.c:397:13: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| mainloop.c: In function 'chld_proc':
-| mainloop.c:56:11: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
-| mainloop.c: In function 'stp_main_loop':
-| mainloop.c:623:17: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-
-Index: git/tapsets.cxx
-===================================================================
---- git.orig/tapsets.cxx
-+++ git/tapsets.cxx
-@@ -5292,7 +5292,6 @@ sdt_query::handle_probe_entry()
-   probe *new_base = convert_location();
-   probe_point *new_location = new_base->locations[0];
- 
--  bool kprobe_found = false;
-   bool need_debug_info = false;
- 
-   Dwarf_Addr bias;
-@@ -5302,7 +5301,6 @@ sdt_query::handle_probe_entry()
-   if (have_kprobe())
-     {
-       convert_probe(new_base);
--      kprobe_found = true;
-       // Expand the local variables in the probe body
-       sdt_kprobe_var_expanding_visitor svv (module_val,
- 					    provider_name,
-@@ -7652,7 +7650,7 @@ hwbkpt_builder::build(systemtap_session 
- {
-   string symbol_str_val;
-   int64_t hwbkpt_address, len;
--  bool has_addr, has_symbol_str, has_write, has_rw, has_len;
-+  bool has_addr, has_write, has_rw, has_len;
- 
-   if (! (sess.kernel_config["CONFIG_PERF_EVENTS"] == string("y")))
-       throw semantic_error ("CONFIG_PERF_EVENTS not available on this kernel",
-@@ -7662,7 +7660,6 @@ hwbkpt_builder::build(systemtap_session 
-                             location->components[0]->tok);
- 
-   has_addr = get_param (parameters, TOK_HWBKPT, hwbkpt_address);
--  has_symbol_str = get_param (parameters, TOK_HWBKPT, symbol_str_val);
-   has_len = get_param (parameters, TOK_LENGTH, len);
-   has_write = (parameters.find(TOK_HWBKPT_WRITE) != parameters.end());
-   has_rw = (parameters.find(TOK_HWBKPT_RW) != parameters.end());
-Index: git/translate.cxx
-===================================================================
---- git.orig/translate.cxx
-+++ git/translate.cxx
-@@ -4428,7 +4428,7 @@ c_unparser::visit_print_format (print_fo
- 	  continue;
- 
- 	/* Take note of the width and precision arguments, if any.  */
--	int width_ix = -1, prec_ix= -1;
-+	int __attribute((__unused__)) width_ix = -1, prec_ix= -1;
- 	if (components[i].widthtype == print_format::width_dynamic)
- 	  width_ix = arg_ix++;
- 	if (components[i].prectype == print_format::prec_dynamic)
-Index: git/runtime/staprun/common.c
-===================================================================
---- git.orig/runtime/staprun/common.c
-+++ git/runtime/staprun/common.c
-@@ -394,7 +394,7 @@ void parse_modpath(const char *inpath)
- #define ERR_MSG "\nUNEXPECTED FATAL ERROR in staprun. Please file a bug report.\n"
- static void fatal_handler (int signum)
- {
--        int rc;
-+        int __attribute__((__unused__)) rc;
-         char *str = strsignal(signum);
-         rc = write (STDERR_FILENO, ERR_MSG, sizeof(ERR_MSG));
-         rc = write (STDERR_FILENO, str, strlen(str));
-Index: git/runtime/staprun/mainloop.c
-===================================================================
---- git.orig/runtime/staprun/mainloop.c
-+++ git/runtime/staprun/mainloop.c
-@@ -53,7 +53,7 @@ static void *signal_thread(void *arg)
- 
- static void chld_proc(int signum)
- {
--  int32_t rc, btype = STP_EXIT;
-+  int32_t __attribute__((__unused__)) rc, btype = STP_EXIT;
-   dbug(2, "chld_proc %d (%s)\n", signum, strsignal(signum));
-   pid_t pid = waitpid(-1, NULL, WNOHANG);
-   if (pid != target_pid)
-@@ -620,7 +620,7 @@ int stp_main_loop(void)
-       {
-         /* module asks us to start exiting, so send STP_EXIT */
-         dbug(2, "got STP_REQUEST_EXIT\n");
--        int32_t rc, btype = STP_EXIT;
-+        int32_t __attribute__((__unused__))rc, btype = STP_EXIT;
-         rc = write(control_channel, &btype, sizeof(btype));
-         break;
-       }
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index e8aa54f..86936f4 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -1,15 +1,14 @@
 DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analysis tool for Linux"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "elfutils sqlite3"
 
-SRCREV = "4ab3a1863bf4f472acae7a809bf2b38d91658aa8"
-PR = "r4"
-PV = "1.4+git${SRCPV}"
+SRCREV = "820f2d22fc47fad6e09ba886efb9b91e1247cb39"
+PR = "r5"
+PV = "1.6+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
-	file://fix_for_compilation_with_gcc-4.6.0.patch \
           "
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
@@ -23,11 +22,11 @@ EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
 SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
 SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
 
-# systemtap doesn't work on arm and doesn't support mips
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*)-linux'
+# systemtap doesn't support mips
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools gettext
 
 FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"
-- 
1.7.0.4





