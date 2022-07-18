Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2484C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 18:07:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.30612.1658167616323877318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 83E7A40CB4;
	Mon, 18 Jul 2022 18:06:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4Opz7kyT47a; Mon, 18 Jul 2022 18:06:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5308840CB3;
	Mon, 18 Jul 2022 18:06:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 713501749AF; Mon, 18 Jul 2022 14:06:52 -0400 (EDT)
Date: Mon, 18 Jul 2022 14:06:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org,
	rp@denix.org
Subject: Re: [OE-core] [PATCH 2/2][dunfell] linux-yocto/5.4: update to
 v5.4.203
Message-ID: <20220718180652.GR18692@denix.org>
References: <20220707163827.857-1-bruce.ashfield@gmail.com>
 <20220707163827.857-2-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707163827.857-2-bruce.ashfield@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 18:07:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168248

There's been some rework done around random subsystem lately. It now breaks RT 
kernel, at least on Aarch64, x86_64, maybe other platforms. Is there a quick 
fix, or should this update be reverted in Dunfell?


| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:39:45: warning: 'struct random_ready_callback' declared inside parameter list will not be visible outside of this definition or declaration
|    39 | extern int add_random_ready_callback(struct random_ready_callback *rdy);
|       |                                             ^~~~~~~~~~~~~~~~~~~~~
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:40:46: warning: 'struct random_ready_callback' declared inside parameter list will not be visible outside of this definition or declaration
|    40 | extern void del_random_ready_callback(struct random_ready_callback *rdy);
|       |                                              ^~~~~~~~~~~~~~~~~~~~~
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:47:6: error: conflicting types for 'get_random_bytes'
|    47 | void get_random_bytes(void *buf, size_t len);
|       |      ^~~~~~~~~~~~~~~~
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:35:13: note: previous declaration of 'get_random_bytes' was here
|    35 | extern void get_random_bytes(void *buf, int nbytes);
|       |             ^~~~~~~~~~~~~~~~
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:48:21: error: conflicting types for 'get_random_bytes_arch'
|    48 | size_t __must_check get_random_bytes_arch(void *buf, size_t len);
|       |                     ^~~~~~~~~~~~~~~~~~~~~
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/include/linux/random.h:41:25: note: previous declaration of 'get_random_bytes_arch' was here
|    41 | extern int __must_check get_random_bytes_arch(void *buf, int nbytes);
|       |                         ^~~~~~~~~~~~~~~~~~~~~
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/scripts/Makefile.build:99: recipe for target 'arch/arm64/kernel/asm-offsets.s' failed
| make[2]: *** [arch/arm64/kernel/asm-offsets.s] Error 1
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:1134: recipe for target 'prepare0' failed
| make[1]: *** [prepare0] Error 2
| /OE/poky-dunfell/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:179: recipe for target 'sub-make' failed
| make: *** [sub-make] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/OE/poky-dunfell/build/tmp/work/qemuarm64-poky-linux/linux-yocto-rt/5.4.203+gitAUTOINC+010ac788e8_fa8536530b-r0/temp/run.do_compile.240410' failed with exit code 1
ERROR: Task (/OE/poky-dunfell/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 586 tasks of which 465 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /OE/poky-dunfell/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


On Thu, Jul 07, 2022 at 12:38:27PM -0400, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Updating  to the latest korg -stable release that comprises
> the following commits:
> 
>     871cbc208bf0 Linux 5.4.203
>     572cc34503d4 crypto: arm/ghash-ce - define fpu before fpu registers are referenced
>     3bf992f9d9a8 crypto: arm - use Kconfig based compiler checks for crypto opcodes
>     1b43c30cd5d5 ARM: 9029/1: Make iwmmxt.S support Clang's integrated assembler
>     9e00e5d195ed ARM: OMAP2+: drop unnecessary adrl
>     3657432a75e3 ARM: 8929/1: use APSR_nzcv instead of r15 as mrc operand
>     02c200fdba46 ARM: 8933/1: replace Sun/Solaris style flag on section directive
>     54e6ecd5b7ca crypto: arm/sha512-neon - avoid ADRL pseudo instruction
>     5e6f80033286 crypto: arm/sha256-neon - avoid ADRL pseudo instruction
>     e120403c0e7c ARM: 8971/1: replace the sole use of a symbol with its definition
>     0a43679016f0 ARM: 8990/1: use VFP assembler mnemonics in register load/store macros
>     472671eec98a ARM: 8989/1: use .fpu assembler directives instead of assembler arguments
>     2bfb0d43a47c net: mscc: ocelot: allow unregistered IP multicast flooding
>     223d551a6681 kexec_file: drop weak attribute from arch_kexec_apply_relocations[_add]
>     ab3ed204a146 powerpc/ftrace: Remove ftrace init tramp once kernel init is complete
>     77e2ad091850 drm: remove drm_fb_helper_modinit
>     9ef3ad40a81f Linux 5.4.202
>     ceda71d49f6b powerpc/pseries: wire up rng during setup_arch()
>     ece983890287 kbuild: link vmlinux only once for CONFIG_TRIM_UNUSED_KSYMS (2nd attempt)
>     2a81e813141e random: update comment from copy_to_user() -> copy_to_iter()
>     80f0038d757e modpost: fix section mismatch check for exported init/exit sections
>     d1359e4129ad ARM: cns3xxx: Fix refcount leak in cns3xxx_init
>     29ca9c4efacc ARM: Fix refcount leak in axxia_boot_secondary
>     734a4d15142b soc: bcm: brcmstb: pm: pm-arm: Fix refcount leak in brcmstb_pm_probe
>     f9b77a529375 ARM: exynos: Fix refcount leak in exynos_map_pmu
>     615907ccc421 ARM: dts: imx6qdl: correct PU regulator ramp delay
>     93e6137d2a5b powerpc/powernv: wire up rng during setup_arch
>     97808c781721 powerpc/rtas: Allow ibm,platform-dump RTAS call with null buffer address
>     b6232979320a powerpc: Enable execve syscall exit tracepoint
>     e0701f150b28 parisc: Enable ARCH_HAS_STRICT_MODULE_RWX
>     e5234a9d64a9 xtensa: Fix refcount leak bug in time.c
>     a52972ee706b xtensa: xtfpga: Fix refcount leak bug in setup
>     f0fc7cdf5f19 iio: adc: axp288: Override TS pin bias current for some models
>     11c7ea38be91 iio: adc: stm32: fix maximum clock rate for stm32mp15x
>     5e39397d60da iio: trigger: sysfs: fix use-after-free on remove
>     6d2e68d02171 iio: gyro: mpu3050: Fix the error handling in mpu3050_power_up()
>     1ad6d668543d iio: accel: mma8452: ignore the return value of reset operation
>     a391bced8404 iio:accel:mxc4005: rearrange iio trigger get and register
>     23c158caa032 iio:accel:bma180: rearrange iio trigger get and register
>     8ea16a64aafc iio:chemical:ccs811: rearrange iio trigger get and register
>     2333db14d875 usb: chipidea: udc: check request status before setting device address
>     47e41b4dabbf xhci: turn off port power in shutdown
>     d62d1c606db0 iio: adc: vf610: fix conversion mode sysfs node name
>     741b6c8363c2 s390/cpumf: Handle events cycles and instructions identical
>     4837d1c81223 gpio: winbond: Fix error code in winbond_gpio_get()
>     bb18ad00c0b7 Revert "net/tls: fix tls_sk_proto_close executed repeatedly"
>     8c7a32b7c155 virtio_net: fix xdp_rxq_info bug after suspend/resume
>     28a78414f21e igb: Make DMA faster when CPU is active on the PCIe link
>     a5ed066bc246 regmap-irq: Fix a bug in regmap_irq_enable() for type_in_mask chips
>     844168a5dabf ice: ethtool: advertise 1000M speeds properly
>     e3a232e57670 afs: Fix dynamic root getattr
>     cacab1e620e0 MIPS: Remove repetitive increase irq_err_count
>     788c954f194c x86/xen: Remove undefined behavior in setup_features()
>     c7bdaad9cbfe udmabuf: add back sanity check
>     05c6c36c7931 net/tls: fix tls_sk_proto_close executed repeatedly
>     02da602bc2f3 erspan: do not assume transport header is always set
>     d1592d3e362c drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
>     f1f9c2a5a3d9 net/sched: sch_netem: Fix arithmetic in netem_dump() for 32-bit platforms
>     47d31b97bf47 bonding: ARP monitor spams NETDEV_NOTIFY_PEERS notifiers
>     104a59b74577 phy: aquantia: Fix AN when higher speeds than 1G are not advertised
>     8ffe2e50e967 bpf: Fix request_sock leak in sk lookup helpers
>     f074ab253988 USB: serial: option: add Quectel RM500K module support
>     ea7b23eadebc USB: serial: option: add Quectel EM05-G modem
>     613c849d73df USB: serial: option: add Telit LE910Cx 0x1250 composition
>     ae183969bd66 random: quiet urandom warning ratelimit suppression message
>     06a24ddba93a dm mirror log: clear log bits up to BITS_PER_LONG boundary
>     1f350f3cf0c1 dm era: commit metadata in postsuspend after worker stops
>     0e75acbe1b76 ata: libata: add qc->flags in ata_qc_complete_template tracepoint
>     71c76f56b97c mtd: rawnand: gpmi: Fix setting busy timeout setting
>     c8d37e6ca180 mmc: sdhci-pci-o2micro: Fix card detect by dealing with debouncing
>     af28f602df74 net: openvswitch: fix parsing of nw_proto for IPv6 fragments
>     6fda65dabd3e ALSA: hda/realtek: Add quirk for Clevo PD70PNT
>     5fbad99e76c0 ALSA: hda/realtek - ALC897 headset MIC no sound
>     cf81f367cf81 ALSA: hda/conexant: Fix missing beep setup
>     eca9b5e36e24 ALSA: hda/via: Fix missing beep setup
>     1df5178fdebe random: schedule mix_interrupt_randomness() less often
>     c87e851b23e5 vt: drop old FONT ioctls
>     23db944f754e Linux 5.4.201
>     3994d2ee55e2 Revert "hwmon: Make chip parameter for with_info API mandatory"
>     7b9c3bfbad25 arm64: mm: Don't invalidate FROM_DEVICE buffers at start of DMA transfer
>     2e1591c27b95 tcp: drop the hash_32() part from the index calculation
>     c26e1addf157 tcp: increase source port perturb table to 2^16
>     77d29f3b18c4 tcp: dynamically allocate the perturb table used by source ports
>     7c0a777b7dbd tcp: add small random increments to the source port
>     53c5de3092ad tcp: use different parts of the port_offset for index and offset
>     95921a3bab76 tcp: add some entropy in __inet_hash_connect()
>     bdcbf2602feb usb: gadget: u_ether: fix regression in setting fixed MAC address
>     2577d67a9a8a dm: remove special-casing of bio-based immutable singleton target on NVMe
>     4143503b486a s390/mm: use non-quiescing sske for KVM switch to keyed guest
>     f0c280af0ec7 Linux 5.4.200
>     ab8dff4b716e powerpc/mm: Switch obsolete dssall to .long
>     1a48a41f1422 riscv: Less inefficient gcc tishift helpers (and export their symbols)
>     2464a1c0de53 RISC-V: fix barrier() use in <vdso/processor.h>
>     490a02cd8205 arm64: kprobes: Use BRK instead of single-step when executing instructions out-of-line
>     ef6f9ce0a79a net: openvswitch: fix leak of nested actions
>     6bb3c77c74f5 net: openvswitch: fix misuse of the cached connection on tuple changes
>     b47319b4aa21 net/sched: act_police: more accurate MTU policing
>     13fbdea1184b virtio-pci: Remove wrong address verification in vp_del_vqs()
>     80e4d8a27451 ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for HP machine
>     119e0268cc1c ALSA: hda/realtek: fix mute/micmute LEDs for HP 440 G8
>     fba542891767 ext4: add reserved GDT blocks check
>     4ca0d2f1e04e ext4: make variable "count" signed
>     a6b31616e5af ext4: fix bug_on ext4_mb_use_inode_pa
>     ae4603128751 dm mirror log: round up region bitmap size to BITS_PER_LONG
>     64d2df648003 serial: 8250: Store to lsr_save_flags after lsr read
>     b75bddfcc181 usb: gadget: lpc32xx_udc: Fix refcount leak in lpc32xx_udc_probe
>     6506aff2dc2f usb: dwc2: Fix memory leak in dwc2_hcd_init
>     940653b51c33 USB: serial: io_ti: add Agilent E5805A support
>     31363b2b868e USB: serial: option: add support for Cinterion MV31 with new baseline
>     d0c3730f2763 comedi: vmk80xx: fix expression for tx buffer size
>     bf833c484881 i2c: designware: Use standard optional ref clock implementation
>     8d884c08eeb8 irqchip/gic-v3: Fix refcount leak in gic_populate_ppi_partitions
>     58e67c81e229 irqchip/gic-v3: Fix error handling in gic_populate_ppi_partitions
>     56526c3883fc irqchip/gic/realview: Fix refcount leak in realview_gic_of_init
>     4695bafabf5b faddr2line: Fix overlapping text section failures, the sequel
>     1b34d6a93832 certs/blacklist_hashes.c: fix const confusion in certs blacklist
>     fb775ee3cfff arm64: ftrace: fix branch range checks
>     0e21311ba459 net: bgmac: Fix an erroneous kfree() in bgmac_remove()
>     c19cdd72b3ec mlxsw: spectrum_cnt: Reorder counter pools
>     c03304dc4234 misc: atmel-ssc: Fix IRQ check in ssc_probe
>     f7183c76d500 tty: goldfish: Fix free_irq() on remove
>     ff6e03fe84bc i40e: Fix call trace in setup_tx_descriptors
>     4b94408e1617 i40e: Fix calculating the number of queue pairs
>     43f65970eeb2 i40e: Fix adding ADQ filter to TC0
>     cff3a7ce6e81 clocksource: hyper-v: unexport __init-annotated hv_init_clocksource()
>     11c870c0b532 pNFS: Don't keep retrying if the server replied NFS4ERR_LAYOUTUNAVAILABLE
>     e32fe87afcfe random: credit cpu and bootloader seeds by default
>     9e4cab02b7ec net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
>     2f42389d270f ipv6: Fix signed integer overflow in l2tp_ip6_sendmsg
>     6b4d8b44e716 nfc: nfcmrvl: Fix memory leak in nfcmrvl_play_deferred
>     786428a1dec2 virtio-mmio: fix missing put_device() when vm_cmdline_parent registration failed
>     aacb264d54c4 ALSA: hda/realtek - Add HW8326 support
>     ff882404dff7 scsi: pmcraid: Fix missing resource cleanup in error case
>     c48119223618 scsi: ipr: Fix missing/incorrect resource cleanup in error case
>     fe0855944a64 scsi: lpfc: Allow reduced polling rate for nvme_admin_async_event cmd completion
>     1f1be79189fd scsi: lpfc: Fix port stuck in bypassed state after LIP in PT2PT topology
>     001de3d8ce82 scsi: vmw_pvscsi: Expand vcpuHint to 16 bits
>     9e3a0d3fc71c ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
>     bc046649c5d6 ASoC: es8328: Fix event generation for deemphasis control
>     a81f5a7f7a20 ASoC: wm8962: Fix suspend while playing music
>     253334f84c81 ata: libata-core: fix NULL pointer deref in ata_host_alloc_pinfo()
>     052cd621acbf ASoC: cs42l56: Correct typo in minimum level for SX volume controls
>     6d180913b3ab ASoC: cs42l52: Correct TLV for Bypass Volume
>     385a031c56a9 ASoC: cs53l30: Correct number of volume levels on SX controls
>     675b6a49cf70 ASoC: cs35l36: Update digital volume TLV
>     b00f63dba5b8 ASoC: cs42l52: Fix TLV scales for mixer controls
>     cd8c1e6c01f1 dma-debug: make things less spammy under memory pressure
>     a45e19fd6ed8 ASoC: nau8822: Add operation for internal PLL off and on
>     348831a9e8aa powerpc/kasan: Silence KASAN warnings in __get_wchan()
>     5624055c8f4b random: account for arch randomness in bits
>     c0bf6bfce70a random: mark bootloader randomness code as __init
>     f96250197b43 random: avoid checking crng_ready() twice in random_init()
>     072cd87d12a8 crypto: drbg - make reseeding from get_random_bytes() synchronous
>     e9eb0c4741a7 crypto: drbg - always try to free Jitter RNG instance
>     f284afc3a9ca crypto: drbg - move dynamic ->reseed_threshold adjustments to __drbg_seed()
>     babba4bf53a6 crypto: drbg - track whether DRBG was seeded with !rng_is_initialized()
>     1b93b302e942 crypto: drbg - prepare for more fine-grained tracking of seeding state
>     98e574a73414 crypto: drbg - always seeded with SP800-90B compliant noise source
>     61f87ea3f957 Revert "random: use static branch for crng_ready()"
>     3faf33a85650 random: check for signals after page of pool writes
>     2177cef53ec9 random: wire up fops->splice_{read,write}_iter()
>     35db2a073118 random: convert to using fops->write_iter()
>     43e62db84a99 random: convert to using fops->read_iter()
>     c23188facd10 random: unify batched entropy implementations
>     1aeedbe02b5c random: move randomize_page() into mm where it belongs
>     ceaf1feefe6e random: move initialization functions out of hot pages
>     d3bf98d61fb6 random: make consistent use of buf and len
>     70fce7f105bb random: use proper return types on get_random_{int,long}_wait()
>     d05948dc23e6 random: remove extern from functions in header
>     d8b4296417ea random: use static branch for crng_ready()
>     087a14b9cf9b random: credit architectural init the exact amount
>     ac48f7bee198 random: handle latent entropy and command line from random_init()
>     736a22645d98 random: use proper jiffies comparison macro
>     3266fba20661 random: remove ratelimiting for in-kernel unseeded randomness
>     c5373bd6e4fb random: move initialization out of reseeding hot path
>     0747ad152fa1 random: avoid initializing twice in credit race
>     0baeec0effc7 random: use symbolic constants for crng_init states
>     55d64df3ad5b siphash: use one source of truth for siphash permutations
>     e4e8a9f8a616 random: help compiler out with fast_mix() by using simpler arguments
>     bf3b51eb0f13 random: do not use input pool from hard IRQs
>     6d4203a2cddc random: order timer entropy functions below interrupt functions
>     58da574f105a random: do not pretend to handle premature next security model
>     e739d5bd1466 random: use first 128 bits of input as fast init
>     c44f8b386376 random: do not use batches when !crng_ready()
>     e247ea8d97bf random: insist on random_get_entropy() existing in order to simplify
>     9bfbcb37e5f6 xtensa: use fallback for random_get_entropy() instead of zero
>     fa15650b51f6 sparc: use fallback for random_get_entropy() instead of zero
>     9dfc14590c5d um: use fallback for random_get_entropy() instead of zero
>     0cc41e2c73f7 x86/tsc: Use fallback for random_get_entropy() instead of zero
>     f2a6e8727084 nios2: use fallback for random_get_entropy() instead of zero
>     db1d13fe4c80 arm: use fallback for random_get_entropy() instead of zero
>     6fa912f987fa mips: use fallback for random_get_entropy() instead of just c0 random
>     36f38f838c5b m68k: use fallback for random_get_entropy() instead of zero
>     a7d04ca9da61 timekeeping: Add raw clock fallback for random_get_entropy()
>     eb2f9d72f32a powerpc: define get_cycles macro for arch-override
>     10455a367c33 alpha: define get_cycles macro for arch-override
>     5f0b77ca1978 parisc: define get_cycles macro for arch-override
>     80459abc9fee s390: define get_cycles macro for arch-override
>     73385644490a ia64: define get_cycles macro for arch-override
>     5fac86663976 init: call time_init() before rand_initialize()
>     b88ae87b100c random: fix sysctl documentation nits
>     465425748359 random: document crng_fast_key_erasure() destination possibility
>     ec07b3494517 random: make random_get_entropy() return an unsigned long
>     fe156368f987 random: allow partial reads if later user copies fail
>     70788723da70 random: check for signals every PAGE_SIZE chunk of /dev/[u]random
>     2ce859d91fe9 random: check for signal_pending() outside of need_resched() check
>     0e8030c9e03d random: do not allow user to keep crng key around on stack
>     95aed891f7be random: do not split fast init input in add_hwgenerator_randomness()
>     1d53d5a0973e random: mix build-time latent entropy into pool at init
>     0aba75c6173d random: re-add removed comment about get_random_{u32,u64} reseeding
>     81ea8a609b48 random: treat bootloader trust toggle the same way as cpu trust toggle
>     a08d52a6081b random: skip fast_init if hwrng provides large chunk of entropy
>     8320bc665c29 random: check for signal and try earlier when generating entropy
>     3a53b818bb0e random: reseed more often immediately after booting
>     905759e0fc17 random: make consistent usage of crng_ready()
>     ad4c6bd98c54 random: use SipHash as interrupt entropy accumulator
>     631503001ccf random: replace custom notifier chain with standard one
>     1ae73fb2a635 random: don't let 644 read-only sysctls be written to
>     ed409757100b random: give sysctl_random_min_urandom_seed a more sensible value
>     75d95c1b5dea random: do crng pre-init loading in worker rather than irq
>     219c84fe93e5 random: unify cycles_t and jiffies usage and types
>     673637c4c9e0 random: cleanup UUID handling
>     4d5151cc288a random: only wake up writers after zap if threshold was passed
>     ac0081dec7d6 random: round-robin registers as ulong, not u32
>     62cd795e465a random: clear fast pool, crng, and batches in cpuhp bring up
>     a7f8f385bb6f random: pull add_hwgenerator_randomness() declaration into random.h
>     ff607fc7607d random: check for crng_init == 0 in add_device_randomness()
>     20788eb4ce70 random: unify early init crng load accounting
>     49567f947735 random: do not take pool spinlock at boot
>     4a61bf7f9b18 random: defer fast pool mixing to worker
>     944d1bd0e5be random: rewrite header introductory comment
>     c0e35949c736 random: group sysctl functions
>     d946084180ee random: group userspace read/write functions
>     565a66043bdf random: group entropy collection functions
>     f2d587c493fc random: group entropy extraction functions
>     a8786d54762f random: group crng functions
>     c12dfec1aacf random: group initialization wait functions
>     22e3db57ab94 random: remove whitespace and reorder includes
>     cee64be60591 random: remove useless header comment
>     904e6123c400 random: introduce drain_entropy() helper to declutter crng_reseed()
>     47c56790d51c random: deobfuscate irq u32/u64 contributions
>     e280b79c3127 random: add proper SPDX header
>     776927dfd4ac random: remove unused tracepoints
>     d68883956d36 random: remove ifdef'd out interrupt bench
>     4a14a5a6969a random: tie batched entropy generation to base_crng generation
>     d8a6684950c1 random: fix locking for crng_init in crng_reseed()
>     b1d561138150 random: zero buffer after reading entropy from userspace
>     21da00f8cb3a random: remove outdated INT_MAX >> 6 check in urandom_read()
>     b530684129b2 random: make more consistent use of integer types
>     3eed6af93ecd random: use hash function for crng_slow_load()
>     cee3c7056900 random: use simpler fast key erasure flow on per-cpu keys
>     ea9941fd6e26 random: absorb fast pool into input pool after fast load
>     a3562bf4e8c9 random: do not xor RDRAND when writing into /dev/random
>     574c8839504b random: ensure early RDSEED goes through mixer on init
>     d3d3c1c214c3 random: inline leaves of rand_initialize()
>     817315517af9 random: get rid of secondary crngs
>     c15fc80b7df0 random: use RDSEED instead of RDRAND in entropy extraction
>     72db8151c889 random: fix locking in crng_fast_load()
>     7229c6d90a1a random: remove batched entropy locking
>     6c8911579221 random: remove use_input_pool parameter from crng_reseed()
>     4ef908fb81d9 random: make credit_entropy_bits() always safe
>     42a9a7e80750 random: always wake up entropy writers after extraction
>     373ef51f3e8a random: use linear min-entropy accumulation crediting
>     a1a2bae5ef93 random: simplify entropy debiting
>     4e5814bd2e75 random: use computational hash for entropy extraction
>     99a0f8e22d4c random: only call crng_finalize_init() for primary_crng
>     88609b892fdd random: access primary_pool directly rather than through pointer
>     0b9f9b94f1ea random: continually use hwgenerator randomness
>     811e333c4eb2 random: simplify arithmetic function flow in account()
>     56de23dcf9d0 random: selectively clang-format where it makes sense
>     86eac12b1cf5 random: access input_pool_data directly rather than through pointer
>     4f5400ca7fc1 random: cleanup fractional entropy shift constants
>     1b6f1d32a858 random: prepend remaining pool constants with POOL_
>     0fe4a64fd946 random: de-duplicate INPUT_POOL constants
>     e35576c4cb18 random: remove unused OUTPUT_POOL constants
>     74cb3093f2de random: rather than entropy_store abstraction, use global
>     14652d864280 random: remove unused extract_entropy() reserved argument
>     12f17e3f3a14 random: remove incomplete last_data logic
>     adcbbb44ccc1 random: cleanup integer types
>     4ac4c7f057ff random: cleanup poolinfo abstraction
>     5c3818e3bd7b random: fix typo in comments
>     0a7e65810269 random: don't reset crng_init_cnt on urandom_read()
>     8d7c55563ed0 random: avoid superfluous call to RDRAND in CRNG extraction
>     8b4695640bc5 random: early initialization of ChaCha constants
>     cfc69065005e random: initialize ChaCha20 constants with correct endianness
>     922d082e3363 random: use IS_ENABLED(CONFIG_NUMA) instead of ifdefs
>     565b3af16894 random: harmonize "crng init done" messages
>     346c4a697c29 random: mix bootloader randomness into pool
>     afce74c0c04f random: do not re-init if crng_reseed completes before primary init
>     d76758c71209 random: do not sign extend bytes for rotation when mixing
>     c2f0a89cd1d5 random: use BLAKE2s instead of SHA1 in extraction
>     6e6ae70c1eac random: remove unused irq_flags argument from add_interrupt_randomness()
>     2580b0b3fd5a random: document add_hwgenerator_randomness() with other input functions
>     3cc36a4aa1ca crypto: blake2s - adjust include guard naming
>     09342a544c4b crypto: blake2s - include <linux/bug.h> instead of <asm/bug.h>
>     f850f3643d6b MAINTAINERS: co-maintain random.c
>     967e3a136f9b random: remove dead code left over from blocking pool
>     610f0b439a6b random: avoid arch_get_random_seed_long() when collecting IRQ randomness
>     ad3fce669105 random: add arch_get_random_*long_early()
>     41b0d3e86c50 powerpc: Use bool in archrandom.h
>     89533373e11c linux/random.h: Mark CONFIG_ARCH_RANDOM functions __must_check
>     0222f9f1d168 linux/random.h: Use false with bool
>     15f93060b718 linux/random.h: Remove arch_has_random, arch_has_random_seed
>     a95ed04e21da s390: Remove arch_has_random, arch_has_random_seed
>     aab52172d9f9 powerpc: Remove arch_has_random, arch_has_random_seed
>     35e28a05f659 x86: Remove arch_has_random, arch_has_random_seed
>     98f749e29728 random: avoid warnings for !CONFIG_NUMA builds
>     c13b9c3627d8 random: split primary/secondary crng init paths
>     c070b07aaf34 random: remove some dead code of poolinfo
>     898498bb4414 random: fix typo in add_timer_randomness()
>     2c53d6d6a7be random: Add and use pr_fmt()
>     f3375cfe31bc random: convert to ENTROPY_BITS for better code readability
>     9f757cad20b7 random: remove unnecessary unlikely()
>     4431c366fe23 random: remove kernel.random.read_wakeup_threshold
>     ec134003cc39 random: delete code to pull data into pools
>     a9564e14c6dd random: remove the blocking pool
>     940cbc47b369 random: make /dev/random be almost like /dev/urandom
>     c4edc1055c11 random: ignore GRND_RANDOM in getentropy(2)
>     7f9f864af021 random: add GRND_INSECURE to return best-effort non-cryptographic bytes
>     479d39707ff7 random: Add a urandom_read_nowait() for random APIs that don't warn
>     69441ba56f13 random: Don't wake crng_init_wait when crng_init == 1
>     69ef3109d422 random: don't forget compat_ioctl on urandom
>     927fc225af29 compat_ioctl: remove /dev/random commands
>     996fba14fa35 lib/crypto: sha1: re-roll loops to reduce code size
>     c4f48374407b lib/crypto: blake2s: move hmac construction into wireguard
>     97126d2f65b3 crypto: blake2s - generic C library implementation and selftest
>     76101f1b7f59 nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
>     e804587ecdcd bpf: Fix incorrect memory charge cost calculation in stack_map_alloc()
>     f91da317e6fa 9p: missing chunk of "fs/9p: Don't update file type when updating file attributes"
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> index 2fef4f032d..7fa1b81229 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>  
> -SRCREV_machine ?= "d7693f19702e1fa1bb18507260198478cba0d6a2"
> -SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
> +SRCREV_machine ?= "fa8536530bdd6a87856aa6fe0af4f9ef4af21fe0"
> +SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
>  
> -LINUX_VERSION ?= "5.4.199"
> +LINUX_VERSION ?= "5.4.203"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> index 32ff438a57..d08658cf7e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
>  
>  require recipes-kernel/linux/linux-yocto.inc
>  
> -LINUX_VERSION ?= "5.4.199"
> +LINUX_VERSION ?= "5.4.203"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>  
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>  
> -SRCREV_machine_qemuarm ?= "a117c8494d49f5ab6ec54a69c0f926bad5d55616"
> -SRCREV_machine ?= "fbc1147bd48ea6b51895e8ab9d6422d112cdd58a"
> -SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
> +SRCREV_machine_qemuarm ?= "d92cd7d5916772a20105ef776c7f3bf433df55a4"
> +SRCREV_machine ?= "5f7c3e952857eb90a4113a41901bb770150af46b"
> +SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> index e2130386b2..545c754c1d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
>  KBRANCH_qemux86-64 ?= "v5.4/standard/base"
>  KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
>  
> -SRCREV_machine_qemuarm ?= "3bc1fc1cd35bd8f95e80fb49627c2f6977debc84"
> -SRCREV_machine_qemuarm64 ?= "c048122124fdbd78d02ac64ef6558503e7536f7b"
> -SRCREV_machine_qemumips ?= "19fc003e228a56e30943ddcba0614de6365e2740"
> -SRCREV_machine_qemuppc ?= "ef263615ec81ddfac29c82c5c61f6195dde31944"
> -SRCREV_machine_qemuriscv64 ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> -SRCREV_machine_qemux86 ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> -SRCREV_machine_qemux86-64 ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> -SRCREV_machine_qemumips64 ?= "9ee7899b379b865fe676d50be29162845c9a9ee3"
> -SRCREV_machine ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
> -SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
> +SRCREV_machine_qemuarm ?= "bf4029e0d9ff2e65d654909d7e9df50dce294c77"
> +SRCREV_machine_qemuarm64 ?= "3e0dab732964f7bbc26671fee05be420fd02890a"
> +SRCREV_machine_qemumips ?= "e8bea70e0c6a527383f2351e4f3d189aedf543a3"
> +SRCREV_machine_qemuppc ?= "24cc2a066b8151925fdf86136b70b63cf37cc540"
> +SRCREV_machine_qemuriscv64 ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> +SRCREV_machine_qemux86 ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> +SRCREV_machine_qemux86-64 ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> +SRCREV_machine_qemumips64 ?= "5a5e07ef8df0e73b2f318b921f9262b49a6125d5"
> +SRCREV_machine ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
> +SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
>  
>  # remap qemuarm to qemuarma15 for the 5.4 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> -LINUX_VERSION ?= "5.4.199"
> +LINUX_VERSION ?= "5.4.203"
>  
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>  DEPENDS += "openssl-native util-linux-native"
> -- 
> 2.19.1
> 

