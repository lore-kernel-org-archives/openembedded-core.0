Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F90BD7974F
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5109.1769846226328579340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xgCBzixN;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee0291921so26018065e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846224; x=1770451024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0KODpdHhcP0Yoh9EFgBt15Uo3BuUvnUPqpD05BQusA=;
        b=xgCBzixNC95Bvxvo+XPqHFPVecq9L4UZxBCMwy8IyxDaVgE8plFDWZuLttwkx5PsNO
         Qxp/iIp0woWL08ROTLwDzCaq4IBe+yNec+Y45uk8+btjn+32lfenCU66gdAY4Zx0oNB0
         vfA/ASYlr3xRB9KawKKUbSAKSl3toGeD5htn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846224; x=1770451024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0KODpdHhcP0Yoh9EFgBt15Uo3BuUvnUPqpD05BQusA=;
        b=U1tQJR8g89FWdlFfrcuQkJWiFwxxFrygk1WaEz/g0yHF+W0uceeWwZU1sZUklPhBzI
         Kv7F4VeDwP0yQe3iGaw/HIsT0uDc6CG49Y7TXmcXTImhZmmBHpkcVspBEJg4KZFvhtIw
         PDcVDW7tJbfHwsK0n9TqpFjotLuJzUbXgKX+32R7Yeea3pk1pNk5qQrtr/QMWiZfHq8n
         NF/r6eV0xFksghfNp1AGqM2k3jHJyv/1M27c7+WVZ0noJBBAbq7ILA5B7ekrMBx+KfwG
         My9ZvMk6CUIlZ62S44JOQ6RHD+aVNWFHzmv4VwUn7VnkG4ZPfuCtnzmJ8ZOEn7Rqnhv6
         ZExg==
X-Gm-Message-State: AOJu0YxDnLbMsiP0LeEwWIXLiv+OBmotxo9GiSfInVnY4dc71pwgdnMC
	7Zu9TUB4DqhsrqyzSBnjJ6V1F8IiSx1D8TzOF5YO+lfbxLFOb14hjPHTfVajnqc7nD/txB8iSoM
	dN632k7E=
X-Gm-Gg: AZuq6aKL4nRdWEE0NwUROpDO3D5MeeTdaOTBzn2wKcwrd27zNEOWLriv/fIdahsvmq4
	poFuBFxOgDrfitbz3D8M4arzjFHTg9ULY38uWj9rfgyZC9wrnFsWfJVbF0v/t7x4ew415sF9UPq
	7C2KAC0lxiwAH5HIWhYhziyRfv09JNpVm6vawFUiWD8b7wyB8BS/KP9n/OiqPLRjWuzuQef7jOX
	7lVuHgP8sqtmfGqbYRGX9GgXdbuavpB2j0gVEPZ7jMgnJAlQxnBejfv34LQwatF9uCNS+L7rM3K
	8SYbKgtMeRx394FhjTDiZcT2tVBC8Ljo+VxcqQeJuDyV+xV4eOPktrMcL3nZmh+AfUwfIiEGEG8
	RYUp9BgCO7NmX6DCy7ONb4yIMAD66J6BkL/9M4izZaXR2mYKRBaVrLt0PuV6sMBdBrK7GVALT5p
	+2QUNesJNKSXvka5FeZ/HZIHGgSPTKaeL4xEwEj4QtyZ1/uf+ssSQTACKNX6gIaPM4qBf3i9TTk
	rsQUK6mEP0aHPnf
X-Received: by 2002:a05:600c:8b55:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-482db4f2fb2mr66944235e9.35.1769846224100;
        Fri, 30 Jan 2026 23:57:04 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 15/22] dropbear: patch CVE-2025-14282
Date: Sat, 31 Jan 2026 08:56:26 +0100
Message-ID: <9adb3749e78f1c5602c4f2f22996b0aa29f0f444.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230220

From: Peter Marko <peter.marko@siemens.com>

Pick commits from PRs per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-14282

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dropbear/dropbear/CVE-2025-14282-01.patch | 280 +++++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-02.patch |  97 ++++++
 .../dropbear/dropbear/CVE-2025-14282-03.patch | 282 ++++++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-04.patch |  72 +++++
 .../dropbear/dropbear/CVE-2025-14282-05.patch |  46 +++
 .../recipes-core/dropbear/dropbear_2025.88.bb |   5 +
 6 files changed, 782 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch
new file mode 100644
index 00000000000..33b871620fe
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch
@@ -0,0 +1,280 @@
+From e0251be2354e1a5c6eccfc2cf4b64243625dafcc Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 9 Dec 2025 15:08:06 +0900
+Subject: [PATCH] Drop privileges after user authentication
+
+Instead of switching user privileges after forking to a shell, switch
+to the user immediately upon successful authentication.
+
+This will require further commits to fix utmp and hostkey handling.
+
+The DROPBEAR_SVR_DROP_PRIVS configuration option controls this
+behaviour.  This should generally be enabled, but can be set to 0 for
+incompatible platforms.  In future it may become non-optional, those
+platforms should be investigated.
+
+Most uses of DROPBEAR_SVR_MULTIUSER have been replaced by
+!DROPBEAR_SVR_DROP_PRIVS.
+
+CVE: CVE-2025-14282
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/e0251be2354e1a5c6eccfc2cf4b64243625dafcc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .github/workflows/build.yml |  2 ++
+ src/auth.h                  |  1 +
+ src/default_options.h       |  6 +++++
+ src/svr-agentfwd.c          | 14 ++++++++----
+ src/svr-auth.c              | 45 +++++++++++++++++++++++++++++++++++++
+ src/svr-authpubkey.c        |  6 +++--
+ src/svr-chansession.c       | 26 ++-------------------
+ src/sysoptions.h            |  3 +++
+ 8 files changed, 73 insertions(+), 30 deletions(-)
+
+diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
+index 61e64a1..5c07d28 100644
+--- a/.github/workflows/build.yml
++++ b/.github/workflows/build.yml
+@@ -227,6 +227,8 @@ jobs:
+           echo "#define DROPBEAR_SVR_PASSWORD_AUTH 0" >> localoptions.h
+           # 1 second timeout is too short
+           sed -i "s/DEFAULT_IDLE_TIMEOUT 1/DEFAULT_IDLE_TIMEOUT 99/" localoptions.h
++          # DROPBEAR_SVR_DROP_PRIVS is on by default, turn it off
++          echo "#define DROPBEAR_SVR_DROP_PRIVS 0" >> localoptions.h
+ 
+       - name: make
+         run: |
+diff --git a/src/auth.h b/src/auth.h
+index 0e854fb..096d23d 100644
+--- a/src/auth.h
++++ b/src/auth.h
+@@ -40,6 +40,7 @@ void send_msg_userauth_banner(const buffer *msg);
+ void svr_auth_password(int valid_user);
+ void svr_auth_pubkey(int valid_user);
+ void svr_auth_pam(int valid_user);
++void svr_switch_user(void);
+ 
+ #if DROPBEAR_SVR_PUBKEY_OPTIONS_BUILT
+ int svr_pubkey_allows_agentfwd(void);
+diff --git a/src/default_options.h b/src/default_options.h
+index 9a0f064..705da74 100644
+--- a/src/default_options.h
++++ b/src/default_options.h
+@@ -303,6 +303,12 @@ group1 in Dropbear server too */
+ /* -T server option overrides */
+ #define MAX_AUTH_TRIES 10
+ 
++/* Change server process to user privileges after authentication. */
++#ifndef DROPBEAR_SVR_DROP_PRIVS
++/* Default is enabled. Should only be disabled if platforms are incompatible */
++#define DROPBEAR_SVR_DROP_PRIVS DROPBEAR_SVR_MULTIUSER
++#endif
++
+ /* Delay introduced before closing an unauthenticated session (seconds).
+    Disabled by default, can be set to say 30 seconds to reduce the speed
+    of password brute forcing. Note that there is a risk of denial of
+diff --git a/src/svr-agentfwd.c b/src/svr-agentfwd.c
+index a8941ea..5ee8c25 100644
+--- a/src/svr-agentfwd.c
++++ b/src/svr-agentfwd.c
+@@ -151,7 +151,7 @@ void svr_agentcleanup(struct ChanSess * chansess) {
+ 
+ 	if (chansess->agentfile != NULL && chansess->agentdir != NULL) {
+ 
+-#if DROPBEAR_SVR_MULTIUSER
++#if !DROPBEAR_SVR_DROP_PRIVS
+ 		/* Remove the dir as the user. That way they can't cause problems except
+ 		 * for themselves */
+ 		uid = getuid();
+@@ -160,6 +160,9 @@ void svr_agentcleanup(struct ChanSess * chansess) {
+ 			(seteuid(ses.authstate.pw_uid)) < 0) {
+ 			dropbear_exit("Failed to set euid");
+ 		}
++#else
++		(void)uid;
++		(void)gid;
+ #endif
+ 
+ 		/* 2 for "/" and "\0" */
+@@ -172,7 +175,7 @@ void svr_agentcleanup(struct ChanSess * chansess) {
+ 
+ 		rmdir(chansess->agentdir);
+ 
+-#if DROPBEAR_SVR_MULTIUSER
++#if !DROPBEAR_SVR_DROP_PRIVS
+ 		if ((seteuid(uid)) < 0 ||
+ 			(setegid(gid)) < 0) {
+ 			dropbear_exit("Failed to revert euid");
+@@ -219,7 +222,7 @@ static int bindagent(int fd, struct ChanSess * chansess) {
+ 	gid_t gid;
+ 	int ret = DROPBEAR_FAILURE;
+ 
+-#if DROPBEAR_SVR_MULTIUSER
++#if !DROPBEAR_SVR_DROP_PRIVS
+ 	/* drop to user privs to make the dir/file */
+ 	uid = getuid();
+ 	gid = getgid();
+@@ -227,6 +230,9 @@ static int bindagent(int fd, struct ChanSess * chansess) {
+ 		(seteuid(ses.authstate.pw_uid)) < 0) {
+ 		dropbear_exit("Failed to set euid");
+ 	}
++#else
++		(void)uid;
++		(void)gid;
+ #endif
+ 
+ 	memset((void*)&addr, 0x0, sizeof(addr));
+@@ -267,7 +273,7 @@ bindsocket:
+ 
+ 
+ out:
+-#if DROPBEAR_SVR_MULTIUSER
++#if !DROPBEAR_SVR_DROP_PRIVS
+ 	if ((seteuid(uid)) < 0 ||
+ 		(setegid(gid)) < 0) {
+ 		dropbear_exit("Failed to revert euid");
+diff --git a/src/svr-auth.c b/src/svr-auth.c
+index 0a6b33a..46ba012 100644
+--- a/src/svr-auth.c
++++ b/src/svr-auth.c
+@@ -457,12 +457,22 @@ void send_msg_userauth_success() {
+ 	/* authdone must be set after encrypt_packet() for 
+ 	 * delayed-zlib mode */
+ 	ses.authstate.authdone = 1;
++
++#if DROPBEAR_DROP_PRIVS
++	svr_switch_user();
++#endif
+ 	ses.connect_time = 0;
+ 
+ 
++#if DROPBEAR_DROP_PRIVS
++	/* If running as the user, we can rely on the OS
++	 * to limit allowed ports */
++	ses.allowprivport = 1;
++#else
+ 	if (ses.authstate.pw_uid == 0) {
+ 		ses.allowprivport = 1;
+ 	}
++#endif
+ 
+ 	/* Remove from the list of pre-auth sockets. Should be m_close(), since if
+ 	 * we fail, we might end up leaking connection slots, and disallow new
+@@ -472,3 +482,38 @@ void send_msg_userauth_success() {
+ 	TRACE(("leave send_msg_userauth_success"))
+ 
+ }
++
++/* Switch to the ses.authstate user.
++ * Fails if not running as root and the user differs.
++ *
++ * This may be called either after authentication, or 
++ * after shell/command fork if DROPBEAR_SVR_DROP_PRIVS is unset.
++ */
++void svr_switch_user(void) {
++	assert(ses.authstate.authdone);
++
++	/* We can only change uid/gid as root ... */
++	if (getuid() == 0) {
++
++		if ((setgid(ses.authstate.pw_gid) < 0) ||
++			(initgroups(ses.authstate.pw_name, 
++						ses.authstate.pw_gid) < 0)) {
++			dropbear_exit("Error changing user group");
++		}
++		if (setuid(ses.authstate.pw_uid) < 0) {
++			dropbear_exit("Error changing user");
++		}
++	} else {
++		/* ... but if the daemon is the same uid as the requested uid, we don't
++		 * need to */
++
++		/* XXX - there is a minor issue here, in that if there are multiple
++		 * usernames with the same uid, but differing groups, then the
++		 * differing groups won't be set (as with initgroups()). The solution
++		 * is for the sysadmin not to give out the UID twice */
++		if (getuid() != ses.authstate.pw_uid) {
++			dropbear_exit("Couldn't	change user as non-root");
++		}
++	}
++}
++
+diff --git a/src/svr-authpubkey.c b/src/svr-authpubkey.c
+index 94ae728..e26b0ee 100644
+--- a/src/svr-authpubkey.c
++++ b/src/svr-authpubkey.c
+@@ -462,12 +462,14 @@ static int checkpubkey(const char* keyalgo, unsigned int keyalgolen,
+ 	int ret = DROPBEAR_FAILURE;
+ 	buffer * line = NULL;
+ 	int line_num;
++#if !DROPBEAR_SVR_DROP_PRIVS
+ 	uid_t origuid;
+ 	gid_t origgid;
++#endif
+ 
+ 	TRACE(("enter checkpubkey"))
+ 
+-#if DROPBEAR_SVR_MULTIUSER
++#if !DROPBEAR_SVR_DROP_PRIVS
+ 	/* access the file as the authenticating user. */
+ 	origuid = getuid();
+ 	origgid = getgid();
+@@ -488,7 +490,7 @@ static int checkpubkey(const char* keyalgo, unsigned int keyalgolen,
+ 			TRACE(("checkpubkey: failed opening %s: %s", filename, strerror(errno)))
+ 		}
+ 	}
+-#if DROPBEAR_SVR_MULTIUSER
++#if !DROPBEAR_SVR_DROP_PRIVS
+ 	if ((seteuid(origuid)) < 0 ||
+ 		(setegid(origgid)) < 0) {
+ 		dropbear_exit("Failed to revert euid");
+diff --git a/src/svr-chansession.c b/src/svr-chansession.c
+index 2ca6fc1..0a37fbf 100644
+--- a/src/svr-chansession.c
++++ b/src/svr-chansession.c
+@@ -980,30 +980,8 @@ static void execchild(const void *user_data) {
+ #endif /* DEBUG_VALGRIND */
+ 	}
+ 
+-#if DROPBEAR_SVR_MULTIUSER
+-	/* We can only change uid/gid as root ... */
+-	if (getuid() == 0) {
+-
+-		if ((setgid(ses.authstate.pw_gid) < 0) ||
+-			(initgroups(ses.authstate.pw_name, 
+-						ses.authstate.pw_gid) < 0)) {
+-			dropbear_exit("Error changing user group");
+-		}
+-		if (setuid(ses.authstate.pw_uid) < 0) {
+-			dropbear_exit("Error changing user");
+-		}
+-	} else {
+-		/* ... but if the daemon is the same uid as the requested uid, we don't
+-		 * need to */
+-
+-		/* XXX - there is a minor issue here, in that if there are multiple
+-		 * usernames with the same uid, but differing groups, then the
+-		 * differing groups won't be set (as with initgroups()). The solution
+-		 * is for the sysadmin not to give out the UID twice */
+-		if (getuid() != ses.authstate.pw_uid) {
+-			dropbear_exit("Couldn't	change user as non-root");
+-		}
+-	}
++#if !DROPBEAR_SVR_DROP_PRIVS
++	svr_switch_user();
+ #endif
+ 
+ 	/* set env vars */
+diff --git a/src/sysoptions.h b/src/sysoptions.h
+index cea9688..32b0a13 100644
+--- a/src/sysoptions.h
++++ b/src/sysoptions.h
+@@ -443,6 +443,9 @@
+ #define DROPBEAR_MULTI 0
+ #endif
+ 
++#if !DROPBEAR_SVR_MULTIUSER && DROPBEAR_SVR_DROP_PRIVS
++#error DROPBEAR_SVR_DROP_PRIVS needs DROPBEAR_SVR_MULTIUSER
++#endif
+ /* Fuzzing expects all key types to be enabled */
+ #if DROPBEAR_FUZZ
+ #if defined(DROPBEAR_DSS)
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch
new file mode 100644
index 00000000000..5c5265afef7
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch
@@ -0,0 +1,97 @@
+From b47fe5df58f0b459bb49accdd8cb961d969209fb Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 9 Dec 2025 09:04:04 +0900
+Subject: [PATCH] Remove return code from login_login
+
+Previously this was always 0, so not useful.
+
+CVE: CVE-2025-14282
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/b47fe5df58f0b459bb49accdd8cb961d969209fb]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/loginrec.c | 19 +++++--------------
+ src/loginrec.h |  6 +++---
+ 2 files changed, 8 insertions(+), 17 deletions(-)
+
+diff --git a/src/loginrec.c b/src/loginrec.c
+index b543bcb..d4fdb62 100644
+--- a/src/loginrec.c
++++ b/src/loginrec.c
+@@ -193,32 +193,24 @@ int wtmpx_get_entry(struct logininfo *li);
+  *
+  * Call with a pointer to a struct logininfo initialised with
+  * login_init_entry() or login_alloc_entry()
+- *
+- * Returns:
+- *  >0 if successful
+- *  0  on failure (will use OpenSSH's logging facilities for diagnostics)
+  */
+-int
++void
+ login_login (struct logininfo *li)
+ {
+ 	li->type = LTYPE_LOGIN;
+-	return login_write(li);
++	login_write(li);
+ }
+ 
+ 
+ /* login_logout(struct logininfo *)     - Record a logout
+  *
+  * Call as with login_login()
+- *
+- * Returns:
+- *  >0 if successful
+- *  0  on failure (will use OpenSSH's logging facilities for diagnostics)
+  */
+-int
++void
+ login_logout(struct logininfo *li)
+ {
+ 	li->type = LTYPE_LOGOUT;
+-	return login_write(li);
++	login_write(li);
+ }
+ 
+ 
+@@ -309,7 +301,7 @@ login_set_current_time(struct logininfo *li)
+  ** login_write: Call low-level recording functions based on autoconf
+  ** results
+  **/
+-int
++void
+ login_write (struct logininfo *li)
+ {
+ #ifndef HAVE_CYGWIN
+@@ -340,7 +332,6 @@ login_write (struct logininfo *li)
+ #ifdef USE_WTMPX
+ 	wtmpx_write_entry(li);
+ #endif
+-	return 0;
+ }
+ 
+ #ifdef LOGIN_NEEDS_UTMPX
+diff --git a/src/loginrec.h b/src/loginrec.h
+index 6abde48..f8c98ba 100644
+--- a/src/loginrec.h
++++ b/src/loginrec.h
+@@ -161,8 +161,8 @@ int login_init_entry(struct logininfo *li, int pid, const char *username,
+ void login_set_current_time(struct logininfo *li);
+ 
+ /* record the entry */
+-int login_login (struct logininfo *li);
+-int login_logout(struct logininfo *li);
++void login_login (struct logininfo *li);
++void login_logout(struct logininfo *li);
+ #ifdef LOGIN_NEEDS_UTMPX
+ int login_utmp_only(struct logininfo *li);
+ #endif
+@@ -170,7 +170,7 @@ int login_utmp_only(struct logininfo *li);
+ /** End of public functions */
+ 
+ /* record the entry */
+-int login_write (struct logininfo *li);
++void login_write (struct logininfo *li);
+ int login_log_entry(struct logininfo *li);
+ 
+ /* produce various forms of the line filename */
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch
new file mode 100644
index 00000000000..c8996b977e4
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch
@@ -0,0 +1,282 @@
+From 73e4e70ea8e6b890c3918b52bb2e647313a09faa Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 9 Dec 2025 09:05:30 +0900
+Subject: [PATCH] Retain utmp saved group when dropping privileges
+
+utmp is required to record logout. The saved group
+is reset by the OS for the executed user shell.
+
+This requires setresgid() function which is not available on all
+platforms. Notable platforms are netbsd and macos. Those platforms will
+have to set DROPBEAR_SVR_DROP_PRIVS 0 unless an alternative approach is
+found.
+
+CVE: CVE-2025-14282
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/73e4e70ea8e6b890c3918b52bb2e647313a09faa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .github/workflows/build.yml |  6 ++++
+ configure                   |  7 +++++
+ configure.ac                |  1 +
+ src/auth.h                  |  2 ++
+ src/config.h.in             |  3 ++
+ src/loginrec.c              |  6 ----
+ src/session.h               |  6 ++++
+ src/svr-auth.c              | 61 +++++++++++++++++++++++++++++++++++--
+ src/svr-chansession.c       |  8 +++++
+ src/sysoptions.h            |  4 +++
+ 10 files changed, 96 insertions(+), 8 deletions(-)
+
+diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
+index 5c07d28..4fe41bd 100644
+--- a/.github/workflows/build.yml
++++ b/.github/workflows/build.yml
+@@ -78,6 +78,9 @@ jobs:
+             # fails with:
+             # .../ranlib: file: libtomcrypt.a(cbc_setiv.o) has no symbols
+             ranlib: ranlib -no_warning_for_no_symbols
++            # macos doesn't have setresgid
++            localoptions: |
++              #define DROPBEAR_SVR_DROP_PRIVS 0
+ 
+           - name: macos 15
+             os: macos-15
+@@ -90,6 +93,9 @@ jobs:
+             # fails with:
+             # .../ranlib: file: libtomcrypt.a(cbc_setiv.o) has no symbols
+             ranlib: ranlib -no_warning_for_no_symbols
++            # macos doesn't have setresgid
++            localoptions: |
++              #define DROPBEAR_SVR_DROP_PRIVS 0
+ 
+           # Check that debug code doesn't bitrot
+           - name: DEBUG_TRACE
+diff --git a/configure b/configure
+index 13c911e..8867f8a 100755
+--- a/configure
++++ b/configure
+@@ -7597,6 +7597,13 @@ then :
+ 
+ fi
+ 
++ac_fn_c_check_func "$LINENO" "setresgid" "ac_cv_func_setresgid"
++if test "x$ac_cv_func_setresgid" = xyes
++then :
++  printf "%s\n" "#define HAVE_SETRESGID 1" >>confdefs.h
++
++fi
++
+ 
+ # Might be a macro. Might be sys/endian.h on BSDs
+ ac_fn_c_check_header_compile "$LINENO" "endian.h" "ac_cv_header_endian_h" "$ac_includes_default"
+diff --git a/configure.ac b/configure.ac
+index 674fd4d..0e7e331 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -545,6 +545,7 @@ AC_CHECK_FUNCS(utmpname)
+ AC_CHECK_FUNCS(endutxent getutxent getutxid getutxline pututxline )
+ AC_CHECK_FUNCS(setutxent utmpxname)
+ AC_CHECK_FUNCS(logout updwtmp logwtmp)
++AC_CHECK_FUNCS(setresgid)
+ 
+ # Might be a macro. Might be sys/endian.h on BSDs
+ AC_CHECK_HEADERS([endian.h])
+diff --git a/src/auth.h b/src/auth.h
+index 096d23d..1145ad7 100644
+--- a/src/auth.h
++++ b/src/auth.h
+@@ -41,6 +41,8 @@ void svr_auth_password(int valid_user);
+ void svr_auth_pubkey(int valid_user);
+ void svr_auth_pam(int valid_user);
+ void svr_switch_user(void);
++void svr_raise_gid_utmp(void);
++void svr_restore_gid(void);
+ 
+ #if DROPBEAR_SVR_PUBKEY_OPTIONS_BUILT
+ int svr_pubkey_allows_agentfwd(void);
+diff --git a/src/config.h.in b/src/config.h.in
+index 0590e0c..589786e 100644
+--- a/src/config.h.in
++++ b/src/config.h.in
+@@ -231,6 +231,9 @@
+ /* Define to 1 if you have the <security/pam_appl.h> header file. */
+ #undef HAVE_SECURITY_PAM_APPL_H
+ 
++/* Define to 1 if you have the `setresgid' function. */
++#undef HAVE_SETRESGID
++
+ /* Define to 1 if you have the `setutent' function. */
+ #undef HAVE_SETUTENT
+ 
+diff --git a/src/loginrec.c b/src/loginrec.c
+index d4fdb62..3118bf6 100644
+--- a/src/loginrec.c
++++ b/src/loginrec.c
+@@ -304,12 +304,6 @@ login_set_current_time(struct logininfo *li)
+ void
+ login_write (struct logininfo *li)
+ {
+-#ifndef HAVE_CYGWIN
+-	if ((int)geteuid() != 0) {
+-	  return 1;
+-	}
+-#endif
+-
+ 	/* set the timestamp */
+ 	login_set_current_time(li);
+ #ifdef USE_LOGIN
+diff --git a/src/session.h b/src/session.h
+index f37e7ff..e1a5cfa 100644
+--- a/src/session.h
++++ b/src/session.h
+@@ -276,6 +276,12 @@ struct serversession {
+ 	/* The instance created by the plugin_new function */
+ 	struct PluginInstance *plugin_instance;
+ #endif
++
++#if DROPBEAR_SVR_DROP_PRIVS
++	/* Set to 1 when utmp_gid is valid */
++	int have_utmp_gid;
++	gid_t utmp_gid;
++#endif
+ };
+ 
+ typedef enum {
+diff --git a/src/svr-auth.c b/src/svr-auth.c
+index 46ba012..de01458 100644
+--- a/src/svr-auth.c
++++ b/src/svr-auth.c
+@@ -458,13 +458,14 @@ void send_msg_userauth_success() {
+ 	 * delayed-zlib mode */
+ 	ses.authstate.authdone = 1;
+ 
+-#if DROPBEAR_DROP_PRIVS
++#if DROPBEAR_SVR_DROP_PRIVS
++	/* Drop privileges as soon as authentication has happened. */
+ 	svr_switch_user();
+ #endif
+ 	ses.connect_time = 0;
+ 
+ 
+-#if DROPBEAR_DROP_PRIVS
++#if DROPBEAR_SVR_DROP_PRIVS
+ 	/* If running as the user, we can rely on the OS
+ 	 * to limit allowed ports */
+ 	ses.allowprivport = 1;
+@@ -483,6 +484,20 @@ void send_msg_userauth_success() {
+ 
+ }
+ 
++#if DROPBEAR_SVR_DROP_PRIVS
++/* Returns DROPBEAR_SUCCESS or DROPBEAR_FAILURE */
++static int utmp_gid(gid_t *ret_gid) {
++	struct group *utmp_gr = getgrnam("utmp");
++	if (!utmp_gr) {
++		TRACE(("No utmp group"));
++		return DROPBEAR_FAILURE;
++	}
++
++	*ret_gid = utmp_gr->gr_gid;
++	return DROPBEAR_SUCCESS;
++}
++#endif
++
+ /* Switch to the ses.authstate user.
+  * Fails if not running as root and the user differs.
+  *
+@@ -500,6 +515,25 @@ void svr_switch_user(void) {
+ 						ses.authstate.pw_gid) < 0)) {
+ 			dropbear_exit("Error changing user group");
+ 		}
++
++#if DROPBEAR_SVR_DROP_PRIVS
++		/* Retain utmp saved group so that wtmp/utmp can be written */
++		int ret = utmp_gid(&svr_ses.utmp_gid);
++		if (ret == DROPBEAR_SUCCESS) {
++			/* Set saved gid to utmp so that it can be
++			 * restored for login_logout() etc. This saved
++			 * group is cleared by the OS on execve() */
++			int rc = setresgid(-1, -1, svr_ses.utmp_gid);
++			if (rc == 0) {
++				svr_ses.have_utmp_gid = 1;
++			} else {
++				/* Will not attempt to switch to utmp gid.
++				 * login() etc may fail. */
++				TRACE(("utmp setresgid failed"));
++			}
++		}
++#endif
++
+ 		if (setuid(ses.authstate.pw_uid) < 0) {
+ 			dropbear_exit("Error changing user");
+ 		}
+@@ -517,3 +551,26 @@ void svr_switch_user(void) {
+ 	}
+ }
+ 
++void svr_raise_gid_utmp(void) {
++#if DROPBEAR_SVR_DROP_PRIVS
++	if (!svr_ses.have_utmp_gid) {
++		return;
++	}
++
++	if (setegid(svr_ses.utmp_gid) != 0) {
++		dropbear_log(LOG_WARNING, "failed setegid");
++	}
++#endif
++}
++
++void svr_restore_gid(void) {
++#if DROPBEAR_SVR_DROP_PRIVS
++	if (!svr_ses.have_utmp_gid) {
++		return;
++	}
++
++	if (setegid(getgid()) != 0) {
++		dropbear_log(LOG_WARNING, "failed setegid");
++	}
++#endif
++}
+diff --git a/src/svr-chansession.c b/src/svr-chansession.c
+index 0a37fbf..11205f3 100644
+--- a/src/svr-chansession.c
++++ b/src/svr-chansession.c
+@@ -326,7 +326,11 @@ static void cleanupchansess(const struct Channel *channel) {
+ 	if (chansess->tty) {
+ 		/* write the utmp/wtmp login record */
+ 		li = chansess_login_alloc(chansess);
++
++		svr_raise_gid_utmp();
+ 		login_logout(li);
++		svr_restore_gid();
++
+ 		login_free_entry(li);
+ 
+ 		pty_release(chansess->tty);
+@@ -847,7 +851,11 @@ static int ptycommand(struct Channel *channel, struct ChanSess *chansess) {
+ 		 * terminal used for stdout with the dup2 above, otherwise
+ 		 * the wtmp login will not be recorded */
+ 		li = chansess_login_alloc(chansess);
++
++		svr_raise_gid_utmp();
+ 		login_login(li);
++		svr_restore_gid();
++
+ 		login_free_entry(li);
+ 
+ 		/* Can now dup2 stderr. Messages from login_login() have gone
+diff --git a/src/sysoptions.h b/src/sysoptions.h
+index 32b0a13..9bdcb0c 100644
+--- a/src/sysoptions.h
++++ b/src/sysoptions.h
+@@ -358,6 +358,10 @@
+ 	#error "At least one hostkey or public-key algorithm must be enabled; RSA is recommended."
+ #endif
+ 
++#if DROPBEAR_SVR_DROP_PRIVS && !defined(HAVE_SETRESGID)
++	#error "DROPBEAR_SVR_DROP_PRIVS requires setresgid()."
++#endif
++
+ /* Source for randomness. This must be able to provide hundreds of bytes per SSH
+  * connection without blocking. */
+ #ifndef DROPBEAR_URANDOM_DEV
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch
new file mode 100644
index 00000000000..3a4a767d1bc
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch
@@ -0,0 +1,72 @@
+From a4043dac4e0e0237255200603672ddb0122017a4 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 9 Dec 2025 09:08:37 +0900
+Subject: [PATCH] Limit rekey to current hostkey type
+
+During rekey dropbear process may be running with user privileges, that
+can't write a new hostkey when auto-generating keys.
+Only offer the original hostkey when rekeying, also for non-autogenerate
+case.
+
+CVE: CVE-2025-14282
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/a4043dac4e0e0237255200603672ddb0122017a4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/runopts.h     |  1 +
+ src/svr-kex.c     |  8 ++++++++
+ src/svr-runopts.c | 11 +++++++++++
+ 3 files changed, 20 insertions(+)
+
+diff --git a/src/runopts.h b/src/runopts.h
+index f255882..c8072b3 100644
+--- a/src/runopts.h
++++ b/src/runopts.h
+@@ -61,6 +61,7 @@ extern runopts opts;
+ int readhostkey(const char * filename, sign_key * hostkey,
+ 	enum signkey_type *type);
+ void load_all_hostkeys(void);
++void disable_sig_except(enum signature_type sig_type);
+ 
+ typedef struct svr_runopts {
+ 
+diff --git a/src/svr-kex.c b/src/svr-kex.c
+index 14df08a..c066dd8 100644
+--- a/src/svr-kex.c
++++ b/src/svr-kex.c
+@@ -99,6 +99,14 @@ void recv_msg_kexdh_init() {
+ 	}
+ #endif
+ 
++	if (!ses.kexstate.donesecondkex) {
++		/* Disable other signature types.
++		 * During future rekeying, privileges may have been dropped
++		 * so other keys won't be loadable.
++		 * This must occur after send_msg_ext_info() which uses the hostkey list */
++		disable_sig_except(ses.newkeys->algo_signature);
++	}
++
+ 	ses.requirenext = SSH_MSG_NEWKEYS;
+ 	TRACE(("leave recv_msg_kexdh_init"))
+ }
+diff --git a/src/svr-runopts.c b/src/svr-runopts.c
+index 709dc57..5d114f8 100644
+--- a/src/svr-runopts.c
++++ b/src/svr-runopts.c
+@@ -515,6 +515,17 @@ static void disablekey(enum signature_type type) {
+ 	}
+ }
+ 
++void disable_sig_except(enum signature_type allow_type) {
++	int i;
++	TRACE(("Disabling other sigs except %d", allow_type));
++	for (i = 0; sigalgs[i].name != NULL; i++) {
++		enum signature_type sig_type = sigalgs[i].val;
++		if (sig_type != allow_type) {
++			sigalgs[i].usable = 0;
++		}
++	}
++}
++
+ static void loadhostkey_helper(const char *name, void** src, void** dst, int fatal_duplicate) {
+ 	if (*dst) {
+ 		if (fatal_duplicate) {
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch
new file mode 100644
index 00000000000..454c7a42a45
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch
@@ -0,0 +1,46 @@
+From d193731630a62482855b450daa1d5a5e13a90125 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Fri, 12 Dec 2025 12:31:40 +0900
+Subject: [PATCH] Restore seteuid for authorized_keys
+
+Authorized_keys reading is pre-authentication so should not be
+modified in the post-auth drop-privilege change.
+
+Fixes: e0251be2354e ("Drop privileges after user authentication")
+
+CVE: CVE-2025-14282
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/d193731630a62482855b450daa1d5a5e13a90125]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/svr-authpubkey.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/svr-authpubkey.c b/src/svr-authpubkey.c
+index e26b0ee..94ae728 100644
+--- a/src/svr-authpubkey.c
++++ b/src/svr-authpubkey.c
+@@ -462,14 +462,12 @@ static int checkpubkey(const char* keyalgo, unsigned int keyalgolen,
+ 	int ret = DROPBEAR_FAILURE;
+ 	buffer * line = NULL;
+ 	int line_num;
+-#if !DROPBEAR_SVR_DROP_PRIVS
+ 	uid_t origuid;
+ 	gid_t origgid;
+-#endif
+ 
+ 	TRACE(("enter checkpubkey"))
+ 
+-#if !DROPBEAR_SVR_DROP_PRIVS
++#if DROPBEAR_SVR_MULTIUSER
+ 	/* access the file as the authenticating user. */
+ 	origuid = getuid();
+ 	origgid = getgid();
+@@ -490,7 +488,7 @@ static int checkpubkey(const char* keyalgo, unsigned int keyalgolen,
+ 			TRACE(("checkpubkey: failed opening %s: %s", filename, strerror(errno)))
+ 		}
+ 	}
+-#if !DROPBEAR_SVR_DROP_PRIVS
++#if DROPBEAR_SVR_MULTIUSER
+ 	if ((seteuid(origuid)) < 0 ||
+ 		(setegid(origgid)) < 0) {
+ 		dropbear_exit("Failed to revert euid");
diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
index 05af557b216..6e6a22e2467 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -22,6 +22,11 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-Fix-proxycmd-without-netcat.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://CVE-2019-6111.patch \
+           file://CVE-2025-14282-01.patch \
+           file://CVE-2025-14282-02.patch \
+           file://CVE-2025-14282-03.patch \
+           file://CVE-2025-14282-04.patch \
+           file://CVE-2025-14282-05.patch \
            "
 
 SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"

