Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6945460079
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 16:25:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4PGOJCV016107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 09:24:50 -0700
Received: from server.local (128.224.21.71) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 May 2018 09:24:32 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1526655802.git.bruce.ashfield@windriver.com>
	<9666b5a77455fec0b63f3b92f07ce4bf2b99edb8.1526655802.git.bruce.ashfield@windriver.com>
	<CAJTo0LaocxqxQM4rgZGKMLRowokreFEZ64OFXAfx=Wu131G_rA@mail.gmail.com>
	<43bedbae-02a8-f344-73d6-e570ba4e863c@windriver.com>
	<CAJTo0LY599wczkqKZHjiSr1qVtJ=Huid07eUqoVQdUS1ynMh2g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <d29cf628-b108-3967-b891-43ac5f40f4fb@windriver.com>
Date: Fri, 25 May 2018 12:24:32 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY599wczkqKZHjiSr1qVtJ=Huid07eUqoVQdUS1ynMh2g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] linux-yocto/4.14: update to v4.14.30
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
X-List-Received-Date: Fri, 25 May 2018 16:25:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I found the upstream patch that fixes this.

How did you want the updated 4.12 SRCREVs ? A single patch,
or did you want me to send the series again.

Bruce

On 2018-05-24 6:59 PM, Burton, Ross wrote:
> Yes, it builds fine with current master.
> 
> Ross
> 
> On 23 May 2018 at 18:35, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>> On 05/23/2018 07:10 AM, Burton, Ross wrote:
>>>
>>> qemuppc is failing with this:
>>>
>>> crypto/aes_generic.o: In function `crypto_aes_expand_key':
>>> /usr/src/kernel/crypto/aes_generic.c:1273: undefined reference to
>>> `_restgpr_31_x'
>>> crypto/aes_generic.o: In function `crypto_aes_set_key':
>>> /usr/src/kernel/crypto/aes_generic.c:1300: undefined reference to
>>> `_restgpr_31_x'
>>> crypto/aes_generic.o: In function `aes_encrypt':
>>> /usr/src/kernel/crypto/aes_generic.c:1371: undefined reference to
>>> `_restgpr_15_x'
>>> crypto/aes_generic.o: In function `aes_decrypt':
>>> /usr/src/kernel/crypto/aes_generic.c:1441: undefined reference to
>>> `_restgpr_15_x'
>>> TOPDIR/tmp/work-shared/qemuppc/kernel-source/Makefile:1021: recipe for
>>> target 'vmlinux' failed
>>
>>
>> Are we sure this is building with the older 4.4 ? I just checked
>> and see now changes to that file. It smells like the compiler is now
>> triggering this. I'll still fix it, but I'm looking for data to isolate
>> where to look.
>>
>> Bruce
>>
>>>
>>> Ross
>>>
>>> On 18 May 2018 at 16:05, Bruce Ashfield <bruce.ashfield@windriver.com>
>>> wrote:
>>>>
>>>> Integrating the korg -stable releases for 4.14, which comprise the
>>>> following commits:
>>>>
>>>>      fc72a4171174 Linux 4.14.40
>>>>      27f29dbceb3c tracing: Fix bad use of igrab in trace_uprobe.c
>>>>      d86aaca9cea2 irqchip/qcom: Fix check for spurious interrupts
>>>>      bd2088d1d77a platform/x86: asus-wireless: Fix NULL pointer
>>>> dereference
>>>>      87fa7da673b4 usb: musb: trace: fix NULL pointer dereference in
>>>> musb_g_tx()
>>>>      303e99bde8dc usb: musb: host: fix potential NULL pointer dereference
>>>>      ec6de93fab50 USB: serial: option: adding support for ublox R410M
>>>>      3f0c247910d0 USB: serial: option: reimplement interface masking
>>>>      0e548f5abae9 USB: Accept bulk endpoints with 1024-byte maxpacket
>>>>      425a02545d5e usb: dwc3: gadget: Fix list_del corruption in
>>>> dwc3_ep_dequeue
>>>>      0cc49bb627ad USB: serial: visor: handle potential invalid device
>>>> configuration
>>>>      0799a0ea96e4 errseq: Always report a writeback error once
>>>>      b4f6e858433e test_firmware: fix setting old custom fw path back on
>>>> exit, second try
>>>>      43b3ba6ece54 drm/bridge: vga-dac: Fix edid memory leak
>>>>      df9703e7e72a drm/vmwgfx: Fix a buffer object leak
>>>>      758f3340b803 iw_cxgb4: Atomically flush per QP HW CQEs
>>>>      d7683a5c8c94 IB/hfi1: Fix NULL pointer dereference when invalid
>>>> num_vls is used
>>>>      79181a45aa9a IB/hfi1: Fix loss of BECN with AHG
>>>>      7f185bc79bb9 IB/hfi1: Fix handling of FECN marked multicast packet
>>>>      b5ebbbc72671 IB/mlx5: Use unlimited rate when static rate is not
>>>> supported
>>>>      a27293f2f6e1 NET: usb: qmi_wwan: add support for ublox R410M PID
>>>> 0x90b2
>>>>      14ad51557092 RDMA/mlx5: Protect from shift operand overflow
>>>>      be855252ebce RDMA/mlx5: Fix multiple NULL-ptr deref errors in
>>>> rereg_mr flow
>>>>      3ae1bf368135 RDMA/ucma: Allow resolving address w/o specifying source
>>>> address
>>>>      38a65e753503 RDMA/cxgb4: release hw resources on device removal
>>>>      bd9ca962eeb0 xfs: prevent creating negative-sized file via
>>>> INSERT_RANGE
>>>>      b68c7af0b2e7 rtlwifi: cleanup 8723be ant_sel definition
>>>>      fcd835be6c17 rtlwifi: btcoex: Add power_on_setting routine
>>>>      10579ed39e20 Input: atmel_mxt_ts - add touchpad button mapping for
>>>> Samsung Chromebook Pro
>>>>      894937021946 Input: leds - fix out of bound access
>>>>      2c698f7b169a scsi: target: Fix fortify_panic kernel exception
>>>>      f4438b15755e tracepoint: Do not warn on ENOMEM
>>>>      bd0e2aec5686 ALSA: aloop: Add missing cable lock to ctl API callbacks
>>>>      4e3460ae33c6 ALSA: aloop: Mark paused device as inactive
>>>>      9581fff37b1a ALSA: dice: fix kernel NULL pointer dereference due to
>>>> invalid calculation for array index
>>>>      dfe7f043bcfc ALSA: seq: Fix races at MIDI encoding in
>>>> snd_virmidi_output_trigger()
>>>>      e5e9a770cec2 ALSA: pcm: Check PCM state at xfern compat ioctl
>>>>      5f6e6d063ac1 ALSA: hda - Fix incorrect usage of IS_REACHABLE()
>>>>      c1e76c30079d USB: serial: option: Add support for Quectel EP06
>>>>      c8a622ed9e53 ACPI / button: make module loadable when booted in
>>>> non-ACPI mode
>>>>      63d9df9eb7a5 crypto: talitos - fix IPsec cipher in length
>>>>      e9caf1e1d5d4 percpu: include linux/sched.h for cond_resched()
>>>>      6a3c946b205f net: don't call update_pmtu unconditionally
>>>>      3a928a262c1c geneve: update skb dst pmtu on tx path
>>>>      7d6240f0fb85 Linux 4.14.39
>>>>      7fddff51f245 powerpc/eeh: Fix race with driver un/bind
>>>>      e5a290c4ff77 arm/arm64: KVM: Add PSCI version selection API
>>>>      a2066aa76a7a tick/sched: Do not mess with an enqueued hrtimer
>>>>      922e5129eb01 x86/microcode: Do not exit early from __reload_late()
>>>>      7c6bcaac737f x86/microcode/intel: Save microcode patch
>>>> unconditionally
>>>>      b319531024d9 x86/smpboot: Don't use mwait_play_dead() on AMD systems
>>>>      ce911a5b1fea x86/ipc: Fix x32 version of shmid64_ds and msqid64_ds
>>>>      8e99c881e497 tools/lib/subcmd/pager.c: do not alias select() params
>>>>      d1f1f7771a6a objtool, perf: Fix GCC 8 -Wrestrict error
>>>>      bf1d7023c901 drm/i915: Enable display WA#1183 from its correct spot
>>>>      559121f5a165 drm/amdgpu: set COMPUTE_PGM_RSRC1 for SGPR/VGPR clearing
>>>> shaders
>>>>      79340bda01ab rtc: opal: Fix OPAL RTC driver OPAL_BUSY loops
>>>>      20b0f757da3b cpufreq: powernv: Fix hardlockup due to synchronous
>>>> smp_call in timer interrupt
>>>>      3a5465d0b61d earlycon: Use a pointer table to fix __earlycon_table
>>>> stride
>>>>      9922fd0c681f fpga-manager: altera-ps-spi: preserve nCONFIG state
>>>>      7563d6f2be58 libceph: validate con->state at the top of try_write()
>>>>      c2bc3eb5599f libceph: reschedule a tick in finish_hunting()
>>>>      76f7b52b5bf0 libceph: un-backoff on tick when we have a authenticated
>>>> session
>>>>      b02bbcce8ea3 ASoC: fsl_esai: Fix divisor calculation failure at lower
>>>> ratio
>>>>      674d38ea1850 crypto: drbg - set freed buffers to NULL
>>>>      a32a944a60c8 powerpc/powernv/npu: Do a PID GPU TLB flush when
>>>> invalidating a large address range
>>>>      f2acc8dc0644 powerpc/mm: Flush cache on memory hot(un)plug
>>>>      5a5ea3401799 KVM: arm/arm64: Close VMID generation race
>>>>      0ddb53a67cbd ARM: socfpga_defconfig: Remove QSPI Sector 4K size force
>>>>      f671ee8de31a ARM: amba: Don't read past the end of sysfs
>>>> "driver_override" buffer
>>>>      23abff7b984f ARM: amba: Fix race condition with driver_override
>>>>      bcd73c772ec1 ARM: amba: Make driver_override output consistent with
>>>> other buses
>>>>      1a6e0a900bce PCI: aardvark: Fix PCIe Max Read Request Size setting
>>>>      6b3751e249ff PCI: aardvark: Use ISR1 instead of ISR0 interrupt in
>>>> legacy irq mode
>>>>      f0ae21a86eb5 PCI: aardvark: Set PIO_ADDR_LS correctly in
>>>> advk_pcie_rd_conf()
>>>>      e90b89088a10 PCI: aardvark: Fix logic in advk_pcie_{rd,wr}_conf()
>>>>      fd0485e2cc7b ANDROID: binder: prevent transactions into own process.
>>>>      bddabeb71f3f vfio: ccw: process ssch with interrupts disabled
>>>>      be10336a9072 bfq-iosched: ensure to clear bic/bfqq pointers when
>>>> preparing request
>>>>      b23b4174275d scsi: sd: Defer spinning up drive while SANITIZE is in
>>>> progress
>>>>      a5f4276787d6 kobject: don't use WARN for registration failures
>>>>      6840b774dc4d mtd: rawnand: tango: Fix struct clk memory leak
>>>>      f69cd2d30a80 mtd: cfi: cmdset_0002: Do not allow read/write to
>>>> suspend erase block.
>>>>      204e0761846b mtd: cfi: cmdset_0001: Workaround Micron Erase suspend
>>>> bug.
>>>>      1de1ad0c2c42 mtd: cfi: cmdset_0001: Do not allow read/write to
>>>> suspend erase block.
>>>>      6c677c5968aa mtd: spi-nor: cadence-quadspi: Fix page fault kernel
>>>> panic
>>>>      3d4612bf62c8 ALSA: hda/realtek - change the location for one of two
>>>> front mics
>>>>      53c4197a2d7e ALSA: hda/realtek - Update ALC255 depop optimize
>>>>      c9df23efe5cc ALSA: hda/realtek - Add some fixes for ALC233
>>>>      d680a34d82b6 ALSA: hda: Hardening for potential Spectre v1
>>>>      bda3aba8c0a1 ALSA: seq: oss: Hardening for potential Spectre v1
>>>>      4a52a2127240 ALSA: seq: oss: Fix unbalanced use lock for synth MIDI
>>>> device
>>>>      30ddc329d562 ALSA: core: Report audio_tstamp in snd_pcm_sync_ptr
>>>>      00e0495d8327 ALSA: pcm: Return negative delays from
>>>> SNDRV_PCM_IOCTL_DELAY.
>>>>      6ab1a94d17db ALSA: control: Hardening for potential Spectre v1
>>>>      9d57d45965dd ALSA: rme9652: Hardening for potential Spectre v1
>>>>      f8616ffbb78d ALSA: hdspm: Hardening for potential Spectre v1
>>>>      8f1705268fd2 ALSA: asihpi: Hardening for potential Spectre v1
>>>>      b67a05364e5d ALSA: opl3: Hardening for potential Spectre v1
>>>>      19baecfc1105 ALSA: hda - Skip jack and others for non-existing PCM
>>>> streams
>>>>      d03fbe62e173 ALSA: dice: fix error path to destroy initialized stream
>>>> data
>>>>      ba9c9886a40d ALSA: dice: fix OUI for TC group
>>>>      545906124041 tty: Use __GFP_NOFAIL for tty_ldisc_get()
>>>>      877f418171af tty: Avoid possible error pointer dereference at
>>>> tty_ldisc_restore().
>>>>      6a50af86a62b tty: n_gsm: Fix DLCI handling for ADM mode if debug & 2
>>>> is not set
>>>>      6ba9a47d1fc5 tty: n_gsm: Fix long delays with control frame timeouts
>>>> in ADM mode
>>>>      4854b9665c81 tty: Don't call panic() at tty_ldisc_init()
>>>>      c0ed8ece4ef3 drm/virtio: fix vq wait_event condition
>>>>      998d43ce034b virtio_console: reset on out of memory
>>>>      e9287108acce virtio_console: move removal code
>>>>      75fc6f2d39bf virtio_console: drop custom control queue cleanup
>>>>      6b1c41a0f718 virtio_console: free buffers after reset
>>>>      4217a339b37d virtio_console: don't tie bufs to a vq
>>>>      7ae93ff136a0 virtio: add ability to iterate over vqs
>>>>      cf7405f67543 ALSA: usb-audio: Skip broken EU on Dell dock USB-audio
>>>>      e6d2055ba32f USB: Increment wakeup count on remote wakeup.
>>>>      c59dc4d13519 usb: core: Add quirk for HP v222w 16GB Mini
>>>>      333909311d70 usb: typec: ucsi: Increase command completion timeout
>>>> value
>>>>      f310eb70657e USB: serial: cp210x: add ID for NI USB serial console
>>>>      747120e77100 USB: serial: ftdi_sio: use jtag quirk for Arrow USB
>>>> Blaster
>>>>      8f30aa32b716 USB: serial: simple: add libtransistor console
>>>>      0b932b1ca9da xhci: Fix USB ports for Dell Inspiron 5775
>>>>      64abd2428e54 Revert "xhci: plat: Register shutdown for xhci_plat"
>>>>      b792b1f7d01c usbip: vhci_hcd: check rhport before using in
>>>> vhci_hub_control()
>>>>      4abe5b775a16 usbip: vhci_hcd: Fix usb device and sockfd leaks
>>>>      944edaf13dee usbip: usbip_host: fix to hold parent lock for
>>>> device_attach() calls
>>>>      470bf16ae1ab usbip: usbip_event: fix to not print kernel pointer
>>>> address
>>>>      76dbabb38a18 random: rate limit unseeded randomness warnings
>>>>      ffc5b50a2b53 random: fix possible sleeping allocation from irq
>>>> context
>>>>      812b51a63000 random: set up the NUMA crng instances after the CRNG is
>>>> fully initialized
>>>>      ae0db58dabe5 ext4: fix bitmap position validation
>>>>      b39430ea0687 ext4: add validity checks for bitmap block numbers
>>>>      55cc3bb0a6c7 ext4: add MODULE_SOFTDEP to ensure crc32c is included in
>>>> the initramfs
>>>>      4a3674acbf8b ext4: set h_journal if there is a failure starting a
>>>> reserved handle
>>>>      1a538cb0879d ext4: prevent right-shifting extents beyond
>>>> EXT_MAX_BLOCKS
>>>>      a87463f7420c Linux 4.14.38
>>>>      3e4915873cff ACPI / video: Only default only_lcd to true on
>>>> Win8-ready _desktops_
>>>>      c371fe019001 s390/uprobes: implement arch_uretprobe_is_alive()
>>>>      5dad51054d8a s390/dasd: fix IO error for newly defined devices
>>>>      3b5c2e1d163a s390/cio: update chpid descriptor after resource
>>>> accessibility event
>>>>      a75bf6f71744 tracing: Fix missing tab for hwlat_detector print format
>>>>      d82923c017de block/swim: Fix IO error at end of medium
>>>>      06dc2e919593 block/swim: Fix array bounds check
>>>>      8c37ac3c04e7 block/swim: Select appropriate drive on device open
>>>>      cdb0d5fa2528 block/swim: Rename macros to avoid inconsistent inverted
>>>> logic
>>>>      f359e87feb88 block/swim: Remove extra put_disk() call from error path
>>>>      b7100feb26d2 block/swim: Don't log an error message for an invalid
>>>> ioctl
>>>>      0dd9146a2291 block/swim: Check drive type
>>>>      43f8a4f2c8b2 m68k/mac: Don't remap SWIM MMIO region
>>>>      75b98294e09a fsnotify: Fix fsnotify_mark_connector race
>>>>      68c09d548bfc cdrom: information leak in cdrom_ioctl_media_changed()
>>>>      f4df47e36ac0 scsi: mptsas: Disable WRITE SAME
>>>>      77df079be9b4 commoncap: Handle memory allocation failure.
>>>>      540e7b5be492 Revert "mm/hmm: fix header file if/else/endif maze"
>>>>      a252b9732243 arm64: dts: rockchip: remove vdd_log from rk3399-puma
>>>>      fcc347bc1e34 microblaze: Setup dependencies for ASM optimized lib
>>>> functions
>>>>      5787b55b5019 s390: correct module section names for expoline code
>>>> revert
>>>>      f836b34fb056 s390: correct nospec auto detection init order
>>>>      fce1bf054f0b s390: add sysfs attributes for spectre
>>>>      68cb884e1228 s390: report spectre mitigation via syslog
>>>>      719b84c9aec2 s390: add automatic detection of the spectre defense
>>>>      ea1bbd53f055 s390: move nobp parameter functions to nospec-branch.c
>>>>      6cdc4b21d219 s390/entry.S: fix spurious zeroing of r0
>>>>      74a93ae5c328 s390: do not bypass BPENTER for interrupt system calls
>>>>      6288e169a25e s390: Replace IS_ENABLED(EXPOLINE_*) with
>>>> IS_ENABLED(CONFIG_EXPOLINE_*)
>>>>      1d966a6aded3 KVM: s390: force bp isolation for VSIE
>>>>      b609eb65f315 s390: introduce execute-trampolines for branches
>>>>      0bd4c47c2026 s390: run user space and KVM guests with modified branch
>>>> prediction
>>>>      43cccd87c184 s390: add options to change branch prediction behaviour
>>>> for the kernel
>>>>      c257f81b6d45 s390/alternative: use a copy of the facility bit mask
>>>>      2ae89b86a77f s390: add optimized array_index_mask_nospec
>>>>      2ae8b68382ce s390: scrub registers on kernel entry and KVM exit
>>>>      ea5566fecd03 KVM: s390: wire up bpb feature
>>>>      37e79747128b s390: enable CPU alternatives unconditionally
>>>>      b44533a06fd8 s390: introduce CPU alternatives
>>>>      55c80adf0d0e virtio_net: fix adding vids on big-endian
>>>>      d86aacaaf9d2 virtio_net: split out ctrl buffer
>>>>      16c36a2c7632 net: ethernet: ti: cpsw: fix tx vlan priority mapping
>>>>      7814c479de7a llc: fix NULL pointer deref for SOCK_ZAPPED
>>>>      543a60112f01 llc: hold llc_sap before release_sock()
>>>>      4c2c574cf6ed net: sched: ife: check on metadata length
>>>>      388f3d9708fc net: sched: ife: handle malformed tlv length
>>>>      75020d6319ee tcp: clear tp->packets_out when purging write queue
>>>>      da499024f6fe net: sched: ife: signal not finding metaid
>>>>      2f781ebfb08f strparser: Fix incorrect strp->need_bytes value.
>>>>      109feb04c851 amd-xgbe: Only use the SFP supported transceiver signals
>>>>      9a66123182a6 strparser: Do not call mod_delayed_work with a timeout
>>>> of LONG_MAX
>>>>      346ba2f22107 amd-xgbe: Improve KR auto-negotiation and training
>>>>      29b623b60549 sctp: do not check port in sctp_inet6_cmp_addr
>>>>      f42036e8051e amd-xgbe: Add pre/post auto-negotiation phy hooks
>>>>      dd997151740f vlan: Fix reading memory beyond skb->tail in
>>>> skb_vlan_tagged_multi
>>>>      88b7895e7c6d pppoe: check sockaddr length in pppoe_connect()
>>>>      ed2ba25f6d50 tipc: add policy for TIPC_NLA_NET_ADDR
>>>>      6da813d79cfa packet: fix bitfield update race
>>>>      70a615d7daa0 team: fix netconsole setup over team
>>>>      07cb0b54d7d9 net/smc: fix shutdown in state SMC_LISTEN
>>>>      7b4f4d759c8e team: avoid adding twice the same option to the event
>>>> list
>>>>      012e5e5b6991 net: fix deadlock while clearing neighbor proxy table
>>>>      d5387e66388f tcp: md5: reject TCP_MD5SIG or TCP_MD5SIG_EXT on
>>>> established sockets
>>>>      7c2352520e51 net: af_packet: fix race in PACKET_{R|T}X_RING
>>>>      b76d3f3309cf tcp: don't read out-of-bounds opsize
>>>>      cb225e80c9a3 llc: delete timers synchronously in llc_sk_free()
>>>>      15efa783286c net: validate attribute sizes in neigh_dump_table()
>>>>      dbf57fd1e05e l2tp: check sockaddr length in pppol2tp_connect()
>>>>      c7a936b1dd0f KEYS: DNS: limit the length of option strings
>>>>      a370d8a3aaf2 ipv6: sr: fix NULL pointer dereference in
>>>> seg6_do_srh_encap()- v4 pkts
>>>>      8d34c6773459 ipv6: add RTA_TABLE and RTA_PREFSRC to rtm_ipv6_policy
>>>>      e0286ea0846c bonding: do not set slave_dev npinfo before
>>>> slave_enable_netpoll in bond_enslave
>>>>      5f50186dd810 Revert "ath10k: send (re)assoc peer command when NSS
>>>> changed"
>>>>      781eeb7af2bd tpm: add retry logic
>>>>      f6891ec29c59 tpm: tpm-interface: fix tpm_transmit/_cmd kdoc
>>>>      ac5881b7814d tpm: cmd_ready command can be issued only after granting
>>>> locality
>>>>      3b38734ed9fe i40e: Fix attach VF to VM issue
>>>>      00c54b354411 drm: bridge: dw-hdmi: Fix overflow workaround for
>>>> Amlogic Meson GX SoCs
>>>>      94c0308279ec Revert "pinctrl: intel: Initialize GPIO properly when
>>>> used through irqchip"
>>>>      753be7e83bb8 Linux 4.14.37
>>>>      f606893fbbc6 mac80211_hwsim: fix use-after-free bug in hwsim_exit_net
>>>>      679833ea1822 Revert "KVM: X86: Fix SMRAM accessing even if VM is
>>>> shutdown"
>>>>      75dceb6872b3 RDMA/mlx5: Fix NULL dereference while accessing XRC_TGT
>>>> QPs
>>>>      01e71c218219 perf: Return proper values for user stack errors
>>>>      66038084560d perf: Fix sample_max_stack maximum check
>>>>      5bcf16944454 netfilter: x_tables: limit allocation requests for blob
>>>> rule heads
>>>>      764f2162d97a netfilter: compat: reject huge allocation requests
>>>>      8d92d5336539 netfilter: compat: prepare xt_compat_init_offsets to
>>>> return errors
>>>>      82b68ecde5d0 netfilter: x_tables: add counters allocation wrapper
>>>>      fab0b3ce67a5 netfilter: x_tables: cap allocations at 512 mbyte
>>>>      89f3232c394e alarmtimer: Init nanosleep alarm timer on stack
>>>>      76cd54fa70ce RDMA/core: Reduce poll batch for direct cq polling
>>>>      de16dfcc510d irqchip/gic-v3: Change pr_debug message to pr_devel
>>>>      4032cd4fd3ae cpumask: Make for_each_cpu_wrap() available on UP as
>>>> well
>>>>      c834b955d3f0 irqchip/gic-v3: Ignore disabled ITS nodes
>>>>      2d8d8d23c485 perf test: Fix test trace+probe_libc_inet_pton.sh for
>>>> s390x
>>>>      74cd9414788c powerpc/powernv: IMC fix out of bounds memory access at
>>>> shutdown
>>>>      c74e004c6273 locking/qspinlock: Ensure node->count is updated before
>>>> initialising node
>>>>      5350cb0111d2 x86/platform/UV: Fix GAM Range Table entries less than
>>>> 1GB
>>>>      288b373264c5 powerpc/mm/hash64: Zero PGD pages on allocation
>>>>      f4d6e4598a29 vfs/proc/kcore, x86/mm/kcore: Fix SMAP fault when
>>>> dumping vsyscall user page
>>>>      c064b7c1d203 PM / wakeirq: Fix unbalanced IRQ enable for wakeirq
>>>>      afa0ce071488 ACPI / EC: Restore polling during noirq suspend/resume
>>>> phases
>>>>      85bd5c686fe9 bpf: fix rlimit in reuseport net selftest
>>>>      ee5fe4bdcf2a net: stmmac: discard disabled flags in interrupt status
>>>> register
>>>>      26bebd5a7865 SUNRPC: Don't call __UDPX_INC_STATS() from a preemptible
>>>> context
>>>>      f58e4ecb9b2e KVM: PPC: Book3S HV: Fix handling of secondary HPTEG in
>>>> HPT resizing code
>>>>      d6b00490a04d tools/libbpf: handle issues with bpf ELF objects
>>>> containing .eh_frames
>>>>      327aac8ccbc5 net: Extra '_get' in declaration of
>>>> arch_get_platform_mac_address
>>>>      0b1fa241dd86 svcrdma: Fix Read chunk round-up
>>>>      e781fff7b78f rxrpc: Don't put crypto buffers on the stack
>>>>      c5ce9e5b57cc selftests/ftrace: Add some missing glob checks
>>>>      ae9c78af577f cpufreq: intel_pstate: Enable HWP during system resume
>>>> on CPU0
>>>>      c4c9fd55899f bcache: return attach error when no cache set exist
>>>>      4c8e0270dc7a bcache: fix for data collapse after re-attaching an
>>>> attached device
>>>>      311e31419b72 bcache: fix for allocator and register thread race
>>>>      f89edd17aff4 bcache: properly set task state in
>>>> bch_writeback_thread()
>>>>      05921c492fdb cifs: silence compiler warnings showing up with
>>>> gcc-8.0.0
>>>>      4b95781cb6f3 PM / domains: Fix up domain-idle-states OF parsing
>>>>      05e52e5bd103 proc: fix /proc/*/map_files lookup
>>>>      4ec317a41d80 arm64: spinlock: Fix theoretical trylock() A-B-A with
>>>> LSE atomics
>>>>      693b9589c297 RDS: IB: Fix null pointer issue
>>>>      a8e7a4e24374 bpf: sockmap, fix leaking maps with attached but not
>>>> detached progs
>>>>      05c062c3685e xen/grant-table: Use put_page instead of free_page
>>>>      70f3461c23ff xen-netfront: Fix race between device setup and open
>>>>      2f79b5e52d46 perf evsel: Fix period/freq terms setup
>>>>      b1f9f9fb3f99 MIPS: Generic: Support GIC in EIC mode
>>>>      76e3ea2f9563 perf record: Fix period option handling
>>>>      f938c2acc829 MIPS: TXx9: use IS_BUILTIN() for CONFIG_LEDS_CLASS
>>>>      3e01c16d8751 bpf: fix selftests/bpf test_kmod.sh failure when
>>>> CONFIG_BPF_JIT_ALWAYS_ON=y
>>>>      74abca65f1e4 ACPI / scan: Use acpi_bus_get_status() to initialize
>>>> ACPI_TYPE_DEVICE devs
>>>>      f920e914801c ACPI / bus: Do not call _STA on battery devices with
>>>> unmet dependencies
>>>>      51939996acde ACPI: processor_perflib: Do not send _PPC change
>>>> notification if not ready
>>>>      573cb560b4ed firmware: dmi_scan: Fix handling of empty DMI strings
>>>>      ee06ed9ba518 x86/dumpstack: Avoid uninitlized variable
>>>>      423505471f5e x86/power: Fix swsusp_arch_resume prototype
>>>>      074372c8124c netfilter: ipv6: nf_defrag: Kill frag queue on RFC2460
>>>> failure
>>>>      2cd5100363b7 s390/eadm: fix CONFIG_BLOCK include dependency
>>>>      eb41efa13865 drm/nouveau/pmu/fuc: don't use movw directly anymore
>>>>      fd370b8e65e3 IB/core: Map iWarp AH type to undefined in
>>>> rdma_ah_find_type
>>>>      f63bb02694f0 IB/ipoib: Fix for potential no-carrier state
>>>>      8f96d408a954 IB/hfi1: Fix for potential refcount leak in
>>>> hfi1_open_file()
>>>>      5ceae7690f0d IB/hfi1: Re-order IRQ cleanup to address driver cleanup
>>>> race
>>>>      73027d80d67e blk-mq: fix discard merge with scheduler attached
>>>>      6eddea4ba5cc openvswitch: Remove padding from packet before L3+
>>>> conntrack processing
>>>>      3b1d9626fc58 mm/fadvise: discard partial page if endbyte is also EOF
>>>>      1f9c87e25158 mm: pin address_space before dereferencing it while
>>>> isolating an LRU page
>>>>      8054b87fccd4 mm: thp: use down_read_trylock() in khugepaged to avoid
>>>> long block
>>>>      6acb8818eff4 sparc64: update pmdp_invalidate() to return old pmd
>>>> value
>>>>      78185a93d42d asm-generic: provide generic_pmdp_establish()
>>>>      305e56756da7 mm/mempolicy: add nodes_empty check in
>>>> SYSC_migrate_pages
>>>>      6cab60ac6a0a mm/mempolicy: fix the check of nodemask from user
>>>>      a7fbc7f3134a ocfs2: return error when we attempt to access a dirty bh
>>>> in jbd2
>>>>      a66174eb4a14 ocfs2/acl: use 'ip_xattr_sem' to protect getting
>>>> extended attribute
>>>>      66aaeed2796e ocfs2: return -EROFS to mount.ocfs2 if inode block is
>>>> invalid
>>>>      710b5124aac6 fs/dax.c: release PMD lock even when there is no PMD
>>>> support in DAX
>>>>      cc0600dae30f x86/kvm/vmx: do not use vm-exit instruction length for
>>>> fast MMIO when running nested
>>>>      d757c3a9cf4a kvm: Map PFN-type memory regions as writable (if
>>>> possible)
>>>>      a6a25002e6d8 tcp_nv: fix potential integer overflow in tcpnv_acked
>>>>      ad10785a706e netfilter: x_tables: fix pointer leaks to userspace
>>>>      2b7cc93682ac x86/hyperv: Check for required priviliges in
>>>> hyperv_init()
>>>>      cdf635a66c5b gianfar: prevent integer wrapping in the rx handler
>>>>      67fa8bfff771 ntb_transport: Fix bug with max_mw_size parameter
>>>>      d810c548157f RDMA/mlx5: Avoid memory leak in case of XRCD dealloc
>>>> failure
>>>>      0bddd43ac200 powerpc/numa: Ensure nodes initialized for hotplug
>>>>      0caebc381032 powerpc/numa: Use ibm,max-associativity-domains to
>>>> discover possible nodes
>>>>      b086dd2d79d9 samples/bpf: Partially fixes the bpf.o build
>>>>      64e5e46cdd8b i40e: fix reported mask for ntuple filters
>>>>      1ec85fe4e259 i40e: program fragmented IPv4 filter input set
>>>>      7addb3e4ad3d ixgbe: don't set RXDCTL.RLPML for 82599
>>>>      27eb641f2368 jffs2: Fix use-after-free bug in jffs2_iget()'s error
>>>> handling path
>>>>      19b3638ce460 RDMA/uverbs: Use an unambiguous errno for method not
>>>> supported
>>>>      827aab45cb16 crypto: artpec6 - remove select on non-existing
>>>> CRYPTO_SHA384
>>>>      592ea370bf1c device property: Define type of PROPERTY_ENRTY_*()
>>>> macros
>>>>      c5fda2b8610b tty: serial: exar: Relocate sleep wake-up handling
>>>>      519a7119527c x86/hyperv: Stop suppressing X86_FEATURE_PCID
>>>>      9a1dda252663 fm10k: fix "failed to kill vid" message for VF
>>>>      0e7a0c139cbf igb: Clear TXSTMP when ptp_tx_work() is timeout
>>>>      187bf28199d8 igb: Allow to remove administratively set MAC on VFs
>>>>      048af64fd48f ASoC: rockchip: Use dummy_dai for rt5514 dsp dailink
>>>>      f25ba4f6be4a blk-mq-debugfs: don't allow write on attributes with
>>>> seq_operations set
>>>>      a42ebbdae0a5 KVM: s390: vsie: use READ_ONCE to access some SCB fields
>>>>      48d441324a58 platform/x86: thinkpad_acpi: suppress warning about palm
>>>> detection
>>>>      b9d78055c6ae i40evf: ignore link up if not running
>>>>      09f6d65db13b i40evf: Don't schedule reset_task when device is being
>>>> removed
>>>>      7c7ae4ed2fcd bpf: test_maps: cleanup sockmaps when test ends
>>>>      c6c6e38aeff2 block: Set BIO_TRACE_COMPLETION on new bio during split
>>>>      f2e73df302f3 nfp: fix error return code in nfp_pci_probe()
>>>>      8591958413bf HID: roccat: prevent an out of bounds read in
>>>> kovaplus_profile_activated()
>>>>      6a5505da41fa Input: stmfts - set IRQ_NOAUTOEN to the irq flag
>>>>      8afed2798e50 scsi: fas216: fix sense buffer initialization
>>>>      800fda575b11 scsi: devinfo: fix format of the device list
>>>>      a09881cfb713 f2fs: avoid hungtask when GC encrypted block if io_bits
>>>> is set
>>>>      889177d172d3 RDMA/cma: Check existence of netdevice during port
>>>> validation
>>>>      48b8839d91a4 Btrfs: raid56: fix race between merge_bio and
>>>> rbio_orig_end_io
>>>>      ebe064401f07 Btrfs: fix unexpected EEXIST from btrfs_get_extent
>>>>      c231cec825a9 btrfs: fail mount when sb flag is not in
>>>> BTRFS_SUPER_FLAG_SUPP
>>>>      d91bb7c6988b Btrfs: fix scrub to repair raid6 corruption
>>>>      db6d651eccde btrfs: Fix out of bounds access in btrfs_search_slot
>>>>      a4909c8518f7 Btrfs: set plug for fsync
>>>>      fb5d97a19fc3 ipmi/powernv: Fix error return code in
>>>> ipmi_powernv_probe()
>>>>      afadc440a1cc mac80211_hwsim: fix possible memory leak in
>>>> hwsim_new_radio_nl()
>>>>      18004e6f26ec kconfig: Fix expr_free() E_NOT leak
>>>>      0f511f3dda8c kconfig: Fix automatic menu creation mem leak
>>>>      8bf116b258c2 kconfig: Don't leak main menus during parsing
>>>>      9f2df99f9eb0 watchdog: sp5100_tco: Fix watchdog disable bit
>>>>      ebf5ffca1bf2 PCI: Add dummy pci_irqd_intx_xlate() for CONFIG_PCI=n
>>>> build
>>>>      c212c855a09d MIPS: Fix clean of vmlinuz.{32,ecoff,bin,srec}
>>>>      81fbb7e26ea1 nfs: Do not convert nfs_idmap_cache_timeout to jiffies
>>>>      35ceddc59cd4 IB/cq: Don't force IB_POLL_DIRECT poll context for
>>>> ib_process_cq_direct
>>>>      58bc0fd8434d spi: a3700: Clear DATA_OUT when performing a read
>>>>      5bb5b9c68192 net: stmmac: dwmac-meson8b: propagate rate changes to
>>>> the parent clock
>>>>      5bfa11c96192 net: stmmac: dwmac-meson8b: fix setting the RGMII TX
>>>> clock on Meson8b
>>>>      2a71a742f09b ubifs: Fix uninitialized variable in search_dh_cookie()
>>>>      a1dfcb01e374 blk-mq: turn WARN_ON in __blk_mq_run_hw_queue into
>>>> printk
>>>>      2e102fe86ede dm mpath: return DM_MAPIO_REQUEUE on blk-mq rq
>>>> allocation failure
>>>>      223ed638e937 dm thin: fix documentation relative to low water mark
>>>> threshold
>>>>      e9c8a5fa078c iommu/vt-d: Use domain instead of cache fetching
>>>>      6ec6bd8ec2e3 powerpc: System reset avoid interleaving oops using die
>>>> synchronisation
>>>>      bc5fddf315f8 iommu/exynos: Don't unconditionally steal bus ops
>>>>      77d17d0e8934 perf record: Fix failed memory allocation for
>>>> get_cpuid_str
>>>>      1fe5e88c389a tools lib traceevent: Fix get_field_str() for dynamic
>>>> strings
>>>>      4e63115b6b9d perf callchain: Fix attr.sample_max_stack setting
>>>>      448bcd67b4c5 tools lib traceevent: Simplify pointer print logic and
>>>> fix %pF
>>>>      0eda4d03ef4c perf unwind: Do not look just at the global
>>>> callchain_param.record_mode
>>>>      f3a7d11834f3 scsi: qla2xxx: Fix warning in
>>>> qla2x00_async_iocb_timeout()
>>>>      f3ce194cae63 i40iw: Zero-out consumer key on allocate stag for FMR
>>>>      b3b2ca24d9f7 i40iw: Free IEQ resources
>>>>      0d5ef8956c84 Input: synaptics - reset the ABS_X/Y fuzz after
>>>> initializing MT axes
>>>>      0d9a46ae3204 libbpf: Makefile set specified permission mode
>>>>      d925c3087422 Input: psmouse - fix Synaptics detection when protocol
>>>> is disabled
>>>>      03fdc4ef7a67 PCI: Add function 1 DMA alias quirk for Marvell 9128
>>>>      c45ab4fb384c selftest: ftrace: Fix to pick text symbols for kprobes
>>>>      342d9092a501 xprtrdma: Fix backchannel allocation of extra
>>>> rpcrdma_reps
>>>>      79f2ced39657 platform/x86: dell-laptop: Filter out spurious keyboard
>>>> backlight change events
>>>>      80bd91ab9ad8 KVM: s390: use created_vcpus in more places
>>>>      a5a8ca753c0c tracing/hrtimer: Fix tracing bugs by taking all clock
>>>> bases and modes into account
>>>>      e0a1cec3db0a netfilter: ipv6: nf_defrag: Pass on packets to stack per
>>>> RFC2460
>>>>      ddf09f2a0896 KVM: PPC: Book3S HV: Enable migration of decrementer
>>>> register
>>>>      b7b27e19e374 RDMA/core: Clarify rdma_ah_find_type
>>>>      8e40eae185f8 kvm: x86: fix KVM_XEN_HVM_CONFIG ioctl
>>>>      3f3017fa1540 ASoC: au1x: Fix timeout tests in au1xac97c_ac97_read()
>>>>      d3222cfc0b58 ALSA: hda - Use IS_REACHABLE() for dependency on input
>>>>      4e7284b34c78 ACPI / LPSS: Do not instiate platform_dev for devs
>>>> without MMIO resources
>>>>      7a420b5d95a5 NFSv4: always set NFS_LOCK_LOST when a lock is lost.
>>>>      239c948e3266 x86/tsc: Allow TSC calibration without PIT
>>>>      4a5d70332d57 firewire-ohci: work around oversized DMA reads on
>>>> JMicron controllers
>>>>      1f52b0c64215 usb: musb: Fix external abort in musb_remove on omap2430
>>>>      de4c4914cce2 usb: musb: call pm_runtime_{get,put}_sync before reading
>>>> vbus registers
>>>>      43de32cdf0f4 usb: musb: fix enumeration after resume
>>>>      829239740c12 drm/i915/bxt, glk: Increase PCODE timeouts during CDCLK
>>>> freq changing
>>>>      5c825627d4e5 drm/i915: Fix LSPCON TMDS output buffer enabling from
>>>> low-power state
>>>>      6312eff3c70e drm/i915: Do no use kfree() to free a kmem_cache_alloc()
>>>> return value
>>>>      8e0489cf4d09 drm/i915/audio: Fix audio detection issue on GLK
>>>>      c53f225fd792 drm/i915/gvt: throw error on unhandled vfio ioctls
>>>>      325abf3db041 drm/vc4: Fix memory leak during BO teardown
>>>>      08641a24d4e7 x86/tsc: Prevent 32bit truncation in calc_hpet_ref()
>>>>      c6aaaaa4d62a clocksource/imx-tpm: Correct -ETIME return condition
>>>> check
>>>>      b8d4055372b5 x86/acpi: Prevent X2APIC id 0xffffffff from being
>>>> accounted
>>>>      f6edc45e21c3 btrfs: fix unaligned access in readdir
>>>>      240a52868485 cifs: do not allow creating sockets except with SMB1
>>>> posix exensions
>>>>      d6949f48093c Linux 4.14.36
>>>>      7c9b87a78a17 writeback: safer lock nesting
>>>>      071ff203d962 media: staging: lirc_zilog: incorrect reference counting
>>>>      e7a08ffb2d89 Revert "media: lirc_zilog: driver only sends LIRCCODE"
>>>>      8caa4c5fde76 iwlwifi: add a bunch of new 9000 PCI IDs
>>>>      0c61952c3d19 iwlwifi: add shared clock PHY config flag for some
>>>> devices
>>>>      30593709f80d net: dsa: Discard frames from unused ports
>>>>      90a32d1f0ec9 mm/filemap.c: fix NULL pointer in
>>>> page_cache_tree_insert()
>>>>      5e7575c6690a autofs: mount point create should honour passed in mode
>>>>      d4d49cb1c20a Don't leak MNT_INTERNAL away from internal mounts
>>>>      085125572a45 rpc_pipefs: fix double-dput()
>>>>      0bb4a6f2ff1a orangefs_kill_sb(): deal with allocation failures
>>>>      bb5def77d0a1 hypfs_kill_super(): deal with failed allocations
>>>>      c780ac96e120 jffs2_kill_sb(): deal with failed allocations
>>>>      22ec5ee71086 drm/i915: Correctly handle limited range YCbCr data on
>>>> VLV/CHV
>>>>      4bddb1209a6d mmc: sdhci-pci: Only do AMD tuning for HS200
>>>>      28f46dee49d3 fanotify: fix logic of events on child
>>>>      a2a9d0190f99 udf: Fix leak of UTF-16 surrogates into encoded strings
>>>>      f86815184c47 powerpc/lib: Fix off-by-one in alternate feature
>>>> patching
>>>>      ce3b0b0589a8 powerpc/xive: Fix trying to "push" an already active
>>>> pool VP
>>>>      49a52f7d9274 powerpc/eeh: Fix enabling bridge MMIO windows
>>>>      a5f6e787b9b0 MIPS: memset.S: Fix clobber of v1 in last_fixup
>>>>      6da34ca1ca3e MIPS: memset.S: Fix return of __clear_user from
>>>> Lpartial_fixup
>>>>      7b34760dc682 MIPS: memset.S: EVA & fault support for small_memset
>>>>      23f5562852b9 MIPS: uaccess: Add micromips clobbers to bzero
>>>> invocation
>>>>      1da964d421da HID: wacom: bluetooth: send exit report for recent
>>>> Bluetooth devices
>>>>      0e159a9e1823 HID: hidraw: Fix crash on HIDIOCGFEATURE with a
>>>> destroyed device
>>>>      27840bc4ebb2 HID: input: fix battery level reporting on BT mice
>>>>      90936d903c2f random: add new ioctl RNDRESEEDCRNG
>>>>      d152fcc17314 random: crng_reseed() should lock the crng instance that
>>>> it is modifying
>>>>      7b6b1f3a1923 random: use a different mixing algorithm for
>>>> add_device_randomness()
>>>>      6e513bc20ca6 random: fix crng_ready() test
>>>>      8036cdaa1b13 ALSA: hda/realtek - adjust the location of one mic
>>>>      adc02ac60919 ALSA: hda/realtek - set PINCFG_HEADSET_MIC to
>>>> parse_flags
>>>>      11e9bed2b971 ALSA: hda - New VIA controller suppor no-snoop path
>>>>      fcf38cf55e28 ALSA: rawmidi: Fix missing input substream checks in
>>>> compat ioctls
>>>>      43b3e7915edd ALSA: line6: Use correct endpoint type for midi output
>>>>      bdc6f4c3db08 drm/radeon: Fix PCIe lane width calculation
>>>>      110b72d9351f drm/radeon: add PX quirk for Asus K73TK
>>>>      791469d6b882 drm/rockchip: Clear all interrupts before requesting the
>>>> IRQ
>>>>      f188464e3d54 drm/amdgpu/si: implement get/set pcie_lanes asic
>>>> callback
>>>>      f056e3339741 drm/amdgpu: Fix PCIe lane width calculation
>>>>      57e56826611a drm/amdgpu/sdma: fix mask in emit_pipeline_sync
>>>>      c73d9e350085 drm/amdgpu: Fix always_valid bos multiple LRU
>>>> insertions.
>>>>      674b6963cec2 drm/amdgpu: Add an ATPX quirk for hybrid laptop
>>>>      312d02879f9f ALSA: pcm: Fix endless loop for XRUN recovery in OSS
>>>> emulation
>>>>      157113cb7c89 ALSA: pcm: Fix mutex unbalance in OSS emulation ioctls
>>>>      048747b04842 ALSA: pcm: Return -EBUSY for OSS ioctls changing busy
>>>> streams
>>>>      bd889a82fb01 ALSA: pcm: Avoid potential races between OSS ioctls and
>>>> read/write
>>>>      4d2ea307ffa1 ALSA: pcm: Use ERESTARTSYS instead of EINTR in OSS
>>>> emulation
>>>>      2ccdea040e81 vfio/pci: Virtualize Maximum Read Request Size
>>>>      23a63d96e015 watchdog: f71808e_wdt: Fix WD_EN register read
>>>>      28fe0fba29f2 dt-bindings: clock: mediatek: add binding for
>>>> fixed-factor clock axisel_d4
>>>>      ecb67e92d42e thermal: imx: Fix race condition in imx_thermal_probe()
>>>>      c9b200ce2be5 pwm: rcar: Fix a condition to prevent mismatch value
>>>> setting to duty
>>>>      ff18ffb1f81d clk: bcm2835: De-assert/assert PLL reset signal when
>>>> appropriate
>>>>      dc7a428ae26f clk: mediatek: fix PWM clock source by adding a
>>>> fixed-factor clock
>>>>      d8b6fdbe513d clk: fix false-positive Wmaybe-uninitialized warning
>>>>      37d8947c0b07 clk: mvebu: armada-38x: add support for missing clocks
>>>>      f13b4a61989f PCI: Mark Broadcom HT1100 and HT2000 Root Port Extended
>>>> Tags as broken
>>>>      4b684fbbc58e mmc: tmio: Fix error handling when issuing CMD23
>>>>      e5e2841e20ff mmc: jz4740: Fix race condition in IRQ mask update
>>>>      180d28f824ce iommu/vt-d: Fix a potential memory leak
>>>>      5a999c2bef68 um: Use POSIX ucontext_t instead of struct ucontext
>>>>      f57f3f346d05 um: Compile with modern headers
>>>>      dc0f00327452 ring-buffer: Check if memory is available before
>>>> allocation
>>>>      4171ea2471a1 nfit: skip region registration for incomplete control
>>>> regions
>>>>      5520091356b0 nfit, address-range-scrub: fix scrub in-progress
>>>> reporting
>>>>      b68b77c935dd libnvdimm, namespace: use a safe lookup for dimm device
>>>> name
>>>>      45980ba59916 libnvdimm, dimm: fix dpa reservation vs uninitialized
>>>> label area
>>>>      a43d8e0ee79d tpm: self test failure should not cause suspend to fail
>>>>      c1edd3b19f30 cxl: Fix possible deadlock when processing page faults
>>>> from cxllib
>>>>      156b45ed2207 dmaengine: at_xdmac: fix rare residue corruption
>>>>      e99ca1ee070d IB/srp: Fix completion vector assignment algorithm
>>>>      fe71b03e6983 IB/srp: Fix srp_abort()
>>>>      0bb5579128e6 ALSA: pcm: Fix UAF at PCM release via PCM timer access
>>>>      d3b14a66e14b RDMA/rxe: Fix an out-of-bounds read
>>>>      28ce82e3c8b1 RDMA/mlx5: Protect from NULL pointer derefence
>>>>      b140d9468870 RDMA/ucma: Don't allow setting RDMA_OPTION_IB_PATH
>>>> without an RDMA device
>>>>      79fbd052ea63 dm crypt: limit the number of allocated pages
>>>>      e7793f2a2ac8 ext4: add extra checks to ext4_xattr_block_get()
>>>>      9703952178f1 ext4: add bounds checking to ext4_xattr_find_entry()
>>>>      598e04ae2fc4 ext4: move call to ext4_error() into
>>>> ext4_xattr_check_block()
>>>>      b2623d816656 ext4: don't allow r/w mounts if metadata blocks overlap
>>>> the superblock
>>>>      26dbb30c58ff ext4: always initialize the crc32c checksum driver
>>>>      8e0e94683f84 ext4: fail ext4_iget for root directory if unallocated
>>>>      a57eb14b740e ext4: limit xattr size to INT_MAX
>>>>      5058b70d2118 ext4: protect i_disksize update by i_data_sem in direct
>>>> write path
>>>>      bd499f553849 ext4: don't update checksum of new initialized bitmaps
>>>>      73297f13a003 ext4: pass -ESHUTDOWN code to jbd2 layer
>>>>      09439481998a ext4: eliminate sleep from shutdown ioctl
>>>>      7ebcea259682 ext4: shutdown should not prevent get_write_access
>>>>      867175f94485 jbd2: if the journal is aborted then don't allow update
>>>> of the log tail
>>>>      6151a5a45fc4 block: use 32-bit blk_status_t on Alpha
>>>>      7044bf9ef6c8 extcon: intel-cht-wc: Set direction and drv flags for V5
>>>> boost GPIO
>>>>      b0afd9d1cb5a random: use a tighter cap in credit_entropy_bits_safe()
>>>>      439e8b2dcab1 irqchip/gic: Take lock when updating irq type
>>>>      283637785763 thunderbolt: Prevent crash when ICM firmware is not
>>>> running
>>>>      5ae695df59e1 thunderbolt: Resume control channel after hibernation
>>>> image is created
>>>>      7a4a66c504fb thunderbolt: Serialize PCIe tunnel creation with PCI
>>>> rescan
>>>>      6f40f6ee22b9 thunderbolt: Wait a bit longer for ICM to authenticate
>>>> the active NVM
>>>>      73b969f6a920 ASoC: topology: Fix kcontrol name string handling
>>>>      7e23ef535073 ASoC: ssm2602: Replace reg_default_raw with reg_default
>>>>      1b3d2e7a3409 soc: mediatek: fix the mistaken pointer accessed when
>>>> subdomains are added
>>>>      3f306336cdee HID: core: Fix size as type u32
>>>>      f671ac7a5317 HID: Fix hid_report_len usage
>>>>      25b6ee378dc4 powerpc/powernv: Fix OPAL NVRAM driver OPAL_BUSY loops
>>>>      7c854f2e1ff0 powerpc/powernv: define a standard delay for OPAL_BUSY
>>>> type retry loops
>>>>      a55d2c9d42f9 powerpc/kexec_file: Fix error code when trying to load
>>>> kdump kernel
>>>>      fa99a3470e91 powerpc/kprobes: Fix call trace due to incorrect preempt
>>>> count
>>>>      3df05fcf8911 powerpc/64: Fix smp_wmb barrier definition use use
>>>> lwsync consistently
>>>>      1699bd03742d powerpc/64: Call H_REGISTER_PROC_TBL when running as a
>>>> HPT guest on POWER9
>>>>      f4eff13a2780 powerpc/64s: Fix dt_cpu_ftrs to have restore_cpu clear
>>>> unwanted LPCR bits
>>>>      c3baeca67d85 powerpc/powernv: Handle unknown OPAL errors in
>>>> opal_nvram_write()
>>>>      693b03f9b185 CIFS: fix sha512 check in cifs_crypto_secmech_release
>>>>      7a55d160b730 CIFS: add sha512 secmech
>>>>      0910e2804f2e CIFS: refactor crypto shash/sdesc allocation&free
>>>>      fd5cc02cbef9 i2c: i801: Restore configuration at shutdown
>>>>      44ff2389a840 i2c: i801: Save register SMBSLVCMD value only once
>>>>      d6b3a5c87d45 HID: i2c-hid: fix size check and type usage
>>>>      70dbed63a96d smb3: Fix root directory when server returns inode
>>>> number of zero
>>>>      bf895b2a637d fix smb3-encryption breakage when CONFIG_DEBUG_SG=y
>>>>      fdbd79540520 cifs: fix memory leak in SMB2_open()
>>>>      59d3a952e4f3 usb: dwc3: gadget: never call ->complete() from
>>>> ->ep_queue()
>>>>      093dcb929c8e usb: dwc3: pci: Properly cleanup resource
>>>>      30e9a1cddc4d usb: dwc3: prevent setting PRTCAP to OTG from debugfs
>>>>      f7f9187a110e USB:fix USB3 devices behind USB3 hubs not resuming at
>>>> hibernate thaw
>>>>      96dc465173a1 USB: gadget: f_midi: fixing a possible double-free in
>>>> f_midi
>>>>      a2b540651d8c ACPI / hotplug / PCI: Check presence of slot itself in
>>>> get_slot_status()
>>>>      d6e98387b2e9 ACPI / video: Add quirk to force acpi-video backlight on
>>>> Samsung 670Z5E
>>>>      3dac1fe2719d regmap: Fix reversed bounds check in regmap_raw_write()
>>>>      666d1084c13d xen-netfront: Fix hang on device removal
>>>>      e7b00dc28275 x86/xen: Delay get_cpu_cap until stack canary is
>>>> established
>>>>      fcd054c733cf media: vsp1: Fix BRx conditional path in WPF
>>>>      2fb28b075f80 media: vivid: check if the cec_adapter is valid
>>>>      9864a1ef8679 media: atomisp_fops.c: disable atomisp_compat_ioctl32
>>>>      9629964f032c spi: Fix unregistration of controller with fixed SPI bus
>>>> number
>>>>      e4ff723039dc spi: Fix scatterlist elements size in spi_map_buf
>>>>      faddb17685f9 spi: atmel: init FIFOs before spi enable
>>>>      38866e866121 ARM: dts: at91: sama5d4: fix pinctrl compatible string
>>>>      c57b7e1a150e ARM: dts: exynos: Fix IOMMU support for GScaler devices
>>>> on Exynos5250
>>>>      838ea3802e9d ARM: dts: at91: at91sam9g25: fix mux-mask pinctrl
>>>> property
>>>>      958d6e41888f arm: dts: mt7623: fix USB initialization fails on
>>>> bananapi-r2
>>>>      2106cd34635e ARM: EXYNOS: Fix coupled CPU idle freeze on Exynos4210
>>>>      326e61ce9761 ARM: dts: da850-lego-ev3: Fix battery voltage gpio
>>>>      8f1a2803e4c2 KVM: arm/arm64: vgic-its: Fix potential overrun in
>>>> vgic_copy_lpi_list
>>>>      8fdbba69cb34 ARM64: dts: meson: reduce odroid-c2 eMMC maximum rate
>>>>      7732495c599c usb: gadget: udc: core: update usb_ep_queue()
>>>> documentation
>>>>      aea6c0b4aee8 phy: allwinner: sun4i-usb: poll vbus changes on A23/A33
>>>> when driving VBUS
>>>>      334d8f201ef5 usb: musb: gadget: misplaced out of bounds check
>>>>      20eaa393fcd3 mm, slab: reschedule cache_reap() on the same CPU
>>>>      703eee654360 ipc/shm: fix use-after-free of shm file via
>>>> remap_file_pages()
>>>>      c25ef6220fac resource: fix integer overflow at reallocation
>>>>      f659e7e79f52 fs/reiserfs/journal.c: add missing resierfs_warning()
>>>> arg
>>>>      6337067b2ab6 task_struct: only use anon struct under randstruct
>>>> plugin
>>>>      28cb085f1598 mm/hmm: hmm_pfns_bad() was accessing wrong struct
>>>>      963722d031e5 mm/hmm: fix header file if/else/endif maze
>>>>      e84e6914ccb4 mm/ksm.c: fix inconsistent accounting of zero pages
>>>>      577b4eb23811 ubi: Reject MLC NAND
>>>>      7ade852714de ubi: Fix error for write access
>>>>      bf3fbf54a9ae ubi: fastmap: Don't flush fastmap work on detach
>>>>      09844df06087 ubifs: Check ubifs_wbuf_sync() return code
>>>>      f1e90bf95e55 cpufreq: CPPC: Use transition_delay_us depending
>>>> transition_latency
>>>>      9427a4aecf23 tty: make n_tty_read() always abort if hangup is in
>>>> progress
>>>>      672f07d8274b Linux 4.14.35
>>>>      9a0a509839f3 nfsd: fix incorrect umasks
>>>>      61534984904e hugetlbfs: fix bug in pgoff overflow checking
>>>>      0319ce67b793 xen: xenbus_dev_frontend: Fix XS_TRANSACTION_END
>>>> handling
>>>>      80f509d4919d ovl: fix lookup with middle layer opaque dir and
>>>> absolute path redirects
>>>>      5ee935daaaeb blk-mq: don't keep offline CPUs mapped to hctx 0
>>>>      a333a284fff2 lib: fix stall in __bitmap_parselist()
>>>>      f9e66750d4bd f2fs: fix heap mode to reset it back
>>>>      e4fa275b8fdd sunrpc: remove incorrect HMAC request initialization
>>>>      3d06535693a3 ath9k: Protect queue draining by rcu_read_lock()
>>>>      aa3bfa29fcd5 hwmon: (ina2xx) Fix access to uninitialized mutex
>>>>      360ecf51864e x86/mce/AMD: Get address from already initialized block
>>>>      c81968e93aca x86/mce/AMD, EDAC/mce_amd: Enumerate Reserved SMCA bank
>>>> type
>>>>      0ee4f31673af x86/mce/AMD: Pass the bank number to
>>>> smca_get_bank_type()
>>>>      99971efd7d9a x86/MCE: Report only DRAM ECC as memory errors on AMD
>>>> systems
>>>>      a2813b4cfe3b rtl8187: Fix NULL pointer dereference in
>>>> priv->conf_mutex
>>>>      9e483bc229f5 Bluetooth: hci_bcm: Treat Interrupt ACPI resources as
>>>> always being active-low
>>>>      f58ef38ef1a8 Bluetooth: Fix connection if directed advertising and
>>>> privacy is used
>>>>      c3efeaa3b154 getname_kernel() needs to make sure that ->name !=
>>>> ->iname in long case
>>>>      adea72f0e570 get_user_pages_fast(): return -EFAULT on access_ok
>>>> failure
>>>>      3da5723b4f05 s390/ipl: ensure loadparm valid flag is set
>>>>      c6c8e42071dc s390/qdio: don't merge ERROR output buffers
>>>>      b6366b15a267 s390/qdio: don't retry EQBS after CCQ 96
>>>>      3a6771e2fb32 nfit: fix region registration vs block-data-window
>>>> ranges
>>>>      51a9580d67a2 block/loop: fix deadlock after loop_set_status
>>>>      54b990ede4c3 apparmor: fix resource audit messages when auditing peer
>>>>      a0358f605283 apparmor: fix display of .ns_name for containers
>>>>      1d0d8beb35cd apparmor: fix logging of the existence test for signals
>>>>      b18daa09fefe scsi: qla2xxx: Fix small memory leak in
>>>> qla2x00_probe_one on probe failure
>>>>      0ed20e4b52af x86/MCE/AMD: Define a function to get SMCA bank type
>>>>      8e52e2f41c43 radeon: hide pointless #warning when compile testing
>>>>      6f22be4ba787 perf/core: Fix use-after-free in uprobe_perf_close()
>>>>      674e18de7bde perf intel-pt: Fix timestamp following overflow
>>>>      4039579fca38 perf intel-pt: Fix error recovery from missing TIP
>>>> packet
>>>>      0733facf3be9 perf intel-pt: Fix sync_switch
>>>>      ff295906bd9b perf intel-pt: Fix overlap detection to identify
>>>> consecutive buffers correctly
>>>>      42b53a13ecac KVM: PPC: Book3S HV: trace_tlbie must not be called in
>>>> realmode
>>>>      5661d43b03c5 PCI: hv: Serialize the present and eject work items
>>>>      a160105b5503 Drivers: hv: vmbus: do not mark HV_PCIE as perf_device
>>>>      abd9fd4a3b04 parisc: Fix HPMC handler by increasing size to multiple
>>>> of 16 bytes
>>>>      08be2c1b6bb6 parisc: Fix out of array access in match_pci_device()
>>>>      4d167edf0f6a media: v4l: vsp1: Fix header display list status check
>>>> in continuous mode
>>>>      e7a4d7c2fe38 media: v4l2-compat-ioctl32: don't oops on overlay
>>>>      c0e0cd653e6a lan78xx: Correctly indicate invalid OTP
>>>>      2ea541eb4064 vhost: Fix vhost_copy_to_user()
>>>>      e240ffd5a3be vhost: fix vhost_vq_access_ok() log check
>>>>      381ebff25898 slip: Check if rstate is initialized before
>>>> uncompressing
>>>>      427b8a146973 rds: MP-RDS may use an invalid c_path
>>>>      856d5d075a92 cdc_ether: flag the Cinterion AHS8 modem by gemalto as
>>>> WWAN
>>>>      073e82701bc0 netfilter: ipset: Missing nfnl_lock()/nfnl_unlock() is
>>>> added to ip_set_net_exit()
>>>>      ffebeb0d7c37 Linux 4.14.34
>>>>      fdae5b620566 net/mlx4_core: Fix memory leak while delete slave's
>>>> resources
>>>>      9fdeb33e1913 vhost_net: add missing lock nesting notation
>>>>      8c316b625705 team: move dev_mc_sync after master_upper_dev_link in
>>>> team_port_add
>>>>      233ba28e1862 route: check sysctl_fib_multipath_use_neigh earlier than
>>>> hash
>>>>      2f8aa659d4c0 vhost: validate log when IOTLB is enabled
>>>>      72b880f43990 net/mlx5e: Fix traffic being dropped on VF representor
>>>>      9408bceb0649 net/mlx4_en: Fix mixed PFC and Global pause user control
>>>> requests
>>>>      477c73abf26a strparser: Fix sign of err codes
>>>>      1c71bfe84deb net/sched: fix NULL dereference on the error path of
>>>> tcf_skbmod_init()
>>>>      a19024a3f343 net/sched: fix NULL dereference in the error path of
>>>> tunnel_key_init()
>>>>      e096c8bf4fb8 net/mlx5e: Sync netdev vxlan ports at open
>>>>      baab1f0c4885 net/mlx5e: Don't override vport admin link state in
>>>> switchdev mode
>>>>      1ec7966ab7db ipv6: sr: fix seg6 encap performances with TSO enabled
>>>>      e52a45bb392f nfp: use full 40 bits of the NSP buffer address
>>>>      ddf79878f1e0 net/mlx5e: Fix memory usage issues in offloading TC
>>>> flows
>>>>      9282181c1cc5 net/mlx5e: Avoid using the ipv6 stub in the TC offload
>>>> neigh update path
>>>>      b9c6ddda3805 vti6: better validate user provided tunnel names
>>>>      109dce20c6ed ip6_tunnel: better validate user provided tunnel names
>>>>      72363c63b070 ip6_gre: better validate user provided tunnel names
>>>>      a7309cad9c2e ipv6: sit: better validate user provided tunnel names
>>>>      6816295fe958 ip_tunnel: better validate user provided tunnel names
>>>>      048a64fbc229 net: fool proof dev_valid_name()
>>>>      77b9fc371d4d bonding: process the err returned by dev_set_allmulti
>>>> properly in bond_enslave
>>>>      22ab1f8751fa bonding: move dev_mc_sync after master_upper_dev_link in
>>>> bond_enslave
>>>>      d7e7ab42581e bonding: fix the err path for dev hwaddr sync in
>>>> bond_enslave
>>>>      65c42a2d475d vrf: Fix use after free and double free in
>>>> vrf_finish_output
>>>>      09cb8267add5 vlan: also check phy_driver ts_info for vlan's real
>>>> device
>>>>      4f288c97b5c5 vhost: correctly remove wait queue during poll failure
>>>>      c5fc4dc51cb0 sky2: Increase D3 delay to sky2 stops working after
>>>> suspend
>>>>      3fdd43709d70 sctp: sctp_sockaddr_af must check minimal addr length
>>>> for AF_INET6
>>>>      3f80d01bbd87 sctp: do not leak kernel memory to user space
>>>>      c17f6594abfa r8169: fix setting driver_data after register_netdev
>>>>      a7c8900c1fc2 pptp: remove a buggy dst release in pptp_connect()
>>>>      21563c4df30e net/sched: fix NULL dereference in the error path of
>>>> tcf_bpf_init()
>>>>      cd19a9b12ab4 net sched actions: fix dumping which requires several
>>>> messages to user space
>>>>      787b940625ca netlink: make sure nladdr has correct size in
>>>> netlink_connect()
>>>>      7948bc92791b net/ipv6: Increment OUTxxx counters after netfilter hook
>>>>      d1b820bd98a1 net/ipv6: Fix route leaking between VRFs
>>>>      589a3f305185 net: fix possible out-of-bound read in
>>>> skb_network_protocol()
>>>>      629eeaaccb23 lan78xx: Crash in lan78xx_writ_reg (Workqueue: events
>>>> lan78xx_deferred_multicast_write)
>>>>      52f0a5ff60e4 ipv6: the entire IPv6 header chain must fit the first
>>>> fragment
>>>>      cdd74d6ac80e arp: fix arp_filter on l3slave devices
>>>>      8413a3a63d37 x86/microcode: Fix CPU synchronization routine
>>>>      c81d7069dcd6 x86/microcode: Attempt late loading only when new
>>>> microcode is present
>>>>      b0b1ac38e018 x86/microcode: Synchronize late microcode loading
>>>>      509df2b865f1 x86/microcode: Request microcode on the BSP
>>>>      d2725848230d x86/microcode/intel: Look into the patch cache first
>>>>      e87c2b553a35 x86/microcode: Do not upload microcode if CPUs are
>>>> offline
>>>>      1707112c82fa x86/microcode/intel: Writeback and invalidate caches
>>>> before updating microcode
>>>>      170f8ec16c22 x86/microcode/intel: Check microcode revision before
>>>> updating sibling threads
>>>>      22cc8816d013 x86/microcode: Get rid of struct apply_microcode_ctx
>>>>      35da0d504a98 x86/CPU: Check CPU feature bits after microcode upgrade
>>>>      00ba4bcf4b92 x86/CPU: Add a microcode loader callback
>>>>      962e6b2d1665 x86/microcode: Propagate return value from updating
>>>> functions
>>>>      b6a11be5c433 crypto: arm64/aes-ce-cipher - move assembler code to .S
>>>> file
>>>>      f1b46925f59e objtool: Add Clang support
>>>>      5dff63583f0d thermal: int3400_thermal: fix error handling in
>>>> int3400_thermal_probe()
>>>>      bc166ca4234c tcmu: release blocks for partially setup cmds
>>>>      6a88a999c45d perf tools: Fix copyfile_offset update of output offset
>>>>      7cae67e31292 crypto: aes-generic - build with -Os on gcc-7+
>>>>      3847b9e016df mtd: mtd_oobtest: Handle bitflips during reads
>>>>      88f6f0490f8c Input: goodix - disable IRQs while suspended
>>>>      c427d7e44a32 ibmvnic: Don't handle RX interrupts when not up.
>>>>      62eaf7e149a5 sdhci: Advertise 2.0v supply on SDIO host controller
>>>>      997901406c0a x86/gart: Exclude GART aperture from vmcore
>>>>      4aafb8cdcc11 gpio: thunderx: fix error return code in
>>>> thunderx_gpio_probe()
>>>>      cfafed12f459 RDMA/cma: Fix rdma_cm path querying for RoCE
>>>>      15dfb9baba2c scsi: megaraid_sas: unload flag should be set after
>>>> scsi_remove_host is called
>>>>      70077054384d scsi: megaraid_sas: Error handling for invalid ldcount
>>>> provided by firmware in RAID map
>>>>      b432f980596c cxgb4vf: Fix SGE FL buffer initialization logic for 64K
>>>> pages
>>>>      d017aeb58a3e i40evf: don't rely on netif_running() outside
>>>> rtnl_lock()
>>>>      d96a094c987f uio_hv_generic: check that host supports monitor page
>>>>      28b35f9aa0c0 EDAC, mv64x60: Fix an error handling path
>>>>      effbffc91da3 block, bfq: put async queues for root bfq groups too
>>>>      4ed8692bb2d6 tty: n_gsm: Allow ADM response in addition to UA for
>>>> control dlci
>>>>      8976d64b2f0f blk-mq: fix kernel oops in blk_mq_tag_idle()
>>>>      b728b7e24fbc scsi: libsas: initialize sas_phy status according to
>>>> response of DISCOVER
>>>>      f890a23603e3 scsi: libsas: fix error when getting phy events
>>>>      8644d14c3240 scsi: libsas: fix memory leak in
>>>> sas_smp_get_phy_events()
>>>>      fad9bcb1176b bcache: segregate flash only volume write streams
>>>>      ef60904109f4 bcache: stop writeback thread after detaching
>>>>      71468ce63dc9 bcache: ret IOERR when read meets metadata error
>>>>      b20482cebfb2 net: hns3: fix for changing MTU
>>>>      be6a161e1302 net: hns3: Fix an error macro definition of
>>>> HNS3_TQP_STAT
>>>>      611abba6eb68 net: hns3: Fix a loop index error of tqp statistics
>>>> query
>>>>      5669ec0b9588 net: hns3: Fix an error of total drop packet statistics
>>>>      35a9ebd920aa net/mlx5: Fix race for multiple RoCE enable
>>>>      46d19334ca40 wl1251: check return from call to
>>>> wl1251_acx_arp_ip_filter
>>>>      f722a6a61179 rt2x00: do not pause queue unconditionally on error path
>>>>      1530dcc90331 power: supply: axp288_charger: Properly stop work on
>>>> probe-error / remove
>>>>      87b9099cf141 ASoC: Intel: sst: Fix the return value of
>>>> 'sst_send_byte_stream_mrfld()'
>>>>      89deb4ad015b staging: lustre: disable preempt while sampling
>>>> processor id.
>>>>      01ff15fcf466 perf report: Fix a no annotate browser displayed issue
>>>>      3b3fb4be7ca1 tpm: return a TPM_RC_COMMAND_CODE response if command is
>>>> not implemented
>>>>      f0504bf54b4d nvme_fcloop: fix abort race condition
>>>>      39ede1fd200f nvme_fcloop: disassocate local port structs
>>>>      5391891c0a46 pinctrl: baytrail: Enable glitch filter for GPIOs used
>>>> as interrupts
>>>>      dd3e1a4e769e backlight: tdo24m: Fix the SPI CS between transfers
>>>>      fb1ef85d5885 blk-mq: fix race between updating nr_hw_queues and
>>>> switching io sched
>>>>      eaa077800ff6 blk-mq: avoid to map CPU into stale hw queue
>>>>      cf4c90693651 IB/rdmavt: Allocate CQ memory on the correct node
>>>>      da5e12ab599a powernv-cpufreq: Add helper to extract pstate from PMSR
>>>>      1f1e5ca1c737 gpio: label descriptors using the device name
>>>>      e985dcf4fa1b vfb: fix video mode and line_length being set when
>>>> loaded
>>>>      bb23fbd8fb06 mac80211: Fix setting TX power on monitor interfaces
>>>>      74f5124bc3ff ACPI: EC: Fix debugfs_create_*() usage
>>>>      04568f4df228 irqchip/gic-v3: Fix the driver probe() fail due to
>>>> disabled GICC entry
>>>>      b5d2cafbe359 scsi: mpt3sas: Proper handling of set/clear of "ATA
>>>> command pending" flag.
>>>>      3807b6fec674 scsi: libiscsi: Allow sd_shutdown on bad transport
>>>>      978c2812b805 spi: sh-msiof: Fix timeout failures for TX-only DMA
>>>> transfers
>>>>      1d65600e9722 ASoC: Intel: cht_bsw_rt5645: Analog Mic support
>>>>      522371c28210 ASoC: Intel: Skylake: Disable clock gating during
>>>> firmware and library download
>>>>      543d317db8be media: videobuf2-core: don't go out of the buffer range
>>>>      6e7b07606bfe clk: sunxi-ng: a83t: Add M divider to TCON1 clock
>>>>      bd4a96921d8b hwmon: (ina2xx) Make calibration register value fixed
>>>>      ddc09c522035 RDMA/cma: Mark end of CMA ID messages
>>>>      7743aa143055 selftests/net: fix bugs in address and port
>>>> initialization
>>>>      b72d39b1da82 PM / devfreq: Fix potential NULL pointer dereference in
>>>> governor_store
>>>>      e6bc3a4b0c23 clk: divider: fix incorrect usage of container_of
>>>>      1cf98fd005f5 watchdog: dw_wdt: add stop watchdog operation
>>>>      db470ce8c6ee VFS: close race between getcwd() and d_move()
>>>>      87a25a385832 net/mlx4_en: Change default QoS settings
>>>>      378259c7d0a2 ACPI / video: Default lcd_only to true on Win8-ready and
>>>> newer machines
>>>>      ea620e414bde rds; Reset rs->rs_bound_addr in rds_add_bound() failure
>>>> path
>>>>      ab4ac0fc4712 l2tp: fix missing print session offset info
>>>>      fcb762cb4b5c net: hns3: fix for getting auto-negotiation state in
>>>> hclge_get_autoneg
>>>>      f7b0ea2245a0 net: hns3: free the ring_data structrue when change tqps
>>>>      93b8f4a2302b perf evsel: Enable ignore_missing_thread for pid option
>>>>      d606bac136ec perf probe: Add warning message if there is unexpected
>>>> event name
>>>>      3efc86f667fc perf probe: Find versioned symbols from map
>>>>      ea40afb5c379 thermal: power_allocator: fix one race condition issue
>>>> for thermal_instances list
>>>>      fd78be4b37cc ipv6: Reinject IPv6 packets if IPsec policy matches
>>>> after SNAT
>>>>      78728d84f338 Bluetooth: Add a new 04ca:3015 QCA_ROME device
>>>>      2e9a8b6a7d52 ARM: dts: ls1021a: add "fsl,ls1021a-esdhc" compatible
>>>> string to esdhc node
>>>>      800ffac10754 clk: meson: mpll: use 64-bit maths in params_from_rate
>>>>      fbd4d9046a1a i40iw: Validate correct IRD/ORD connection parameters
>>>>      c5cd3cc217a9 i40iw: Correct Q1/XF object count equation
>>>>      0bc82eae1256 i40iw: Fix sequence number for the first partial FPDU
>>>>      b867b7a7e590 Linux 4.14.33
>>>>      6bc3a54e06c6 Revert "ip6_vti: adjust vti mtu according to mtu of
>>>> lower device"
>>>>      cfbed9b55636 Revert "cpufreq: Fix governor module removal race"
>>>>      a99aaeccdefd Revert "ARM: dts: omap3-n900: Fix the audio CODEC's
>>>> reset pin"
>>>>      118118eb3818 Revert "ARM: dts: am335x-pepper: Fix the audio CODEC's
>>>> reset pin"
>>>>      92e3d3f67d79 Fix slab name "biovec-(1<<(21-12))"
>>>>      b31397c9b945 net: hns: Fix ethtool private flags
>>>>      9b47e99ac970 ARM: dts: DRA76-EVM: Set powerhold property for tps65917
>>>>      52dcf4a6afbc vt: change SGR 21 to follow the standards
>>>>      8ac678a4b363 Input: i8042 - enable MUX on Sony VAIO VGN-CS series to
>>>> fix touchpad
>>>>      4043155add40 Input: i8042 - add Lenovo ThinkPad L460 to i8042 reset
>>>> list
>>>>      ac72f0080c1a Input: ALPS - fix TrackStick detection on Thinkpad L570
>>>> and Latitude 7370
>>>>      0d3f8c0217f9 Revert "base: arch_topology: fix section mismatch build
>>>> warnings"
>>>>      a59779368b33 staging: comedi: ni_mio_common: ack ai fifo error
>>>> interrupts.
>>>>      4be89529c013 Btrfs: fix unexpected cow in run_delalloc_nocow
>>>>      62532640c8e1 crypto: x86/cast5-avx - fix ECB encryption when long sg
>>>> follows short one
>>>>      b5a888390998 crypto: arm,arm64 - Fix random regeneration of S_shipped
>>>>      ee54953ecd47 crypto: ccp - return an actual key size from RSA
>>>> max_size callback
>>>>      056f3bd2399b crypto: caam - Fix null dereference at error path
>>>>      c3657fd0c15f crypto: ahash - Fix early termination in hash walk
>>>>      ad35fdc00a7c crypto: testmgr - Fix incorrect values in PKCS#1 test
>>>> vector
>>>>      41e960b042fc crypto: inside-secure - fix clock management
>>>>      77827f3d63d0 crypto: lrw - Free rctx->ext with kzfree
>>>>      3c6096ca8e49 parport_pc: Add support for WCH CH382L PCI-E single
>>>> parallel port card.
>>>>      1f17d5033fe3 media: usbtv: prevent double free in error case
>>>>      5f834dd24bae /dev/mem: Avoid overwriting "err" in read_mem()
>>>>      66a65ca5b8fd mei: remove dev_err message on an unsupported ioctl
>>>>      cbf733ca587c serial: 8250: Add Nuvoton NPCM UART
>>>>      c0aed3667b3d USB: serial: cp210x: add ELDAT Easywave RX09 id
>>>>      f4d01432eeda USB: serial: ftdi_sio: add support for Harman
>>>> FirmwareHubEmulator
>>>>      e1e87ebd5b79 USB: serial: ftdi_sio: add RT Systems VX-8 cable
>>>>      ac5a36bb6957 bitmap: fix memset optimization on big-endian systems
>>>>      52a0c9a14f52 usb: dwc2: Improve gadget state disconnection handling
>>>>      87a97ab15e44 Bluetooth: Fix missing encryption refresh on Security
>>>> Request
>>>>      cf88ae752cd3 phy: qcom-ufs: add MODULE_LICENSE tag
>>>>      839a4c3b4a48 netfilter: x_tables: add and use xt_check_proc_name
>>>>      2a55ad7440e6 netfilter: drop template ct when conntrack is skipped.
>>>>      b0850604cc5d l2tp: fix races with ipv4-mapped ipv6 addresses
>>>>      bbfbc396f076 netfilter: bridge: ebt_among: add more missing match
>>>> size checks
>>>>      546ade704a98 netfilter: x_tables: make allocation less aggressive
>>>>      72682b162dae percpu: add __GFP_NORETRY semantics to the percpu
>>>> balancing path
>>>>      dffe655ddb48 xfrm: Refuse to insert 32 bit userspace socket policies
>>>> on 64 bit systems
>>>>      a6232ffa2a02 net: xfrm: use preempt-safe this_cpu_read() in
>>>> ipcomp_alloc_tfms()
>>>>      b0d95e686f45 RDMA/ucma: Introduce safer rdma_addr_size() variants
>>>>      4fbf77d7a9fe RDMA/ucma: Check that device exists prior to accessing
>>>> it
>>>>      4dba68fd1dfe RDMA/ucma: Check that device is connected prior to
>>>> access it
>>>>      6c2c0da62b5d RDMA/rdma_cm: Fix use after free race with
>>>> process_one_req
>>>>      4cd0242812a9 RDMA/ucma: Ensure that CM_ID exists prior to access it
>>>>      ac895355571a RDMA/ucma: Fix use-after-free access in ucma_close
>>>>      123f9f8981d2 RDMA/ucma: Check AF family prior resolving address
>>>>      25fd02ea40db xfrm_user: uncoditionally validate esn replay attribute
>>>> struct
>>>>      ac2cb9f3de88 partitions/msdos: Unable to mount UFS 44bsd partitions
>>>>      0726ba0491ca powerpc/64s: Fix i-side SLB miss bad address handler
>>>> saving nonvolatile GPRs
>>>>      4c6d2518e1fe powerpc/64s: Fix lost pending interrupt due to race
>>>> causing lost update to irq_happened
>>>>      834a06e59896 i2c: i2c-stm32f7: fix no check on returned setup
>>>>      f025072cbfe3 ipc/shm.c: add split function to shm_vm_ops
>>>>      f00a344718dd ceph: only dirty ITER_IOVEC pages for direct read
>>>>      ca04476df8fd perf/hwbp: Simplify the perf-hwbp code, fix
>>>> documentation
>>>>      b276b3465531 x86/platform/uv/BAU: Add APIC idt entry
>>>>      58eaa556bd0a ALSA: pcm: potential uninitialized return values
>>>>      17c9ea37cb60 ALSA: pcm: Use dma_bytes as size parameter in
>>>> dma_mmap_coherent()
>>>>      ba0b1c7761b4 ALSA: usb-audio: Add native DSD support for TEAC UD-301
>>>>      be0fdc488672 mtd: nand: atmel: Fix get_sectorsize() function
>>>>      e9eddb705648 mtd: jedec_probe: Fix crash in jedec_read_mfr()
>>>>      67356ab6e6a9 ARM: dts: sun6i: a31s: bpi-m2: add missing regulators
>>>>      46e10c38af0c ARM: dts: sun6i: a31s: bpi-m2: improve pmic properties
>>>>      d377d3d041b7 ARM: 8746/1: vfp: Go back to clearing
>>>> vfp_current_hw_state[]
>>>>      a4941a5fbcf0 ARM: OMAP: Fix SRAM W+X mapping
>>>>      9a2e216d9e89 Linux 4.14.32
>>>>      bba757a2c128 s390/qeth: on channel error, reject further cmd requests
>>>>      e52456422017 s390/qeth: lock read device while queueing next buffer
>>>>      dd5ec7314030 s390/qeth: when thread completes, wake up all waiters
>>>>      b469bdd0f511 s390/qeth: free netdevice when removing a card
>>>>      299902b581ea dpaa_eth: remove duplicate increment of the tx_errors
>>>> counter
>>>>      5bf75fca4367 dpaa_eth: increment the RX dropped counter when needed
>>>>      dde9b6a83797 dpaa_eth: remove duplicate initialization
>>>>      5bbb99d2fde0 dpaa_eth: fix error in dpaa_remove()
>>>>      29cd9c2d1f42 soc/fsl/qbman: fix issue in qman_delete_cgr_safe()
>>>>      43d8f3c5d3ad team: Fix double free in error path
>>>>      329f4710f89c skbuff: Fix not waking applications when errors are
>>>> enqueued
>>>>      e90e9771d9a3 qede: Fix qedr link update
>>>>      c6841b478e6b net: systemport: Rewrite __bcm_sysport_tx_reclaim()
>>>>      474aa5149753 net: Only honor ifindex in IP_PKTINFO if non-0
>>>>      06d3f43d52bb netlink: avoid a double skb free in genlmsg_mcast()
>>>>      2980f37b6111 net/iucv: Free memory obtained by kzalloc
>>>>      a14b791d9863 net: fec: Fix unbalanced PM runtime calls
>>>>      9cdb0f25fbb4 net: ethernet: ti: cpsw: add check for in-band mode
>>>> setting with RGMII PHY interface
>>>>      89142a0e0b70 net: ethernet: arc: Fix a potential memory leak if an
>>>> optional regulator is deferred
>>>>      2d5b0ed04c5a l2tp: do not accept arbitrary sockets
>>>>      18c647456ac9 ipv6: fix access to non-linear packet in
>>>> ndisc_fill_redirect_hdr_option()
>>>>      91d27e0c3025 dccp: check sk for closed state in dccp_sendmsg()
>>>>      946b9671ac02 net: Fix hlist corruptions in inet_evict_bucket()
>>>>      4ff5078b0396 net: use skb_to_full_sk() in skb_update_prio()
>>>>      f6cdb675ca0a ieee802154: 6lowpan: fix possible NULL deref in
>>>> lowpan_device_event()
>>>>      f77ff13a06c1 sch_netem: fix skb leak in netem_enqueue()
>>>>      515bc34124f3 kcm: lock lower socket in kcm_attach
>>>>      07cf9d303c7c rhashtable: Fix rhlist duplicates insertion
>>>>      090da7ced80b ppp: avoid loop in xmit recursion detection code
>>>>      28b488f7cb3a net sched actions: return explicit error when tunnel_key
>>>> mode is not specified
>>>>      2274d77c3675 net: phy: Tell caller result of phy_change()
>>>>      42cf2a1e5ac4 mlxsw: spectrum_buffers: Set a minimum quota for CPU
>>>> port traffic
>>>>      dbad5abd2b16 ipv6: sr: fix scheduling in RCU when creating seg6
>>>> lwtunnel state
>>>>      cb4963b49426 ipv6: sr: fix NULL pointer dereference when setting
>>>> encap source address
>>>>      5defa8c9269a ipv6: old_dport should be a __be16 in
>>>> __ip6_datagram_connect()
>>>>      a8f02befc87d net: ipv6: keep sk status consistent after datagram
>>>> connect failure
>>>>      82fb817863e3 macvlan: filter out unsupported feature flags
>>>>      b51eb57dac9c devlink: Remove redundant free on error path
>>>>      67a1dc567567 net: phy: relax error checking when creating sysfs link
>>>> netdev->phydev
>>>>      223c54244252 sysfs: symlink: export sysfs_create_link_nowarn()
>>>>      497166d63780 qed: Fix non TCP packets should be dropped on iWARP ll2
>>>> connection
>>>>      e44c1733059c tcp: purge write queue upon aborting the connection
>>>>      dbbf2d1e4077 tcp: reset sk_send_head in tcp_write_queue_purge
>>>>      9861e6647c85 Linux 4.14.31
>>>>      7514cd2f6d21 bpf, x64: increase number of passes
>>>>      b4e02202a0ba bpf: skip unnecessary capability check
>>>>      3e1130970ec3 kbuild: disable clang's default use of
>>>> -fmerge-all-constants
>>>>      3fdc6f0d1484 x86/pkeys/selftests: Rename 'si_pkey' to 'siginfo_pkey'
>>>>      d6e6e57e6045 usb: xhci: Fix potential memory leak in
>>>> xhci_disable_slot()
>>>>      4208d820ed23 usb: xhci: Disable slot even when virt-dev is null
>>>>      213b332c71a9 staging: lustre: ptlrpc: kfree used instead of kvfree
>>>>      26023c977975 staging: android: ion: Zero CMA allocated memory
>>>>      af00a24c9ea2 iio: imu: st_lsm6dsx: fix endianness in
>>>> st_lsm6dsx_read_oneshot()
>>>>      c7d20ac820ad iio: ABI: Fix name of timestamp sysfs file
>>>>      294a6268bf16 perf/x86/intel/uncore: Fix multi-domain PCI CHA
>>>> enumeration bug on Skylake servers
>>>>      59dbc2a44921 perf/x86/intel: Don't accidentally clear high bits in
>>>> bdw_limit_period()
>>>>      227e2f91f0c9 perf/core: Fix ctx_event_type in ctx_resched()
>>>>      b69902a42097 perf stat: Fix CVS output format for non-supported
>>>> counters
>>>>      d244e5897c1f perf/x86/intel/uncore: Fix Skylake UPI event format
>>>>      5fb252cad61f drm/syncobj: Stop reusing the same struct file for all
>>>> syncobj -> fd
>>>>      a9b385a59b1f x86/boot/64: Verify alignment of the LOAD segment
>>>>      faf470583a57 x86/build/64: Force the linker to use 2MB page size
>>>>      06b281015054 kvm/x86: fix icebp instruction handling
>>>>      f7fbe38cc55b posix-timers: Protect posix clock array access against
>>>> speculation
>>>>      b08952bbc171 x86/efi: Free efi_pgd with free_pages()
>>>>      373ccbd6eb03 x86/vsyscall/64: Use proper accessor to update P4D entry
>>>>      852d9679a778 selftests/x86/ptrace_syscall: Fix for yet more glibc
>>>> interference
>>>>      5a29ce2b9880 x86/entry/64: Don't use IST entry for #BP stack
>>>>      3832d40ef22e tty: vt: fix up tabstops properly
>>>>      5c955c3cfb58 can: cc770: Fix use after free in cc770_tx_interrupt()
>>>>      63affa180c7d can: cc770: Fix queue stall & dropped RTR reply
>>>>      b3ab7e3dee87 can: cc770: Fix stalls on rt-linux, remove redundant IRQ
>>>> ack
>>>>      18f29aa5b55d can: ifi: Check core revision upon probe
>>>>      8a731531d08f can: ifi: Repair the error handling
>>>>      e7dc75584302 can: peak/pcie_fd: remove useless code when interface
>>>> starts
>>>>      74f08b1e0de8 can: peak/pcie_fd: fix echo_skb is occupied! bug
>>>>      2a2b9ef30926 staging: ncpfs: memory corruption in ncp_read_kernel()
>>>>      3f3a6707770a mtd: nand: fsl_ifc: Read ECCSTAT0 and ECCSTAT1 registers
>>>> for IFC 2.0
>>>>      1aa0e4115330 mtd: nand: fsl_ifc: Fix eccstat array overflow for IFC
>>>> ver >= 2.0.0
>>>>      91ff3795b188 mtd: nand: fsl_ifc: Fix nand waitfunc return value
>>>>      84f7a040cf04 mtdchar: fix usage of mtd_ooblayout_ecc()
>>>>      70001527f446 tracing: probeevent: Fix to support minus offset from
>>>> symbol
>>>>      1a697e6ef91b rtlwifi: rtl8723be: Fix loss of signal
>>>>      7964c00a4a7e brcmfmac: fix P2P_DEVICE ethernet address generation
>>>>      865a0221c7e2 libnvdimm, {btt, blk}: do integrity setup before
>>>> add_disk()
>>>>      7fbddfb00176 ACPI / watchdog: Fix off-by-one error at resource
>>>> assignment
>>>>      8f860adbb3d8 acpi, numa: fix pxm to online numa node associations
>>>>      b8b8151806ff mm/vmscan: wake up flushers for legacy cgroups too
>>>>      c8deec718121 drm: udl: Properly check framebuffer mmap offsets
>>>>      fc1142a8ca2d drm: Reject getfb for multi-plane framebuffers
>>>>      b53d42b4ab92 drm/radeon: Don't turn off DP sink when disconnected
>>>>      19246741a6df drm/vmwgfx: Fix a destoy-while-held mutex problem.
>>>>      4be50a9fe670 drm/vmwgfx: Fix black screen and device errors when
>>>> running without fbdev
>>>>      99b6ead444cf Revert "mm: page_alloc: skip over regions of invalid
>>>> pfns where possible"
>>>>      f5dad0409a72 mm/shmem: do not wait for lock_page() in
>>>> shmem_unused_huge_shrink()
>>>>      b6b6783c8097 mm/thp: do not wait for lock_page() in
>>>> deferred_split_scan()
>>>>      8b8b5c4f7f3a mm/khugepaged.c: convert VM_BUG_ON() to collapse fail
>>>>      5bbd932ff58f x86/mm: implement free pmd/pte page interfaces
>>>>      acdb4981644c mm/vmalloc: add interfaces to free unmapped page table
>>>>      04d47fc40367 h8300: remove extraneous __BIG_ENDIAN definition
>>>>      1e8628443ede hugetlbfs: check for pgoff value overflow
>>>>      797bfd05d404 nfsd: remove blocked locks on client teardown
>>>>      aa0533f4f7b2 cgroup: fix rule checking for threaded mode switching
>>>>      2b4bb9f3869b libata: Modify quirks for MX100 to limit NCQ_TRIM quirk
>>>> to MU01 version
>>>>      65ab5809b48d libata: Make Crucial BX100 500GB LPM quirk apply to all
>>>> firmware versions
>>>>      596d0a8e7c77 libata: Apply NOLPM quirk to Crucial M500 480 and 960GB
>>>> SSDs
>>>>      01b6d6839a28 libata: Enable queued TRIM for Samsung SSD 860
>>>>      603f0168c1ef libata: disable LPM for Crucial BX100 SSD 500GB drive
>>>>      3962dd60a67b libata: Apply NOLPM quirk to Crucial MX100 512GB SSDs
>>>>      5e67e65d21d0 libata: don't try to pass through NCQ commands to
>>>> non-NCQ devices
>>>>      cd47a2ccc602 libata: remove WARN() for DMA or PIO command without
>>>> data
>>>>      8745d2063d28 libata: fix length validation of ATAPI-relayed SCSI
>>>> commands
>>>>      15a4417cc652 Bluetooth: btusb: Fix quirk for Atheros 1525/QCA6174
>>>>      cd3141c02404 Bluetooth: btusb: Add Dell OptiPlex 3060 to
>>>> btusb_needs_reset_resume_table
>>>>      3a64bcc3e67a Bluetooth: btusb: Remove Yoga 920 from the
>>>> btusb_needs_reset_resume_table
>>>>      b64ffeecfbdd pinctrl: samsung: Validate alias coming from DT
>>>>      a1da0548a932 Drivers: hv: vmbus: Fix ring buffer signaling
>>>>      8f59abbdeb9d RDMA/mlx5: Fix crash while accessing garbage pointer and
>>>> freed memory
>>>>      9efd9903f561 clk: sunxi-ng: a31: Fix CLK_OUT_* clock ops
>>>>      55306d632ab8 clk: bcm2835: Protect sections updating shared registers
>>>>      2eb67f85d55b clk: bcm2835: Fix ana->maskX definitions
>>>>      ef006d43bc61 lockdep: fix fs_reclaim warning
>>>>      a05b610534a9 ahci: Add PCI-id for the Highpoint Rocketraid 644L card
>>>>      8f5f582cabd7 PCI: Add function 1 DMA alias quirk for Highpoint
>>>> RocketRAID 644L
>>>>      aa26895af31b mmc: dw_mmc: fix falling from idmac to PIO mode when
>>>> dw_mci_reset occurs
>>>>      a592984e03e6 mmc: dw_mmc: exynos: fix the suspend/resume issue for
>>>> exynos5433
>>>>      23a8825aea65 mmc: dw_mmc: Fix the DTO/CTO timeout overflow
>>>> calculation for 32-bit systems
>>>>      72439a30c096 mmc: block: fix updating ext_csd caches on ioctl call
>>>>      39254113845c mmc: core: Disable HPI for certain Micron (Numonyx) eMMC
>>>> cards
>>>>      fcc71c97a384 mmc: core: Fix tracepoint print of blk_addr and blksz
>>>>      856da5e097e0 ALSA: hda/realtek - Always immediately update mute LED
>>>> with pin VREF
>>>>      7a42d11ab86e ALSA: hda/realtek - Fix Dell headset Mic can't record
>>>>      dc9d942e45c0 ALSA: hda/realtek - Fix speaker no sound after system
>>>> resume
>>>>      8d49f5625eda ALSA: hda - Force polling mode on CFL for fixing codec
>>>> communication
>>>>      88079d335aac ALSA: aloop: Fix access to not-yet-ready substream via
>>>> cable
>>>>      1fcbcfff716f ALSA: aloop: Sync stale timer before release
>>>>      3aa7360be333 ALSA: usb-audio: Fix parsing descriptor of UAC2
>>>> processing unit
>>>>      2b706310e520 iio: adc: meson-saradc: unlock on error in
>>>> meson_sar_adc_lock()
>>>>      d1138478e071 iio: st_pressure: st_accel: pass correct platform data
>>>> to init
>>>>      f81b0e627b67 iio: chemical: ccs811: Corrected firmware
>>>> boot/application mode transition
>>>>      ea26b66f10cb MIPS: lantiq: ase: Enable MFD_SYSCON
>>>>      124532fc3c28 MIPS: lantiq: Enable AHB Bus for USB
>>>>      8b23936074d9 MIPS: lantiq: Fix Danube USB clock
>>>>      e73ac1875971 MIPS: ralink: Fix booting on MT7621
>>>>      fb45c56ebd0f MIPS: ralink: Remove ralink_halt()
>>>>      de8cdc557231 Linux 4.14.30
>>>>      5019b23699f4 RDMA/vmw_pvrdma: Fix usage of user response structures
>>>> in ABI file
>>>>      957435b566c9 kbuild: fix linker feature test macros when cross
>>>> compiling with Clang
>>>>      e82496fbe3a0 RDMA/ucma: Don't allow join attempts for unsupported AF
>>>> family
>>>>      ce3e82c0630f RDMA/ucma: Fix access to non-initialized CM_ID object
>>>>      712b442c68c2 clk: migrate the count of orphaned clocks at init
>>>>      02db484a0583 RDMA/core: Do not use invalid destination in determining
>>>> port reuse
>>>>      8b0c4a2e04f7 serial: 8250_pci: Don't fail on multiport card class
>>>>      00fb52a3828d IB/mlx5: Fix out-of-bounds read in
>>>> create_raw_packet_qp_rq
>>>>      cf1eb16eef13 IB/mlx5: Fix integer overflows in mlx5_ib_create_srq
>>>>      3748694f1b91 scsi: mpt3sas: wait for and flush running commands on
>>>> shutdown/unload
>>>>      9d72b2696e0a scsi: mpt3sas: fix oops in error handlers after
>>>> shutdown/unload
>>>>      0493d72ee4d6 dmaengine: ti-dma-crossbar: Fix event mapping for
>>>> TPCC_EVT_MUX_60_63
>>>>      e618ff1ac59c crypto: artpec6 - set correct iv size for gcm(aes)
>>>>      53555c8fc8a2 clk: si5351: Rename internal plls to avoid name
>>>> collisions
>>>>      fa97cdb4c71e clk: axi-clkgen: Correctly handle nocount bit in
>>>> recalc_rate()
>>>>      9e9d9b1a3dbf clk: Don't touch hardware when reparenting during
>>>> registration
>>>>      24c92f975cb2 clk: at91: pmc: Wait for clocks when resuming
>>>>      14d920fc4579 nfsd4: permit layoutget of executable-only files
>>>>      1de82078a0c0 ARM: dts: aspeed-evb: Add unit name to memory node
>>>>      e434a6eaed8c RDMA/ocrdma: Fix permissions for OCRDMA_RESET_STATS
>>>>      7b7e076f8cad scsi: lpfc: Fix issues connecting with nvme initiator
>>>>      1626beb0b5d8 scsi: lpfc: Fix SCSI LUN discovery when SCSI and NVME
>>>> enabled
>>>>      6f4649f3bef8 soc: qcom: smsm: fix child-node lookup
>>>>      f1f225794a41 ip_gre: fix potential memory leak in erspan_rcv
>>>>      9cd6c84e9377 ip_gre: fix error path when erspan_rcv failed
>>>>      e6cfc525163e ip6_vti: adjust vti mtu according to mtu of lower device
>>>>      f2b32ce1ccef iommu/vt-d: clean up pr_irq if request_threaded_irq
>>>> fails
>>>>      915bd53d68f6 pinctrl: rockchip: enable clock when reading pin
>>>> direction register
>>>>      130e535210ba pinctrl: Really force states during suspend/resume
>>>>      06299bd0cf73 media: davinci: fix a debug printk
>>>>      fea718819c69 PCI: rcar: Handle
>>>> rcar_pcie_parse_request_of_pci_ranges() failures
>>>>      e1645629785b PCI: endpoint: Fix find_first_zero_bit() usage
>>>>      194b5ce11968 PCI: designware-ep: Fix ->get_msi() to check MSI_EN bit
>>>>      d67d7bf8f12d coresight: Fix disabling of CoreSight TPIU
>>>>      f16a65befe74 pty: cancel pty slave port buf's work in tty_release
>>>>      728e120d1786 drm/omap: DMM: Check for DMM readiness after successful
>>>> transaction commit
>>>>      9967208b4f6c mmc: sdhci-xenon: wait 5ms after set 1.8V signal enable
>>>>      83a2960ff6d1 omapdrm: panel: fix compatible vendor string for
>>>> td028ttec1
>>>>      f7eda23c2990 vgacon: Set VGA struct resource types
>>>>      58668d153baf iser-target: avoid reinitializing rdma contexts for
>>>> isert commands
>>>>      a3e4b8fe6479 IB/umem: Fix use of npages/nmap fields
>>>>      251695a39f05 RDMA/cma: Use correct size when writing netlink stats
>>>>      a4ac7cb593ad IB/ipoib: Avoid memory leak if the SA returns a
>>>> different DGID
>>>>      9766562956fd rtc: ac100: Fix multiple race conditions
>>>>      badf37254bc7 media: s5p-mfc: Fix lock contention - request_firmware()
>>>> once
>>>>      639dab36edbd sfp: fix non-detection of PHY
>>>>      1a6610de8c1b sfp: fix EEPROM reading in the case of non-SFF8472 SFPs
>>>>      1b485793ce84 net: phy: meson-gxl: check phy_write return value
>>>>      ea60e54b22aa /dev/mem: Add bounce buffer for copy-out
>>>>      79a49fcc0768 mmc: block: fix logical error to avoid memory leak
>>>>      9dd93e524955 mmc: avoid removing non-removable hosts during suspend
>>>>      c1326c691f4d drm/tilcdc: ensure nonatomic iowrite64 is not used
>>>>      e2a6f2967f67 dmaengine: zynqmp_dma: Fix race condition in the probe
>>>>      f4a0f85594ba platform/chrome: Use proper protocol transfer function
>>>>      71233e2541a4 watchdog: Fix kref imbalance seen if
>>>> handle_boot_enabled=0
>>>>      08b810901020 watchdog: Fix potential kref imbalance when opening
>>>> watchdog
>>>>      008029510ac8 cros_ec: fix nul-termination for firmware build info
>>>>      79c3f5cf466d serial: 8250_dw: Disable clock on error
>>>>      f1be26620373 tty: goldfish: Enable 'earlycon' only if built-in
>>>>      5ff0741646fd qmi_wwan: set FLAG_SEND_ZLP to avoid network initiated
>>>> disconnect
>>>>      a9a14b17f72c media: [RESEND] media: dvb-frontends: Add delay to
>>>> Si2168 restart
>>>>      057ee30417e5 ath10k: handling qos at STA side based on AP WMM
>>>> enable/disable
>>>>      824f8613ea62 media: bt8xx: Fix err 'bt878_probe()'
>>>>      2159db50a572 rtlwifi: always initialize variables given to RT_TRACE()
>>>>      9f180c6db58e rtlwifi: rtl_pci: Fix the bug when inactiveps is
>>>> enabled.
>>>>      9854881c225a spi: sh-msiof: Avoid writing to registers from
>>>> spi_master.setup()
>>>>      6467b3e25447 hv_netvsc: Fix the TX/RX buffer default sizes
>>>>      8dc11c413557 hv_netvsc: Fix the receive buffer size limit
>>>>      e53e85d5082c RDMA/iwpm: Fix uninitialized error code in
>>>> iwpm_send_mapinfo()
>>>>      4df82a41e819 drm/msm: fix leak in failed get_pages
>>>>      b3cff08483d0 media: c8sectpfe: fix potential NULL pointer dereference
>>>> in c8sectpfe_timer_interrupt
>>>>      b453f9d8c55e cpufreq: longhaul: Revert transition_delay_us to 200 ms
>>>>      e59e19dc4086 Bluetooth: btqcomsmd: Fix skb double free corruption
>>>>      5b58533858e3 Bluetooth: hci_qca: Avoid setup failure on missing
>>>> rampatch
>>>>      23081c335df9 staging: android: ashmem: Fix possible deadlock in
>>>> ashmem_ioctl
>>>>      23e73e2ab4d2 scsi: megaraid_sas: Do not use 32-bit atomic request
>>>> descriptor for Ventura controllers
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
>>>>    meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
>>>>    meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20
>>>> ++++++++++----------
>>>>    3 files changed, 16 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>>> index 81306a984262..5829fe00fd96 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>>> @@ -11,13 +11,13 @@ python () {
>>>>            raise bb.parse.SkipRecipe("Set
>>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>>>    }
>>>>
>>>> -SRCREV_machine ?= "7272e9132fdaaf0dd78bc94e9f297aaf73452982"
>>>> -SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
>>>> +SRCREV_machine ?= "edcd1a1cbc535ff827e682fa8e78a11f60efc03f"
>>>> +SRCREV_meta ?= "0a24859cef9c3352aa3bf153d202cece587caf24"
>>>>
>>>>    SRC_URI =
>>>> "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>>>>
>>>> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
>>>>
>>>> -LINUX_VERSION ?= "4.14.30"
>>>> +LINUX_VERSION ?= "4.14.40"
>>>>
>>>>    DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
>>>> d)}"
>>>>    DEPENDS += "openssl-native util-linux-native"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>>>> index 34bee0949fc9..a9196e3dc10a 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>>>> @@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
>>>>
>>>>    require recipes-kernel/linux/linux-yocto.inc
>>>>
>>>> -LINUX_VERSION ?= "4.14.30"
>>>> +LINUX_VERSION ?= "4.14.40"
>>>>
>>>>    DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
>>>> d)}"
>>>>    DEPENDS += "openssl-native util-linux-native"
>>>> @@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
>>>>    KMETA = "kernel-meta"
>>>>    KCONF_BSP_AUDIT_LEVEL = "2"
>>>>
>>>> -SRCREV_machine ?= "ad31896630f8bf6a459164263adc0a8faf984d9e"
>>>> -SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
>>>> +SRCREV_machine ?= "0cdc68d3404d2738d43e9e22b572814e238dae3f"
>>>> +SRCREV_meta ?= "0a24859cef9c3352aa3bf153d202cece587caf24"
>>>>
>>>>    PV = "${LINUX_VERSION}+git${SRCPV}"
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>>>> index 16142f8ceb47..28812484dda2 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>>>> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
>>>>    KBRANCH_qemux86-64 ?= "v4.14/standard/base"
>>>>    KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
>>>>
>>>> -SRCREV_machine_qemuarm ?= "d6268fc3460d3904fd49087f7a822efbaab9bfe8"
>>>> -SRCREV_machine_qemuarm64 ?= "c94189843b8ad62cafe9a307e7f7d60741690505"
>>>> -SRCREV_machine_qemumips ?= "4afd92347b2b35dc8e0006712f8fa00ac57f2a36"
>>>> -SRCREV_machine_qemuppc ?= "e8af5c9b65c5187d148ecd11bd7979489460ca64"
>>>> -SRCREV_machine_qemux86 ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>>>> -SRCREV_machine_qemux86-64 ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>>>> -SRCREV_machine_qemumips64 ?= "9863b327e770b42b8c18da3e0cfaf06e8f99ae97"
>>>> -SRCREV_machine ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>>>> -SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
>>>> +SRCREV_machine_qemuarm ?= "0270dc3fc64e8df96067a5cc0d3cdcc7da448967"
>>>> +SRCREV_machine_qemuarm64 ?= "cc01b6df5e42a636339020123f9e36e76feb217a"
>>>> +SRCREV_machine_qemumips ?= "7100705d087727cec0f353b430910dbd56c0b14f"
>>>> +SRCREV_machine_qemuppc ?= "9e2c25e06bd9b9c799c0c7103566d587fdd16858"
>>>> +SRCREV_machine_qemux86 ?= "3a3979936c8a3b70488af80a7dcadd41e2480603"
>>>> +SRCREV_machine_qemux86-64 ?= "3a3979936c8a3b70488af80a7dcadd41e2480603"
>>>> +SRCREV_machine_qemumips64 ?= "149f8eee22d52a287994c1d0c54d4d37631629ef"
>>>> +SRCREV_machine ?= "3a3979936c8a3b70488af80a7dcadd41e2480603"
>>>> +SRCREV_meta ?= "0a24859cef9c3352aa3bf153d202cece587caf24"
>>>>
>>>>    SRC_URI =
>>>> "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};
>>>> \
>>>>
>>>> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
>>>>
>>>> -LINUX_VERSION ?= "4.14.30"


