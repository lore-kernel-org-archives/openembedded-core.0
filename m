Return-Path: <kamensky@cisco.com>
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id 20C2D77EFE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=10922; q=dns/txt;
	s=iport; t=1520727091; x=1521936691;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version:content-id;
	bh=feCqsLJ2nNjLdnUnFJ1vWa2oL2C3R80AopLhUnLrZvo=;
	b=BaCbD8R+e/gFLSfm/oSTeOjc0oqC3x1TPJppydiVZrAfyAc8uT5P9tuP
	0GBhW3T00FTdDzCTTbjsMtqQ6P61h9hxns5xqnByLLopTR0DtGTJW8nAl
	jENkNw159Tgq+fREL7ZvUIDYeuSsHooiGKC1edrI3xjyVX/FKLW7nNAs/ Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BhAgDyc6Ra/40NJK1eGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZm8ojmKMf4FbKYEWlDKCFQoYC4QzTwKDESE1FwECAQEBAQE?=
	=?us-ascii?q?BAmsnhSMBAQEDAQEBJUcLBQsLGC4nAS8GARIUhHwID6t+OohcghqFNYIug3GCQ?=
	=?us-ascii?q?zaDLgEEh1gEiBWGUkaEDIcdCYZDhXuGCE6DZ4hJiXmBDYYbAgQLAhMBgSwgAjS?=
	=?us-ascii?q?BUk0jFTqCQwmCKRyCGh83iyIBAQE?=
X-IronPort-AV: E=Sophos;i="5.47,453,1515456000"; d="scan'208";a="81643116"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Mar 2018 00:11:13 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id w2B0BCcG029260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 11 Mar 2018 00:11:13 GMT
Date: Sat, 10 Mar 2018 16:11:12 -0800 (PST)
From: Victor Kamensky <kamensky@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ian Arkver <ian.arkver.dev@gmail.com>
In-Reply-To: <412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
Message-ID: <alpine.LRH.2.00.1803101241080.24419@sjc-ads-6991.cisco.com>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
	<412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Need arm64/qemu help
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
X-List-Received-Date: Sun, 11 Mar 2018 00:11:29 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="504000474-1949797254-1520715016=:24419"
Content-ID: <alpine.LRH.2.00.1803101602340.24419@sjc-ads-6991.cisco.com>

--504000474-1949797254-1520715016=:24419
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.00.1803101602341.24419@sjc-ads-6991.cisco.com>

Hi Richard, Ian,

Any progress on the issue? In case if not, I am adding few Linaro guys
who work on aarch64 qemu. Maybe they can give some insight.

I was able to reproduce on my system and I
and look at it under gdb. It seems that some strange aarch64
percularity might be in play. Details inline, root cause is still
not clear.

On Sat, 3 Mar 2018, Ian Arkver wrote:

> On 03/03/18 10:51, Ian Arkver wrote:
>> On 03/03/18 09:00, Richard Purdie wrote:
>>> Hi,
>>>
>>> I need some help with a problem we keep seeing:
>>>
>>> https://autobuilder.yocto.io/builders/nightly-arm64/builds/798
>>>
>>> Basically, now and again, for reasons we don't understand, all the
>>> sanity tests fail for qemuarm64.
>>>
>>> I've poked at this a bit and if I go in onto the failed machine and run
>>> this again, they work, using the same image, kernel and qemu binaries.
>>> We've seen this on two different autobuilder infrastructure on varying
>>> host OSs. They always seem to fail all three at once.
>>>
>>> Whilst this was a mut build, I saw this repeat three builds in a row on
>>> the new autobuilder we're setting up with master.
>>>
>>> The kernels always seem to hang somewhere around the:
>>>
>>> | [    0.766079] raid6: int64x1  xor()   302 MB/s
>>> | [    0.844597] raid6: int64x2  gen()   675 MB/s
>> 
>> I believe this is related to btrfs and comes from having btrfs compiled 
>> in to the kernel. You could maybe side-step the problem (and hence leave 
>> it lurking) by changing btrfs to a module.
>
> Actually, this comes from a library (lib/raid6), and in 4.14.y's arm64 
> defconfig BTRFS is already a module, so please disregard my hack suggestion.

Indeed, in my case when I run qemu with enabled remote gdbserver, and
in kernel hang boot case I press Ctrl-C and drop into gdb I see the
following traceback:

(gdb) bt
#0  vectors ()
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/entry.S:376
#1  0xffffff80089a2ff4 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>)
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/lib/raid6/algos.c:190
#2  raid6_select_algo ()
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/lib/raid6/algos.c:253
#3  0xffffff8008083b8c in do_one_initcall (fn=0xffffff80089a2e64 <raid6_select_algo>)
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/init/main.c:832
#4  0xffffff8008970e80 in do_initcall_level (level=<optimized out>)
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/init/main.c:898
#5  do_initcalls () at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/init/main.c:906
#6  do_basic_setup () at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/init/main.c:924
#7  kernel_init_freeable ()
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/init/main.c:1073
#8  0xffffff80087a2e00 in kernel_init (unused=<optimized out>)
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/init/main.c:999
#9  0xffffff80080850ec in ret_from_fork ()
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/entry.S:994
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb) x /10i $pc - 12
    0xffffff8008082274 <vectors+628>:	nop
    0xffffff8008082278 <vectors+632>:	nop
    0xffffff800808227c <vectors+636>:	nop
=> 0xffffff8008082280 <vectors+640>:	sub	sp, sp, #0x140
    0xffffff8008082284 <vectors+644>:	add	sp, sp, x0
    0xffffff8008082288 <vectors+648>:	sub	x0, sp, x0
    0xffffff800808228c <vectors+652>:	tbnz	w0, #14, 0xffffff800808229c <vectors+668>
    0xffffff8008082290 <vectors+656>:	sub	x0, sp, x0
    0xffffff8008082294 <vectors+660>:	sub	sp, sp, x0
    0xffffff8008082298 <vectors+664>:	b	0xffffff8008082fc0 <el1_irq>
(gdb) f 1
#1  0xffffff80089a2ff4 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>)
     at /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/lib/raid6/algos.c:190
190				preempt_disable();
(gdb) x /12i $pc - 12
    0xffffff80089a2fe8 <raid6_select_algo+388>:	cbz	x0, 0xffffff80089a3098 <raid6_select_algo+564>
    0xffffff80089a2fec <raid6_select_algo+392>:	mov	w0, #0x1                   	// #1
    0xffffff80089a2ff0 <raid6_select_algo+396>:	bl	0xffffff80080cc498 <preempt_count_add>
=> 0xffffff80089a2ff4 <raid6_select_algo+400>:	ldr	x0, [x23, #2688]
    0xffffff80089a2ff8 <raid6_select_algo+404>:	ldr	x5, [x23, #2688]
    0xffffff80089a2ffc <raid6_select_algo+408>:	cmp	x0, x5
    0xffffff80089a3000 <raid6_select_algo+412>:	b.ne	0xffffff80089a300c <raid6_select_algo+424>  // b.any
    0xffffff80089a3004 <raid6_select_algo+416>:	yield
    0xffffff80089a3008 <raid6_select_algo+420>:	b	0xffffff80089a2ff8 <raid6_select_algo+404>
    0xffffff80089a300c <raid6_select_algo+424>:	mov	x25, #0x0                   	// #0
    0xffffff80089a3010 <raid6_select_algo+428>:	ldr	x0, [x23, #2688]
    0xffffff80089a3014 <raid6_select_algo+432>:	mov	x4, x27

(gdb) b *0xffffff80089a2ff4
Breakpoint 8 at 0xffffff80089a2ff4: file /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work-shared/qemuarm64/kernel-source/lib/raid6/algos.c, line 191.

This corresponds to this code in lib/raid6/algos.c

    190                          preempt_disable();
    191                          j0 = jiffies;
    192                          while ((j1 = jiffies) == j0)
    193                                  cpu_relax();
    194                          while (time_before(jiffies,
    195                                              j1 + (1<<RAID6_TIME_JIFFIES_LG2))) {
    196                                  (*algo)->xor_syndrome(disks, start, stop,
    197                                                        PAGE_SIZE, *dptrs);
    198                                  perf++;
    199                          }
    200                          preempt_enable();

If for experiment sake I disable loop that tries to find
jiffies transition. I.e have something like this:

diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index 4769947..e0199fc 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -166,8 +166,12 @@ static inline const struct raid6_calls *raid6_choose_gen(

                         preempt_disable();
                         j0 = jiffies;
+#if 0
                         while ((j1 = jiffies) == j0)
                                 cpu_relax();
+#else
+                        j1 = jiffies;
+#endif /* 0 */
                         while (time_before(jiffies,
                                             j1 + (1<<RAID6_TIME_JIFFIES_LG2))) {
                                 (*algo)->gen_syndrome(disks, PAGE_SIZE, *dptrs);
@@ -189,8 +193,12 @@ static inline const struct raid6_calls *raid6_choose_gen(

                         preempt_disable();
                         j0 = jiffies;
+#if 0
                         while ((j1 = jiffies) == j0)
                                 cpu_relax();
+#else
+                        j1 = jiffies;
+#endif /* 0 */
                         while (time_before(jiffies,
                                             j1 + (1<<RAID6_TIME_JIFFIES_LG2))) {
                                 (*algo)->xor_syndrome(disks, start, stop,

Image boots fine after that.

I.e it looks as some strange effect in aarch64 qemu that seems does not
progress jiffies and code stuck.

Another observation is that if I put breakpoint for example
in do_timer, it actually hits the breakpoint, ie timer interrupt
happens in this case, and strangely raid6_choose_gen sequence
does progress, ie debugger breakpoints make this case unstuck.
Actually several pressing Ctrl-C to interrupt target, followed
by continue in gdb let code eventually go out of raid6_choose_gen.

Also whenever I presss Ctrl-C in gdb to stop target it always
in stalled case drops with $pc into first instruction of el1_irq,
I never saw different $pc hang code interrupt. Does it mean qemu
hangged on first instruction of el1_irq handler? Note once I do
stepi after that it ables to proceseed. If I continue steping
eventually it gets to arch_timer_handler_virt and do_timer.

For Linaro qemu aarch64 guys more details:

Situation happens on latest openembedded-core, for qemuarm64 MACHINE.
It does not happens always, i.e sometimes it works.

Qemu version is 2.11.1 and it is invoked like this (through regular
oe runqemu helper utility):

/wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-aarch64 -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -drive id=disk0,file=/wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/deploy/images/qemuarm64/core-image-minimal-qemuarm64-20180305025002.rootfs.ext4,if=none,format=raw -device virtio-blk-device,drive=disk0 -show-cursor -device virtio-rng-pci -monitor null -machine virt -cpu cortex-a57 -m 512 -serial mon:vc -serial null -kernel /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/deploy/images/qemuarm64/Image -append root=/dev/vda rw highres=off  mem=512M ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyAMA0,38400

My host system is ubuntu-16.04.

Please let's me know if you need additional info and/or want to
enable additional debug/trace options.

Thanks,
Victor

>> Regards,
>> Ian
>> 
>>> raid timing measurements.
>>>
>>> In the past we've dived in and handled these kinds of things but I've
>>> run out of people to lean on and I need help from the wider community.
>>>
>>> Can anyone help look into and fix this?
>>>
>>> This is serious as if nobody cares, I'll have to simply stop boot
>>> testing qemuarm64.
>>>
>>> Not sure if there is an open bug yet either :/.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--504000474-1949797254-1520715016=:24419--
