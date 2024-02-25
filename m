Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E59C54E51
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:03 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.7503.1708897981216387971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LJGHJw4x;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-36576cf5fe0so6807595ab.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897980; x=1709502780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eakHZzmOa1iKrYncRXIXl0/+o66S0udGQ+3wUS70+k4=;
        b=LJGHJw4xUFLqoQZwwINhjkarP2f2D5eBPSrCjDKnWYJRW0Wji6cziy93kw15qrMUwN
         p3+0Ic7ECrfQNx4bMuZUoMDuMUtxTlojG3bdBa2h9O9TMVsE4Zc+mvysYSC6cgJYnhJH
         O7etcZBONYGYzJPESEfK6I0IykPUBBCeTB7t2KnXPdsIAVekGvmC4ZcN3epOzVY+rAGn
         zT9Zo/Cb0ZIkmy8jaFw1QnNkgm/AkmXVbTA3bjFUIrNoGVeoW1TyzSFIdEVtqIqayDK5
         lmL53oOboHnZhZNJasgr7GaqT3zzQf4VPdYwrLkBrttYa9PAnzQOE6uminCNhT9FqZat
         rlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897980; x=1709502780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eakHZzmOa1iKrYncRXIXl0/+o66S0udGQ+3wUS70+k4=;
        b=KiTrQryFktK7w1uByM7FCN+KpGh58WPvAz6OoqLA5xM1OQXixcCaNo15E70Gwbw+qr
         DgxW8YGrFNbka8bElMCfTv1Fy99fGdKENbdCY0mK51SmC6kH9E+Hg/iOn5ru2N+iWkJM
         EntxIHTfTPZw0mSM4eXzAuneoCiO4UBQptvbbGI94AqydPcOQbh9nKk4iDm3YWdlCzUI
         AzhqpbApac/3rgJ9nyyO1SWXmrR5xJKkSZuvhRWDIojtNrfGPbv5IBiDB5visCYDKg85
         Mw75zVg1vyLo6hU9LgNI3D+k9W4SjKMFQwhAW0XJZRUTLYLvvEAHfhKwL7BBV007xF7b
         3wTA==
X-Gm-Message-State: AOJu0Yz8yFmaovHP3DKzb5E5smyfxUd9I33/IruJ6yipwEEgDPAiH+RL
	UnC3wdAR0sJbqAfrwIWHz81ZbDmI0wy/KiMSYQdBmpzWi4q42w7AoPJcbFWSfVMH3DjlO67dRkD
	bKJ6/Ng==
X-Google-Smtp-Source: AGHT+IHC5DBo2duf84bitdsXaYxfY7TPxSOBsTQt/gwCsIiySf0KmHF7c08RfvHx3apuyuwyH65tmg==
X-Received: by 2002:a92:c80e:0:b0:365:149:d09e with SMTP id v14-20020a92c80e000000b003650149d09emr6527844iln.10.1708897979868;
        Sun, 25 Feb 2024 13:52:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.52.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:52:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/22] linux-yocto/5.10: update to v5.10.205
Date: Sun, 25 Feb 2024 11:52:24 -1000
Message-Id: <a1b6f991484529756f8e86c5af3391aef39d6e6e.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196157

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ca4427ebc626 Linux 5.10.205
    05c547e8427a powerpc/ftrace: Fix stack teardown in ftrace_no_trace
    e30e62f0e178 powerpc/ftrace: Create a dummy stackframe to fix stack unwind
    5a82cf64f8ad tty: n_gsm: add sanity check for gsm->receive in gsm_receive_buf()
    a11ea2c08f51 tty: n_gsm, remove duplicates of parameters
    b8faa754b523 tty: n_gsm: fix tty registration before control channel open
    918ba07224e9 USB: gadget: core: adjust uevent timing on gadget unbind
    20c2cb79a38c ring-buffer: Fix a race in rb_time_cmpxchg() for 32 bit archs
    9f5bf009f77d ring-buffer: Fix writing to the buffer with max_data_size
    3e8055fc3b21 ring-buffer: Have saved event hold the entire event
    d7a293981427 tracing: Update snapshot buffer on resize if it is allocated
    a3580b2bfe90 ring-buffer: Fix memory leak of free page
    5ffda6998be5 team: Fix use-after-free when an option instance allocation fails
    33fb8ac30c3e arm64: mm: Always make sw-dirty PTEs hw-dirty in pte_modify
    26eeec522aca ext4: prevent the normalized size from exceeding EXT_MAX_BLOCKS
    6e2628dfade5 soundwire: stream: fix NULL pointer dereference for multi_link
    7ccfc078cd47 perf: Fix perf_event_validate_size() lockdep splat
    5984306f6ce7 HID: hid-asus: add const to read-only outgoing usb buffer
    e9709a88a8ee net: usb: qmi_wwan: claim interface 4 for ZTE MF290
    09c8ee5f9bb3 asm-generic: qspinlock: fix queued_spin_value_unlocked() implementation
    f6a1bf429978 HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
    744027bb8ee0 HID: hid-asus: reset the backlight brightness level on resume
    1ac7379d2e18 HID: add ALWAYS_POLL quirk for Apple kb
    a64a9f38ae3e HID: glorious: fix Glorious Model I HID report
    6026a862f351 platform/x86: intel_telemetry: Fix kernel doc descriptions
    e01135763b9b bcache: avoid NULL checking to c->root in run_cache_set()
    a7555524e325 bcache: add code comments for bch_btree_node_get() and __bch_btree_node_alloc()
    3b48e1c0485a bcache: remove redundant assignment to variable cur_idx
    ea2341d08255 bcache: avoid oversize memory allocation by small stripe_size
    dbf0cdacdb4e blk-throttle: fix lockdep warning of "cgroup_mutex or RCU read lock required!"
    d69581c17608 usb: aqc111: check packet for fixup for true limit
    1e3ea8d2bad8 drm/mediatek: Add spinlock for setting vblank event in atomic_begin
    022b82336a62 PCI: loongson: Limit MRRS to 256
    791bca1b0996 Revert "PCI: acpiphp: Reassign resources on bridge if necessary"
    7e2afd088506 ALSA: hda/realtek: Apply mute LED quirk for HP15-db
    063302851147 ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants
    851783a0c4ff fuse: dax: set fc->dax to NULL in fuse_dax_conn_free()
    2623cf1fe825 cred: switch to using atomic_long_t
    03b50868ae53 net: atlantic: fix double free in ring reinit logic
    a232eb81c7cb appletalk: Fix Use-After-Free in atalk_ioctl
    9deccfbaed4b net: stmmac: Handle disabled MDIO busses from devicetree
    5470533a7d7e net: stmmac: use dev_err_probe() for reporting mdio bus registration failure
    52a4c0e82a24 vsock/virtio: Fix unsigned integer wrap around in virtio_transport_has_space()
    4c0d7e826160 sign-file: Fix incorrect return values check
    25bfae19b84a net: ena: Fix XDP redirection error
    c83544b70cc8 net: ena: Destroy correct number of xdp queues upon failure
    7ed59c4027a8 net: Remove acked SYN flag from packet in the transmit queue correctly
    10760f4234f7 qed: Fix a potential use-after-free in qed_cxt_tables_alloc
    7eda5960a533 net/rose: Fix Use-After-Free in rose_ioctl
    64a032015c33 atm: Fix Use-After-Free in do_vcc_ioctl
    c20f425e0692 net: fec: correct queue selection
    d15e4b825dc0 net: vlan: introduce skb_vlan_eth_hdr()
    bc0860a3c49c atm: solos-pci: Fix potential deadlock on &tx_queue_lock
    df5c24df63c4 atm: solos-pci: Fix potential deadlock on &cli_queue_lock
    6a7b673e6ec7 qca_spi: Fix reset behavior
    347d10877bde qca_debug: Fix ethtool -G iface tx behavior
    a07e5568d95f qca_debug: Prevent crash on TX ring changes
    97275e470c2a net: ipv6: support reporting otherwise unknown prefix flags in RTM_NEWPREFIX
    b30fbeb390d0 HID: lenovo: Restrict detection of patched firmware only to USB cptkbd
    84eed654ff33 afs: Fix refcount underflow from error handling race
    8ee7b2c46594 netfilter: nf_tables: fix 'exist' matching on bigendian arches
    b50306f77190 Linux 5.10.204
    fa49e956b725 r8169: fix rtl8125b PAUSE frames blasting when suspended
    9e3ca02b1164 devcoredump: Send uevent once devcd is ready
    9e0ca920123f devcoredump : Serialize devcd_del work
    12467ad3f3d4 smb: client: fix potential NULL deref in parse_dfs_referrals()
    0b1711b486de cifs: Fix non-availability of dedup breaking generic/304
    8cb1209989fb Revert "btrfs: add dmesg output for first mount and last unmount of a filesystem"
    d7c3a467f47a mmc: block: Be sure to wait while busy in CQE error recovery
    91b70f60c8e5 platform/x86: asus-wmi: Document the dgpu_disable sysfs attribute
    a8b781c410a5 tools headers UAPI: Sync linux/perf_event.h with the kernel sources
    bdb26b819955 platform/x86: asus-wmi: Fix kbd_dock_devid tablet-switch reporting
    bf72b44fe81b netfilter: nft_set_pipapo: skip inactive elements during set walk
    e844a9309f51 drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group
    ad2223a16925 psample: Require 'CAP_NET_ADMIN' when joining "packets" group
    015870c10c45 genetlink: add CAP_NET_ADMIN test for multicast bind
    df6cb4c43098 netlink: don't call ->netlink_bind with table lock held
    3fe1ea5f921b io_uring/af_unix: disable sending io_uring over sockets
    3ee7e2faef87 MIPS: Loongson64: Enable DMA noncoherent support
    ff803322e935 MIPS: Loongson64: Reserve vgabios memory on boot
    e0e897ddf392 KVM: s390/mm: Properly reset no-dat
    ab8816a7c2c6 x86/CPU/AMD: Check vendor in the AMD microcode callback
    6059c313ff9c serial: 8250_omap: Add earlycon support for the AM654 UART controller
    8ffaaf80c64c serial: 8250: 8250_omap: Do not start RX DMA on THRI interrupt
    b74ace5dec53 serial: 8250: 8250_omap: Clear UART_HAS_RHR_IT_DIS bit
    863bacf3a3f3 serial: sc16is7xx: address RX timeout interrupt errata
    e4ed3247465e ARM: PL011: Fix DMA support
    713f6ff32651 usb: typec: class: fix typec_altmode_put_partner to put plugs
    f16d5355aab7 Revert "xhci: Loosen RPM as default policy to cover for AMD xHC 1.1"
    9caaf469afd4 parport: Add support for Brainboxes IX/UC/PX parallel cards
    558b6a436832 usb: gadget: f_hid: fix report descriptor allocation
    d4fb20dcc13b drm/amdgpu: correct the amdgpu runtime dereference usage count
    b5862e5ca58f gpiolib: sysfs: Fix error handling on failed export
    208dd116f96e perf: Fix perf_event_validate_size()
    8bd3d61624d5 perf/core: Add a new read format to get a number of lost samples
    f460ff26bd99 tracing: Stop current tracer when resizing buffer
    21beb0d86ff0 tracing: Set actual size after ring buffer resize
    7123b54c8b5f ring-buffer: Force absolute timestamp on discard of event
    bceeaa5cdace misc: mei: client.c: fix problem of return '-EOVERFLOW' in mei_cl_write
    ee2719b59fb4 misc: mei: client.c: return negative error code in mei_cl_write
    3cd3eea1f745 arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
    7f6daf9ee3e7 arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
    0a9f3e1f570f arm64: dts: mediatek: mt7622: fix memory node warning check
    9bceffa42320 packet: Move reference count in packet_sock to atomic_long_t
    0d0564cfb746 tracing: Fix a possible race when disabling buffered events
    85e86d6989aa tracing: Fix incomplete locking when disabling buffered events
    ad9efb0b275a tracing: Disable snapshot buffer when stopping instance tracers
    97c2b3b2329d tracing: Always update snapshot buffer size
    2f7368f336ee checkstack: fix printed address
    35a7f92507dc nilfs2: prevent WARNING in nilfs_sufile_set_segment_usage()
    8df769d92b1c nilfs2: fix missing error check for sb_set_blocksize call
    3764b24499e8 ALSA: hda/realtek: Enable headset on Lenovo M90 Gen5
    0ff1c0f5a45f ALSA: pcm: fix out-of-bounds in snd_pcm_state_names
    1f1c2a3452fb riscv: fix misaligned access handling of C.SWSP and C.SDSP
    cb3543fdaac1 ARM: dts: imx7: Declare timers compatible with fsl,imx6dl-gpt
    f337ccfa9f6d ARM: imx: Check return value of devm_kasprintf in imx_mmdc_perf_init
    04769017dec9 scsi: be2iscsi: Fix a memleak in beiscsi_init_wrb_handle()
    a28083d41c90 tracing: Fix a warning when allocating buffered events fails
    888580bfaaf5 ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate
    9dfd86241815 hwmon: (acpi_power_meter) Fix 4.29 MW bug
    c0a428245a83 RDMA/bnxt_re: Correct module description string
    58a7281feb1a RDMA/rtrs-clt: Remove the warnings for req in_use check
    02916f39b8e8 arm64: dts: rockchip: Expand reg size of vdec node for RK3399
    a953e45ebeae tee: optee: Fix supplicant based device enumeration
    3c852b26a55e bpf: sockmap, updating the sg structure should also update curr
    b17a886ed29f tcp: do not accept ACK of bytes we never sent
    f1a6a94912f8 netfilter: xt_owner: Fix for unsafe access of sk->sk_socket
    e94b6e964018 net: hns: fix fake link up on xge port
    f25356834830 ipv4: ip_gre: Avoid skb_pull() failure in ipgre_xmit()
    860d53a347e4 ionic: Fix dim work handling in split interrupt mode
    b41bf6ac2485 ionic: fix snprintf format length warning
    49809af89c07 net: bnxt: fix a potential use-after-free in bnxt_init_tc
    2093072ed72b i40e: Fix unexpected MFS warning message
    d54f5a5bc85a arcnet: restoring support for multiple Sohard Arcnet cards
    effb9ad00447 net: arcnet: com20020 fix error handling
    a657bddfb4c5 mlxbf-bootctl: correctly identify secure boot with development keys
    d3f479283687 hv_netvsc: rndis_filter needs to select NLS
    909de62207ea octeontx2-pf: Add missing mutex lock in otx2_get_pauseparam
    7827c1802dac ipv6: fix potential NULL deref in fib6_add()
    ba6dc2f56441 of: dynamic: Fix of_reconfig_get_state_change() return value documentation
    08dbdacbfe2e of: Add missing 'Return' section in kerneldoc comments
    f58e3b3652fc of: Fix kerneldoc output formatting
    58ccdcc9d720 of: base: Fix some formatting issues and provide missing descriptions
    7db515e82ab5 platform/x86: asus-wmi: Move i8042 filter install to shared asus-wmi code
    5fe052b8fa4b platform/x86: asus-wmi: Simplify tablet-mode-switch handling
    a113da75908b platform/x86: asus-wmi: Simplify tablet-mode-switch probing
    68b795d04007 platform/x86: asus-wmi: Add support for ROG X13 tablet mode
    97620a08fc1b platform/x86: asus-wmi: Adjust tablet/lidflip handling to use enum
    ada7c5cc697b asus-wmi: Add dgpu disable method
    3a8fc16d5e78 platform/x86: asus-nb-wmi: Add tablet_mode_sw=lid-flip quirk for the TP200s
    79b863382043 platform/x86: asus-nb-wmi: Allow configuring SW_TABLET_MODE method with a module option
    9a861dde99cb platform/x86: asus-wmi: Add support for SW_TABLET_MODE on UX360
    13b1fa540794 drm/amdgpu: correct chunk_ptr to a pointer to chunk.
    8887047de358 kconfig: fix memory leak from range properties
    96d55414304a tg3: Increment tx_dropped in tg3_tso_bug()
    9068403d9465 tg3: Move the [rt]x_dropped counters to tg3_napi
    e7152a138a5a netfilter: ipset: fix race condition between swap/destroy and kernel side add/del/test
    348111c3be90 i2c: designware: Fix corrupted memory seen in the ISR
    7f4c89400d29 hrtimers: Push pending hrtimers away from outgoing CPU earlier

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index afee028bca..f208e23603 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dae7d2a31e1d51235fd140f8996f824d24bde30d"
+SRCREV_machine ?= "26e9b120876a03baa8fed8bf2932be84720ac0a4"
 SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.203"
+LINUX_VERSION ?= "5.10.205"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8acca49a26..2f8da6c9d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.203"
+LINUX_VERSION ?= "5.10.205"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "acb5e9943bafc31efab317b65f953495ed1f8c5a"
-SRCREV_machine ?= "bd5abfdd442e76bd9995f33715900b93a453f314"
+SRCREV_machine:qemuarm ?= "edc2a17c5d9e6b79ee236576d290c01f6954c668"
+SRCREV_machine ?= "b92447a12f8948eb4b225ea8381a3fd7f68eb95a"
 SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index bcc64d1b8e..39c73167b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "39cae61353af17de2545a90364671d4f26517a55"
-SRCREV_machine:qemuarm64 ?= "96080ff8f5a71453314726aff5f9b0c30c688221"
-SRCREV_machine:qemumips ?= "72edcadbefefb3d83416bf6c400fe993189c8557"
-SRCREV_machine:qemuppc ?= "b0f6660e4016dbe1611a6872f30302b90ea02b37"
-SRCREV_machine:qemuriscv64 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
-SRCREV_machine:qemuriscv32 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
-SRCREV_machine:qemux86 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
-SRCREV_machine:qemux86-64 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
-SRCREV_machine:qemumips64 ?= "7bee374027681d303214f33f6461fe7dca6b13fc"
-SRCREV_machine ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
+SRCREV_machine:qemuarm ?= "5dcb45e1013a50afd74d45251c53adcc11e49c43"
+SRCREV_machine:qemuarm64 ?= "f30706a152e40f416d1a917e903f910e1d9f750d"
+SRCREV_machine:qemumips ?= "667e97ccdf32c32d43e65478a3d6de906f4c32ba"
+SRCREV_machine:qemuppc ?= "1c961b6a76a0a3943877f957d82fe4015dd01299"
+SRCREV_machine:qemuriscv64 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
+SRCREV_machine:qemuriscv32 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
+SRCREV_machine:qemux86 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
+SRCREV_machine:qemux86-64 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
+SRCREV_machine:qemumips64 ?= "c8120c253335d4e2d043d21aee1ae53a85f2811c"
+SRCREV_machine ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
 SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.203"
+LINUX_VERSION ?= "5.10.205"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


