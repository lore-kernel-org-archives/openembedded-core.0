Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 614816FF6B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 02:59:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB42xSLJ016342
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Dec 2015 18:59:29 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 3 Dec 2015 18:59:28 -0800
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
	<1447948114-30329-3-git-send-email-otavio@ossystems.com.br>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5661018E.1080501@windriver.com>
Date: Fri, 4 Dec 2015 10:59:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447948114-30329-3-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH v4 3/4] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Fri, 04 Dec 2015 02:59:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


It breaks when PACKAGECONFIG = "lttng-ust python":

PACKAGECONFIG = "lttng-ust python"

MACHINE = "qemux86"

bitbake lttng-tools

do_configure failed:

configure:6331: $? = 127
configure:6337: result: none
configure:6389: error: no suitable Python interpreter found


// Robert

On 11/19/2015 11:48 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v4:
> - Fix MIPS build error due missing SIGUNUSED definition (Ross Borton)
>
> Changes in v3:
> - Fix ptest packaging (thanks to Ross Borton)
>
> Changes in v2:
> - Add PV field (thanks to Nathan Lynch)
>
>   ...-sessiond-disable-match-app-event-by-name.patch |  58 ---
>   .../lttng/lttng-tools/extern-decls.patch           | 442 ---------------------
>   ...ng-tools-Fix-live-timer-calculation-error.patch |  42 --
>   .../lttng/lttng-tools/stop-using-SIGUNUSED.patch   |  51 +++
>   .../{lttng-tools_2.6.0.bb => lttng-tools_git.bb}   |  15 +-
>   5 files changed, 56 insertions(+), 552 deletions(-)
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
>   create mode 100644 meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
>   rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb => lttng-tools_git.bb} (85%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
> deleted file mode 100644
> index ac1f34b..0000000
> --- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 700c5a9d4dc7b552926b8ddcbba91cc13312aba0 Mon Sep 17 00:00:00 2001
> -From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> -Date: Wed, 9 Sep 2015 17:08:20 -0400
> -Subject: [PATCH] Fix: sessiond: disable: match app event by name
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The use of a simple lookup and match on event name is insufficient
> -to identify the corresponding ust app event.
> -
> -Fixes #914
> -
> -Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> -Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - src/bin/lttng-sessiond/ust-app.c |   10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/bin/lttng-sessiond/ust-app.c b/src/bin/lttng-sessiond/ust-app.c
> -index 4066b06..53a6f93 100644
> ---- a/src/bin/lttng-sessiond/ust-app.c
> -+++ b/src/bin/lttng-sessiond/ust-app.c
> -@@ -3873,7 +3873,7 @@ int ust_app_disable_event_glb(struct ltt_ust_session *usess,
> - {
> - 	int ret = 0;
> - 	struct lttng_ht_iter iter, uiter;
> --	struct lttng_ht_node_str *ua_chan_node, *ua_event_node;
> -+	struct lttng_ht_node_str *ua_chan_node;
> - 	struct ust_app *app;
> - 	struct ust_app_session *ua_sess;
> - 	struct ust_app_channel *ua_chan;
> -@@ -3910,14 +3910,14 @@ int ust_app_disable_event_glb(struct ltt_ust_session *usess,
> - 		}
> - 		ua_chan = caa_container_of(ua_chan_node, struct ust_app_channel, node);
> -
> --		lttng_ht_lookup(ua_chan->events, (void *)uevent->attr.name, &uiter);
> --		ua_event_node = lttng_ht_iter_get_node_str(&uiter);
> --		if (ua_event_node == NULL) {
> -+		ua_event = find_ust_app_event(ua_chan->events, uevent->attr.name,
> -+				uevent->filter, uevent->attr.loglevel,
> -+				uevent->exclusion);
> -+		if (ua_event == NULL) {
> - 			DBG2("Event %s not found in channel %s for app pid %d."
> - 					"Skipping", uevent->attr.name, uchan->name, app->pid);
> - 			continue;
> - 		}
> --		ua_event = caa_container_of(ua_event_node, struct ust_app_event, node);
> -
> - 		ret = disable_ust_app_event(ua_sess, ua_event, app);
> - 		if (ret < 0) {
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch b/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
> deleted file mode 100644
> index 199ef57..0000000
> --- a/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
> +++ /dev/null
> @@ -1,442 +0,0 @@
> -This make the declarations to be extern so they dont end up
> -in duplicates in data.rel.ro sections
> -
> -avoid errors like
> -
> -| ../../../src/common/.libs/libcommon.a(mi-lttng.o):(.data.rel.ro.local+0x0): multiple definition of `mi_lttng_element_snapshots'
> -| commands/enable_events.o:(.bss+0x48): first defined here
> -| collect2: error: ld returned 1 exit status
> -| Makefile:502: recipe for target 'lttng' failed
> -| make[3]: *** [lttng] Error 1
> -
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: git/src/common/config/config-session-abi.h
> -===================================================================
> ---- git.orig/src/common/config/config-session-abi.h
> -+++ git/src/common/config/config-session-abi.h
> -@@ -18,95 +18,95 @@
> - #ifndef CONFIG_SESSION_INTERNAL_H
> - #define CONFIG_SESSION_INTERNAL_H
> -
> --const char * const config_element_channel;
> --const char * const config_element_channels;
> --const char * const config_element_domain;
> --const char * const config_element_domains;
> --const char * const config_element_event;
> --const char * const config_element_events;
> --const char * const config_element_context;
> --const char * const config_element_contexts;
> --const char * const config_element_attributes;
> --const char * const config_element_exclusion;
> --const char * const config_element_exclusions;
> --const char * const config_element_function_attributes;
> --const char * const config_element_probe_attributes;
> --const char * const config_element_symbol_name;
> --const char * const config_element_address;
> --const char * const config_element_offset;
> --const char * const config_element_name;
> --const char * const config_element_enabled;
> --const char * const config_element_overwrite_mode;
> --const char * const config_element_subbuf_size;
> --const char * const config_element_num_subbuf;
> --const char * const config_element_switch_timer_interval;
> --const char * const config_element_read_timer_interval;
> --const char * const config_element_output;
> --const char * const config_element_output_type;
> --const char * const config_element_tracefile_size;
> --const char * const config_element_tracefile_count;
> --const char * const config_element_live_timer_interval;
> --const char * const config_element_type;
> --const char * const config_element_buffer_type;
> --const char * const config_element_session;
> --const char * const config_element_sessions;
> --const char * const config_element_perf;
> --const char * const config_element_config;
> --const char * const config_element_started;
> --const char * const config_element_snapshot_mode;
> --const char * const config_element_loglevel;
> --const char * const config_element_loglevel_type;
> --const char * const config_element_filter;
> --const char * const config_element_snapshot_outputs;
> --const char * const config_element_consumer_output;
> --const char * const config_element_destination;
> --const char * const config_element_path;
> --const char * const config_element_net_output;
> --const char * const config_element_control_uri;
> --const char * const config_element_data_uri;
> --const char * const config_element_max_size;
> --
> --const char * const config_domain_type_kernel;
> --const char * const config_domain_type_ust;
> --const char * const config_domain_type_jul;
> --const char * const config_domain_type_log4j;
> --
> --const char * const config_buffer_type_per_pid;
> --const char * const config_buffer_type_per_uid;
> --const char * const config_buffer_type_global;
> --
> --const char * const config_overwrite_mode_discard;
> --const char * const config_overwrite_mode_overwrite;
> --
> --const char * const config_output_type_splice;
> --const char * const config_output_type_mmap;
> --
> --const char * const config_loglevel_type_all;
> --const char * const config_loglevel_type_range;
> --const char * const config_loglevel_type_single;
> --
> --const char * const config_event_type_all;
> --const char * const config_event_type_tracepoint;
> --const char * const config_event_type_probe;
> --const char * const config_event_type_function;
> --const char * const config_event_type_function_entry;
> --const char * const config_event_type_noop;
> --const char * const config_event_type_syscall;
> --const char * const config_event_type_kprobe;
> --const char * const config_event_type_kretprobe;
> --
> --const char * const config_event_context_pid;
> --const char * const config_event_context_procname;
> --const char * const config_event_context_prio;
> --const char * const config_event_context_nice;
> --const char * const config_event_context_vpid;
> --const char * const config_event_context_tid;
> --const char * const config_event_context_vtid;
> --const char * const config_event_context_ppid;
> --const char * const config_event_context_vppid;
> --const char * const config_event_context_pthread_id;
> --const char * const config_event_context_hostname;
> --const char * const config_event_context_ip;
> --const char * const config_event_context_perf_thread_counter;
> -+extern const char * const config_element_channel;
> -+extern const char * const config_element_channels;
> -+extern const char * const config_element_domain;
> -+extern const char * const config_element_domains;
> -+extern const char * const config_element_event;
> -+extern const char * const config_element_events;
> -+extern const char * const config_element_context;
> -+extern const char * const config_element_contexts;
> -+extern const char * const config_element_attributes;
> -+extern const char * const config_element_exclusion;
> -+extern const char * const config_element_exclusions;
> -+extern const char * const config_element_function_attributes;
> -+extern const char * const config_element_probe_attributes;
> -+extern const char * const config_element_symbol_name;
> -+extern const char * const config_element_address;
> -+extern const char * const config_element_offset;
> -+extern const char * const config_element_name;
> -+extern const char * const config_element_enabled;
> -+extern const char * const config_element_overwrite_mode;
> -+extern const char * const config_element_subbuf_size;
> -+extern const char * const config_element_num_subbuf;
> -+extern const char * const config_element_switch_timer_interval;
> -+extern const char * const config_element_read_timer_interval;
> -+extern const char * const config_element_output;
> -+extern const char * const config_element_output_type;
> -+extern const char * const config_element_tracefile_size;
> -+extern const char * const config_element_tracefile_count;
> -+extern const char * const config_element_live_timer_interval;
> -+extern const char * const config_element_type;
> -+extern const char * const config_element_buffer_type;
> -+extern const char * const config_element_session;
> -+extern const char * const config_element_sessions;
> -+extern const char * const config_element_perf;
> -+extern const char * const config_element_config;
> -+extern const char * const config_element_started;
> -+extern const char * const config_element_snapshot_mode;
> -+extern const char * const config_element_loglevel;
> -+extern const char * const config_element_loglevel_type;
> -+extern const char * const config_element_filter;
> -+extern const char * const config_element_snapshot_outputs;
> -+extern const char * const config_element_consumer_output;
> -+extern const char * const config_element_destination;
> -+extern const char * const config_element_path;
> -+extern const char * const config_element_net_output;
> -+extern const char * const config_element_control_uri;
> -+extern const char * const config_element_data_uri;
> -+extern const char * const config_element_max_size;
> -+
> -+extern const char * const config_domain_type_kernel;
> -+extern const char * const config_domain_type_ust;
> -+extern const char * const config_domain_type_jul;
> -+extern const char * const config_domain_type_log4j;
> -+
> -+extern const char * const config_buffer_type_per_pid;
> -+extern const char * const config_buffer_type_per_uid;
> -+extern const char * const config_buffer_type_global;
> -+
> -+extern const char * const config_overwrite_mode_discard;
> -+extern const char * const config_overwrite_mode_overwrite;
> -+
> -+extern const char * const config_output_type_splice;
> -+extern const char * const config_output_type_mmap;
> -+
> -+extern const char * const config_loglevel_type_all;
> -+extern const char * const config_loglevel_type_range;
> -+extern const char * const config_loglevel_type_single;
> -+
> -+extern const char * const config_event_type_all;
> -+extern const char * const config_event_type_tracepoint;
> -+extern const char * const config_event_type_probe;
> -+extern const char * const config_event_type_function;
> -+extern const char * const config_event_type_function_entry;
> -+extern const char * const config_event_type_noop;
> -+extern const char * const config_event_type_syscall;
> -+extern const char * const config_event_type_kprobe;
> -+extern const char * const config_event_type_kretprobe;
> -+
> -+extern const char * const config_event_context_pid;
> -+extern const char * const config_event_context_procname;
> -+extern const char * const config_event_context_prio;
> -+extern const char * const config_event_context_nice;
> -+extern const char * const config_event_context_vpid;
> -+extern const char * const config_event_context_tid;
> -+extern const char * const config_event_context_vtid;
> -+extern const char * const config_event_context_ppid;
> -+extern const char * const config_event_context_vppid;
> -+extern const char * const config_event_context_pthread_id;
> -+extern const char * const config_event_context_hostname;
> -+extern const char * const config_event_context_ip;
> -+extern const char * const config_event_context_perf_thread_counter;
> -
> - #endif /* CONFIG_SESSION_INTERNAL_H */
> -Index: git/src/common/mi-lttng.h
> -===================================================================
> ---- git.orig/src/common/mi-lttng.h
> -+++ git/src/common/mi-lttng.h
> -@@ -49,133 +49,133 @@ struct mi_lttng_version {
> - };
> -
> - /* Strings related to command */
> --const char * const mi_lttng_element_command;
> --const char * const mi_lttng_element_command_action;
> --const char * const mi_lttng_element_command_add_context;
> --const char * const mi_lttng_element_command_calibrate;
> --const char * const mi_lttng_element_command_create;
> --const char * const mi_lttng_element_command_destroy;
> --const char * const mi_lttng_element_command_disable_channel;
> --const char * const mi_lttng_element_command_disable_event;
> --const char * const mi_lttng_element_command_enable_channels;
> --const char * const mi_lttng_element_command_enable_event;
> --const char * const mi_lttng_element_command_list;
> --const char * const mi_lttng_element_command_load;
> --const char * const mi_lttng_element_command_name;
> --const char * const mi_lttng_element_command_output;
> --const char * const mi_lttng_element_command_save;
> --const char * const mi_lttng_element_command_set_session;
> --const char * const mi_lttng_element_command_snapshot;
> --const char * const mi_lttng_element_command_snapshot_add;
> --const char * const mi_lttng_element_command_snapshot_del;
> --const char * const mi_lttng_element_command_snapshot_list;
> --const char * const mi_lttng_element_command_snapshot_record;
> --const char * const mi_lttng_element_command_start;
> --const char * const mi_lttng_element_command_stop;
> --const char * const mi_lttng_element_command_success;
> --const char * const mi_lttng_element_command_version;
> -+extern const char * const mi_lttng_element_command;
> -+extern const char * const mi_lttng_element_command_action;
> -+extern const char * const mi_lttng_element_command_add_context;
> -+extern const char * const mi_lttng_element_command_calibrate;
> -+extern const char * const mi_lttng_element_command_create;
> -+extern const char * const mi_lttng_element_command_destroy;
> -+extern const char * const mi_lttng_element_command_disable_channel;
> -+extern const char * const mi_lttng_element_command_disable_event;
> -+extern const char * const mi_lttng_element_command_enable_channels;
> -+extern const char * const mi_lttng_element_command_enable_event;
> -+extern const char * const mi_lttng_element_command_list;
> -+extern const char * const mi_lttng_element_command_load;
> -+extern const char * const mi_lttng_element_command_name;
> -+extern const char * const mi_lttng_element_command_output;
> -+extern const char * const mi_lttng_element_command_save;
> -+extern const char * const mi_lttng_element_command_set_session;
> -+extern const char * const mi_lttng_element_command_snapshot;
> -+extern const char * const mi_lttng_element_command_snapshot_add;
> -+extern const char * const mi_lttng_element_command_snapshot_del;
> -+extern const char * const mi_lttng_element_command_snapshot_list;
> -+extern const char * const mi_lttng_element_command_snapshot_record;
> -+extern const char * const mi_lttng_element_command_start;
> -+extern const char * const mi_lttng_element_command_stop;
> -+extern const char * const mi_lttng_element_command_success;
> -+extern const char * const mi_lttng_element_command_version;
> -
> - /* Strings related to version command */
> --const char * const mi_lttng_element_version;
> --const char * const mi_lttng_element_version_commit;
> --const char * const mi_lttng_element_version_description;
> --const char * const mi_lttng_element_version_license;
> --const char * const mi_lttng_element_version_major;
> --const char * const mi_lttng_element_version_minor;
> --const char * const mi_lttng_element_version_patch_level;
> --const char * const mi_lttng_element_version_str;
> --const char * const mi_lttng_element_version_web;
> -+extern const char * const mi_lttng_element_version;
> -+extern const char * const mi_lttng_element_version_commit;
> -+extern const char * const mi_lttng_element_version_description;
> -+extern const char * const mi_lttng_element_version_license;
> -+extern const char * const mi_lttng_element_version_major;
> -+extern const char * const mi_lttng_element_version_minor;
> -+extern const char * const mi_lttng_element_version_patch_level;
> -+extern const char * const mi_lttng_element_version_str;
> -+extern const char * const mi_lttng_element_version_web;
> -
> - /* String related to a lttng_event_field */
> --const char * const mi_lttng_element_event_field;
> --const char * const mi_lttng_element_event_fields;
> -+extern const char * const mi_lttng_element_event_field;
> -+extern const char * const mi_lttng_element_event_fields;
> -
> - /* String related to lttng_event_context */
> --const char * const mi_lttng_context_type_perf_counter;
> --const char * const mi_lttng_context_type_perf_cpu_counter;
> --const char * const mi_lttng_context_type_perf_thread_counter;
> -+extern const char * const mi_lttng_context_type_perf_counter;
> -+extern const char * const mi_lttng_context_type_perf_cpu_counter;
> -+extern const char * const mi_lttng_context_type_perf_thread_counter;
> -
> - /* String related to lttng_event_perf_counter_ctx */
> --const char * const mi_lttng_element_perf_counter_context;
> -+extern const char * const mi_lttng_element_perf_counter_context;
> -
> - /* Strings related to pid */
> --const char * const mi_lttng_element_pids;
> --const char * const mi_lttng_element_pid;
> --const char * const mi_lttng_element_pid_id;
> -+extern const char * const mi_lttng_element_pids;
> -+extern const char * const mi_lttng_element_pid;
> -+extern const char * const mi_lttng_element_pid_id;
> -
> - /* Strings related to save command */
> --const char * const mi_lttng_element_save;
> -+extern const char * const mi_lttng_element_save;
> -
> - /* Strings related to load command */
> --const char * const mi_lttng_element_load;
> -+extern const char * const mi_lttng_element_load;
> -
> - /* General element of mi_lttng */
> --const char * const mi_lttng_element_empty;
> --const char * const mi_lttng_element_id;
> --const char * const mi_lttng_element_nowrite;
> --const char * const mi_lttng_element_success;
> --const char * const mi_lttng_element_type_enum;
> --const char * const mi_lttng_element_type_float;
> --const char * const mi_lttng_element_type_integer;
> --const char * const mi_lttng_element_type_other;
> --const char * const mi_lttng_element_type_string;
> -+extern const char * const mi_lttng_element_empty;
> -+extern const char * const mi_lttng_element_id;
> -+extern const char * const mi_lttng_element_nowrite;
> -+extern const char * const mi_lttng_element_success;
> -+extern const char * const mi_lttng_element_type_enum;
> -+extern const char * const mi_lttng_element_type_float;
> -+extern const char * const mi_lttng_element_type_integer;
> -+extern const char * const mi_lttng_element_type_other;
> -+extern const char * const mi_lttng_element_type_string;
> -
> - /* String related to loglevel */
> --const char * const mi_lttng_loglevel_str_alert;
> --const char * const mi_lttng_loglevel_str_crit;
> --const char * const mi_lttng_loglevel_str_debug;
> --const char * const mi_lttng_loglevel_str_debug_function;
> --const char * const mi_lttng_loglevel_str_debug_line;
> --const char * const mi_lttng_loglevel_str_debug_module;
> --const char * const mi_lttng_loglevel_str_debug_process;
> --const char * const mi_lttng_loglevel_str_debug_program;
> --const char * const mi_lttng_loglevel_str_debug_system;
> --const char * const mi_lttng_loglevel_str_debug_unit;
> --const char * const mi_lttng_loglevel_str_emerg;
> --const char * const mi_lttng_loglevel_str_err;
> --const char * const mi_lttng_loglevel_str_info;
> --const char * const mi_lttng_loglevel_str_notice;
> --const char * const mi_lttng_loglevel_str_unknown;
> --const char * const mi_lttng_loglevel_str_warning;
> -+extern const char * const mi_lttng_loglevel_str_alert;
> -+extern const char * const mi_lttng_loglevel_str_crit;
> -+extern const char * const mi_lttng_loglevel_str_debug;
> -+extern const char * const mi_lttng_loglevel_str_debug_function;
> -+extern const char * const mi_lttng_loglevel_str_debug_line;
> -+extern const char * const mi_lttng_loglevel_str_debug_module;
> -+extern const char * const mi_lttng_loglevel_str_debug_process;
> -+extern const char * const mi_lttng_loglevel_str_debug_program;
> -+extern const char * const mi_lttng_loglevel_str_debug_system;
> -+extern const char * const mi_lttng_loglevel_str_debug_unit;
> -+extern const char * const mi_lttng_loglevel_str_emerg;
> -+extern const char * const mi_lttng_loglevel_str_err;
> -+extern const char * const mi_lttng_loglevel_str_info;
> -+extern const char * const mi_lttng_loglevel_str_notice;
> -+extern const char * const mi_lttng_loglevel_str_unknown;
> -+extern const char * const mi_lttng_loglevel_str_warning;
> -
> - /* String related to loglevel JUL */
> --const char * const mi_lttng_loglevel_str_jul_all;
> --const char * const mi_lttng_loglevel_str_jul_config;
> --const char * const mi_lttng_loglevel_str_jul_fine;
> --const char * const mi_lttng_loglevel_str_jul_finer;
> --const char * const mi_lttng_loglevel_str_jul_finest;
> --const char * const mi_lttng_loglevel_str_jul_info;
> --const char * const mi_lttng_loglevel_str_jul_off;
> --const char * const mi_lttng_loglevel_str_jul_severe;
> --const char * const mi_lttng_loglevel_str_jul_warning;
> -+extern const char * const mi_lttng_loglevel_str_jul_all;
> -+extern const char * const mi_lttng_loglevel_str_jul_config;
> -+extern const char * const mi_lttng_loglevel_str_jul_fine;
> -+extern const char * const mi_lttng_loglevel_str_jul_finer;
> -+extern const char * const mi_lttng_loglevel_str_jul_finest;
> -+extern const char * const mi_lttng_loglevel_str_jul_info;
> -+extern const char * const mi_lttng_loglevel_str_jul_off;
> -+extern const char * const mi_lttng_loglevel_str_jul_severe;
> -+extern const char * const mi_lttng_loglevel_str_jul_warning;
> -
> - /* String related to loglevel Log4j */
> --const char * const mi_lttng_loglevel_str_log4j_off;
> --const char * const mi_lttng_loglevel_str_log4j_fatal;
> --const char * const mi_lttng_loglevel_str_log4j_error;
> --const char * const mi_lttng_loglevel_str_log4j_warn;
> --const char * const mi_lttng_loglevel_str_log4j_info;
> --const char * const mi_lttng_loglevel_str_log4j_debug;
> --const char * const mi_lttng_loglevel_str_log4j_trace;
> --const char * const mi_lttng_loglevel_str_log4j_all;
> -+extern const char * const mi_lttng_loglevel_str_log4j_off;
> -+extern const char * const mi_lttng_loglevel_str_log4j_fatal;
> -+extern const char * const mi_lttng_loglevel_str_log4j_error;
> -+extern const char * const mi_lttng_loglevel_str_log4j_warn;
> -+extern const char * const mi_lttng_loglevel_str_log4j_info;
> -+extern const char * const mi_lttng_loglevel_str_log4j_debug;
> -+extern const char * const mi_lttng_loglevel_str_log4j_trace;
> -+extern const char * const mi_lttng_loglevel_str_log4j_all;
> -
> - /* String related to loglevel type */
> --const char * const mi_lttng_loglevel_type_all;
> --const char * const mi_lttng_loglevel_type_range;
> --const char * const mi_lttng_loglevel_type_single;
> --const char * const mi_lttng_loglevel_type_unknown;
> -+extern const char * const mi_lttng_loglevel_type_all;
> -+extern const char * const mi_lttng_loglevel_type_range;
> -+extern const char * const mi_lttng_loglevel_type_single;
> -+extern const char * const mi_lttng_loglevel_type_unknown;
> -
> - /* Sting related to lttng_calibrate */
> --const char * const mi_lttng_element_calibrate;
> --const char * const mi_lttng_element_calibrate_function;
> -+extern const char * const mi_lttng_element_calibrate;
> -+extern const char * const mi_lttng_element_calibrate_function;
> -
> - /* String related to a lttng_snapshot */
> --const char * const mi_lttng_element_snapshot_ctrl_url;
> --const char * const mi_lttng_element_snapshot_data_url;
> --const char * const mi_lttng_element_snapshot_max_size;
> --const char * const mi_lttng_element_snapshot_n_ptr;
> --const char * const mi_lttng_element_snapshot_session_name;
> --const char * const mi_lttng_element_snapshots;
> -+extern const char * const mi_lttng_element_snapshot_ctrl_url;
> -+extern const char * const mi_lttng_element_snapshot_data_url;
> -+extern const char * const mi_lttng_element_snapshot_max_size;
> -+extern const char * const mi_lttng_element_snapshot_n_ptr;
> -+extern const char * const mi_lttng_element_snapshot_session_name;
> -+extern const char * const mi_lttng_element_snapshots;
> -
> - /* Utility string function  */
> - const char *mi_lttng_loglevel_string(int value, enum lttng_domain_type domain);
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch b/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
> deleted file mode 100644
> index 4719d95..0000000
> --- a/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 161496fbe1465817a77a50a1172734dae81a13ef Mon Sep 17 00:00:00 2001
> -From: Mikael Beckius <mikael.beckius@windriver.com>
> -Date: Tue, 12 May 2015 11:11:48 +0200
> -Subject: [PATCH] lttng-tools: Fix live timer calculation error
> -
> -There is an calculation error for live timer. Variable switch_timer_interval is
> -based on microsecond, and it is not right to assign switch_timer_interval mod
> -1000000 to var tv_nsec which is based on nanosecond.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
> -Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ----
> - src/common/consumer-timer.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/common/consumer-timer.c b/src/common/consumer-timer.c
> -index 1408052..c6202ba 100644
> ---- a/src/common/consumer-timer.c
> -+++ b/src/common/consumer-timer.c
> -@@ -368,7 +368,7 @@ void consumer_timer_switch_start(struct lttng_consumer_channel *channel,
> - 	channel->switch_timer_enabled = 1;
> -
> - 	its.it_value.tv_sec = switch_timer_interval / 1000000;
> --	its.it_value.tv_nsec = switch_timer_interval % 1000000;
> -+	its.it_value.tv_nsec = (switch_timer_interval % 1000000) * 1000;
> - 	its.it_interval.tv_sec = its.it_value.tv_sec;
> - 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
> -
> -@@ -425,7 +425,7 @@ void consumer_timer_live_start(struct lttng_consumer_channel *channel,
> - 	channel->live_timer_enabled = 1;
> -
> - 	its.it_value.tv_sec = live_timer_interval / 1000000;
> --	its.it_value.tv_nsec = live_timer_interval % 1000000;
> -+	its.it_value.tv_nsec = (live_timer_interval % 1000000) * 1000;
> - 	its.it_interval.tv_sec = its.it_value.tv_sec;
> - 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
> -
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch b/meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
> new file mode 100644
> index 0000000..bd4f7d1
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
> @@ -0,0 +1,51 @@
> +From 1f54181c2df1fb92c3323a6dbf8273fb66b883b6 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
> + <jeremie.galarneau@efficios.com>
> +Date: Sat, 17 Oct 2015 19:41:47 -0400
> +Subject: [PATCH] Port: Don't use SIGUNUSED which is not defined on Solaris
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +Organization: O.S. Systems Software LTDA.
> +
> +Upstream-Status: Backport [2.8.0]
> +
> +Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
> +---
> + src/common/runas.c | 18 +++++-------------
> + 1 file changed, 5 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/common/runas.c b/src/common/runas.c
> +index 57f7382..0825470 100644
> +--- a/src/common/runas.c
> ++++ b/src/common/runas.c
> +@@ -530,21 +530,13 @@ int run_as_rmdir_recursive(const char *path, uid_t uid, gid_t gid)
> + static
> + int reset_sighandler(void)
> + {
> +-	int sig, ret = 0;
> ++	int sig;
> +
> +-	for (sig = SIGHUP; sig <= SIGUNUSED; sig++) {
> +-		/* Skip unblockable signals. */
> +-		if (sig == SIGKILL || sig == SIGSTOP) {
> +-			continue;
> +-		}
> +-		if (signal(sig, SIG_DFL) == SIG_ERR) {
> +-			PERROR("reset signal %d", sig);
> +-			ret = -1;
> +-			goto end;
> +-		}
> ++	DBG("Resetting run_as worker signal handlers to default");
> ++	for (sig = 1; sig <= 31; sig++) {
> ++		(void) signal(sig, SIG_DFL);
> + 	}
> +-end:
> +-	return ret;
> ++	return 0;
> + }
> +
> + static
> +--
> +2.6.2
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
> similarity index 85%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_git.bb
> index 909acc3..74c047f 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
> @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
>   DEPENDS = "liburcu popt lttng-ust libxml2"
>   RDEPENDS_${PN}-ptest += "make perl bash"
>
> -SRCREV = "d522c1f14285e2e8b10b7c0cd011847696ffe779"
> +SRCREV = "d71e55a5f1f423eeaa47c08e5797e47ce8e825fb"
> +PV = "2.7.0+git${SRCPV}"
>
>   PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
>                    am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
> @@ -23,13 +24,10 @@ PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python swig-
>   PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
>   PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
>
> -SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
> +SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
> +           file://stop-using-SIGUNUSED.patch \
>              file://runtest-2.4.0.patch \
> -           file://extern-decls.patch \
> -           file://run-ptest \
> -           file://lttng-tools-Fix-live-timer-calculation-error.patch \
> -           file://0001-Fix-sessiond-disable-match-app-event-by-name.patch \
> -	  "
> +           file://run-ptest"
>
>   S = "${WORKDIR}/git"
>
> @@ -71,9 +69,6 @@ do_install_ptest () {
>   		  -i $i
>   	done
>
> -	sed -e "s:src/bin/lttng-sessiond:$bindir:g" \
> -	    -e "s:src/bin/lttng-consumerd:${libexecdir}/libexec/:g" \
> -	-i ${D}${PTEST_PATH}/tests/regression/run-report.py
>   	sed -e "s:src/bin:bin:g" -e "s:lt-::g" \
>   	-i ${D}${PTEST_PATH}/tests/utils/utils.sh
>   	sed -e "s:ini_config:\.libs\/ini_config:" \
>

