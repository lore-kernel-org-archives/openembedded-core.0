Return-Path: <kamensky@cisco.com>
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id 996C471A6B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 22:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=28014; q=dns/txt;
	s=iport; t=1521327110; x=1522536710;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=Mwtp92lZWLgdQZj7fcg0dRqfh1zsRgiE4eGYpu7okwg=;
	b=ewYzU8czhOOEjrZXx4AYzZGmlqI28UEEJ9935OkLOeXH2NLOCYHw9YIZ
	CqB5gnQcoF2GoiH2HsboKYL597a3bp2WCTxneS2JdvqYaqCVyJgFLXElQ
	a2bH+iEngUpltigzsMbvFTQ5oszeTh7yS6fEoJXPSc8y0HDhvrYYnNhU4 k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DYAAD4mq1a/4sNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZnIojXdyjQaBWil7G5QAghILG4R1AoM1ITQYAQIBAQEBAQE?=
	=?us-ascii?q?CayiFJQEBAQMBGg1EDhALEQMBAgEuTwgGARKFEAitHDqIVIIOhTOCFYMpNII5M?=
	=?us-ascii?q?4RwNoVJA4VBgXkHH4RWcD6KUgmIbIJtkQWKQYVNAgQLAhMBgSoeOIFSTSMVOoJ?=
	=?us-ascii?q?DCYIpG44+IDSQIAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,322,1517875200"; d="scan'208";a="85035305"
Received: from alln-core-6.cisco.com ([173.36.13.139])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2018 22:51:48 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-6.cisco.com (8.14.5/8.14.5) with ESMTP id w2HMplIW007373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 17 Mar 2018 22:51:48 GMT
Date: Sat, 17 Mar 2018 15:51:47 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <alpine.LRH.2.00.1803111848530.64087@sjc-ads-6991.cisco.com>
Message-ID: <alpine.LRH.2.00.1803171544580.27691@sjc-ads-6991.cisco.com>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
	<412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
	<alpine.LRH.2.00.1803101241080.24419@sjc-ads-6991.cisco.com>
	<CAFEAcA-d6-_tVRWKbZpVsQtece4fjuUqF+o+-m-AG4jPUHPY4g@mail.gmail.com>
	<alpine.LRH.2.00.1803111848530.64087@sjc-ads-6991.cisco.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Richard Henderson <richard.henderson@linaro.org>,
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
X-List-Received-Date: Sat, 17 Mar 2018 22:51:49 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="504000474-1804783593-1521327108=:27691"

--504000474-1804783593-1521327108=:27691
Content-Type: TEXT/PLAIN; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

Hi Folks,

I am back from ELC and I am looking at this issue again.

Alex Bennée from Linaro QEMU team reported that he tried to
reproduce the issue, even he went and build the same OE images -
but he could not reproduce it. Alex, thank you for the effort.

So since it is reprodicible on my machine I kept digging
myself. In no way I am qemu expert, but I think now I
understand what is happening. Long story with my debug notes
is below, but here is executive summery:

Linux kernel loop waiting for jiffies to move on, while
calling yield instruction, in our case aarch64 target runs
under one CPU configuration, and after Alex's commit "c22edfe
target-arm: don't generate WFE/YIELD calls for MTTCG" qemu
logic of handling yield instruction changed in such way
that it is treated as simple nop. But since it is single CPU
configuration, we have qemu looping in generated code
forver without existing loop to process pending vtimer
interrupt in order to move jiffies forward. c22edfe implies
that it is not parallel CPU case, but in our case even if
we have single CPU target parallel execution is still turned
on.

Revert of c22edfe fixes the issue, image boots OK. Booting
with more than one CPU "-smp 2" boots fine too. And possibly
could work as solid workaround for us. But how to fix the
issue without revert, while moving forward, I don't know.
I hope Alex and Linaro QEMU folks can come up with something.

Now, long debugging notes with my comments:

Kernel Hang Backtrace
---------------------

Looking at kernel hang under gdb attached to qemu (runqemu
qemuparams="-s -S" bootparams="nokaslr"):

(gdb) bt
#0  vectors () at /usr/src/kernel/arch/arm64/kernel/entry.S:413
#1  0xffffff80089a3758 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>) at /usr/src/kernel/lib/raid6/algos.c:190
#2  raid6_select_algo () at /usr/src/kernel/lib/raid6/algos.c:253
#3  0xffffff8008083bdc in do_one_initcall (fn=0xffffff80089a35c8 <raid6_select_algo>) at /usr/src/kernel/init/main.c:832
#4  0xffffff8008970e80 in do_initcall_level (level=<optimized out>) at /usr/src/kernel/init/main.c:898
#5  do_initcalls () at /usr/src/kernel/init/main.c:906
#6  do_basic_setup () at /usr/src/kernel/init/main.c:924
#7  kernel_init_freeable () at /usr/src/kernel/init/main.c:1073
#8  0xffffff80087afd90 in kernel_init (unused=<optimized out>) at /usr/src/kernel/init/main.c:999
#9  0xffffff800808517c in ret_from_fork () at /usr/src/kernel/arch/arm64/kernel/entry.S:1154
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb) f 1
#1  0xffffff80089a3758 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>) at /usr/src/kernel/lib/raid6/algos.c:190
190					continue;
(gdb) x /12i $pc - 12
    0xffffff80089a374c <raid6_select_algo+388>:	cbz	x0, 0xffffff80089a37fc <raid6_select_algo+564>
    0xffffff80089a3750 <raid6_select_algo+392>:	mov	w0, #0x1                   	// #1
    0xffffff80089a3754 <raid6_select_algo+396>:	bl	0xffffff80080d07c8 <preempt_count_add>
=> 0xffffff80089a3758 <raid6_select_algo+400>:	ldr	x0, [x23, #2688]
    0xffffff80089a375c <raid6_select_algo+404>:	ldr	x5, [x23, #2688]
    0xffffff80089a3760 <raid6_select_algo+408>:	cmp	x0, x5
    0xffffff80089a3764 <raid6_select_algo+412>:	b.ne	0xffffff80089a3770 <raid6_select_algo+424>  // b.any
    0xffffff80089a3768 <raid6_select_algo+416>:	yield
    0xffffff80089a376c <raid6_select_algo+420>:	b	0xffffff80089a375c <raid6_select_algo+404>
    0xffffff80089a3770 <raid6_select_algo+424>:	mov	x25, #0x0                   	// #0
    0xffffff80089a3774 <raid6_select_algo+428>:	ldr	x0, [x23, #2688]
    0xffffff80089a3778 <raid6_select_algo+432>:	mov	x4, x27

Corresponsing Source
--------------------

(gdb) b *0xffffff80089a3758
Breakpoint 1 at 0xffffff80089a3758: file /usr/src/kernel/lib/raid6/algos.c, line 191.

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

I.e code grabs jiffies and then loops and checks whether jiffies moved
forward; it calls cpu_relax(), which translated to yield instruction on
aarch64.

Yield Instruction Opcode
------------------------

(gdb) x /1wx 0xffffff80089a3768
0xffffff80089a3768 <raid6_select_algo+416>:	0xd503203f
(gdb) x /1i 0xffffff80089a3768
    0xffffff80089a3768 <raid6_select_algo+416>:	yield


Backtrace in QEMU
-----------------

After kernel hangs attached gdb to qemu, see that thread that
corresponds to target CPU stuck while repeatedly executing loop
that spans couple ranges in code_gen_buffer buffers. If I put
breakpoint in cpu_tb_exec right after control passed to generated
snippets, it never gets there. I.e qemu stack in infinite loop.

(gdb) bt
#0  0x00007fffeca53827 in code_gen_buffer ()
#1  0x000000000048aee9 in cpu_tb_exec (cpu=0x18c0190, itb=0x7fffec95ed00 <code_gen_buffer+9755862>)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:167
#2  0x000000000048bd82 in cpu_loop_exec_tb (cpu=0x18c0190, tb=0x7fffec95ed00 <code_gen_buffer+9755862>, last_tb=0x7fffec00faf8, tb_exit=0x7fffec00faf0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:627
#3  0x000000000048c091 in cpu_exec (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:736
#4  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#5  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#6  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#7  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109

Dumping cpu and env state in QEMU
---------------------------------

Looking at cpu data structure one can see that there is
pending interrupt request 'interrupt_request = 2'

(gdb) f 1
#1  0x000000000048aee9 in cpu_tb_exec (cpu=0x18c0190, itb=0x7fffec95ed00 <code_gen_buffer+9755862>)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:167
167	    ret = tcg_qemu_tb_exec(env, tb_ptr);

(gdb) p *cpu
$3 = {
   ...
   nr_cores = 1,
   nr_threads = 1,
   ...
   interrupt_request = 2,
    ...

Note 'pc' points in evn to the same instructions as we saw in gdb
with vmlinux session

(gdb) p /x *env
$5 = {
   regs = {0x0 <repeats 16 times>},
   xregs = {0xfffedbcb, 0xffffff80087b6610, 0xffffffffffffffff, 0x0, 0x0, 0xfffedbcb, 0x54, 0x3436746e69203a36, 0x286e656720203278, 0xffffffd0, 0xffffff800800b940,
     0x5f5e0ff, 0xffffff8008a45000, 0xffffff8008b091c5, 0xffffff8088b091b7, 0xffffffffffffffff, 0xffffffc01ea57000, 0xffffff800800bd38, 0x10, 0xffffff8008824228,
     0xffffff8008811c98, 0x557, 0x5ab, 0xffffff8008a26000, 0xffffffc01ea56000, 0x5ab, 0xffffff80088fd690, 0xffffff800800bcc0, 0xffffff8008a26000, 0xffffff800800bc50,
     0xffffff80089a3758, 0xffffff800800bc50},
   pc = 0xffffff80089a3758,
   pstate = 0x5,
   aarch64 = 0x1,
   uncached_cpsr = 0x13,

ARMGenericTimer sate that corresponds to Vtimer has ctl=5

(gdb) p /x env->cp15.c14_timer[1]
$6 = {
   cval = 0xb601fb1,
   ctl = 0x5
}

QEMU timer that handles vtimer is disarmed (ie pending interupt is already
set):

(gdb) p *((struct ARMCPU *) cpu)->gt_timer[1]
$8 = {
   expire_time = 9223372036854775792,
   timer_list = 0x187fd00,
   cb = 0x5cf886 <arm_gt_vtimer_cb>,
   opaque = 0x18c0190,
   next = 0x0,
   scale = 16
}

I.e what we have here qemu TCG code inifinitely loops executing
loop

    192                          while ((j1 = jiffies) == j0)
    193                                  cpu_relax();

in raid6_choose_gen function, but vtimer interrupt that is supposed
to move jiffies forward is pending and QEMU is not acting on it.

Looking at 'int cpu_exec(CPUState *cpu)' it looks like interrupt and
exception handling is performed in the loop, but to do so it should
exit first from cpu_loop_exec_tb. I am still puzzled how it is
supposed to work if above kernel code instead of cpu_relax() (yield)
would just has nop instructions. But for now let's focus why QEMU
executing of 'yield' instruction does not bring control out of
cpu_loop_exec_tb and let QEMU to execute jump to pending interrupts.


yield instruction decoding in translate-a64.c handle_hint function
------------------------------------------------------------------

Let's put breakpoint in qemu under gdb session inside of handle_hint
function. We have the following function:

/* HINT instruction group, including various allocated HINTs */
static void handle_hint(DisasContext *s, uint32_t insn,
                         unsigned int op1, unsigned int op2, unsigned int crm)
{
     unsigned int selector = crm << 3 | op2;

<snip>

     switch (selector) {

<snip>

     case 1: /* YIELD */
         if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
             s->base.is_jmp = DISAS_YIELD;
         }
         return;


Thread 3 "qemu-system-aar" hit Breakpoint 1, handle_hint (s=0x7fffec00f880, insn=3573751871, op1=3, op2=1, crm=0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/translate-a64.c:1345
1345	        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
(gdb) p /x insn
$12 = 0xd503203f
(gdb) p /x s->base.tb.cflags
$5 = 0x80000

in s->base.tb.cflags CF_PARALLEL is set (but we are running
single CPU mode)

#define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */

gdb) n
[Thread 0x7fffeb5ff700 (LWP 13452) exited]
1348	        return;
(gdb) p s->base.is_jmp
$14 = DISAS_NEXT
(gdb)

I.e QEMU will execute yield instruction in our case as just regular
nop, that seems to explain why in qemu control never goes out of
cpu_loop_exec_tb.

Workaround: start qemue with two CPUs instead of one (-smp 2)
-------------------------------------------------------------

runqemu qemuparams="-smp 2" - boots fine, so booting with
"-smp 2" looks as reasonable workaround

Experimental fix
----------------

If I apply the following patch, image boots fine

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 625ef2d..faf0e1f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1342,9 +1342,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
           * spin unnecessarily we would need to do something more involved.
           */
      case 1: /* YIELD */
-        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-            s->base.is_jmp = DISAS_YIELD;
-        }
+        s->base.is_jmp = DISAS_YIELD;
          return;
      case 2: /* WFE */
          if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {


Commit that brough up !parallel logic into yield handling
---------------------------------------------------------

I revert (provided below) this commit image boots fine.

commit c22edfebff29f63d793032e4fbd42a035bb73e27
Author: Alex Bennée <alex.bennee@linaro.org>
Date:   Thu Feb 23 18:29:24 2017 +0000

     target-arm: don't generate WFE/YIELD calls for MTTCG

     The WFE and YIELD instructions are really only hints and in TCG's case
     they were useful to move the scheduling on from one vCPU to the next. In
     the parallel context (MTTCG) this just causes an unnecessary cpu_exit
     and contention of the BQL.

     Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
     Reviewed-by: Richard Henderson <rth@twiddle.net>
     Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 5f3e3bd..d64c867 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -436,6 +436,13 @@ void HELPER(yield)(CPUARMState *env)
      ARMCPU *cpu = arm_env_get_cpu(env);
      CPUState *cs = CPU(cpu);

+    /* When running in MTTCG we don't generate jumps to the yield and
+     * WFE helpers as it won't affect the scheduling of other vCPUs.
+     * If we wanted to more completely model WFE/SEV so we don't busy
+     * spin unnecessarily we would need to do something more involved.
+     */
+    g_assert(!parallel_cpus);
+
      /* This is a non-trappable hint instruction that generally indicates
       * that the guest is currently busy-looping. Yield control back to the
       * top level loop so that a more deserving VCPU has a chance to run.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e61bbd6..e15eae6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1328,10 +1328,14 @@ static void handle_hint(DisasContext *s, uint32_t insn,
          s->is_jmp = DISAS_WFI;
          return;
      case 1: /* YIELD */
-        s->is_jmp = DISAS_YIELD;
+        if (!parallel_cpus) {
+            s->is_jmp = DISAS_YIELD;
+        }
          return;
      case 2: /* WFE */

But why even we boot with one cpu, qemu has parallel_cpus is true
------------------------------------------------------------------

Putting watchpoint on parallel_cpus:

Old value = false
New value = true
qemu_tcg_init_vcpu (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1695
1695	            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
(gdb) bt
#0  qemu_tcg_init_vcpu (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1695
#1  0x000000000044b92b in qemu_init_vcpu (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1798
#2  0x00000000005e64dc in arm_cpu_realizefn (dev=0x18c0190, errp=0x7fffffffcd30)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:932
#3  0x00000000006d607e in device_set_realized (obj=0x18c0190, value=true, errp=0x0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/qdev.c:914
#4  0x00000000008cb986 in property_set_bool (obj=0x18c0190, v=0x18e1db0, name=0xb00953 "realized", opaque=0x18a0ef0, errp=0x0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/object.c:1906
#5  0x00000000008c9cfb in object_property_set (obj=0x18c0190, v=0x18e1db0, name=0xb00953 "realized", errp=0x0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/object.c:1102
#6  0x00000000008cccc3 in object_property_set_qobject (obj=0x18c0190, value=0x18e1d30, name=0xb00953 "realized", errp=0x0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/qom-qobject.c:27
#7  0x00000000008c9f90 in object_property_set_bool (obj=0x18c0190, value=true, name=0xb00953 "realized", errp=0x0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/object.c:1171
#8  0x00000000005575ec in machvirt_init (machine=0x1880fa0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/arm/virt.c:1405
#9  0x00000000006de738 in machine_run_board_init (machine=0x1880fa0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/machine.c:793
#10 0x000000000063e08b in main (argc=24, argv=0x7fffffffdb98, envp=0x7fffffffdc60)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/vl.c:4753
(gdb) list
1690	        qemu_cond_init(cpu->halt_cond);
1691 
1692	        if (qemu_tcg_mttcg_enabled()) {
1693	            /* create a thread per vCPU with TCG (MTTCG) */
1694	            parallel_cpus = true;
1695	            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
1696	                 cpu->cpu_index);
1697

Here is I am a bit lost - it looks like logic of running separate thread for CPU
implies parallel_cpus=true, even number of CPUs is one.

Now sure how to fix it that by moving forward. Hopefully Alex and other
Linaro QEMU folks can chip in.

Revert of c22edfe with resolved conflicts
-----------------------------------------

Image boots OK if this applied:

From 3322ab069015da3d3c2f80ce714d4fb99b7d3b7f Mon Sep 17 00:00:00 2001
From: Victor Kamensky <kamensky@cisco.com>
Date: Sat, 17 Mar 2018 15:05:39 -0700
Subject: [PATCH] Revert "target-arm: don't generate WFE/YIELD calls for MTTCG"

This reverts commit c22edfebff29f63d793032e4fbd42a035bb73e27.

On single CPU aarch64 target loop with cpu_relax (yield) stuck
in loop forever, while pending vtimer interrupt raised
un-processed by outside loop.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
  target/arm/translate-a64.c |  8 ++------
  target/arm/translate.c     | 20 ++++----------------
  2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 625ef2d..b0cdb64 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1342,14 +1342,10 @@ static void handle_hint(DisasContext *s, uint32_t insn,
           * spin unnecessarily we would need to do something more involved.
           */
      case 1: /* YIELD */
-        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-            s->base.is_jmp = DISAS_YIELD;
-        }
+        s->base.is_jmp = DISAS_YIELD;
          return;
      case 2: /* WFE */
-        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-            s->base.is_jmp = DISAS_WFE;
-        }
+        s->base.is_jmp = DISAS_WFE;
          return;
      case 4: /* SEV */
      case 5: /* SEVL */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f120932..130ab50 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4531,14 +4531,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
      gen_rfe(s, pc, load_cpu_field(spsr));
  }

-/*
- * For WFI we will halt the vCPU until an IRQ. For WFE and YIELD we
- * only call the helper when running single threaded TCG code to ensure
- * the next round-robin scheduled vCPU gets a crack. In MTTCG mode we
- * just skip this instruction. Currently the SEV/SEVL instructions
- * which are *one* of many ways to wake the CPU from WFE are not
- * implemented so we can't sleep like WFI does.
- */
  static void gen_nop_hint(DisasContext *s, int val)
  {
      switch (val) {
@@ -4548,20 +4540,16 @@ static void gen_nop_hint(DisasContext *s, int val)
           * spin unnecessarily we would need to do something more involved.
           */
      case 1: /* yield */
-        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-            gen_set_pc_im(s, s->pc);
-            s->base.is_jmp = DISAS_YIELD;
-        }
+        gen_set_pc_im(s, s->pc);
+        s->base.is_jmp = DISAS_YIELD;
          break;
      case 3: /* wfi */
          gen_set_pc_im(s, s->pc);
          s->base.is_jmp = DISAS_WFI;
          break;
      case 2: /* wfe */
-        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-            gen_set_pc_im(s, s->pc);
-            s->base.is_jmp = DISAS_WFE;
-        }
+        gen_set_pc_im(s, s->pc);
+        s->base.is_jmp = DISAS_WFE;
          break;
      case 4: /* sev */
      case 5: /* sevl */
-- 
2.7.4

Thanks,
Victor

On Sun, 11 Mar 2018, Victor Kamensky wrote:

>
>
> On Sun, 11 Mar 2018, Peter Maydell wrote:
>
>> On 11 March 2018 at 00:11, Victor Kamensky <kamensky@cisco.com> wrote:
>>> Hi Richard, Ian,
>>> 
>>> Any progress on the issue? In case if not, I am adding few Linaro guys
>>> who work on aarch64 qemu. Maybe they can give some insight.
>> 
>> No immediate answers, but we might be able to have a look
>> if you can provide a repro case (image, commandline, etc)
>> that doesn't require us to know anything about OE and your
>> build/test infra to look at.
>
> Peter, thank you! Appreciate your attention and response to
> this. It is fair ask, I should have tried to narrow test
> case down before punting it to you guys.
>
>> (QEMU's currently just about
>> to head into codefreeze for our next release, so I'm a bit
>> busy for the next week or so. Alex, do you have time to
>> take a look at this?)
>> 
>> Does this repro with the current head-of-git QEMU?
>
> I've tried head-of-git QEMU (Mar 9) on my ubuntu-16.04
> with the same target Image and rootfs I could not reproduce
> the issue.
>
> I've started to play around more trying to reduce the test
> case. In my setup with OE qith qemu 2.11.1, if I just passed
> '-serial sdtio' or '-nographic', instead of '-serial mon:vc'
> - with all things the same image boots fine.
>
> So, I started to suspect, even if problem manifests itself
> as some functional failure of qemu, the issue could be some
> nasty memory corruption of some qemu operational data.
> And since qemu pull bunch of dependent
> libraries, problem might be not even in qemu.
>
> I realized that in OE in order to disconnect itself from
> underlying host, OE builds a lot of its own "native"
> libaries and OE qemu uses them. So I've tried to build
> head-of-git QEMU but with all native libraries that OE
> builds - now such combinations hangs in the same way.
>
> Also I noticed that OE qemu is built with SDL (v1.2),
> and libsdl is one that reponsible for '-serial mon:vc'
> handling. And I noticed in default OE conf/local.conf
> the following statements:
>
> #
> # Qemu configuration
> #
> # By default qemu will build with a builtin VNC server where graphical output 
> can be
> # seen. The two lines below enable the SDL backend too. By default 
> libsdl-native will
> # be built, if you want to use your host's libSDL instead of the minimal 
> libsdl built
> # by libsdl-native then uncomment the ASSUME_PROVIDED line below.
> PACKAGECONFIG_append_pn-qemu-native = " sdl"
> PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
> #ASSUME_PROVIDED += "libsdl-native"
>
> I've tried to build against my host's libSDL and uncommented
> above line. It actually failed to build, because my host libSDL
> were not happy about ncurses native libraries, so I ended up
> adding this as well:
>
> ASSUME_PROVIDED += "ncurses-native"
>
> After that I had to rebuild qemu-native and qemu-helper-native.
> With resulting qemu and the same target files, image boots
> OK.
>
> With such nasty corruption problem, it always hard to say for
> sure, it maybe just timing changes .. , but now it seems it
> somewhat points to some issue in OE libsdl version ... And
> still it is fairly bizarre, libsdl
> that in OE (1.2.15) is the same that I have on my ubuntu
> machine and there is no additional patches for it in OE,
> although configure options might be quite different.
>
> Thanks,
> Victor
>
>>> If for experiment sake I disable loop that tries to find
>>> jiffies transition. I.e have something like this:
>>> 
>>> diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
>>> index 4769947..e0199fc 100644
>>> --- a/lib/raid6/algos.c
>>> +++ b/lib/raid6/algos.c
>>> @@ -166,8 +166,12 @@ static inline const struct raid6_calls
>>> *raid6_choose_gen(
>>>
>>>                         preempt_disable();
>>>                         j0 = jiffies;
>>> +#if 0
>>>                         while ((j1 = jiffies) == j0)
>>>                                 cpu_relax();
>>> +#else
>>> +                        j1 = jiffies;
>>> +#endif /* 0 */
>>>                         while (time_before(jiffies,
>>>                                             j1 +
>>> (1<<RAID6_TIME_JIFFIES_LG2))) {
>>>                                 (*algo)->gen_syndrome(disks, PAGE_SIZE,
>>> *dptrs);
>>> @@ -189,8 +193,12 @@ static inline const struct raid6_calls
>>> *raid6_choose_gen(
>>>
>>>                         preempt_disable();
>>>                         j0 = jiffies;
>>> +#if 0
>>>                         while ((j1 = jiffies) == j0)
>>>                                 cpu_relax();
>>> +#else
>>> +                        j1 = jiffies;
>>> +#endif /* 0 */
>>>                         while (time_before(jiffies,
>>>                                             j1 +
>>> (1<<RAID6_TIME_JIFFIES_LG2))) {
>>>                                 (*algo)->xor_syndrome(disks, start, stop,
>>> 
>>> Image boots fine after that.
>>> 
>>> I.e it looks as some strange effect in aarch64 qemu that seems does not
>>> progress jiffies and code stuck.
>> 
>>> Another observation is that if I put breakpoint for example
>>> in do_timer, it actually hits the breakpoint, ie timer interrupt
>>> happens in this case, and strangely raid6_choose_gen sequence
>>> does progress, ie debugger breakpoints make this case unstuck.
>>> Actually several pressing Ctrl-C to interrupt target, followed
>>> by continue in gdb let code eventually go out of raid6_choose_gen.
>>> 
>>> Also whenever I presss Ctrl-C in gdb to stop target it always
>>> in stalled case drops with $pc into first instruction of el1_irq,
>>> I never saw different $pc hang code interrupt. Does it mean qemu
>>> hangged on first instruction of el1_irq handler? Note once I do
>>> stepi after that it ables to proceseed. If I continue steping
>>> eventually it gets to arch_timer_handler_virt and do_timer.
>> 
>> This is definitely rather weird and suggestive of a QEMU bug...
>> 
>>> For Linaro qemu aarch64 guys more details:
>>> 
>>> Situation happens on latest openembedded-core, for qemuarm64 MACHINE.
>>> It does not happens always, i.e sometimes it works.
>>> 
>>> Qemu version is 2.11.1 and it is invoked like this (through regular
>>> oe runqemu helper utility):
>>> 
>>> /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-aarch64
>>> -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev
>>> tap,id=net0,ifname=tap0,script=no,downscript=no -drive
>>> id=disk0,file=/wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/deploy/images/qemuarm64/core-image-minimal-qemuarm64-20180305025002.rootfs.ext4,if=none,format=raw
>>> -device virtio-blk-device,drive=disk0 -show-cursor -device virtio-rng-pci
>>> -monitor null -machine virt -cpu cortex-a57 -m 512 -serial mon:vc -serial
>>> null -kernel
>>> /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/deploy/images/qemuarm64/Image
>>> -append root=/dev/vda rw highres=off  mem=512M
>>> ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyAMA0,38400
>> 
>> Well, you're not running an SMP config, which rules a few
>> things out at least.
>> 
>> thanks
>> -- PMM
>> 
>

--504000474-1804783593-1521327108=:27691--
