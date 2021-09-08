Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.15609.1631124093548499179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XOGWi2r6;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id m9so4578133wrb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysG+zi8jlXiEwL3yXGZKr9pXIO7XvkTP8ibIvBEmidU=;
        b=XOGWi2r6m+eE/jSgdW7yOZx3/BvujB6mP0kg4PX+x6fuisxCJAW0wnodopbdeZ5CM3
         GRr/Szhqo+WtWzkzlI7d7rrBypoBdvjH+BmgeZkE4RBQMJcZKD3UFPlu/oC4JzYgBmbx
         n1nXTQu6iwCdNDlNPUspbIqRzN8WYKJ464sP8R+nNMt7pOfQ7XiGKnYbZctHTHpwl94Q
         zIgHAUONpwrgu+GfJwNudsP3f0oGu+SNAcQe4cFVt3KrkrWeeZsqp7hlwB9kwYSBgpYB
         SO+hQ7G0SfXHwABtQyxmORgtoi4g6zsZx2GUdhu+uR4F0XzE1pBVcMOhaOxiCsmf9G4z
         Rb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysG+zi8jlXiEwL3yXGZKr9pXIO7XvkTP8ibIvBEmidU=;
        b=CJ+5LBvwOrKLPnuEFQaLuhSlgUewtVi49Azc1FBEyIUGg8cZfmNLE021LnxfgUEmuU
         9YArnKf1TldIYZxGgQD6bSsKCiOOm8J02Qo180AhCsGuG2IYH/Xe1aolzIe2nakqdT4z
         dfPJHE/BVpFB3QgckdxU6JUv8XQ0Ghn+ZNL2mUqdN323aot+B5hmyMXrL2Lr/wRWYfKU
         y2cnPhH9nwgyMk6kwGey3ciWtft/2m97N90/KqPK7gSuvqU/1s7x8E+uzB1H+99KQ1sG
         vc0CrTe1vWuKmU+lUyc5zDSG5d/BzdOdncwzxMpjvko6w23GdTWvAD8M1Ze+7PKiQh/g
         Ezig==
X-Gm-Message-State: AOAM532VwSYMtyPWVG+oCDrAR8C2WMsA/i/GftsEh+4FQ9LPEEHuQhBm
	sFTTdNywGmikJV2I+6wN99Jb8WJS80w=
X-Google-Smtp-Source: ABdhPJwu3ylI37F9hC314mwpW48QKIk04uEzzzRFw68bw23WI0lEiD3HTRu8pD0XhwEP/YM7OaiNNg==
X-Received: by 2002:adf:f541:: with SMTP id j1mr5576263wrp.180.1631124091842;
        Wed, 08 Sep 2021 11:01:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/26] lua: update 5.3.6 -> 5.4.3
Date: Wed,  8 Sep 2021 20:01:03 +0200
Message-Id: <20210908180125.103473-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop three backports and 0001-Allow-building-lua-without-readline-on-Linux.patch
(feature added upstream, adjust the recipe accordingly).

Adjust ar/ranlib flags for reproducibility on liblua.a.

License-Update: lines moved around, formatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ilding-lua-without-readline-on-Linux.patch |  59 -------
 ...rriers-cannot-be-active-during-sweep.patch |  90 ----------
 .../lua/lua/CVE-2020-15888.patch              |  45 -----
 .../lua/lua/CVE-2020-15945.patch              | 167 ------------------
 .../lua/{lua_5.3.6.bb => lua_5.4.3.bb}        |  31 ++--
 5 files changed, 13 insertions(+), 379 deletions(-)
 delete mode 100644 meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
 delete mode 100644 meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
 delete mode 100644 meta/recipes-devtools/lua/lua/CVE-2020-15888.patch
 delete mode 100644 meta/recipes-devtools/lua/lua/CVE-2020-15945.patch
 rename meta/recipes-devtools/lua/{lua_5.3.6.bb => lua_5.4.3.bb} (58%)

diff --git a/meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch b/meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
deleted file mode 100644
index e767900864..0000000000
--- a/meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 601ef636fc4dfb2af3e7fda88d8ea1c1d92affe4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 2 Oct 2019 17:54:15 +0200
-Subject: [PATCH] Allow building lua without readline on Linux
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile      | 2 +-
- src/Makefile  | 3 +++
- src/luaconf.h | 5 +++++
- 3 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 119110d..9f6df45 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,7 +36,7 @@ RM= rm -f
- # == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======
- 
- # Convenience platforms targets.
--PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris
-+PLATS= aix bsd c89 freebsd generic linux linux-no-readline macosx mingw posix solaris
- 
- # What to install.
- TO_BIN= lua luac
-diff --git a/src/Makefile b/src/Makefile
-index 64c78f7..5c0428a 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -109,6 +109,9 @@ generic: $(ALL)
- linux:
- 	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -ldl -lreadline"
- 
-+linux-no-readline:
-+	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX_NO_READLINE" SYSLIBS="-Wl,-E -ldl"
-+
- macosx:
- 	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX" SYSLIBS="-lreadline"
- 
-diff --git a/src/luaconf.h b/src/luaconf.h
-index 9eeeea6..d71ca25 100644
---- a/src/luaconf.h
-+++ b/src/luaconf.h
-@@ -64,6 +64,11 @@
- #define LUA_USE_READLINE	/* needs some extra libraries */
- #endif
- 
-+#if defined(LUA_USE_LINUX_NO_READLINE)
-+#define LUA_USE_POSIX
-+#define LUA_USE_DLOPEN		/* needs an extra library: -ldl */
-+#endif
-+
- 
- #if defined(LUA_USE_MACOSX)
- #define LUA_USE_POSIX
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch b/meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
deleted file mode 100644
index a302874d76..0000000000
--- a/meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 1e6df25ac28dcd89f0324177bb55019422404b44 Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Thu, 3 Sep 2020 15:32:17 +0800
-Subject: [PATCH] Fixed bug: barriers cannot be active during sweep
-
-Barriers cannot be active during sweep, even in generational mode.
-(Although gen. mode is not incremental, it can hit a barrier when
-deleting a thread and closing its upvalues.)  The colors of objects are
-being changed during sweep and, therefore, cannot be trusted.
-
-Upstream-Status: Backport [https://github.com/lua/lua/commit/a6da1472c0c5e05ff249325f979531ad51533110]
-CVE: CVE-2020-24371
-
-[Adjust code KGC_INC -> KGC_NORMAL, refer 69371c4b84becac09c445aae01d005b49658ef82]
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- src/lgc.c | 33 ++++++++++++++++++++++++---------
- 1 file changed, 24 insertions(+), 9 deletions(-)
-
-diff --git a/src/lgc.c b/src/lgc.c
-index 973c269..7af23d5 100644
---- a/src/lgc.c
-+++ b/src/lgc.c
-@@ -142,10 +142,17 @@ static int iscleared (global_State *g, const TValue *o) {
- 
- 
- /*
--** barrier that moves collector forward, that is, mark the white object
--** being pointed by a black object. (If in sweep phase, clear the black
--** object to white [sweep it] to avoid other barrier calls for this
--** same object.)
-+** Barrier that moves collector forward, that is, marks the white object
-+** 'v' being pointed by the black object 'o'.  In the generational
-+** mode, 'v' must also become old, if 'o' is old; however, it cannot
-+** be changed directly to OLD, because it may still point to non-old
-+** objects. So, it is marked as OLD0. In the next cycle it will become
-+** OLD1, and in the next it will finally become OLD (regular old). By
-+** then, any object it points to will also be old.  If called in the
-+** incremental sweep phase, it clears the black object to white (sweep
-+** it) to avoid other barrier calls for this same object. (That cannot
-+** be done is generational mode, as its sweep does not distinguish
-+** whites from deads.)
- */
- void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
-   global_State *g = G(L);
-@@ -154,7 +161,8 @@ void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
-     reallymarkobject(g, v);  /* restore invariant */
-   else {  /* sweep phase */
-     lua_assert(issweepphase(g));
--    makewhite(g, o);  /* mark main obj. as white to avoid other barriers */
-+    if (g->gckind == KGC_NORMAL)  /* incremental mode? */
-+      makewhite(g, o);  /* mark 'o' as white to avoid other barriers */
-   }
- }
- 
-@@ -299,10 +307,15 @@ static void markbeingfnz (global_State *g) {
- 
- 
- /*
--** Mark all values stored in marked open upvalues from non-marked threads.
--** (Values from marked threads were already marked when traversing the
--** thread.) Remove from the list threads that no longer have upvalues and
--** not-marked threads.
-+** For each non-marked thread, simulates a barrier between each open
-+** upvalue and its value. (If the thread is collected, the value will be
-+** assigned to the upvalue, but then it can be too late for the barrier
-+** to act. The "barrier" does not need to check colors: A non-marked
-+** thread must be young; upvalues cannot be older than their threads; so
-+** any visited upvalue must be young too.) Also removes the thread from
-+** the list, as it was already visited. Removes also threads with no
-+** upvalues, as they have nothing to be checked. (If the thread gets an
-+** upvalue later, it will be linked in the list again.)
- */
- static void remarkupvals (global_State *g) {
-   lua_State *thread;
-@@ -313,9 +326,11 @@ static void remarkupvals (global_State *g) {
-       p = &thread->twups;  /* keep marked thread with upvalues in the list */
-     else {  /* thread is not marked or without upvalues */
-       UpVal *uv;
-+      lua_assert(!isold(thread) || thread->openupval == NULL);
-       *p = thread->twups;  /* remove thread from the list */
-       thread->twups = thread;  /* mark that it is out of list */
-       for (uv = thread->openupval; uv != NULL; uv = uv->u.open.next) {
-+        lua_assert(getage(uv) <= getage(thread));
-         if (uv->u.open.touched) {
-           markvalue(g, uv->v);  /* remark upvalue's value */
-           uv->u.open.touched = 0;
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/lua/lua/CVE-2020-15888.patch b/meta/recipes-devtools/lua/lua/CVE-2020-15888.patch
deleted file mode 100644
index 60a4125971..0000000000
--- a/meta/recipes-devtools/lua/lua/CVE-2020-15888.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6298903e35217ab69c279056f925fb72900ce0b7 Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Mon, 6 Jul 2020 12:11:54 -0300
-Subject: [PATCH] Keep minimum size when shrinking a stack
-
-When shrinking a stack (during GC), do not make it smaller than the
-initial stack size.
----
- ldo.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-==== end of original header ====
-
-CVE: CVE-2020-15888
-
-Upstream-Status: backport [https://github.com/lua/lua.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-====
-diff --git a/ldo.c b/ldo.c
-index c563b1d9..a89ac010 100644
---- a/src/ldo.c
-+++ b/src/ldo.c
-@@ -220,7 +220,7 @@ static int stackinuse (lua_State *L) {
- 
- void luaD_shrinkstack (lua_State *L) {
-   int inuse = stackinuse(L);
--  int goodsize = inuse + (inuse / 8) + 2*EXTRA_STACK;
-+  int goodsize = inuse + BASIC_STACK_SIZE;
-   if (goodsize > LUAI_MAXSTACK)
-     goodsize = LUAI_MAXSTACK;  /* respect stack limit */
-   if (L->stacksize > LUAI_MAXSTACK)  /* had been handling stack overflow? */
-@@ -229,8 +229,7 @@ void luaD_shrinkstack (lua_State *L) {
-     luaE_shrinkCI(L);  /* shrink list */
-   /* if thread is currently not handling a stack overflow and its
-      good size is smaller than current size, shrink its stack */
--  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) &&
--      goodsize < L->stacksize)
-+  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) && goodsize < L->stacksize)
-     luaD_reallocstack(L, goodsize);
-   else  /* don't change stack */
-     condmovestack(L,{},{});  /* (change only for debugging) */
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/lua/lua/CVE-2020-15945.patch b/meta/recipes-devtools/lua/lua/CVE-2020-15945.patch
deleted file mode 100644
index 89ce491487..0000000000
--- a/meta/recipes-devtools/lua/lua/CVE-2020-15945.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From d8d344365945a534f700c82c5dd26f704f89fef3 Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Wed, 5 Aug 2020 16:59:58 +0800
-Subject: [PATCH] Fixed bug: invalid 'oldpc' when returning to a function
-
-The field 'L->oldpc' is not always updated when control returns to a
-function; an invalid value can seg. fault when computing 'changedline'.
-(One example is an error in a finalizer; control can return to
-'luaV_execute' without executing 'luaD_poscall'.) Instead of trying to
-fix all possible corner cases, it seems safer to be resilient to invalid
-values for 'oldpc'. Valid but wrong values at most cause an extra call
-to a line hook.
-
-CVE: CVE-2020-15945
-
-[Adjust the code to be applicable to the tree]
-
-Upstream-Status: Backport [https://github.com/lua/lua/commit/a2195644d89812e5b157ce7bac35543e06db05e3]
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@@windriver.com>
-
----
- src/ldebug.c | 30 +++++++++++++++---------------
- src/ldebug.h |  4 ++++
- src/ldo.c    |  2 +-
- src/lstate.c |  1 +
- src/lstate.h |  2 +-
- 5 files changed, 22 insertions(+), 17 deletions(-)
-
-diff --git a/src/ldebug.c b/src/ldebug.c
-index 239affb..832b16c 100644
---- a/src/ldebug.c
-+++ b/src/ldebug.c
-@@ -34,9 +34,8 @@
- #define noLuaClosure(f)		((f) == NULL || (f)->c.tt == LUA_TCCL)
- 
- 
--/* Active Lua function (given call info) */
--#define ci_func(ci)		(clLvalue((ci)->func))
--
-+/* inverse of 'pcRel' */
-+#define invpcRel(pc, p)                ((p)->code + (pc) + 1)
- 
- static const char *funcnamefromcode (lua_State *L, CallInfo *ci,
-                                     const char **name);
-@@ -71,20 +70,18 @@ static void swapextra (lua_State *L) {
- 
- /*
- ** This function can be called asynchronously (e.g. during a signal).
--** Fields 'oldpc', 'basehookcount', and 'hookcount' (set by
--** 'resethookcount') are for debug only, and it is no problem if they
--** get arbitrary values (causes at most one wrong hook call). 'hookmask'
--** is an atomic value. We assume that pointers are atomic too (e.g., gcc
--** ensures that for all platforms where it runs). Moreover, 'hook' is
--** always checked before being called (see 'luaD_hook').
-+** Fields 'basehookcount' and 'hookcount' (set by 'resethookcount')
-+** are for debug only, and it is no problem if they get arbitrary
-+** values (causes at most one wrong hook call). 'hookmask' is an atomic
-+** value. We assume that pointers are atomic too (e.g., gcc ensures that
-+** for all platforms where it runs). Moreover, 'hook' is always checked
-+** before being called (see 'luaD_hook').
- */
- LUA_API void lua_sethook (lua_State *L, lua_Hook func, int mask, int count) {
-   if (func == NULL || mask == 0) {  /* turn off hooks? */
-     mask = 0;
-     func = NULL;
-   }
--  if (isLua(L->ci))
--    L->oldpc = L->ci->u.l.savedpc;
-   L->hook = func;
-   L->basehookcount = count;
-   resethookcount(L);
-@@ -665,7 +662,10 @@ l_noret luaG_runerror (lua_State *L, const char *fmt, ...) {
- void luaG_traceexec (lua_State *L) {
-   CallInfo *ci = L->ci;
-   lu_byte mask = L->hookmask;
-+  const Proto *p = ci_func(ci)->p;
-   int counthook = (--L->hookcount == 0 && (mask & LUA_MASKCOUNT));
-+  /* 'L->oldpc' may be invalid; reset it in this case */
-+  int oldpc = (L->oldpc < p->sizecode) ? L->oldpc : 0;
-   if (counthook)
-     resethookcount(L);  /* reset count */
-   else if (!(mask & LUA_MASKLINE))
-@@ -677,15 +677,15 @@ void luaG_traceexec (lua_State *L) {
-   if (counthook)
-     luaD_hook(L, LUA_HOOKCOUNT, -1);  /* call count hook */
-   if (mask & LUA_MASKLINE) {
--    Proto *p = ci_func(ci)->p;
-     int npc = pcRel(ci->u.l.savedpc, p);
-     int newline = getfuncline(p, npc);
-     if (npc == 0 ||  /* call linehook when enter a new function, */
--        ci->u.l.savedpc <= L->oldpc ||  /* when jump back (loop), or when */
--        newline != getfuncline(p, pcRel(L->oldpc, p)))  /* enter a new line */
-+        ci->u.l.savedpc <= invpcRel(oldpc, p) ||  /* when jump back (loop), or when */
-+        newline != getfuncline(p, oldpc))  /* enter a new line */
-       luaD_hook(L, LUA_HOOKLINE, newline);  /* call line hook */
-+
-+    L->oldpc = npc;  /* 'pc' of last call to line hook */
-   }
--  L->oldpc = ci->u.l.savedpc;
-   if (L->status == LUA_YIELD) {  /* did hook yield? */
-     if (counthook)
-       L->hookcount = 1;  /* undo decrement to zero */
-diff --git a/src/ldebug.h b/src/ldebug.h
-index 0e31546..c224cc4 100644
---- a/src/ldebug.h
-+++ b/src/ldebug.h
-@@ -13,6 +13,10 @@
- 
- #define pcRel(pc, p)	(cast(int, (pc) - (p)->code) - 1)
- 
-+/* Active Lua function (given call info) */
-+#define ci_func(ci)            (clLvalue((ci)->func))
-+
-+
- #define getfuncline(f,pc)	(((f)->lineinfo) ? (f)->lineinfo[pc] : -1)
- 
- #define resethookcount(L)	(L->hookcount = L->basehookcount)
-diff --git a/src/ldo.c b/src/ldo.c
-index 90b695f..f66ac1a 100644
---- a/src/ldo.c
-+++ b/src/ldo.c
-@@ -382,7 +382,7 @@ int luaD_poscall (lua_State *L, CallInfo *ci, StkId firstResult, int nres) {
-       luaD_hook(L, LUA_HOOKRET, -1);
-       firstResult = restorestack(L, fr);
-     }
--    L->oldpc = ci->previous->u.l.savedpc;  /* 'oldpc' for caller function */
-+    L->oldpc = pcRel(ci->u.l.savedpc, ci_func(ci)->p);  /* 'oldpc' for caller function */
-   }
-   res = ci->func;  /* res == final position of 1st result */
-   L->ci = ci->previous;  /* back to caller */
-diff --git a/src/lstate.c b/src/lstate.c
-index 9194ac3..3573e36 100644
---- a/src/lstate.c
-+++ b/src/lstate.c
-@@ -236,6 +236,7 @@ static void preinit_thread (lua_State *L, global_State *g) {
-   L->nny = 1;
-   L->status = LUA_OK;
-   L->errfunc = 0;
-+  L->oldpc = 0;
- }
- 
- 
-diff --git a/src/lstate.h b/src/lstate.h
-index a469466..d75eadf 100644
---- a/src/lstate.h
-+++ b/src/lstate.h
-@@ -164,7 +164,6 @@ struct lua_State {
-   StkId top;  /* first free slot in the stack */
-   global_State *l_G;
-   CallInfo *ci;  /* call info for current function */
--  const Instruction *oldpc;  /* last pc traced */
-   StkId stack_last;  /* last free slot in the stack */
-   StkId stack;  /* stack base */
-   UpVal *openupval;  /* list of open upvalues in this stack */
-@@ -174,6 +173,7 @@ struct lua_State {
-   CallInfo base_ci;  /* CallInfo for first level (C calling Lua) */
-   volatile lua_Hook hook;
-   ptrdiff_t errfunc;  /* current error handling function (stack index) */
-+  int oldpc;  /* last pc traced */
-   int stacksize;
-   int basehookcount;
-   int hookcount;
--- 
-2.13.3
-
diff --git a/meta/recipes-devtools/lua/lua_5.3.6.bb b/meta/recipes-devtools/lua/lua_5.4.3.bb
similarity index 58%
rename from meta/recipes-devtools/lua/lua_5.3.6.bb
rename to meta/recipes-devtools/lua/lua_5.4.3.bb
index f830e09259..0224744fe7 100644
--- a/meta/recipes-devtools/lua/lua_5.3.6.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.3.bb
@@ -1,29 +1,24 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=f43d8ee6bc4df18ef8b276439cc4a153"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=307;endline=330;md5=79c3f6b19ad05efe24c1681f025026bb"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
-           file://0001-Allow-building-lua-without-readline-on-Linux.patch \
-           file://CVE-2020-15888.patch \
-           file://CVE-2020-15945.patch \
-           file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-PV_testsuites = "5.3.4"
+PV_testsuites = "5.4.3"
 
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
-           'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest \
-            file://run-ptest \
-           ', '', d)}"
+SRC_URI[tarballsrc.sha256sum] = "f8612276169e3bfcbcfb8f226195bfc6e466fe13042f1076cbde92b7ec96bbfb"
+SRC_URI[tarballtest.sha256sum] = "5d29c3022897a8290f280ebe1c6853248dfa35a668e1fc02ba9c8cde4e7bf110"
 
-SRC_URI[tarballsrc.md5sum] = "83f23dbd5230140a3770d5f54076948d"
-SRC_URI[tarballsrc.sha256sum] = "fc5fd69bb8736323f026672b1b7235da613d7177e72558893a0bdcd320466d60"
-SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
-SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
+# remove at next version upgrade or when output changes
+# was added after intermittent repro failures poisoned the cache
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".2"
 
 inherit pkgconfig binconfig ptest
 
@@ -31,7 +26,7 @@ PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = ",,readline"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
-EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}' 'AR=ar rcD' 'RANLIB=ranlib -D'"
 
 do_configure:prepend() {
     sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
@@ -39,7 +34,7 @@ do_configure:prepend() {
 }
 
 do_compile () {
-    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux', 'linux-no-readline', d)}
+    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux-readline', 'linux', d)}
 }
 
 do_install () {
@@ -50,13 +45,13 @@ do_install () {
         'INSTALL_MAN=${D}${mandir}/man1' \
         'INSTALL_SHARE=${D}${datadir}/lua' \
         'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.4' \
         install
     install -d ${D}${libdir}/pkgconfig
 
     sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
     install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.3
+    rmdir ${D}${datadir}/lua/5.4
     rmdir ${D}${datadir}/lua
 }
 
-- 
2.31.1

