Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DRM5ZdpnrGjcuMFxjVFhpePw4sXmhk/IB82ihcxqdM8DPa96UmDE5Kmo0SOFEYHyiYsWG4OM0l
 oxJY31ZJ5aTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:01 -0700
IronPort-SDR: MidVpDHhYkOOA+oDYzuPQEfvXiSK8sxftHxdK16XAcZKPk++o49d0df7G64Jne4XGREJtPgzCP
 ti4XYMDcbMNg==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391125"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:00 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 03/13] lttng-modules: update to 2.10.14
Date: Mon,  6 Apr 2020 23:11:31 +0800
Message-Id: <88cce1d9d06ed4c5a7b58a31d75cfd1503605df9.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

Upgrade to version 2.10.14 in order to fix some build errors
with latest 5.4 kernel.

- conflicting types for 'trace_rcu_dyntick'
  Reproductible on kernel greater than v5.4.22, starting with commit
  6cf539a87a ("rcu: Fix data-race due to atomic_t copy-by-value")

Also drop patches which are no longer required.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Armin Kuster <akuster808@gmail.com>
Cc: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ops-when-trace-sunrpc_task-events-in.patch |  94 -------------
 ...rpc_clnt-dereference-in-rpc_task_que.patch |  44 ------
 ...rpc-use-signed-integer-for-client-id.patch | 105 --------------
 ...nrpc-introduce-lttng_get_clid-helper.patch | 130 ------------------
 ...es_2.10.11.bb => lttng-modules_2.10.14.bb} |  12 +-
 5 files changed, 4 insertions(+), 381 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.11.bb => lttng-modules_2.10.14.bb} (75%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
deleted file mode 100644
index bdbc4f811e..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 1ff7013bcf7f068cf4371d12d758f9c0fd16a619 Mon Sep 17 00:00:00 2001
-From: Quanyang Wang <quanyang.wang@windriver.com>
-Date: Thu, 5 Dec 2019 15:35:32 +0800
-Subject: [PATCH 1/4] Fix: SUNRPC: Fix oops when trace sunrpc_task events in
- nfs client
-
-See upstream commit :
-
-	commit 2ca310fc4160ed0420da65534a21ae77b24326a8
-	Author: Ditang Chen <chendt.fnst@cn.fujitsu.com>
-	Date: Fri, 7 Mar 2014 13:27:57 +0800
-	Subject: SUNRPC: Fix oops when trace sunrpc_task events in nfs client
-
-	When tracking sunrpc_task events in nfs client, the clnt pointer may be NULL.
-
-	[  139.269266] BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
-	[  139.269915] IP: [<ffffffffa026f216>] ftrace_raw_event_rpc_task_running+0x86/0xf0 [sunrpc]
-	[  139.269915] PGD 1d293067 PUD 1d294067 PMD 0
-	[  139.269915] Oops: 0000 [#1] SMP
-	[  139.269915] Modules linked in: nfsv4 dns_resolver nfs lockd sunrpc fscache sg ppdev e1000
-	serio_raw pcspkr parport_pc parport i2c_piix4 i2c_core microcode xfs libcrc32c sd_mod sr_mod
-	cdrom ata_generic crc_t10dif crct10dif_common pata_acpi ahci libahci ata_piix libata dm_mirror
-	dm_region_hash dm_log dm_mod
-	[  139.269915] CPU: 0 PID: 59 Comm: kworker/0:2 Not tainted 3.10.0-84.el7.x86_64 #1
-	[  139.269915] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
-	[  139.269915] Workqueue: rpciod rpc_async_schedule [sunrpc]
-	[  139.269915] task: ffff88001b598000 ti: ffff88001b632000 task.ti: ffff88001b632000
-	[  139.269915] RIP: 0010:[<ffffffffa026f216>]  [<ffffffffa026f216>] ftrace_raw_event_rpc_task_running+0x86/0xf0 [sunrpc]
-	[  139.269915] RSP: 0018:ffff88001b633d70  EFLAGS: 00010206
-	[  139.269915] RAX: ffff88001dfc5338 RBX: ffff88001cc37a00 RCX: ffff88001dfc5334
-	[  139.269915] RDX: ffff88001dfc5338 RSI: 0000000000000000 RDI: ffff88001dfc533c
-	[  139.269915] RBP: ffff88001b633db0 R08: 000000000000002c R09: 000000000000000a
-	[  139.269915] R10: 0000000000062180 R11: 00000020759fb9dc R12: ffffffffa0292c20
-	[  139.269915] R13: ffff88001dfc5334 R14: 0000000000000000 R15: 0000000000000000
-	[  139.269915] FS:  0000000000000000(0000) GS:ffff88001fc00000(0000) knlGS:0000000000000000
-	[  139.269915] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
-	[  139.269915] CR2: 0000000000000004 CR3: 000000001d290000 CR4: 00000000000006f0
-	[  139.269915] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
-	[  139.269915] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
-	[  139.269915] Stack:
-	[  139.269915]  000000001b633d98 0000000000000246 ffff88001df1dc00 ffff88001cc37a00
-	[  139.269915]  ffff88001bc35e60 0000000000000000 ffff88001ffa0a48 ffff88001bc35ee0
-	[  139.269915]  ffff88001b633e08 ffffffffa02704b5 0000000000010000 ffff88001cc37a70
-	[  139.269915] Call Trace:
-	[  139.269915]  [<ffffffffa02704b5>] __rpc_execute+0x1d5/0x400 [sunrpc]
-	[  139.269915]  [<ffffffffa0270706>] rpc_async_schedule+0x26/0x30 [sunrpc]
-	[  139.269915]  [<ffffffff8107867b>] process_one_work+0x17b/0x460
-	[  139.269915]  [<ffffffff8107942b>] worker_thread+0x11b/0x400
-	[  139.269915]  [<ffffffff81079310>] ? rescuer_thread+0x3e0/0x3e0
-	[  139.269915]  [<ffffffff8107fc80>] kthread+0xc0/0xd0
-	[  139.269915]  [<ffffffff8107fbc0>] ? kthread_create_on_node+0x110/0x110
-	[  139.269915]  [<ffffffff815d122c>] ret_from_fork+0x7c/0xb0
-	[  139.269915]  [<ffffffff8107fbc0>] ? kthread_create_on_node+0x110/0x110
-	[  139.269915] Code: 4c 8b 45 c8 48 8d 7d d0 89 4d c4 41 89 c9 b9 28 00 00 00 e8 9d b4 e9
-	e0 48 85 c0 49 89 c5 74 a2 48 89 c7 e8 9d 3f e9 e0 48 89 c2 <41> 8b 46 04 48 8b 7d d0 4c
-	89 e9 4c 89 e6 89 42 0c 0f b7 83 d4
-	[  139.269915] RIP  [<ffffffffa026f216>] ftrace_raw_event_rpc_task_running+0x86/0xf0 [sunrpc]
-	[  139.269915]  RSP <ffff88001b633d70>
-	[  139.269915] CR2: 0000000000000004
-	[  140.946406] ---[ end trace ba486328b98d7622 ]---
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/2b228b503cad10bf0c5a99b42a908ca906eab5b9]
-
-Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- instrumentation/events/lttng-module/rpc.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
-index 3798e8e..fb13106 100644
---- a/instrumentation/events/lttng-module/rpc.h
-+++ b/instrumentation/events/lttng-module/rpc.h
-@@ -139,7 +139,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(unsigned int, client_id, task->tk_client ? task->tk_client->cl_clid : -1)
- 		ctf_integer_hex(const void *, action, action)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
-@@ -208,7 +208,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(unsigned int, client_id, task->tk_client ? task->tk_client->cl_clid : -1)
- 		ctf_integer_hex(const void *, action, action)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch
deleted file mode 100644
index 03264bac68..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 032a74d83b263c4faead8e4c25d497fb8ea07b6e Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Thu, 12 Dec 2019 10:29:02 -0500
-Subject: [PATCH 2/4] Fix: sunrpc: null rpc_clnt dereference in rpc_task_queued
- tracepoint
-
-Based on upstream Linux commit:
-
-commit 0be283f676a1e7b208db0c992283197ef8b52158
-Author: Benjamin Coddington <bcodding@redhat.com>
-Date:   Tue Jan 23 09:32:35 2018 -0500
-
-    SUNRPC: Fix null rpc_clnt dereference in rpc_task_queued tracepoint
-
-    Backchannel tasks will not have a reference to the rpc_clnt.  Return -1 for
-    cl_clid in that case.
-
-    Signed-off-by: Benjamin Coddington <bcodding@redhat.com>
-    Signed-off-by: Trond Myklebust <trondmy@gmail.com>
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/8f83a9103dcdf4f6b73783427fc5ded4869309d5]
-Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
----
- instrumentation/events/lttng-module/rpc.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
-index fb13106..68c622c 100644
---- a/instrumentation/events/lttng-module/rpc.h
-+++ b/instrumentation/events/lttng-module/rpc.h
-@@ -176,7 +176,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(unsigned int, client_id, task->tk_client ?
-+				task->tk_client->cl_clid : -1)
- 		ctf_integer(unsigned long, timeout, task->tk_timeout)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch
deleted file mode 100644
index c7529f16dd..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 70389e422dd3146161089d454f525367c9046ecd Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Thu, 12 Dec 2019 10:29:37 -0500
-Subject: [PATCH 3/4] Fix: sunrpc: use signed integer for client id
-
-Within include/linux/sunrpc/clnt.h:struct rpc_cltn, the cl_clid field
-is an unsigned integer, which is the type expected by the tracepoint
-signature.
-
-However, looking into net/sunrpc/clnt.c:rpc_alloc_clid(), its allocation
-considers negative signed integer as errors.
-
-Therefore, in order to properly show "-1" in the trace output (rather
-than MAX_INT) when called with a NULL task->tk_client, move to a
-signed integer as backing type for the client_id field.
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/cc7bb0aa52cae22255581d67841449bb8ea36fda]
-Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
----
- instrumentation/events/lttng-module/rpc.h | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
-index 68c622c..2d06e55 100644
---- a/instrumentation/events/lttng-module/rpc.h
-+++ b/instrumentation/events/lttng-module/rpc.h
-@@ -18,7 +18,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, task->tk_client->cl_clid)
- 		ctf_integer(int, status, task->tk_status)
- 	)
- )
-@@ -43,7 +43,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, task->tk_client->cl_clid)
- 		ctf_integer(int, status, task->tk_status)
- 	)
- )
-@@ -100,7 +100,7 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, task->tk_client->cl_clid)
- 		ctf_integer(int, status, task->tk_status)
- 	)
- )
-@@ -112,7 +112,7 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, task->tk_client->cl_clid)
- 		ctf_integer(int, status, status)
- 	)
- )
-@@ -139,7 +139,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client ? task->tk_client->cl_clid : -1)
-+		ctf_integer(int, client_id, task->tk_client ?
-+			task->tk_client->cl_clid : -1)
- 		ctf_integer_hex(const void *, action, action)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
-@@ -176,7 +177,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client ?
-+		ctf_integer(int, client_id, task->tk_client ?
- 				task->tk_client->cl_clid : -1)
- 		ctf_integer(unsigned long, timeout, task->tk_timeout)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
-@@ -209,7 +210,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client ? task->tk_client->cl_clid : -1)
-+		ctf_integer(int, client_id, task->tk_client ?
-+			task->tk_client->cl_clid : -1)
- 		ctf_integer_hex(const void *, action, action)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
-@@ -246,7 +248,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, task->tk_client ?
-+			task->tk_client->cl_clid : -1)
- 		ctf_integer(unsigned long, timeout, task->tk_timeout)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch
deleted file mode 100644
index 4dd726cf2c..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From b6903d57e4c3234ec5b1c7f72e232023cdee0fab Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Thu, 12 Dec 2019 10:39:38 -0500
-Subject: [PATCH 4/4] sunrpc: introduce lttng_get_clid helper
-
-Introduce the lttng_get_clid helper to always check for NULL pointer
-when getting the client id. While not always strictly needed depending
-on the tracepoint callsite, prefer robustness of instrumentation and
-always check for NULL rather than play whack-a-mole.
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/1330a091a687a406513c3a326c2fc2a0dbe75536]
-Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
----
- instrumentation/events/lttng-module/rpc.h | 43 ++++++++++++++++-------
- 1 file changed, 31 insertions(+), 12 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
-index 2d06e55..ceaf9db 100644
---- a/instrumentation/events/lttng-module/rpc.h
-+++ b/instrumentation/events/lttng-module/rpc.h
-@@ -9,6 +9,29 @@
- #include <linux/sunrpc/sched.h>
- #include <linux/sunrpc/clnt.h>
- 
-+#ifndef ONCE_LTTNG_RPC_H
-+#define ONCE_LTTNG_RPC_H
-+
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
-+static inline
-+int lttng_get_clid(const struct rpc_task *task)
-+{
-+	struct rpc_clnt *tk_client;
-+
-+	tk_client = task->tk_client;
-+	if (!tk_client)
-+		return -1;
-+	/*
-+	 * The cl_clid field is always initialized to positive signed
-+	 * integers. Negative signed integer values are treated as
-+	 * errors.
-+	 */
-+	return (int) tk_client->cl_clid;
-+}
-+#endif /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
-+
-+#endif /* ONCE_LTTNG_RPC_H */
-+
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
- 
-@@ -18,7 +41,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer(int, status, task->tk_status)
- 	)
- )
-@@ -43,7 +66,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer(int, status, task->tk_status)
- 	)
- )
-@@ -100,7 +123,7 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer(int, status, task->tk_status)
- 	)
- )
-@@ -112,7 +135,7 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client->cl_clid)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer(int, status, status)
- 	)
- )
-@@ -139,8 +162,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client ?
--			task->tk_client->cl_clid : -1)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer_hex(const void *, action, action)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
-@@ -177,8 +199,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client ?
--				task->tk_client->cl_clid : -1)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer(unsigned long, timeout, task->tk_timeout)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
-@@ -210,8 +231,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client ?
--			task->tk_client->cl_clid : -1)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer_hex(const void *, action, action)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
-@@ -248,8 +268,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
- 
- 	TP_FIELDS(
- 		ctf_integer(unsigned int, task_id, task->tk_pid)
--		ctf_integer(int, client_id, task->tk_client ?
--			task->tk_client->cl_clid : -1)
-+		ctf_integer(int, client_id, lttng_get_clid(task))
- 		ctf_integer(unsigned long, timeout, task->tk_timeout)
- 		ctf_integer(unsigned long, runstate, task->tk_runstate)
- 		ctf_integer(int, status, task->tk_status)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.14.bb
similarity index 75%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.14.bb
index cc4f44519a..1c24e94902 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.14.bb
@@ -14,14 +14,10 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch \
-           file://0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch \
-           file://0003-Fix-sunrpc-use-signed-integer-for-client-id.patch \
-           file://0004-sunrpc-introduce-lttng_get_clid-helper.patch \
            "
 
-SRC_URI[md5sum] = "c618fb646514dfc1bf910cfd7cda4256"
-SRC_URI[sha256sum] = "7f91e39b2e8e46d8bbba2b4c8c1614f1fb380611cd1a1fccc1d1859be26112f1"
+SRC_URI[md5sum] = "3e9ed67a2da17edf93194f8a5e75a246"
+SRC_URI[sha256sum] = "d0ba614a9cac3daf8ac034837f8b786e6be2ce0242aeecef7096bed5e03b762c"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
@@ -44,7 +40,7 @@ SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.1
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "624aca5d7507fbd11ea4a1a474c3aa1031bd9a31"
-PV_class-devupstream = "2.10.10+git${SRCPV}"
+SRCREV_class-devupstream = "b34304f146ea234ea764580d7ce1b03d05a215f9"
+PV_class-devupstream = "2.10.14+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.25.1

