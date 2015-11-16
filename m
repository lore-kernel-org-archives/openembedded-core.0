Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2E976E70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:39:45 +0000 (UTC)
Received: by qkas77 with SMTP id s77so109380982qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:organization:content-type:content-transfer-encoding;
	bh=ZLOPbI6pIMuDZtCj4OK3aMiP4HcylRx9V2zUCO17218=;
	b=Rnqlkf18eTtEoB/j+5ezQqi2r1P7DSCxthNJxyIF+1ipAG+++j7nGr9c1SXmGU0erY
	H+d5fRDY2sYQzO8fcsEaRwp0THolMaRT8/f3ltb0a5sk5NuVepoN68v9ChWmeBZXynGT
	EYO3KiI6bgWYqTkw5QMopT07QllOq20soiauyRDqOnUn8Wrmhvap8isEZVOyRYj8oMCK
	7gvM70V/kJRrez12NRvJR9LMPnZhSW/HR0BXUkttP6OaIkAuLK64WLlp730W7TqtimVj
	tr5gcMfTnBvx599y7QHtgZBXvQKTYYNfSHUAsAX1Co8tzAacVgHgZimdr9zgsjRStBrP
	MuCQ==
X-Received: by 10.140.34.204 with SMTP id l70mr35022845qgl.24.1447673985199;
	Mon, 16 Nov 2015 03:39:45 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	g84sm6041145qkb.10.2015.11.16.03.39.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 03:39:44 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 Nov 2015 09:39:39 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 09:39:31 -0200
Message-Id: <1447673972-31812-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
References: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 16 Nov 2015 11:39:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Add PV field (thanks to Nathan Lynch)

 ...-sessiond-disable-match-app-event-by-name.patch |  58 ---
 .../lttng/lttng-tools/extern-decls.patch           | 442 ---------------------
 ...ng-tools-Fix-live-timer-calculation-error.patch |  42 --
 .../recipes-kernel/lttng/lttng-tools/runtest.patch |  52 ---
 .../{lttng-tools_2.6.0.bb => lttng-tools_git.bb}   |  11 +-
 5 files changed, 4 insertions(+), 601 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb => lttng-tools_git.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
deleted file mode 100644
index ac1f34b..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 700c5a9d4dc7b552926b8ddcbba91cc13312aba0 Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Wed, 9 Sep 2015 17:08:20 -0400
-Subject: [PATCH] Fix: sessiond: disable: match app event by name
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The use of a simple lookup and match on event name is insufficient
-to identify the corresponding ust app event.
-
-Fixes #914
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
-
-Upstream-Status: Backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/bin/lttng-sessiond/ust-app.c |   10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/bin/lttng-sessiond/ust-app.c b/src/bin/lttng-sessiond/ust-app.c
-index 4066b06..53a6f93 100644
---- a/src/bin/lttng-sessiond/ust-app.c
-+++ b/src/bin/lttng-sessiond/ust-app.c
-@@ -3873,7 +3873,7 @@ int ust_app_disable_event_glb(struct ltt_ust_session *usess,
- {
- 	int ret = 0;
- 	struct lttng_ht_iter iter, uiter;
--	struct lttng_ht_node_str *ua_chan_node, *ua_event_node;
-+	struct lttng_ht_node_str *ua_chan_node;
- 	struct ust_app *app;
- 	struct ust_app_session *ua_sess;
- 	struct ust_app_channel *ua_chan;
-@@ -3910,14 +3910,14 @@ int ust_app_disable_event_glb(struct ltt_ust_session *usess,
- 		}
- 		ua_chan = caa_container_of(ua_chan_node, struct ust_app_channel, node);
- 
--		lttng_ht_lookup(ua_chan->events, (void *)uevent->attr.name, &uiter);
--		ua_event_node = lttng_ht_iter_get_node_str(&uiter);
--		if (ua_event_node == NULL) {
-+		ua_event = find_ust_app_event(ua_chan->events, uevent->attr.name,
-+				uevent->filter, uevent->attr.loglevel,
-+				uevent->exclusion);
-+		if (ua_event == NULL) {
- 			DBG2("Event %s not found in channel %s for app pid %d."
- 					"Skipping", uevent->attr.name, uchan->name, app->pid);
- 			continue;
- 		}
--		ua_event = caa_container_of(ua_event_node, struct ust_app_event, node);
- 
- 		ret = disable_ust_app_event(ua_sess, ua_event, app);
- 		if (ret < 0) {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch b/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
deleted file mode 100644
index 199ef57..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
+++ /dev/null
@@ -1,442 +0,0 @@
-This make the declarations to be extern so they dont end up
-in duplicates in data.rel.ro sections
-
-avoid errors like
-
-| ../../../src/common/.libs/libcommon.a(mi-lttng.o):(.data.rel.ro.local+0x0): multiple definition of `mi_lttng_element_snapshots'
-| commands/enable_events.o:(.bss+0x48): first defined here
-| collect2: error: ld returned 1 exit status
-| Makefile:502: recipe for target 'lttng' failed
-| make[3]: *** [lttng] Error 1
-
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/src/common/config/config-session-abi.h
-===================================================================
---- git.orig/src/common/config/config-session-abi.h
-+++ git/src/common/config/config-session-abi.h
-@@ -18,95 +18,95 @@
- #ifndef CONFIG_SESSION_INTERNAL_H
- #define CONFIG_SESSION_INTERNAL_H
- 
--const char * const config_element_channel;
--const char * const config_element_channels;
--const char * const config_element_domain;
--const char * const config_element_domains;
--const char * const config_element_event;
--const char * const config_element_events;
--const char * const config_element_context;
--const char * const config_element_contexts;
--const char * const config_element_attributes;
--const char * const config_element_exclusion;
--const char * const config_element_exclusions;
--const char * const config_element_function_attributes;
--const char * const config_element_probe_attributes;
--const char * const config_element_symbol_name;
--const char * const config_element_address;
--const char * const config_element_offset;
--const char * const config_element_name;
--const char * const config_element_enabled;
--const char * const config_element_overwrite_mode;
--const char * const config_element_subbuf_size;
--const char * const config_element_num_subbuf;
--const char * const config_element_switch_timer_interval;
--const char * const config_element_read_timer_interval;
--const char * const config_element_output;
--const char * const config_element_output_type;
--const char * const config_element_tracefile_size;
--const char * const config_element_tracefile_count;
--const char * const config_element_live_timer_interval;
--const char * const config_element_type;
--const char * const config_element_buffer_type;
--const char * const config_element_session;
--const char * const config_element_sessions;
--const char * const config_element_perf;
--const char * const config_element_config;
--const char * const config_element_started;
--const char * const config_element_snapshot_mode;
--const char * const config_element_loglevel;
--const char * const config_element_loglevel_type;
--const char * const config_element_filter;
--const char * const config_element_snapshot_outputs;
--const char * const config_element_consumer_output;
--const char * const config_element_destination;
--const char * const config_element_path;
--const char * const config_element_net_output;
--const char * const config_element_control_uri;
--const char * const config_element_data_uri;
--const char * const config_element_max_size;
--
--const char * const config_domain_type_kernel;
--const char * const config_domain_type_ust;
--const char * const config_domain_type_jul;
--const char * const config_domain_type_log4j;
--
--const char * const config_buffer_type_per_pid;
--const char * const config_buffer_type_per_uid;
--const char * const config_buffer_type_global;
--
--const char * const config_overwrite_mode_discard;
--const char * const config_overwrite_mode_overwrite;
--
--const char * const config_output_type_splice;
--const char * const config_output_type_mmap;
--
--const char * const config_loglevel_type_all;
--const char * const config_loglevel_type_range;
--const char * const config_loglevel_type_single;
--
--const char * const config_event_type_all;
--const char * const config_event_type_tracepoint;
--const char * const config_event_type_probe;
--const char * const config_event_type_function;
--const char * const config_event_type_function_entry;
--const char * const config_event_type_noop;
--const char * const config_event_type_syscall;
--const char * const config_event_type_kprobe;
--const char * const config_event_type_kretprobe;
--
--const char * const config_event_context_pid;
--const char * const config_event_context_procname;
--const char * const config_event_context_prio;
--const char * const config_event_context_nice;
--const char * const config_event_context_vpid;
--const char * const config_event_context_tid;
--const char * const config_event_context_vtid;
--const char * const config_event_context_ppid;
--const char * const config_event_context_vppid;
--const char * const config_event_context_pthread_id;
--const char * const config_event_context_hostname;
--const char * const config_event_context_ip;
--const char * const config_event_context_perf_thread_counter;
-+extern const char * const config_element_channel;
-+extern const char * const config_element_channels;
-+extern const char * const config_element_domain;
-+extern const char * const config_element_domains;
-+extern const char * const config_element_event;
-+extern const char * const config_element_events;
-+extern const char * const config_element_context;
-+extern const char * const config_element_contexts;
-+extern const char * const config_element_attributes;
-+extern const char * const config_element_exclusion;
-+extern const char * const config_element_exclusions;
-+extern const char * const config_element_function_attributes;
-+extern const char * const config_element_probe_attributes;
-+extern const char * const config_element_symbol_name;
-+extern const char * const config_element_address;
-+extern const char * const config_element_offset;
-+extern const char * const config_element_name;
-+extern const char * const config_element_enabled;
-+extern const char * const config_element_overwrite_mode;
-+extern const char * const config_element_subbuf_size;
-+extern const char * const config_element_num_subbuf;
-+extern const char * const config_element_switch_timer_interval;
-+extern const char * const config_element_read_timer_interval;
-+extern const char * const config_element_output;
-+extern const char * const config_element_output_type;
-+extern const char * const config_element_tracefile_size;
-+extern const char * const config_element_tracefile_count;
-+extern const char * const config_element_live_timer_interval;
-+extern const char * const config_element_type;
-+extern const char * const config_element_buffer_type;
-+extern const char * const config_element_session;
-+extern const char * const config_element_sessions;
-+extern const char * const config_element_perf;
-+extern const char * const config_element_config;
-+extern const char * const config_element_started;
-+extern const char * const config_element_snapshot_mode;
-+extern const char * const config_element_loglevel;
-+extern const char * const config_element_loglevel_type;
-+extern const char * const config_element_filter;
-+extern const char * const config_element_snapshot_outputs;
-+extern const char * const config_element_consumer_output;
-+extern const char * const config_element_destination;
-+extern const char * const config_element_path;
-+extern const char * const config_element_net_output;
-+extern const char * const config_element_control_uri;
-+extern const char * const config_element_data_uri;
-+extern const char * const config_element_max_size;
-+
-+extern const char * const config_domain_type_kernel;
-+extern const char * const config_domain_type_ust;
-+extern const char * const config_domain_type_jul;
-+extern const char * const config_domain_type_log4j;
-+
-+extern const char * const config_buffer_type_per_pid;
-+extern const char * const config_buffer_type_per_uid;
-+extern const char * const config_buffer_type_global;
-+
-+extern const char * const config_overwrite_mode_discard;
-+extern const char * const config_overwrite_mode_overwrite;
-+
-+extern const char * const config_output_type_splice;
-+extern const char * const config_output_type_mmap;
-+
-+extern const char * const config_loglevel_type_all;
-+extern const char * const config_loglevel_type_range;
-+extern const char * const config_loglevel_type_single;
-+
-+extern const char * const config_event_type_all;
-+extern const char * const config_event_type_tracepoint;
-+extern const char * const config_event_type_probe;
-+extern const char * const config_event_type_function;
-+extern const char * const config_event_type_function_entry;
-+extern const char * const config_event_type_noop;
-+extern const char * const config_event_type_syscall;
-+extern const char * const config_event_type_kprobe;
-+extern const char * const config_event_type_kretprobe;
-+
-+extern const char * const config_event_context_pid;
-+extern const char * const config_event_context_procname;
-+extern const char * const config_event_context_prio;
-+extern const char * const config_event_context_nice;
-+extern const char * const config_event_context_vpid;
-+extern const char * const config_event_context_tid;
-+extern const char * const config_event_context_vtid;
-+extern const char * const config_event_context_ppid;
-+extern const char * const config_event_context_vppid;
-+extern const char * const config_event_context_pthread_id;
-+extern const char * const config_event_context_hostname;
-+extern const char * const config_event_context_ip;
-+extern const char * const config_event_context_perf_thread_counter;
- 
- #endif /* CONFIG_SESSION_INTERNAL_H */
-Index: git/src/common/mi-lttng.h
-===================================================================
---- git.orig/src/common/mi-lttng.h
-+++ git/src/common/mi-lttng.h
-@@ -49,133 +49,133 @@ struct mi_lttng_version {
- };
- 
- /* Strings related to command */
--const char * const mi_lttng_element_command;
--const char * const mi_lttng_element_command_action;
--const char * const mi_lttng_element_command_add_context;
--const char * const mi_lttng_element_command_calibrate;
--const char * const mi_lttng_element_command_create;
--const char * const mi_lttng_element_command_destroy;
--const char * const mi_lttng_element_command_disable_channel;
--const char * const mi_lttng_element_command_disable_event;
--const char * const mi_lttng_element_command_enable_channels;
--const char * const mi_lttng_element_command_enable_event;
--const char * const mi_lttng_element_command_list;
--const char * const mi_lttng_element_command_load;
--const char * const mi_lttng_element_command_name;
--const char * const mi_lttng_element_command_output;
--const char * const mi_lttng_element_command_save;
--const char * const mi_lttng_element_command_set_session;
--const char * const mi_lttng_element_command_snapshot;
--const char * const mi_lttng_element_command_snapshot_add;
--const char * const mi_lttng_element_command_snapshot_del;
--const char * const mi_lttng_element_command_snapshot_list;
--const char * const mi_lttng_element_command_snapshot_record;
--const char * const mi_lttng_element_command_start;
--const char * const mi_lttng_element_command_stop;
--const char * const mi_lttng_element_command_success;
--const char * const mi_lttng_element_command_version;
-+extern const char * const mi_lttng_element_command;
-+extern const char * const mi_lttng_element_command_action;
-+extern const char * const mi_lttng_element_command_add_context;
-+extern const char * const mi_lttng_element_command_calibrate;
-+extern const char * const mi_lttng_element_command_create;
-+extern const char * const mi_lttng_element_command_destroy;
-+extern const char * const mi_lttng_element_command_disable_channel;
-+extern const char * const mi_lttng_element_command_disable_event;
-+extern const char * const mi_lttng_element_command_enable_channels;
-+extern const char * const mi_lttng_element_command_enable_event;
-+extern const char * const mi_lttng_element_command_list;
-+extern const char * const mi_lttng_element_command_load;
-+extern const char * const mi_lttng_element_command_name;
-+extern const char * const mi_lttng_element_command_output;
-+extern const char * const mi_lttng_element_command_save;
-+extern const char * const mi_lttng_element_command_set_session;
-+extern const char * const mi_lttng_element_command_snapshot;
-+extern const char * const mi_lttng_element_command_snapshot_add;
-+extern const char * const mi_lttng_element_command_snapshot_del;
-+extern const char * const mi_lttng_element_command_snapshot_list;
-+extern const char * const mi_lttng_element_command_snapshot_record;
-+extern const char * const mi_lttng_element_command_start;
-+extern const char * const mi_lttng_element_command_stop;
-+extern const char * const mi_lttng_element_command_success;
-+extern const char * const mi_lttng_element_command_version;
- 
- /* Strings related to version command */
--const char * const mi_lttng_element_version;
--const char * const mi_lttng_element_version_commit;
--const char * const mi_lttng_element_version_description;
--const char * const mi_lttng_element_version_license;
--const char * const mi_lttng_element_version_major;
--const char * const mi_lttng_element_version_minor;
--const char * const mi_lttng_element_version_patch_level;
--const char * const mi_lttng_element_version_str;
--const char * const mi_lttng_element_version_web;
-+extern const char * const mi_lttng_element_version;
-+extern const char * const mi_lttng_element_version_commit;
-+extern const char * const mi_lttng_element_version_description;
-+extern const char * const mi_lttng_element_version_license;
-+extern const char * const mi_lttng_element_version_major;
-+extern const char * const mi_lttng_element_version_minor;
-+extern const char * const mi_lttng_element_version_patch_level;
-+extern const char * const mi_lttng_element_version_str;
-+extern const char * const mi_lttng_element_version_web;
- 
- /* String related to a lttng_event_field */
--const char * const mi_lttng_element_event_field;
--const char * const mi_lttng_element_event_fields;
-+extern const char * const mi_lttng_element_event_field;
-+extern const char * const mi_lttng_element_event_fields;
- 
- /* String related to lttng_event_context */
--const char * const mi_lttng_context_type_perf_counter;
--const char * const mi_lttng_context_type_perf_cpu_counter;
--const char * const mi_lttng_context_type_perf_thread_counter;
-+extern const char * const mi_lttng_context_type_perf_counter;
-+extern const char * const mi_lttng_context_type_perf_cpu_counter;
-+extern const char * const mi_lttng_context_type_perf_thread_counter;
- 
- /* String related to lttng_event_perf_counter_ctx */
--const char * const mi_lttng_element_perf_counter_context;
-+extern const char * const mi_lttng_element_perf_counter_context;
- 
- /* Strings related to pid */
--const char * const mi_lttng_element_pids;
--const char * const mi_lttng_element_pid;
--const char * const mi_lttng_element_pid_id;
-+extern const char * const mi_lttng_element_pids;
-+extern const char * const mi_lttng_element_pid;
-+extern const char * const mi_lttng_element_pid_id;
- 
- /* Strings related to save command */
--const char * const mi_lttng_element_save;
-+extern const char * const mi_lttng_element_save;
- 
- /* Strings related to load command */
--const char * const mi_lttng_element_load;
-+extern const char * const mi_lttng_element_load;
- 
- /* General element of mi_lttng */
--const char * const mi_lttng_element_empty;
--const char * const mi_lttng_element_id;
--const char * const mi_lttng_element_nowrite;
--const char * const mi_lttng_element_success;
--const char * const mi_lttng_element_type_enum;
--const char * const mi_lttng_element_type_float;
--const char * const mi_lttng_element_type_integer;
--const char * const mi_lttng_element_type_other;
--const char * const mi_lttng_element_type_string;
-+extern const char * const mi_lttng_element_empty;
-+extern const char * const mi_lttng_element_id;
-+extern const char * const mi_lttng_element_nowrite;
-+extern const char * const mi_lttng_element_success;
-+extern const char * const mi_lttng_element_type_enum;
-+extern const char * const mi_lttng_element_type_float;
-+extern const char * const mi_lttng_element_type_integer;
-+extern const char * const mi_lttng_element_type_other;
-+extern const char * const mi_lttng_element_type_string;
- 
- /* String related to loglevel */
--const char * const mi_lttng_loglevel_str_alert;
--const char * const mi_lttng_loglevel_str_crit;
--const char * const mi_lttng_loglevel_str_debug;
--const char * const mi_lttng_loglevel_str_debug_function;
--const char * const mi_lttng_loglevel_str_debug_line;
--const char * const mi_lttng_loglevel_str_debug_module;
--const char * const mi_lttng_loglevel_str_debug_process;
--const char * const mi_lttng_loglevel_str_debug_program;
--const char * const mi_lttng_loglevel_str_debug_system;
--const char * const mi_lttng_loglevel_str_debug_unit;
--const char * const mi_lttng_loglevel_str_emerg;
--const char * const mi_lttng_loglevel_str_err;
--const char * const mi_lttng_loglevel_str_info;
--const char * const mi_lttng_loglevel_str_notice;
--const char * const mi_lttng_loglevel_str_unknown;
--const char * const mi_lttng_loglevel_str_warning;
-+extern const char * const mi_lttng_loglevel_str_alert;
-+extern const char * const mi_lttng_loglevel_str_crit;
-+extern const char * const mi_lttng_loglevel_str_debug;
-+extern const char * const mi_lttng_loglevel_str_debug_function;
-+extern const char * const mi_lttng_loglevel_str_debug_line;
-+extern const char * const mi_lttng_loglevel_str_debug_module;
-+extern const char * const mi_lttng_loglevel_str_debug_process;
-+extern const char * const mi_lttng_loglevel_str_debug_program;
-+extern const char * const mi_lttng_loglevel_str_debug_system;
-+extern const char * const mi_lttng_loglevel_str_debug_unit;
-+extern const char * const mi_lttng_loglevel_str_emerg;
-+extern const char * const mi_lttng_loglevel_str_err;
-+extern const char * const mi_lttng_loglevel_str_info;
-+extern const char * const mi_lttng_loglevel_str_notice;
-+extern const char * const mi_lttng_loglevel_str_unknown;
-+extern const char * const mi_lttng_loglevel_str_warning;
- 
- /* String related to loglevel JUL */
--const char * const mi_lttng_loglevel_str_jul_all;
--const char * const mi_lttng_loglevel_str_jul_config;
--const char * const mi_lttng_loglevel_str_jul_fine;
--const char * const mi_lttng_loglevel_str_jul_finer;
--const char * const mi_lttng_loglevel_str_jul_finest;
--const char * const mi_lttng_loglevel_str_jul_info;
--const char * const mi_lttng_loglevel_str_jul_off;
--const char * const mi_lttng_loglevel_str_jul_severe;
--const char * const mi_lttng_loglevel_str_jul_warning;
-+extern const char * const mi_lttng_loglevel_str_jul_all;
-+extern const char * const mi_lttng_loglevel_str_jul_config;
-+extern const char * const mi_lttng_loglevel_str_jul_fine;
-+extern const char * const mi_lttng_loglevel_str_jul_finer;
-+extern const char * const mi_lttng_loglevel_str_jul_finest;
-+extern const char * const mi_lttng_loglevel_str_jul_info;
-+extern const char * const mi_lttng_loglevel_str_jul_off;
-+extern const char * const mi_lttng_loglevel_str_jul_severe;
-+extern const char * const mi_lttng_loglevel_str_jul_warning;
- 
- /* String related to loglevel Log4j */
--const char * const mi_lttng_loglevel_str_log4j_off;
--const char * const mi_lttng_loglevel_str_log4j_fatal;
--const char * const mi_lttng_loglevel_str_log4j_error;
--const char * const mi_lttng_loglevel_str_log4j_warn;
--const char * const mi_lttng_loglevel_str_log4j_info;
--const char * const mi_lttng_loglevel_str_log4j_debug;
--const char * const mi_lttng_loglevel_str_log4j_trace;
--const char * const mi_lttng_loglevel_str_log4j_all;
-+extern const char * const mi_lttng_loglevel_str_log4j_off;
-+extern const char * const mi_lttng_loglevel_str_log4j_fatal;
-+extern const char * const mi_lttng_loglevel_str_log4j_error;
-+extern const char * const mi_lttng_loglevel_str_log4j_warn;
-+extern const char * const mi_lttng_loglevel_str_log4j_info;
-+extern const char * const mi_lttng_loglevel_str_log4j_debug;
-+extern const char * const mi_lttng_loglevel_str_log4j_trace;
-+extern const char * const mi_lttng_loglevel_str_log4j_all;
- 
- /* String related to loglevel type */
--const char * const mi_lttng_loglevel_type_all;
--const char * const mi_lttng_loglevel_type_range;
--const char * const mi_lttng_loglevel_type_single;
--const char * const mi_lttng_loglevel_type_unknown;
-+extern const char * const mi_lttng_loglevel_type_all;
-+extern const char * const mi_lttng_loglevel_type_range;
-+extern const char * const mi_lttng_loglevel_type_single;
-+extern const char * const mi_lttng_loglevel_type_unknown;
- 
- /* Sting related to lttng_calibrate */
--const char * const mi_lttng_element_calibrate;
--const char * const mi_lttng_element_calibrate_function;
-+extern const char * const mi_lttng_element_calibrate;
-+extern const char * const mi_lttng_element_calibrate_function;
- 
- /* String related to a lttng_snapshot */
--const char * const mi_lttng_element_snapshot_ctrl_url;
--const char * const mi_lttng_element_snapshot_data_url;
--const char * const mi_lttng_element_snapshot_max_size;
--const char * const mi_lttng_element_snapshot_n_ptr;
--const char * const mi_lttng_element_snapshot_session_name;
--const char * const mi_lttng_element_snapshots;
-+extern const char * const mi_lttng_element_snapshot_ctrl_url;
-+extern const char * const mi_lttng_element_snapshot_data_url;
-+extern const char * const mi_lttng_element_snapshot_max_size;
-+extern const char * const mi_lttng_element_snapshot_n_ptr;
-+extern const char * const mi_lttng_element_snapshot_session_name;
-+extern const char * const mi_lttng_element_snapshots;
- 
- /* Utility string function  */
- const char *mi_lttng_loglevel_string(int value, enum lttng_domain_type domain);
diff --git a/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch b/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
deleted file mode 100644
index 4719d95..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 161496fbe1465817a77a50a1172734dae81a13ef Mon Sep 17 00:00:00 2001
-From: Mikael Beckius <mikael.beckius@windriver.com>
-Date: Tue, 12 May 2015 11:11:48 +0200
-Subject: [PATCH] lttng-tools: Fix live timer calculation error
-
-There is an calculation error for live timer. Variable switch_timer_interval is
-based on microsecond, and it is not right to assign switch_timer_interval mod
-1000000 to var tv_nsec which is based on nanosecond.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- src/common/consumer-timer.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/common/consumer-timer.c b/src/common/consumer-timer.c
-index 1408052..c6202ba 100644
---- a/src/common/consumer-timer.c
-+++ b/src/common/consumer-timer.c
-@@ -368,7 +368,7 @@ void consumer_timer_switch_start(struct lttng_consumer_channel *channel,
- 	channel->switch_timer_enabled = 1;
- 
- 	its.it_value.tv_sec = switch_timer_interval / 1000000;
--	its.it_value.tv_nsec = switch_timer_interval % 1000000;
-+	its.it_value.tv_nsec = (switch_timer_interval % 1000000) * 1000;
- 	its.it_interval.tv_sec = its.it_value.tv_sec;
- 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
- 
-@@ -425,7 +425,7 @@ void consumer_timer_live_start(struct lttng_consumer_channel *channel,
- 	channel->live_timer_enabled = 1;
- 
- 	its.it_value.tv_sec = live_timer_interval / 1000000;
--	its.it_value.tv_nsec = live_timer_interval % 1000000;
-+	its.it_value.tv_nsec = (live_timer_interval % 1000000) * 1000;
- 	its.it_interval.tv_sec = its.it_value.tv_sec;
- 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/runtest.patch b/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
deleted file mode 100644
index 545a5dc..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-diff --git a/Makefile.am b/Makefile.am
-index 584f59b..c2bcabd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -12,3 +12,9 @@ dist_doc_DATA = LICENSE \
- dist_noinst_DATA = CodingStyle
- 
- EXTRA_DIST = extras/lttng-bash_completion gpl-2.0.txt lgpl-2.1.txt
-+
-+install-ptest:
-+	cp -r $(srcdir)/tests $(DESTDIR)
-+	for m in $$(find $(DESTDIR)/tests -name Makefile); do \
-+          sed -i -e 's|^Makefile:|_Makefile:|' $$m; \
-+        done
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 6d5b00d..3774f9d 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,14 +1,17 @@
- SUBDIRS = utils regression unit stress
- 
--if USE_PYTHON
--check-am:
-+installcheck-am:
- 	./run.sh unit_tests
- 	./run.sh fast_regression
-+if USE_PYTHON
- 	./run.sh with_bindings_regression
--else
-+endif
-+
- check-am:
- 	./run.sh unit_tests
- 	./run.sh fast_regression
-+if USE_PYTHON
-+	./run.sh with_bindings_regression
- endif
- 
- dist_noinst_SCRIPTS = run.sh unit_tests fast_regression long_regression root_regression with_bindings_regression
-diff --git a/tests/run.sh b/tests/run.sh
-index c6c50fd..6455359 100755
---- a/tests/run.sh
-+++ b/tests/run.sh
-@@ -19,4 +19,7 @@
- 
- [ -z "$1" ] && echo "Error: No testlist. Please specify a testlist to run." && exit 1
- 
--prove --merge --exec '' - < $1
-+prove --merge -v --exec '' - < $1 | sed \
-+  -e 's|^ok \(.*\)|PASS: \1|' \
-+  -e 's|^not ok \(.*\)|FAIL: \1|' \
-+  | egrep -h 'PASS|FAIL'
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_git.bb
index 909acc3..37399b1 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 DEPENDS = "liburcu popt lttng-ust libxml2"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
-SRCREV = "d522c1f14285e2e8b10b7c0cd011847696ffe779"
+SRCREV = "d71e55a5f1f423eeaa47c08e5797e47ce8e825fb"
+PV = "2.7.0+git${SRCPV}"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
                  am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
@@ -23,13 +24,9 @@ PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python swig-
 PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
+SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
            file://runtest-2.4.0.patch \
-           file://extern-decls.patch \
-           file://run-ptest \
-           file://lttng-tools-Fix-live-timer-calculation-error.patch \
-           file://0001-Fix-sessiond-disable-match-app-event-by-name.patch \
-	  "
+           file://run-ptest"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.2


