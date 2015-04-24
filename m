Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 553E373D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:42 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so36537580pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QDW+SZNKgZ2/UWuBO4gNvScni+stTYCbMGAo/w5iPDE=;
	b=tUwd3ZDirsCf/dBIUlI2dsuuswXHQS09pNY70JfkW/GSacuUn2Iir2h86/n724MgVT
	uni4zZmn+fhfMtN5GT/dORmPF7OveUhrRLZ72Mw/MPrI7ZbySpffvjB56PwXY87gSNFT
	s9uKMGbqpusAAts+Ln7XIznRrucZIZYfqwp9ky+p1Tav8XiCS1iCG4Ko2iOQR06+jn+H
	XYDoTj7/4ax813EzHnRyZ2PpMAS9n6DAGedsZo1Wmde1n3tBjTJ8ep+uHVQSMppiEtef
	pNcTceEbpmSAOn2t0WrTIW/+iai6KUnOR8Pv5trwaQTouUlGMTbwpxRICx0TOUY8Z/Cb
	uP/g==
X-Received: by 10.68.69.9 with SMTP id a9mr10807315pbu.68.1429846544392;
	Thu, 23 Apr 2015 20:35:44 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:24 -0700
Message-Id: <4003b9398e0d773fd3cd13a160c15cf8cb3ac8d8.1429846255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 06/14] lttng-tools: Add extern qualifier to declarations in .h file
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:43 -0000

This will ensure that compiler does not initialize the definitions
in header files

Change-Id: I1076201c667f96707c320a51a77d4a70e22df750
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lttng/lttng-tools/extern-decls.patch           | 442 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |   1 +
 2 files changed, 443 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch b/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
new file mode 100644
index 0000000..199ef57
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
@@ -0,0 +1,442 @@
+This make the declarations to be extern so they dont end up
+in duplicates in data.rel.ro sections
+
+avoid errors like
+
+| ../../../src/common/.libs/libcommon.a(mi-lttng.o):(.data.rel.ro.local+0x0): multiple definition of `mi_lttng_element_snapshots'
+| commands/enable_events.o:(.bss+0x48): first defined here
+| collect2: error: ld returned 1 exit status
+| Makefile:502: recipe for target 'lttng' failed
+| make[3]: *** [lttng] Error 1
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/src/common/config/config-session-abi.h
+===================================================================
+--- git.orig/src/common/config/config-session-abi.h
++++ git/src/common/config/config-session-abi.h
+@@ -18,95 +18,95 @@
+ #ifndef CONFIG_SESSION_INTERNAL_H
+ #define CONFIG_SESSION_INTERNAL_H
+ 
+-const char * const config_element_channel;
+-const char * const config_element_channels;
+-const char * const config_element_domain;
+-const char * const config_element_domains;
+-const char * const config_element_event;
+-const char * const config_element_events;
+-const char * const config_element_context;
+-const char * const config_element_contexts;
+-const char * const config_element_attributes;
+-const char * const config_element_exclusion;
+-const char * const config_element_exclusions;
+-const char * const config_element_function_attributes;
+-const char * const config_element_probe_attributes;
+-const char * const config_element_symbol_name;
+-const char * const config_element_address;
+-const char * const config_element_offset;
+-const char * const config_element_name;
+-const char * const config_element_enabled;
+-const char * const config_element_overwrite_mode;
+-const char * const config_element_subbuf_size;
+-const char * const config_element_num_subbuf;
+-const char * const config_element_switch_timer_interval;
+-const char * const config_element_read_timer_interval;
+-const char * const config_element_output;
+-const char * const config_element_output_type;
+-const char * const config_element_tracefile_size;
+-const char * const config_element_tracefile_count;
+-const char * const config_element_live_timer_interval;
+-const char * const config_element_type;
+-const char * const config_element_buffer_type;
+-const char * const config_element_session;
+-const char * const config_element_sessions;
+-const char * const config_element_perf;
+-const char * const config_element_config;
+-const char * const config_element_started;
+-const char * const config_element_snapshot_mode;
+-const char * const config_element_loglevel;
+-const char * const config_element_loglevel_type;
+-const char * const config_element_filter;
+-const char * const config_element_snapshot_outputs;
+-const char * const config_element_consumer_output;
+-const char * const config_element_destination;
+-const char * const config_element_path;
+-const char * const config_element_net_output;
+-const char * const config_element_control_uri;
+-const char * const config_element_data_uri;
+-const char * const config_element_max_size;
+-
+-const char * const config_domain_type_kernel;
+-const char * const config_domain_type_ust;
+-const char * const config_domain_type_jul;
+-const char * const config_domain_type_log4j;
+-
+-const char * const config_buffer_type_per_pid;
+-const char * const config_buffer_type_per_uid;
+-const char * const config_buffer_type_global;
+-
+-const char * const config_overwrite_mode_discard;
+-const char * const config_overwrite_mode_overwrite;
+-
+-const char * const config_output_type_splice;
+-const char * const config_output_type_mmap;
+-
+-const char * const config_loglevel_type_all;
+-const char * const config_loglevel_type_range;
+-const char * const config_loglevel_type_single;
+-
+-const char * const config_event_type_all;
+-const char * const config_event_type_tracepoint;
+-const char * const config_event_type_probe;
+-const char * const config_event_type_function;
+-const char * const config_event_type_function_entry;
+-const char * const config_event_type_noop;
+-const char * const config_event_type_syscall;
+-const char * const config_event_type_kprobe;
+-const char * const config_event_type_kretprobe;
+-
+-const char * const config_event_context_pid;
+-const char * const config_event_context_procname;
+-const char * const config_event_context_prio;
+-const char * const config_event_context_nice;
+-const char * const config_event_context_vpid;
+-const char * const config_event_context_tid;
+-const char * const config_event_context_vtid;
+-const char * const config_event_context_ppid;
+-const char * const config_event_context_vppid;
+-const char * const config_event_context_pthread_id;
+-const char * const config_event_context_hostname;
+-const char * const config_event_context_ip;
+-const char * const config_event_context_perf_thread_counter;
++extern const char * const config_element_channel;
++extern const char * const config_element_channels;
++extern const char * const config_element_domain;
++extern const char * const config_element_domains;
++extern const char * const config_element_event;
++extern const char * const config_element_events;
++extern const char * const config_element_context;
++extern const char * const config_element_contexts;
++extern const char * const config_element_attributes;
++extern const char * const config_element_exclusion;
++extern const char * const config_element_exclusions;
++extern const char * const config_element_function_attributes;
++extern const char * const config_element_probe_attributes;
++extern const char * const config_element_symbol_name;
++extern const char * const config_element_address;
++extern const char * const config_element_offset;
++extern const char * const config_element_name;
++extern const char * const config_element_enabled;
++extern const char * const config_element_overwrite_mode;
++extern const char * const config_element_subbuf_size;
++extern const char * const config_element_num_subbuf;
++extern const char * const config_element_switch_timer_interval;
++extern const char * const config_element_read_timer_interval;
++extern const char * const config_element_output;
++extern const char * const config_element_output_type;
++extern const char * const config_element_tracefile_size;
++extern const char * const config_element_tracefile_count;
++extern const char * const config_element_live_timer_interval;
++extern const char * const config_element_type;
++extern const char * const config_element_buffer_type;
++extern const char * const config_element_session;
++extern const char * const config_element_sessions;
++extern const char * const config_element_perf;
++extern const char * const config_element_config;
++extern const char * const config_element_started;
++extern const char * const config_element_snapshot_mode;
++extern const char * const config_element_loglevel;
++extern const char * const config_element_loglevel_type;
++extern const char * const config_element_filter;
++extern const char * const config_element_snapshot_outputs;
++extern const char * const config_element_consumer_output;
++extern const char * const config_element_destination;
++extern const char * const config_element_path;
++extern const char * const config_element_net_output;
++extern const char * const config_element_control_uri;
++extern const char * const config_element_data_uri;
++extern const char * const config_element_max_size;
++
++extern const char * const config_domain_type_kernel;
++extern const char * const config_domain_type_ust;
++extern const char * const config_domain_type_jul;
++extern const char * const config_domain_type_log4j;
++
++extern const char * const config_buffer_type_per_pid;
++extern const char * const config_buffer_type_per_uid;
++extern const char * const config_buffer_type_global;
++
++extern const char * const config_overwrite_mode_discard;
++extern const char * const config_overwrite_mode_overwrite;
++
++extern const char * const config_output_type_splice;
++extern const char * const config_output_type_mmap;
++
++extern const char * const config_loglevel_type_all;
++extern const char * const config_loglevel_type_range;
++extern const char * const config_loglevel_type_single;
++
++extern const char * const config_event_type_all;
++extern const char * const config_event_type_tracepoint;
++extern const char * const config_event_type_probe;
++extern const char * const config_event_type_function;
++extern const char * const config_event_type_function_entry;
++extern const char * const config_event_type_noop;
++extern const char * const config_event_type_syscall;
++extern const char * const config_event_type_kprobe;
++extern const char * const config_event_type_kretprobe;
++
++extern const char * const config_event_context_pid;
++extern const char * const config_event_context_procname;
++extern const char * const config_event_context_prio;
++extern const char * const config_event_context_nice;
++extern const char * const config_event_context_vpid;
++extern const char * const config_event_context_tid;
++extern const char * const config_event_context_vtid;
++extern const char * const config_event_context_ppid;
++extern const char * const config_event_context_vppid;
++extern const char * const config_event_context_pthread_id;
++extern const char * const config_event_context_hostname;
++extern const char * const config_event_context_ip;
++extern const char * const config_event_context_perf_thread_counter;
+ 
+ #endif /* CONFIG_SESSION_INTERNAL_H */
+Index: git/src/common/mi-lttng.h
+===================================================================
+--- git.orig/src/common/mi-lttng.h
++++ git/src/common/mi-lttng.h
+@@ -49,133 +49,133 @@ struct mi_lttng_version {
+ };
+ 
+ /* Strings related to command */
+-const char * const mi_lttng_element_command;
+-const char * const mi_lttng_element_command_action;
+-const char * const mi_lttng_element_command_add_context;
+-const char * const mi_lttng_element_command_calibrate;
+-const char * const mi_lttng_element_command_create;
+-const char * const mi_lttng_element_command_destroy;
+-const char * const mi_lttng_element_command_disable_channel;
+-const char * const mi_lttng_element_command_disable_event;
+-const char * const mi_lttng_element_command_enable_channels;
+-const char * const mi_lttng_element_command_enable_event;
+-const char * const mi_lttng_element_command_list;
+-const char * const mi_lttng_element_command_load;
+-const char * const mi_lttng_element_command_name;
+-const char * const mi_lttng_element_command_output;
+-const char * const mi_lttng_element_command_save;
+-const char * const mi_lttng_element_command_set_session;
+-const char * const mi_lttng_element_command_snapshot;
+-const char * const mi_lttng_element_command_snapshot_add;
+-const char * const mi_lttng_element_command_snapshot_del;
+-const char * const mi_lttng_element_command_snapshot_list;
+-const char * const mi_lttng_element_command_snapshot_record;
+-const char * const mi_lttng_element_command_start;
+-const char * const mi_lttng_element_command_stop;
+-const char * const mi_lttng_element_command_success;
+-const char * const mi_lttng_element_command_version;
++extern const char * const mi_lttng_element_command;
++extern const char * const mi_lttng_element_command_action;
++extern const char * const mi_lttng_element_command_add_context;
++extern const char * const mi_lttng_element_command_calibrate;
++extern const char * const mi_lttng_element_command_create;
++extern const char * const mi_lttng_element_command_destroy;
++extern const char * const mi_lttng_element_command_disable_channel;
++extern const char * const mi_lttng_element_command_disable_event;
++extern const char * const mi_lttng_element_command_enable_channels;
++extern const char * const mi_lttng_element_command_enable_event;
++extern const char * const mi_lttng_element_command_list;
++extern const char * const mi_lttng_element_command_load;
++extern const char * const mi_lttng_element_command_name;
++extern const char * const mi_lttng_element_command_output;
++extern const char * const mi_lttng_element_command_save;
++extern const char * const mi_lttng_element_command_set_session;
++extern const char * const mi_lttng_element_command_snapshot;
++extern const char * const mi_lttng_element_command_snapshot_add;
++extern const char * const mi_lttng_element_command_snapshot_del;
++extern const char * const mi_lttng_element_command_snapshot_list;
++extern const char * const mi_lttng_element_command_snapshot_record;
++extern const char * const mi_lttng_element_command_start;
++extern const char * const mi_lttng_element_command_stop;
++extern const char * const mi_lttng_element_command_success;
++extern const char * const mi_lttng_element_command_version;
+ 
+ /* Strings related to version command */
+-const char * const mi_lttng_element_version;
+-const char * const mi_lttng_element_version_commit;
+-const char * const mi_lttng_element_version_description;
+-const char * const mi_lttng_element_version_license;
+-const char * const mi_lttng_element_version_major;
+-const char * const mi_lttng_element_version_minor;
+-const char * const mi_lttng_element_version_patch_level;
+-const char * const mi_lttng_element_version_str;
+-const char * const mi_lttng_element_version_web;
++extern const char * const mi_lttng_element_version;
++extern const char * const mi_lttng_element_version_commit;
++extern const char * const mi_lttng_element_version_description;
++extern const char * const mi_lttng_element_version_license;
++extern const char * const mi_lttng_element_version_major;
++extern const char * const mi_lttng_element_version_minor;
++extern const char * const mi_lttng_element_version_patch_level;
++extern const char * const mi_lttng_element_version_str;
++extern const char * const mi_lttng_element_version_web;
+ 
+ /* String related to a lttng_event_field */
+-const char * const mi_lttng_element_event_field;
+-const char * const mi_lttng_element_event_fields;
++extern const char * const mi_lttng_element_event_field;
++extern const char * const mi_lttng_element_event_fields;
+ 
+ /* String related to lttng_event_context */
+-const char * const mi_lttng_context_type_perf_counter;
+-const char * const mi_lttng_context_type_perf_cpu_counter;
+-const char * const mi_lttng_context_type_perf_thread_counter;
++extern const char * const mi_lttng_context_type_perf_counter;
++extern const char * const mi_lttng_context_type_perf_cpu_counter;
++extern const char * const mi_lttng_context_type_perf_thread_counter;
+ 
+ /* String related to lttng_event_perf_counter_ctx */
+-const char * const mi_lttng_element_perf_counter_context;
++extern const char * const mi_lttng_element_perf_counter_context;
+ 
+ /* Strings related to pid */
+-const char * const mi_lttng_element_pids;
+-const char * const mi_lttng_element_pid;
+-const char * const mi_lttng_element_pid_id;
++extern const char * const mi_lttng_element_pids;
++extern const char * const mi_lttng_element_pid;
++extern const char * const mi_lttng_element_pid_id;
+ 
+ /* Strings related to save command */
+-const char * const mi_lttng_element_save;
++extern const char * const mi_lttng_element_save;
+ 
+ /* Strings related to load command */
+-const char * const mi_lttng_element_load;
++extern const char * const mi_lttng_element_load;
+ 
+ /* General element of mi_lttng */
+-const char * const mi_lttng_element_empty;
+-const char * const mi_lttng_element_id;
+-const char * const mi_lttng_element_nowrite;
+-const char * const mi_lttng_element_success;
+-const char * const mi_lttng_element_type_enum;
+-const char * const mi_lttng_element_type_float;
+-const char * const mi_lttng_element_type_integer;
+-const char * const mi_lttng_element_type_other;
+-const char * const mi_lttng_element_type_string;
++extern const char * const mi_lttng_element_empty;
++extern const char * const mi_lttng_element_id;
++extern const char * const mi_lttng_element_nowrite;
++extern const char * const mi_lttng_element_success;
++extern const char * const mi_lttng_element_type_enum;
++extern const char * const mi_lttng_element_type_float;
++extern const char * const mi_lttng_element_type_integer;
++extern const char * const mi_lttng_element_type_other;
++extern const char * const mi_lttng_element_type_string;
+ 
+ /* String related to loglevel */
+-const char * const mi_lttng_loglevel_str_alert;
+-const char * const mi_lttng_loglevel_str_crit;
+-const char * const mi_lttng_loglevel_str_debug;
+-const char * const mi_lttng_loglevel_str_debug_function;
+-const char * const mi_lttng_loglevel_str_debug_line;
+-const char * const mi_lttng_loglevel_str_debug_module;
+-const char * const mi_lttng_loglevel_str_debug_process;
+-const char * const mi_lttng_loglevel_str_debug_program;
+-const char * const mi_lttng_loglevel_str_debug_system;
+-const char * const mi_lttng_loglevel_str_debug_unit;
+-const char * const mi_lttng_loglevel_str_emerg;
+-const char * const mi_lttng_loglevel_str_err;
+-const char * const mi_lttng_loglevel_str_info;
+-const char * const mi_lttng_loglevel_str_notice;
+-const char * const mi_lttng_loglevel_str_unknown;
+-const char * const mi_lttng_loglevel_str_warning;
++extern const char * const mi_lttng_loglevel_str_alert;
++extern const char * const mi_lttng_loglevel_str_crit;
++extern const char * const mi_lttng_loglevel_str_debug;
++extern const char * const mi_lttng_loglevel_str_debug_function;
++extern const char * const mi_lttng_loglevel_str_debug_line;
++extern const char * const mi_lttng_loglevel_str_debug_module;
++extern const char * const mi_lttng_loglevel_str_debug_process;
++extern const char * const mi_lttng_loglevel_str_debug_program;
++extern const char * const mi_lttng_loglevel_str_debug_system;
++extern const char * const mi_lttng_loglevel_str_debug_unit;
++extern const char * const mi_lttng_loglevel_str_emerg;
++extern const char * const mi_lttng_loglevel_str_err;
++extern const char * const mi_lttng_loglevel_str_info;
++extern const char * const mi_lttng_loglevel_str_notice;
++extern const char * const mi_lttng_loglevel_str_unknown;
++extern const char * const mi_lttng_loglevel_str_warning;
+ 
+ /* String related to loglevel JUL */
+-const char * const mi_lttng_loglevel_str_jul_all;
+-const char * const mi_lttng_loglevel_str_jul_config;
+-const char * const mi_lttng_loglevel_str_jul_fine;
+-const char * const mi_lttng_loglevel_str_jul_finer;
+-const char * const mi_lttng_loglevel_str_jul_finest;
+-const char * const mi_lttng_loglevel_str_jul_info;
+-const char * const mi_lttng_loglevel_str_jul_off;
+-const char * const mi_lttng_loglevel_str_jul_severe;
+-const char * const mi_lttng_loglevel_str_jul_warning;
++extern const char * const mi_lttng_loglevel_str_jul_all;
++extern const char * const mi_lttng_loglevel_str_jul_config;
++extern const char * const mi_lttng_loglevel_str_jul_fine;
++extern const char * const mi_lttng_loglevel_str_jul_finer;
++extern const char * const mi_lttng_loglevel_str_jul_finest;
++extern const char * const mi_lttng_loglevel_str_jul_info;
++extern const char * const mi_lttng_loglevel_str_jul_off;
++extern const char * const mi_lttng_loglevel_str_jul_severe;
++extern const char * const mi_lttng_loglevel_str_jul_warning;
+ 
+ /* String related to loglevel Log4j */
+-const char * const mi_lttng_loglevel_str_log4j_off;
+-const char * const mi_lttng_loglevel_str_log4j_fatal;
+-const char * const mi_lttng_loglevel_str_log4j_error;
+-const char * const mi_lttng_loglevel_str_log4j_warn;
+-const char * const mi_lttng_loglevel_str_log4j_info;
+-const char * const mi_lttng_loglevel_str_log4j_debug;
+-const char * const mi_lttng_loglevel_str_log4j_trace;
+-const char * const mi_lttng_loglevel_str_log4j_all;
++extern const char * const mi_lttng_loglevel_str_log4j_off;
++extern const char * const mi_lttng_loglevel_str_log4j_fatal;
++extern const char * const mi_lttng_loglevel_str_log4j_error;
++extern const char * const mi_lttng_loglevel_str_log4j_warn;
++extern const char * const mi_lttng_loglevel_str_log4j_info;
++extern const char * const mi_lttng_loglevel_str_log4j_debug;
++extern const char * const mi_lttng_loglevel_str_log4j_trace;
++extern const char * const mi_lttng_loglevel_str_log4j_all;
+ 
+ /* String related to loglevel type */
+-const char * const mi_lttng_loglevel_type_all;
+-const char * const mi_lttng_loglevel_type_range;
+-const char * const mi_lttng_loglevel_type_single;
+-const char * const mi_lttng_loglevel_type_unknown;
++extern const char * const mi_lttng_loglevel_type_all;
++extern const char * const mi_lttng_loglevel_type_range;
++extern const char * const mi_lttng_loglevel_type_single;
++extern const char * const mi_lttng_loglevel_type_unknown;
+ 
+ /* Sting related to lttng_calibrate */
+-const char * const mi_lttng_element_calibrate;
+-const char * const mi_lttng_element_calibrate_function;
++extern const char * const mi_lttng_element_calibrate;
++extern const char * const mi_lttng_element_calibrate_function;
+ 
+ /* String related to a lttng_snapshot */
+-const char * const mi_lttng_element_snapshot_ctrl_url;
+-const char * const mi_lttng_element_snapshot_data_url;
+-const char * const mi_lttng_element_snapshot_max_size;
+-const char * const mi_lttng_element_snapshot_n_ptr;
+-const char * const mi_lttng_element_snapshot_session_name;
+-const char * const mi_lttng_element_snapshots;
++extern const char * const mi_lttng_element_snapshot_ctrl_url;
++extern const char * const mi_lttng_element_snapshot_data_url;
++extern const char * const mi_lttng_element_snapshot_max_size;
++extern const char * const mi_lttng_element_snapshot_n_ptr;
++extern const char * const mi_lttng_element_snapshot_session_name;
++extern const char * const mi_lttng_element_snapshots;
+ 
+ /* Utility string function  */
+ const char *mi_lttng_loglevel_string(int value, enum lttng_domain_type domain);
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index f0969b5..8cc4220 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
            file://runtest-2.4.0.patch \
+           file://extern-decls.patch \
            file://run-ptest \
 	  "
 
-- 
2.1.4


