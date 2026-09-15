Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F91C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 21:50:55 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1629.1789509051081811341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 14:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gkRQRroM;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca06a25so1900485ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789509050; cv=none;
        d=google.com; s=arc-20260327;
        b=GZMzgVuwezdWYP6sFXGYYfKqCtsXMFclQhVw7sfB2D40TFCJzvC7otasdDu0FC+0Ch
         iARvDWds3cWRhe1pt452y4x3LHFy0qj7BJvzCmgRhTLBk9f0736q8jbByhsgM3fHyb62
         EPVjj/p+pLHtI6IIKg9fGJzITWbx3dRRE+w0CbqF9p/hAAJKLaOIvqQG3WbZJO96Rjmr
         jICyeQdaWq+KWIYtovYQ92k1+cIOuuTY6WbHhkSr4BZqEunAEe+kSlL/Uqeig1rdZ/2C
         OvyJbYAS7150rrpBDwe4QzPJ++UaCIsCGczvQClQjO5E2IvM2a8jc3Ojdh9SZep5pDhz
         VkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lOcXiSMiHusq3ACXxcSfTEIcesoQBZ5f7Ra2IuV0Kjc=;
        fh=xpkq8DV7tdaTkEOCl1cGUXR5bJ6CniptThw1Wcm8T60=;
        b=bOwNK2zkbm9IqWPRG6+gFF5ykcXR9hsDHE08Q/hAha9Py9+4w6wcb63OAvlJtRR8Nd
         Sa2z2i/PhFa1YQR4Oyc0VsE3zw7sDmzT5VoqiJz3WbvE3kS176U20iK6w/SASeHTkVqY
         4TmboT/TbYSI5LROzPE6deiAs0paGus49MyI5Er6Thn2djx7+Fb1lII7XpKxarIbepSE
         WCvz6PTr64mczjMUKPBxQLTS01ztjdhNcLXwsFHpm+f0fbqB6drXjwS/Hasf75sm3uOS
         LqJdIPughV/Sv3zsj43l+dWGMtsjlQbm69sGS7bn/K1Uf+rNWHZJCPCmMlBaR013d3Nl
         6CVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789509050; x=1790113850; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOcXiSMiHusq3ACXxcSfTEIcesoQBZ5f7Ra2IuV0Kjc=;
        b=gkRQRroMxTar1QZWdTSial5yHXH8IYEsUkuuMufMLgBz4U0Q71rDNWfH81QPCsvaLW
         /kXyjiV2L4YK36F/0bkBhoWuAvaAvO6lyRzkTDtaIqvGlT5RsH/+oanUpSyW1Hdhj1Tg
         Gm9PtD/gc86wup07ZXziggyUXMeDR0xUd/18FHCNCjqeopovBSbBwHP3iD0+6+zlAwvw
         WG6Gsr9gFhH3Lga1AwW/M/3VqCCc2zdTJ3DDCrtwc5E7e3vRAiDneUt/knkSLPAWhM9d
         BCKRZMvG+BeCqs4PhqUCBkNZjzE9isGwSNUAcNFMG8cFHMPotjcqnk0laCGoDFl5+dn5
         NFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509050; x=1790113850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lOcXiSMiHusq3ACXxcSfTEIcesoQBZ5f7Ra2IuV0Kjc=;
        b=yLFCM9ym+N2ZH68P5DZ899AoAzuzuS1W5fTj4JIasul9B3icI204fqLAgD2yBdFYRS
         qXGd2+jo8W+pt4OLM+tamVA3PqobfGiGcikUl+2eaBPcPhvsKJAqAK//tvj6vk6qOapo
         9jpMIDzP+JG6duTfxYq/aGYOn+1cXi+epDhEz18OuXx7xiArcLJ1kqqEBF8DDynDYT33
         sJ+gm3b/eUH2bZpUAf414U+d39+jwjSmpuuINFKlvJoHiNTDmYPQXwtyvGgmLVPH5QnK
         uolncYlx7oDml7XU6KFrCOaXS+6E40OoqzgaagOMIymu7g9qanpsxulxP+TZ3nl8JzXE
         xNKA==
X-Forwarded-Encrypted: i=1; AKwUvBxcKNkj0AnZ7MVKQBStDjxOc5SOGA8cPOudJK487cNAXQrMHBDYEigeSx2JzBMHlr6kpZneszv5BpkNLy9sd52wVw==@lists.openembedded.org
X-Gm-Message-State: AFuF++k/+mz4a8ytrUiklGhn0qbtx5pATGVhI4zPcd7qRlbDHS5bisol
	+8iOUJsWn4Fv+VbZ7n36oRRWJ19cfcphNkuBx5Lxrc8jy2tSkQxn9LK9IBb5LMcMFDnLuBc69nz
	JbTMAKwml3j1ajg/ciVkTUqqJh4uxUns=
X-Gm-Gg: AYBFou0myu5bVZpurmgJ0iPASPyTNd35AY0lMikfYwXFMJSxI8cdxwojdvrYP1GPMAR
	9C6UrRAn5aeIPJ1FPn1hxo2AnN1lOvkU8cyIoMX/Ix8lxIDoNl+h14U4u3O6ue1woWJsreJzP7Q
	N52RibzIUJppm2raMmEI4gxlNAe4uVDYt5O6d9HjeLTaNhxzVEEc+4v3ovbE4pK8Gv9cZSi8w/u
	D80YY1/Z/Pl0hbohWyTfN+uGPvWJShNNdrVJww/lEx5Ik8SFENNcWzIyAkzXdJ0bHhNrNRFXAfC
	6+FxYVXQFeBr5n+ix+7W6pXA9/Ic1QX4VVKgRP2fJYzyXkm1287AIztHFoPXE6QrU/xQVHkX6lt
	USt83vRx4GCHDmaCtMakB3RFk9DY0nmk5gNmfjLVfsC+4Y1/fMUm3FYQr+l7qqduJLcUbOacPWy
	Y=
X-Received: by 2002:a17:902:f64b:b0:2c8:f34c:82c0 with SMTP id
 d9443c01a7336-2dd8dd0b0b9mr2989385ad.2.1789509049937; Tue, 15 Sep 2026
 14:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <18D59CE1160E5503.1924412@lists.openembedded.org>
In-Reply-To: <18D59CE1160E5503.1924412@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Sep 2026 17:50:36 -0400
X-Gm-Features: AcwNN1WuqXHZsx0EMKa9_5QLCk-E-txvIv5SD-jbozj3mmCBfYqx6j3O87kLaZk
Message-ID: <CADkTA4PK+tZuCHuBR4ZPahYUYy4QmYEoz85Vv1q34AT70c8mMg@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH 01/02] linux-yocto/6.18: update to v6.18.50
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003e72b8065b8c8b84"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 21:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245907

--0000000000003e72b8065b8c8b84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There's no second patch coming, it went to the yocto list for BSPs!

Bruce

On Tue, Sep 15, 2026 at 5:48=E2=80=AFPM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.18 to the latest korg -stable release that compris=
es
> the following commits:
>
>     7cfc41f8e80f1 Linux 6.18.50
>     8e30f5427f345 mm/rmap: use huge_ptep_get() in try_to_unmap_one()
>     381a0a524e967 mm: avoid unnecessary use of is_swap_pmd()
>     6a259dd313043 platform/chrome: sensorhub: Fix dropped timestamp event=
s
> and log spam
>     e91d66e5ff661 selftests/mm: fix on-fault-limit false failure under
> sudo-rs
>     2d6150e5e6aa6 udf: Fix i_lenExtents truncation on 32-bit kernels
>     b7eff3f621ef2 timer: Keep debugobjects state consistent in
> migrate_timer_list()
>     fecf1e3777526 timekeeping: Check the return value of tk_get_aux_ts64
> in __do_adjtimex()
>     6067c39c2cec1 taskstats: fix cpumask parsing cutting off the last
> character
>     ed64aa505875a smack: fix cred UAF in smack_file_send_sigiotask()
>     a246da20c8e4a signal: avoid shared siginfo namespace rewrites
>     236c8ecaafc63 sticon/parisc: Detect default STI graphics card for
> console output
>     e8527de7fea19 sysctl: move the "cad_pid" entry from pid_table[] to
> kern_reboot_table[]
>     cde2d927c29e8 tpm: tpm_i2c_nuvoton: disable IRQ on wait timeout
>     c3c7e87c76b42 zloop: truncate finished zones to zone capacity
>     f49e55b1c8fe1 xarray: honor XA_FLAGS_ACCOUNT in xas_split_alloc()
>     ae0c79a852704 w1: ds28e17: reject an oversize length on an I2C block
> read
>     165a330a68b5f vsock/virtio: flush works in dependency order
>     03b81f015dbb2 wifi: mt76: mt7996: validate default EEPROM firmware si=
ze
>     01f2e0da8548f wifi: mt76: mt7996: fix TX DMA mapping leak for AddBA
> req frames
>     304470333b7f5 wifi: mt76: mt7925: cancel mlo_pm_work on stop
>     5fdaf7016d768 wifi: mt76: mt7915: bound the device EEPROM address
> before the EFUSE copy
>     4506e229b2e46 wifi: mt76: mt7615: avoid waiting for mac work under th=
e
> mt76 mutex
>     34a505071d1ff wifi: rtw88: pci: fix resource leak on failed NAPI setu=
p
>     7364713f0931e wifi: rtw88: Fix potential memory leak in
> rtw_txq_push_skb()
>     dc8b0be0ec4d9 wifi: rtlwifi: rtl8192du: Fix possible memory leak in
> rtl92du_init_sw_vars()
>     0c0b374e12d52 wifi: rtlwifi: rtl8192du: check QoS TID before indexing
> tids
>     97a1af5ac131b wifi: rtl818x: initialize eeprom_93cx6 struct to zero
>     b1bbeb8970eeb wifi: mwifiex: Detach sync cmd buffer on interrupted wa=
it
>     7c257a295e05c crypto: sun8i-ss - Remove crypto_rng interface
>     8e4f9110aba31 crypto: sun8i-ce - Remove crypto_rng interface
>     620acb1e8037b wifi: rtl8xxxu: fix use-after-free from rx_urb_wq on st=
op
>     84ba017a1e1ea wifi: iwlwifi: dvm: fix memory leak in
> iwl_op_mode_dvm_start()
>     261d7c7610b4b wifi: brcmfmac: Fix memory leak in
> brcmf_sdio_read_control()
>     7ef23317f9976 i3c: renesas: Reconfigure the DATBAS register on
> re-attach
>     9382fcf3a8c44 i3c: renesas: Clean DATBAS register on detach
>     0093f9fc102ba i3c: renesas: Check that the transfer is valid before
> accessing it
>     5697d779577e2 i3c: master: svc: bound IBI payload to the requested
> max_payload_len
>     94fb9786d67a8 i3c: master: Fix info leak and UAF in device unregister
> path
>     a15a1b95de980 i3c: master: adi: initialize the lock before enabling
> interrupts
>     1894fc7a3bab9 dm-pcache: fix use-after-free and invalid seg operation=
s
> in kset_replay()
>     10acf740c3adb dm-pcache: fix implicit u8 truncation of gc_percent in
> message handler
>     83e3116283ed2 dm-pcache: only hand out initialized cache segments
>     663ee2f3824a5 dm-pcache: detect a cycle in the last-kset chain during
> replay
>     2cd9776fe3f2d dm-pcache: clamp the tail kset read to the segment data
> region
>     ffd9a214a94f9 dm-pcache: bound the persisted tail-position offset
>     91b93fe5cf4d6 dm-pcache: validate on-media seg_num against the cache
> device size
>     d8caf96040a06 dm-pcache: validate kset key_num and intra-segment boun=
ds
>     ab5dcde6fa96b dm-pcache: validate geometry fields from on-disk
> cache_info
>     296efdc110b10 dm-switch: use WRITE_ONCE() in
> switch_region_table_write()
>     74210fa072960 dm-stats: fix a crash if allocation of per-cpu data fai=
ls
>     c860cd3f40382 arch_numa: avoid false positive fortify warning in
> setup_node_to_cpumask_map()
>     edf30d65e3ac5 net/smc: carry oversized SMC-Rv2 LLC messages in the
> queue entry
>     44dc702be9a9e rust: rust_is_available: warn for `bindgen` < 0.72.1 &&
> libclang >=3D 22
>     b5fe67111e63a ovpn: run deferred work on a module-owned workqueue
>     50f4a793c4ff2 ring-buffer: Fix subbuf resize race with ring buffer
> readers
>     22fe01a2e2f7c ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP10 quirk
> ordering
>     37c3210c491ac ALSA: hda/realtek: Enable micmute LED on HP EliteBook 6
> G1a p/n: AD3Q9ET#UUG
>     8acb66d0513de ALSA: hda/realtek: Add quirk for TongFang XxAF5xxx
>     40ee4224e2fe2 ALSA: virmidi: Check card index validity at probe
>     7555e83d7738e ALSA: serial-u16550: Check card index validity at probe
>     d7ef7890e3e35 ALSA: portman2x4: Check card index validity at probe
>     7ef9ad82d95dd ALSA: pcxhr: initialize mutexes before requesting
> threaded IRQ
>     a4e774eeb61ae ALSA: mts64: Check card index validity at probe
>     cc4215cc2a4b2 ALSA: mpu401: Check card index validity at probe
>     13d61a920435d ALSA: hda/ext: preserve PPLCCTL bits when clearing rese=
t
>     7df3194bdb747 ALSA: bcd2000: clear the URB pointers on disconnect
>     7b3f985584936 ALSA: aloop: Check card index validity at probe
>     2a6f6fba3bd31 ALSA: 6fire: bound the MIDI event length from the devic=
e
>     94ca4f040ba48 mfd: sm501: Fix potential memory leaks during remove
>     5e7fe9c6c8c31 mfd: cgbc: Fix teardown ordering in cgbc_remove()
>     efe0ed4c0f4e8 hwrng: stm32 - Fix runtime PM cleanup on registration
> failure
>     cfa186a0857a0 seg6: reset IP6CB after IPv6 decapsulation
>     288f997067084 net: skbuff: don't touch shared zerocopy state in
> skb_tx_error()
>     34ab62c959f5f net: fix spurious TX timeout after dev_activate()
>     af0ee8f04bea2 net: cap advertised IP tunnel headroom
>     5bd8b764a610b net/smc: unregister the connection before draining the
> rx tasklet
>     313f79149eb33 net/smc: stop killed, freed and out_of_sync sharing a
> byte
>     c52a998a223e7 net/smc: fix use-after-free of the LLC qentry in
> smc_llc_srv_add_link()
>     0761e49aa78c2 net/smc: fix use-after-free in smc_rx_pipe_buf_release(=
)
>     d89dc1bd8845c net/smc: fix socket refcount leak in smc_switch_conns()
>     f950e1b1f0aad net/smc: do not dereference an unset send buffer on the
> SMC-D teardown path
>     486c699a8cde8 net/smc: bound the peer rkey counts in SMC-Rv2 LLC
> messages
>     b893152a886bb net: ntb_netdev: Count packets dropped on RX refill
> failure
>     4fac86e976975 net: ntb_netdev: Avoid double-accounting netif_rx() dro=
ps
>     dfab7171cd391 net: ntb_netdev: Fix TX busy and drop handling
>     6b6bbc6c878d6 NTB: ntb_transport: Reject oversized TX buffers
>     894e136b432da NTB: ntb_transport: Fail TX enqueue when the QP link is
> down
>     0c4aabc904490 NTB: ntb_transport: Recycle TX entries before client
> callbacks
>     f01e6a35c440b net: thunderbolt: Mark the connection down when bringin=
g
> it up fails
>     61ff3c353e5d2 net: thunderbolt: Release the Rx HopID that was handed
> out on mismatch
>     67a82e6f886be net: ravb: serialize PTP clock teardown
>     8d4d06d6e2b50 net: ravb: avoid dereferencing an invalid PTP clock
>     b6b533f83461c net: phylink: correctly validate returned PCS in
> phylink_inband_caps
>     0860af127aa79 net: openvswitch: fix nf_connlabels leak in ovs_ct_init
>     ac73e3af571da net: openvswitch: fix flow mask use-after-free on flow
> deletion
>     9c340473f4822 net: l2tp: do not propagate multicast notification erro=
rs
>     62da38b4b3a0d net: ipa: fix stalled modem TX queue after runtime resu=
me
>     42a33e679ea05 net: ibm: emac: mal: fix NAPI locking
>     f71087e7c63aa net: dsa: realtek: use gpiod_set_value_cansleep for
> reset GPIO
>     e098d9cc88596 net: tun: bound receive headroom
>     32785d75e60df net: usb: qmi_wwan: add Telit Cinterion FE990D50
> composition
>     486577db80789 slip: fix use-after-free in sl_sync()
>     15d1f3c0dbe7a xdp: fix zero-copy frame layout
>     8e3763f1ccac3 net/iucv: filter frames in afiucv_hs_rcv() by ingress
> device
>     99692252b348c ipmi:msghandler: Cancel work cleanly on an error
>     53af3a8bae0a9 ipmi: si: Fix NULL pointer dereference after failed
> registration
>     d46c97eddcbc5 ipmi: Remove all sysfs files on registration failure
>     5719431ca2b5f ipmi: ipmb: validate write message length
>     db8147c5d5ad2 interconnect: Fix use after free in icc_get() and
> of_icc_get_by_index()
>     417e02f7b6051 io_uring/query: cap user size passed to
> copy_struct_to_user
>     0c12a798078bc platform/x86: hp-bioscfg: warn on element type mismatch
> instead of failing
>     a38127df99ae8 platform/x86: hp-bioscfg: pass validated element count
> to package parsers
>     95d2f9b5189d0 platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never
> being parsed
>     b15b334fbc3c0 platform/x86: hp-bioscfg: fix off-by-one write in
> hp_get_string_from_buffer()
>     e3c1c5d1c9230 platform/x86: hp-bioscfg: fix new_password_store()
> overwriting current_password
>     0f9aad0842488 platform/x86: hp-bioscfg: fix heap OOB read on empty
> password write
>     7cd8fe01aba30 platform/x86: hp-bioscfg: fix heap OOB read in
> sk_store() and kek_store()
>     dea1a41160e70 platform/x86: hp-bioscfg: bound ordered-list parsing by
> the package count
>     0cd1530f84e1c platform/x86: hp-bioscfg: advance elem past consumed
> array elements
>     0a14d35ef529a platform/x86: hp-bioscfg: accept reduced ACPI packages
> from older HP BIOS
>     bc9aa5fe21c39 platform/x86/amd/pmc: Fix LPS0 and debugfs leaks when
> STB init fails
>     8178f59d76570 platform/x86/amd/pmc: Propagate SMU errors and validate
> S2D address
>     98d91d5b6a988 platform/x86/amd/pmc: Restore msg_port on
> amd_stb_s2d_init() error paths
>     5eaf7faa99578 platform/chrome: sensorhub: Bound the EC-reported senso=
r
> number
>     56dc46094973d platform/x86: think-lmi: Fix current password length
> check
>     9c28adde051fe platform/x86: think-lmi: Free system certificate
> signatures
>     89a076948ed61 platform/x86: think-lmi: Fix certificate thumbprint
> sysfs output
>     d7cd3e4d76034 platform/x86: lenovo/ymc: Only match lower byte in WMI
> lid switch query response
>     e1b3f89673bd1 platform/x86: ishtp_eclite: Fix ACPI device reference
> leak in probe error path
>     e07a42bb9c909 platform/x86: ISST: Return error during profile additio=
n
>     62840acc3044f platform/x86: ISST: Validate parameter for frequency an=
d
> priority
>     93268bc3cd84f platform/x86: ISST: Validate parameter for core power
> state
>     5b032e1dda486 platform/x86: ISST: Validate logical CPU id and clos id
>     b14db79d02bd3 platform/x86: ISST: Use PP level enable mask
>     92c5fffa63ad9 platform/x86: ISST: Just allow 2 bits for SST feature
> enable
>     c280fcd53b938 platform/x86: ISST: Add a NULL check for sst_inst[]
>     2550f89589caa mmc: via-sdmmc: stop card-detect handling on probe
> failure
>     f7ff3027ef004 mmc: via-sdmmc: cancel card-detect work on remove
>     82e707eff9e3b platform/x86: ISST: Validate socket ID in clos_assoc
> ioctl
>     1889a9156553f platform/x86: ISST: Validate level in perf mask ioctls
>     22222f92b0a51 platform/x86: dell-wmi-sysman: Don't hex dump attribute
> security buffer
>     cab2895729516 iommufd: Fix UAF in selftest IOPF reporting
>     4c33d00ad9a91 iommufd: Release current IOAS on xa_store() failure
>     436189ee4bb2c iommufd: Avoid locking internal accesses during unmap
>     45705a6bfdb28 iommu/vt-d: Force requesting ACS when tboot is enabled
>     364279b5623f7 iommu/vt-d: Fix no_iommu to disable platform opt-in
>     f80f3acb69164 iommu: Fix dev_iommu memory leak when device_add fails
> in iommu_mock_device_add
>     2235eafda9b3d iommu/arm-smmu-v3: Manage teardown with devm
>     d903d99ffd22b iommu/tegra241-cmdqv: Reject a vSID wider than the
> SID_MATCH field
>     968e9a1f71140 iommu/sva: Set handle->dev before the SVA handle is
> visible
>     f532401be9312 iommu/msm: Unwind probe state on registration failure
>     cfc5c1b2caa17 iommu/amd: Put PCI device after handling PPR faults
>     238e1f7a1463f PCI/proc: Warn on writes to kernel-exclusive config
> space regions
>     c2d4174f49245 PCI/proc: Use file_ns_capable() when checking config
> space read access
>     301288f85679a PCI/proc: Avoid spurious runtime PM wakeup on config
> space accesses
>     b30713111325e PCI/MSI: Enable memory decoding before restoring MSI-X
> messages
>     0e59a232aaa04 PCI/ASPM: Avoid L0s for Realtek RTS525A
>     39c4dc79d77f8 PCI/AER: Fix mapping of errors to agent & layer
>     4f887d8ed75f8 PCI/AER: Emit TLP Log only for unmasked errors
>     6beadccc432cf PCI/sysfs: Avoid spurious runtime PM wakeup on config
> space accesses
>     7f4db64f0ba7b PCI/sysfs: Fix read byte order in pci_read_legacy_io()
>     43cf455dd5a9b PCI: Add ACS quirk for Pericom PI7C9X2G608 switches
> [12d8:2608]
>     4b575052ea654 PCI: plda: Fix IRQ domain leaks in the error paths of
> plda_init_interrupts()
>     01c2f0c66bd1f PCI: plda: Fix use-after-free of event IRQs during
> teardown
>     5d4bc470330a6 PCI: meson: Fix GPIO state while requesting PERST#
>     1ad6994853853 PCI: Fix 32-bit config write in Intel PCH Root Port MPC
> ACS quirk
>     6053d6eacbfd2 PCI: hv: Set irq_retrigger callback for the Hyper-V PCI
> MSI irqchip
>     ceafb262475ac s390/dasd: Propagate partial completion length across
> ERP recovery
>     6452c13646af7 s390/dasd: Guard sysfs discipline callbacks against
> unallocated private data
>     52b331c99baac s390/dasd: Do not complete a failed ESE read as
> successful
>     dcce7a06ea690 s390/cpum_cf: Handle CPU hotplug via prepare/dead
> callbacks
>     aad7247bd35ad power: supply: max17040: synchronize work cancellation
> on suspend
>     17d43f64b17e4 power: supply: max17040: drop incorrect I2C
> functionality check
>     13fb0477da9b4 power: supply: max17040: propagate register read errors
>     39b60d615dfa1 power: supply: ucs1002: fix use-after-free on remove
>     a4460e89d4088 power: supply: twl4030_charger: cancel workers via devm
>     1b9978433c61a power: supply: rt9455: quiesce delayed work before
> teardown
>     ee053561e21ce power: supply: qcom_battmgr: terminate the strings from
> firmware
>     06618447029c6 power: supply: qcom_battmgr: fix use-after-free
>     b3aa1e9509e1b power: supply: lp8788-charger: fix use-after-free on
> remove
>     ab6b1ad710bed power: supply: lp8727: fix use-after-free in
> lp8727_release_irq()
>     4b1f2be1e1b74 power: supply: cros_usbpd: Limit port counts to
> EC_USB_PD_MAX_PORTS
>     78be8b7403ff7 power: supply: cros_usbpd-charger: bound the EC-reporte=
d
> port count
>     86e4fa65368f3 power: supply: charger-manager: register regulators
> before exposing sysfs
>     238320ad029a3 power: supply: bq25890: Fix power_supply reference leak
>     9e1aba34df9a8 power: supply: bq256xx: drain usb_work before freeing
> the charger
>     f495808cdd6d9 power: supply: bq24257: fix use-after-free on remove
>     d02a5794c3dee sctp: fix stream->outcnt underflow on duplicate RECONF
> responses
>     7ad8933bca97b sctp: distinguish sequence zero from wildcard in reconf
> lookup
>     25419f516ea84 sctp: fix NULL deref on untransmitted RECONF completion
>     1035bdef1efb9 sctp: drop a chunk if its transport was removed
>     fa306a40e716c sctp: stop processing a packet once its association is
> deleted
>     8a02ad98798fd nvme-tcp: reject a read that transferred too few bytes
>     3b3d27670c0c8 nvme-tcp: fix host memory disclosure on R2T for a read
> command
>     6a01b58263108 nvme-tcp: do not accept C2HData based on
> blk_rq_payload_bytes() alone
>     0d4f317b07d6c nvme-pci: disable controller on admin queue IRQ setup
> failure
>     67551d8430df9 nvme: zero the discard fallback page
>     1e456cc2744ee nvme: nvme-fc: Fix nvme_fc_create_hw_io_queues() queue
> deletion in error path
>     d662f7fc04fde lockd: fix NULL dereference on lockowner allocation
> failure
>     41f0a6d31615f lockd: pin next file across nlm_inspect_file lock-drop
>     3088e41292fec ipmi: Fix use-after-free of cmd_rcvr in
> _ipmi_destroy_user()
>     6aeff1636b398 i2c: mxs: fix DMA channel leak on probe error
>     8d2c120d2d5bf hwmon: (max6621) fix temperature clamp range
>     9b38d9a2e46a2 hwmon: (max6621) fix negative temperature offset and
> crit readings
>     68c59343ad1a7 ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC
>     f2a1a83487c6c arm64: proton-pack: Restore the nospectre_bhb
> command-line option
>     e7c9b1d433b05 arm64: compat: Fix decrementing LDM/STM alignment
> emulation
>     15d1feeae07d0 ALSA: ump: Fix corrupted data bytes at MIDI 1.0 SysEx t=
o
> UMP conversion
>     e41a59fc056f6 openvswitch: only skb_tx_error() a packet we are about
> to drop
>     d64a75369cd0f openrisc: fix arbitrary kernel memory access via
> or1k_atomic syscall
>     c0c165487a2ea ocfs2: fix readdir position truncation on 32-bit kernel=
s
>     0608018a71f24 ocfs2: cluster: fix o2hb_dependent_users leak on pin
> failure
>     251e38f5af7b2 ocfs2: cluster: avoid lock order inversion in
> o2hb_region_pin() from drop_item
>     ce035f208d68b ocfs2: cluster: don't sleep while holding o2hb_live_loc=
k
> in o2hb_region_pin()
>     0761d2c949442 ocfs2: validate rl_used against rl_count in refcount
> block validator
>     50c4cc9183e11 ocfs2: validate lengths in dlm_mig_lockres_handler
>     de10cd3b062a5 ocfs2: bound namelen in dlm_migrate_request_handler
>     71f07b7f90b31 ocfs2: always run deallocs on copy-on-write completion
>     116d14f29a052 orangefs: skip leading spaces before parsing client
> debug masks
>     f796f38a324e8 orangefs: fix double-free of trailer_buf on readdir cop=
y
> failure
>     bc6fdd425fdeb PM: sleep: Unblock runtime PM when device prepare fails
>     6fcb0b745a0b8 ring-buffer: Hold cpu_buffer::lock when resizing a subb=
uf
>     8c1ecdcdea738 ring-buffer: Free cpu_buffer::free_page with subbuf_ord=
er
>     2dc510957fe8f ring-buffer: Fix subbuf resize race with
> ring_buffer_alloc_read_page()
>     1c3036a818005 regulator: qcom-refgen: correct the regulator type to
> CURRENT
>     20e5fbb8c1a4c regulator: max8998_pmic_dt_parse_pdata: of_node_put on
> reg_np after ownership transferred to rdata
>     95342d26f9c6b regulator: as3722_get_regulator_dt_data: fix premature
> of_node_put leaving dangling of_node pointer
>     71d5c41ac583d RDMA/uverbs: Add UVERBS_ATTR_UHW to UVERBS_METHOD_REG_M=
R
>     4f8bb11dd2ff3 RDMA/ucma: Lock the handler in ucma_write_cm_event()
>     28ac2dd416482 RDMA/ucma: Lock the handler in ucma_set_ib_path()
>     a38cd610b24f7 RDMA/ionic: Cap eq_count to the eth driver's interrupt
> vector budget
>     85f438382a865 RDMA/cxgb4: Cancel reg_work before freeing device on
> remove
>     2a952fb1b20d8 qede: Fix NULL pointer dereference in TPA fragment
> processing
>     3f5677d2f8173 ptp: vmclock: prevent read-only mappings from becoming
> writable
>     c7e32814a6bf2 remoteproc: scp: Fix device reference leak on failed
> lookup
>     37797d5013c9e riscv: unaligned: stop using kthread for
> check_vector_unaligned_access()
>     8f392916a3540 riscv: acpi: Handle LPI architectural context loss flag=
s
>     5343399ed7242 arm64: dts: rockchip: Fix rk3588s-roc-pc audio
> description
>     8fc4bafabc065 arm64: dts: rockchip: Fix rk3399-roc-pc-plus analog aud=
io
>     650d2d5c0df7e arm64: dts: rockchip: fix emmc reset polarity on
> px30-cobra
>     5512c23231206 arm64: dts: rockchip: fix eMMC reset polarity on PX30
> Ringneck
>     fe455c13bf01e arm64: dts: rockchip: fix eMMC reset polarity on PP-151=
6
>     b6b3e4d5973bd arm64: dts: qcom: x1-dell-thena: mark l12b and l15b
> always-on
>     6bb9469c34fff arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPI=
O
> flags
>     ff23eb4823d82 Revert "arm64: dts: rockchip: Further describe the WiFi
> for the Pinephone Pro"
>     eb57632f9418f rpmsg: glink: smem: order FIFO read after availability
> check
>     e7143c3f4e5c0 scsi: core: Fill in DMA padding bytes in
> scsi_alloc_sgtables()
>     2a8dd9fd12f3f media: staging/ipu7: fix async notifier UAF on probe
> error path
>     7f6956b6dcd66 staging: media: tegra-video: vi: fix probe failure on
> skipped last port
>     656d047dc0c29 staging: media: tegra-video: fix of_node_put() on VIP
> parse errors
>     5be6d02837d41 wifi: mt76: mt7925: cancel pending mlo_pm_work
>     e1330d719c047 wifi: ath6kl: clamp assoc request/response lengths
> before subtracting IE offsets
>     b95c33a4e7438 udf: reject VAT indexes equal to the entry count
>     f84ec84d8d4bc svcrdma: Validate Read chunk positions before
> reconstruction
>     a798714b58041 svcrdma: Reject Write/Reply chunks with segcount 0
>     1949dd1576f7a svcrdma: Reject inline replies that overflow the pull-u=
p
> buffer
>     3cf372cec7ab2 svcrdma: Reject connection when transport allocation
> fails
>     5aabe070c00e5 svcrdma: Fix unmatched rn_unregister on failed accept
>     a1c954ca4977a svcrdma: Fix pcl_for_each_segment for empty chunks
>     a46b35f213c24 svcrdma: Fix offset arithmetic in read_chunk_range
>     1de391e8b94e3 SUNRPC: wait for in-flight client TLS handshake callbac=
k
>     1f9856af065b6 SUNRPC: Reject krb5 v2 wrap tokens with oversized ec
> field
>     7a1d0501cbb96 SUNRPC: reject duplicate CREDS_VALUE options
>     edeefb111d618 sunrpc: init gssp_lock before publishing proc entry
>     ebcbd2523a852 SUNRPC: harden gss_unwrap_resp_priv length checks
>     806584a4b67a7 SUNRPC: harden gss_krb5_unwrap_v2 against short tokens
>     fa46b6aa7a698 SUNRPC: Guard svcauth_gss_release() dispatch on
> rq_auth_stat
>     e769fcde3cc73 sunrpc: fix use-after-free in __rpc_clnt_handle_event
> and __rpc_clnt_remove_pipedir
>     08bc49e054126 sunrpc: defer rq_argp and rq_resp free until after RCU
> grace period
>     bd1ef2cfb44d7 SUNRPC: Check svc pool percpu counter allocation
>     2e861ce2aaa46 SUNRPC: always drain cache_cleaner before destroying a
> cache_detail
>     39981133df21c SUNRPC: Restore NUMA_NO_NODE for svc thread allocations
> in global mode
>     9d04d64ad1924 sunrpc: route to a populated pool in svc_pool_for_cpu()
>     de942dd8c2c83 SUNRPC: svcauth_gss: enforce krb5 token minimum length
>     e0778464049b0 SUNRPC: Zero rpc_gss_wire_cred at
> svcauth_gss_decode_credbody() entry
>     ad0cce80d4af2 SUNRPC: xdr_buf_trim: clamp buf->len to avoid underflow
>     f1b7b2c7ffa97 phy: fsl-imx8mq-usb: fix typec switch leak on probe
> error path
>     704ecd010d4a9 params: fix charp corruption on allocation failure
>     ff110e85837d7 nouveau/gem: reserve the bo in the info ioctl around th=
e
> vma lookup
>     04ab51d4e369a module/kallsyms: fix nextval for data symbol lookup
>     51887ccd88791 mptcp: fix uninitialized local_id in syncookie MP_JOIN
> reconstruction
>     d82b90a38c2ca mpls: reload header after pskb_may_pull()
>     50d0aa7d25ba4 module: validate string table section types
>     3b097416b4cff md: do overflow check for sb->bblog_shift in
> super_1_load()
>     0efabe6229dc6 md/raid10: fix still_degraded being inverted in
> raid10_sync_request()
>     121d35014e497 mailbox: qcom-ipcc: fix duplicate channel allocation
> across holes
>     09e649117c54b libnvdimm/labels: Prevent integer overflow in
> __nd_label_validate()
>     627ce4902df1d landlock: Require LANDLOCK_ACCESS_FS_MAKE_REG for
> whiteout creation
>     a602cd128d17a ipv6: use RCU iterator to dump route exceptions
>     63f50e9f90d02 ipv6: rpl: fix NULL dereference of idev in
> ipv6_rpl_srh_rcv()
>     b8282668d8fa7 ip6_gre: fix hardware header length for NBMA tunnels
>     b36dfd6e8cff0 ip6_tunnel: use skb_cow_head() in ip6_tnl_xmit()
>     a8af6fbac895f ip: orphan prefetched skbs before multicast forwarding
>     31e4be21dacee ipip: fix skb leak in collect_md mode when metadata_dst
> allocation fails
>     f9182a85991a0 jbd2: check need_resched() when skipping busy checkpoin=
t
> buffers
>     71c6b872c7464 jbd2: bound shrinker scans by examined checkpoint buffe=
rs
>     30e8cb8598aa4 kasan: fix cache shrink race with CPU hotplug
>     15deb4e33f474 Bluetooth: hci_sync: Clear HCI_CMD_PENDING when droppin=
g
> the last request
>     657054159d83a Bluetooth: hci_intel: fix usage_count leak when
> autosuspend_delay is negative
>     94d548fc264a2 Bluetooth: hci_h5: fix usage_count leak when
> autosuspend_delay is negative
>     1bad0896cbc06 Bluetooth: hci_event: clear HCI_LE_ADV only on a create=
d
> connection
>     d0b28e9655f4b Bluetooth: hci_core: use skb_get() instead of
> skb_clone() for req_skb
>     68e7a31abc88b Bluetooth: hci_conn: re-enable advertising only for
> peripheral role
>     946d76db77ee5 Bluetooth: RFCOMM: serialize security confirmation
> handling
>     49fd7116f76b8 Bluetooth: ISO: fix use-after-free of listener socket i=
n
> iso_conn_ready
>     ec3992e38f777 Bluetooth: hci_uart: Fix false success return in
> hci_uart_setup()
>     62100186f1771 Bluetooth: hci_bcm: fix usage_count leak when
> autosuspend_delay is negative
>     1ed5982c53699 Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv
> reports on BCM4378
>     c674c504bfdd0 cxl/pmem: Format the nvdimm serial number as unsigned
> decimal
>     14d52c15d5d99 cxl/features: bound fwctl command payload to the input
> buffer
>     2924b2e365148 cpufreq: schedutil: Fix rate limit overflow
>     a807a9ef87ad0 coresight: etm3x: Fix cntr_val_show() to match
> cntr_val_store() behavior
>     ac4a5eb8b002a dm array: reject an array block whose value size is not
> the caller's
>     b33f76d33aaea dm array: validate array block headers on read
>     644140527ae49 dm raid1: reserve space for NUL-terminator in
> build_constructor_string()
>     36ff918637e35 dm-era: fix shadowed superblock leak on take-snap failu=
re
>     49694a363f7ec dm-io: report non-retryable errors separatedly
>     9493ac67623d4 dm-io: clone the source bio instead of copying its biov=
ec
>     272fcb4ba6fab bpf: Harden bloom filter sizing and indexing on 32-bit
> kernels
>     c9189693db47a buffer: avoid tail commit walk for uptodate folios
>     dbfecc8a6631c bpf: Disable preemption in __bpf_get_stack
>     6886642414f59 bpf, x86: Fix per-CPU address resolution into an
> extended register
>     49dcefa83c8ab bnxt_en: Write doorbell when linearizing skb fails
>     4d36e38e48340 bnx2x: fix double free in bnx2x_init_firmware() error
> path
>     c21fa79301d7d Bluetooth: eir: Fix OOB read in eir_get_service_data()
>     f609eac02d110 Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk
> to 0bda:a728
>     bce588b4ca081 Bluetooth: btusb: Add ASUS USB-BT600 for Realtek 8761CU
>     aa7b93fe98ba7 Bluetooth: btusb: Add ASUS USB-BT540 for Realtek 8761CU
>     ce76ca5fb2794 block: set QUEUE_FLAG_DYING unconditionally in
> blk_mark_disk_dead()
>     84858671842ae auxdisplay: charlcd: cancel backlight work on
> registration failure
>     c2e3dccd68706 ata: libata-scsi: fix DSM TRIM for sector sizes larger
> than 2048 bytes
>     fdc0a5e2cbace ARM: 9477/1: Disable broken eBPF JIT on the Risc PC
>     87d07aa5d38b6 alpha: marvel: Fix lock ordering in init_io7_irqs()
>     9e1eefc01912c alpha: marvel: Fix irq_set_status_flags to use correct
> IRQ number
>     2fd984c44e3e4 alpha/PCI: Fix I/O port accessor argument order in
> pci_legacy_write()
>     6d4ed2fd022bc ACPI: pfr_update: fix stack buffer overflow in
> query_capability()
>     452eb28e03015 ACPI: APEI: GHES: fix ARM section length accounting
> after header
>     b7476b29b6961 ACPI: APEI: Fix ERST timeout unit conversion
>     c735dbce7ad03 acpi/apei/ghes: Use raw_spinlock_t for CXL CPER work
> locks
>     9ad8821573a36 accel/rocket: Fix error path handling in rocket_job_run=
()
>     3043230296653 accel/rocket: initialize job domain before cleanup path=
s
>     c1a5bf1b6e1d5 accel/rocket: fix NULL dereference and integer overflow
> in rocket_job_push()
>     a3c65af20cceb hugetlb: only adjust reservation during unmapping if
> mapcount is 0
>     4e019e5e247bf hsi: omap_ssi_core: fix missing DMA mask setup for SSI
> controller device
>     137c61a6cfd96 fpga: stratix10-soc: Fix SVC mailbox handling during
> reconfiguration
>     0c3f4544ff387 forcedeth: fix off-by-one when saving/restoring non-PCI
> config space
>     466a8af0dee2c fbdev: uvesafb: unregister connector callback on init
> failure
>     3bcab9b21f71d fbdev: ssd1307fb: defer I2C transfers from damage
> callbacks
>     3c1b5809615c3 fbdev: pvr2fb: correct user pointer annotation and
> sentinel initializer
>     76818e81cfcae fbdev: omapfb: panel-dsi-cm: initialize lock before
> registering display
>     2f66f8ceefc25 fat: restore original value when fat_ent_write failed
>     66aa9a9e6481b fanotify: fix use-after-free of file range info
>     92895a14329cc efivarfs: Rate limit statfs() handler
>     ce568f6e025df ecryptfs: show filename encryption options
>     9319706316a8e ecryptfs: release message context on send failure
>     b31da1ecf1392 ecryptfs: reject too-small tag 70 packets
>     14cb36a500a5a ecryptfs: reject oversized encrypted_key_size in
> parse_tag_3_packet
>     e5d254e654f23 ecryptfs: pass packet set buffer size to parser
>     0d9636ecba34b ecryptfs: hold msg ctx list lock when cleaning daemon
> queue
>     c1bc956a615d0 ecryptfs: fix tag 11 packet exact-fit size check
>     98b890563424a eCryptfs: bound the packet-length peek to the user buff=
er
>     7ccb94901f38a fs/ntfs3: bound page_lcns[] index by the log record
>     376ee45659a4b fs/ntfs3: fix info-leak on partial LZNT decompress in
> ni_read_frame()
>     2d94ffc9d7b5b fs/ntfs3: validate dirty page table on log replay
>     5333e18e6b425 eventfs: Initialize ei->children and ei->list in
> init_ei()
>     b2301bdb4b3ed HID: intel-thc-hid: intel-quickspi: fix autosuspend
> cleanup during teardown
>     99f3e197920df HID: intel-thc-hid: intel-quicki2c: fix autosuspend
> cleanup during teardown
>     72706b44b6656 HID: intel-thc-hid: intel-quickspi: bound GET_REPORT
> response to the caller buffer
>     6fcefe71aeb52 HID: intel-thc-hid: intel-quickspi: validate report siz=
e
> before copy
>     127de5919820f HID: mcp2221: validate report size in mcp2221_raw_event=
()
>     c99ba6c234d4d HID: mcp2221: stop device IO before hid_hw_stop
>     01d9874e84d3a HID: universal-pidff: stop the device when
> force-feedback init fails
>     114a58640aaf3 HID: sony: fix UAF of ghl_poke_timer / ghl_urb at drive=
r
> unbind
>     f3f37b937a6ea HID: sensor: custom: Fix field sysfs group cleanup on
> failure
>     da00eac19feef HID: roccat: free buffered reports when destroying devi=
ce
>     471f4a939c66d HID: picolcd: clamp eeprom debugfs read to bytes
> actually received
>     79465a30050da HID: corsair-void: Check size of status and firmware
> events before reading them
>     e78973fe3ef59 HID: apple: preserve keyboard backlight across T2 resum=
e
>     846f0709559b9 smb: client: harden DFS cache against invalid target
> hints
>     17a1922ada873 smb: client: fix copy-paste error in WSL EA length
> accounting for $LXDEV
>     1f824f61d1df5 smb: client: fix ALIGN() overflow in symlink_data()
> error context loop
>     9ab46a13798a6 smb: client: clear ce->tgthint in free_tgts()
>     8b9b10fe5b8b4 cifs: use cifs_invalidate_cache() in cifs_do_truncate()
> for O_TRUNC
>     c2a0dcb5a7a15 cifs: fix loff_t underflow in cifs_remap_file_range()
> when len =3D=3D 0
>     4f18c9e7ee464 cifs: clear tcon after cifsFileInfo_put() in
> cifs_file_set_size()
>     636a99bab36ba audit: avoid dropping live tree ref on fsnotify rule
> autoremove
>     25128202a8df5 btrfs: do not overwrite NODATASUM flag when removing
> NODATACOW flag
>     f42efd634c0ae btrfs: fix extent map leak in NOCOW direct I/O write
>     8a64baeb5bbb7 btrfs: drop recovered reloc root refs on recovery failu=
re
>     ec32015a955c5 ceph: fix leaked inode reference on writeback abort at
> umount
>     37d6edb2f03b2 ceph: do not repeat ceph_trim_dentries() if no progress
> possible
>     1dd356310b166 ceph: bound xattr value length in __build_xattrs()
>     58c2d3e954c13 ceph: bound num_export_targets array for mds info v2/v3
>     c37db86d2b5e9 ceph: bound MDSCapAuth path and fs_name decode in
> handle_session()
>     06fb5e623cdc2 ceph: bound copied dentry name length in NFS export
> get_name
>     4d298880f82c4 ceph: reject export_targets ranks >=3D CEPH_MAX_MDS in
> mdsmap decode
>     fe46746087b5b ceph: fix UAF in __kick_flushing_caps() on cf entry
> freed during unlock
>     00562ccd4e88d libceph: reject buckets with mismatched CRUSH ids
>     2571b35883268 libceph: validate OSD extent maps before cursor advance
>     b413ec5b23e34 NFSD: Prevent client use-after-free during NFSv4.0
> revoked-state cleanup
>     4804c58f73a80 NFSD: Prevent lock owner use-after-free during client
> teardown
>     b56d2c5f01cdd nfsd: revoke copy-notify stateids before dropping their
> reference
>     dbc11a12aa545 nfsd: reject reclaim LOCK after RECLAIM_COMPLETE
>     ad02d095439f8 nfsd: reject out-of-range useconds in NFSv2
> SETATTR/CREATE
>     54e02f5e32c52 nfsd: reject out-of-range nseconds in NFSv3 SETATTR and
> create ops
>     4ae5d7490ae6a nfsd: move nfsd_debugfs_init() after nfsd4_init_slabs()
> in init_nfsd()
>     b57bd8cb739cb nfsd: initialize DRC hash table before registering
> shrinker
>     a4d7fedcaaf33 nfsd: initialize copy-notify stateid before publishing =
it
>     763c0bad87236 nfsd: hold rcu across localio cmpxchg retry
>     b3bff820d068e nfsd: gate nfs3 setacl by argp->mask
>     f951b22dbeec4 nfsd: gate nfs2 setacl by argp->mask
>     41ebca28e17f8 nfsd: fix XDR padding calculation in
> ff_encode_getdeviceinfo
>     0380129b1373c nfsd: fix XDR length calculation in
> nfsd4_ff_encode_layoutget
>     4106d7a6aaf1e nfsd: fix version mismatch loops in
> nfsd_acl_init_request()
>     9b4e5e9ba5ae1 nfsd: fix stale s2s_cp_stateids IDR entry for async COP=
Y
>     2ebbf4e3e9cf5 nfsd: fix reply size estimate for GET_DIR_DELEGATION
>     cf081015a0d1b nfsd: fix refcount leak in nfsd_file_lru_add on
> insertion failure
>     3c5119b799a7f nfsd: fix null dereference in nfsd4_setattr for deleg
> timestamp attrs
>     424d5c95108a4 nfsd: fix nfsd_file leak on inter-server COPY setup
> failure
>     360e1b9e3f316 nfsd: fix netlink dumpit error handling for
> rpc_status_get
>     65c79d9bb3717 nfsd: fix FL_SLEEP being set unconditionally for all
> LOCK types
>     c1ae0f973bcba nfsd: fix dentry ref leak on V4ROOT export filehandle
> lookup
>     a631a26a8777b nfsd: fix cpntf publish race in nfs4_init_cp_state
>     607a56fea772c nfsd: fix BUG_ON in nfsd4_alloc_layout_stateid on racin=
g
> delegation revoke
>     00843074d9b84 nfsd: drop the stateid, not the stateowner, on seqid_op
> replay retry
>     72d40b103bb03 nfsd: don't free session slots that are still in use
>     6703199f4d7e7 nfsd: defer vfree of compound ops to fix rpc_status UAF
>     631b7d5dbbba8 nfsd: defer setting NFSD4_CALLBACK_RUNNING in
> deleg_reaper
>     e879148867bd4 nfsd: clear opcnt on compound arg release to prevent OO=
B
> read
>     b137930ee52e3 nfsd: clear CALLBACK_RUNNING on failed delegation recal=
l
> queue
>     b42dc26a14b4a nfsd: check client ownership when cancelling a
> copy-notify stateid
>     311f7d9266309 nfsd: block non-SAVEFH ops after FOREIGN PUTFH to
> prevent NULL deref
>     1aea0482b98ec nfsd: add missing read barrier to rpc_status_get dumpit
> seqcount retry
>     bff024551a713 nfsd: add filehandle match check to nfsd4_delegreturn()
>     533964d420d38 nfsd: add fh_want_write() for early-verified SETATTR in
> nfsd_proc_setattr()
>     895a485cd3758 nfsd: validate symlink target length in NFSv4 CREATE
>     2aca70c18c5f5 nfsd: validate sockaddr length per family in listener_s=
et
>     7e7b93da7fa2e nfsd: validate nseconds in TIME_DELEG decode paths
>     7ff8d6363cfff nfsd: size fh_verify server sockaddr slot by xpt_locall=
en
>     1e4795766719f nfsd: set SC_STATUS_FREED in nfsd4_drop_revoked_stid fo=
r
> delegations
>     8277d4a11ae2c nfsd: sample writeback error cursor before async COPY
> loop
>     fc83f30731dd2 nfsd: return NFS4ERR_NOTSUPP for unsupported netloc4
> types
>     591134e059e34 nfsd: Reset write verifier when async COPY writeback
> fails
>     467d56fd3ff57 nfsd: release path refs on follow_down() error
>     f164eb52b6f3c nfsd: RCU-protect cl_cb_session to fix use-after-free o=
n
> session teardown
>     dc803d46a8b90 pNFS: Fix EBUSY check in pnfs_layout_need_return
>     36e3f13bf0728 NFSv4.1: fix layout segment leak on the
> pnfs_layout_process() forget path
>     59baf45a06435 nfsd: guard nfsd_serv deref in nfsd_file_net_dispose
>     7ef182a8fe9c1 NFSD: remove flawed WARN_ON_ONCE from nfsd_mode_check
>     4ed8d2317aef2 NFSD: restart ssc_expire_umount walk after dropping
> nfsd_ssc_lock
>     75d13317f163a NFSD: Fix off-by-one in DRC bucket pruning limit
>     e547b06234f88 NFSD: Encode only the status in NFS-ACL v2 GETACL error
> replies
>     d8352da196349 NFSD: check truncate permission under inode lock
>     f3adf16435173 NFS: fix delegation_hash_table leak when
> nfs4_server_common_setup() fails
>     5215e734bf7cb NFS/localio: fix ref leak on nfs_uuid_add_file failure
>     344ae0e232d4f zsmalloc: account for handle size in class lookup
>     923578d0f0d07 zram: validate deflate params
>     a1dc246f98bb9 ubifs: fix out-of-bounds read in signature length check
>     14afe18655c09 phy: rockchip-samsung-dcphy: fix out-of-range
> max_register
>     e892f05f1f790 PCI/sysfs: Fix out-of-bounds read in
> pci_write_legacy_io()
>     9253cfc5a85be of: fix out-of-bounds read in of_alias_scan() stem pars=
er
>     448636c745a3f nilfs2: fix slab-out-of-bounds in nilfs_direct_propagat=
e
> after truncation
>     8c14472431e27 media: vicodec: fix out-of-bounds write in FWHT encoder
>     0c260d3f97e52 media: cec: stm32: prevent out-of-bounds write on RX
> overflow
>     7d658da725ea8 lib/ucs2_string.c: fix out-of-bounds read in
> ucs2_strnlen()
>     9f43499ce6458 HID: sensor-hub: Fix out-of-bounds write in
> sensor_hub_get_feature
>     827ec385458ad fpga: altera-cvp: Avoid out-of-bounds read in trailing
> byte write
>     34e88f5361464 usb: gadget: f_fs: Prevent deadlock during ep0 read loo=
p
>     9897b7da8c0ad usb: gadget: uvc: fix dangling pointers in
> uvc_function_bind() and uvc_function_unbind()
>     dbe2762ae8e54 usb: gadget: uvc: Fix null pointer dereference in
> uvcg_video_init()
>     6bcd9ee6ad698 usb: gadget: f_tcm: fix deadlock in usbg_make_tpg()
>     a15c2acd30834 usb: gadget: midi2: remove default configfs groups on
> teardown
>     64005cf3e897e usb: gadget: snps_udc_plat: clean up PHY on probe
> deferral
>     4e747c864a885 usb: gadget: u_audio: Fix use-after-free on sound card
> disconnect
>     14fa29f3be066 usb: typec: ucsi: use UCSI_TIMEOUT_MS for sync command
> completion
>     ebb840d982a61 usb: typec: thunderbolt: Disable work before freeing tb=
t
> on remove
>     d793bd8422e78 usb: typec: tcpci: pass correct rx_type to
> tcpm_pd_receive()
>     12414bbd3e3f3 USB: phy: fsl-usb: fix missing static keywords
>     51a311eb97e91 usb: gadget: at91_udc: drain polled-VBUS timer/work
> before udc is freed
>     448e95c0f3eaa usb: dwc3: gadget: Fix use-after-free in
> dwc3_gadget_free_endpoints due to race condition
>     316abfe39dce7 usb: dwc2: gadget: Exit partial power down state when
> changing USB pull-up
>     78f5c6e6aef9a staging: greybus: hid: fix SET_REPORT return value
>     28b932202fcdb serial: imx: serialize imx_uart_ports[] lifetime
>     aad08b5f67d2a Revert "media: v4l2-dev: fix error handling in
> __video_register_device()"
>     e6e925cc1f806 rapidio: mport_cdev: fix use-after-free in dma_req_free=
()
>     c3d4be91c6fce powerpc/powermac: fix OF node refcount
>     29e634a18957a misc: nsm: bound the device-reported response length
>     ba69d892ff4e4 device property: fix infinite loop in
> fwnode_for_each_child_node()
>     4cd24873ab9fd cdx: Fix double free when sysfs file creation fails
>     b1a49c22de01f tracing: Fix use-after-free with same-name named trigge=
rs
>     ddbe921ed16a0 tracing: Fix use-after-free in trace_pipe read on
> sub-buffer order change
>     cdb6fb6cf1a7a tracing: Fix logged instance name on creation failure
>     adadf4192f700 tracing: Fix crash passing ERR_PTR to kthread_stop()
>     25a0758cf6bdb tracing/user_events: Clear copied tracing state before
> fork duplication
>     b503a61d5d392 hwtracing: hisi_ptt: Propagate DMA reset timeout in
> trace_start()
>     9b51dcb4f2305 x86/tdx: Fix zero-extension for 32-bit port I/O
>     c4a2215487081 x86/tdx: Fix off-by-one in port I/O handling
>     b9ae969e6f1e3 x86/locking: Use sfence for wmb() if SSE is available
>     08b4cdef3c2ef x86/insn-eval: Move assign_register() out of KVM as
> insn_assign_reg()
>     968eea4659420 tools/compiler: match glibc 2.42 definition of
> __attribute_const__
>     d4bf3a74e2bae mm: vmscan: fix node reclaim ignoring swappiness
> parameter
>     461d23368f296 mm: page_alloc: fix non-movable reclaim storm in
> defrag_mode
>     d435ba3c21a02 mm: page_alloc: move capture_control to the page
> allocator
>     0df04778ea14a mm: page_alloc: __GFP_FS lockdep annotation for direct
> compaction
>     b3d4b65085ef5 mm: mempolicy: fix automatic numa balancing for shmem
>     5d866086d5f8d mm: memcontrol: update state_local when flushing NMI
> stats
>     95d87030cae77 mm: memcg: stop reclaim when a limit update is supersed=
ed
>     680b93894ddf6 mm: memcg-v1: fix memsw and TCP failcnt accounting
>     d0943afb5ed8b mm: memcg-v1: fix wrong linux-mm list address in
> deprecation warnings
>     295f5a61d3aea mm: compaction: support non-movable compaction for
> pageblock requests
>     ef765a2e4f579 mm/zswap: fix global shrinker when memory cgroup is
> disabled
>     3fd5023998630 mm/vmscan: report RCU-tasks quiescent states in
> shrink_lruvec()
>     895cd4ecbb2e0 mm/pagewalk: fix stale walk->action escaping
> walk_pmd_range()
>     45489d4f95802 mm/mm_init: deferred_grow_zone(): fix out-of-range
> first_deferred_pfn
>     5dc0daff0341c mm/migrate: report RCU-tasks quiescent states in
> migrate_pages_batch()
>     3fc8044251de2 mm/kmemleak: avoid soft lockup when scanning task stack=
s
>     2cfa9ae90813b mm/gup: fix always draining LRU caches in
> collect_longterm_unpinnable_folios()
>     d423737dca23f mm, swap: ratelimit bad swap entry reports
>     f2c14f4d427d1 include/linux/list.h: mark list_add and __list_add as
> __always_inline
>     28069434aef66 apparmor: fix out-of-bounds write when null terminating
> a label vec
>     587a6a92b93ec apparmor: fix cred UAF caused by
> begin_current_label_crit_section()
>     753c978f2400f KEYS: trusted: Fix TPM teardown ordering
>     0a10989de6103 rust: kernel: list: fix incorrect pop_back example
> comment
>     138722d631acf rust: bug: skip arch-specific asm in `testlib` builds
>     2bf5e8f7c9bf4 timers/itimer: Zero-init old itimerval before copy to
> userspace
>     e6da8a0f39769 powerpc/pseries/iommu: switch to Default DMA window
> during kdump
>     c03114634d342 fs: fix user path of nested backing files
>     bf38be01d43c4 clocksource/drivers/timer-sun4i: Advertise a real
> minimum delta
>     d53c29a89a15e clocksource/drivers/nxp-pit: Fix IRQ leak on
> cpuhp_setup_state error path
>     312f85fdd029b alpha: don't leak hardware-fabricated FP exception bits
> to user space
>     c25b2aa077d5b rust: time: fix as_micros_ceil() rounding near i64::MAX
>     7d00a3ff6244f alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD
> unconditionally
>     4628e40c9ca79 drm/amd/display: Prune per-tile Timing from Apple Studi=
o
> Display Primary Tile
>     7d860bed13369 drm/amd/display: hide Apple Studio Display secondary ti=
le
>     c6b915f0df311 drm/amd/display: Refactor amdgpu_dm_connector_detect (v=
2)
>     a1fa3d1197cc2 drm/amd/display: Skip PHY SSC reduction on some 8K pane=
ls
>     d5c9d19b0ff2f netfs: Fix missing locking around retry adding new
> subreqs
>     ce493f9261cd3 platform/x86: lenovo-wmi-helpers: Fix memory leak in
> lwmi_dev_evaluate_int()
>     2ab18de5ebb11 drm/amd/display: Avoid NULL dereference in dc_dmub_srv
> error paths
>     24ebaf6676ae4 nsfs: tighten permission checks for handle opening
>     ea150ffa9fc9f bpf: Fix incorrect pruning due to atomic fetch precisio=
n
> tracking
>     5d562153b4719 ip_tunnel: adapt iptunnel_xmit_stats() to
> NETDEV_PCPU_STAT_DSTATS
>     a8bbb2a60513b fuse: wait for FR_FINISHED on abort_on_kill to prevent
> use-after-free
>     5fc3d921512d3 wifi: ath11k: fix memory leaks in beacon template setup
>     8527ac1bce87a wifi: mt76: Fix memory leak after
> mt76_connac_mcu_alloc_sta_req()
>     c79ef3342632e perf/x86/intel/uncore: Fix die ID init and look up bugs
>     1c732c6b94f0f Linux 6.18.49
>     5f08c45bdcfd2 usb: usbfs: fix use-after-free of usb_device in
> usbdev_release()
>     22edb67861272 wifi: mt76: mt7925: ensure tx headroom in
> usb_sdio_tx_prepare_skb
>     b4cb8081cf80f USB: c67x00: fix use-after-free in c67x00_add_iso_urb()
>     683df50fff0f5 USB: serial: spcp8x5: drop broken carrier detect suppor=
t
>     2ef5560387f2c USB: serial: option: fix slab OOB read in interrupt URB
> callback
>     6d3e202670b81 ALSA: usb-audio: Complete cleanup after system-resume
> errors
>     91919b3b99ab7 ALSA: usb-audio: fix OOB write in
> snd_usbmidi_novation_output()
>     7eb02825b3684 usb: core: Strengthen error handling in hub_hub_status(=
)
>     d80b946804674 usb: core: Add lock to usb_wakeup_notification()
>     935eeba276012 KVM: s390: vsie: zero stale crypto bits
>     545a6b9c91e2b crypto: qce - Remove unsafe/deprecated algorithms
>     182f16a20d329 crypto: mxs-dcp - fix source scatterlist length access
>     2f65718b9c109 crypto: qce - fix CCM AAD buffer underallocation
>     731a5b6fb4c17 crypto: krb5 - use kfree_sensitive() for derived key
> buffers
>     302ecd1106065 crypto: atmel-tdes - use scatterlist length before DMA
> mapping
>     4c00183209420 crypto: qcom-rng - Allow zero as a random number
>     14d9ee8286460 crypto: qcom-rng - Remove crypto_rng interface
>     070b73019a534 crypto: qcom-rng - Enable clock in hwrng case
>     5545de5050cbc crypto: virtio - bound the akcipher result length
>     e90bc78125cd7 kunit: irq: Continue increasing hrtimer interval for
> longer
>     34f3c35dd13a3 mm/swap: reject swapon() on filesystem-level encrypted
> files
>     6fa88d11983c6 netfilter: nf_tables: don't queue packet path object
> notifications
>     07ee91e6b7b0a netfilter: nft_set_pipapo_avx2: add missing vzeroupper
>     a8820c8a77183 vxlan: keep the last remote linked during FDB flush
>     916ec741e65af batman-adv: reject unrepresentable multicast TVLV offse=
ts
>     3e4476e58343f ipv6: seg6: clear IPv4 control block on IPIP
> decapsulation
>     c069f29da7232 net: bridge: mcast: fix use-after-free of a master
> VLAN's multicast context
>     50229d334558a xfrm: bound nat keepalive state collection
>     cf67361e78dca xfrm: fix xfrm_state_construct() auth-trunc leak
>     6733ae71268a2 xfrm: ah6: validate routing header segments_left
>     5c86c895d1cac xfrm: avoid lock inversion in nat keepalive work
>     328e40aa774b4 xfrm: drop ESP-in-TCP packets with no ingress device
>     24efebecf415b xfrm: espintcp: fix UAF during close
>     73fde8fe4469f net/tcp-ao: fix use-after-free of current_key on
> reconnect to another peer
>     70051a57786d5 tcp: fix AO info use-after-free in tcp_ao_connect_init(=
)
>     4527747760239 net/tcp: fix TCP-AO key deletion in VRFs
>     b5d1534db32af x86/CPU/AMD: Carve out a Zen5 models range
>     3d950e98f74af gtp: serialize PDP context updates
>     fadbc1ed2a872 tls: device: fix out-of-bounds write in tls_append_frag=
()
>     0b0a668febb62 KVM: SEV: Wire up kvm_x86_ops.gmem_xxx() if and only if
> CONFIG_KVM_AMD_SEV=3Dy
>     9a45e7b0b140a KVM: SEV: Mark vCPU RUNNABLE after AP_CREATE, even if
> VMSA is unusable
>     a3d45c2d645c6 KVM: SEV: Extract loading of guest-provided VMSA to a
> separate helper
>     2de20fea62043 KVM: SEV: Track the GPA of the guest-controlled VMSA
> used for SNP guests
>     dd1638c95163d KVM: SEV: Drop FOLL_WRITE for encrypted region
> registration
>     85aa61fedcb4e usb: gadget: f_tcm: keep port count until LUN teardown
> completes
>     3f6face69034f usb: usbtest: disable dynamic ID support
>     776e85fda752f fuse: fix invalidate lock leak on open O_TRUNC DAX
> failure
>     1758730d9eaa3 fuse: fix invalidate lock leak on setattr writeback
> failure
>     0f127d522dbcb xhci: dbgtty: Fix unregister on tty_alloc_driver()
> failure
>     0d0faf3cc44c4 xhci: dbgtty: Fix unregister on tty_register_driver()
> failure
>     45dbddc389c59 usb: xhci: Handle USB3 port events when there is one
> roothub
>     56f20a406cc3b usb: xhci: Handle bogus TRB pointers in Missed Service
> Error events
>     9786c42df8efb accessibility: speakup: unregister tty ldisc on later
> init failures
>     8ec7271e05df7 fpga: dfl: fme: add error handling
>     6106fb7962a00 ksmbd: harden file lifetime during session teardown
>     a8e1f970f9040 HID: ft260: fix stack-use-after-return write in I2C rea=
d
> race
>     30c37ac21a458 HID: ft260: validate i2c input report length
>     8b5debb6252cd HID: asus: fix missing hid_is_usb() check
>     d0754db7883c8 HID: asus: simplify RGB init sequence
>     70589b0c005db HID: magicmouse: prevent unbounded recursion in
> magicmouse_raw_event()
>     e22f4494cc948 io_uring: defer eventfd signaling when queued from a
> wakeup handler
>     0bcec5dda029c io_uring/rsrc: improve regbuf iov validation
>     e973a371d35a2 io_uring: simplify IORING_SETUP_DEFER_TASKRUN && !SQPOL=
L
> check
>     2b7c6b90ce801 io_uring/futex: only mark private futex waits as inflig=
ht
>     b61ebb2826ca1 powerpc/hv-gpci: fix preempt count leak in sysfs show
> paths
>     f2192741bdfc7 veth: fix OOB txq access in veth_poll() with asymmetric
> queue counts
>     34aef83af724a selinux: switch two allocations to use kzalloc_objs()
>     caacbfb367210 ASoC: nau8821: Cancel pending work before suspend
>     0599aa23734c4 riscv: Fix register corruption from uninitialized cregs
> on error
>     85dc711f742b1 bpf: Fix use-after-free in offloaded map/prog info fill
>     13d20517bee1c ASoC: nau8821: Cancel delayed work on component remove
>     9ebaeeb6c2d42 selinux: require a class's permission values to cover
> its permission count
>     dfc59a062c386 selinux: reject a permission value exceeding the class
> permission count
>     42c5747a9f839 selinux: more strict policy parsing
>     4ac3cc8a14db6 selinux: use u16 for security classes
>     71ecdc1ba07fd Revert "selinux: reject a permission value exceeding th=
e
> class permission count"
>     64561afb42d83 nvme-tcp: fix usage of page_frag_cache
>     c0a9bd5fca0b5 KVM: x86/mmu: Check write tracking in all address space=
s
>     8be5f23ae9490 drm/xe/guc_ads: use uncached mapping for UM queue BO
>     a65b52f6cdc92 drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
>     af2d3f6f29b07 drm/xe/guc_ads: allocate UM queues in a separate BO
>     bdf5deccfbf9f RDMA/rxe: Fix OOB in free_rd_atomic_resources()
>     ffa4f0be69656 RDMA/rxe: Fix responder UAF on IB_QP_MAX_DEST_RD_ATOMIC
> modify_qp
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
>  .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> index 55f3fe8907..d4ca18a7b2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> @@ -15,13 +15,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "c82ff0cbda2a00b9073e06c9fe4ba550c9056d45"
> -SRCREV_meta ?=3D "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
> +SRCREV_machine ?=3D "ed7481e8a1df4a3417915acd6bef5a72d6fa71bb"
> +SRCREV_meta ?=3D "bf8faf1b184fcf6c555ee951f501e76f88eccf35"
>
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.18;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.18;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
> -LINUX_VERSION ?=3D "6.18.48"
> +LINUX_VERSION ?=3D "6.18.50"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> index 3b1342d677..56a3d18ee5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> @@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
>  include recipes-kernel/linux/cve-exclusion.inc
>  include recipes-kernel/linux/cve-exclusion_6.18.inc
>
> -LINUX_VERSION ?=3D "6.18.48"
> +LINUX_VERSION ?=3D "6.18.50"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> @@ -18,8 +18,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
> -SRCREV_meta ?=3D "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
> +SRCREV_machine ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e1"
> +SRCREV_meta ?=3D "bf8faf1b184fcf6c555ee951f501e76f88eccf35"
>
>  PV =3D "${LINUX_VERSION}+git"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> index 8030143479..719c1fa51a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> @@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?=3D "v6.18/standard/base"
>  KBRANCH:qemuloongarch64  ?=3D "v6.18/standard/base"
>  KBRANCH:qemumips64 ?=3D "v6.18/standard/mti-malta"
>
> -SRCREV_machine:qemuarm ?=3D "0f778c0a178fdc50063c212b5320b1f082f83f1a"
> -SRCREV_machine:qemuarm64 ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
> -SRCREV_machine:qemuloongarch64 ?=3D
> "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
> +SRCREV_machine:qemuarm ?=3D "dbe5ee845060d0b8ddf934a2e3d96627fdb1bd81"
> +SRCREV_machine:qemuarm64 ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e1"
> +SRCREV_machine:qemuloongarch64 ?=3D
> "aba8c69040fd3d5763477a733b4696a79c0514e1"
>  SRCREV_machine:qemumips ?=3D "62ea92a539f58803a222be98b81118403074206e"
> -SRCREV_machine:qemuppc ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
> -SRCREV_machine:qemuriscv64 ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0=
a"
> -SRCREV_machine:qemuriscv32 ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0=
a"
> -SRCREV_machine:qemux86 ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
> -SRCREV_machine:qemux86-64 ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a=
"
> +SRCREV_machine:qemuppc ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e1"
> +SRCREV_machine:qemuriscv64 ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e=
1"
> +SRCREV_machine:qemuriscv32 ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e=
1"
> +SRCREV_machine:qemux86 ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e1"
> +SRCREV_machine:qemux86-64 ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e1=
"
>  SRCREV_machine:qemumips64 ?=3D "9fb4ff0187c85426f21fd40d4c61b742800f65c4=
"
> -SRCREV_machine ?=3D "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
> -SRCREV_meta ?=3D "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
> +SRCREV_machine ?=3D "aba8c69040fd3d5763477a733b4696a79c0514e1"
> +SRCREV_meta ?=3D "bf8faf1b184fcf6c555ee951f501e76f88eccf35"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream',
> and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the
> same
>  # meta SRCREV as the linux-yocto-standard builds. Select your version
> using the
>  # normal PREFERRED_VERSION settings.
>  BBCLASSEXTEND =3D "devupstream:target"
> -SRCREV_machine:class-devupstream ?=3D
> "5bbb9c9f8f808710e2123f2b30f0d61d7d698f52"
> +SRCREV_machine:class-devupstream ?=3D
> "7cfc41f8e80f11ffa8382ed1a505154ceffb79c7"
>  PN:class-devupstream =3D "linux-yocto-upstream"
>  KBRANCH:class-devupstream =3D "v6.18/base"
>
> @@ -43,7 +43,7 @@ SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7B=
KBRA>
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.18;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.18;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -LINUX_VERSION ?=3D "6.18.48"
> +LINUX_VERSION ?=3D "6.18.50"
>
>  PV =3D "${LINUX_VERSION}+git"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245906):
> https://lists.openembedded.org/g/openembedded-core/message/245906
> Mute This Topic: https://lists.openembedded.org/mt/121269558/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003e72b8065b8c8b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">The=
re&#39;s no second patch coming, it went to the yocto list for BSPs!</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Sep 15, 2026 at 5:48=E2=80=AFPM Bruce Ashfield via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;bruce.ashfield=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail=
.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Updating linux-yocto/6.18 to the latest korg -stable release that comprises=
<br>
the following commits:<br>
<br>
=C2=A0 =C2=A0 7cfc41f8e80f1 Linux 6.18.50<br>
=C2=A0 =C2=A0 8e30f5427f345 mm/rmap: use huge_ptep_get() in try_to_unmap_on=
e()<br>
=C2=A0 =C2=A0 381a0a524e967 mm: avoid unnecessary use of is_swap_pmd()<br>
=C2=A0 =C2=A0 6a259dd313043 platform/chrome: sensorhub: Fix dropped timesta=
mp events and log spam<br>
=C2=A0 =C2=A0 e91d66e5ff661 selftests/mm: fix on-fault-limit false failure =
under sudo-rs<br>
=C2=A0 =C2=A0 2d6150e5e6aa6 udf: Fix i_lenExtents truncation on 32-bit kern=
els<br>
=C2=A0 =C2=A0 b7eff3f621ef2 timer: Keep debugobjects state consistent in mi=
grate_timer_list()<br>
=C2=A0 =C2=A0 fecf1e3777526 timekeeping: Check the return value of tk_get_a=
ux_ts64 in __do_adjtimex()<br>
=C2=A0 =C2=A0 6067c39c2cec1 taskstats: fix cpumask parsing cutting off the =
last character<br>
=C2=A0 =C2=A0 ed64aa505875a smack: fix cred UAF in smack_file_send_sigiotas=
k()<br>
=C2=A0 =C2=A0 a246da20c8e4a signal: avoid shared siginfo namespace rewrites=
<br>
=C2=A0 =C2=A0 236c8ecaafc63 sticon/parisc: Detect default STI graphics card=
 for console output<br>
=C2=A0 =C2=A0 e8527de7fea19 sysctl: move the &quot;cad_pid&quot; entry from=
 pid_table[] to kern_reboot_table[]<br>
=C2=A0 =C2=A0 cde2d927c29e8 tpm: tpm_i2c_nuvoton: disable IRQ on wait timeo=
ut<br>
=C2=A0 =C2=A0 c3c7e87c76b42 zloop: truncate finished zones to zone capacity=
<br>
=C2=A0 =C2=A0 f49e55b1c8fe1 xarray: honor XA_FLAGS_ACCOUNT in xas_split_all=
oc()<br>
=C2=A0 =C2=A0 ae0c79a852704 w1: ds28e17: reject an oversize length on an I2=
C block read<br>
=C2=A0 =C2=A0 165a330a68b5f vsock/virtio: flush works in dependency order<b=
r>
=C2=A0 =C2=A0 03b81f015dbb2 wifi: mt76: mt7996: validate default EEPROM fir=
mware size<br>
=C2=A0 =C2=A0 01f2e0da8548f wifi: mt76: mt7996: fix TX DMA mapping leak for=
 AddBA req frames<br>
=C2=A0 =C2=A0 304470333b7f5 wifi: mt76: mt7925: cancel mlo_pm_work on stop<=
br>
=C2=A0 =C2=A0 5fdaf7016d768 wifi: mt76: mt7915: bound the device EEPROM add=
ress before the EFUSE copy<br>
=C2=A0 =C2=A0 4506e229b2e46 wifi: mt76: mt7615: avoid waiting for mac work =
under the mt76 mutex<br>
=C2=A0 =C2=A0 34a505071d1ff wifi: rtw88: pci: fix resource leak on failed N=
API setup<br>
=C2=A0 =C2=A0 7364713f0931e wifi: rtw88: Fix potential memory leak in rtw_t=
xq_push_skb()<br>
=C2=A0 =C2=A0 dc8b0be0ec4d9 wifi: rtlwifi: rtl8192du: Fix possible memory l=
eak in rtl92du_init_sw_vars()<br>
=C2=A0 =C2=A0 0c0b374e12d52 wifi: rtlwifi: rtl8192du: check QoS TID before =
indexing tids<br>
=C2=A0 =C2=A0 97a1af5ac131b wifi: rtl818x: initialize eeprom_93cx6 struct t=
o zero<br>
=C2=A0 =C2=A0 b1bbeb8970eeb wifi: mwifiex: Detach sync cmd buffer on interr=
upted wait<br>
=C2=A0 =C2=A0 7c257a295e05c crypto: sun8i-ss - Remove crypto_rng interface<=
br>
=C2=A0 =C2=A0 8e4f9110aba31 crypto: sun8i-ce - Remove crypto_rng interface<=
br>
=C2=A0 =C2=A0 620acb1e8037b wifi: rtl8xxxu: fix use-after-free from rx_urb_=
wq on stop<br>
=C2=A0 =C2=A0 84ba017a1e1ea wifi: iwlwifi: dvm: fix memory leak in iwl_op_m=
ode_dvm_start()<br>
=C2=A0 =C2=A0 261d7c7610b4b wifi: brcmfmac: Fix memory leak in brcmf_sdio_r=
ead_control()<br>
=C2=A0 =C2=A0 7ef23317f9976 i3c: renesas: Reconfigure the DATBAS register o=
n re-attach<br>
=C2=A0 =C2=A0 9382fcf3a8c44 i3c: renesas: Clean DATBAS register on detach<b=
r>
=C2=A0 =C2=A0 0093f9fc102ba i3c: renesas: Check that the transfer is valid =
before accessing it<br>
=C2=A0 =C2=A0 5697d779577e2 i3c: master: svc: bound IBI payload to the requ=
ested max_payload_len<br>
=C2=A0 =C2=A0 94fb9786d67a8 i3c: master: Fix info leak and UAF in device un=
register path<br>
=C2=A0 =C2=A0 a15a1b95de980 i3c: master: adi: initialize the lock before en=
abling interrupts<br>
=C2=A0 =C2=A0 1894fc7a3bab9 dm-pcache: fix use-after-free and invalid seg o=
perations in kset_replay()<br>
=C2=A0 =C2=A0 10acf740c3adb dm-pcache: fix implicit u8 truncation of gc_per=
cent in message handler<br>
=C2=A0 =C2=A0 83e3116283ed2 dm-pcache: only hand out initialized cache segm=
ents<br>
=C2=A0 =C2=A0 663ee2f3824a5 dm-pcache: detect a cycle in the last-kset chai=
n during replay<br>
=C2=A0 =C2=A0 2cd9776fe3f2d dm-pcache: clamp the tail kset read to the segm=
ent data region<br>
=C2=A0 =C2=A0 ffd9a214a94f9 dm-pcache: bound the persisted tail-position of=
fset<br>
=C2=A0 =C2=A0 91b93fe5cf4d6 dm-pcache: validate on-media seg_num against th=
e cache device size<br>
=C2=A0 =C2=A0 d8caf96040a06 dm-pcache: validate kset key_num and intra-segm=
ent bounds<br>
=C2=A0 =C2=A0 ab5dcde6fa96b dm-pcache: validate geometry fields from on-dis=
k cache_info<br>
=C2=A0 =C2=A0 296efdc110b10 dm-switch: use WRITE_ONCE() in switch_region_ta=
ble_write()<br>
=C2=A0 =C2=A0 74210fa072960 dm-stats: fix a crash if allocation of per-cpu =
data fails<br>
=C2=A0 =C2=A0 c860cd3f40382 arch_numa: avoid false positive fortify warning=
 in setup_node_to_cpumask_map()<br>
=C2=A0 =C2=A0 edf30d65e3ac5 net/smc: carry oversized SMC-Rv2 LLC messages i=
n the queue entry<br>
=C2=A0 =C2=A0 44dc702be9a9e rust: rust_is_available: warn for `bindgen` &lt=
; 0.72.1 &amp;&amp; libclang &gt;=3D 22<br>
=C2=A0 =C2=A0 b5fe67111e63a ovpn: run deferred work on a module-owned workq=
ueue<br>
=C2=A0 =C2=A0 50f4a793c4ff2 ring-buffer: Fix subbuf resize race with ring b=
uffer readers<br>
=C2=A0 =C2=A0 22fe01a2e2f7c ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP=
10 quirk ordering<br>
=C2=A0 =C2=A0 37c3210c491ac ALSA: hda/realtek: Enable micmute LED on HP Eli=
teBook 6 G1a p/n: AD3Q9ET#UUG<br>
=C2=A0 =C2=A0 8acb66d0513de ALSA: hda/realtek: Add quirk for TongFang XxAF5=
xxx<br>
=C2=A0 =C2=A0 40ee4224e2fe2 ALSA: virmidi: Check card index validity at pro=
be<br>
=C2=A0 =C2=A0 7555e83d7738e ALSA: serial-u16550: Check card index validity =
at probe<br>
=C2=A0 =C2=A0 d7ef7890e3e35 ALSA: portman2x4: Check card index validity at =
probe<br>
=C2=A0 =C2=A0 7ef9ad82d95dd ALSA: pcxhr: initialize mutexes before requesti=
ng threaded IRQ<br>
=C2=A0 =C2=A0 a4e774eeb61ae ALSA: mts64: Check card index validity at probe=
<br>
=C2=A0 =C2=A0 cc4215cc2a4b2 ALSA: mpu401: Check card index validity at prob=
e<br>
=C2=A0 =C2=A0 13d61a920435d ALSA: hda/ext: preserve PPLCCTL bits when clear=
ing reset<br>
=C2=A0 =C2=A0 7df3194bdb747 ALSA: bcd2000: clear the URB pointers on discon=
nect<br>
=C2=A0 =C2=A0 7b3f985584936 ALSA: aloop: Check card index validity at probe=
<br>
=C2=A0 =C2=A0 2a6f6fba3bd31 ALSA: 6fire: bound the MIDI event length from t=
he device<br>
=C2=A0 =C2=A0 94ca4f040ba48 mfd: sm501: Fix potential memory leaks during r=
emove<br>
=C2=A0 =C2=A0 5e7fe9c6c8c31 mfd: cgbc: Fix teardown ordering in cgbc_remove=
()<br>
=C2=A0 =C2=A0 efe0ed4c0f4e8 hwrng: stm32 - Fix runtime PM cleanup on regist=
ration failure<br>
=C2=A0 =C2=A0 cfa186a0857a0 seg6: reset IP6CB after IPv6 decapsulation<br>
=C2=A0 =C2=A0 288f997067084 net: skbuff: don&#39;t touch shared zerocopy st=
ate in skb_tx_error()<br>
=C2=A0 =C2=A0 34ab62c959f5f net: fix spurious TX timeout after dev_activate=
()<br>
=C2=A0 =C2=A0 af0ee8f04bea2 net: cap advertised IP tunnel headroom<br>
=C2=A0 =C2=A0 5bd8b764a610b net/smc: unregister the connection before drain=
ing the rx tasklet<br>
=C2=A0 =C2=A0 313f79149eb33 net/smc: stop killed, freed and out_of_sync sha=
ring a byte<br>
=C2=A0 =C2=A0 c52a998a223e7 net/smc: fix use-after-free of the LLC qentry i=
n smc_llc_srv_add_link()<br>
=C2=A0 =C2=A0 0761e49aa78c2 net/smc: fix use-after-free in smc_rx_pipe_buf_=
release()<br>
=C2=A0 =C2=A0 d89dc1bd8845c net/smc: fix socket refcount leak in smc_switch=
_conns()<br>
=C2=A0 =C2=A0 f950e1b1f0aad net/smc: do not dereference an unset send buffe=
r on the SMC-D teardown path<br>
=C2=A0 =C2=A0 486c699a8cde8 net/smc: bound the peer rkey counts in SMC-Rv2 =
LLC messages<br>
=C2=A0 =C2=A0 b893152a886bb net: ntb_netdev: Count packets dropped on RX re=
fill failure<br>
=C2=A0 =C2=A0 4fac86e976975 net: ntb_netdev: Avoid double-accounting netif_=
rx() drops<br>
=C2=A0 =C2=A0 dfab7171cd391 net: ntb_netdev: Fix TX busy and drop handling<=
br>
=C2=A0 =C2=A0 6b6bbc6c878d6 NTB: ntb_transport: Reject oversized TX buffers=
<br>
=C2=A0 =C2=A0 894e136b432da NTB: ntb_transport: Fail TX enqueue when the QP=
 link is down<br>
=C2=A0 =C2=A0 0c4aabc904490 NTB: ntb_transport: Recycle TX entries before c=
lient callbacks<br>
=C2=A0 =C2=A0 f01e6a35c440b net: thunderbolt: Mark the connection down when=
 bringing it up fails<br>
=C2=A0 =C2=A0 61ff3c353e5d2 net: thunderbolt: Release the Rx HopID that was=
 handed out on mismatch<br>
=C2=A0 =C2=A0 67a82e6f886be net: ravb: serialize PTP clock teardown<br>
=C2=A0 =C2=A0 8d4d06d6e2b50 net: ravb: avoid dereferencing an invalid PTP c=
lock<br>
=C2=A0 =C2=A0 b6b533f83461c net: phylink: correctly validate returned PCS i=
n phylink_inband_caps<br>
=C2=A0 =C2=A0 0860af127aa79 net: openvswitch: fix nf_connlabels leak in ovs=
_ct_init<br>
=C2=A0 =C2=A0 ac73e3af571da net: openvswitch: fix flow mask use-after-free =
on flow deletion<br>
=C2=A0 =C2=A0 9c340473f4822 net: l2tp: do not propagate multicast notificat=
ion errors<br>
=C2=A0 =C2=A0 62da38b4b3a0d net: ipa: fix stalled modem TX queue after runt=
ime resume<br>
=C2=A0 =C2=A0 42a33e679ea05 net: ibm: emac: mal: fix NAPI locking<br>
=C2=A0 =C2=A0 f71087e7c63aa net: dsa: realtek: use gpiod_set_value_cansleep=
 for reset GPIO<br>
=C2=A0 =C2=A0 e098d9cc88596 net: tun: bound receive headroom<br>
=C2=A0 =C2=A0 32785d75e60df net: usb: qmi_wwan: add Telit Cinterion FE990D5=
0 composition<br>
=C2=A0 =C2=A0 486577db80789 slip: fix use-after-free in sl_sync()<br>
=C2=A0 =C2=A0 15d1f3c0dbe7a xdp: fix zero-copy frame layout<br>
=C2=A0 =C2=A0 8e3763f1ccac3 net/iucv: filter frames in afiucv_hs_rcv() by i=
ngress device<br>
=C2=A0 =C2=A0 99692252b348c ipmi:msghandler: Cancel work cleanly on an erro=
r<br>
=C2=A0 =C2=A0 53af3a8bae0a9 ipmi: si: Fix NULL pointer dereference after fa=
iled registration<br>
=C2=A0 =C2=A0 d46c97eddcbc5 ipmi: Remove all sysfs files on registration fa=
ilure<br>
=C2=A0 =C2=A0 5719431ca2b5f ipmi: ipmb: validate write message length<br>
=C2=A0 =C2=A0 db8147c5d5ad2 interconnect: Fix use after free in icc_get() a=
nd of_icc_get_by_index()<br>
=C2=A0 =C2=A0 417e02f7b6051 io_uring/query: cap user size passed to copy_st=
ruct_to_user<br>
=C2=A0 =C2=A0 0c12a798078bc platform/x86: hp-bioscfg: warn on element type =
mismatch instead of failing<br>
=C2=A0 =C2=A0 a38127df99ae8 platform/x86: hp-bioscfg: pass validated elemen=
t count to package parsers<br>
=C2=A0 =C2=A0 95d2f9b5189d0 platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS=
 never being parsed<br>
=C2=A0 =C2=A0 b15b334fbc3c0 platform/x86: hp-bioscfg: fix off-by-one write =
in hp_get_string_from_buffer()<br>
=C2=A0 =C2=A0 e3c1c5d1c9230 platform/x86: hp-bioscfg: fix new_password_stor=
e() overwriting current_password<br>
=C2=A0 =C2=A0 0f9aad0842488 platform/x86: hp-bioscfg: fix heap OOB read on =
empty password write<br>
=C2=A0 =C2=A0 7cd8fe01aba30 platform/x86: hp-bioscfg: fix heap OOB read in =
sk_store() and kek_store()<br>
=C2=A0 =C2=A0 dea1a41160e70 platform/x86: hp-bioscfg: bound ordered-list pa=
rsing by the package count<br>
=C2=A0 =C2=A0 0cd1530f84e1c platform/x86: hp-bioscfg: advance elem past con=
sumed array elements<br>
=C2=A0 =C2=A0 0a14d35ef529a platform/x86: hp-bioscfg: accept reduced ACPI p=
ackages from older HP BIOS<br>
=C2=A0 =C2=A0 bc9aa5fe21c39 platform/x86/amd/pmc: Fix LPS0 and debugfs leak=
s when STB init fails<br>
=C2=A0 =C2=A0 8178f59d76570 platform/x86/amd/pmc: Propagate SMU errors and =
validate S2D address<br>
=C2=A0 =C2=A0 98d91d5b6a988 platform/x86/amd/pmc: Restore msg_port on amd_s=
tb_s2d_init() error paths<br>
=C2=A0 =C2=A0 5eaf7faa99578 platform/chrome: sensorhub: Bound the EC-report=
ed sensor number<br>
=C2=A0 =C2=A0 56dc46094973d platform/x86: think-lmi: Fix current password l=
ength check<br>
=C2=A0 =C2=A0 9c28adde051fe platform/x86: think-lmi: Free system certificat=
e signatures<br>
=C2=A0 =C2=A0 89a076948ed61 platform/x86: think-lmi: Fix certificate thumbp=
rint sysfs output<br>
=C2=A0 =C2=A0 d7cd3e4d76034 platform/x86: lenovo/ymc: Only match lower byte=
 in WMI lid switch query response<br>
=C2=A0 =C2=A0 e1b3f89673bd1 platform/x86: ishtp_eclite: Fix ACPI device ref=
erence leak in probe error path<br>
=C2=A0 =C2=A0 e07a42bb9c909 platform/x86: ISST: Return error during profile=
 addition<br>
=C2=A0 =C2=A0 62840acc3044f platform/x86: ISST: Validate parameter for freq=
uency and priority<br>
=C2=A0 =C2=A0 93268bc3cd84f platform/x86: ISST: Validate parameter for core=
 power state<br>
=C2=A0 =C2=A0 5b032e1dda486 platform/x86: ISST: Validate logical CPU id and=
 clos id<br>
=C2=A0 =C2=A0 b14db79d02bd3 platform/x86: ISST: Use PP level enable mask<br=
>
=C2=A0 =C2=A0 92c5fffa63ad9 platform/x86: ISST: Just allow 2 bits for SST f=
eature enable<br>
=C2=A0 =C2=A0 c280fcd53b938 platform/x86: ISST: Add a NULL check for sst_in=
st[]<br>
=C2=A0 =C2=A0 2550f89589caa mmc: via-sdmmc: stop card-detect handling on pr=
obe failure<br>
=C2=A0 =C2=A0 f7ff3027ef004 mmc: via-sdmmc: cancel card-detect work on remo=
ve<br>
=C2=A0 =C2=A0 82e707eff9e3b platform/x86: ISST: Validate socket ID in clos_=
assoc ioctl<br>
=C2=A0 =C2=A0 1889a9156553f platform/x86: ISST: Validate level in perf mask=
 ioctls<br>
=C2=A0 =C2=A0 22222f92b0a51 platform/x86: dell-wmi-sysman: Don&#39;t hex du=
mp attribute security buffer<br>
=C2=A0 =C2=A0 cab2895729516 iommufd: Fix UAF in selftest IOPF reporting<br>
=C2=A0 =C2=A0 4c33d00ad9a91 iommufd: Release current IOAS on xa_store() fai=
lure<br>
=C2=A0 =C2=A0 436189ee4bb2c iommufd: Avoid locking internal accesses during=
 unmap<br>
=C2=A0 =C2=A0 45705a6bfdb28 iommu/vt-d: Force requesting ACS when tboot is =
enabled<br>
=C2=A0 =C2=A0 364279b5623f7 iommu/vt-d: Fix no_iommu to disable platform op=
t-in<br>
=C2=A0 =C2=A0 f80f3acb69164 iommu: Fix dev_iommu memory leak when device_ad=
d fails in iommu_mock_device_add<br>
=C2=A0 =C2=A0 2235eafda9b3d iommu/arm-smmu-v3: Manage teardown with devm<br=
>
=C2=A0 =C2=A0 d903d99ffd22b iommu/tegra241-cmdqv: Reject a vSID wider than =
the SID_MATCH field<br>
=C2=A0 =C2=A0 968e9a1f71140 iommu/sva: Set handle-&gt;dev before the SVA ha=
ndle is visible<br>
=C2=A0 =C2=A0 f532401be9312 iommu/msm: Unwind probe state on registration f=
ailure<br>
=C2=A0 =C2=A0 cfc5c1b2caa17 iommu/amd: Put PCI device after handling PPR fa=
ults<br>
=C2=A0 =C2=A0 238e1f7a1463f PCI/proc: Warn on writes to kernel-exclusive co=
nfig space regions<br>
=C2=A0 =C2=A0 c2d4174f49245 PCI/proc: Use file_ns_capable() when checking c=
onfig space read access<br>
=C2=A0 =C2=A0 301288f85679a PCI/proc: Avoid spurious runtime PM wakeup on c=
onfig space accesses<br>
=C2=A0 =C2=A0 b30713111325e PCI/MSI: Enable memory decoding before restorin=
g MSI-X messages<br>
=C2=A0 =C2=A0 0e59a232aaa04 PCI/ASPM: Avoid L0s for Realtek RTS525A<br>
=C2=A0 =C2=A0 39c4dc79d77f8 PCI/AER: Fix mapping of errors to agent &amp; l=
ayer<br>
=C2=A0 =C2=A0 4f887d8ed75f8 PCI/AER: Emit TLP Log only for unmasked errors<=
br>
=C2=A0 =C2=A0 6beadccc432cf PCI/sysfs: Avoid spurious runtime PM wakeup on =
config space accesses<br>
=C2=A0 =C2=A0 7f4db64f0ba7b PCI/sysfs: Fix read byte order in pci_read_lega=
cy_io()<br>
=C2=A0 =C2=A0 43cf455dd5a9b PCI: Add ACS quirk for Pericom PI7C9X2G608 swit=
ches [12d8:2608]<br>
=C2=A0 =C2=A0 4b575052ea654 PCI: plda: Fix IRQ domain leaks in the error pa=
ths of plda_init_interrupts()<br>
=C2=A0 =C2=A0 01c2f0c66bd1f PCI: plda: Fix use-after-free of event IRQs dur=
ing teardown<br>
=C2=A0 =C2=A0 5d4bc470330a6 PCI: meson: Fix GPIO state while requesting PER=
ST#<br>
=C2=A0 =C2=A0 1ad6994853853 PCI: Fix 32-bit config write in Intel PCH Root =
Port MPC ACS quirk<br>
=C2=A0 =C2=A0 6053d6eacbfd2 PCI: hv: Set irq_retrigger callback for the Hyp=
er-V PCI MSI irqchip<br>
=C2=A0 =C2=A0 ceafb262475ac s390/dasd: Propagate partial completion length =
across ERP recovery<br>
=C2=A0 =C2=A0 6452c13646af7 s390/dasd: Guard sysfs discipline callbacks aga=
inst unallocated private data<br>
=C2=A0 =C2=A0 52b331c99baac s390/dasd: Do not complete a failed ESE read as=
 successful<br>
=C2=A0 =C2=A0 dcce7a06ea690 s390/cpum_cf: Handle CPU hotplug via prepare/de=
ad callbacks<br>
=C2=A0 =C2=A0 aad7247bd35ad power: supply: max17040: synchronize work cance=
llation on suspend<br>
=C2=A0 =C2=A0 17d43f64b17e4 power: supply: max17040: drop incorrect I2C fun=
ctionality check<br>
=C2=A0 =C2=A0 13fb0477da9b4 power: supply: max17040: propagate register rea=
d errors<br>
=C2=A0 =C2=A0 39b60d615dfa1 power: supply: ucs1002: fix use-after-free on r=
emove<br>
=C2=A0 =C2=A0 a4460e89d4088 power: supply: twl4030_charger: cancel workers =
via devm<br>
=C2=A0 =C2=A0 1b9978433c61a power: supply: rt9455: quiesce delayed work bef=
ore teardown<br>
=C2=A0 =C2=A0 ee053561e21ce power: supply: qcom_battmgr: terminate the stri=
ngs from firmware<br>
=C2=A0 =C2=A0 06618447029c6 power: supply: qcom_battmgr: fix use-after-free=
<br>
=C2=A0 =C2=A0 b3aa1e9509e1b power: supply: lp8788-charger: fix use-after-fr=
ee on remove<br>
=C2=A0 =C2=A0 ab6b1ad710bed power: supply: lp8727: fix use-after-free in lp=
8727_release_irq()<br>
=C2=A0 =C2=A0 4b1f2be1e1b74 power: supply: cros_usbpd: Limit port counts to=
 EC_USB_PD_MAX_PORTS<br>
=C2=A0 =C2=A0 78be8b7403ff7 power: supply: cros_usbpd-charger: bound the EC=
-reported port count<br>
=C2=A0 =C2=A0 86e4fa65368f3 power: supply: charger-manager: register regula=
tors before exposing sysfs<br>
=C2=A0 =C2=A0 238320ad029a3 power: supply: bq25890: Fix power_supply refere=
nce leak<br>
=C2=A0 =C2=A0 9e1aba34df9a8 power: supply: bq256xx: drain usb_work before f=
reeing the charger<br>
=C2=A0 =C2=A0 f495808cdd6d9 power: supply: bq24257: fix use-after-free on r=
emove<br>
=C2=A0 =C2=A0 d02a5794c3dee sctp: fix stream-&gt;outcnt underflow on duplic=
ate RECONF responses<br>
=C2=A0 =C2=A0 7ad8933bca97b sctp: distinguish sequence zero from wildcard i=
n reconf lookup<br>
=C2=A0 =C2=A0 25419f516ea84 sctp: fix NULL deref on untransmitted RECONF co=
mpletion<br>
=C2=A0 =C2=A0 1035bdef1efb9 sctp: drop a chunk if its transport was removed=
<br>
=C2=A0 =C2=A0 fa306a40e716c sctp: stop processing a packet once its associa=
tion is deleted<br>
=C2=A0 =C2=A0 8a02ad98798fd nvme-tcp: reject a read that transferred too fe=
w bytes<br>
=C2=A0 =C2=A0 3b3d27670c0c8 nvme-tcp: fix host memory disclosure on R2T for=
 a read command<br>
=C2=A0 =C2=A0 6a01b58263108 nvme-tcp: do not accept C2HData based on blk_rq=
_payload_bytes() alone<br>
=C2=A0 =C2=A0 0d4f317b07d6c nvme-pci: disable controller on admin queue IRQ=
 setup failure<br>
=C2=A0 =C2=A0 67551d8430df9 nvme: zero the discard fallback page<br>
=C2=A0 =C2=A0 1e456cc2744ee nvme: nvme-fc: Fix nvme_fc_create_hw_io_queues(=
) queue deletion in error path<br>
=C2=A0 =C2=A0 d662f7fc04fde lockd: fix NULL dereference on lockowner alloca=
tion failure<br>
=C2=A0 =C2=A0 41f0a6d31615f lockd: pin next file across nlm_inspect_file lo=
ck-drop<br>
=C2=A0 =C2=A0 3088e41292fec ipmi: Fix use-after-free of cmd_rcvr in _ipmi_d=
estroy_user()<br>
=C2=A0 =C2=A0 6aeff1636b398 i2c: mxs: fix DMA channel leak on probe error<b=
r>
=C2=A0 =C2=A0 8d2c120d2d5bf hwmon: (max6621) fix temperature clamp range<br=
>
=C2=A0 =C2=A0 9b38d9a2e46a2 hwmon: (max6621) fix negative temperature offse=
t and crit readings<br>
=C2=A0 =C2=A0 68c59343ad1a7 ASoC: amd: yc: Add DMI entry for MSI Thin A15 B=
7UC<br>
=C2=A0 =C2=A0 f2a1a83487c6c arm64: proton-pack: Restore the nospectre_bhb c=
ommand-line option<br>
=C2=A0 =C2=A0 e7c9b1d433b05 arm64: compat: Fix decrementing LDM/STM alignme=
nt emulation<br>
=C2=A0 =C2=A0 15d1feeae07d0 ALSA: ump: Fix corrupted data bytes at MIDI 1.0=
 SysEx to UMP conversion<br>
=C2=A0 =C2=A0 e41a59fc056f6 openvswitch: only skb_tx_error() a packet we ar=
e about to drop<br>
=C2=A0 =C2=A0 d64a75369cd0f openrisc: fix arbitrary kernel memory access vi=
a or1k_atomic syscall<br>
=C2=A0 =C2=A0 c0c165487a2ea ocfs2: fix readdir position truncation on 32-bi=
t kernels<br>
=C2=A0 =C2=A0 0608018a71f24 ocfs2: cluster: fix o2hb_dependent_users leak o=
n pin failure<br>
=C2=A0 =C2=A0 251e38f5af7b2 ocfs2: cluster: avoid lock order inversion in o=
2hb_region_pin() from drop_item<br>
=C2=A0 =C2=A0 ce035f208d68b ocfs2: cluster: don&#39;t sleep while holding o=
2hb_live_lock in o2hb_region_pin()<br>
=C2=A0 =C2=A0 0761d2c949442 ocfs2: validate rl_used against rl_count in ref=
count block validator<br>
=C2=A0 =C2=A0 50c4cc9183e11 ocfs2: validate lengths in dlm_mig_lockres_hand=
ler<br>
=C2=A0 =C2=A0 de10cd3b062a5 ocfs2: bound namelen in dlm_migrate_request_han=
dler<br>
=C2=A0 =C2=A0 71f07b7f90b31 ocfs2: always run deallocs on copy-on-write com=
pletion<br>
=C2=A0 =C2=A0 116d14f29a052 orangefs: skip leading spaces before parsing cl=
ient debug masks<br>
=C2=A0 =C2=A0 f796f38a324e8 orangefs: fix double-free of trailer_buf on rea=
ddir copy failure<br>
=C2=A0 =C2=A0 bc6fdd425fdeb PM: sleep: Unblock runtime PM when device prepa=
re fails<br>
=C2=A0 =C2=A0 6fcb0b745a0b8 ring-buffer: Hold cpu_buffer::lock when resizin=
g a subbuf<br>
=C2=A0 =C2=A0 8c1ecdcdea738 ring-buffer: Free cpu_buffer::free_page with su=
bbuf_order<br>
=C2=A0 =C2=A0 2dc510957fe8f ring-buffer: Fix subbuf resize race with ring_b=
uffer_alloc_read_page()<br>
=C2=A0 =C2=A0 1c3036a818005 regulator: qcom-refgen: correct the regulator t=
ype to CURRENT<br>
=C2=A0 =C2=A0 20e5fbb8c1a4c regulator: max8998_pmic_dt_parse_pdata: of_node=
_put on reg_np after ownership transferred to rdata<br>
=C2=A0 =C2=A0 95342d26f9c6b regulator: as3722_get_regulator_dt_data: fix pr=
emature of_node_put leaving dangling of_node pointer<br>
=C2=A0 =C2=A0 71d5c41ac583d RDMA/uverbs: Add UVERBS_ATTR_UHW to UVERBS_METH=
OD_REG_MR<br>
=C2=A0 =C2=A0 4f8bb11dd2ff3 RDMA/ucma: Lock the handler in ucma_write_cm_ev=
ent()<br>
=C2=A0 =C2=A0 28ac2dd416482 RDMA/ucma: Lock the handler in ucma_set_ib_path=
()<br>
=C2=A0 =C2=A0 a38cd610b24f7 RDMA/ionic: Cap eq_count to the eth driver&#39;=
s interrupt vector budget<br>
=C2=A0 =C2=A0 85f438382a865 RDMA/cxgb4: Cancel reg_work before freeing devi=
ce on remove<br>
=C2=A0 =C2=A0 2a952fb1b20d8 qede: Fix NULL pointer dereference in TPA fragm=
ent processing<br>
=C2=A0 =C2=A0 3f5677d2f8173 ptp: vmclock: prevent read-only mappings from b=
ecoming writable<br>
=C2=A0 =C2=A0 c7e32814a6bf2 remoteproc: scp: Fix device reference leak on f=
ailed lookup<br>
=C2=A0 =C2=A0 37797d5013c9e riscv: unaligned: stop using kthread for check_=
vector_unaligned_access()<br>
=C2=A0 =C2=A0 8f392916a3540 riscv: acpi: Handle LPI architectural context l=
oss flags<br>
=C2=A0 =C2=A0 5343399ed7242 arm64: dts: rockchip: Fix rk3588s-roc-pc audio =
description<br>
=C2=A0 =C2=A0 8fc4bafabc065 arm64: dts: rockchip: Fix rk3399-roc-pc-plus an=
alog audio<br>
=C2=A0 =C2=A0 650d2d5c0df7e arm64: dts: rockchip: fix emmc reset polarity o=
n px30-cobra<br>
=C2=A0 =C2=A0 5512c23231206 arm64: dts: rockchip: fix eMMC reset polarity o=
n PX30 Ringneck<br>
=C2=A0 =C2=A0 fe455c13bf01e arm64: dts: rockchip: fix eMMC reset polarity o=
n PP-1516<br>
=C2=A0 =C2=A0 b6b3e4d5973bd arm64: dts: qcom: x1-dell-thena: mark l12b and =
l15b always-on<br>
=C2=A0 =C2=A0 6bb9469c34fff arm64: dts: qcom: sm6115-pro1x: Correct touchsc=
reen GPIO flags<br>
=C2=A0 =C2=A0 ff23eb4823d82 Revert &quot;arm64: dts: rockchip: Further desc=
ribe the WiFi for the Pinephone Pro&quot;<br>
=C2=A0 =C2=A0 eb57632f9418f rpmsg: glink: smem: order FIFO read after avail=
ability check<br>
=C2=A0 =C2=A0 e7143c3f4e5c0 scsi: core: Fill in DMA padding bytes in scsi_a=
lloc_sgtables()<br>
=C2=A0 =C2=A0 2a8dd9fd12f3f media: staging/ipu7: fix async notifier UAF on =
probe error path<br>
=C2=A0 =C2=A0 7f6956b6dcd66 staging: media: tegra-video: vi: fix probe fail=
ure on skipped last port<br>
=C2=A0 =C2=A0 656d047dc0c29 staging: media: tegra-video: fix of_node_put() =
on VIP parse errors<br>
=C2=A0 =C2=A0 5be6d02837d41 wifi: mt76: mt7925: cancel pending mlo_pm_work<=
br>
=C2=A0 =C2=A0 e1330d719c047 wifi: ath6kl: clamp assoc request/response leng=
ths before subtracting IE offsets<br>
=C2=A0 =C2=A0 b95c33a4e7438 udf: reject VAT indexes equal to the entry coun=
t<br>
=C2=A0 =C2=A0 f84ec84d8d4bc svcrdma: Validate Read chunk positions before r=
econstruction<br>
=C2=A0 =C2=A0 a798714b58041 svcrdma: Reject Write/Reply chunks with segcoun=
t 0<br>
=C2=A0 =C2=A0 1949dd1576f7a svcrdma: Reject inline replies that overflow th=
e pull-up buffer<br>
=C2=A0 =C2=A0 3cf372cec7ab2 svcrdma: Reject connection when transport alloc=
ation fails<br>
=C2=A0 =C2=A0 5aabe070c00e5 svcrdma: Fix unmatched rn_unregister on failed =
accept<br>
=C2=A0 =C2=A0 a1c954ca4977a svcrdma: Fix pcl_for_each_segment for empty chu=
nks<br>
=C2=A0 =C2=A0 a46b35f213c24 svcrdma: Fix offset arithmetic in read_chunk_ra=
nge<br>
=C2=A0 =C2=A0 1de391e8b94e3 SUNRPC: wait for in-flight client TLS handshake=
 callback<br>
=C2=A0 =C2=A0 1f9856af065b6 SUNRPC: Reject krb5 v2 wrap tokens with oversiz=
ed ec field<br>
=C2=A0 =C2=A0 7a1d0501cbb96 SUNRPC: reject duplicate CREDS_VALUE options<br=
>
=C2=A0 =C2=A0 edeefb111d618 sunrpc: init gssp_lock before publishing proc e=
ntry<br>
=C2=A0 =C2=A0 ebcbd2523a852 SUNRPC: harden gss_unwrap_resp_priv length chec=
ks<br>
=C2=A0 =C2=A0 806584a4b67a7 SUNRPC: harden gss_krb5_unwrap_v2 against short=
 tokens<br>
=C2=A0 =C2=A0 fa46b6aa7a698 SUNRPC: Guard svcauth_gss_release() dispatch on=
 rq_auth_stat<br>
=C2=A0 =C2=A0 e769fcde3cc73 sunrpc: fix use-after-free in __rpc_clnt_handle=
_event and __rpc_clnt_remove_pipedir<br>
=C2=A0 =C2=A0 08bc49e054126 sunrpc: defer rq_argp and rq_resp free until af=
ter RCU grace period<br>
=C2=A0 =C2=A0 bd1ef2cfb44d7 SUNRPC: Check svc pool percpu counter allocatio=
n<br>
=C2=A0 =C2=A0 2e861ce2aaa46 SUNRPC: always drain cache_cleaner before destr=
oying a cache_detail<br>
=C2=A0 =C2=A0 39981133df21c SUNRPC: Restore NUMA_NO_NODE for svc thread all=
ocations in global mode<br>
=C2=A0 =C2=A0 9d04d64ad1924 sunrpc: route to a populated pool in svc_pool_f=
or_cpu()<br>
=C2=A0 =C2=A0 de942dd8c2c83 SUNRPC: svcauth_gss: enforce krb5 token minimum=
 length<br>
=C2=A0 =C2=A0 e0778464049b0 SUNRPC: Zero rpc_gss_wire_cred at svcauth_gss_d=
ecode_credbody() entry<br>
=C2=A0 =C2=A0 ad0cce80d4af2 SUNRPC: xdr_buf_trim: clamp buf-&gt;len to avoi=
d underflow<br>
=C2=A0 =C2=A0 f1b7b2c7ffa97 phy: fsl-imx8mq-usb: fix typec switch leak on p=
robe error path<br>
=C2=A0 =C2=A0 704ecd010d4a9 params: fix charp corruption on allocation fail=
ure<br>
=C2=A0 =C2=A0 ff110e85837d7 nouveau/gem: reserve the bo in the info ioctl a=
round the vma lookup<br>
=C2=A0 =C2=A0 04ab51d4e369a module/kallsyms: fix nextval for data symbol lo=
okup<br>
=C2=A0 =C2=A0 51887ccd88791 mptcp: fix uninitialized local_id in syncookie =
MP_JOIN reconstruction<br>
=C2=A0 =C2=A0 d82b90a38c2ca mpls: reload header after pskb_may_pull()<br>
=C2=A0 =C2=A0 50d0aa7d25ba4 module: validate string table section types<br>
=C2=A0 =C2=A0 3b097416b4cff md: do overflow check for sb-&gt;bblog_shift in=
 super_1_load()<br>
=C2=A0 =C2=A0 0efabe6229dc6 md/raid10: fix still_degraded being inverted in=
 raid10_sync_request()<br>
=C2=A0 =C2=A0 121d35014e497 mailbox: qcom-ipcc: fix duplicate channel alloc=
ation across holes<br>
=C2=A0 =C2=A0 09e649117c54b libnvdimm/labels: Prevent integer overflow in _=
_nd_label_validate()<br>
=C2=A0 =C2=A0 627ce4902df1d landlock: Require LANDLOCK_ACCESS_FS_MAKE_REG f=
or whiteout creation<br>
=C2=A0 =C2=A0 a602cd128d17a ipv6: use RCU iterator to dump route exceptions=
<br>
=C2=A0 =C2=A0 63f50e9f90d02 ipv6: rpl: fix NULL dereference of idev in ipv6=
_rpl_srh_rcv()<br>
=C2=A0 =C2=A0 b8282668d8fa7 ip6_gre: fix hardware header length for NBMA tu=
nnels<br>
=C2=A0 =C2=A0 b36dfd6e8cff0 ip6_tunnel: use skb_cow_head() in ip6_tnl_xmit(=
)<br>
=C2=A0 =C2=A0 a8af6fbac895f ip: orphan prefetched skbs before multicast for=
warding<br>
=C2=A0 =C2=A0 31e4be21dacee ipip: fix skb leak in collect_md mode when meta=
data_dst allocation fails<br>
=C2=A0 =C2=A0 f9182a85991a0 jbd2: check need_resched() when skipping busy c=
heckpoint buffers<br>
=C2=A0 =C2=A0 71c6b872c7464 jbd2: bound shrinker scans by examined checkpoi=
nt buffers<br>
=C2=A0 =C2=A0 30e8cb8598aa4 kasan: fix cache shrink race with CPU hotplug<b=
r>
=C2=A0 =C2=A0 15deb4e33f474 Bluetooth: hci_sync: Clear HCI_CMD_PENDING when=
 dropping the last request<br>
=C2=A0 =C2=A0 657054159d83a Bluetooth: hci_intel: fix usage_count leak when=
 autosuspend_delay is negative<br>
=C2=A0 =C2=A0 94d548fc264a2 Bluetooth: hci_h5: fix usage_count leak when au=
tosuspend_delay is negative<br>
=C2=A0 =C2=A0 1bad0896cbc06 Bluetooth: hci_event: clear HCI_LE_ADV only on =
a created connection<br>
=C2=A0 =C2=A0 d0b28e9655f4b Bluetooth: hci_core: use skb_get() instead of s=
kb_clone() for req_skb<br>
=C2=A0 =C2=A0 68e7a31abc88b Bluetooth: hci_conn: re-enable advertising only=
 for peripheral role<br>
=C2=A0 =C2=A0 946d76db77ee5 Bluetooth: RFCOMM: serialize security confirmat=
ion handling<br>
=C2=A0 =C2=A0 49fd7116f76b8 Bluetooth: ISO: fix use-after-free of listener =
socket in iso_conn_ready<br>
=C2=A0 =C2=A0 ec3992e38f777 Bluetooth: hci_uart: Fix false success return i=
n hci_uart_setup()<br>
=C2=A0 =C2=A0 62100186f1771 Bluetooth: hci_bcm: fix usage_count leak when a=
utosuspend_delay is negative<br>
=C2=A0 =C2=A0 1ed5982c53699 Bluetooth: hci_bcm4377: Ignore reserved PHY in =
ext adv reports on BCM4378<br>
=C2=A0 =C2=A0 c674c504bfdd0 cxl/pmem: Format the nvdimm serial number as un=
signed decimal<br>
=C2=A0 =C2=A0 14d52c15d5d99 cxl/features: bound fwctl command payload to th=
e input buffer<br>
=C2=A0 =C2=A0 2924b2e365148 cpufreq: schedutil: Fix rate limit overflow<br>
=C2=A0 =C2=A0 a807a9ef87ad0 coresight: etm3x: Fix cntr_val_show() to match =
cntr_val_store() behavior<br>
=C2=A0 =C2=A0 ac4a5eb8b002a dm array: reject an array block whose value siz=
e is not the caller&#39;s<br>
=C2=A0 =C2=A0 b33f76d33aaea dm array: validate array block headers on read<=
br>
=C2=A0 =C2=A0 644140527ae49 dm raid1: reserve space for NUL-terminator in b=
uild_constructor_string()<br>
=C2=A0 =C2=A0 36ff918637e35 dm-era: fix shadowed superblock leak on take-sn=
ap failure<br>
=C2=A0 =C2=A0 49694a363f7ec dm-io: report non-retryable errors separatedly<=
br>
=C2=A0 =C2=A0 9493ac67623d4 dm-io: clone the source bio instead of copying =
its biovec<br>
=C2=A0 =C2=A0 272fcb4ba6fab bpf: Harden bloom filter sizing and indexing on=
 32-bit kernels<br>
=C2=A0 =C2=A0 c9189693db47a buffer: avoid tail commit walk for uptodate fol=
ios<br>
=C2=A0 =C2=A0 dbfecc8a6631c bpf: Disable preemption in __bpf_get_stack<br>
=C2=A0 =C2=A0 6886642414f59 bpf, x86: Fix per-CPU address resolution into a=
n extended register<br>
=C2=A0 =C2=A0 49dcefa83c8ab bnxt_en: Write doorbell when linearizing skb fa=
ils<br>
=C2=A0 =C2=A0 4d36e38e48340 bnx2x: fix double free in bnx2x_init_firmware()=
 error path<br>
=C2=A0 =C2=A0 c21fa79301d7d Bluetooth: eir: Fix OOB read in eir_get_service=
_data()<br>
=C2=A0 =C2=A0 f609eac02d110 Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCA=
N quirk to 0bda:a728<br>
=C2=A0 =C2=A0 bce588b4ca081 Bluetooth: btusb: Add ASUS USB-BT600 for Realte=
k 8761CU<br>
=C2=A0 =C2=A0 aa7b93fe98ba7 Bluetooth: btusb: Add ASUS USB-BT540 for Realte=
k 8761CU<br>
=C2=A0 =C2=A0 ce76ca5fb2794 block: set QUEUE_FLAG_DYING unconditionally in =
blk_mark_disk_dead()<br>
=C2=A0 =C2=A0 84858671842ae auxdisplay: charlcd: cancel backlight work on r=
egistration failure<br>
=C2=A0 =C2=A0 c2e3dccd68706 ata: libata-scsi: fix DSM TRIM for sector sizes=
 larger than 2048 bytes<br>
=C2=A0 =C2=A0 fdc0a5e2cbace ARM: 9477/1: Disable broken eBPF JIT on the Ris=
c PC<br>
=C2=A0 =C2=A0 87d07aa5d38b6 alpha: marvel: Fix lock ordering in init_io7_ir=
qs()<br>
=C2=A0 =C2=A0 9e1eefc01912c alpha: marvel: Fix irq_set_status_flags to use =
correct IRQ number<br>
=C2=A0 =C2=A0 2fd984c44e3e4 alpha/PCI: Fix I/O port accessor argument order=
 in pci_legacy_write()<br>
=C2=A0 =C2=A0 6d4ed2fd022bc ACPI: pfr_update: fix stack buffer overflow in =
query_capability()<br>
=C2=A0 =C2=A0 452eb28e03015 ACPI: APEI: GHES: fix ARM section length accoun=
ting after header<br>
=C2=A0 =C2=A0 b7476b29b6961 ACPI: APEI: Fix ERST timeout unit conversion<br=
>
=C2=A0 =C2=A0 c735dbce7ad03 acpi/apei/ghes: Use raw_spinlock_t for CXL CPER=
 work locks<br>
=C2=A0 =C2=A0 9ad8821573a36 accel/rocket: Fix error path handling in rocket=
_job_run()<br>
=C2=A0 =C2=A0 3043230296653 accel/rocket: initialize job domain before clea=
nup paths<br>
=C2=A0 =C2=A0 c1a5bf1b6e1d5 accel/rocket: fix NULL dereference and integer =
overflow in rocket_job_push()<br>
=C2=A0 =C2=A0 a3c65af20cceb hugetlb: only adjust reservation during unmappi=
ng if mapcount is 0<br>
=C2=A0 =C2=A0 4e019e5e247bf hsi: omap_ssi_core: fix missing DMA mask setup =
for SSI controller device<br>
=C2=A0 =C2=A0 137c61a6cfd96 fpga: stratix10-soc: Fix SVC mailbox handling d=
uring reconfiguration<br>
=C2=A0 =C2=A0 0c3f4544ff387 forcedeth: fix off-by-one when saving/restoring=
 non-PCI config space<br>
=C2=A0 =C2=A0 466a8af0dee2c fbdev: uvesafb: unregister connector callback o=
n init failure<br>
=C2=A0 =C2=A0 3bcab9b21f71d fbdev: ssd1307fb: defer I2C transfers from dama=
ge callbacks<br>
=C2=A0 =C2=A0 3c1b5809615c3 fbdev: pvr2fb: correct user pointer annotation =
and sentinel initializer<br>
=C2=A0 =C2=A0 76818e81cfcae fbdev: omapfb: panel-dsi-cm: initialize lock be=
fore registering display<br>
=C2=A0 =C2=A0 2f66f8ceefc25 fat: restore original value when fat_ent_write =
failed<br>
=C2=A0 =C2=A0 66aa9a9e6481b fanotify: fix use-after-free of file range info=
<br>
=C2=A0 =C2=A0 92895a14329cc efivarfs: Rate limit statfs() handler<br>
=C2=A0 =C2=A0 ce568f6e025df ecryptfs: show filename encryption options<br>
=C2=A0 =C2=A0 9319706316a8e ecryptfs: release message context on send failu=
re<br>
=C2=A0 =C2=A0 b31da1ecf1392 ecryptfs: reject too-small tag 70 packets<br>
=C2=A0 =C2=A0 14cb36a500a5a ecryptfs: reject oversized encrypted_key_size i=
n parse_tag_3_packet<br>
=C2=A0 =C2=A0 e5d254e654f23 ecryptfs: pass packet set buffer size to parser=
<br>
=C2=A0 =C2=A0 0d9636ecba34b ecryptfs: hold msg ctx list lock when cleaning =
daemon queue<br>
=C2=A0 =C2=A0 c1bc956a615d0 ecryptfs: fix tag 11 packet exact-fit size chec=
k<br>
=C2=A0 =C2=A0 98b890563424a eCryptfs: bound the packet-length peek to the u=
ser buffer<br>
=C2=A0 =C2=A0 7ccb94901f38a fs/ntfs3: bound page_lcns[] index by the log re=
cord<br>
=C2=A0 =C2=A0 376ee45659a4b fs/ntfs3: fix info-leak on partial LZNT decompr=
ess in ni_read_frame()<br>
=C2=A0 =C2=A0 2d94ffc9d7b5b fs/ntfs3: validate dirty page table on log repl=
ay<br>
=C2=A0 =C2=A0 5333e18e6b425 eventfs: Initialize ei-&gt;children and ei-&gt;=
list in init_ei()<br>
=C2=A0 =C2=A0 b2301bdb4b3ed HID: intel-thc-hid: intel-quickspi: fix autosus=
pend cleanup during teardown<br>
=C2=A0 =C2=A0 99f3e197920df HID: intel-thc-hid: intel-quicki2c: fix autosus=
pend cleanup during teardown<br>
=C2=A0 =C2=A0 72706b44b6656 HID: intel-thc-hid: intel-quickspi: bound GET_R=
EPORT response to the caller buffer<br>
=C2=A0 =C2=A0 6fcefe71aeb52 HID: intel-thc-hid: intel-quickspi: validate re=
port size before copy<br>
=C2=A0 =C2=A0 127de5919820f HID: mcp2221: validate report size in mcp2221_r=
aw_event()<br>
=C2=A0 =C2=A0 c99ba6c234d4d HID: mcp2221: stop device IO before hid_hw_stop=
<br>
=C2=A0 =C2=A0 01d9874e84d3a HID: universal-pidff: stop the device when forc=
e-feedback init fails<br>
=C2=A0 =C2=A0 114a58640aaf3 HID: sony: fix UAF of ghl_poke_timer / ghl_urb =
at driver unbind<br>
=C2=A0 =C2=A0 f3f37b937a6ea HID: sensor: custom: Fix field sysfs group clea=
nup on failure<br>
=C2=A0 =C2=A0 da00eac19feef HID: roccat: free buffered reports when destroy=
ing device<br>
=C2=A0 =C2=A0 471f4a939c66d HID: picolcd: clamp eeprom debugfs read to byte=
s actually received<br>
=C2=A0 =C2=A0 79465a30050da HID: corsair-void: Check size of status and fir=
mware events before reading them<br>
=C2=A0 =C2=A0 e78973fe3ef59 HID: apple: preserve keyboard backlight across =
T2 resume<br>
=C2=A0 =C2=A0 846f0709559b9 smb: client: harden DFS cache against invalid t=
arget hints<br>
=C2=A0 =C2=A0 17a1922ada873 smb: client: fix copy-paste error in WSL EA len=
gth accounting for $LXDEV<br>
=C2=A0 =C2=A0 1f824f61d1df5 smb: client: fix ALIGN() overflow in symlink_da=
ta() error context loop<br>
=C2=A0 =C2=A0 9ab46a13798a6 smb: client: clear ce-&gt;tgthint in free_tgts(=
)<br>
=C2=A0 =C2=A0 8b9b10fe5b8b4 cifs: use cifs_invalidate_cache() in cifs_do_tr=
uncate() for O_TRUNC<br>
=C2=A0 =C2=A0 c2a0dcb5a7a15 cifs: fix loff_t underflow in cifs_remap_file_r=
ange() when len =3D=3D 0<br>
=C2=A0 =C2=A0 4f18c9e7ee464 cifs: clear tcon after cifsFileInfo_put() in ci=
fs_file_set_size()<br>
=C2=A0 =C2=A0 636a99bab36ba audit: avoid dropping live tree ref on fsnotify=
 rule autoremove<br>
=C2=A0 =C2=A0 25128202a8df5 btrfs: do not overwrite NODATASUM flag when rem=
oving NODATACOW flag<br>
=C2=A0 =C2=A0 f42efd634c0ae btrfs: fix extent map leak in NOCOW direct I/O =
write<br>
=C2=A0 =C2=A0 8a64baeb5bbb7 btrfs: drop recovered reloc root refs on recove=
ry failure<br>
=C2=A0 =C2=A0 ec32015a955c5 ceph: fix leaked inode reference on writeback a=
bort at umount<br>
=C2=A0 =C2=A0 37d6edb2f03b2 ceph: do not repeat ceph_trim_dentries() if no =
progress possible<br>
=C2=A0 =C2=A0 1dd356310b166 ceph: bound xattr value length in __build_xattr=
s()<br>
=C2=A0 =C2=A0 58c2d3e954c13 ceph: bound num_export_targets array for mds in=
fo v2/v3<br>
=C2=A0 =C2=A0 c37db86d2b5e9 ceph: bound MDSCapAuth path and fs_name decode =
in handle_session()<br>
=C2=A0 =C2=A0 06fb5e623cdc2 ceph: bound copied dentry name length in NFS ex=
port get_name<br>
=C2=A0 =C2=A0 4d298880f82c4 ceph: reject export_targets ranks &gt;=3D CEPH_=
MAX_MDS in mdsmap decode<br>
=C2=A0 =C2=A0 fe46746087b5b ceph: fix UAF in __kick_flushing_caps() on cf e=
ntry freed during unlock<br>
=C2=A0 =C2=A0 00562ccd4e88d libceph: reject buckets with mismatched CRUSH i=
ds<br>
=C2=A0 =C2=A0 2571b35883268 libceph: validate OSD extent maps before cursor=
 advance<br>
=C2=A0 =C2=A0 b413ec5b23e34 NFSD: Prevent client use-after-free during NFSv=
4.0 revoked-state cleanup<br>
=C2=A0 =C2=A0 4804c58f73a80 NFSD: Prevent lock owner use-after-free during =
client teardown<br>
=C2=A0 =C2=A0 b56d2c5f01cdd nfsd: revoke copy-notify stateids before droppi=
ng their reference<br>
=C2=A0 =C2=A0 dbc11a12aa545 nfsd: reject reclaim LOCK after RECLAIM_COMPLET=
E<br>
=C2=A0 =C2=A0 ad02d095439f8 nfsd: reject out-of-range useconds in NFSv2 SET=
ATTR/CREATE<br>
=C2=A0 =C2=A0 54e02f5e32c52 nfsd: reject out-of-range nseconds in NFSv3 SET=
ATTR and create ops<br>
=C2=A0 =C2=A0 4ae5d7490ae6a nfsd: move nfsd_debugfs_init() after nfsd4_init=
_slabs() in init_nfsd()<br>
=C2=A0 =C2=A0 b57bd8cb739cb nfsd: initialize DRC hash table before register=
ing shrinker<br>
=C2=A0 =C2=A0 a4d7fedcaaf33 nfsd: initialize copy-notify stateid before pub=
lishing it<br>
=C2=A0 =C2=A0 763c0bad87236 nfsd: hold rcu across localio cmpxchg retry<br>
=C2=A0 =C2=A0 b3bff820d068e nfsd: gate nfs3 setacl by argp-&gt;mask<br>
=C2=A0 =C2=A0 f951b22dbeec4 nfsd: gate nfs2 setacl by argp-&gt;mask<br>
=C2=A0 =C2=A0 41ebca28e17f8 nfsd: fix XDR padding calculation in ff_encode_=
getdeviceinfo<br>
=C2=A0 =C2=A0 0380129b1373c nfsd: fix XDR length calculation in nfsd4_ff_en=
code_layoutget<br>
=C2=A0 =C2=A0 4106d7a6aaf1e nfsd: fix version mismatch loops in nfsd_acl_in=
it_request()<br>
=C2=A0 =C2=A0 9b4e5e9ba5ae1 nfsd: fix stale s2s_cp_stateids IDR entry for a=
sync COPY<br>
=C2=A0 =C2=A0 2ebbf4e3e9cf5 nfsd: fix reply size estimate for GET_DIR_DELEG=
ATION<br>
=C2=A0 =C2=A0 cf081015a0d1b nfsd: fix refcount leak in nfsd_file_lru_add on=
 insertion failure<br>
=C2=A0 =C2=A0 3c5119b799a7f nfsd: fix null dereference in nfsd4_setattr for=
 deleg timestamp attrs<br>
=C2=A0 =C2=A0 424d5c95108a4 nfsd: fix nfsd_file leak on inter-server COPY s=
etup failure<br>
=C2=A0 =C2=A0 360e1b9e3f316 nfsd: fix netlink dumpit error handling for rpc=
_status_get<br>
=C2=A0 =C2=A0 65c79d9bb3717 nfsd: fix FL_SLEEP being set unconditionally fo=
r all LOCK types<br>
=C2=A0 =C2=A0 c1ae0f973bcba nfsd: fix dentry ref leak on V4ROOT export file=
handle lookup<br>
=C2=A0 =C2=A0 a631a26a8777b nfsd: fix cpntf publish race in nfs4_init_cp_st=
ate<br>
=C2=A0 =C2=A0 607a56fea772c nfsd: fix BUG_ON in nfsd4_alloc_layout_stateid =
on racing delegation revoke<br>
=C2=A0 =C2=A0 00843074d9b84 nfsd: drop the stateid, not the stateowner, on =
seqid_op replay retry<br>
=C2=A0 =C2=A0 72d40b103bb03 nfsd: don&#39;t free session slots that are sti=
ll in use<br>
=C2=A0 =C2=A0 6703199f4d7e7 nfsd: defer vfree of compound ops to fix rpc_st=
atus UAF<br>
=C2=A0 =C2=A0 631b7d5dbbba8 nfsd: defer setting NFSD4_CALLBACK_RUNNING in d=
eleg_reaper<br>
=C2=A0 =C2=A0 e879148867bd4 nfsd: clear opcnt on compound arg release to pr=
event OOB read<br>
=C2=A0 =C2=A0 b137930ee52e3 nfsd: clear CALLBACK_RUNNING on failed delegati=
on recall queue<br>
=C2=A0 =C2=A0 b42dc26a14b4a nfsd: check client ownership when cancelling a =
copy-notify stateid<br>
=C2=A0 =C2=A0 311f7d9266309 nfsd: block non-SAVEFH ops after FOREIGN PUTFH =
to prevent NULL deref<br>
=C2=A0 =C2=A0 1aea0482b98ec nfsd: add missing read barrier to rpc_status_ge=
t dumpit seqcount retry<br>
=C2=A0 =C2=A0 bff024551a713 nfsd: add filehandle match check to nfsd4_deleg=
return()<br>
=C2=A0 =C2=A0 533964d420d38 nfsd: add fh_want_write() for early-verified SE=
TATTR in nfsd_proc_setattr()<br>
=C2=A0 =C2=A0 895a485cd3758 nfsd: validate symlink target length in NFSv4 C=
REATE<br>
=C2=A0 =C2=A0 2aca70c18c5f5 nfsd: validate sockaddr length per family in li=
stener_set<br>
=C2=A0 =C2=A0 7e7b93da7fa2e nfsd: validate nseconds in TIME_DELEG decode pa=
ths<br>
=C2=A0 =C2=A0 7ff8d6363cfff nfsd: size fh_verify server sockaddr slot by xp=
t_locallen<br>
=C2=A0 =C2=A0 1e4795766719f nfsd: set SC_STATUS_FREED in nfsd4_drop_revoked=
_stid for delegations<br>
=C2=A0 =C2=A0 8277d4a11ae2c nfsd: sample writeback error cursor before asyn=
c COPY loop<br>
=C2=A0 =C2=A0 fc83f30731dd2 nfsd: return NFS4ERR_NOTSUPP for unsupported ne=
tloc4 types<br>
=C2=A0 =C2=A0 591134e059e34 nfsd: Reset write verifier when async COPY writ=
eback fails<br>
=C2=A0 =C2=A0 467d56fd3ff57 nfsd: release path refs on follow_down() error<=
br>
=C2=A0 =C2=A0 f164eb52b6f3c nfsd: RCU-protect cl_cb_session to fix use-afte=
r-free on session teardown<br>
=C2=A0 =C2=A0 dc803d46a8b90 pNFS: Fix EBUSY check in pnfs_layout_need_retur=
n<br>
=C2=A0 =C2=A0 36e3f13bf0728 NFSv4.1: fix layout segment leak on the pnfs_la=
yout_process() forget path<br>
=C2=A0 =C2=A0 59baf45a06435 nfsd: guard nfsd_serv deref in nfsd_file_net_di=
spose<br>
=C2=A0 =C2=A0 7ef182a8fe9c1 NFSD: remove flawed WARN_ON_ONCE from nfsd_mode=
_check<br>
=C2=A0 =C2=A0 4ed8d2317aef2 NFSD: restart ssc_expire_umount walk after drop=
ping nfsd_ssc_lock<br>
=C2=A0 =C2=A0 75d13317f163a NFSD: Fix off-by-one in DRC bucket pruning limi=
t<br>
=C2=A0 =C2=A0 e547b06234f88 NFSD: Encode only the status in NFS-ACL v2 GETA=
CL error replies<br>
=C2=A0 =C2=A0 d8352da196349 NFSD: check truncate permission under inode loc=
k<br>
=C2=A0 =C2=A0 f3adf16435173 NFS: fix delegation_hash_table leak when nfs4_s=
erver_common_setup() fails<br>
=C2=A0 =C2=A0 5215e734bf7cb NFS/localio: fix ref leak on nfs_uuid_add_file =
failure<br>
=C2=A0 =C2=A0 344ae0e232d4f zsmalloc: account for handle size in class look=
up<br>
=C2=A0 =C2=A0 923578d0f0d07 zram: validate deflate params<br>
=C2=A0 =C2=A0 a1dc246f98bb9 ubifs: fix out-of-bounds read in signature leng=
th check<br>
=C2=A0 =C2=A0 14afe18655c09 phy: rockchip-samsung-dcphy: fix out-of-range m=
ax_register<br>
=C2=A0 =C2=A0 e892f05f1f790 PCI/sysfs: Fix out-of-bounds read in pci_write_=
legacy_io()<br>
=C2=A0 =C2=A0 9253cfc5a85be of: fix out-of-bounds read in of_alias_scan() s=
tem parser<br>
=C2=A0 =C2=A0 448636c745a3f nilfs2: fix slab-out-of-bounds in nilfs_direct_=
propagate after truncation<br>
=C2=A0 =C2=A0 8c14472431e27 media: vicodec: fix out-of-bounds write in FWHT=
 encoder<br>
=C2=A0 =C2=A0 0c260d3f97e52 media: cec: stm32: prevent out-of-bounds write =
on RX overflow<br>
=C2=A0 =C2=A0 7d658da725ea8 lib/ucs2_string.c: fix out-of-bounds read in uc=
s2_strnlen()<br>
=C2=A0 =C2=A0 9f43499ce6458 HID: sensor-hub: Fix out-of-bounds write in sen=
sor_hub_get_feature<br>
=C2=A0 =C2=A0 827ec385458ad fpga: altera-cvp: Avoid out-of-bounds read in t=
railing byte write<br>
=C2=A0 =C2=A0 34e88f5361464 usb: gadget: f_fs: Prevent deadlock during ep0 =
read loop<br>
=C2=A0 =C2=A0 9897b7da8c0ad usb: gadget: uvc: fix dangling pointers in uvc_=
function_bind() and uvc_function_unbind()<br>
=C2=A0 =C2=A0 dbe2762ae8e54 usb: gadget: uvc: Fix null pointer dereference =
in uvcg_video_init()<br>
=C2=A0 =C2=A0 6bcd9ee6ad698 usb: gadget: f_tcm: fix deadlock in usbg_make_t=
pg()<br>
=C2=A0 =C2=A0 a15c2acd30834 usb: gadget: midi2: remove default configfs gro=
ups on teardown<br>
=C2=A0 =C2=A0 64005cf3e897e usb: gadget: snps_udc_plat: clean up PHY on pro=
be deferral<br>
=C2=A0 =C2=A0 4e747c864a885 usb: gadget: u_audio: Fix use-after-free on sou=
nd card disconnect<br>
=C2=A0 =C2=A0 14fa29f3be066 usb: typec: ucsi: use UCSI_TIMEOUT_MS for sync =
command completion<br>
=C2=A0 =C2=A0 ebb840d982a61 usb: typec: thunderbolt: Disable work before fr=
eeing tbt on remove<br>
=C2=A0 =C2=A0 d793bd8422e78 usb: typec: tcpci: pass correct rx_type to tcpm=
_pd_receive()<br>
=C2=A0 =C2=A0 12414bbd3e3f3 USB: phy: fsl-usb: fix missing static keywords<=
br>
=C2=A0 =C2=A0 51a311eb97e91 usb: gadget: at91_udc: drain polled-VBUS timer/=
work before udc is freed<br>
=C2=A0 =C2=A0 448e95c0f3eaa usb: dwc3: gadget: Fix use-after-free in dwc3_g=
adget_free_endpoints due to race condition<br>
=C2=A0 =C2=A0 316abfe39dce7 usb: dwc2: gadget: Exit partial power down stat=
e when changing USB pull-up<br>
=C2=A0 =C2=A0 78f5c6e6aef9a staging: greybus: hid: fix SET_REPORT return va=
lue<br>
=C2=A0 =C2=A0 28b932202fcdb serial: imx: serialize imx_uart_ports[] lifetim=
e<br>
=C2=A0 =C2=A0 aad08b5f67d2a Revert &quot;media: v4l2-dev: fix error handlin=
g in __video_register_device()&quot;<br>
=C2=A0 =C2=A0 e6e925cc1f806 rapidio: mport_cdev: fix use-after-free in dma_=
req_free()<br>
=C2=A0 =C2=A0 c3d4be91c6fce powerpc/powermac: fix OF node refcount<br>
=C2=A0 =C2=A0 29e634a18957a misc: nsm: bound the device-reported response l=
ength<br>
=C2=A0 =C2=A0 ba69d892ff4e4 device property: fix infinite loop in fwnode_fo=
r_each_child_node()<br>
=C2=A0 =C2=A0 4cd24873ab9fd cdx: Fix double free when sysfs file creation f=
ails<br>
=C2=A0 =C2=A0 b1a49c22de01f tracing: Fix use-after-free with same-name name=
d triggers<br>
=C2=A0 =C2=A0 ddbe921ed16a0 tracing: Fix use-after-free in trace_pipe read =
on sub-buffer order change<br>
=C2=A0 =C2=A0 cdb6fb6cf1a7a tracing: Fix logged instance name on creation f=
ailure<br>
=C2=A0 =C2=A0 adadf4192f700 tracing: Fix crash passing ERR_PTR to kthread_s=
top()<br>
=C2=A0 =C2=A0 25a0758cf6bdb tracing/user_events: Clear copied tracing state=
 before fork duplication<br>
=C2=A0 =C2=A0 b503a61d5d392 hwtracing: hisi_ptt: Propagate DMA reset timeou=
t in trace_start()<br>
=C2=A0 =C2=A0 9b51dcb4f2305 x86/tdx: Fix zero-extension for 32-bit port I/O=
<br>
=C2=A0 =C2=A0 c4a2215487081 x86/tdx: Fix off-by-one in port I/O handling<br=
>
=C2=A0 =C2=A0 b9ae969e6f1e3 x86/locking: Use sfence for wmb() if SSE is ava=
ilable<br>
=C2=A0 =C2=A0 08b4cdef3c2ef x86/insn-eval: Move assign_register() out of KV=
M as insn_assign_reg()<br>
=C2=A0 =C2=A0 968eea4659420 tools/compiler: match glibc 2.42 definition of =
__attribute_const__<br>
=C2=A0 =C2=A0 d4bf3a74e2bae mm: vmscan: fix node reclaim ignoring swappines=
s parameter<br>
=C2=A0 =C2=A0 461d23368f296 mm: page_alloc: fix non-movable reclaim storm i=
n defrag_mode<br>
=C2=A0 =C2=A0 d435ba3c21a02 mm: page_alloc: move capture_control to the pag=
e allocator<br>
=C2=A0 =C2=A0 0df04778ea14a mm: page_alloc: __GFP_FS lockdep annotation for=
 direct compaction<br>
=C2=A0 =C2=A0 b3d4b65085ef5 mm: mempolicy: fix automatic numa balancing for=
 shmem<br>
=C2=A0 =C2=A0 5d866086d5f8d mm: memcontrol: update state_local when flushin=
g NMI stats<br>
=C2=A0 =C2=A0 95d87030cae77 mm: memcg: stop reclaim when a limit update is =
superseded<br>
=C2=A0 =C2=A0 680b93894ddf6 mm: memcg-v1: fix memsw and TCP failcnt account=
ing<br>
=C2=A0 =C2=A0 d0943afb5ed8b mm: memcg-v1: fix wrong linux-mm list address i=
n deprecation warnings<br>
=C2=A0 =C2=A0 295f5a61d3aea mm: compaction: support non-movable compaction =
for pageblock requests<br>
=C2=A0 =C2=A0 ef765a2e4f579 mm/zswap: fix global shrinker when memory cgrou=
p is disabled<br>
=C2=A0 =C2=A0 3fd5023998630 mm/vmscan: report RCU-tasks quiescent states in=
 shrink_lruvec()<br>
=C2=A0 =C2=A0 895cd4ecbb2e0 mm/pagewalk: fix stale walk-&gt;action escaping=
 walk_pmd_range()<br>
=C2=A0 =C2=A0 45489d4f95802 mm/mm_init: deferred_grow_zone(): fix out-of-ra=
nge first_deferred_pfn<br>
=C2=A0 =C2=A0 5dc0daff0341c mm/migrate: report RCU-tasks quiescent states i=
n migrate_pages_batch()<br>
=C2=A0 =C2=A0 3fc8044251de2 mm/kmemleak: avoid soft lockup when scanning ta=
sk stacks<br>
=C2=A0 =C2=A0 2cfa9ae90813b mm/gup: fix always draining LRU caches in colle=
ct_longterm_unpinnable_folios()<br>
=C2=A0 =C2=A0 d423737dca23f mm, swap: ratelimit bad swap entry reports<br>
=C2=A0 =C2=A0 f2c14f4d427d1 include/linux/list.h: mark list_add and __list_=
add as __always_inline<br>
=C2=A0 =C2=A0 28069434aef66 apparmor: fix out-of-bounds write when null ter=
minating a label vec<br>
=C2=A0 =C2=A0 587a6a92b93ec apparmor: fix cred UAF caused by begin_current_=
label_crit_section()<br>
=C2=A0 =C2=A0 753c978f2400f KEYS: trusted: Fix TPM teardown ordering<br>
=C2=A0 =C2=A0 0a10989de6103 rust: kernel: list: fix incorrect pop_back exam=
ple comment<br>
=C2=A0 =C2=A0 138722d631acf rust: bug: skip arch-specific asm in `testlib` =
builds<br>
=C2=A0 =C2=A0 2bf5e8f7c9bf4 timers/itimer: Zero-init old itimerval before c=
opy to userspace<br>
=C2=A0 =C2=A0 e6da8a0f39769 powerpc/pseries/iommu: switch to Default DMA wi=
ndow during kdump<br>
=C2=A0 =C2=A0 c03114634d342 fs: fix user path of nested backing files<br>
=C2=A0 =C2=A0 bf38be01d43c4 clocksource/drivers/timer-sun4i: Advertise a re=
al minimum delta<br>
=C2=A0 =C2=A0 d53c29a89a15e clocksource/drivers/nxp-pit: Fix IRQ leak on cp=
uhp_setup_state error path<br>
=C2=A0 =C2=A0 312f85fdd029b alpha: don&#39;t leak hardware-fabricated FP ex=
ception bits to user space<br>
=C2=A0 =C2=A0 c25b2aa077d5b rust: time: fix as_micros_ceil() rounding near =
i64::MAX<br>
=C2=A0 =C2=A0 7d00a3ff6244f alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD =
unconditionally<br>
=C2=A0 =C2=A0 4628e40c9ca79 drm/amd/display: Prune per-tile Timing from App=
le Studio Display Primary Tile<br>
=C2=A0 =C2=A0 7d860bed13369 drm/amd/display: hide Apple Studio Display seco=
ndary tile<br>
=C2=A0 =C2=A0 c6b915f0df311 drm/amd/display: Refactor amdgpu_dm_connector_d=
etect (v2)<br>
=C2=A0 =C2=A0 a1fa3d1197cc2 drm/amd/display: Skip PHY SSC reduction on some=
 8K panels<br>
=C2=A0 =C2=A0 d5c9d19b0ff2f netfs: Fix missing locking around retry adding =
new subreqs<br>
=C2=A0 =C2=A0 ce493f9261cd3 platform/x86: lenovo-wmi-helpers: Fix memory le=
ak in lwmi_dev_evaluate_int()<br>
=C2=A0 =C2=A0 2ab18de5ebb11 drm/amd/display: Avoid NULL dereference in dc_d=
mub_srv error paths<br>
=C2=A0 =C2=A0 24ebaf6676ae4 nsfs: tighten permission checks for handle open=
ing<br>
=C2=A0 =C2=A0 ea150ffa9fc9f bpf: Fix incorrect pruning due to atomic fetch =
precision tracking<br>
=C2=A0 =C2=A0 5d562153b4719 ip_tunnel: adapt iptunnel_xmit_stats() to NETDE=
V_PCPU_STAT_DSTATS<br>
=C2=A0 =C2=A0 a8bbb2a60513b fuse: wait for FR_FINISHED on abort_on_kill to =
prevent use-after-free<br>
=C2=A0 =C2=A0 5fc3d921512d3 wifi: ath11k: fix memory leaks in beacon templa=
te setup<br>
=C2=A0 =C2=A0 8527ac1bce87a wifi: mt76: Fix memory leak after mt76_connac_m=
cu_alloc_sta_req()<br>
=C2=A0 =C2=A0 c79ef3342632e perf/x86/intel/uncore: Fix die ID init and look=
 up bugs<br>
=C2=A0 =C2=A0 1c732c6b94f0f Linux 6.18.49<br>
=C2=A0 =C2=A0 5f08c45bdcfd2 usb: usbfs: fix use-after-free of usb_device in=
 usbdev_release()<br>
=C2=A0 =C2=A0 22edb67861272 wifi: mt76: mt7925: ensure tx headroom in usb_s=
dio_tx_prepare_skb<br>
=C2=A0 =C2=A0 b4cb8081cf80f USB: c67x00: fix use-after-free in c67x00_add_i=
so_urb()<br>
=C2=A0 =C2=A0 683df50fff0f5 USB: serial: spcp8x5: drop broken carrier detec=
t support<br>
=C2=A0 =C2=A0 2ef5560387f2c USB: serial: option: fix slab OOB read in inter=
rupt URB callback<br>
=C2=A0 =C2=A0 6d3e202670b81 ALSA: usb-audio: Complete cleanup after system-=
resume errors<br>
=C2=A0 =C2=A0 91919b3b99ab7 ALSA: usb-audio: fix OOB write in snd_usbmidi_n=
ovation_output()<br>
=C2=A0 =C2=A0 7eb02825b3684 usb: core: Strengthen error handling in hub_hub=
_status()<br>
=C2=A0 =C2=A0 d80b946804674 usb: core: Add lock to usb_wakeup_notification(=
)<br>
=C2=A0 =C2=A0 935eeba276012 KVM: s390: vsie: zero stale crypto bits<br>
=C2=A0 =C2=A0 545a6b9c91e2b crypto: qce - Remove unsafe/deprecated algorith=
ms<br>
=C2=A0 =C2=A0 182f16a20d329 crypto: mxs-dcp - fix source scatterlist length=
 access<br>
=C2=A0 =C2=A0 2f65718b9c109 crypto: qce - fix CCM AAD buffer underallocatio=
n<br>
=C2=A0 =C2=A0 731a5b6fb4c17 crypto: krb5 - use kfree_sensitive() for derive=
d key buffers<br>
=C2=A0 =C2=A0 302ecd1106065 crypto: atmel-tdes - use scatterlist length bef=
ore DMA mapping<br>
=C2=A0 =C2=A0 4c00183209420 crypto: qcom-rng - Allow zero as a random numbe=
r<br>
=C2=A0 =C2=A0 14d9ee8286460 crypto: qcom-rng - Remove crypto_rng interface<=
br>
=C2=A0 =C2=A0 070b73019a534 crypto: qcom-rng - Enable clock in hwrng case<b=
r>
=C2=A0 =C2=A0 5545de5050cbc crypto: virtio - bound the akcipher result leng=
th<br>
=C2=A0 =C2=A0 e90bc78125cd7 kunit: irq: Continue increasing hrtimer interva=
l for longer<br>
=C2=A0 =C2=A0 34f3c35dd13a3 mm/swap: reject swapon() on filesystem-level en=
crypted files<br>
=C2=A0 =C2=A0 6fa88d11983c6 netfilter: nf_tables: don&#39;t queue packet pa=
th object notifications<br>
=C2=A0 =C2=A0 07ee91e6b7b0a netfilter: nft_set_pipapo_avx2: add missing vze=
roupper<br>
=C2=A0 =C2=A0 a8820c8a77183 vxlan: keep the last remote linked during FDB f=
lush<br>
=C2=A0 =C2=A0 916ec741e65af batman-adv: reject unrepresentable multicast TV=
LV offsets<br>
=C2=A0 =C2=A0 3e4476e58343f ipv6: seg6: clear IPv4 control block on IPIP de=
capsulation<br>
=C2=A0 =C2=A0 c069f29da7232 net: bridge: mcast: fix use-after-free of a mas=
ter VLAN&#39;s multicast context<br>
=C2=A0 =C2=A0 50229d334558a xfrm: bound nat keepalive state collection<br>
=C2=A0 =C2=A0 cf67361e78dca xfrm: fix xfrm_state_construct() auth-trunc lea=
k<br>
=C2=A0 =C2=A0 6733ae71268a2 xfrm: ah6: validate routing header segments_lef=
t<br>
=C2=A0 =C2=A0 5c86c895d1cac xfrm: avoid lock inversion in nat keepalive wor=
k<br>
=C2=A0 =C2=A0 328e40aa774b4 xfrm: drop ESP-in-TCP packets with no ingress d=
evice<br>
=C2=A0 =C2=A0 24efebecf415b xfrm: espintcp: fix UAF during close<br>
=C2=A0 =C2=A0 73fde8fe4469f net/tcp-ao: fix use-after-free of current_key o=
n reconnect to another peer<br>
=C2=A0 =C2=A0 70051a57786d5 tcp: fix AO info use-after-free in tcp_ao_conne=
ct_init()<br>
=C2=A0 =C2=A0 4527747760239 net/tcp: fix TCP-AO key deletion in VRFs<br>
=C2=A0 =C2=A0 b5d1534db32af x86/CPU/AMD: Carve out a Zen5 models range<br>
=C2=A0 =C2=A0 3d950e98f74af gtp: serialize PDP context updates<br>
=C2=A0 =C2=A0 fadbc1ed2a872 tls: device: fix out-of-bounds write in tls_app=
end_frag()<br>
=C2=A0 =C2=A0 0b0a668febb62 KVM: SEV: Wire up kvm_x86_ops.gmem_xxx() if and=
 only if CONFIG_KVM_AMD_SEV=3Dy<br>
=C2=A0 =C2=A0 9a45e7b0b140a KVM: SEV: Mark vCPU RUNNABLE after AP_CREATE, e=
ven if VMSA is unusable<br>
=C2=A0 =C2=A0 a3d45c2d645c6 KVM: SEV: Extract loading of guest-provided VMS=
A to a separate helper<br>
=C2=A0 =C2=A0 2de20fea62043 KVM: SEV: Track the GPA of the guest-controlled=
 VMSA used for SNP guests<br>
=C2=A0 =C2=A0 dd1638c95163d KVM: SEV: Drop FOLL_WRITE for encrypted region =
registration<br>
=C2=A0 =C2=A0 85aa61fedcb4e usb: gadget: f_tcm: keep port count until LUN t=
eardown completes<br>
=C2=A0 =C2=A0 3f6face69034f usb: usbtest: disable dynamic ID support<br>
=C2=A0 =C2=A0 776e85fda752f fuse: fix invalidate lock leak on open O_TRUNC =
DAX failure<br>
=C2=A0 =C2=A0 1758730d9eaa3 fuse: fix invalidate lock leak on setattr write=
back failure<br>
=C2=A0 =C2=A0 0f127d522dbcb xhci: dbgtty: Fix unregister on tty_alloc_drive=
r() failure<br>
=C2=A0 =C2=A0 0d0faf3cc44c4 xhci: dbgtty: Fix unregister on tty_register_dr=
iver() failure<br>
=C2=A0 =C2=A0 45dbddc389c59 usb: xhci: Handle USB3 port events when there i=
s one roothub<br>
=C2=A0 =C2=A0 56f20a406cc3b usb: xhci: Handle bogus TRB pointers in Missed =
Service Error events<br>
=C2=A0 =C2=A0 9786c42df8efb accessibility: speakup: unregister tty ldisc on=
 later init failures<br>
=C2=A0 =C2=A0 8ec7271e05df7 fpga: dfl: fme: add error handling<br>
=C2=A0 =C2=A0 6106fb7962a00 ksmbd: harden file lifetime during session tear=
down<br>
=C2=A0 =C2=A0 a8e1f970f9040 HID: ft260: fix stack-use-after-return write in=
 I2C read race<br>
=C2=A0 =C2=A0 30c37ac21a458 HID: ft260: validate i2c input report length<br=
>
=C2=A0 =C2=A0 8b5debb6252cd HID: asus: fix missing hid_is_usb() check<br>
=C2=A0 =C2=A0 d0754db7883c8 HID: asus: simplify RGB init sequence<br>
=C2=A0 =C2=A0 70589b0c005db HID: magicmouse: prevent unbounded recursion in=
 magicmouse_raw_event()<br>
=C2=A0 =C2=A0 e22f4494cc948 io_uring: defer eventfd signaling when queued f=
rom a wakeup handler<br>
=C2=A0 =C2=A0 0bcec5dda029c io_uring/rsrc: improve regbuf iov validation<br=
>
=C2=A0 =C2=A0 e973a371d35a2 io_uring: simplify IORING_SETUP_DEFER_TASKRUN &=
amp;&amp; !SQPOLL check<br>
=C2=A0 =C2=A0 2b7c6b90ce801 io_uring/futex: only mark private futex waits a=
s inflight<br>
=C2=A0 =C2=A0 b61ebb2826ca1 powerpc/hv-gpci: fix preempt count leak in sysf=
s show paths<br>
=C2=A0 =C2=A0 f2192741bdfc7 veth: fix OOB txq access in veth_poll() with as=
ymmetric queue counts<br>
=C2=A0 =C2=A0 34aef83af724a selinux: switch two allocations to use kzalloc_=
objs()<br>
=C2=A0 =C2=A0 caacbfb367210 ASoC: nau8821: Cancel pending work before suspe=
nd<br>
=C2=A0 =C2=A0 0599aa23734c4 riscv: Fix register corruption from uninitializ=
ed cregs on error<br>
=C2=A0 =C2=A0 85dc711f742b1 bpf: Fix use-after-free in offloaded map/prog i=
nfo fill<br>
=C2=A0 =C2=A0 13d20517bee1c ASoC: nau8821: Cancel delayed work on component=
 remove<br>
=C2=A0 =C2=A0 9ebaeeb6c2d42 selinux: require a class&#39;s permission value=
s to cover its permission count<br>
=C2=A0 =C2=A0 dfc59a062c386 selinux: reject a permission value exceeding th=
e class permission count<br>
=C2=A0 =C2=A0 42c5747a9f839 selinux: more strict policy parsing<br>
=C2=A0 =C2=A0 4ac3cc8a14db6 selinux: use u16 for security classes<br>
=C2=A0 =C2=A0 71ecdc1ba07fd Revert &quot;selinux: reject a permission value=
 exceeding the class permission count&quot;<br>
=C2=A0 =C2=A0 64561afb42d83 nvme-tcp: fix usage of page_frag_cache<br>
=C2=A0 =C2=A0 c0a9bd5fca0b5 KVM: x86/mmu: Check write tracking in all addre=
ss spaces<br>
=C2=A0 =C2=A0 8be5f23ae9490 drm/xe/guc_ads: use uncached mapping for UM que=
ue BO<br>
=C2=A0 =C2=A0 a65b52f6cdc92 drm/xe/guc_ads: allocate UM queues in VRAM on d=
GFX<br>
=C2=A0 =C2=A0 af2d3f6f29b07 drm/xe/guc_ads: allocate UM queues in a separat=
e BO<br>
=C2=A0 =C2=A0 bdf5deccfbf9f RDMA/rxe: Fix OOB in free_rd_atomic_resources()=
<br>
=C2=A0 =C2=A0 ffa4f0be69656 RDMA/rxe: Fix responder UAF on IB_QP_MAX_DEST_R=
D_ATOMIC modify_qp<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_6.18.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_6.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_6.18.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_6.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a> | 24 +++++++++---=
-------<br>
=C2=A03 files changed, 18 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a><br>
index 55f3fe8907..d4ca18a7b2 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a><br>
@@ -15,13 +15,13 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&quot;Set PREFE=
RRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br>
=C2=A0}<br>
<br>
-SRCREV_machine ?=3D &quot;c82ff0cbda2a00b9073e06c9fe4ba550c9056d45&quot;<b=
r>
-SRCREV_meta ?=3D &quot;c8484925c85ec1e6510c75d9e1b36e01d6e2e904&quot;<br>
+SRCREV_machine ?=3D &quot;ed7481e8a1df4a3417915acd6bef5a72d6fa71bb&quot;<b=
r>
+SRCREV_meta ?=3D &quot;bf8faf1b184fcf6c555ee951f501e76f88eccf35&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.18=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-6.18;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
-LINUX_VERSION ?=3D &quot;6.18.48&quot;<br>
+LINUX_VERSION ?=3D &quot;6.18.50&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.18.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a><br>
index 3b1342d677..56a3d18ee5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a><br>
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.18.inc<br>
<br>
-LINUX_VERSION ?=3D &quot;6.18.48&quot;<br>
+LINUX_VERSION ?=3D &quot;6.18.50&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
@@ -18,8 +18,8 @@ DEPENDS +=3D &quot;openssl-native util-linux-native&quot;=
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a&quot;<b=
r>
-SRCREV_meta ?=3D &quot;c8484925c85ec1e6510c75d9e1b36e01d6e2e904&quot;<br>
+SRCREV_machine ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c0514e1&quot;<b=
r>
+SRCREV_meta ?=3D &quot;bf8faf1b184fcf6c555ee951f501e76f88eccf35&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.18.bb</a><br>
index 8030143479..719c1fa51a 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a><br>
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?=3D &quot;v6.18/standard/base&quot;=
<br>
=C2=A0KBRANCH:qemuloongarch64=C2=A0 ?=3D &quot;v6.18/standard/base&quot;<br=
>
=C2=A0KBRANCH:qemumips64 ?=3D &quot;v6.18/standard/mti-malta&quot;<br>
<br>
-SRCREV_machine:qemuarm ?=3D &quot;0f778c0a178fdc50063c212b5320b1f082f83f1a=
&quot;<br>
-SRCREV_machine:qemuarm64 ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d3b=
0a&quot;<br>
-SRCREV_machine:qemuloongarch64 ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4=
426d3b0a&quot;<br>
+SRCREV_machine:qemuarm ?=3D &quot;dbe5ee845060d0b8ddf934a2e3d96627fdb1bd81=
&quot;<br>
+SRCREV_machine:qemuarm64 ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c0514=
e1&quot;<br>
+SRCREV_machine:qemuloongarch64 ?=3D &quot;aba8c69040fd3d5763477a733b4696a7=
9c0514e1&quot;<br>
=C2=A0SRCREV_machine:qemumips ?=3D &quot;62ea92a539f58803a222be98b811184030=
74206e&quot;<br>
-SRCREV_machine:qemuppc ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a=
&quot;<br>
-SRCREV_machine:qemuriscv64 ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d=
3b0a&quot;<br>
-SRCREV_machine:qemuriscv32 ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d=
3b0a&quot;<br>
-SRCREV_machine:qemux86 ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a=
&quot;<br>
-SRCREV_machine:qemux86-64 ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d3=
b0a&quot;<br>
+SRCREV_machine:qemuppc ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c0514e1=
&quot;<br>
+SRCREV_machine:qemuriscv64 ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c05=
14e1&quot;<br>
+SRCREV_machine:qemuriscv32 ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c05=
14e1&quot;<br>
+SRCREV_machine:qemux86 ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c0514e1=
&quot;<br>
+SRCREV_machine:qemux86-64 ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c051=
4e1&quot;<br>
=C2=A0SRCREV_machine:qemumips64 ?=3D &quot;9fb4ff0187c85426f21fd40d4c61b742=
800f65c4&quot;<br>
-SRCREV_machine ?=3D &quot;ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a&quot;<b=
r>
-SRCREV_meta ?=3D &quot;c8484925c85ec1e6510c75d9e1b36e01d6e2e904&quot;<br>
+SRCREV_machine ?=3D &quot;aba8c69040fd3d5763477a733b4696a79c0514e1&quot;<b=
r>
+SRCREV_meta ?=3D &quot;bf8faf1b184fcf6c555ee951f501e76f88eccf35&quot;<br>
<br>
=C2=A0# set your preferred provider of linux-yocto to &#39;linux-yocto-upst=
ream&#39;, and you&#39;ll<br>
=C2=A0# get the &lt;version&gt;/base branch, which is pure upstream -stable=
, and the same<br>
=C2=A0# meta SRCREV as the linux-yocto-standard builds. Select your version=
 using the<br>
=C2=A0# normal PREFERRED_VERSION settings.<br>
=C2=A0BBCLASSEXTEND =3D &quot;devupstream:target&quot;<br>
-SRCREV_machine:class-devupstream ?=3D &quot;5bbb9c9f8f808710e2123f2b30f0d6=
1d7d698f52&quot;<br>
+SRCREV_machine:class-devupstream ?=3D &quot;7cfc41f8e80f11ffa8382ed1a50515=
4ceffb79c7&quot;<br>
=C2=A0PN:class-devupstream =3D &quot;linux-yocto-upstream&quot;<br>
=C2=A0KBRANCH:class-devupstream =3D &quot;v6.18/base&quot;<br>
<br>
@@ -43,7 +43,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoprojec=
t.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branc=
h=3D${KBRA</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.18=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-6.18;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
-LINUX_VERSION ?=3D &quot;6.18.48&quot;<br>
+LINUX_VERSION ?=3D &quot;6.18.50&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245906): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245906" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245906</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121269558/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121269558/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000003e72b8065b8c8b84--

