Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web10.672.1602103133346880501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 13:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=UKNGkdVL;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=48561; q=dns/txt;
  s=iport; t=1602103133; x=1603312733;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RP2U+6pSpZRoPa6xAeU6Ysmm1ljMQStp3UCQyoKY8ak=;
  b=UKNGkdVLKa71LJ8BVD4RLvLy/b8VX32Hk+kngipCCBjiYaQrOpY0TQ8d
   mzCIbbQyVydIdPeydYy83SDGGXOKDWMSDrP+bKp+bCx5aK5VNkXUE3DHG
   aMugYJxBlF4k2+0/2Dflh/n+lEb7jhkVRNqOOBxUu98x6/2SheQkoTolQ
   8=;
X-IPAS-Result: =?us-ascii?q?A0DtDwC/Jn5f/5hdJa1ghE0GL3BVATIsln6ZO4FpCwEBA?=
 =?us-ascii?q?Q0BASMMBAEBgVWCdYIJAiU4EwIDAQEBAwIDAQEBAQUBAQECAQYEbYVcDIYTA?=
 =?us-ascii?q?QwLATkBDEkBhC0BgnwPqEWBdTOFVIUHBoE4iDSEfxuCAIERgltzglwEF4ENE?=
 =?us-ascii?q?A9iAoUtBJAZAQOCZYlUmwKCcoMUhWyGWoR4hgYPIoMTigSUFpUUiHaVKwIEB?=
 =?us-ascii?q?gUCFYFrI4FXTSMVO4JqTxkNhm2HPheBAgEIh1eFYiEDMAI1AgYKAQEDCYwCA?=
 =?us-ascii?q?g8Xgh4BAQ?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,348,1596499200"; 
   d="scan'208";a="549351658"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Oct 2020 20:38:51 +0000
Received: from kamensky-p53s.cisco.com ([10.24.45.79])
	(authenticated bits=0)
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id 097Kceir028064
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 7 Oct 2020 20:38:51 GMT
From: "Victor Kamensky" <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 0/2] qemumips: speeding up
Date: Wed,  7 Oct 2020 13:38:36 -0700
Message-Id: <20201007203838.19096-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.45.79, [10.24.45.79]
X-Outbound-Node: rcdn-core-1.cisco.com
Content-Transfer-Encoding: 8bit

Hi Folks,

I was looking at Yocto Project RP 13992 (qemumips
testimage keeps failing) [0]. My approach was to compare
and analyze qemumips vs qemumips64 machine when they
run OE do_testimage load. Overall, it seems
that OE qemumips is around twice slower then qemumips64.

Using perf, gdb, SystemTap and additional qemu instrumentation
I observed that soft mmu in case of qemumips takes significantly
more time. The difference in part could be explained by
different CPU memory 32 bit vs 64 bit layout that handled by different
code paths in qemu. MIPS64 layout is more optimal, and it does not
seem we can do much about it. But another significant difference
that in case of qemumips64 emulated CPU MIPS64R2-generic has 64
TLBs, but in case of qemumips emulated CPU 34Kf has just only
16 TLBs. Naturally, in qemumips case TLB is trashed more (in my
tests 16x more TLB misses) and since in MIPS case TLB refill
handle in software it causes more code to run.

The idea of my fix that is implemented by two patches that
follow this cover letter is to introduce new  fictitious cpu
type, 34Kf-64tlb, that would be identical to 34Kf but would
have 64 TLBs instead of original 16 TLBs. After all, adding
more TLBs to software MMU is very easy :).

With this approach in my limited tests I see that execution
time of core-image-full-cmdline:do_testimage improves by
40%.

I understand that it is not ideal to use fictitious
CPU type, that is not present out there in the wild, but
given significant gains it produces, IMO it is worth to go
this route.

For those who is interested in notes of my investigation
journey and how/why I did come up with this idea, please find
them below.

[0] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992

Thanks,
Victor

Slow qemumips investigation notes
=================================

As PR was reported against poky autobuilder run. I've pulled
poky tree, adjusted config to match autobuilder case as much
as possible and build both qemumips and qemumips64 machines
images. Idea is to look at differences between this two cases.

Starting Point
--------------

Running 'bitbake core-image-full-cmdline:do_testimage' many
tests are skipped but it looks like significant enough load
to investigate.

mips64:

real	3m51.953s
user	0m1.099s
sys	0m0.098s

mips:

real	8m29.485s
user	0m1.187s
sys	0m0.113s

runqemu qemu CPU time:

mips64:

kamensky 26058 25963 93 10:05 pts/10   00:01:28 /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-mips64 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -drive file=/wd3/yocto/20201002/build-qemumips64/tmp/deploy/images/qemumips64/core-image-full-cmdline-qemumips64-20201002212824.rootfs.ext4,if=virtio,format=raw -usb -device usb-tablet -vga std -machine malta -cpu MIPS64R2-generic -m 256 -serial mon:vc -serial null -kernel /wd3/yocto/20201002/build-qemumips64/tmp/deploy/images/qemumips64/vmlinux--5.8.9+git0+ffbfe61a19_4faa049b6b-r0-qemumips64-20201002212824.bin -append root=/dev/vda rw  ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyS0 console=tty

mips:

kamensky 25599 25547 98 09:58 pts/11   00:04:20 /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-mips -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -drive file=/wd3/yocto/20201002/build-qemumips/tmp/deploy/images/qemumips/core-image-full-cmdline-qemumips-20201003013835.rootfs.ext4,if=virtio,format=raw -usb -device usb-tablet -vga std -machine malta -cpu 34Kf -m 256 -serial mon:vc -serial null -kernel /wd3/yocto/20201002/build-qemumips/tmp/deploy/images/qemumips/vmlinux--5.8.9+git0+ffbfe61a19_93d29a7089-r0-qemumips-20201003013835.bin -append root=/dev/vda rw  ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyS0 console=tty

/wd3/yocto/20201002/build-qemumips/tmp/deploy/images/qemumips/vmlinux--5.8.9+git0+ffbfe61a19_93d29a7089-r0-qemumips-20201003013835.bin

Just get rid of impact of graphics handling
'runqemu serial nographic':

mips64:

kamensky 26402 26347 94 10:12 pts/10   00:00:45 /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-mips64 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -drive file=/wd3/yocto/20201002/build-qemumips64/tmp/deploy/images/qemumips64/core-image-full-cmdline-qemumips64-20201002212824.rootfs.ext4,if=virtio,format=raw -usb -device usb-tablet -vga std -nographic -machine malta -cpu MIPS64R2-generic -m 256 -serial mon:stdio -serial null -kernel /wd3/yocto/20201002/build-qemumips64/tmp/deploy/images/qemumips64/vmlinux--5.8.9+git0+ffbfe61a19_4faa049b6b-r0-qemumips64-20201002212824.bin -append root=/dev/vda rw  console=ttyS0 console=ttyS0 ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyS0 console=tty

mips:

kamensky 26728 26667 96 10:14 pts/11   00:01:24 /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-mips -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -drive file=/wd3/yocto/20201002/build-qemumips/tmp/deploy/images/qemumips/core-image-full-cmdline-qemumips-20201003013835.rootfs.ext4,if=virtio,format=raw -usb -device usb-tablet -vga std -nographic -machine malta -cpu 34Kf -m 256 -serial mon:stdio -serial null -kernel /wd3/yocto/20201002/build-qemumips/tmp/deploy/images/qemumips/vmlinux--5.8.9+git0+ffbfe61a19_93d29a7089-r0-qemumips-20201003013835.bin -append root=/dev/vda rw  console=ttyS0 ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyS0 console=tty

Running qemu under perf
-----------------------

Built qemu-system-native with symbols
(added DEBUG_BUILD_class-native = '1' in conf/local.conf)

'perf record -a' during 'runqemu serial nographic'

'perf report' top contributers snippets:

mips64:

   3.53%  qemu-system-mip  qemu-system-mips64       [.] helper_lookup_tb_ptr
   2.18%  qemu-system-mip  qemu-system-mips64       [.] r4k_map_address
   1.49%  qemu-system-mip  qemu-system-mips64       [.] qht_lookup_custom
   1.02%  qemu-system-mip  qemu-system-mips64       [.] la_func_end
   0.86%  qemu-system-mip  qemu-system-mips64       [.] tcg_optimize
   0.84%  qemu-system-mip  qemu-system-mips64       [.] tlb_set_page_with_attrs
   0.76%  qemu-system-mip  qemu-system-mips64       [.] cpu_exec
   0.64%  qemu-system-mip  qemu-system-mips64       [.] liveness_pass_1
   0.62%  qemu-system-mip  qemu-system-mips64       [.] la_bb_end
   0.62%  qemu-system-mip  qemu-system-mips64       [.] tb_htable_lookup
   0.56%  qemu-system-mip  qemu-system-mips64       [.] victim_tlb_hit
   0.52%  qemu-system-mip  qemu-system-mips64       [.] get_page_addr_code_hostp
   0.52%  qemu-system-mip  qemu-system-mips64       [.] tlb_flush_page_locked

mips:

   8.84%  qemu-system-mip  qemu-system-mips         [.] r4k_map_address
   4.41%  qemu-system-mip  qemu-system-mips         [.] tlb_flush_page_locked
   2.78%  qemu-system-mip  qemu-system-mips         [.] tb_jmp_cache_clear_page
   2.02%  qemu-system-mip  qemu-system-mips         [.] helper_lookup_tb_ptr
   1.82%  qemu-system-mip  qemu-system-mips         [.] tlb_set_page_with_attrs
   1.51%  qemu-system-mip  qemu-system-mips         [.] qht_lookup_custom
   1.27%  qemu-system-mip  qemu-system-mips         [.] ptr_cmp_tb_tc
   1.16%  qemu-system-mip  libglib-2.0.so.0.6400.5  [.] g_tree_find_node
   0.99%  qemu-system-mip  qemu-system-mips         [.] cpu_exec

Look as siginificant difference wrt how much soft mmu code
contribute into execution time. Note r4k_map_address,
tlb_flush_page_locked dominates report in mips case. Its
contribution in mips64 noticeably smaller. Need to dig into
this.

stap function counter script during 'runqemu serial nographic'
--------------------------------------------------------------

Just to get another view how much r4k_map_address
contributes into qemu execution and get difference between
mips64 and mips wrt how many times functions were called
added the following SysteTap script get proper counters.
Use case is boot to login when 'runqemu serail nographic'
is executed.

SystemTap script:

[root@coreos-lnx2 systemtap]# cat qemu_func_count1.stp
global r4k_map_address_count = 0;
global la_func_end_count = 0;
global tcg_optimize_count = 0;

probe process(@1).function("r4k_map_address").call {
  r4k_map_address_count++;
}

probe process(@1).function("la_func_end").call {
  la_func_end_count++;
}

probe process(@1).function("tcg_optimize").call {
  tcg_optimize_count++;
}

probe end {
  printf("r4k_map_address = %d\n", r4k_map_address_count);
  printf("la_func_end = %d\n", la_func_end_count);
  printf("tcg_optimize = %d\n", tcg_optimize_count);
}

SystemTap invocation example:

stap -v qemu_func_count1.stp /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-mips

Results

mips64:

r4k_map_address = 5029890
la_func_end = 2610665
tcg_optimize = 544187

mips:

r4k_map_address = 55255391 = 10.98 * 5029890
la_func_end = 2725631
tcg_optimize = 567154


Debugging qemu under gdb
------------------------

Learning more about r4k_map_address function by attaching
gdb to qemu native and stepping through code.

Example breakpoint at r4k_map_address

(gdb) bt
#0  0x00000000005164de in r4k_map_address (env=0x14d9830, physical=0x7f9dbfdfe300, prot=0x7f9dbfdfe2fc, address=2138944944, rw=1, access_type=32)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:73
#1  0x000000000051588e in get_seg_physical_address (env=env@entry=0x14d9830, physical=physical@entry=0x7f9dbfdfe300, prot=prot@entry=0x7f9dbfdfe2fc, 
    real_address=real_address@entry=2138944944, rw=rw@entry=1, access_type=access_type@entry=32, mmu_idx=0, am=3, eu=true, segmask=1073741823, 
    physical_base=1073741824) at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:192
#2  0x0000000000515907 in get_segctl_physical_address (env=env@entry=0x14d9830, physical=physical@entry=0x7f9dbfdfe300, prot=prot@entry=0x7f9dbfdfe2fc, 
    real_address=real_address@entry=2138944944, rw=rw@entry=1, access_type=access_type@entry=32, mmu_idx=0, segctl=1082, segmask=1073741823)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:211
#3  0x0000000000515996 in get_physical_address (env=env@entry=0x14d9830, physical=physical@entry=0x7f9dbfdfe300, prot=prot@entry=0x7f9dbfdfe2fc, 
    real_address=real_address@entry=2138944944, rw=rw@entry=1, access_type=access_type@entry=32, mmu_idx=0)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:264
#4  0x0000000000517a83 in mips_cpu_tlb_fill (cs=0x14d0e30, address=2138944944, size=<optimized out>, access_type=MMU_DATA_STORE, mmu_idx=0, 
    probe=<optimized out>, retaddr=140316022715390)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:909
#5  0x0000000000461596 in tlb_fill (cpu=cpu@entry=0x14d0e30, addr=addr@entry=2138944944, size=size@entry=4, access_type=access_type@entry=MMU_DATA_STORE, 
    mmu_idx=mmu_idx@entry=0, retaddr=retaddr@entry=140316022715390)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:1032
#6  0x0000000000467667 in store_helper (op=MO_BEUL, retaddr=140316022715390, oi=160, val=0, addr=2138944944, env=0x14d9830)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:2035
#7  helper_be_stl_mmu (env=0x14d9830, addr=2138944944, val=0, oi=160, retaddr=140316022715390)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:2192
#8  0x00007f9ddeb0b3fe in code_gen_buffer ()
#9  0x000000000047258a in cpu_tb_exec (itb=<optimized out>, cpu=<optimized out>)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:172
#10 cpu_loop_exec_tb (tb_exit=<synthetic pointer>, last_tb=<synthetic pointer>, tb=<optimized out>, cpu=<optimized out>)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:636
#11 cpu_exec (cpu=cpu@entry=0x14d0e30)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:749
#12 0x00000000004be149 in tcg_cpu_exec (cpu=cpu@entry=0x14d0e30)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/softmmu/cpus.c:1356
#13 0x00000000004bfa51 in qemu_tcg_cpu_thread_fn (arg=arg@entry=0x14d0e30)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/softmmu/cpus.c:1664
#14 0x00000000007f2f6b in qemu_thread_start (args=0x14e9f90)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/util/qemu-thread-posix.c:521
#15 0x00007f9e16320e5e in ?? () from /wd3/yocto/20201002/build-qemumips/tmp/sysroots-uninative/x86_64-linux/lib/libpthread.so.0
#16 0x00007f9e1624e64f in clone () from /wd3/yocto/20201002/build-qemumips/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6

What is inside of soft mmu data structure for given
cpu environment mips case

*env->tlb
---------
$8 = {
  nb_tlb = 16, 
  tlb_in_use = 128, 
  map_address = 0x5164dd <r4k_map_address>, 
  helper_tlbwi = 0x518b7a <r4k_helper_tlbwi>, 
  helper_tlbwr = 0x518d94 <r4k_helper_tlbwr>, 
  helper_tlbp = 0x518dc4 <r4k_helper_tlbp>, 
  helper_tlbr = 0x518f88 <r4k_helper_tlbr>, 
  helper_tlbinv = 0x518a82 <r4k_helper_tlbinv>, 
  helper_tlbinvf = 0x518b39 <r4k_helper_tlbinvf>, 
  mmu = {

Looking at get_seg_physical_address and get_physical_address
------------------------------------------------------------

In get get_seg_physical_address there are two major
case when address is mapped it does not go into
r4k_map_address and it in case where it is not mapped
it calls it through env->tlb->map_address

(gdb) s
get_seg_physical_address (env=env@entry=0x14d9830, physical=physical@entry=0x7f9dbfdfe790, prot=prot@entry=0x7f9dbfdfe78c, 
    real_address=real_address@entry=2168782848, rw=rw@entry=2, access_type=access_type@entry=32, mmu_idx=0, am=0, eu=false, segmask=536870911, 
    physical_base=0) at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:184
184	{
(gdb) n
185	    int mapped = is_seg_am_mapped(am, eu, mmu_idx);
(gdb) list
180	                                    int rw, int access_type, int mmu_idx,
181	                                    unsigned int am, bool eu,
182	                                    target_ulong segmask,
183	                                    hwaddr physical_base)
184	{
185	    int mapped = is_seg_am_mapped(am, eu, mmu_idx);
186	
187	    if (mapped < 0) {
188	        /* is_seg_am_mapped can report TLBRET_BADADDR */
189	        return mapped;
190	    } else if (mapped) {
191	        /* The segment is TLB mapped */
192	        return env->tlb->map_address(env, physical, prot, real_address, rw,
193	                                     access_type);
194	    } else {
195	        /* The segment is unmapped */
196	        *physical = physical_base | (real_address & segmask);
197	        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
198	        return TLBRET_MATCH;
199	    }

Complete listing from source file:

static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
                                    int *prot, target_ulong real_address,
                                    int rw, int access_type, int mmu_idx,
                                    unsigned int am, bool eu,
                                    target_ulong segmask,
                                    hwaddr physical_base)
{
    int mapped = is_seg_am_mapped(am, eu, mmu_idx);

    if (mapped < 0) {
        /* is_seg_am_mapped can report TLBRET_BADADDR */
        return mapped;
    } else if (mapped) {
        /* The segment is TLB mapped */
        return env->tlb->map_address(env, physical, prot, real_address, rw,
                                     access_type);
    } else {
        /* The segment is unmapped */
        *physical = physical_base | (real_address & segmask);
        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
        return TLBRET_MATCH;
    }
}

tlb helper instructions count during 'runqemu serial nographic'
---------------------------------------------------------------

Similar to previous collected counter run SystemTap script and
collect number of r4k_map_address calls and different r4k_helper_tlb*
functions. Note r4k_helper_xxxx correspond to emulation of tlb xxxx
instructions.

mips64:

r4k_map_address = 4879624
r4k_helper_tlbinv = 0
r4k_helper_tlbinvf = 0
r4k_helper_tlbp = 156024
r4k_helper_tlbr = 0
r4k_helper_tlbwi = 101065
r4k_helper_tlbwr = 1678316

mips:

r4k_map_address = 58798121 = 12.04 * 4879624
r4k_helper_tlbinv = 0
r4k_helper_tlbinvf = 0
r4k_helper_tlbp = 162568
r4k_helper_tlbr = 0
r4k_helper_tlbwi = 80785
r4k_helper_tlbwr = 26343867 = 15.69 * 1678316

Note compare to mips64 that r4k_map_address is
called 12 times more oftern and target issues
tlbwr instruction almost 16 times more often.

Note tlbwr instruction means write ('w') new TLB and
randomly ('r') replace one of existing ones. Typically
tlbwr would be called from 'TLB refill' exception
handling. Note on MIPS TBL refill is handled in software
unlike on other CPUs like x86 and ARM.

Experiment with mips kernel that disables CONFIG_HIGHMEM
--------------------------------------------------------

with disabled CONFIG_HIGHMEM

r4k_map_address = 89238250
r4k_helper_tlbinv = 0
r4k_helper_tlbinvf = 0
r4k_helper_tlbp = 175916
r4k_helper_tlbr = 0
r4k_helper_tlbwi = 87341
r4k_helper_tlbwr = 40213923

It does not look better, discarding this path

/proc/cpuinfo
-------------

mips64:

root@qemumips64:~# cat /proc/cpuinfo 
system type		: MIPS Malta
machine			: mti,malta
processor		: 0
cpu model		: MIPS GENERIC QEMU V0.0  FPU V0.0
BogoMIPS		: 835.58
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 64 <--------------------------------
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 1, address/irw mask: [0x0ff8]
isa			: mips1 mips2 mips3 mips4 mips5 mips32r1 mips32r2 mips64r1 mips64r2
ASEs implemented	: mips3d
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VCED exceptions		: not available
VCEI exceptions		: not available

mips:

root@qemumips:~# cat /proc/cpuinfo 
system type		: MIPS Malta
machine			: mti,malta
processor		: 0
cpu model		: MIPS 34Kc V0.0  FPU V0.0
BogoMIPS		: 801.17
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 16 <--------------------------------
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 1, address/irw mask: [0x0ff8]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16 dsp mt
shadow register sets	: 16
kscratch registers	: 0
package			: 0
core			: 0
VPE			: 0
VCED exceptions		: not available
VCEI exceptions		: not available

Later note: unfortunately the first time, it was an operator
error, and I captured output from mips64 case thinking that
I am capturing mips case. Corrected latter when with
instrumentation described below I realized that in mips
case we just have 16 TLBs.


Looking where tlbwr instructions used
-------------------------------------

Looked at places in kernel where tlbwr instruction
is used. It is in __update_tlb and generated TLB
refill exception handler. Besides 32 bit 64 bit
difference there is nothing much.

... removed my notes since it was dead branch in
the investigation ...

just for the reference kept mips TLB refill
exception handler code as example. It is executed
every TLB miss to update TLB with new entries
from page tables:


(gdb) x /30i ebase
   0x82890000:	mfc0	k1,c0_context
   0x82890004:	lui	k0,0x8112
   0x82890008:	srl	k1,k1,0x17
   0x8289000c:	addu	k1,k0,k1
   0x82890010:	mfc0	k0,c0_badvaddr
   0x82890014:	lw	k1,10064(k1)
   0x82890018:	srl	k0,k0,0x16
   0x8289001c:	sll	k0,k0,0x2
   0x82890020:	addu	k1,k1,k0
   0x82890024:	mfc0	k0,c0_context
   0x82890028:	lw	k1,0(k1)
   0x8289002c:	srl	k0,k0,0x1
   0x82890030:	andi	k0,k0,0xff8
   0x82890034:	addu	k1,k1,k0
   0x82890038:	lw	k0,0(k1)
   0x8289003c:	lw	k1,4(k1)
   0x82890040:	srl	k0,k0,0x6
   0x82890044:	mtc0	k0,c0_entrylo0
   0x82890048:	srl	k1,k1,0x6
   0x8289004c:	mtc0	k1,c0_entrylo1
   0x82890050:	ehb
=> 0x82890054:	tlbwr
   0x82890058:	eret

mips hits above after qemu detects TLB miss
in tlb_fill code path and it generates TLB miss exception
as per this backtrace:

(gdb) bt
#0  raise_mmu_exception (env=env@entry=0x2a2dc60, address=address@entry=1434011948, rw=rw@entry=0, tlb_error=tlb_error@entry=-2)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:467
#1  0x0000000000517c1e in mips_cpu_tlb_fill (cs=0x2a25260, address=1434011948, size=<optimized out>, access_type=MMU_DATA_LOAD, mmu_idx=2, 
    probe=<optimized out>, retaddr=140590720516388)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:957
#2  0x0000000000461596 in tlb_fill (cpu=cpu@entry=0x2a25260, addr=addr@entry=1434011948, size=size@entry=4, 
    access_type=access_type@entry=MMU_DATA_LOAD, mmu_idx=mmu_idx@entry=2, retaddr=retaddr@entry=140590720516388)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:1032
#3  0x0000000000462f19 in load_helper (full_load=0x462d91 <full_be_ldul_mmu>, code_read=false, op=MO_BEUL, retaddr=140590720516388, oi=162, 
    addr=1434011948, env=0x2a2dc60)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:1583
#4  full_be_ldul_mmu (env=0x2a2dc60, addr=1434011948, oi=162, retaddr=140590720516388)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:1724
#5  0x0000000000465a8f in helper_be_ldul_mmu (env=<optimized out>, addr=<optimized out>, oi=<optimized out>, retaddr=<optimized out>)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:1731
#6  0x00007fddd3f4819c in code_gen_buffer ()
#7  0x000000000047258a in cpu_tb_exec (itb=<optimized out>, cpu=<optimized out>)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:172
#8  cpu_loop_exec_tb (tb_exit=<synthetic pointer>, last_tb=<synthetic pointer>, tb=<optimized out>, cpu=<optimized out>)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:636
#9  cpu_exec (cpu=cpu@entry=0x2a25260)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:749
#10 0x00000000004be149 in tcg_cpu_exec (cpu=cpu@entry=0x2a25260)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/softmmu/cpus.c:1356
#11 0x00000000004bfa51 in qemu_tcg_cpu_thread_fn (arg=arg@entry=0x2a25260)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/softmmu/cpus.c:1664
#12 0x00000000007f2f6b in qemu_thread_start (args=0x2a3e3c0)
    at /wd3/yocto/20201002/build-qemumips/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/util/qemu-thread-posix.c:521
#13 0x00007fde13d73e5e in ?? () from /wd3/yocto/20201002/build-qemumips/tmp/sysroots-uninative/x86_64-linux/lib/libpthread.so.0
#14 0x00007fde13ca164f in clone () from /wd3/yocto/20201002/build-qemumips/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6


Need more tools and use case in target image
--------------------------------------------

Switch image under investigation from core-image-full-cmdline
to core-image-sato-sdk wanted to have more development tools
in target image.

Tried perf run in target unfortunately qemu does not implement
CPU h/w events counters so it was not much usefull.

Trying to understand soft mmu code path between mips and mips64
---------------------------------------------------------------

In order to get insights about typical code path of qemu mips
soft mmu handling rebuilt qemu-system with -fno-omit-frame-pointer
option so I could do 'perf -g' (i.e capturing full backtrace in
perf events).

Run both cases under 'perf -g' studied results. Here is
couple different cases highlighting how soft mmu works
differently between two cases mips and mips64. The difference
largely explained because of different CPU memory layout
differences.

helper_ret_ldub_mmu

mips:

     3.37%     0.02%  qemu-system-mip  qemu-system-mips                       [.] helper_ret_ldub_mmu
            |          
             --3.35%--helper_ret_ldub_mmu
                       |          
                        --3.34%--full_ldub_mmu
                                  |          
                                   --3.11%--tlb_fill
                                             |          
                                              --3.04%--mips_cpu_tlb_fill
                                                        |          
                                                        |--1.85%--get_physical_address
                                                        |          |          
                                                        |           --1.79%--get_segctl_physical_address
                                                        |                     |          
                                                        |                      --1.74%--get_seg_physical_address
                                                        |                                |          
                                                        |                                 --1.72%--r4k_map_address
                                                        |          
                                                         --0.61%--tlb_set_page
                                                                   |          
                                                                    --0.58%--tlb_set_page_with_attrs

mips64:

    35.00%     0.00%  qemu-system-mip  [unknown]                              [.] 0x0000000000000001

               |--1.88%--0x7f0faedc6916
               |          |          
               |           --1.87%--helper_ret_ldub_mmu
               |                     |          
               |                      --1.87%--full_ldub_mmu
               |                                |          
               |                                 --1.77%--tlb_fill
               |                                           |          
               |                                            --1.69%--mips_cpu_tlb_fill
               |                                                      |          
               |                                                       --1.23%--get_physical_address
               |                                                                 |          
               |                                                                  --1.19%--r4k_map_address


why in mips64 get_physical_address jumps to r4k_map_address directly

(gdb) bt
#0  r4k_map_address (env=0x2886f90, physical=0x7f0ff24a42e0, prot=0x7f0ff24a42dc, address=733015402918, rw=1, access_type=32)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:73
#1  0x0000000000525504 in get_physical_address (env=env@entry=0x2886f90, physical=physical@entry=0x7f0ff24a42e0, prot=prot@entry=0x7f0ff24a42dc, 
    real_address=real_address@entry=733015402918, rw=rw@entry=1, access_type=access_type@entry=32, mmu_idx=0)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:271
#2  0x00000000005271ad in mips_cpu_tlb_fill (cs=0x287e570, address=733015402918, size=<optimized out>, access_type=MMU_DATA_STORE, mmu_idx=0, 
    probe=<optimized out>, retaddr=139705288065153)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:909
#3  0x00000000004629b4 in tlb_fill (cpu=cpu@entry=0x287e570, addr=addr@entry=733015402918, size=size@entry=2, 
    access_type=access_type@entry=MMU_DATA_STORE, mmu_idx=mmu_idx@entry=0, retaddr=retaddr@entry=139705288065153)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:1032
#4  0x0000000000468008 in store_helper (op=MO_BEUW, retaddr=139705288065153, oi=144, val=0, addr=733015402918, env=0x2886f90)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:2035
#5  helper_be_stw_mmu (env=0x2886f90, addr=733015402918, val=0, oi=144, retaddr=139705288065153)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cputlb.c:2180
#6  0x00007f0fac118081 in code_gen_buffer ()
#7  0x00000000004742c6 in cpu_tb_exec (itb=<optimized out>, cpu=0x287e570)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:172
#8  cpu_loop_exec_tb (tb_exit=<synthetic pointer>, last_tb=<synthetic pointer>, tb=<optimized out>, cpu=0x287e570)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:636
#9  cpu_exec (cpu=cpu@entry=0x287e570)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/accel/tcg/cpu-exec.c:749
#10 0x00000000004c349f in tcg_cpu_exec (cpu=cpu@entry=0x287e570)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/softmmu/cpus.c:1356
#11 0x00000000004c4bd4 in qemu_tcg_rr_cpu_thread_fn (arg=arg@entry=0x287e570)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/softmmu/cpus.c:1458
#12 0x000000000081df64 in qemu_thread_start (args=0x2898a00)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/util/qemu-thread-posix.c:521
#13 0x00007f0ff456de5e in ?? () from /wd3/yocto/20201002/build-qemumips64/tmp/sysroots-uninative/x86_64-linux/lib/libpthread.so.0
#14 0x00007f0ff449b64f in clone () from /wd3/yocto/20201002/build-qemumips64/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
(gdb) up
#1  0x0000000000525504 in get_physical_address (env=env@entry=0x2886f90, physical=physical@entry=0x7f0ff24a42e0, prot=prot@entry=0x7f0ff24a42dc, 
    real_address=real_address@entry=733015402918, rw=rw@entry=1, access_type=access_type@entry=32, mmu_idx=0)
    at /wd3/yocto/20201002/build-qemumips64/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/target/mips/helper.c:271
271	            ret = env->tlb->map_address(env, physical, prot,
(gdb) list
266	                                          mmu_idx, segctl, 0x3FFFFFFF);
267	#if defined(TARGET_MIPS64)
268	    } else if (address < 0x4000000000000000ULL) {
269	        /* xuseg */
270	        if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
271	            ret = env->tlb->map_address(env, physical, prot,                 // <------------------
272	                                        real_address, rw, access_type);
273	        } else {
274	            ret = TLBRET_BADADDR;
275	        }

another example helper_be_ldul_mmu fucnction that calls tlb_fill

mips:

     7.49%     0.18%  qemu-system-mip  qemu-system-mips                       [.] helper_be_ldul_mmu
            |          
             --7.30%--helper_be_ldul_mmu
                       |          
                        --7.28%--full_be_ldul_mmu
                                  |          
                                   --6.46%--tlb_fill
                                             |          
                                              --6.22%--mips_cpu_tlb_fill
                                                        |          
                                                        |--2.98%--get_physical_address
                                                        |          |          
                                                        |           --2.77%--get_segctl_physical_address
                                                        |                     |          
                                                        |                      --2.63%--get_seg_physical_address
                                                        |                                |          
                                                        |                                 --2.57%--r4k_map_address
                                                        |          
                                                        |--1.94%--tlb_set_page
                                                        |          |          
                                                        |           --1.84%--tlb_set_page_with_attrs
                                                        |          
                                                         --0.87%--do_raise_exception_err
                                                                   |          
                                                                    --0.84%--cpu_loop_exit_restore
                                                                              |          
                                                                               --0.75%--cpu_restore_state

mips64:

     1.25%     0.04%  qemu-system-mip  qemu-system-mips64                     [.] helper_be_ldul_mmu
            |          
             --1.22%--helper_be_ldul_mmu
                       |          
                        --1.20%--full_be_ldul_mmu
                                  |          
                                   --0.94%--tlb_fill
                                             |          
                                              --0.91%--mips_cpu_tlb_fill
                                                        |          
                                                         --0.50%--get_physical_address


Deeper dive into soft mmu behavior differences
----------------------------------------------

memory stats investigation of soft mmu behavior
with the following quick and dirty instrumentation
patch as follows. Cannot use SystemTap because is
super high rate of events.

Use case boot of core-image-full-cmdline-sdk image
in "serial nographic" mode.

Results of counters captured in gdb after attaching
to qemu process after image boot.

[kamensky@coreos-lnx2 qemu-5.1.0]$ cat patches/mips_debugging_stats.patch
Index: qemu-5.1.0/target/mips/helper.c
===================================================================
--- qemu-5.1.0.orig/target/mips/helper.c
+++ qemu-5.1.0/target/mips/helper.c
@@ -175,6 +175,12 @@ static int is_seg_am_mapped(unsigned int
     };
 }
 
+struct {
+    unsigned long long mapped_negative;
+    unsigned long long mapped_positive;
+    unsigned long long mapped_zero;
+} get_seg_physical_address_stats;
+
 static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
                                     int *prot, target_ulong real_address,
                                     int rw, int access_type, int mmu_idx,
@@ -185,13 +191,16 @@ static int get_seg_physical_address(CPUM
     int mapped = is_seg_am_mapped(am, eu, mmu_idx);
 
     if (mapped < 0) {
+        get_seg_physical_address_stats.mapped_negative++;
         /* is_seg_am_mapped can report TLBRET_BADADDR */
         return mapped;
     } else if (mapped) {
+        get_seg_physical_address_stats.mapped_positive++;
         /* The segment is TLB mapped */
         return env->tlb->map_address(env, physical, prot, real_address, rw,
                                      access_type);
     } else {
+        get_seg_physical_address_stats.mapped_zero++;
         /* The segment is unmapped */
         *physical = physical_base | (real_address & segmask);
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -213,6 +222,17 @@ static int get_segctl_physical_address(C
                                     pa & ~(hwaddr)segmask);
 }
 
+struct {
+    unsigned long long int useg_limit;
+    unsigned long long int xuseg;
+    unsigned long long int xsseg;
+    unsigned long long int xkphys;
+    unsigned long long int xkseg;
+    unsigned long long int kseg0;
+    unsigned long long int kseg1;
+    unsigned long long int kseg2;
+} get_physical_address_stats;
+
 static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
                                 int *prot, target_ulong real_address,
                                 int rw, int access_type, int mmu_idx)
@@ -264,6 +284,7 @@ static int get_physical_address(CPUMIPSS
         ret = get_segctl_physical_address(env, physical, prot,
                                           real_address, rw, access_type,
                                           mmu_idx, segctl, 0x3FFFFFFF);
+        get_physical_address_stats.useg_limit++;
 #if defined(TARGET_MIPS64)
     } else if (address < 0x4000000000000000ULL) {
         /* xuseg */
@@ -273,6 +294,7 @@ static int get_physical_address(CPUMIPSS
         } else {
             ret = TLBRET_BADADDR;
         }
+        get_physical_address_stats.xuseg++;
     } else if (address < 0x8000000000000000ULL) {
         /* xsseg */
         if ((supervisor_mode || kernel_mode) &&
@@ -282,6 +304,7 @@ static int get_physical_address(CPUMIPSS
         } else {
             ret = TLBRET_BADADDR;
         }
+        get_physical_address_stats.xsseg++;
     } else if (address < 0xC000000000000000ULL) {
         /* xkphys */
         if ((address & 0x07FFFFFFFFFFFFFFULL) <= env->PAMask) {
@@ -314,6 +337,7 @@ static int get_physical_address(CPUMIPSS
         } else {
             ret = TLBRET_BADADDR;
         }
+        get_physical_address_stats.xkphys++;
     } else if (address < 0xFFFFFFFF80000000ULL) {
         /* xkseg */
         if (kernel_mode && KX &&
@@ -323,22 +347,26 @@ static int get_physical_address(CPUMIPSS
         } else {
             ret = TLBRET_BADADDR;
         }
+        get_physical_address_stats.xkseg++;
 #endif
     } else if (address < KSEG1_BASE) {
         /* kseg0 */
         ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
                                           access_type, mmu_idx,
                                           env->CP0_SegCtl1 >> 16, 0x1FFFFFFF);
+        get_physical_address_stats.kseg0++;
     } else if (address < KSEG2_BASE) {
         /* kseg1 */
         ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
                                           access_type, mmu_idx,
                                           env->CP0_SegCtl1, 0x1FFFFFFF);
+        get_physical_address_stats.kseg1++;
     } else if (address < KSEG3_BASE) {
         /* sseg (kseg2) */
         ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
                                           access_type, mmu_idx,
                                           env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
+        get_physical_address_stats.kseg2++;
     } else {
         /*
          * kseg3
Index: qemu-5.1.0/target/mips/op_helper.c
===================================================================
--- qemu-5.1.0.orig/target/mips/op_helper.c
+++ qemu-5.1.0/target/mips/op_helper.c
@@ -734,10 +734,19 @@ void r4k_helper_tlbwi(CPUMIPSState *env)
     r4k_fill_tlb(env, idx);
 }
 
+unsigned long long tlb_wr_index[128];
+unsigned long long tlb_wr_outside;
+
 void r4k_helper_tlbwr(CPUMIPSState *env)
 {
     int r = cpu_mips_get_random(env);
 
+    if (r < 128) {
+        tlb_wr_index[r]++;
+    } else {
+        tlb_wr_outside++;
+    }
+    
     r4k_invalidate_tlb(env, r, 1);
     r4k_fill_tlb(env, r);
 }

Analyzing intrumentation results
--------------------------------

mips64:

(gdb) p get_seg_physical_address_stats
$1 = {mapped_negative = 0, mapped_positive = 9880, mapped_zero = 9956435}
(gdb) p get_physical_address_stats
$2 = {useg_limit = 2, xuseg = 5703053, xsseg = 0, xkphys = 5760602, xkseg = 423503, kseg0 = 4195824, kseg1 = 9, kseg2 = 16}

get_seg_physical_address_stats

mapped_positive =             9880
mapped_zero =              9956435
----------------------------------
total =                    9966315

get_physical_address_stats

useg_limit =                     2
xuseg =                    5703053
xsseg =                          0
xkphys =                   5760602
xkseg =                     423503
kseg0 =                    4195824
kseg1 =                          9
kseg2 =                         16
----------------------------------
total =                   16083009


mips:

(gdb) p get_seg_physical_address_stats
$1 = {mapped_negative = 0, mapped_positive = 18501772, mapped_zero = 11727856}
(gdb) p get_physical_address_stats
$2 = {useg_limit = 18008359, xuseg = 0, xsseg = 0, xkphys = 0, xkseg = 0, kseg0 = 11524734, kseg1 = 203122, kseg2 = 355583}

get_seg_physical_address

mapped_negative =                0
mapped_positive =         18501772
mapped_zero =             11727856
----------------------------------
total =                   30229628

get_physical_address

useg_limit =              18008359
xuseg =                          0
xsseg =                          0
xkphys =                         0
xkseg =                          0
kseg0 =                   11524734
kseg1 =                     203122
kseg2 =                     355583
----------------------------------
total =                   30091798

mips (after TLB number bump to 64)

It was added later to this section after idea for the fix
materialized, so it would be easy to compare with base
line.

(gdb) p get_seg_physical_address_stats
$1 = {mapped_negative = 0, mapped_positive = 7873129, mapped_zero = 14561039}
(gdb) p get_physical_address_stats
$2 = {useg_limit = 7312564, xuseg = 0, xsseg = 0, xkphys = 0, xkseg = 0, kseg0 = 14351746, kseg1 = 209293, kseg2 = 353834}

get_seg_physical_address

mapped_negative =                0
mapped_positive =          7873129
mapped_zero =             14561039
----------------------------------
total =                   22434168 


get_physical_address

useg_limit =               7312564
xuseg =                          0
xsseg =                          0
xkphys =                         0
xkseg =                          0
kseg0 =                   14351746
kseg1 =                     209293
kseg2 =                     353834
----------------------------------
total =                   22227437

Instrumentation of r4k_helper_tlbwr function
--------------------------------------------

misp (16 TLB original case)

(gdb) p tlb_wr_index
$1 = {514054, 514256, 514005, 514149, 514100, 514067, 513906, 513965, 514025, 514076, 514243, 513932, 514119, 514000, 514059, 514191, 0 <repeats 112 times>}

total = 514054 + 514256 + 514005 + 514149 + 514100 + 514067 + 513906 + 513965 + 514025 + 514076 + 514243 + 513932 + 514119 + 514000 + 514059 + 514191 = 8225147

At this point I just came to realization that in mips case
we have just 16 TLBs. And idea to bump it up came up.

Running experiment in mips with CPU identical to original
one, but slightly changed to have 64 soft mmu TLBs.

mips (64 TLB)

(gdb) p tlb_wr_index
$3 = {40034, 40318, 39982, 39981, 40028, 40010, 40109, 40315, 40237, 40178, 40293, 39995, 40210, 40073, 40088, 40100, 40172, 40011, 40182, 40190, 40096, 
  40244, 40151, 40171, 39916, 40245, 40302, 40136, 40026, 40255, 40006, 40395, 40079, 40029, 40204, 40171, 40171, 40089, 40215, 39991, 39961, 39912, 40122, 
  40255, 40025, 40274, 40168, 40051, 40165, 40220, 40015, 40125, 40267, 40037, 40048, 39932, 40295, 39960, 39887, 40035, 40118, 39936, 40200, 40069, 
  0 <repeats 64 times>}

total = 40034 + 40318 + 39982 + 39981 + 40028 + 40010 + 40109 + 40315 + 40237 + 40178 + 40293 + 39995 + 40210 + 40073 + 40088 + 40100 + 40172 + 40011 + 40182 + 40190 + 40096 + 40244 + 40151 + 40171 + 39916 + 40245 + 40302 + 40136 + 40026 + 40255 + 40006 + 40395 + 40079 + 40029 + 40204 + 40171 + 40171 + 40089 + 40215 + 39991 + 39961 + 39912 + 40122 + 40255 + 40025 + 40274 + 40168 + 40051 + 40165 + 40220 + 40015 + 40125 + 40267 + 40037 + 40048 + 39932 + 40295 + 39960 + 39887 + 40035 + 40118 + 39936 + 40200 + 40069 = 2567475

It looks like number of TLB missed goes down siginificantly.
Means qemu needs to execute less instruction in mips software
TLB refill function.

Now back to testing new CPU type with 64 TLBs under do_testimage
----------------------------------------------------------------

mips with 34Kf cpu (original)
-----------------------------

[kamensky@coreos-lnx2 build-qemumips]$ time bitbake core-image-full-cmdline:do_testimage >& t0.txt; time bitbake core-image-full-cmdline:do_testimage >& t1.txt; time bitbake core-image-full-cmdline:do_testimage >& t2.txt; time bitbake core-image-full-cmdline:do_testimage >& t3.txt

real	7m33.815s
user	0m1.009s
sys	0m0.089s

real	6m53.100s
user	0m1.019s
sys	0m0.086s

real	8m33.223s
user	0m1.052s
sys	0m0.080s

real	7m16.333s
user	0m1.030s
sys	0m0.085s

discarding first "warm up" case

real avg = (413 + 513 + 436) / 3 = 454

mips with 34Kf-64tlb cpu
------------------------

[kamensky@coreos-lnx2 build-qemumips]$ time bitbake core-image-full-cmdline:do_testimage >& t1.txt; time bitbake core-image-full-cmdline:do_testimage >& t2.txt; time bitbake core-image-full-cmdline:do_testimage >& t3.txt

real	4m38.909s
user	0m0.983s
sys	0m0.095s

real	4m34.124s
user	0m0.962s
sys	0m0.084s

real	4m13.451s
user	0m0.952s
sys	0m0.094s

real avg = (278 + 274 + 253) / 3 = 268

Good improvement
----------------

Overall looks like 40% or so improvement.

Victor Kamensky (2):
  qemu: add 34Kf-64tlb fictitious cpu type
  qemumips: use 34Kf-64tlb CPU emulation

 meta/conf/machine/qemumips.conf                    |   2 +-
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 ...Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 +++++++++++++++++++++
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch

-- 
2.14.5

