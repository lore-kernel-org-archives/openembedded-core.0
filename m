Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBE3160962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:04:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5HH4iZf013137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:04:44 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 10:04:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2015 12:04:40 -0500
Message-ID: <1434560682-89221-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
References: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] rpm: Fix lua 'print' statement capture
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
X-List-Received-Date: Wed, 17 Jun 2015 17:04:45 -0000
Content-Type: text/plain

The print statement should capture the output and send it to the script
processing engine, and not display it directly to the screen.

Note, this is only a bug if 'lua' support has been enabled in the RPM
recipe's PACKAGECONFIG.

This patch is from: http://rpm5.org/cvs/patchset?cn=17671

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-lua-fix-print.patch                | 104 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch b/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
new file mode 100644
index 0000000..7ab49e9
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
@@ -0,0 +1,104 @@
+Lua 'print' statement is not working properly inside of RPM 5
+
+The print statement should capture the output and send it to the script
+processing engine, and not display it directly to the screen.
+
+This patch is from: http://rpm5.org/cvs/patchset?cn=17671
+
+Upstream-Status: backport (patchset 17671 from rpm5.org)
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.14/CHANGES
+===================================================================
+--- rpm-5.4.14.orig/CHANGES
++++ rpm-5.4.14/CHANGES
+@@ -1,3 +1,4 @@
++    - jbj: lua: fix: resurrect output capture with lua-5.2.
+     - jbj: verify: fix: broken logic for %ghost avoidance (Mark Hatle).
+ 
+ 5.4.13 -> 5.4.14:
+Index: rpm-5.4.14/rpmio/rpmlua.c
+===================================================================
+--- rpm-5.4.14.orig/rpmio/rpmlua.c
++++ rpm-5.4.14/rpmio/rpmlua.c
+@@ -175,7 +175,7 @@ rpmlua rpmluaNew(void)
+     };
+     /*@=readonlytrans =nullassign @*/
+     /*@observer@*/ /*@unchecked@*/
+-    const luaL_Reg *lib = lualibs;
++    const luaL_Reg *lib;
+     char *path_buf;
+     char *path_next;
+     char *path;
+@@ -190,31 +190,34 @@ rpmlua rpmluaNew(void)
+ 
+     luaL_openlibs(L);
+ 
+-    for (; lib->name; lib++) {
++    for (lib = lualibs; lib->name; lib++) {
+ 	luaL_requiref(L, lib->name, lib->func, 1);
++	lua_pop(L, 1);
+     }
+ 
+     {	const char * _lua_path = rpmGetPath(rpmluaPath, NULL);
+  	if (_lua_path != NULL) {
++#if defined(LUA_GLOBALSINDEX)
+ 	    lua_pushliteral(L, "LUA_PATH");
+ 	    lua_pushstring(L, _lua_path);
++	    lua_rawset(L, LUA_GLOBALSINDEX);
++#else
++	    lua_pushstring(L, _lua_path);
++	    lua_setglobal(L, "LUA_PATH");
++#endif
+ 	    _lua_path = _free(_lua_path);
+ 	}
+     }
+ 
+ #if defined(LUA_GLOBALSINDEX)
+-    lua_rawset(L, LUA_GLOBALSINDEX);
+-#else
+-    lua_pushglobaltable(L);
+-#endif
+     lua_pushliteral(L, "print");
+     lua_pushcfunction(L, rpm_print);
+-
+-#if defined(LUA_GLOBALSINDEX)
+     lua_rawset(L, LUA_GLOBALSINDEX);
+ #else
+-    lua_pushglobaltable(L);
++    lua_pushcfunction(L, rpm_print);
++    lua_setglobal(L, "print");
+ #endif
++
+     rpmluaSetData(lua, "lua", lua);
+ 
+     /* load all standard RPM Lua script files */
+@@ -351,6 +354,9 @@ void rpmluaSetVar(rpmlua _lua, rpmluav v
+ #if defined(LUA_GLOBALSINDEX)
+ 	if (lua->pushsize == 0)
+ 	    lua_pushvalue(L, LUA_GLOBALSINDEX);
++#else
++	if (lua->pushsize == 0)
++	    lua_pushglobaltable(L);
+ #endif
+ 	if (pushvar(L, var->keyType, &var->key) != -1) {
+ 	    if (pushvar(L, var->valueType, &var->value) != -1)
+@@ -1039,14 +1045,15 @@ static int rpm_print (lua_State *L)
+     lua_getglobal(L, "tostring");
+     for (i = 1; i <= n; i++) {
+ 	const char *s;
++	size_t l;
+ 	lua_pushvalue(L, -1);  /* function to be called */
+ 	lua_pushvalue(L, i);   /* value to print */
+ 	lua_call(L, 1, 1);
+-	s = lua_tostring(L, -1);  /* get result */
++	s = lua_tolstring(L, -1, &l);  /* get result */
+ 	if (s == NULL)
+ 	    return luaL_error(L, "`tostring' must return a string to `print'");
+ 	if (lua->storeprint) {
+-	    size_t sl = lua_rawlen(L, -1);
++	    size_t sl = l;
+ 	    if ((size_t)(lua->printbufused+sl+1) > lua->printbufsize) {
+ 		lua->printbufsize += sl+512;
+ 		lua->printbuf = (char *) xrealloc(lua->printbuf, lua->printbufsize);
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 75b1ae2..eac3b8f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -92,6 +92,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-realpath.patch \
 	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
 	   file://no-ldflags-in-pkgconfig.patch \
+	   file://rpm-lua-fix-print.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.9.3


