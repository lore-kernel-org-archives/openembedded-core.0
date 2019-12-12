Return-Path: <jonathan.rajotte-julien@efficios.com>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Dec 2019 16:21:51 UTC
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 1E47F7BFB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 16:21:51 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 2E204688088;
	Thu, 12 Dec 2019 11:15:25 -0500 (EST)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id 9zj9BRM8Krvk; Thu, 12 Dec 2019 11:15:24 -0500 (EST)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 7C85668807F;
	Thu, 12 Dec 2019 11:15:24 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 7C85668807F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1576167324;
	bh=MMHHJu7baikIAHaCrDWmNREOdeEH6DpfQ84tnS/8qzA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=urWVCzW6nwkEi90PnSybkrlFVMePD4AzdsNWKn39gTYuWBcLr9++phDRnjvXJJ5hO
	HQVuXx4iaYk2KYJV7Vti+5X9D1CI9XL98DWAbBAJIonZeOVE/sFdH4doFpB2fig5it
	k5mgzr6I/VrmR0Fs7DIPZtXGWkjdKbuunLERSBxqB8qDSeafuHws3LqR7k+iJht847
	bbD2Tg1DIuyxfpe/9Lh7M/deL3TChnyhhzTFArLIY2u2smyxDTZtUlchnI//bg0nxi
	XovqUWelCNslCb4V2cz4D6Bph+o/5RNIZHmdcF9vywQTYMCaSzlC+fQYQMXam0/wh9
	M/9JZMn+xrNhQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 93Pzqh2OuBdE; Thu, 12 Dec 2019 11:15:24 -0500 (EST)
Received: from joraj-alpa (unknown [107.159.43.215])
	by mail.efficios.com (Postfix) with ESMTPSA id 57807688076;
	Thu, 12 Dec 2019 11:15:24 -0500 (EST)
Date: Thu, 12 Dec 2019 11:15:24 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: quanyang.wang@windriver.com
Message-ID: <20191212161524.GC30347@joraj-alpa>
References: <20191212072511.31930-1-quanyang.wang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191212072511.31930-1-quanyang.wang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: fix NULL pointer deference error when testing rpc_task_running
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
X-List-Received-Date: Thu, 12 Dec 2019 16:21:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

See [1]. An updated version of this fix was merged upstream.

Please validate that it does the job on your side.

In the future please take the time to submit this kind of patch to the upstream
project first so that we can act on it.

[1] https://lists.lttng.org/pipermail/lttng-dev/2019-December/029462.html

Cheers

On Thu, Dec 12, 2019 at 03:25:11PM +0800, quanyang.wang@windriver.com wrote:
> From: Quanyang Wang <quanyang.wang@windriver.com>
> 
> This fixes NULL pointer deference error when running kts testcase lttng_syscall_events.
> 
> Upstream-Status: Pending
> 
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> ---
>  ...ops-when-trace-sunrpc_task-events-in.patch | 93 +++++++++++++++++++
>  .../lttng/lttng-modules_2.10.11.bb            |  1 +
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
> new file mode 100644
> index 0000000000..b46bf26dd4
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
> @@ -0,0 +1,93 @@
> +From f79f32bffcd968748e744e273e73b6048c4668f4 Mon Sep 17 00:00:00 2001
> +From: Quanyang Wang <quanyang.wang@windriver.com>
> +Date: Thu, 5 Dec 2019 13:41:06 +0800
> +Subject: [PATCH] Fix: SUNRPC: Fix oops when trace sunrpc_task events in nfs
> + client
> +
> +See upstream commit :
> +
> +	commit 2ca310fc4160ed0420da65534a21ae77b24326a8
> +	Author: Ditang Chen <chendt.fnst@cn.fujitsu.com>
> +	Date: Fri, 7 Mar 2014 13:27:57 +0800
> +	Subject: SUNRPC: Fix oops when trace sunrpc_task events in nfs client
> +
> +	When tracking sunrpc_task events in nfs client, the clnt pointer may be NULL.
> +
> +	[  139.269266] BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
> +	[  139.269915] IP: [<ffffffffa026f216>] ftrace_raw_event_rpc_task_running+0x86/0xf0 [sunrpc]
> +	[  139.269915] PGD 1d293067 PUD 1d294067 PMD 0
> +	[  139.269915] Oops: 0000 [#1] SMP
> +	[  139.269915] Modules linked in: nfsv4 dns_resolver nfs lockd sunrpc fscache sg ppdev e1000
> +	serio_raw pcspkr parport_pc parport i2c_piix4 i2c_core microcode xfs libcrc32c sd_mod sr_mod
> +	cdrom ata_generic crc_t10dif crct10dif_common pata_acpi ahci libahci ata_piix libata dm_mirror
> +	dm_region_hash dm_log dm_mod
> +	[  139.269915] CPU: 0 PID: 59 Comm: kworker/0:2 Not tainted 3.10.0-84.el7.x86_64 #1
> +	[  139.269915] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
> +	[  139.269915] Workqueue: rpciod rpc_async_schedule [sunrpc]
> +	[  139.269915] task: ffff88001b598000 ti: ffff88001b632000 task.ti: ffff88001b632000
> +	[  139.269915] RIP: 0010:[<ffffffffa026f216>]  [<ffffffffa026f216>] ftrace_raw_event_rpc_task_running+0x86/0xf0 [sunrpc]
> +	[  139.269915] RSP: 0018:ffff88001b633d70  EFLAGS: 00010206
> +	[  139.269915] RAX: ffff88001dfc5338 RBX: ffff88001cc37a00 RCX: ffff88001dfc5334
> +	[  139.269915] RDX: ffff88001dfc5338 RSI: 0000000000000000 RDI: ffff88001dfc533c
> +	[  139.269915] RBP: ffff88001b633db0 R08: 000000000000002c R09: 000000000000000a
> +	[  139.269915] R10: 0000000000062180 R11: 00000020759fb9dc R12: ffffffffa0292c20
> +	[  139.269915] R13: ffff88001dfc5334 R14: 0000000000000000 R15: 0000000000000000
> +	[  139.269915] FS:  0000000000000000(0000) GS:ffff88001fc00000(0000) knlGS:0000000000000000
> +	[  139.269915] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> +	[  139.269915] CR2: 0000000000000004 CR3: 000000001d290000 CR4: 00000000000006f0
> +	[  139.269915] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> +	[  139.269915] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> +	[  139.269915] Stack:
> +	[  139.269915]  000000001b633d98 0000000000000246 ffff88001df1dc00 ffff88001cc37a00
> +	[  139.269915]  ffff88001bc35e60 0000000000000000 ffff88001ffa0a48 ffff88001bc35ee0
> +	[  139.269915]  ffff88001b633e08 ffffffffa02704b5 0000000000010000 ffff88001cc37a70
> +	[  139.269915] Call Trace:
> +	[  139.269915]  [<ffffffffa02704b5>] __rpc_execute+0x1d5/0x400 [sunrpc]
> +	[  139.269915]  [<ffffffffa0270706>] rpc_async_schedule+0x26/0x30 [sunrpc]
> +	[  139.269915]  [<ffffffff8107867b>] process_one_work+0x17b/0x460
> +	[  139.269915]  [<ffffffff8107942b>] worker_thread+0x11b/0x400
> +	[  139.269915]  [<ffffffff81079310>] ? rescuer_thread+0x3e0/0x3e0
> +	[  139.269915]  [<ffffffff8107fc80>] kthread+0xc0/0xd0
> +	[  139.269915]  [<ffffffff8107fbc0>] ? kthread_create_on_node+0x110/0x110
> +	[  139.269915]  [<ffffffff815d122c>] ret_from_fork+0x7c/0xb0
> +	[  139.269915]  [<ffffffff8107fbc0>] ? kthread_create_on_node+0x110/0x110
> +	[  139.269915] Code: 4c 8b 45 c8 48 8d 7d d0 89 4d c4 41 89 c9 b9 28 00 00 00 e8 9d b4 e9
> +	e0 48 85 c0 49 89 c5 74 a2 48 89 c7 e8 9d 3f e9 e0 48 89 c2 <41> 8b 46 04 48 8b 7d d0 4c
> +	89 e9 4c 89 e6 89 42 0c 0f b7 83 d4
> +	[  139.269915] RIP  [<ffffffffa026f216>] ftrace_raw_event_rpc_task_running+0x86/0xf0 [sunrpc]
> +	[  139.269915]  RSP <ffff88001b633d70>
> +	[  139.269915] CR2: 0000000000000004
> +	[  140.946406] ---[ end trace ba486328b98d7622 ]---
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> +---
> + instrumentation/events/lttng-module/rpc.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
> +index 3798e8e..fb13106 100644
> +--- a/instrumentation/events/lttng-module/rpc.h
> ++++ b/instrumentation/events/lttng-module/rpc.h
> +@@ -139,7 +139,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
> + 
> + 	TP_FIELDS(
> + 		ctf_integer(unsigned int, task_id, task->tk_pid)
> +-		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> ++		ctf_integer(unsigned int, client_id, task->tk_client ? task->tk_client->cl_clid : -1)
> + 		ctf_integer_hex(const void *, action, action)
> + 		ctf_integer(unsigned long, runstate, task->tk_runstate)
> + 		ctf_integer(int, status, task->tk_status)
> +@@ -208,7 +208,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
> + 
> + 	TP_FIELDS(
> + 		ctf_integer(unsigned int, task_id, task->tk_pid)
> +-		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> ++		ctf_integer(unsigned int, client_id, task->tk_client ? task->tk_client->cl_clid : -1)
> + 		ctf_integer_hex(const void *, action, action)
> + 		ctf_integer(unsigned long, runstate, task->tk_runstate)
> + 		ctf_integer(int, status, task->tk_status)
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
> index c116fddc60..494b2031c1 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
> @@ -14,6 +14,7 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
>  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> +           file://0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch \
>             "
>  
>  SRC_URI[md5sum] = "c618fb646514dfc1bf910cfd7cda4256"
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

