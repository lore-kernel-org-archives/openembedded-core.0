Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.10479.1620725302228690045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 02:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NtFSiI81;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id s82so10707152wmf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 02:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=hW0CFtX/CnIrBSZY93pVsLXuY0zN3kZc1OIIUa9+LjI=;
        b=NtFSiI81j5CwpF0U/GGILrdFFrSW9Do4HdFPWR70GvI8P5JDJWT1KIibmfYc/AlX1l
         YWe59iL13Yx/UUMwe8GoOK+HvPrhEVLNLBHhv3AA2va3ZpSl4cx+xWsSwiWsaCumrkpI
         CNh80PeHjtQ62u/G7vz1Qi2WYDnlrLMNXrbN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=hW0CFtX/CnIrBSZY93pVsLXuY0zN3kZc1OIIUa9+LjI=;
        b=Hv1bGn4wvRz15tP2Ljm6sao8wInsONRMtBNkfFxHBwSq/kXa186ZX0UuCVUZWNdECP
         5KgmcPcS5VQTh7OBZAVerAZ9mYhBeKQISNheE1qZv40HKwVrcDLKpmi8PrCzG9hto+Jf
         VoBQkPuIE0I31hzxpPyMiILmhI2THhvsFgc0mz/Kre8o9fn2leW+MIcw1iKPAuh1SN7e
         Qlipg3AWYw2y4f7dqSAOqs2FWxgmW3Z51VjFOTEV+xiLnN6t/UyRf7B0UL4aEdKoNxy/
         jqOwil6C/4XLLgFYExxr9ZipywH4Y1xmJSeWCS3nF3wh8bxaq+F6M3aC3hUv7i/YFpkp
         GyOw==
X-Gm-Message-State: AOAM531/LZLhBJfvEjgAnwEK5eVcm/VpVSyTvIP6dMP4W4njE7RcMN5W
	7RTJYik0tKqODZWIQJR3+7sGSQ==
X-Google-Smtp-Source: ABdhPJzbasqKXvmiSjrBvpb5Rx89Pb7sNHku4yFM2W9TMsA0zxEFGwNN+iMM0uMXa7U+7+3Mt2+Fzg==
X-Received: by 2002:a1c:c206:: with SMTP id s6mr4434496wmf.47.1620725300354;
        Tue, 11 May 2021 02:28:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29c0:3873:464b:b647? ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id f25sm27183533wrd.67.2021.05.11.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 02:28:20 -0700 (PDT)
Message-ID: <cebee4fe4e3e6a1532a9580d80fbca6ae381f2fc.camel@linuxfoundation.org>
Subject: QEMU rcu stalls on autobuilder - not what they seem?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 11 May 2021 10:28:17 +0100
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We have patches in master-next where we test enabling SMP for x86 and arm.
This has resulted in a few build failures where qemu crashes with an RCU 
stall. The SMP output is different to our non-SMP case. For ages we've
been blaming the autobuilder load/contention. The SMP case does appear to
have it happen more regularly but it was happening before.

As an example, this morning I awoke to:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2123/steps/14/logs/stdio

and I've pasted the full boot log below. It is easy to blame the autobuilder
load as usual but I'd note that the kernel messages stop after about 1s after
the tsc clocksource message.

I'd argue that the RCU stall message is just pointing out the kernel is mostly
dead, its also interesting the RCU stall handler crashes before it can print
the process traces.

I read that the tsc clocksource message hang is notorious as it is where the
kernel starts initing other subsystems so the issue may not be in the tsc 
clocksource but elsewhere. I'd also note it is using the kvm-clocksource and just
inited the tsc clocksource, it isn't using it. The TSC clocksource appears to be
know it init slowly.

I think we may have some other kernel issue going on here and blaming the 
autobuilder load isn't the right path forward. Is there anyone who understands
what may be going on here or a way we could debug it further?

Cheers,

Richard



[    0.000000] Linux version 5.10.34-yocto-standard (oe-user@oe-host) (x86_64-poky-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1.20210209) #1 SMP PREEMPT Mon May 3 02:17:32 UTC 2021
[    0.000000] Command line: root=/dev/vda rw  mem=256M ip=192.168.7.4::192.168.7.3:255.255.255.0 console=ttyS0 console=ttyS1 oprofile.timer=1  printk.time=1
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000000ffdafff] usable
[    0.000000] BIOS-e820: [mem 0x000000000ffdb000-0x000000000fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] user: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] user: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] user: [mem 0x0000000000100000-0x000000000ffdafff] usable
[    0.000000] user: [mem 0x000000000ffdb000-0x000000000fffffff] reserved
[    0.000000] user: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.000000] user: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[    0.000000] Hypervisor detected: KVM
[    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000] kvm-clock: cpu 0, msr a9cb001, primary cpu clock
[    0.000001] kvm-clock: using sched offset of 533268873 cycles
[    0.000014] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000026] tsc: Detected 2699.998 MHz processor
[    0.001417] last_pfn = 0xffdb max_arch_pfn = 0x400000000
[    0.001519] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.012520] found SMP MP-table at [mem 0x000f5a50-0x000f5a5f]
[    0.012651] check: Scanning 1 areas for low memory corruption
[    0.012920] ACPI: Early table checksum verification disabled
[    0.012955] ACPI: RSDP 0x00000000000F5A10 000014 (v00 BOCHS )
[    0.012968] ACPI: RSDT 0x000000000FFE1451 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
[    0.012993] ACPI: FACP 0x000000000FFE12ED 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
[    0.013008] ACPI: DSDT 0x000000000FFDFDC0 00152D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
[    0.013015] ACPI: FACS 0x000000000FFDFD80 000040
[    0.013022] ACPI: APIC 0x000000000FFE1361 000090 (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
[    0.013029] ACPI: HPET 0x000000000FFE13F1 000038 (v01 BOCHS  BXPCHPET 00000001 BXPC 00000001)
[    0.013036] ACPI: WAET 0x000000000FFE1429 000028 (v01 BOCHS  BXPCWAET 00000001 BXPC 00000001)
[    0.013044] ACPI: Reserving FACP table memory at [mem 0xffe12ed-0xffe1360]
[    0.013046] ACPI: Reserving DSDT table memory at [mem 0xffdfdc0-0xffe12ec]
[    0.013049] ACPI: Reserving FACS table memory at [mem 0xffdfd80-0xffdfdbf]
[    0.013051] ACPI: Reserving APIC table memory at [mem 0xffe1361-0xffe13f0]
[    0.013053] ACPI: Reserving HPET table memory at [mem 0xffe13f1-0xffe1428]
[    0.013055] ACPI: Reserving WAET table memory at [mem 0xffe1429-0xffe1450]
[    0.013211] Zone ranges:
[    0.013213]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.013217]   DMA32    [mem 0x0000000001000000-0x000000000ffdafff]
[    0.013220]   Normal   empty
[    0.013222] Movable zone start for each node
[    0.013224] Early memory node ranges
[    0.013226]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.013228]   node   0: [mem 0x0000000000100000-0x000000000ffdafff]
[    0.013236] Initmem setup node 0 [mem 0x0000000000001000-0x000000000ffdafff]
[    0.014437]   DMA zone: 28770 pages in unavailable ranges
[    0.015619]   DMA32 zone: 37 pages in unavailable ranges
[    0.016485] ACPI: PM-Timer IO Port: 0x608
[    0.016513] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.016590] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
[    0.016597] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.016601] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[    0.016604] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.016614] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
[    0.016616] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
[    0.016628] Using ACPI (MADT) for SMP configuration information
[    0.016632] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.016643] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.016688] [mem 0x10000000-0xfeffbfff] available for PCI devices
[    0.016691] Booting paravirtualized kernel on KVM
[    0.016704] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.016721] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:4 nr_node_ids:1
[    0.018120] percpu: Embedded 53 pages/cpu s176728 r8192 d32168 u524288
[    0.018206] kvm-guest: stealtime: cpu 0, msr f817600
[    0.018219] Built 1 zonelists, mobility grouping on.  Total pages: 64356
[    0.018222] Kernel command line: root=/dev/vda rw  mem=256M ip=192.168.7.4::192.168.7.3:255.255.255.0 console=ttyS0 console=ttyS1 oprofile.timer=1  printk.time=1
[    0.018653] Dentry cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.018815] Inode-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.018938] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.021155] Memory: 227160K/261604K available (16396K kernel code, 2094K rwdata, 3444K rodata, 1532K init, 2364K bss, 34184K reserved, 0K cma-reserved)
[    0.021256] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.021285] Kernel/User page tables isolation: enabled
[    0.021336] ftrace: allocating 44395 entries in 174 pages
[    0.053286] ftrace: allocated 174 pages with 5 groups
[    0.054241] rcu: Preemptible hierarchical RCU implementation.
[    0.054245] rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
[    0.054248] 	Trampoline variant of Tasks RCU enabled.
[    0.054249] 	Rude variant of Tasks RCU enabled.
[    0.054250] 	Tracing variant of Tasks RCU enabled.
[    0.054252] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.054255] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.060288] NR_IRQS: 4352, nr_irqs: 456, preallocated irqs: 16
[    0.060660] random: get_random_bytes called from start_kernel+0x367/0x522 with crng_init=0
[    0.072196] Console: colour VGA+ 80x25
[    0.276881] printk: console [ttyS0] enabled
[    0.278182] ACPI: Core revision 20200925
[    0.279672] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
[    0.282713] APIC: Switch to symmetric I/O mode setup
[    0.284707] x2apic enabled
[    0.286034] Switched APIC routing to physical x2apic.
[    0.289760] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.291678] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x26eb3cc21a9, max_idle_ns: 440795299783 ns
[    0.294973] Calibrating delay loop (skipped) preset value.. 5399.99 BogoMIPS (lpj=2699998)
[    0.295980] pid_max: default: 32768 minimum: 301
[    0.297036] LSM: Security Framework initializing
[    0.298040] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.298981] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.301537] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.301981] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.302978] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.303980] Spectre V2 : Mitigation: Full generic retpoline
[    0.304974] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.305978] Speculative Store Bypass: Vulnerable
[    0.306977] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    0.308345] Freeing SMP alternatives memory: 48K
[    0.412271] smpboot: CPU0: Intel(R) Core(TM)2 Duo CPU     T7700  @ 2.40GHz (family: 0x6, model: 0xf, stepping: 0xb)
[    0.414177] Performance Events: unsupported p6 CPU model 15 no PMU driver, software events only.
[    0.416006] rcu: Hierarchical SRCU implementation.
[    0.417229] smp: Bringing up secondary CPUs ...
[    0.418123] x86: Booting SMP configuration:
[    0.418973] .... node  #0, CPUs:      #1
[    0.229372] kvm-clock: cpu 1, msr a9cb041, secondary cpu clock
[    0.229372] smpboot: CPU 1 Converting physical 0 to logical die 1
[    0.424018] kvm-guest: stealtime: cpu 1, msr f897600
[    0.425183]  #2
[    0.229372] kvm-clock: cpu 2, msr a9cb081, secondary cpu clock
[    0.229372] smpboot: CPU 2 Converting physical 0 to logical die 2
[    0.430028] kvm-guest: stealtime: cpu 2, msr f917600
[    0.431223]  #3
[    0.229372] kvm-clock: cpu 3, msr a9cb0c1, secondary cpu clock
[    0.229372] smpboot: CPU 3 Converting physical 0 to logical die 3
[    0.436028] kvm-guest: stealtime: cpu 3, msr f997600
[    0.436984] smp: Brought up 1 node, 4 CPUs
[    0.437979] smpboot: Max logical packages: 4
[    0.438973] smpboot: Total of 4 processors activated (21599.98 BogoMIPS)
[    0.441060] devtmpfs: initialized
[    0.442083] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.442979] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.444052] pinctrl core: initialized pinctrl subsystem
[    0.447009] NET: Registered protocol family 16
[    0.448152] thermal_sys: Registered thermal governor 'step_wise'
[    0.448153] thermal_sys: Registered thermal governor 'user_space'
[    0.449981] cpuidle: using governor menu
[    0.452049] ACPI: bus type PCI registered
[    0.453184] PCI: Using configuration type 1 for base access
[    0.455906] Kprobes globally optimized
[    0.477986] raid6: sse2x4   gen()  4728 MB/s
[    0.495983] raid6: sse2x4   xor()  3129 MB/s
[    0.513978] raid6: sse2x2   gen()  4543 MB/s
[    0.530981] raid6: sse2x2   xor()  7519 MB/s
[    0.549010] raid6: sse2x1   gen()  3552 MB/s
[    0.565997] raid6: sse2x1   xor()  6896 MB/s
[    0.566891] raid6: using algorithm sse2x4 gen() 4728 MB/s
[    0.566999] raid6: .... xor() 3129 MB/s, rmw enabled
[    0.567977] raid6: using ssse3x2 recovery algorithm
[    0.569263] ACPI: Added _OSI(Module Device)
[    0.569972] ACPI: Added _OSI(Processor Device)
[    0.570974] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.571976] ACPI: Added _OSI(Processor Aggregator Device)
[    0.572976] ACPI: Added _OSI(Linux-Dell-Video)
[    0.573975] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.574976] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.577469] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.579346] ACPI: Interpreter enabled
[    0.580032] ACPI: (supports S0 S3 S5)
[    0.580983] ACPI: Using IOAPIC for interrupt routing
[    0.582056] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.583239] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.589045] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.590030] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MSI HPX-Type3]
[    0.591037] acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.
[    0.592173] PCI host bridge to bus 0000:00
[    0.592983] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.593983] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.594987] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.595983] pci_bus 0000:00: root bus resource [mem 0x10000000-0xfebfffff window]
[    0.596981] pci_bus 0000:00: root bus resource [mem 0x100000000-0x17fffffff window]
[    0.597981] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.599154] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.602664] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.604802] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.608999] pci 0000:00:01.1: reg 0x20: [io  0xc0e0-0xc0ef]
[    0.612249] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
[    0.612980] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.613981] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
[    0.614984] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.617226] pci 0000:00:01.2: [8086:7020] type 00 class 0x0c0300
[    0.621334] pci 0000:00:01.2: reg 0x20: [io  0xc080-0xc09f]
[    0.626013] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    0.628463] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX4 ACPI
[    0.629043] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX4 SMB
[    0.630573] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
[    0.633011] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pref]
[    0.638032] pci 0000:00:02.0: reg 0x18: [mem 0xfebd0000-0xfebd0fff]
[    0.646031] pci 0000:00:02.0: reg 0x30: [mem 0xfebc0000-0xfebcffff pref]
[    0.648741] pci 0000:00:03.0: [1af4:1000] type 00 class 0x020000
[    0.650988] pci 0000:00:03.0: reg 0x10: [io  0xc0a0-0xc0bf]
[    0.653614] pci 0000:00:03.0: reg 0x14: [mem 0xfebd1000-0xfebd1fff]
[    0.658986] pci 0000:00:03.0: reg 0x20: [mem 0xfe000000-0xfe003fff 64bit pref]
[    0.661985] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pref]
[    0.664891] pci 0000:00:04.0: [1af4:1005] type 00 class 0x00ff00
[    0.666980] pci 0000:00:04.0: reg 0x10: [io  0xc0c0-0xc0df]
[    0.671983] pci 0000:00:04.0: reg 0x20: [mem 0xfe004000-0xfe007fff 64bit pref]
[    0.675687] pci 0000:00:05.0: [1af4:1001] type 00 class 0x010000
[    0.677984] pci 0000:00:05.0: reg 0x10: [io  0xc000-0xc07f]
[    0.680984] pci 0000:00:05.0: reg 0x14: [mem 0xfebd2000-0xfebd2fff]
[    0.687985] pci 0000:00:05.0: reg 0x20: [mem 0xfe008000-0xfe00bfff 64bit pref]
[    0.693158] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
[    0.694146] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
[    0.696001] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
[    0.698098] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
[    0.699083] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
[    0.701084] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.701968] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.701988] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.702989] vgaarb: loaded
[    0.704258] SCSI subsystem initialized
[    0.705129] ACPI: bus type USB registered
[    0.706031] usbcore: registered new interface driver usbfs
[    0.707021] usbcore: registered new interface driver hub
[    0.708011] usbcore: registered new device driver usb
[    0.709064] pps_core: LinuxPPS API ver. 1 registered
[    0.709977] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.711010] PTP clock support registered
[    0.712410] Bluetooth: Core ver 2.22
[    0.713005] NET: Registered protocol family 31
[    0.713975] Bluetooth: HCI device and connection manager initialized
[    0.715008] Bluetooth: HCI socket layer initialized
[    0.715978] Bluetooth: L2CAP socket layer initialized
[    0.717016] Bluetooth: SCO socket layer initialized
[    0.718108] PCI: Using ACPI for IRQ routing
[    0.719481] hpet: 3 channels of 0 reserved for per-cpu timers
[    0.720016] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.720976] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[    0.727264] clocksource: Switched to clocksource kvm-clock
[    0.989183] pnp: PnP ACPI init
[    0.991005] pnp: PnP ACPI: found 8 devices
[    1.000135] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    1.002404] NET: Registered protocol family 2
[    1.004031] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)
[    1.005862] TCP established hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    1.007398] TCP bind hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    1.008946] TCP: Hash tables configured (established 2048 bind 2048)
[    1.010313] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    1.011741] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    1.013274] NET: Registered protocol family 1
[    1.014830] RPC: Registered named UNIX socket transport module.
[    1.016076] RPC: Registered udp transport module.
[    1.017089] RPC: Registered tcp transport module.
[    1.018024] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.019381] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.020757] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.022625] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    1.023995] pci_bus 0000:00: resource 7 [mem 0x10000000-0xfebfffff window]
[    1.025503] pci_bus 0000:00: resource 8 [mem 0x100000000-0x17fffffff window]
[    1.026991] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    1.028205] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    1.030027] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    1.061632] PCI Interrupt Link [LNKD] enabled at IRQ 11
[    1.090904] pci 0000:00:01.2: quirk_usb_early_handoff+0x0/0x6d0 took 58196 usecs
[    1.092960] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    1.095232] PCI: CLS 0 bytes, default 64
[    1.096764] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x26eb3cc21a9, max_idle_ns: 440795299783 ns
[   22.101171] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[   22.102160] rcu: 	1-...0: (1 GPs behind) idle=f46/1/0x4000000000000000 softirq=16/17 fqs=5217 
[   22.102160] 	(detected by 0, t=21002 jiffies, g=-1151, q=7)
[   85.128126] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:


