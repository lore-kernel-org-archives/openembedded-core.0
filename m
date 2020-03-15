Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4DF61C42
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:10 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id bo3so5781249pjb.5
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=a8lKW2sIwRB22VufI0DHl1Zr6L9KCAF5mpTWiaBEdW0=;
	b=JwDbSFgbBl+zOB3yBtZCvGBMn3yAZgAjMynjJfdR84jNbaWpbl31r+dqTA7cmCq7kO
	yrxkU3Go5KXpDFe6C0NJRs/xFNjCzbr3VMJdOMGJ5fzKCyDGc/Bc/icVBUmd6jUNVFKs
	Jy3mXBnTgMDRfloLqVZS/84dnMWxcmPM0Eev5LjYaria8ruTHEmv7xMNJEacn2znTJOk
	LkjZgib1ABvjDqEsiD96PTDbDZEZ7l+9ZY9JmFfjeHlJopx8HUB2x6ceQhQmyw10Ytq4
	BgHdv+8oBSnd5UKTxDaxyLJ+rkYxicRHo8Frt3rY0a5cUiNCJCVU5YqgZqIHGCiaIWql
	/4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=a8lKW2sIwRB22VufI0DHl1Zr6L9KCAF5mpTWiaBEdW0=;
	b=pU9gH7AqbAAU72w9Tojn1jBEREBYTrCboHr4hhJAzyEP89KuZNjkq9x6kcTYLXxWD+
	uHDtnWZDxJrLaalcerltrTGlRg3myLsCfjpfJSRB8DPol0Z0ojjZqBy+GmC21rcRQqrt
	FQ/JeEIyWoqGFKB4MDm6KCTtZ3iq1AWuhVgvzRVBz2AEzhtJN7QUQzubV32iKwODnN9E
	jcbFPpuE4EjGmxgI0YsGFlgTnKGgYtZ+KgEzy/thgrfFvUpWfwxnW1wfayZIfxXuvFCc
	jVwn7w42stJootJ9V7gb+t2hZhiSfQnCzm6tC8t81NTqSCpAoMam7sLMr6biXLLEHESO
	feIA==
X-Gm-Message-State: ANhLgQ29Hi4Z53ebboX7duSMmfdRuc5vvgpbKLOQJboPIZcLby5YcNYg
	1KH1Zk1k6tFek+9Y+FKTvOniyadr
X-Google-Smtp-Source: ADFU+vv7MZ+PSQ75IKVtnlme9FBEYAXl2AlUaLby3ZCza4FUmTFmZ09kHeB3R6ZOOzDFgLDF7xyEHA==
X-Received: by 2002:a17:90a:7f93:: with SMTP id
	m19mr20079177pjl.92.1584295931730; 
	Sun, 15 Mar 2020 11:12:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.10
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:53 -0700
Message-Id: <62fffe05ff3fd69ed7bb4d23748035b74445dcf6.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 11/16] dhcp: Fix REQUIRE(ctx->running) assertion triggered on SIGTERM/SIGINT
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:11 -0000

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Closed a small window of time between the installation of graceful
shutdown signal handlers and application context startup, during which
the receipt of shutdown signal would cause a REQUIRE() assertion to
occur.  Note this issue is only visible when compiling with
ENABLE_GENTLE_SHUTDOWN defined.

Reference:
https://gitlab.isc.org/isc-projects/dhcp/issues/53

Upstream patches:
https://gitlab.isc.org/isc-projects/dhcp/commit/ce117de7a1ed3c4911b4009c1cc23fba85370a26
https://gitlab.isc.org/isc-projects/dhcp/commit/dbd36dfa82956b53683462afadfabb1b33fa3dd1
https://gitlab.isc.org/isc-projects/dhcp/commit/95944cab6035d20be270eec01254c7bb867ec705

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...s-running-prior-to-calling-isc_app_c.patch | 165 ++++++++++++++++++
 ...ed-shutdown-log-statment-to-dhcrelay.patch |  29 +++
 .../dhcp/0003-Addressed-review-comment.patch  |  31 ++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb  |   3 +
 4 files changed, 228 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-Ensure-context-is-running-prior-to-calling-isc_app_c.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0002-Added-shutdown-log-statment-to-dhcrelay.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0003-Addressed-review-comment.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-Ensure-context-is-running-prior-to-calling-isc_app_c.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-Ensure-context-is-running-prior-to-calling-isc_app_c.patch
new file mode 100644
index 0000000000..34b2ae1e5c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-Ensure-context-is-running-prior-to-calling-isc_app_c.patch
@@ -0,0 +1,165 @@
+From f369dbb9e67eb5ef336944af63039b6d8f838384 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Thu, 12 Sep 2019 10:35:46 -0400
+Subject: [PATCH 1/3] Ensure context is running prior to calling
+ isc_app_ctxsuspend
+
+Add a release note.
+
+includes/omapip/isclib.h
+    Added actx_running flag to global context, dhcp_gbl_ctx
+
+omapip/isclib.c
+    set_ctx_running() - new function used as the ctxonrun callback
+
+    dhcp_context_create() - installs set_ctx_running callback
+
+    dhcp_signal_handler() - modified to use act_running flag to
+    determine is context is running and should be suspended
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/dhcp.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ RELNOTES                 |  7 +++++
+ includes/omapip/isclib.h |  3 ++-
+ omapip/isclib.c          | 57 +++++++++++++++++++++++++++++++++-------
+ 3 files changed, 57 insertions(+), 10 deletions(-)
+
+diff --git a/RELNOTES b/RELNOTES
+index f10305d..1730473 100644
+--- a/RELNOTES
++++ b/RELNOTES
+@@ -6,6 +6,13 @@
+ 
+                               NEW FEATURES
+ 
++- Closed a small window of time between the installation of graceful
++  shutdown signal handlers and application context startup, during which
++  the receipt of shutdown signal would cause a REQUIRE() assertion to
++  occur.  Note this issue is only visible when compiling with
++  ENABLE_GENTLE_SHUTDOWN defined.
++  [Gitlab #53,!18   git TBD]
++
+ Please note that that ISC DHCP is now licensed under the Mozilla Public License,
+ MPL 2.0. Please see https://www.mozilla.org/en-US/MPL/2.0/ to read the MPL 2.0
+ license terms.
+diff --git a/includes/omapip/isclib.h b/includes/omapip/isclib.h
+index 6c20584..af6a6fc 100644
+--- a/includes/omapip/isclib.h
++++ b/includes/omapip/isclib.h
+@@ -94,7 +94,8 @@
+ typedef struct dhcp_context {
+ 	isc_mem_t	*mctx;
+ 	isc_appctx_t	*actx;
+-	int              actx_started;
++	int              actx_started; // ISC_TRUE if ctxstart has been called
++	int              actx_running; // ISC_TRUE if ctxrun has been called
+ 	isc_taskmgr_t	*taskmgr;
+ 	isc_task_t	*task;
+ 	isc_socketmgr_t *socketmgr;
+diff --git a/omapip/isclib.c b/omapip/isclib.c
+index ce4b4a1..73e017c 100644
+--- a/omapip/isclib.c
++++ b/omapip/isclib.c
+@@ -134,6 +134,35 @@ handle_signal(int sig, void (*handler)(int)) {
+ 	}
+ }
+ 
++/* Callback passed to isc_app_ctxonrun
++ *
++ * BIND9 context code will invoke this handler once the context has
++ * entered the running state.  We use it to set a global marker so that
++ * we can tell if the context is running.  Several of the isc_app_
++ * calls REQUIRE that the context is running and we need a way to
++ * know that.
++ *
++ * We also check to see if we received a shutdown signal prior to
++ * the context entering the run state.  If we did, then we can just
++ * simply shut the context down now.  This closes the relatively
++ * small window between start up and entering run via the call
++ * to dispatch().
++ *
++ */
++static void
++set_ctx_running(isc_task_t *task, isc_event_t *event) {
++        task = task; // unused;
++	dhcp_gbl_ctx.actx_running = ISC_TRUE;
++
++	if (shutdown_signal) {
++		// We got signaled shutdown before we entered running state.
++		// Now that we've reached running state, shut'er down.
++		isc_app_ctxsuspend(dhcp_gbl_ctx.actx);
++	}
++
++        isc_event_free(&event);
++}
++
+ isc_result_t
+ dhcp_context_create(int flags,
+ 		    struct in_addr  *local4,
+@@ -141,6 +170,9 @@ dhcp_context_create(int flags,
+ 	isc_result_t result;
+ 
+ 	if ((flags & DHCP_CONTEXT_PRE_DB) != 0) {
++		dhcp_gbl_ctx.actx_started = ISC_FALSE;
++		dhcp_gbl_ctx.actx_running = ISC_FALSE;
++
+ 		/*
+ 		 * Set up the error messages, this isn't the right place
+ 		 * for this call but it is convienent for now.
+@@ -204,15 +236,24 @@ dhcp_context_create(int flags,
+ 		if (result != ISC_R_SUCCESS)
+ 			goto cleanup;
+ 
+-		result = isc_task_create(dhcp_gbl_ctx.taskmgr, 0, &dhcp_gbl_ctx.task);
++		result = isc_task_create(dhcp_gbl_ctx.taskmgr, 0,
++					 &dhcp_gbl_ctx.task);
+ 		if (result != ISC_R_SUCCESS)
+ 			goto cleanup;
+ 
+ 		result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
+ 		if (result != ISC_R_SUCCESS)
+-			return (result);
++			goto cleanup;
++
+ 		dhcp_gbl_ctx.actx_started = ISC_TRUE;
+ 
++		// Install the onrun callback.
++		result = isc_app_ctxonrun(dhcp_gbl_ctx.actx, dhcp_gbl_ctx.mctx,
++					  dhcp_gbl_ctx.task, set_ctx_running,
++					  dhcp_gbl_ctx.actx);
++		if (result != ISC_R_SUCCESS)
++			goto cleanup;
++
+ 		/* Not all OSs support suppressing SIGPIPE through socket
+ 		 * options, so set the sigal action to be ignore.  This allows
+ 		 * broken connections to fail gracefully with EPIPE on writes */
+@@ -335,19 +376,17 @@ isclib_make_dst_key(char          *inname,
+  * @param signal signal code that we received
+  */
+ void dhcp_signal_handler(int signal) {
+-	isc_appctx_t *ctx = dhcp_gbl_ctx.actx;
+-	int prev = shutdown_signal;
+-
+-	if (prev != 0) {
++	if (shutdown_signal != 0) {
+ 		/* Already in shutdown. */
+ 		return;
+ 	}
++
+ 	/* Possible race but does it matter? */
+ 	shutdown_signal = signal;
+ 
+-	/* Use reload (aka suspend) for easier dispatch() reenter. */
+-	if (ctx && ctx->methods && ctx->methods->ctxsuspend) {
+-		(void) isc_app_ctxsuspend(ctx);
++	/* If the application context is running tell it to shut down */
++	if (dhcp_gbl_ctx.actx_running == ISC_TRUE) {
++		(void) isc_app_ctxsuspend(dhcp_gbl_ctx.actx);
+ 	}
+ }
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0002-Added-shutdown-log-statment-to-dhcrelay.patch b/meta/recipes-connectivity/dhcp/dhcp/0002-Added-shutdown-log-statment-to-dhcrelay.patch
new file mode 100644
index 0000000000..78b2b74f45
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0002-Added-shutdown-log-statment-to-dhcrelay.patch
@@ -0,0 +1,29 @@
+From adcd34ae1f56b16d7e9696d980332b4cf6c7ce91 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Fri, 13 Sep 2019 15:03:31 -0400
+Subject: [PATCH 2/3] Added shutdown log statment to dhcrelay
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/dhcp.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ relay/dhcrelay.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/relay/dhcrelay.c b/relay/dhcrelay.c
+index d8caaaf..4bd1d47 100644
+--- a/relay/dhcrelay.c
++++ b/relay/dhcrelay.c
+@@ -2076,6 +2076,9 @@ dhcp_set_control_state(control_object_state_t oldstate,
+ 	if (newstate != server_shutdown)
+ 		return ISC_R_SUCCESS;
+ 
++	/* Log shutdown on signal. */
++	log_info("Received signal %d, initiating shutdown.", shutdown_signal);
++
+ 	if (no_pid_file == ISC_FALSE)
+ 		(void) unlink(path_dhcrelay_pid);
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0003-Addressed-review-comment.patch b/meta/recipes-connectivity/dhcp/dhcp/0003-Addressed-review-comment.patch
new file mode 100644
index 0000000000..a51b6cf526
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0003-Addressed-review-comment.patch
@@ -0,0 +1,31 @@
+From e4b54b4d676783152d487103714cba2913661ef8 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Wed, 6 Nov 2019 15:53:50 -0500
+Subject: [PATCH 3/3] Addressed review comment.
+
+omapip/isclib.c
+    Added use of IGNORE_UNUSED()
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/dhcp.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ omapip/isclib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/omapip/isclib.c b/omapip/isclib.c
+index 73e017c..1d52463 100644
+--- a/omapip/isclib.c
++++ b/omapip/isclib.c
+@@ -151,7 +151,7 @@ handle_signal(int sig, void (*handler)(int)) {
+  */
+ static void
+ set_ctx_running(isc_task_t *task, isc_event_t *event) {
+-        task = task; // unused;
++    IGNORE_UNUSED(task);
+ 	dhcp_gbl_ctx.actx_running = ISC_TRUE;
+ 
+ 	if (shutdown_signal) {
+-- 
+2.23.0
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index 275961a603..ddc8b60254 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -11,6 +11,9 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0013-fixup_use_libbind.patch \
             file://0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch \
             file://0001-Fix-a-NSUPDATE-compiling-issue.patch \
+            file://0001-Ensure-context-is-running-prior-to-calling-isc_app_c.patch \
+            file://0002-Added-shutdown-log-statment-to-dhcrelay.patch \
+            file://0003-Addressed-review-comment.patch \
 "
 
 SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
-- 
2.17.1


