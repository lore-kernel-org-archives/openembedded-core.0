Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 883B8615E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 08:42:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01P8g117021865
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 25 Feb 2020 00:42:01 -0800 (PST)
Received: from [0.0.0.0] (147.11.103.217) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 25 Feb 2020 00:42:00 -0800
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
References: <1582165584-187223-1-git-send-email-li.zhou@windriver.com>
	<1196510898.2098.1582210055795.JavaMail.zimbra@efficios.com>
From: zhou li <li.zhou@windriver.com>
Message-ID: <91eec671-f8e8-96ed-1520-d91860644d85@windriver.com>
Date: Tue, 25 Feb 2020 16:41:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1196510898.2098.1582210055795.JavaMail.zimbra@efficios.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: Check the pid_ns before using it because it may be NULL
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
X-List-Received-Date: Tue, 25 Feb 2020 08:42:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/20/20 10:47 PM, Jonathan Rajotte-Julien wrote:
> Hi,
>
> Can we get more info on the kernel version and config?
>
> Did you submit this on our mailing list?(lttng-dev). If not I would highly recommend that you do so in the future so we can eliminate *custom* patches and get to the bottom of the issue at hand so that the whole community benefit from it.


Hi, Jonathan:

         Thank you for you help and suggestion on this. This issue is 
seen on linux 4.18 + lttng-modules 2.10.


>
> Cheers
>
> ----- Li Zhou <li.zhou@windriver.com> wrote:
>> Check the pid_ns before using it because it may be NULL to fix below
>> issue:
>> <1>[ 22.637196] Unable to handle kernel NULL pointer dereference at
>> virtual address 0000000000000080
>> <1>[ 22.645982] Mem abort info:
>> <1>[ 22.648769] ESR = 0x96000007
>> <1>[ 22.651817] Exception class = DABT (current EL), IL = 32 bits
>> <1>[ 22.657730] SET = 0, FnV = 0
>> <1>[ 22.660777] EA = 0, S1PTW = 0
>> <1>[ 22.663910] Data abort info:
>> <1>[ 22.666784] ISV = 0, ISS = 0x00000007
>> <1>[ 22.670611] CM = 0, WnR = 0
>> <1>[ 22.673574] user pgtable: 4k pages, 39-bit VAs, pgdp =
>> 0000000012378f78
>> <1>[ 22.680180] [0000000000000080] pgd=000000007f023003,
>> pud=000000007f023003, pmd=000000007f01f003, pte=0000000000000000
>> <0>[ 22.690794] Internal error: Oops: 96000007 [#1] PREEMPT SMP
>> <4>[ 22.690797] Modules linked in: adkNetD ncp
>> lttng_ring_buffer_client_overwrite(C)
>> lttng_ring_buffer_metadata_client(C) lttng_ring_buffer_client_discard(C)
>> lttng_ring_buffer_client_mmap_overwrite(C)
>> lttng_ring_buffer_client_mmap_discard(C)
>> lttng_ring_buffer_metadata_mmap_client(C) lttng_probe_signal(C)
>> lttng_probe_printk(C) lttng_probe_sched(C) lttng_probe_irq(C)
>> lttng_tracer(C) lttng_statedump(C) lttng_ftrace(C)
>> lttng_lib_ring_buffer(C) lttng_clock_plugin_arm_cntpct(C) lttng_clock(C)
>> <0>[ 22.690823] Process lttng-sessiond (pid: 3093, stack limit =
>> 0x000000005d27910f)
>> <4>[ 22.690828] CPU: 1 PID: 3093 Comm: lttng-sessiond Tainted: G C
>> 4.18.37-rt820-custom #1
>> <4>[ 22.690830] Hardware name: DUS33 (CPM2-20) (DT)
>> <4>[ 22.690833] pstate: 60000005 (nZCv daif -PAN -UAO)
>> <4>[ 22.690845] pc : do_lttng_statedump+0xcc/0x8a8 [lttng_statedump]
>> <4>[ 22.690849] lr : do_lttng_statedump+0xc4/0x8a8 [lttng_statedump]
>> <4>[ 22.690851] sp : ffffffc07fe57ad0
>> <4>[ 22.690852] x29: ffffffc07fe57ad0 x28: ffffffc008ae2700
>> <4>[ 22.690856] x27: ffffff8000724000 x26: 0000000000000001
>> <4>[ 22.690859] x25: ffffff80089c9620 x24: 0000000000000000
>> <4>[ 22.690862] x23: ffffffc008ae2e10 x22: ffffff80089d3380
>> <4>[ 22.690865] x21: ffffffc07f450000 x20: ffffffc008ae2700
>> <4>[ 22.690869] x19: 0000000000000007 x18: 00000000fffffffe
>> <4>[ 22.690871] x17: 0000000000000000 x16: ffffff800824b980
>> <4>[ 22.690874] x15: 0000000000000000 x14: 736162203b656e6f
>> <4>[ 22.690877] x13: 6e203d20676e6964 x12: 0000000000000000
>> <4>[ 22.690880] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
>> <4>[ 22.690882] x9 : 3c1f647968721eff x8 : ffffffc0877504c8
>> <4>[ 22.690886] x7 : 09093a7c093a7c08 x6 : ffffff8010c4b317
>> <4>[ 22.690888] x5 : 0000000000000000 x4 : 00000040a7575000
>> <4>[ 22.690891] x3 : ffffffc008ae2e28 x2 : 0000000000000000
>> <4>[ 22.690894] x1 : 0000000000000000 x0 : 0000000000000000
>> <4>[ 22.690896] Call trace:
>> <4>[ 22.690902] do_lttng_statedump+0xcc/0x8a8 [lttng_statedump]
>> <4>[ 22.690905] lttng_statedump_start+0x20/0x30 [lttng_statedump]
>> <4>[ 22.690981] lttng_session_enable+0xf0/0x120 [lttng_tracer]
>> <4>[ 22.691018] lttng_session_ioctl+0x22c/0x328 [lttng_tracer]
>> <4>[ 22.691026] compat_sys_ioctl+0x110/0x778
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   ...es-Check-the-pid_ns-before-using-it-becau.patch | 86 ++++++++++++++++++++++
>>   meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb  |  2 +
>>   2 files changed, 88 insertions(+)
>>   create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-Check-the-pid_ns-before-using-it-becau.patch
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-Check-the-pid_ns-before-using-it-becau.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-Check-the-pid_ns-before-using-it-becau.patch
>> new file mode 100644
>> index 0000000..5306c79
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-Check-the-pid_ns-before-using-it-becau.patch
>> @@ -0,0 +1,86 @@
>> +From 0c0072e005ce9d591518d1819a39264859132561 Mon Sep 17 00:00:00 2001
>> +From: Li Zhou <li.zhou@windriver.com>
>> +Date: Wed, 19 Feb 2020 11:14:38 +0800
>> +Subject: [PATCH] lttng-modules: Check the pid_ns before using it because it
>> + may be NULL
>> +
>> +<1>[ 22.637196] Unable to handle kernel NULL pointer dereference at
>> +virtual address 0000000000000080
>> +<1>[ 22.645982] Mem abort info:
>> +<1>[ 22.648769] ESR = 0x96000007
>> +<1>[ 22.651817] Exception class = DABT (current EL), IL = 32 bits
>> +<1>[ 22.657730] SET = 0, FnV = 0
>> +<1>[ 22.660777] EA = 0, S1PTW = 0
>> +<1>[ 22.663910] Data abort info:
>> +<1>[ 22.666784] ISV = 0, ISS = 0x00000007
>> +<1>[ 22.670611] CM = 0, WnR = 0
>> +<1>[ 22.673574] user pgtable: 4k pages, 39-bit VAs, pgdp =
>> +0000000012378f78
>> +<1>[ 22.680180] [0000000000000080] pgd=000000007f023003,
>> +pud=000000007f023003, pmd=000000007f01f003, pte=0000000000000000
>> +<0>[ 22.690794] Internal error: Oops: 96000007 [#1] PREEMPT SMP
>> +<4>[ 22.690797] Modules linked in: adkNetD ncp
>> +lttng_ring_buffer_client_overwrite(C)
>> +lttng_ring_buffer_metadata_client(C) lttng_ring_buffer_client_discard(C)
>> +lttng_ring_buffer_client_mmap_overwrite(C)
>> +lttng_ring_buffer_client_mmap_discard(C)
>> +lttng_ring_buffer_metadata_mmap_client(C) lttng_probe_signal(C)
>> +lttng_probe_printk(C) lttng_probe_sched(C) lttng_probe_irq(C)
>> +lttng_tracer(C) lttng_statedump(C) lttng_ftrace(C)
>> +lttng_lib_ring_buffer(C) lttng_clock_plugin_arm_cntpct(C) lttng_clock(C)
>> +<0>[ 22.690823] Process lttng-sessiond (pid: 3093, stack limit =
>> +0x000000005d27910f)
>> +<4>[ 22.690828] CPU: 1 PID: 3093 Comm: lttng-sessiond Tainted: G C
>> +4.18.37-rt820-custom #1
>> +<4>[ 22.690830] Hardware name: DUS33 (CPM2-20) (DT)
>> +<4>[ 22.690833] pstate: 60000005 (nZCv daif -PAN -UAO)
>> +<4>[ 22.690845] pc : do_lttng_statedump+0xcc/0x8a8 [lttng_statedump]
>> +<4>[ 22.690849] lr : do_lttng_statedump+0xc4/0x8a8 [lttng_statedump]
>> +<4>[ 22.690851] sp : ffffffc07fe57ad0
>> +<4>[ 22.690852] x29: ffffffc07fe57ad0 x28: ffffffc008ae2700
>> +<4>[ 22.690856] x27: ffffff8000724000 x26: 0000000000000001
>> +<4>[ 22.690859] x25: ffffff80089c9620 x24: 0000000000000000
>> +<4>[ 22.690862] x23: ffffffc008ae2e10 x22: ffffff80089d3380
>> +<4>[ 22.690865] x21: ffffffc07f450000 x20: ffffffc008ae2700
>> +<4>[ 22.690869] x19: 0000000000000007 x18: 00000000fffffffe
>> +<4>[ 22.690871] x17: 0000000000000000 x16: ffffff800824b980
>> +<4>[ 22.690874] x15: 0000000000000000 x14: 736162203b656e6f
>> +<4>[ 22.690877] x13: 6e203d20676e6964 x12: 0000000000000000
>> +<4>[ 22.690880] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
>> +<4>[ 22.690882] x9 : 3c1f647968721eff x8 : ffffffc0877504c8
>> +<4>[ 22.690886] x7 : 09093a7c093a7c08 x6 : ffffff8010c4b317
>> +<4>[ 22.690888] x5 : 0000000000000000 x4 : 00000040a7575000
>> +<4>[ 22.690891] x3 : ffffffc008ae2e28 x2 : 0000000000000000
>> +<4>[ 22.690894] x1 : 0000000000000000 x0 : 0000000000000000
>> +<4>[ 22.690896] Call trace:
>> +<4>[ 22.690902] do_lttng_statedump+0xcc/0x8a8 [lttng_statedump]
>> +<4>[ 22.690905] lttng_statedump_start+0x20/0x30 [lttng_statedump]
>> +<4>[ 22.690981] lttng_session_enable+0xf0/0x120 [lttng_tracer]
>> +<4>[ 22.691018] lttng_session_ioctl+0x22c/0x328 [lttng_tracer]
>> +<4>[ 22.691026] compat_sys_ioctl+0x110/0x778
>> +
>> +Signed-off-by: Liguang Li <liguang.li@windriver.com>
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> +---
>> + lttng-statedump-impl.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
>> +index 1c09e51..fb609e3 100644
>> +--- a/lttng-statedump-impl.c
>> ++++ b/lttng-statedump-impl.c
>> +@@ -397,7 +397,7 @@ void lttng_statedump_process_ns(struct lttng_session *session,
>> + 	do {
>> + 		trace_lttng_statedump_process_state(session,
>> + 			p, type, mode, submode, status, pid_ns);
>> +-		pid_ns = pid_ns->parent;
>> ++		pid_ns = pid_ns ? pid_ns->parent : NULL;
>> + 	} while (pid_ns);
>> + }
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
>> index c833ff7..cbd43e3 100644
>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
>> @@ -11,6 +11,7 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
>>   SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>>              file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>>              file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>> +           file://0001-lttng-modules-Check-the-pid_ns-before-using-it-becau.patch \
>>              "
>>   
>>   SRC_URI[md5sum] = "0d964723c8765b39835e5e6efc60a604"
>> @@ -36,6 +37,7 @@ DEFAULT_PREFERENCE_class-devupstream = "-1"
>>   SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
>>              file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>>              file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>> +           file://0001-lttng-modules-Check-the-pid_ns-before-using-it-becau.patch \
>>              "
>>   SRCREV_class-devupstream = "6ad0e68b43c3e52fcb3d47c4d823a7b84aeb443a"
>>   PV_class-devupstream = "2.11.1+git${SRCPV}"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


