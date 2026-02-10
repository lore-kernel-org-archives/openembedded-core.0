Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61C9EA8121
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:19:24 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20457.1770733156005345692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/D5+9gx;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-352e3d18fa7so3171937a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 06:19:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770733155; cv=none;
        d=google.com; s=arc-20240605;
        b=cseO5pZN4LRp19w37UaaCLSLWuk5BRR30TYXeyhkQlFNxNNLqRhWqyXByxZ8B9BYf2
         EBJaB6hYug9pi99IYF/ifNTikyxpUKAHDZgAYgJ8EfdwPCoPxA1aSd6RNJ0qWCuxNYl5
         mSAbUYIVbmWjotKyJGIwWBHP8rDH3F4DptagYZzD6keMx1AadMNwI7blBrwX8iIerHao
         N5mShJGQa2N3TMB12LOpS9CXB2vRhm6iIaCBJFtiqcgzZ35oAgNoiIhfXk7YZ4adT2cS
         p4rIn3HlvlZeTyXZR2NmKCAStsVtZVIHyzj/9fURLSMHzRrIa9lEURq/KFu++aCIw4ab
         5F6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R1la2+0RmzziYCyrnDNUhzAR9lYriUhxedgqcFXdzOE=;
        fh=RXNST8poUFzdY53gi6l+0KtNjU1RqyBP+ZU7aUt9plI=;
        b=Pb26ki5dOOod64prtugrjCEqn1jud5h8i9KZpNwm2snp1yyVQa9GsilmQW/ygPIBbt
         7W5BONQVQj9Z2K0uHZNXBipUn3ayLQh1XsDAzU/sz+iWHQH9sRftoNaWWSqGTDPZWWo7
         OLwwHVkt/NiV7B2AVrcEnWWc1qqA5qYh2jMHFUI9LUu/KIwVz0vJ0p5jLlomdfUEy4fg
         HKSx2H30/bd9AQ2uUf8OpavAAwyorz5rxbRDwDVxDyLESLpllS6xqc4GgRd+QQnIA9yd
         GD0cm7W1RrGB0vYmddcdul+n07s3SdnvhC4f0BbsHevoJh2lQXAP00UapIg5BbrKEv+d
         aKVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770733155; x=1771337955; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1la2+0RmzziYCyrnDNUhzAR9lYriUhxedgqcFXdzOE=;
        b=f/D5+9gxht2nr7AMHvZ40FWikx5sdciTnjkbxbjyi3S0EJTTwaqQPA9TUkEhSj+MzC
         7d9/+wZn3s9nYQMZ5rjss/D/kt99hu5TG+zfqZML53SR6e1pEsTmvObA+8luzXX9IJ3b
         y2zTnD0AVaiXSTETapKZV06zALcufCBpzWeFR4xSm+B+FJkQ85Q5+0yg23unakjFwiib
         JOmQaBLPyoti4VKETMJF52JpMInDPmVfaD2vK6VoC3UMxRQpKRCq39crAkPmxq+7SeUb
         2nT8wWBs9HGnfy8m+PT4yQO85mE3pY8YwhT5skdXQR9Ewq4e427GeX02y9XIduZUoEvI
         LYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770733155; x=1771337955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1la2+0RmzziYCyrnDNUhzAR9lYriUhxedgqcFXdzOE=;
        b=EkTicnqTm7VV+zdBLyioKS/ATLBCJ7UIvyePflXVerH8kd5Eas35qTKAJaVcqaoFqe
         hH1KO4mYcJWWzzF6CA6UzQ7OHDgNQxNKxvwUTUG9w8I7+nFui7WWiwbewvfu2cZlu3pQ
         7oh8srvxbRjGcgy1xnuzwhsH6anSgENQHn1t5FJlobVYuReJjGZcFL5IBI76ccZso9HJ
         k70Dfh5BYKs5YJqfZ4RmTrKMg/s8s/X99Cqn3XoSOz1uqomJHdd7qfXsWC6bMFlUojK3
         DJ5btlf1TpRUWv29IJG/Nj6jXZQPzguAophT+6gcC0rC4o5qBP36K1Ww3O525jisqBGA
         2utg==
X-Forwarded-Encrypted: i=1; AJvYcCU0v5S+6TOedF2D2+ekXATPlRBbg1SEyrTgPf88SjIbmVeMgzKzzw/LtIg9drojn1vitu6aFEe2S/LvFWyBiOIm5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfbotQEYEG0rHVaHIIiE4oIcOMAH9B4hjsiPfip2EI5XhTXyb+
	r8MkGpvr4NkGVDtj6bmPDHDggSXOfNMlw20tx3PWtq1e/o1bvTWwZlHiaW+iw0sWL722R07w6nX
	W/rFKJs5GrHTxP+oQl8aEevFyrqDZwpM=
X-Gm-Gg: AZuq6aLph0Tk5TwLxON7oZ54t0XLzbxoQ2OKZ9cryoxBq5IzT732Ga2durYFs++npO+
	3ag0bwYqO28kUd7Uk/G7q9gnJr/9u+4xAqRcuPWt39+SvuJWz6x66R2Rnns9Oew+K2EEWbBFBAZ
	r3YwAoFeD3ypBmqvJGYasOb0vuAnasi7RdSVt02LUWSNtZ0H33MK9LhaIMozmEw+1OYTH9ZH1Jr
	Ry1rALEge1fsDhJ8Ht/HUoIYyLu9PHXJ0Y+2yZO56+nnkXBPFmIGUuwCpEKVMA3Tt6FPnjjR732
	p8KWjwve0tVvBi16cN3gH5bdgX7wBe4m1EkcrzyapkTuZ3/sYFk=
X-Received: by 2002:a17:90b:3eca:b0:354:a439:d9e0 with SMTP id
 98e67ed59e1d1-354b3d095d6mr11808789a91.36.1770733155194; Tue, 10 Feb 2026
 06:19:15 -0800 (PST)
MIME-Version: 1.0
References: <1892E8125E65DBD8.591740@lists.openembedded.org>
In-Reply-To: <1892E8125E65DBD8.591740@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Feb 2026 09:19:02 -0500
X-Gm-Features: AZwV_QgcaYU-Kj68jZkJ5JeG0hszqlk6ExN2kqekvmq-nNxkJCak6bJjciwtwTQ
Message-ID: <CADkTA4OQbiEu0m2mmYLrh6V36EuQG+fsugW9Go9dnDEv935QEA@mail.gmail.com>
Subject: Re: [OE-core] [meta-yocto-bsp][PATCH] yocto-bsp: update to kernel v6.18.9
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b51aaf064a78f01d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 14:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230904

--000000000000b51aaf064a78f01d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ignore this for now.

I haven't sent the base bump to 6.18.9 so this will just give you a PV
warning in a different direction from the previous one.

Bruce

On Tue, Feb 10, 2026 at 9:12=E2=80=AFAM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.18 to the latest korg -stable release that compris=
es
> the following commits:
>
>     adb851edb7078 Linux 6.18.9
>     0d26aa84ff0b7 mptcp: avoid dup SUB_CLOSED events after disconnect
>     01b0831d71b6d sched_ext: Fix SCX_KICK_WAIT to work reliably
>     664e78f2d4ec3 sched_ext: Don't kick CPUs running higher classes
>     edb9fab1b78c6 net/sched: act_ife: convert comma to semicolon
>     5b22c6cbabc78 Revert "drm/nouveau/disp: Set
> drm_mode_config_funcs.atomic_(check|commit)"
>     ab21cf885fb2a libbpf: Fix -Wdiscarded-qualifiers under C23
>     f749b366b8e79 gpiolib: acpi: Fix potential out-of-boundary left shift
>     84df65fcfbff1 iommu/tegra241-cmdqv: Reset VCMDQ in
> tegra241_vcmdq_hw_init_user()
>     078377b07f8e8 drm/amdgpu: Fix cond_exec handling in
> amdgpu_ib_schedule()
>     ac251d17d8af5 drm/amdgpu: fix NULL pointer dereference in
> amdgpu_gmc_filter_faults_remove
>     2d9bff2af0adb drm/amdgpu/gfx12: adjust KGQ reset sequence
>     d9790cf8bbe80 drm/amdgpu/gfx12: fix wptr reset in KGQ init
>     4867b512bb7f5 drm/amdgpu/gfx11: adjust KGQ reset sequence
>     018892bd9a0c0 drm/amdgpu/gfx11: fix wptr reset in KGQ init
>     75ebd42441702 drm/amdgpu/gfx10: fix wptr reset in KGQ init
>     9a6d87fbe3f51 drm/amdgpu/soc21: fix xclk for APUs
>     5f841c308c453 drm/amd/pm: fix smu v14 soft clock frequency setting
> issue
>     191e22e5d742e drm/amd/pm: fix smu v13 soft clock frequency setting
> issue
>     ca68745e820ec drm/imx/tve: fix probe device leak
>     31203f5680c3d drm/msm/a6xx: fix bogus hwcg register updates
>     a4ea228271cd4 drm/tyr: depend on `COMMON_CLK` to fix build error
>     3e845c46dfe5a drm/xe/xelp: Fix Wa_18022495364
>     ae8831ee0fb2f drm: Do not allow userspace to trigger kernel warnings
> in drm_gem_change_handle_ioctl()
>     dd222df5b356e scripts: generate_rust_analyzer: Add compiler_builtins
> -> core dep
>     8afa6c4d7abfb scripts: generate_rust_analyzer: fix resolution of
> #[pin_data] macros
>     2426867644cc7 scripts: generate_rust_analyzer: compile sysroot with
> correct edition
>     ce798a0fe6b79 scripts: generate_rust_analyzer: remove sysroot asserti=
on
>     595718c74f85b scripts: generate_rust_analyzer: Add pin_init_internal
> deps
>     5bfa32ff75b50 scripts: generate_rust_analyzer: Add pin_init ->
> compiler_builtins dep
>     e82f822ed1472 rust: sync: refcount: always inline functions using
> build_assert with arguments
>     4bb727f4b0614 rust: sync: atomic: Provide stub for `rusttest` 32-bit
> hosts
>     625605ac8be50 rust: bits: always inline functions using build_assert
> with arguments
>     3d48d59235c49 net: fix segmentation of forwarding fraglist GRO
>     b23bee8cdb7aa mm/shmem, swap: fix race of truncate and swap entry spl=
it
>     40aed8b856580 mm/memory-failure: teach kill_accessing_process to
> accept hugetlb tail page pfn
>     b0020cbd26380 mm, swap: restore swap_space attr aviod kernel panic
>     4f57516293fda mm/memory-failure: fix missing ->mf_stats count in
> hugetlb poison
>     c71fae335dfe7 mm/kfence: randomize the freelist on initialization
>     629666d20c7dc btrfs: do not strictly require dirty metadata threshold
> for metadata writepages
>     b91a84299d72a flex_proportions: make fprop_new_period() hardirq safe
>     131af3df59b24 selftests: mptcp: join: fix local endp not being tracke=
d
>     e73aab3337833 selftests: mptcp: check subflow errors in close events
>     8d4ccc10a77f0 selftests: mptcp: check no dup close events after error
>     35bb480000cd2 mptcp: only reset subflow errors when propagated
>     33f971476ffc1 mm/kasan: fix KASAN poisoning in vrealloc()
>     0ac0e2e64b068 gpio: rockchip: Stop calling pinctrl for set_direction
>     f69cae1bf44ca ALSA: hda/realtek: fix right sounds and mute/micmute
> LEDs for HP machine
>     68207ceefd71c nvmet: fix race in nvmet_bio_done() leading to NULL
> pointer dereference
>     e4e15a0a4403c efivarfs: fix error propagation in efivar_entry_get()
>     14ca9fa020829 scsi: qla2xxx: edif: Fix dma_free_coherent() size
>     5ba425a7bab31 kbuild: rust: clean libpin_init_internal in mrproper
>     e4c0a92146ddf gpio: pca953x: mask interrupts in irq shutdown
>     cb69b0a0c0aaf ASoC: amd: yc: Add DMI quirk for Acer TravelMate
> P216-41-TCO
>     98e0bc206a321 scsi: be2iscsi: Fix a memory leak in
> beiscsi_boot_get_sinfo()
>     91539cf522ed0 ASoC: fsl: imx-card: Do not force slot width to sample
> width
>     8b581837295fc rust: kbuild: give `--config-path` to `rustfmt` in
> `.rsi` target
>     50c66cb08070c rust: rbtree: fix documentation typo in CursorMut
> peek_next method
>     fe9a1a825b4ae riscv: compat: fix COMPAT_UTS_MACHINE definition
>     b038874e31fc3 firewire: core: fix race condition against transaction
> list
>     a28fce0365e1c perf: sched: Fix perf crash with new is_user_task()
> helper
>     112d497809970 pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to
> fix I2S2 and SWR TX pins
>     e81d1bc4ea791 pinctrl: meson: mark the GPIO controller as sleeping
>     e0468c4527a22 pinctrl: lpass-lpi: implement .get_direction() for the
> GPIO driver
>     b1f41c1f0bbbe writeback: fix 100% CPU usage when
> dirtytime_expire_interval is 0
>     36370892e3111 sched/deadline: Fix 'stuck' dl_server
>     0bbcb7586bc81 sched/deadline: Document dl_server
>     32887d8e4bc06 drm/xe/nvm: Fix double-free on aux add failure
>     02dc6cf6409e5 drm/xe/nvm: Manage nvm aux cleanup with devres
>     2859fa957a936 drm/xe/configfs: Fix is_bound() pci_dev lifetime
>     64364ccf491c7 dma/pool: distinguish between missing and exhausted
> atomic pools
>     d36c4149ea224 bcache: fix I/O accounting leak in
> detached_dev_do_request
>     7b72d76a58e6b bcache: use bio cloning for detached device requests
>     db6e287bd6e80 bcache: fix improper use of bi_end_io
>     23f9f9c46edd9 of: reserved_mem: Allow reserved_mem framework detect
> "cma=3D" kernel param
>     14e32032c42fe of/reserved_mem: Simplify the logic of
> fdt_scan_reserved_mem_reg_nodes()
>     8d9c5ceff4b53 kbuild: Fix permissions of modules.builtin.modinfo
>     32d8f998bb8d4 kbuild: rpm-pkg: Generate debuginfo package manually
>     d4dbada7ac6f3 gpio: brcmstb: correct hwirq to bank map
>     546e62c3fb29a drm/amd/pm: fix race in power state check before mutex
> lock
>     7bec90f605cfb gpio: virtuser: fix UAF in configfs release path
>     c0ce86d92565b gpiolib: acpi: use BIT_ULL() for u64 mask in address
> space handler
>     ecb638fb9a5cc ASoC: Intel: sof_es8336: fix headphone GPIO logic
> inversion
>     e67828aeb58d9 drm/xe: Skip address copy for sync-only execs
>     4d7b7abb525b4 ASoC: soc-acpi-intel-ptl-match: fix name_prefix of
> rt1320-2
>     a42bdbcada187 scsi: firewire: sbp-target: Fix overflow in
> sbp_make_tpg()
>     aabc36857bd39 wifi: mac80211: correctly decode TTLM with default link
> map
>     a4f9a19a266e6 wifi: mac80211: apply advertised TTLM from association
> response
>     b8d890f8c3223 wifi: mac80211: parse all TTLM entries
>     cc3f137d36fda net/mlx5e: Skip ESN replay window setup for IPsec crypt=
o
> offload
>     19bb3c68e18cf net/mlx5: Fix vhca_id access call trace use before allo=
c
>     fc3da1466af5f net/mlx5: Initialize events outside devlink lock
>     2614734c4bc67 net/mlx5: fs, Fix inverted cap check in tx flow table
> root disconnect
>     335031cacd7e8 net: phy: micrel: fix clk warning when removing the
> driver
>     92db64d3546f9 net/mlx5e: don't assume psp tx skbs are ipv6 csum
> handling
>     f4bb58e14f042 net: bridge: fix static key check
>     c3369fc5e6120 nfc: nci: Fix race between rfkill and
> nci_unregister_device().
>     92e0483402afc net/mlx5e: Account for netdev stats in ndo_get_stats64
>     fdf8437016f57 net/mlx5e: TC, delete flows only for existing peers
>     2df2aad9cf2f4 ice: stop counting UDP csum mismatch as rx_errors
>     36126ddbe9247 ice: Fix NULL pointer dereference in
> ice_vsi_set_napi_queues
>     214aed313f7a5 ixgbe: don't initialize aci lock in
> ixgbe_recovery_probe()
>     c721ea2ff5672 ixgbe: fix memory leaks in the ixgbe_recovery_probe()
> path
>     bd25b092a06a3 bonding: fix use-after-free due to enslave fail after
> slave array update
>     61858cbce6ca4 nfc: llcp: Fix memleak in nfc_llcp_send_ui_frame().
>     fdb99161cbef2 net: spacemit: Check for netif_carrier_ok() in
> emac_stats_update()
>     1f1b9523527df mptcp: fix race in mptcp_pm_nl_flush_addrs_doit()
>     dce375f4afc34 rocker: fix memory leak in rocker_world_port_post_fini(=
)
>     cdc4deb9e7be2 net/mlx5: Fix return type mismatch in
> mlx5_esw_vport_vhca_id()
>     2c0fb0f60bc15 net: wwan: t7xx: fix potential skb->frags overflow in R=
X
> path
>     500c1237c9a13 ipv6: use the right ifindex when replying to icmpv6 fro=
m
> localhost
>     0b74c6e132737 net: mvpp2: cls: Fix memory leak in
> mvpp2_ethtool_cls_rule_ins()
>     590c8179ffb01 sfc: fix deadlock in RSS config read
>     bd98324e327e4 bonding: annotate data-races around slave->last_rx
>     d753f3c3f9d7a octeon_ep: Fix memory leak in octep_device_setup()
>     f14d881f0a5aa net: bcmasp: fix early exit leak with fixed phy
>     713ba826ae114 can: gs_usb: gs_usb_receive_bulk_callback(): fix error
> message
>     23f40dbda938e net/mlx5: Fix memory leak in esw_acl_ingress_lgcy_setup=
()
>     3b63185053788 Bluetooth: MGMT: Fix memory leak in set_ssp_complete
>     03e8c90c62233 Bluetooth: hci_uart: fix null-ptr-deref in
> hci_uart_write_work
>     4081d53864dae can: at91_can: Fix memory leak in at91_can_probe()
>     e80617a5e1c24 btrfs: zlib: fix the folio leak on S390 hardware
> acceleration
>     474f851ec5e2e readdir: require opt-in for d_type flags
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappen=
d
> b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> index 469b766..40d0b49 100644
> --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> @@ -8,4 +8,4 @@ KMACHINE:genericx86 ?=3D "common-pc"
>  KMACHINE:genericx86-64 ?=3D "common-pc-64"
>
>  KBRANCH:genericarm64 ?=3D "v6.18/standard/genericarm64"
> -SRCREV_machine:genericarm64 ?=3D "bda6fab67940d099af3f0de6dceb1b397b5d07=
b3"
> +SRCREV_machine:genericarm64 ?=3D "04436cb2ef497ba23cb52e16f0e5caa54a7690=
4a"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230901):
> https://lists.openembedded.org/g/openembedded-core/message/230901
> Mute This Topic: https://lists.openembedded.org/mt/117738113/1050810
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

--000000000000b51aaf064a78f01d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Ign=
ore this for now.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I haven=
&#39;t sent the base bump to 6.18.9 so this will just=C2=A0give you a PV wa=
rning in a different direction from the previous one.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1=
0, 2026 at 9:12=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_=
blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Updating linux-yocto/6.18 to the latest korg -stable release that comprises=
<br>
the following commits:<br>
<br>
=C2=A0 =C2=A0 adb851edb7078 Linux 6.18.9<br>
=C2=A0 =C2=A0 0d26aa84ff0b7 mptcp: avoid dup SUB_CLOSED events after discon=
nect<br>
=C2=A0 =C2=A0 01b0831d71b6d sched_ext: Fix SCX_KICK_WAIT to work reliably<b=
r>
=C2=A0 =C2=A0 664e78f2d4ec3 sched_ext: Don&#39;t kick CPUs running higher c=
lasses<br>
=C2=A0 =C2=A0 edb9fab1b78c6 net/sched: act_ife: convert comma to semicolon<=
br>
=C2=A0 =C2=A0 5b22c6cbabc78 Revert &quot;drm/nouveau/disp: Set drm_mode_con=
fig_funcs.atomic_(check|commit)&quot;<br>
=C2=A0 =C2=A0 ab21cf885fb2a libbpf: Fix -Wdiscarded-qualifiers under C23<br=
>
=C2=A0 =C2=A0 f749b366b8e79 gpiolib: acpi: Fix potential out-of-boundary le=
ft shift<br>
=C2=A0 =C2=A0 84df65fcfbff1 iommu/tegra241-cmdqv: Reset VCMDQ in tegra241_v=
cmdq_hw_init_user()<br>
=C2=A0 =C2=A0 078377b07f8e8 drm/amdgpu: Fix cond_exec handling in amdgpu_ib=
_schedule()<br>
=C2=A0 =C2=A0 ac251d17d8af5 drm/amdgpu: fix NULL pointer dereference in amd=
gpu_gmc_filter_faults_remove<br>
=C2=A0 =C2=A0 2d9bff2af0adb drm/amdgpu/gfx12: adjust KGQ reset sequence<br>
=C2=A0 =C2=A0 d9790cf8bbe80 drm/amdgpu/gfx12: fix wptr reset in KGQ init<br=
>
=C2=A0 =C2=A0 4867b512bb7f5 drm/amdgpu/gfx11: adjust KGQ reset sequence<br>
=C2=A0 =C2=A0 018892bd9a0c0 drm/amdgpu/gfx11: fix wptr reset in KGQ init<br=
>
=C2=A0 =C2=A0 75ebd42441702 drm/amdgpu/gfx10: fix wptr reset in KGQ init<br=
>
=C2=A0 =C2=A0 9a6d87fbe3f51 drm/amdgpu/soc21: fix xclk for APUs<br>
=C2=A0 =C2=A0 5f841c308c453 drm/amd/pm: fix smu v14 soft clock frequency se=
tting issue<br>
=C2=A0 =C2=A0 191e22e5d742e drm/amd/pm: fix smu v13 soft clock frequency se=
tting issue<br>
=C2=A0 =C2=A0 ca68745e820ec drm/imx/tve: fix probe device leak<br>
=C2=A0 =C2=A0 31203f5680c3d drm/msm/a6xx: fix bogus hwcg register updates<b=
r>
=C2=A0 =C2=A0 a4ea228271cd4 drm/tyr: depend on `COMMON_CLK` to fix build er=
ror<br>
=C2=A0 =C2=A0 3e845c46dfe5a drm/xe/xelp: Fix Wa_18022495364<br>
=C2=A0 =C2=A0 ae8831ee0fb2f drm: Do not allow userspace to trigger kernel w=
arnings in drm_gem_change_handle_ioctl()<br>
=C2=A0 =C2=A0 dd222df5b356e scripts: generate_rust_analyzer: Add compiler_b=
uiltins -&gt; core dep<br>
=C2=A0 =C2=A0 8afa6c4d7abfb scripts: generate_rust_analyzer: fix resolution=
 of #[pin_data] macros<br>
=C2=A0 =C2=A0 2426867644cc7 scripts: generate_rust_analyzer: compile sysroo=
t with correct edition<br>
=C2=A0 =C2=A0 ce798a0fe6b79 scripts: generate_rust_analyzer: remove sysroot=
 assertion<br>
=C2=A0 =C2=A0 595718c74f85b scripts: generate_rust_analyzer: Add pin_init_i=
nternal deps<br>
=C2=A0 =C2=A0 5bfa32ff75b50 scripts: generate_rust_analyzer: Add pin_init -=
&gt; compiler_builtins dep<br>
=C2=A0 =C2=A0 e82f822ed1472 rust: sync: refcount: always inline functions u=
sing build_assert with arguments<br>
=C2=A0 =C2=A0 4bb727f4b0614 rust: sync: atomic: Provide stub for `rusttest`=
 32-bit hosts<br>
=C2=A0 =C2=A0 625605ac8be50 rust: bits: always inline functions using build=
_assert with arguments<br>
=C2=A0 =C2=A0 3d48d59235c49 net: fix segmentation of forwarding fraglist GR=
O<br>
=C2=A0 =C2=A0 b23bee8cdb7aa mm/shmem, swap: fix race of truncate and swap e=
ntry split<br>
=C2=A0 =C2=A0 40aed8b856580 mm/memory-failure: teach kill_accessing_process=
 to accept hugetlb tail page pfn<br>
=C2=A0 =C2=A0 b0020cbd26380 mm, swap: restore swap_space attr aviod kernel =
panic<br>
=C2=A0 =C2=A0 4f57516293fda mm/memory-failure: fix missing -&gt;mf_stats co=
unt in hugetlb poison<br>
=C2=A0 =C2=A0 c71fae335dfe7 mm/kfence: randomize the freelist on initializa=
tion<br>
=C2=A0 =C2=A0 629666d20c7dc btrfs: do not strictly require dirty metadata t=
hreshold for metadata writepages<br>
=C2=A0 =C2=A0 b91a84299d72a flex_proportions: make fprop_new_period() hardi=
rq safe<br>
=C2=A0 =C2=A0 131af3df59b24 selftests: mptcp: join: fix local endp not bein=
g tracked<br>
=C2=A0 =C2=A0 e73aab3337833 selftests: mptcp: check subflow errors in close=
 events<br>
=C2=A0 =C2=A0 8d4ccc10a77f0 selftests: mptcp: check no dup close events aft=
er error<br>
=C2=A0 =C2=A0 35bb480000cd2 mptcp: only reset subflow errors when propagate=
d<br>
=C2=A0 =C2=A0 33f971476ffc1 mm/kasan: fix KASAN poisoning in vrealloc()<br>
=C2=A0 =C2=A0 0ac0e2e64b068 gpio: rockchip: Stop calling pinctrl for set_di=
rection<br>
=C2=A0 =C2=A0 f69cae1bf44ca ALSA: hda/realtek: fix right sounds and mute/mi=
cmute LEDs for HP machine<br>
=C2=A0 =C2=A0 68207ceefd71c nvmet: fix race in nvmet_bio_done() leading to =
NULL pointer dereference<br>
=C2=A0 =C2=A0 e4e15a0a4403c efivarfs: fix error propagation in efivar_entry=
_get()<br>
=C2=A0 =C2=A0 14ca9fa020829 scsi: qla2xxx: edif: Fix dma_free_coherent() si=
ze<br>
=C2=A0 =C2=A0 5ba425a7bab31 kbuild: rust: clean libpin_init_internal in mrp=
roper<br>
=C2=A0 =C2=A0 e4c0a92146ddf gpio: pca953x: mask interrupts in irq shutdown<=
br>
=C2=A0 =C2=A0 cb69b0a0c0aaf ASoC: amd: yc: Add DMI quirk for Acer TravelMat=
e P216-41-TCO<br>
=C2=A0 =C2=A0 98e0bc206a321 scsi: be2iscsi: Fix a memory leak in beiscsi_bo=
ot_get_sinfo()<br>
=C2=A0 =C2=A0 91539cf522ed0 ASoC: fsl: imx-card: Do not force slot width to=
 sample width<br>
=C2=A0 =C2=A0 8b581837295fc rust: kbuild: give `--config-path` to `rustfmt`=
 in `.rsi` target<br>
=C2=A0 =C2=A0 50c66cb08070c rust: rbtree: fix documentation typo in CursorM=
ut peek_next method<br>
=C2=A0 =C2=A0 fe9a1a825b4ae riscv: compat: fix COMPAT_UTS_MACHINE definitio=
n<br>
=C2=A0 =C2=A0 b038874e31fc3 firewire: core: fix race condition against tran=
saction list<br>
=C2=A0 =C2=A0 a28fce0365e1c perf: sched: Fix perf crash with new is_user_ta=
sk() helper<br>
=C2=A0 =C2=A0 112d497809970 pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7=
280 to fix I2S2 and SWR TX pins<br>
=C2=A0 =C2=A0 e81d1bc4ea791 pinctrl: meson: mark the GPIO controller as sle=
eping<br>
=C2=A0 =C2=A0 e0468c4527a22 pinctrl: lpass-lpi: implement .get_direction() =
for the GPIO driver<br>
=C2=A0 =C2=A0 b1f41c1f0bbbe writeback: fix 100% CPU usage when dirtytime_ex=
pire_interval is 0<br>
=C2=A0 =C2=A0 36370892e3111 sched/deadline: Fix &#39;stuck&#39; dl_server<b=
r>
=C2=A0 =C2=A0 0bbcb7586bc81 sched/deadline: Document dl_server<br>
=C2=A0 =C2=A0 32887d8e4bc06 drm/xe/nvm: Fix double-free on aux add failure<=
br>
=C2=A0 =C2=A0 02dc6cf6409e5 drm/xe/nvm: Manage nvm aux cleanup with devres<=
br>
=C2=A0 =C2=A0 2859fa957a936 drm/xe/configfs: Fix is_bound() pci_dev lifetim=
e<br>
=C2=A0 =C2=A0 64364ccf491c7 dma/pool: distinguish between missing and exhau=
sted atomic pools<br>
=C2=A0 =C2=A0 d36c4149ea224 bcache: fix I/O accounting leak in detached_dev=
_do_request<br>
=C2=A0 =C2=A0 7b72d76a58e6b bcache: use bio cloning for detached device req=
uests<br>
=C2=A0 =C2=A0 db6e287bd6e80 bcache: fix improper use of bi_end_io<br>
=C2=A0 =C2=A0 23f9f9c46edd9 of: reserved_mem: Allow reserved_mem framework =
detect &quot;cma=3D&quot; kernel param<br>
=C2=A0 =C2=A0 14e32032c42fe of/reserved_mem: Simplify the logic of fdt_scan=
_reserved_mem_reg_nodes()<br>
=C2=A0 =C2=A0 8d9c5ceff4b53 kbuild: Fix permissions of modules.builtin.modi=
nfo<br>
=C2=A0 =C2=A0 32d8f998bb8d4 kbuild: rpm-pkg: Generate debuginfo package man=
ually<br>
=C2=A0 =C2=A0 d4dbada7ac6f3 gpio: brcmstb: correct hwirq to bank map<br>
=C2=A0 =C2=A0 546e62c3fb29a drm/amd/pm: fix race in power state check befor=
e mutex lock<br>
=C2=A0 =C2=A0 7bec90f605cfb gpio: virtuser: fix UAF in configfs release pat=
h<br>
=C2=A0 =C2=A0 c0ce86d92565b gpiolib: acpi: use BIT_ULL() for u64 mask in ad=
dress space handler<br>
=C2=A0 =C2=A0 ecb638fb9a5cc ASoC: Intel: sof_es8336: fix headphone GPIO log=
ic inversion<br>
=C2=A0 =C2=A0 e67828aeb58d9 drm/xe: Skip address copy for sync-only execs<b=
r>
=C2=A0 =C2=A0 4d7b7abb525b4 ASoC: soc-acpi-intel-ptl-match: fix name_prefix=
 of rt1320-2<br>
=C2=A0 =C2=A0 a42bdbcada187 scsi: firewire: sbp-target: Fix overflow in sbp=
_make_tpg()<br>
=C2=A0 =C2=A0 aabc36857bd39 wifi: mac80211: correctly decode TTLM with defa=
ult link map<br>
=C2=A0 =C2=A0 a4f9a19a266e6 wifi: mac80211: apply advertised TTLM from asso=
ciation response<br>
=C2=A0 =C2=A0 b8d890f8c3223 wifi: mac80211: parse all TTLM entries<br>
=C2=A0 =C2=A0 cc3f137d36fda net/mlx5e: Skip ESN replay window setup for IPs=
ec crypto offload<br>
=C2=A0 =C2=A0 19bb3c68e18cf net/mlx5: Fix vhca_id access call trace use bef=
ore alloc<br>
=C2=A0 =C2=A0 fc3da1466af5f net/mlx5: Initialize events outside devlink loc=
k<br>
=C2=A0 =C2=A0 2614734c4bc67 net/mlx5: fs, Fix inverted cap check in tx flow=
 table root disconnect<br>
=C2=A0 =C2=A0 335031cacd7e8 net: phy: micrel: fix clk warning when removing=
 the driver<br>
=C2=A0 =C2=A0 92db64d3546f9 net/mlx5e: don&#39;t assume psp tx skbs are ipv=
6 csum handling<br>
=C2=A0 =C2=A0 f4bb58e14f042 net: bridge: fix static key check<br>
=C2=A0 =C2=A0 c3369fc5e6120 nfc: nci: Fix race between rfkill and nci_unreg=
ister_device().<br>
=C2=A0 =C2=A0 92e0483402afc net/mlx5e: Account for netdev stats in ndo_get_=
stats64<br>
=C2=A0 =C2=A0 fdf8437016f57 net/mlx5e: TC, delete flows only for existing p=
eers<br>
=C2=A0 =C2=A0 2df2aad9cf2f4 ice: stop counting UDP csum mismatch as rx_erro=
rs<br>
=C2=A0 =C2=A0 36126ddbe9247 ice: Fix NULL pointer dereference in ice_vsi_se=
t_napi_queues<br>
=C2=A0 =C2=A0 214aed313f7a5 ixgbe: don&#39;t initialize aci lock in ixgbe_r=
ecovery_probe()<br>
=C2=A0 =C2=A0 c721ea2ff5672 ixgbe: fix memory leaks in the ixgbe_recovery_p=
robe() path<br>
=C2=A0 =C2=A0 bd25b092a06a3 bonding: fix use-after-free due to enslave fail=
 after slave array update<br>
=C2=A0 =C2=A0 61858cbce6ca4 nfc: llcp: Fix memleak in nfc_llcp_send_ui_fram=
e().<br>
=C2=A0 =C2=A0 fdb99161cbef2 net: spacemit: Check for netif_carrier_ok() in =
emac_stats_update()<br>
=C2=A0 =C2=A0 1f1b9523527df mptcp: fix race in mptcp_pm_nl_flush_addrs_doit=
()<br>
=C2=A0 =C2=A0 dce375f4afc34 rocker: fix memory leak in rocker_world_port_po=
st_fini()<br>
=C2=A0 =C2=A0 cdc4deb9e7be2 net/mlx5: Fix return type mismatch in mlx5_esw_=
vport_vhca_id()<br>
=C2=A0 =C2=A0 2c0fb0f60bc15 net: wwan: t7xx: fix potential skb-&gt;frags ov=
erflow in RX path<br>
=C2=A0 =C2=A0 500c1237c9a13 ipv6: use the right ifindex when replying to ic=
mpv6 from localhost<br>
=C2=A0 =C2=A0 0b74c6e132737 net: mvpp2: cls: Fix memory leak in mvpp2_ethto=
ol_cls_rule_ins()<br>
=C2=A0 =C2=A0 590c8179ffb01 sfc: fix deadlock in RSS config read<br>
=C2=A0 =C2=A0 bd98324e327e4 bonding: annotate data-races around slave-&gt;l=
ast_rx<br>
=C2=A0 =C2=A0 d753f3c3f9d7a octeon_ep: Fix memory leak in octep_device_setu=
p()<br>
=C2=A0 =C2=A0 f14d881f0a5aa net: bcmasp: fix early exit leak with fixed phy=
<br>
=C2=A0 =C2=A0 713ba826ae114 can: gs_usb: gs_usb_receive_bulk_callback(): fi=
x error message<br>
=C2=A0 =C2=A0 23f40dbda938e net/mlx5: Fix memory leak in esw_acl_ingress_lg=
cy_setup()<br>
=C2=A0 =C2=A0 3b63185053788 Bluetooth: MGMT: Fix memory leak in set_ssp_com=
plete<br>
=C2=A0 =C2=A0 03e8c90c62233 Bluetooth: hci_uart: fix null-ptr-deref in hci_=
uart_write_work<br>
=C2=A0 =C2=A0 4081d53864dae can: at91_can: Fix memory leak in at91_can_prob=
e()<br>
=C2=A0 =C2=A0 e80617a5e1c24 btrfs: zlib: fix the folio leak on S390 hardwar=
e acceleration<br>
=C2=A0 =C2=A0 474f851ec5e2e readdir: require opt-in for d_type flags<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-<=
br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend =
b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend<br>
index 469b766..40d0b49 100644<br>
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend<br>
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend<br>
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?=3D &quot;common-pc&quot;<br>
=C2=A0KMACHINE:genericx86-64 ?=3D &quot;common-pc-64&quot;<br>
<br>
=C2=A0KBRANCH:genericarm64 ?=3D &quot;v6.18/standard/genericarm64&quot;<br>
-SRCREV_machine:genericarm64 ?=3D &quot;bda6fab67940d099af3f0de6dceb1b397b5=
d07b3&quot;<br>
+SRCREV_machine:genericarm64 ?=3D &quot;04436cb2ef497ba23cb52e16f0e5caa54a7=
6904a&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230901): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230901" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230901</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117738113/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117738113/1050810</a><br>
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

--000000000000b51aaf064a78f01d--

