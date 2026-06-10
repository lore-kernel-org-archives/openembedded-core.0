Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECCACD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:47:52 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25149.1781110066702529339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B9KIWc7A;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5177945a22eso47771611cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110066; x=1781714866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHk0fk9xdjS8onrNoyPfXKYelCjAL5xiZAQq9xP9wo0=;
        b=B9KIWc7AFIqiXXb79z+ZdICkxeVNZHO086MkBK0TPPaid4FIW4KGFk7GcYWWSJIJgN
         +qjHDkWymASz8mGETm89+TDnKAgogNOZYokOJ7HCCqw9ep8ihNyPHZihDQxYty0d2yIV
         /m76rlGV2Wr4iZcbjbvWa8VXJ8iSLWgn7wZRxDbKCUy5C+z4NvYmfS+HJ2SJ58PZt+FP
         9eFY9i7b9dKD4U9guLUiiBgFQm7oVOfTdqn7WOKZ0L2tVno7+erSJrTqG0Nl9LnpkaYZ
         LVXBDPC5kPhsSqOkcpz4NJRp3UFuuhhzpswEPQ3FyaXVe1yZibypdFym1FhyagU+/zk5
         jWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110066; x=1781714866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHk0fk9xdjS8onrNoyPfXKYelCjAL5xiZAQq9xP9wo0=;
        b=ssx0+wwTmxV1CGw34vUSjZvZH/hRaPyAcLINZPNJDnxdoiSYRVXE7QQunK6LgE/qWH
         ttJWGgFj/aa9fryf8uqnBr49exNOiz8vz1d7t8O7o5h2CGmKpFMkmFH0lOD94uAb7te1
         DeZ4rpDKM2zs/CiTUoOzp9Yoe5nye0LWiuPt2zcMcBkXjig0BcekJwc0k/9SS2FM5LYy
         4QXAMKBXtOsJVHj5xWO5QBGXeLHaF4kGSdsJg+dHNhxG1gwLZzapM1Xb0spg9oF5HI7L
         D5EBkZbaTgrV+8A7VvnrcuoChqYmDndwMbaGbGSFN0jGMCDbWGDAN+jR6QHNzp1016sz
         POkg==
X-Gm-Message-State: AOJu0Yyus20NkEuXul9bTnsXG9bHyas8SvDZvgYmhG84cuZTaHM7RY+m
	TVrZKHpnGRv4fspyblVV0HwI8EYRbsIsByD/wp9MTo8Od09z38uvdPGkrbDIB264
X-Gm-Gg: Acq92OEzyxk4y3kLmmimy4zdVPLORTbzmIhAHHRm5gfFMnM2DC+LRS+BqNa/7kwXiXS
	vcobgHEdJnE78iDsM5W7fBTUNytpN19h1UxqEHxv7Arep3g7oyYwZmuCofTSi7u6PjYQoLi/pOa
	F7k2dY21Kuk6sIvsP3PXe1W3L+trkRXTxGS1e59K1w25Q9+4/FWYdTMX01w5Ygy7FgzC7rx4Cme
	vvFd/m2x7/ikQocdrODIKBuST/Z9jCXOCkw8k+YEUK4faVkrnW9WPEO6i/H5awy6nDC12cZod1g
	DRDmb/Ks6N7MKCsK30aesElkfx9LojVv0CtpKvmPdlBcDgV2z9N3JHLNaofdgtkEEJX8zGXW9rO
	iTXLygKLm7uE/PtXHHH7F4GtijuPOBLQf4pDGOvsu6euWDYny6YgeazG12zQUPFqjmmCeW257qy
	0u+KEDEuJfFPRAjSN64Pz9hTIumS6f5K3ck2ZUM1zQkOD7dhpBMruM16040e61f2jhTN3ZI5o9H
	brWSo+pfChJsKlCxleRkUt8AT+q00V7enpYb8Y7TYRPLQa/u3APUNbtSU/eeGsaX/E55IZWqxmf
	ozGH3BDTsOoGshy+QBPasRJQyPg4+4xuitS8+1YQ82U5UKQ0SA4XurA=
X-Received: by 2002:a05:622a:1794:b0:517:899b:7f76 with SMTP id d75a77b69052e-51795be1484mr388503591cf.35.1781110065228;
        Wed, 10 Jun 2026 09:47:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775d9efa1sm214422401cf.20.2026.06.10.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:47:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 04/04] yocto-bsps: update to v6.18.35
Date: Wed, 10 Jun 2026 12:47:37 -0400
Message-ID: <20260610164737.1869790-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610164737.1869790-1-bruce.ashfield@gmail.com>
References: <20260610164737.1869790-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238376

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    acb7cf4c1184 Linux 6.18.35
    918450ad6010 KVM: arm64: Reassign nested_mmus array behind mmu_lock
    2bbc395e81bd KVM: arm64: vgic-its: Drop the translation cache reference only for the erased entry
    adc6fc240a61 tools: ynl: add scope qualifier for definitions
    f54b30f3316a usb: core: Fix SuperSpeed root hub wMaxPacketSize
    830c8a9b467e thunderbolt: property: Cap recursion depth in __tb_property_parse_dir()
    21bfa15a89d8 drm/i915/psr: Use DC_OFF wake reference to block DC6 on vblank enable
    00869f2320dc mailbox: Fix NULL message support in mbox_send_message()
    5372f6f10b0a xhci: tegra: Fix ghost USB device on dual-role port unplug
    58b2c0f096b3 net: phy: micrel: fix LAN8814 QSGMII soft reset
    972ea882d4bf mm/slub: hold cpus_read_lock around flush_rcu_sheaves_on_cache()
    56857385f313 hwmon: (pmbus/adm1266) serialize GPIO PMBus accesses with pmbus_lock
    6b94f9f5fe28 hwmon: (pmbus/adm1266) serialize sequencer_state debugfs read with pmbus_lock
    192516d72774 hwmon: (pmbus) Add support for guarded PMBus lock
    d8fdf33d6fcf USB: serial: mct_u232: fix memory corruption with small endpoint
    062dcc0b324a USB: serial: digi_acceleport: fix memory corruption with small endpoints
    284105c40fc3 USB: serial: cypress_m8: fix memory corruption with small endpoint
    c73c62a4bd52 usb: dwc3: xilinx: fix error handling in zynqmp init error paths
    9327252e0462 xfrm: iptfs: reset runtime state when cloning SAs
    bb50838a2a06 cpufreq: intel_pstate: Use correct scaling factor on Raptor Lake-E
    7cb2daed3509 cpufreq: intel_pstate: Add and use hybrid_get_cpu_type()
    8f72a2509163 mptcp: reset rcv wnd on disconnect
    82e742b9d2cc mptcp: cleanup fallback dummy mapping generation
    0d9b9d7dbef9 octeontx2-pf: avoid double free of pool->stack on AQ init failure
    fe93e907b1af arm64: tlb: Flush walk cache when unsharing PMD tables
    bb37498a99e4 mptcp: do not drop partial packets
    a84164847b1e mptcp: borrow forward memory from subflow
    c67f986fc02c mptcp: handle first subflow closing consistently
    134c517dfa63 net: devmem: reject dma-buf bind with non-page-aligned size or SG length
    b2beed6ad149 selftests: mptcp: drop nanoseconds width specifier
    c5e7d4865292 Bluetooth: hci_qca: Convert timeout from jiffies to ms
    8264178afb5c Bluetooth: hci_qca: Migrate to serdev specific shutdown function
    0acba63d7d46 serdev: Provide a bustype shutdown function
    8bf7dbb741dd rxrpc: Fix RESPONSE packet verification to extract skb to a linear buffer
    46cb765e2e5a rxrpc: Fix DATA decrypt vs splice() by copying data to buffer in recvmsg
    fed725cace3a x86/mm: Disable broadcast TLB flush when PCID is disabled
    81181a39bde9 platform/x86/intel/vsec: Fix enable_cnt imbalance on PCIe error recovery
    1730c91a8b9a platform/x86/intel/vsec: Make driver_data info const
    4b0e87f9b50f platform/x86/intel/vsec: Refactor base_addr handling
    71b88acec0a7 serial: 8250_dw: dispatch SysRq character in dw8250_handle_irq()
    7f8b194ed720 serial: 8250: dispatch SysRq character in serial8250_handle_irq()
    5f2172d799f3 serial: core: introduce guard(uart_port_lock_check_sysrq_irqsave)
    237dc8c08de3 serial: zs: Convert to use a platform device
    81984447eac4 serial: zs: Switch to using channel reset
    b1ceeaef4fbc serial: zs: Fix bootconsole handover lockup
    2ff0401ffdda serial: dz: Convert to use a platform device
    2c5b693d918c serial: dz: Fix bootconsole handover lockup
    24b7be239b0b serial: dz: Fix bootconsole message clobbering at chip reset
    f059b4c493df drm/amdgpu: check num_entries in GEM_OP GET_MAPPING_INFO
    fa372f4e8aef drm/amdgpu: fix calling VM invalidation in amdgpu_hmm_invalidate_gfx
    1eb86334e391 drm/amdgpu: fix lock leak on ENOMEM in AMDGPU_GEM_OP_GET_MAPPING_INFO
    275396bf71c4 drm/amdkfd: Check for pdd drm file first in CRIU restore path
    5cf4a41aa0d7 drm/amdkfd: fix a vulnerability of integer overflow in kfd debugger
    2f9c3c161692 drm/amdkfd: fix NULL pointer bug in svm_range_set_attr
    348e01e64a87 serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
    8e39badab090 serial: zs: Fix swapped RI/DSR modem line transition counting
    10ddd1a320e1 serial: sh-sci: fix memory region release in error path
    654f45a8569f serial: qcom_geni: fix kfifo underflow when flush precedes DMA completion IRQ
    78d0d6f69bd6 serial: qcom-geni: fix UART_RX_PAR_EN bit position
    9a91692fae5c serial: altera_jtaguart: handle uart_add_one_port() failures
    ffa7dce35b64 drm/amd/pm/si: Disregard vblank time when no displays are connected
    c9ae7e7e3bc9 drm/i915: Fix potential UAF in TTM object purge
    fed64e47a32f drm/i915/psr: Block DC states on vblank enable when Panel Replay supported
    0dfa42cfe4db drm/gem: fix race between change_handle and handle_delete
    164dc7bf1760 drm/hyperv: validate VMBus packet size in receive callback
    9c698b2c43c2 drm/hyperv: validate resolution_count and fix WIN8 fallback
    4a3a19c98a82 scsi: target: iscsi: Validate CHAP_R length before base64 decode
    594a40360012 scsi: target: iscsi: Bound iscsi_encode_text_output() appends to rsp_buf
    89c81d1228c0 scsi: target: iscsi: Fix CRC overread and double-free in iscsit_handle_text_cmd()
    35461d237441 scsi: scsi_transport_fc: Widen FPIN pname walker counter to u32
    14dd80a20a72 scsi: fcoe: Reject FIP descriptors with zero fip_dlen in CVL walker
    d548179adcc8 thunderbolt: property: Reject dir_len < 4 to prevent size_t underflow
    31b98e503ecc thunderbolt: property: Reject u32 wrap in tb_property_entry_valid()
    c7d421123b98 usb: gadget: f_fs: serialize DMABUF cancel against request completion
    607730a41477 usb: gadget: f_fs: copy only received bytes on short ep0 read
    5933063935e8 usb: gadget: dummy_hcd: Reject hub port requests for non-existent ports
    f8f5a8f48c7c usb: gadget: composite: fix integer underflow in WebUSB GET_URL handling
    f928630f450b usb: gadget: f_hid: fix device reference leak in hidg_alloc()
    e6f8be12f030 usb: gadget: net2280: Fix double free in probe error path
    caec0145e597 usb: gadget: uvc: hold opts->lock across XU walks in uvc_function_bind
    f06bcaba2970 USB: serial: mct_u232: fix missing interrupt-in transfer sanity check
    6c0cf56f00f2 USB: serial: mxuport: fix memory corruption with small endpoint
    ea2b792330b4 USB: serial: keyspan: fix missing indat transfer sanity check
    ae03453f2c80 USB: serial: cypress_m8: validate interrupt packet headers
    22823a319fb2 USB: serial: belkin_sa: validate interrupt status length
    f7c3fcd63405 USB: serial: option: add missing RSVD(5) flag for Rolling RW135R-GL
    38ba1a464c0d USB: serial: option: add MeiG SRM813Q
    62fbc1396108 usb: typec: ucsi: Don't update power_supply on power role change if not connected
    d62d97c9c8c2 usb: typec: ucsi: Check if power role change actually happened before handling
    f34effb0b545 usb: typec: tcpm: improve handling of DISCOVER_MODES failures
    02d9d8b79e18 usb: typec: tipd: Fix error code in tps6598x_probe()
    a90139ff1eba usb: usbtmc: reject interrupt endpoints with small wMaxPacketSize
    75f6d3da2cc6 usb: usbtmc: check URB actual_length for interrupt-IN notifications
    88d459e5b5a4 usbip: vudc: Fix use after free bug in vudc_remove due to race condition
    5b78d8b9a832 usb: storage: Add quirks for PNY Elite Portable SSD
    94b05aec1985 USB: quirks: add NO_LPM for Lenovo ThinkPad USB-C Dock Gen2 hub controllers
    69f9f2b30af0 usb: musb: omap2430: Fix use-after-free in omap2430_probe()
    3bc65566331a usb: core: Fix up Interrupt IN endpoints with bogus wBytesPerInterval
    7118304b1a77 usb: chipidea: core: convert ci_role_switch to local variable
    9fd48937046e tty: serial: samsung: Remove redundant port lock acquisition in rx helpers
    66f8bfea055b tty: serial: pch_uart: add check for dma_alloc_coherent()
    b4bebb6e0a44 counter: Fix refcount leak in counter_alloc() error path
    c7e670cb2538 comedi: comedi_test: Fix limiting of convert_arg in waveform_ai_cmdtest()
    269f5be6a6e4 comedi: comedi_test: fix check for valid scan_begin_src in waveform_ai_cmdtest()
    fdb74898d91d Input: synaptics - add LEN2058 to SMBus passlist for ThinkPad E490
    7f95f4792c0d Input: atmel_mxt_ts - fix boundary check in mxt_prepare_cfg_mem
    639fa8af506e misc: rp1: Send IACK on IRQ activate to fix kdump/kexec
    94215d55b094 ksmbd: OOB read regression in smb_check_perm_dacl() ACE-walk loops
    6617ee91062b Input: xpad - add support for ASUS ROG RAIKIRI II
    3d63b8077f5b Input: xpad - add "Nova 2 Lite" from GameSir
    2ffd8b0dd448 ALSA: hda/realtek: Fix speaker output on ASUS ROG Strix G615LP
    c093468aea82 xfrm: esp: restore combined single-frag length gate
    c4609fff0665 ASoC: qcom: q6asm-dai: do not set stream state in event and trigger callbacks
    35be14ea8298 ASoC: qcom: q6asm-dai: close stream only when running
    b98ab51c45c5 netfilter: conntrack: tcp: do not force CLOSE on invalid-seq RST without direction check
    b9027ff112b6 ALSA: firewire-motu: Protect register DSP event queue positions
    befcb15c1f05 ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on firmware 2417
    aa0c7e59192b xfrm: ah: use skb_to_full_sk in async output callbacks
    dc6dcba80d72 xfrm: ipcomp: Free destination pages on acomp errors
    448bb92ca101 xfrm: route MIGRATE notifications to caller's netns
    22d41b176b99 nfc: hci: fix out-of-bounds read in HCP header parsing
    8b1f4f618fd8 iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
    b8338111e141 HID: wacom: Fix OOB write in wacom_hid_set_device_mode()
    59139473a7a7 spi: spi-mem: avoid mutating op template in spi_mem_supports_op()
    96a4713ae041 net: skbuff: fix missing zerocopy reference in pskb_carve helpers
    fc32be9ac278 ip6: vti: Use ip6_tnl.net in vti6_changelink().
    947013fd7c8c l2tp: use refcount_inc_not_zero in l2tp_session_get_by_ifname
    9f7ebb45a83a xfrm: input: hold netns during deferred transport reinjection
    a35daeabb433 ipv6: validate extension header length before copying to cmsg
    853f6ea482df ip6: vti: Use ip6_tnl.net in vti6_siocdevprivate().
    751db1b802a0 ipv6: exthdrs: refresh nh after handling HAO option
    90983f841dfa ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
    c512e1c819df ipv6: exthdrs: refresh nh pointer after ipv6_hop_jumbo()
    6d00f5c7e5ff macsec: fix replay protection at XPN lower-PN wrap
    5e1902866796 bpf: sockmap: fix tail fragment offset in bpf_msg_push_data
    e4892b1ecd73 wireguard: send: append trailer after expanding head
    d59cc66b7027 x86/ftrace: Relocate %rip-relative percpu refs in dynamic trampolines
    3f43865cb64d i2c: davinci: fix division by zero on missing clock-frequency
    bf769358419e Input: elan_i2c - validate firmware size before use
    84ea928ed584 usb: dwc2: Fix use after free in debug code
    94c92f9c886c usb: cdns3: plat: fix unbalanced pm_runtime_forbid() call permanently leaks the runtime PM usage counter across bind/unbind cycles
    459c4fa089f7 usb: cdns3: plat: fix leaked usb2_phy initialization on usb3_phy acquisition failure
    b2723bd468c5 usb: cdns3: gadget: fix request skipping after clearing halt
    0fee0ccac29e USB: serial: omninet: fix memory corruption with small endpoint
    3412a95afaa5 iio: buffer: Fix DMA fence leak in iio_buffer_enqueue_dmabuf()
    a3763ae33476 iio: buffer: hw-consumer: fix use-after-free in error path
    390254cf509b iio: light: cm3323: fix reg_conf not being initialized correctly
    5e4d34092a5e iio: chemical: scd30: fix division by zero in write_raw
    a5a05410cb34 iio: chemical: mhz19b: reject oversized serial replies
    cbd2d7e6bd4f iio: Fix iio_multiply_value use in iio_read_channel_processed_scale
    8d4daa614440 iio: light: veml6070: Fix resource leak in probe error path
    ae01ec83841d iio: magnetometer: st_magn: fix default DRDY pin selection for LIS2MDL
    aefc19ca3dd3 iio: temperature: tsys01: fix broken PROM checksum validation
    04a4d9822210 iio: ssp_sensors: cancel delayed work_refresh on remove
    aaf9d640e9ae iio: gyro: adis16260: fix division by zero in write_raw
    15a0b3f33ffb iio: gyro: itg3200: fix i2c read into the wrong stack location
    5cb8cede8baf iio: adc: ad4695: Fix call ordering in offload buffer postenable
    7155e7fce429 iio: adc: viperboard: Fix error handling in vprbrd_iio_read_raw
    944082fdb028 iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
    991d359faa95 iio: dac: ad5686: fix powerdown control on dual-channel devices
    31de336a2c0d iio: dac: ad5686: acquire lock when doing powerdown control
    f541c9a1eb89 iio: dac: ad5686: fix input raw value check
    69f7d101976c iio: dac: ad5686: fix ref bit initialization for single-channel parts
    684bfd655b80 iio: dac: max5821: fix return value check in powerdown sync
    88c9dd5170e0 iio: dac: ad3530r: Fix AD3531/AD3531R powerdown mode strings
    2ce5ca7824a1 iio: adc: npcm: fix unbalanced clk_disable_unprepare()
    0ee771fff32e iio: adc: xilinx-xadc: Fix sequencer mode in postdisable for dual mux
    bb1b43e8a7ed Disable -Wattribute-alias for clang-23 and newer
    bbd989d6fd36 KVM: SEV: Don't explicitly pass PSC buffer to snp_begin_psc()
    b1dfaa6f7a95 KVM: SEV: Use READ_ONCE() when reading entries/indices from PSC buffer
    75c8d1d72912 KVM: SEV: Check PSC request indices against the actual size of the buffer
    9f0a9e780f02 KVM: SEV: Compute the correct max length of the in-GHCB scratch area
    5300aedbee56 KVM: SEV: WARN if KVM attempts to setup scratch area with min_len==0
    e4ab26f81a63 KVM: SEV: Use the size of the PSC header as the minimum size for PSC requests
    2254972d4d69 KVM: SEV: Ignore Port I/O requests of length '0'
    c9b4198fbc6e KVM: SEV: Require in-GHCB scratch area if GHCB v2+ is in use
    ec62e8480e82 KVM: SVM: Flush the current TLB when transitioning from xAVIC => x2AVIC
    b1fc4a83dd44 KVM: arm64: PMU: Preserve AArch32 counter low bits
    625153b917bc USB: cdc-acm: Fix bit overlap and move quirk definitions to header
    667599e71832 rust_binder: avoid calling pending_oneway_finished() on TF_UPDATE_TXN
    f2f2671e32c5 rust_binder: Avoid holding lock when dropping delivered_death
    74d6aae1df45 parport: Fix race between port and client registration
    9749db57233b Input: xpad - fix out-of-bounds access for Share button
    d9019210c8c3 Bluetooth: hci_sync: fix UAF in hci_le_create_cis_sync
    2b7651f58670 Bluetooth: hci_qca: Use 100 ms SSR delay for rampatch and NVM loading
    e6b78019664d Bluetooth: hci_conn: Fix memory leak in hci_le_big_terminate()
    bc08c15746f2 Bluetooth: ISO: serialize iso_sock_clear_timer with socket lock
    c318aa51830a Bluetooth: ISO: fix UAF in iso_recv_frame
    6348dfed5b0f Bluetooth: HIDP: fix missing length checks in hidp_input_report()
    e8a5baff5be2 Bluetooth: L2CAP: fix chan ref leak in l2cap_chan_timeout() on !conn
    859d3ace791e Bluetooth: L2CAP: use chan timer to close channels in cleanup_listen()
    388051f7389a smb: client: fix uninitialized variable in smb2_writev_callback
    197476b12601 auxdisplay: line-display: fix OOB read on zero-length message_store()
    0fcc34d0d8fe mm/rmap: initialize nr_pages to 1 at loop start in try_to_unmap_one
    0995d1f79aed memfd: deny writeable mappings when implying SEAL_WRITE
    f1f0cdca932b mm: memcontrol: propagate NMI slab stats to memcg vmstats
    a3cc795129e5 ipc: limit next_id allocation to the valid ID range
    0ba6c05156d9 mm/damon/sysfs-schemes: delete tried region in regions_rmdirs()
    0886c6f257fe hpfs: fix a crash if hpfs_map_dnode_bitmap fails
    4064a30381fa Bluetooth: btusb: Allow firmware re-download when version matches
    6728e80c9d29 HID: quirks: Add ALWAYS_POLL quirk for SIGMACHIP USB mouse
    8735a28f2dcd Input: ims-pcu - fix usb_free_coherent() size in ims_pcu_buffers_free()
    f33b5a61673b media: rc: igorplugusb: fix control request setup packet
    f793b67d41e5 USB: serial: safe_serial: fix memory corruption with small endpoint
    0edd1e21587b usb: typec: ucsi: validate connector number in ucsi_connector_change()
    9b496e3371c0 usb: typec: tcpm/tcpci_maxim: validate header NDO against RX_BYTE_CNT
    e94933dc41b8 usb: typec: wcove: don't write past struct pd_message in wcove_read_rx_buffer()
    b10eff5abe6a usb: typec: altmodes/displayport: validate count before reading Status Update VDO
    052dbef45cb3 usb: typec: ucsi: displayport: NAK DP_CMD_CONFIGURE without a payload VDO
    4505f33dab56 usb: typec: tcpm: bound altmode_desc[] per iteration in svdm_consume_modes()
    f9d787fbe831 usb: typec: tcpm: validate VDO count in Discover Identity ACK handlers
    a38ed87818b2 usb: typec: ucsi: ccg: reject firmware images without a ':' record header
    a58400f58f82 iio: pressure: bmp280: fix stack leak in bmp580 trigger handler
    ce582b22dd2f iio: imu: adis16550: fix stack leak in trigger handler
    e6bb3a49c5f9 iio: imu: st_lsm6dsx: fix stack leak in tagged FIFO buffer
    278b0df1f736 phy: mscc: Use PHY_ID_MATCH_EXACT for VSC8584, VSC8582, VSC8575, VSC856X
    487393023feb drm/i915/psr: Apply Intel DPCD workaround when SDP on prior line used
    c058cf6b84c1 drm/i915/psr: Read Intel DPCD workaround register
    dd4cbab2a446 drm/i915/psr: Add defininitions for INTEL_WA_REGISTER_CAPS DPCD register
    600ad63124de s390/cio: Restore GFP_DMA for CHSC allocation
    0171e01de47a Revert "x86/fpu: Refine and simplify the magic number check during signal return"
    ff0ca46b13b9 smb: client: validate the whole DACL before rewriting it in cifsacl
    efacf63ed087 media: rc: ttusbir: fix inverted error logic
    e250b672d40a media: rc: fix race between unregister and urb/irq callbacks
    814be4a0924b net: skbuff: fix pskb_carve leaking zcopy pages
    ab9a10969a90 ipv6: fix possible infinite loop in fib6_select_path()
    dc36a04621dc ipv6: fix possible infinite loop in rt6_fill_node()
    b62e2b2b4a50 vsock/virtio: bind uarg before filling zerocopy skb
    68667ee4c7da sctp: fix race between sctp_wait_for_connect and peeloff
    c4152b4e28b3 net: mana: Skip redundant detach on already-detached port
    da87896f34e0 net: mana: Add NULL guards in teardown path to prevent panic on attach failure
    7f945f7f10f4 gpio: rockchip: teardown bugs and resource leaks
    e2fabb984bfd gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
    5d43c71fa8e1 gpio: virtuser: Fix uninitialized data bug in gpio_virtuser_direction_do_write()
    b6cdbb681ce1 gpio: adnp: fix flow control regression caused by scoped_guard()
    ae2eac5e9cfe Bluetooth: hci_sync: Reset device counters in hci_dev_close_sync()
    47330cc875b3 Bluetooth: hci_sync: Set HCI_CMD_DRAIN_WORKQUEUE during device close
    41e29548b5e8 Bluetooth: L2CAP: Fix possible crash on l2cap_ecred_conn_rsp
    f39049304ba6 Bluetooth: l2cap: clear chan->ident on ECRED reconfiguration success
    1d4dcfe60fe1 net/handshake: Pass negative errno through handshake_complete()
    25b2fcdea6f6 nvme-tcp: store negative errno in queue->tls_err
    0866569fc36a net/handshake: Use spin_lock_bh for hn_lock
    c35064294eca net: hibmcge: disable Relaxed Ordering to fix RX packet corruption
    7f97b8352ce5 net/sched: Revert "net/sched: Restrict conditions for adding duplicating netems to qdisc tree"
    6fe1cb312038 ipv6: rpl: fix hdrlen overflow in ipv6_rpl_srh_decompress()
    fd0de51c54fa ethtool: eeprom: add more safeties to EEPROM Netlink fallback
    c944cab3df82 ethtool: eeprom: add missing ethnl_ops_begin() / _complete() during fallback
    3e656023a649 ethtool: strset: fix header attribute index in ethnl_req_get_phydev()
    2008f9bb1ede ethtool: tsinfo: don't pass ERR_PTR to genlmsg_cancel on prepare failure
    ab94e0d6664d ethtool: tsinfo: fix uninitialized stats on the by-PHC path
    d02342d9bb4f ethtool: tsconfig: fix missing ethnl_ops_complete()
    912f8b23bc4b ethtool: pse-pd: fix missing ethnl_ops_complete()
    49455e27838a ethtool: linkstate: fix unbalanced ethnl_ops_complete() on PHY lookup error
    d11c98484485 ethtool: tsconfig: fix reply error handling
    0c02c190bcd9 ethtool: coalesce: cap profile updates at NET_DIM_PARAMS_NUM_PROFILES
    e976e3f2f200 bridge: Fix sleep in atomic context in sysfs path
    c9c2e609e839 bridge: Fix sleep in atomic context in netlink path
    9ea8a648d912 bonding: refuse to enslave CAN devices
    e673889a35a5 Bluetooth: 6lowpan: check skb_clone() return value in send_mcast_pkt()
    75cf24709037 drm/xe: Restore IDLEDLY regiter on engine reset
    164dcbec9632 ASoC: codecs: simple-mux: Fix enum control bounds check
    de9eb0b44fa9 ksmbd: fix FSCTL permission bypass by adding a permission check for FSCTL_SET_SPARSE
    43368636c663 tunnels: do not assume transport header in iptunnel_pmtud_check_icmp()
    5303925e3605 vxlan: do not reuse cached ip_hdr() value after skb_tunnel_check_pmtu()
    6dff77899b9e tunnels: load network headers after skb_cow() in iptunnel_pmtud_build_icmp[v6]()
    2a8c9994406b cxl/test: Update mock dev array before calling platform_device_add()
    41d2dc766bf8 ethtool: cmis: validate fw->size against start_cmd_payload_size
    0696709e951b ethtool: cmis: validate start_cmd_payload_size from module
    0cbce444db75 ethtool: cmis: fix u16-to-u8 truncation of msleep_pre_rpl
    4d42fb88ec61 ethtool: cmis: require exact CDB reply length
    e1dd697094f1 ethtool: module: fix cleanup if socket used for flashing multiple devices
    9e70c8efb0ca ethtool: module: check fw_flash_in_progress under rtnl_lock
    9f5108f5ee27 ethtool: module: avoid racy updates to dev->ethtool bitfield
    61848c83b913 ethtool: module: avoid leaking a netdev ref on module flash errors
    d9defbf8b62b ethtool: module: call ethnl_ops_complete() on module flash errors
    7877d8fbbec2 ethtool: rss: avoid device context leak on reply-build failure
    7ddc3b3ddee8 ethtool: rss: fix hkey leak when indir_size is 0
    33d05c22d6f2 ethtool: rss: fix indir_table and hkey leak on get_rxfh failure
    39c01c405063 ethtool: rss: fix falsely ignoring indir table updates
    6a775ec73210 ethtool: rss: add missing errno on RSS context delete
    f23e4d7324b8 ethtool: rss: avoid modifying the RSS context response
    48fd840a26d3 net: Avoid checksumming unreadable skb tail on trim
    03e9405c518c net: team: fix NULL pointer dereference in team_xmit during mode change
    c2af23b48f93 net: team: Rename port_disabled team mode op to port_tx_disabled
    a20e6ae5f05e net: team: Remove unused team_mode_op, port_enabled
    f2e077e8979f gpio: mxc: fix irq_high handling
    fbd0662f9c9a net: hsr: fix potential OOB access in supervision frame handling
    2a15a03e58b0 net/mlx5: HWS: Reject unsupported remove-header action
    f0ac76e3d55e ASoC: Intel: bytcht_es8316: Fix MCLK leak on init errors
    e13922bb97b4 ALSA: pcm: oss: Fix setup list UAF on proc write error
    a7f4eefb6e14 ipv4: free net->ipv4.sysctl_local_reserved_ports after unregister_net_sysctl_table()
    475f2b37a78f scsi: core: Run queues for all non-SDEV_DEL devices from scsi_run_host_queues
    981736924338 net/iucv: fix locking in .getsockopt
    55cba6b883b4 net/smc: Do not re-initialize smc hashtables
    bcd0d19db3e6 net: netlink: don't set nsid on local notifications
    ca5e36629641 net: netlink: fix sending unassigned nsid after assigned one
    ef3b3ea864d0 vsock: keep poll shutdown state consistent
    aa308e9dbb9a tun: free page on build_skb failure in tun_xdp_one()
    37a1c268c2c8 tun: free page on short-frame rejection in tun_xdp_one()
    96bea2a7baac netfilter: nf_tables: fix dst corruption in same register operation
    bf8e8eac7ede netfilter: ebtables: fix OOB read in compat_mtw_from_user
    052468b1c93b netfilter: xt_cpu: prefer raw_smp_processor_id
    f0fea2b6d545 netfilter: synproxy: refresh tcphdr after skb_ensure_writable
    18abd88d19ea accel/rocket: fix UAF via dangling GEM handle in create_bo
    45564a16a24f kunit: fix use-after-free in debugfs when using kunit.filter
    e1b8a53834dc HID: remove duplicate hid_warn_ratelimited definition
    bebc7dc0fb4b tools/bootconfig: Fix buf leaks in apply_xbc
    b4702049417f nfc: nxp-nci: i2c: use rising-edge IRQ on ACPI systems
    82ac903e0b51 xfrm: Check for underflow in xfrm_state_mtu
    650bdd8fdfab nfc: llcp: Fix use-after-free race in nfc_llcp_recv_cc()
    912ebc49d440 nfc: llcp: Fix use-after-free in llcp_sock_release()
    8b733ee4aecd bcache: fix uninitialized closure object
    dbc560858da8 net/sched: sch_sfb: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    91cc13978ab0 xfrm: move policy_bydst RCU sync from per-netns .exit to .pre_exit
    54ed418de62a net: mctp: ensure our nlmsg responses are initialised
    41845bc5bb64 net/sched: cls_fw: fix NULL dereference of "old" filters before change()
    0ca809ea8e03 Input: usbtouchscreen - clamp NEXIO data_len/x_len to URB buffer size

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 90e7c10..7505946 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "3bf75f8b9c97212d54aac12c3575b42cc504b4d8"
+SRCREV_machine:genericarm64 ?= "d6f3a955dcf77a71454a2d70f291bd39d06422ff"
-- 
2.43.0


