Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3896E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAWDGR016221 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:32:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XWDOmzRnqti7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:32:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAWBh8016208
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:32:12 +0100
Message-ID: <1472639531.29583.69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Aug 2016 11:32:11 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] lttng-tools: Update 2.7.1 -> 2.8.1
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
X-List-Received-Date: Wed, 31 Aug 2016 10:32:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop backported patch.
Update ust configure option.
Update location of xml m4 file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch b/meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
deleted file mode 100644
index bd4f7d1..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 1f54181c2df1fb92c3323a6dbf8273fb66b883b6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
- <jeremie.galarneau@efficios.com>
-Date: Sat, 17 Oct 2015 19:41:47 -0400
-Subject: [PATCH] Port: Don't use SIGUNUSED which is not defined on Solaris
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Backport [2.8.0]
-
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
----
- src/common/runas.c | 18 +++++-------------
- 1 file changed, 5 insertions(+), 13 deletions(-)
-
-diff --git a/src/common/runas.c b/src/common/runas.c
-index 57f7382..0825470 100644
---- a/src/common/runas.c
-+++ b/src/common/runas.c
-@@ -530,21 +530,13 @@ int run_as_rmdir_recursive(const char *path, uid_t uid, gid_t gid)
- static
- int reset_sighandler(void)
- {
--	int sig, ret = 0;
-+	int sig;
- 
--	for (sig = SIGHUP; sig <= SIGUNUSED; sig++) {
--		/* Skip unblockable signals. */
--		if (sig == SIGKILL || sig == SIGSTOP) {
--			continue;
--		}
--		if (signal(sig, SIG_DFL) == SIG_ERR) {
--			PERROR("reset signal %d", sig);
--			ret = -1;
--			goto end;
--		}
-+	DBG("Resetting run_as worker signal handlers to default");
-+	for (sig = 1; sig <= 31; sig++) {
-+		(void) signal(sig, SIG_DFL);
- 	}
--end:
--	return ret;
-+	return 0;
- }
- 
- static
--- 
-2.6.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index fe1e2a3..e2f3032 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -13,8 +13,8 @@ DEPENDS = "liburcu popt libxml2"
 RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
-SRCREV = "a90f2c1e10b759782653a81815625e9d1bbb75ca"
-PV = "2.7.1+git${SRCPV}"
+SRCREV = "d11e0dba0df9024b8613c51e167a379b91e8b20b"
+PV = "2.8.1+git${SRCPV}"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
@@ -22,12 +22,11 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
 "
 PACKAGECONFIG ??= "lttng-ust"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
-PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
+PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
-           file://stop-using-SIGUNUSED.patch \
+SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.8 \
            file://runtest-2.4.0.patch \
            file://run-ptest"
 
@@ -51,7 +50,7 @@ INSANE_SKIP_${PN}-dbg = "libexec"
 
 do_configure_prepend () {
 	# Delete a shipped m4 file that overrides our patched one
-	rm -f ${S}/config/libxml.m4
+	rm -f ${S}/m4/libxml.m4
 }
 
 do_install_ptest () {



