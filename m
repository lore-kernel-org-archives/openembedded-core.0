Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341FEC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:01:54 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.2024.1712080906562301280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q0zCaL2q;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6152088aa81so11423107b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712080906; x=1712685706; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+NEbkydGPEWt2Ga/nqdyuipItMqI15dr+qZOLreXaw=;
        b=q0zCaL2qEVRTuqoCIwD6DrdpjrZccesDh2XLNlh7SroE699d73cKroZvPNvReQtvWL
         kSi3h/WDCL5FtlpwkkQ+Mwj9NSusUOU9bksDCYhdDvrYfAnpPbLMJyK5HSxDJ1boS5mC
         2NsPHiSPwxs/ImOTrxwW9BthFQ8TrPKf06aQvkAcBt3qj6QJovj2DC5TuY+a5wSSx8yA
         zPb+/BdhlS76SyG5YAdGMZSGeRaJuMUvRv53WlhyTu5EtzF61KyI2XLQ0cHxvPUhgl5C
         5cqI5nAqkBjfUFbUJvhslePpp5kr3zNtGT7j+r4Iv/6l/qp4CVgyMe5s94aw4z/JcmZj
         Iykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712080906; x=1712685706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+NEbkydGPEWt2Ga/nqdyuipItMqI15dr+qZOLreXaw=;
        b=GAKAMSMlxefw0mZyRqeaPu5AHpJy/DobyC9C5/bZmqsoTxAmfZJnEZjTxg5aM6EIGn
         2MJmOx6t9IsbVPrYkgUYEPRXEsXEAAOAEvgjINhTGiMYrHJHtLyAGWVbBrPe3IrWUZig
         nJuNFvpDwNrTpLtdF/zdpqS8jawvztppah97GZzrwAdQ+aIzmDlFapqwy+TPXrUXauzs
         FEXDKnS7Wi1jyJaF84XmMu9v0qFafnMvSxsy/mtvdy668CeXV4cySjCJ4XNSoelEjHPa
         Xq5Be1okfiKlj5c/w5W/6Rxn0Qmv0FCAOZ2NF51SOc90Gs8wI7+SR8BkdTQYh4UEOfV9
         dwlA==
X-Gm-Message-State: AOJu0YwXZAqiiMGo5ZYFWyu8SFKAkuaAr80dH3/VDWIl0HXehUo3Cfij
	sMMihuJO9nAtU7dxz1xXKWI4qkwbX9wCR4dCFzjupsW7z1yaEALyzi3+59qgW5+vbgj0/Vqac/i
	OocLgbpJPQAoI+spp/Fh4EST/rm9xCbeo7F9DbTxDy7ff4u+wFs9ABg==
X-Google-Smtp-Source: AGHT+IHzpmtCOj99EMlGgbXi114D3Eqs/9CZxMKSmlJOMavqXZio0smkeskK9uIrYCE1UW1wgPsojopG/NhwikchBYQ=
X-Received: by 2002:a0d:d7c3:0:b0:615:1c3c:ef63 with SMTP id
 z186-20020a0dd7c3000000b006151c3cef63mr3011137ywd.20.1712080904447; Tue, 02
 Apr 2024 11:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240329103655.2981552-1-yogita.urade@windriver.com>
In-Reply-To: <20240329103655.2981552-1-yogita.urade@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Apr 2024 08:01:32 -1000
Message-ID: <CAOSpxdYGsGrgakH2CUhLatSz_BT=rgeKwovb6jfv43YJwPNUKQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] qemu: fix CVE-2023-3019
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 18:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197874

I'm getting oe-selftest failures with this patch:

https://errors.yoctoproject.org/Errors/Details/761408/

"Failed: qemux86 does not shutdown within timeout(120)"

Steve

On Fri, Mar 29, 2024 at 12:38=E2=80=AFAM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> A DMA reentrancy issue leading to a use-after-free error was
> found in the e1000e NIC emulation code in QEMU. This issue
> could allow a privileged guest user to crash the QEMU process
> on the host, resulting in a denial of service.
>
> Fix indent issue in qemu.inc file
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-3019
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  19 +-
>  .../qemu/qemu/CVE-2023-3019-0001.patch        | 135 ++++
>  .../qemu/qemu/CVE-2023-3019-0002.patch        | 610 ++++++++++++++++++
>  .../qemu/qemu/CVE-2023-3019-0003.patch        |  88 +++
>  4 files changed, 844 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0001.pa=
tch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0002.pa=
tch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0003.pa=
tch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index ad6b310137..08ce72546d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -97,17 +97,20 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>             file://CVE-2023-3301.patch \
>             file://CVE-2023-3255.patch \
>             file://CVE-2023-2861.patch \
> -          file://CVE-2020-14394.patch \
> -          file://CVE-2023-3354.patch \
> -          file://CVE-2023-3180.patch \
> -          file://CVE-2021-3638.patch \
> -          file://CVE-2023-1544.patch \
> -          file://CVE-2023-5088.patch \
> -          file://CVE-2024-24474.patch \
> -          file://CVE-2023-6693.patch \
> +           file://CVE-2020-14394.patch \
> +           file://CVE-2023-3354.patch \
> +           file://CVE-2023-3180.patch \
> +           file://CVE-2021-3638.patch \
> +           file://CVE-2023-1544.patch \
> +           file://CVE-2023-5088.patch \
> +           file://CVE-2024-24474.patch \
> +           file://CVE-2023-6693.patch \
>             file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the=
-block-size.patch \
>             file://scsi-disk-ensure-block-size-is-non-zero-and-changes-li=
mited-to-bits-8-15.patch \
>             file://CVE-2023-42467.patch \
> +           file://CVE-2023-3019-0001.patch \
> +           file://CVE-2023-3019-0002.patch \
> +           file://CVE-2023-3019-0003.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2023-3019-0001.patch
> new file mode 100644
> index 0000000000..c1ef645eaf
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0001.patch
> @@ -0,0 +1,135 @@
> +From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
> +From: Alexander Bulekov <alxndr@bu.edu>
> +Date: Wed, 27 Mar 2024 09:41:44 +0000
> +Subject: [PATCH] memory: prevent dma-reentracy issues
> +
> +Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> +This flag is set/checked prior to calling a device's MemoryRegion
> +handlers, and set when device code initiates DMA.  The purpose of this
> +flag is to prevent two types of DMA-based reentrancy issues:
> +
> +1.) mmio -> dma -> mmio case
> +2.) bh -> dma write -> mmio case
> +
> +These issues have led to problems such as stack-exhaustion and
> +use-after-frees.
> +
> +Summary of the problem from Peter Maydell:
> +https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5=
KcknhPRD5fPBZA@mail.gmail.com
> +
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> +Resolves: CVE-2023-0330
> +
> +Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> +Reviewed-by: Thomas Huth <thuth@redhat.com>
> +Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
> +[thuth: Replace warn_report() with warn_report_once()]
> +Signed-off-by: Thomas Huth <thuth@redhat.com>
> +
> +CVE: CVE-2023-3019
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/a2e1753b8=
054344f32cf94f31c6399a58794a380]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + include/exec/memory.h  |  5 +++++
> + include/hw/qdev-core.h |  7 +++++++
> + softmmu/memory.c       | 16 ++++++++++++++++
> + 3 files changed, 28 insertions(+)
> +
> +diff --git a/include/exec/memory.h b/include/exec/memory.h
> +index 20f1b2737..e089f90f9 100644
> +--- a/include/exec/memory.h
> ++++ b/include/exec/memory.h
> +@@ -734,6 +734,8 @@ struct MemoryRegion {
> +     bool is_iommu;
> +     RAMBlock *ram_block;
> +     Object *owner;
> ++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access h=
otpath */
> ++    DeviceState *dev;
> +
> +     const MemoryRegionOps *ops;
> +     void *opaque;
> +@@ -757,6 +759,9 @@ struct MemoryRegion {
> +     unsigned ioeventfd_nb;
> +     MemoryRegionIoeventfd *ioeventfds;
> +     RamDiscardManager *rdm; /* Only for RAM */
> ++
> ++    /* For devices designed to perform re-entrant IO into their own IO =
MRs */
> ++    bool disable_reentrancy_guard;
> + };
> +
> + struct IOMMUMemoryRegion {
> +diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> +index 20d306659..14226f860 100644
> +--- a/include/hw/qdev-core.h
> ++++ b/include/hw/qdev-core.h
> +@@ -162,6 +162,10 @@ struct NamedClockList {
> +     QLIST_ENTRY(NamedClockList) node;
> + };
> +
> ++typedef struct {
> ++    bool engaged_in_io;
> ++} MemReentrancyGuard;
> ++
> + /**
> +  * DeviceState:
> +  * @realized: Indicates whether the device has been fully constructed.
> +@@ -193,6 +197,9 @@ struct DeviceState {
> +     int instance_id_alias;
> +     int alias_required_for_version;
> +     ResettableState reset;
> ++
> ++    /* Is the device currently in mmio/pio/dma? Used to prevent re-entr=
ancy */
> ++    MemReentrancyGuard mem_reentrancy_guard;
> + };
> +
> + struct DeviceListener {
> +diff --git a/softmmu/memory.c b/softmmu/memory.c
> +index 7340e19ff..102f0a424 100644
> +--- a/softmmu/memory.c
> ++++ b/softmmu/memory.c
> +@@ -541,6 +541,18 @@ static MemTxResult access_with_adjusted_size(hwaddr=
 addr,
> +         access_size_max =3D 4;
> +     }
> +
> ++    /* Do not allow more than one simultaneous access to a device's IO =
Regions */
> ++    if (mr->dev && !mr->disable_reentrancy_guard &&
> ++        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly=
) {
> ++        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
> ++            warn_report_once("Blocked re-entrant IO on MemoryRegion: "
> ++                             "%s at addr: 0x%" HWADDR_PRIX,
> ++                             memory_region_name(mr), addr);
> ++            return MEMTX_ACCESS_ERROR;
> ++        }
> ++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D true;
> ++    }
> ++
> +     /* FIXME: support unaligned access? */
> +     access_size =3D MAX(MIN(size, access_size_max), access_size_min);
> +     access_mask =3D MAKE_64BIT_MASK(0, access_size * 8);
> +@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr =
addr,
> +                         access_mask, attrs);
> +         }
> +     }
> ++    if (mr->dev) {
> ++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D false;
> ++    }
> +     return r;
> + }
> +
> +@@ -1169,6 +1184,7 @@ static void memory_region_do_init(MemoryRegion *mr=
,
> +     }
> +     mr->name =3D g_strdup(name);
> +     mr->owner =3D owner;
> ++    mr->dev =3D (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEV=
ICE);
> +     mr->ram_block =3D NULL;
> +
> +     if (name) {
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0002.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2023-3019-0002.patch
> new file mode 100644
> index 0000000000..130477bc34
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0002.patch
> @@ -0,0 +1,610 @@
> +From 7d0fefdf81f5973334c344f6b8e1896c309dff66 Mon Sep 17 00:00:00 2001
> +From: Akihiko Odaki <akihiko.odaki@daynix.com>
> +Date: Fri, 29 Mar 2024 07:53:12 +0000
> +Subject: [PATCH] net: Provide MemReentrancyGuard * to qemu_new_nic()
> +
> +Recently MemReentrancyGuard was added to DeviceState to record that the
> +device is engaging in I/O. The network device backend needs to update it
> +when delivering a packet to a device.
> +
> +In preparation for such a change, add MemReentrancyGuard * as a
> +parameter of qemu_new_nic().
> +
> +Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> +Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> +Signed-off-by: Jason Wang <jasowang@redhat.com>
> +
> +CVE: CVE-2023-3019
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/7d0fefdf8=
1f5973334c344f6b8e1896c309dff66]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + hw/arm/musicpal.c             | 3 ++-
> + hw/net/allwinner-sun8i-emac.c | 3 ++-
> + hw/net/allwinner_emac.c       | 3 ++-
> + hw/net/cadence_gem.c          | 3 ++-
> + hw/net/dp8393x.c              | 3 ++-
> + hw/net/e1000.c                | 5 +++--
> + hw/net/e1000e.c               | 2 +-
> + hw/net/eepro100.c             | 4 +++-
> + hw/net/etraxfs_eth.c          | 3 ++-
> + hw/net/fsl_etsec/etsec.c      | 3 ++-
> + hw/net/ftgmac100.c            | 3 ++-
> + hw/net/i82596.c               | 2 +-
> + hw/net/imx_fec.c              | 2 +-
> + hw/net/lan9118.c              | 3 ++-
> + hw/net/mcf_fec.c              | 3 ++-
> + hw/net/mipsnet.c              | 3 ++-
> + hw/net/msf2-emac.c            | 3 ++-
> + hw/net/ne2000-isa.c           | 3 ++-
> + hw/net/ne2000-pci.c           | 3 ++-
> + hw/net/npcm7xx_emc.c          | 3 ++-
> + hw/net/opencores_eth.c        | 3 ++-
> + hw/net/pcnet.c                | 3 ++-
> + hw/net/rocker/rocker_fp.c     | 4 ++--
> + hw/net/rtl8139.c              | 3 ++-
> + hw/net/smc91c111.c            | 3 ++-
> + hw/net/spapr_llan.c           | 3 ++-
> + hw/net/stellaris_enet.c       | 3 ++-
> + hw/net/sungem.c               | 2 +-
> + hw/net/sunhme.c               | 3 ++-
> + hw/net/tulip.c                | 3 ++-
> + hw/net/virtio-net.c           | 6 ++++--
> + hw/net/vmxnet3.c              | 2 +-
> + hw/net/xen_nic.c              | 3 ++-
> + hw/net/xgmac.c                | 3 ++-
> + hw/net/xilinx_axienet.c       | 3 ++-
> + hw/net/xilinx_ethlite.c       | 3 ++-
> + hw/usb/dev-network.c          | 3 ++-
> + include/net/net.h             | 1 +
> + net/net.c                     | 1 +
> + 39 files changed, 75 insertions(+), 40 deletions(-)
> +
> +diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> +index 2680ec55b..15fc7fee4 100644
> +--- a/hw/arm/musicpal.c
> ++++ b/hw/arm/musicpal.c
> +@@ -418,7 +418,8 @@ static void mv88w8618_eth_realize(DeviceState *dev, =
Error **errp)
> +
> +     address_space_init(&s->dma_as, s->dma_mr, "emac-dma");
> +     s->nic =3D qemu_new_nic(&net_mv88w8618_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> + }
> +
> + static const VMStateDescription mv88w8618_eth_vmsd =3D {
> +diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac=
.c
> +index ecc0245fe..cf93b2fda 100644
> +--- a/hw/net/allwinner-sun8i-emac.c
> ++++ b/hw/net/allwinner-sun8i-emac.c
> +@@ -816,7 +816,8 @@ static void allwinner_sun8i_emac_realize(DeviceState=
 *dev, Error **errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_allwinner_sun8i_emac_info, &s->conf,
> +-                           object_get_typename(OBJECT(dev)), dev->id, s=
);
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
> +index ddddf35c4..b3d73143b 100644
> +--- a/hw/net/allwinner_emac.c
> ++++ b/hw/net/allwinner_emac.c
> +@@ -453,7 +453,8 @@ static void aw_emac_realize(DeviceState *dev, Error =
**errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_aw_emac_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     fifo8_create(&s->rx_fifo, RX_FIFO_SIZE);
> +diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> +index 24b3a0ff6..cb61a7641 100644
> +--- a/hw/net/cadence_gem.c
> ++++ b/hw/net/cadence_gem.c
> +@@ -1633,7 +1633,8 @@ static void gem_realize(DeviceState *dev, Error **=
errp)
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +
> +     s->nic =3D qemu_new_nic(&net_gem_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +
> +     if (s->jumbo_max_len > MAX_FRAME_SIZE) {
> +         error_setg(errp, "jumbo-max-len is greater than %d",
> +diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> +index 45b954e46..abfcc6f69 100644
> +--- a/hw/net/dp8393x.c
> ++++ b/hw/net/dp8393x.c
> +@@ -943,7 +943,8 @@ static void dp8393x_realize(DeviceState *dev, Error =
**errp)
> +                           "dp8393x-regs", SONIC_REG_COUNT << s->it_shif=
t);
> +
> +     s->nic =3D qemu_new_nic(&net_dp83932_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     s->watchdog =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, dp8393x_watchdog, =
s);
> +diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> +index f5bc81296..0404e3c16 100644
> +--- a/hw/net/e1000.c
> ++++ b/hw/net/e1000.c
> +@@ -1733,8 +1733,9 @@ static void pci_e1000_realize(PCIDevice *pci_dev, =
Error **errp)
> +                                macaddr);
> +
> +     d->nic =3D qemu_new_nic(&net_e1000_info, &d->conf,
> +-                          object_get_typename(OBJECT(d)), dev->id, d);
> +-
> ++                          object_get_typename(OBJECT(d)), dev->id,
> ++                          &dev->mem_reentrancy_guard, d);
> ++
> +     qemu_format_nic_info_str(qemu_get_queue(d->nic), macaddr);
> +
> +     d->autoneg_timer =3D timer_new_ms(QEMU_CLOCK_VIRTUAL, e1000_autoneg=
_timer, d);
> +diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> +index ac96f7665..b6e9b0e17 100644
> +--- a/hw/net/e1000e.c
> ++++ b/hw/net/e1000e.c
> +@@ -328,7 +328,7 @@ e1000e_init_net_peer(E1000EState *s, PCIDevice *pci_=
dev, uint8_t *macaddr)
> +     int i;
> +
> +     s->nic =3D qemu_new_nic(&net_e1000e_info, &s->conf,
> +-        object_get_typename(OBJECT(s)), dev->id, s);
> ++        object_get_typename(OBJECT(s)), dev->id, &dev->mem_reentrancy_g=
uard, s);
> +
> +     s->core.max_queue_num =3D s->conf.peers.queues ? s->conf.peers.queu=
es - 1 : 0;
> +
> +diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> +index 679f52f80..871d9a095 100644
> +--- a/hw/net/eepro100.c
> ++++ b/hw/net/eepro100.c
> +@@ -1874,7 +1874,9 @@ static void e100_nic_realize(PCIDevice *pci_dev, E=
rror **errp)
> +     nic_reset(s);
> +
> +     s->nic =3D qemu_new_nic(&net_eepro100_info, &s->conf,
> +-                          object_get_typename(OBJECT(pci_dev)), pci_dev=
->qdev.id, s);
> ++                          object_get_typename(OBJECT(pci_dev)),
> ++                          pci_dev->qdev.id,
> ++                          &pci_dev->qdev.mem_reentrancy_guard, s);
> +
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +     TRACE(OTHER, logout("%s\n", qemu_get_queue(s->nic)->info_str));
> +diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
> +index 1b82aec79..ba57a978d 100644
> +--- a/hw/net/etraxfs_eth.c
> ++++ b/hw/net/etraxfs_eth.c
> +@@ -618,7 +618,8 @@ static void etraxfs_eth_realize(DeviceState *dev, Er=
ror **errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_etraxfs_info, &s->conf,
> +-                          object_get_typename(OBJECT(s)), dev->id, s);
> ++                          object_get_typename(OBJECT(s)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     s->phy.read =3D tdk_read;
> +diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> +index bd9d62b55..f790613b5 100644
> +--- a/hw/net/fsl_etsec/etsec.c
> ++++ b/hw/net/fsl_etsec/etsec.c
> +@@ -391,7 +391,8 @@ static void etsec_realize(DeviceState *dev, Error **=
errp)
> +     eTSEC        *etsec =3D ETSEC_COMMON(dev);
> +
> +     etsec->nic =3D qemu_new_nic(&net_etsec_info, &etsec->conf,
> +-                              object_get_typename(OBJECT(dev)), dev->id=
, etsec);
> ++                              object_get_typename(OBJECT(dev)), dev->id=
,
> ++                              &dev->mem_reentrancy_guard, etsec);
> +     qemu_format_nic_info_str(qemu_get_queue(etsec->nic), etsec->conf.ma=
caddr.a);
> +
> +     etsec->ptimer =3D ptimer_init(etsec_timer_hit, etsec, PTIMER_POLICY=
_DEFAULT);
> +diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> +index 83ef0a783..346485ab4 100644
> +--- a/hw/net/ftgmac100.c
> ++++ b/hw/net/ftgmac100.c
> +@@ -1118,7 +1118,8 @@ static void ftgmac100_realize(DeviceState *dev, Er=
ror **errp)
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +
> +     s->nic =3D qemu_new_nic(&net_ftgmac100_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/net/i82596.c b/hw/net/i82596.c
> +index ec21e2699..9edf0ec49 100644
> +--- a/hw/net/i82596.c
> ++++ b/hw/net/i82596.c
> +@@ -743,7 +743,7 @@ void i82596_common_init(DeviceState *dev, I82596Stat=
e *s, NetClientInfo *info)
> +         qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     }
> +     s->nic =3D qemu_new_nic(info, &s->conf, object_get_typename(OBJECT(=
dev)),
> +-                dev->id, s);
> ++        dev->id, &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     if (USE_TIMER) {
> +diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> +index 0db9aaf76..74e7e0d12 100644
> +--- a/hw/net/imx_fec.c
> ++++ b/hw/net/imx_fec.c
> +@@ -1318,7 +1318,7 @@ static void imx_eth_realize(DeviceState *dev, Erro=
r **errp)
> +
> +     s->nic =3D qemu_new_nic(&imx_eth_net_info, &s->conf,
> +                           object_get_typename(OBJECT(dev)),
> +-                          dev->id, s);
> ++                          dev->id, &dev->mem_reentrancy_guard, s);
> +
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> +index 6aff424cb..942bce9ae 100644
> +--- a/hw/net/lan9118.c
> ++++ b/hw/net/lan9118.c
> +@@ -1354,7 +1354,8 @@ static void lan9118_realize(DeviceState *dev, Erro=
r **errp)
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +
> +     s->nic =3D qemu_new_nic(&net_lan9118_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +     s->eeprom[0] =3D 0xa5;
> +     for (i =3D 0; i < 6; i++) {
> +diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
> +index 25e3e453a..a6be7bf41 100644
> +--- a/hw/net/mcf_fec.c
> ++++ b/hw/net/mcf_fec.c
> +@@ -643,7 +643,8 @@ static void mcf_fec_realize(DeviceState *dev, Error =
**errp)
> +     mcf_fec_state *s =3D MCF_FEC_NET(dev);
> +
> +     s->nic =3D qemu_new_nic(&net_mcf_fec_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
> +index 2ade72dea..8e925de86 100644
> +--- a/hw/net/mipsnet.c
> ++++ b/hw/net/mipsnet.c
> +@@ -255,7 +255,8 @@ static void mipsnet_realize(DeviceState *dev, Error =
**errp)
> +     sysbus_init_irq(sbd, &s->irq);
> +
> +     s->nic =3D qemu_new_nic(&net_mipsnet_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> +index 9278fdce0..1efa3dbf0 100644
> +--- a/hw/net/msf2-emac.c
> ++++ b/hw/net/msf2-emac.c
> +@@ -527,7 +527,8 @@ static void msf2_emac_realize(DeviceState *dev, Erro=
r **errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_msf2_emac_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
> +index dd6f6e34d..30bd20c29 100644
> +--- a/hw/net/ne2000-isa.c
> ++++ b/hw/net/ne2000-isa.c
> +@@ -74,7 +74,8 @@ static void isa_ne2000_realizefn(DeviceState *dev, Err=
or **errp)
> +     ne2000_reset(s);
> +
> +     s->nic =3D qemu_new_nic(&net_ne2000_isa_info, &s->c,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
> + }
> +
> +diff --git a/hw/net/ne2000-pci.c b/hw/net/ne2000-pci.c
> +index 9e5d10859..4f8a69908 100644
> +--- a/hw/net/ne2000-pci.c
> ++++ b/hw/net/ne2000-pci.c
> +@@ -71,7 +71,8 @@ static void pci_ne2000_realize(PCIDevice *pci_dev, Err=
or **errp)
> +
> +     s->nic =3D qemu_new_nic(&net_ne2000_info, &s->c,
> +                           object_get_typename(OBJECT(pci_dev)),
> +-                          pci_dev->qdev.id, s);
> ++                          pci_dev->qdev.id,
> ++                          &pci_dev->qdev.mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
> + }
> +
> +diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> +index df2efe1bf..82e063ae9 100644
> +--- a/hw/net/npcm7xx_emc.c
> ++++ b/hw/net/npcm7xx_emc.c
> +@@ -806,7 +806,8 @@ static void npcm7xx_emc_realize(DeviceState *dev, Er=
ror **errp)
> +
> +     qemu_macaddr_default_if_unset(&emc->conf.macaddr);
> +     emc->nic =3D qemu_new_nic(&net_npcm7xx_emc_info, &emc->conf,
> +-                            object_get_typename(OBJECT(dev)), dev->id, =
emc);
> ++                            object_get_typename(OBJECT(dev)), dev->id,
> ++                            &dev->mem_reentrancy_guard, emc);
> +     qemu_format_nic_info_str(qemu_get_queue(emc->nic), emc->conf.macadd=
r.a);
> + }
> +
> +diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
> +index 0b3dc3146..f96d6ea2c 100644
> +--- a/hw/net/opencores_eth.c
> ++++ b/hw/net/opencores_eth.c
> +@@ -732,7 +732,8 @@ static void sysbus_open_eth_realize(DeviceState *dev=
, Error **errp)
> +     sysbus_init_irq(sbd, &s->irq);
> +
> +     s->nic =3D qemu_new_nic(&net_open_eth_info, &s->conf,
> +-                          object_get_typename(OBJECT(s)), dev->id, s);
> ++                          object_get_typename(OBJECT(s)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> + }
> +
> + static void qdev_open_eth_reset(DeviceState *dev)
> +diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
> +index dcd3fc494..da910a70b 100644
> +--- a/hw/net/pcnet.c
> ++++ b/hw/net/pcnet.c
> +@@ -1718,7 +1718,8 @@ void pcnet_common_init(DeviceState *dev, PCNetStat=
e *s, NetClientInfo *info)
> +     s->poll_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, pcnet_poll_timer=
, s);
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +-    s->nic =3D qemu_new_nic(info, &s->conf, object_get_typename(OBJECT(=
dev)), dev->id, s);
> ++    s->nic =3D qemu_new_nic(info, &s->conf, object_get_typename(OBJECT(=
dev)),
> ++                          dev->id, &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     /* Initialize the PROM */
> +diff --git a/hw/net/rocker/rocker_fp.c b/hw/net/rocker/rocker_fp.c
> +index cbeed65bd..0d21948ad 100644
> +--- a/hw/net/rocker/rocker_fp.c
> ++++ b/hw/net/rocker/rocker_fp.c
> +@@ -241,8 +241,8 @@ FpPort *fp_port_alloc(Rocker *r, char *sw_name,
> +     port->conf.bootindex =3D -1;
> +     port->conf.peers =3D *peers;
> +
> +-    port->nic =3D qemu_new_nic(&fp_port_info, &port->conf,
> +-                             sw_name, NULL, port);
> ++    port->nic =3D qemu_new_nic(&fp_port_info, &port->conf, sw_name, NUL=
L,
> ++                             &DEVICE(r)->mem_reentrancy_guard, port);
> +     qemu_format_nic_info_str(qemu_get_queue(port->nic),
> +                              port->conf.macaddr.a);
> +
> +diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> +index 90b4fc63c..43d65d725 100644
> +--- a/hw/net/rtl8139.c
> ++++ b/hw/net/rtl8139.c
> +@@ -3398,7 +3398,8 @@ static void pci_rtl8139_realize(PCIDevice *dev, Er=
ror **errp)
> +     s->eeprom.contents[9] =3D s->conf.macaddr.a[4] | s->conf.macaddr.a[=
5] << 8;
> +
> +     s->nic =3D qemu_new_nic(&net_rtl8139_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), d->id, s);
> ++                          object_get_typename(OBJECT(dev)), d->id,
> ++                          &d->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     s->cplus_txbuffer =3D NULL;
> +diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> +index ad778cd8f..4eda971ef 100644
> +--- a/hw/net/smc91c111.c
> ++++ b/hw/net/smc91c111.c
> +@@ -783,7 +783,8 @@ static void smc91c111_realize(DeviceState *dev, Erro=
r **errp)
> +     sysbus_init_irq(sbd, &s->irq);
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_smc91c111_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +     /* ??? Save/restore.  */
> + }
> +diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
> +index a6876a936..475d5f3a3 100644
> +--- a/hw/net/spapr_llan.c
> ++++ b/hw/net/spapr_llan.c
> +@@ -325,7 +325,8 @@ static void spapr_vlan_realize(SpaprVioDevice *sdev,=
 Error **errp)
> +     memcpy(&dev->perm_mac.a, &dev->nicconf.macaddr.a, sizeof(dev->perm_=
mac.a));
> +
> +     dev->nic =3D qemu_new_nic(&net_spapr_vlan_info, &dev->nicconf,
> +-                            object_get_typename(OBJECT(sdev)), sdev->qd=
ev.id, dev);
> ++                            object_get_typename(OBJECT(sdev)), sdev->qd=
ev.id,
> ++                            &sdev->qdev.mem_reentrancy_guard, dev);
> +     qemu_format_nic_info_str(qemu_get_queue(dev->nic), dev->nicconf.mac=
addr.a);
> +
> +     dev->rxp_timer =3D timer_new_us(QEMU_CLOCK_VIRTUAL, spapr_vlan_flus=
h_rx_queue,
> +diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
> +index 8dd60783d..6768a6912 100644
> +--- a/hw/net/stellaris_enet.c
> ++++ b/hw/net/stellaris_enet.c
> +@@ -492,7 +492,8 @@ static void stellaris_enet_realize(DeviceState *dev,=
 Error **errp)
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +
> +     s->nic =3D qemu_new_nic(&net_stellaris_enet_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/net/sungem.c b/hw/net/sungem.c
> +index 3684a4d73..c12d44e9d 100644
> +--- a/hw/net/sungem.c
> ++++ b/hw/net/sungem.c
> +@@ -1361,7 +1361,7 @@ static void sungem_realize(PCIDevice *pci_dev, Err=
or **errp)
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_sungem_info, &s->conf,
> +                           object_get_typename(OBJECT(dev)),
> +-                          dev->id, s);
> ++                          dev->id, &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic),
> +                              s->conf.macaddr.a);
> + }
> +diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
> +index fc34905f8..fa98528d7 100644
> +--- a/hw/net/sunhme.c
> ++++ b/hw/net/sunhme.c
> +@@ -892,7 +892,8 @@ static void sunhme_realize(PCIDevice *pci_dev, Error=
 **errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_sunhme_info, &s->conf,
> +-                          object_get_typename(OBJECT(d)), d->id, s);
> ++                          object_get_typename(OBJECT(d)), d->id,
> ++                          &d->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> +index 5f8badefc..ccaa26fd8 100644
> +--- a/hw/net/tulip.c
> ++++ b/hw/net/tulip.c
> +@@ -985,7 +985,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Er=
ror **errp)
> +
> +     s->nic =3D qemu_new_nic(&net_tulip_info, &s->c,
> +                           object_get_typename(OBJECT(pci_dev)),
> +-                          pci_dev->qdev.id, s);
> ++                          pci_dev->qdev.id,
> ++                          &pci_dev->qdev.mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
> + }
> +
> +diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> +index 42e66697f..f916813bc 100644
> +--- a/hw/net/virtio-net.c
> ++++ b/hw/net/virtio-net.c
> +@@ -3473,10 +3473,12 @@ static void virtio_net_device_realize(DeviceStat=
e *dev, Error **errp)
> +          * Happen when virtio_net_set_netclient_name has been called.
> +          */
> +         n->nic =3D qemu_new_nic(&net_virtio_info, &n->nic_conf,
> +-                              n->netclient_type, n->netclient_name, n);
> ++                              n->netclient_type, n->netclient_name,
> ++                              &dev->mem_reentrancy_guard, n);
> +     } else {
> +         n->nic =3D qemu_new_nic(&net_virtio_info, &n->nic_conf,
> +-                              object_get_typename(OBJECT(dev)), dev->id=
, n);
> ++                              object_get_typename(OBJECT(dev)), dev->id=
,
> ++                              &dev->mem_reentrancy_guard, n);
> +     }
> +
> +     for (i =3D 0; i < n->max_queue_pairs; i++) {
> +diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> +index f65af4e9e..d4df039c5 100644
> +--- a/hw/net/vmxnet3.c
> ++++ b/hw/net/vmxnet3.c
> +@@ -2078,7 +2078,7 @@ static void vmxnet3_net_init(VMXNET3State *s)
> +
> +     s->nic =3D qemu_new_nic(&net_vmxnet3_info, &s->conf,
> +                           object_get_typename(OBJECT(s)),
> +-                          d->id, s);
> ++                          d->id, &d->mem_reentrancy_guard, s);
> +
> +     s->peer_has_vhdr =3D vmxnet3_peer_has_vnet_hdr(s);
> +     s->tx_sop =3D true;
> +diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
> +index 5c815b4f0..3d0b7820d 100644
> +--- a/hw/net/xen_nic.c
> ++++ b/hw/net/xen_nic.c
> +@@ -294,7 +294,8 @@ static int net_init(struct XenLegacyDevice *xendev)
> +     }
> +
> +     netdev->nic =3D qemu_new_nic(&net_xen_info, &netdev->conf,
> +-                               "xen", NULL, netdev);
> ++                               "xen", NULL,
> ++                               &xendev->qdev.mem_reentrancy_guard, netd=
ev);
> +
> +     snprintf(qemu_get_queue(netdev->nic)->info_str,
> +              sizeof(qemu_get_queue(netdev->nic)->info_str),
> +diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
> +index 0ab6ae91a..1f4f277d8 100644
> +--- a/hw/net/xgmac.c
> ++++ b/hw/net/xgmac.c
> +@@ -402,7 +402,8 @@ static void xgmac_enet_realize(DeviceState *dev, Err=
or **errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_xgmac_enet_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     s->regs[XGMAC_ADDR_HIGH(0)] =3D (s->conf.macaddr.a[5] << 8) |
> +diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> +index 990ff3a1c..8a3424380 100644
> +--- a/hw/net/xilinx_axienet.c
> ++++ b/hw/net/xilinx_axienet.c
> +@@ -968,7 +968,8 @@ static void xilinx_enet_realize(DeviceState *dev, Er=
ror **errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_xilinx_enet_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +
> +     tdk_init(&s->TEMAC.phy);
> +diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> +index 6e09f7e42..80cb869e2 100644
> +--- a/hw/net/xilinx_ethlite.c
> ++++ b/hw/net/xilinx_ethlite.c
> +@@ -235,7 +235,8 @@ static void xilinx_ethlite_realize(DeviceState *dev,=
 Error **errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
> +-                          object_get_typename(OBJECT(dev)), dev->id, s)=
;
> ++                          object_get_typename(OBJECT(dev)), dev->id,
> ++                          &dev->mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> + }
> +
> +diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
> +index 6c49c1601..ae447a8bc 100644
> +--- a/hw/usb/dev-network.c
> ++++ b/hw/usb/dev-network.c
> +@@ -1362,7 +1362,8 @@ static void usb_net_realize(USBDevice *dev, Error =
**errp)
> +
> +     qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +     s->nic =3D qemu_new_nic(&net_usbnet_info, &s->conf,
> +-                          object_get_typename(OBJECT(s)), s->dev.qdev.i=
d, s);
> ++                          object_get_typename(OBJECT(s)), s->dev.qdev.i=
d,
> ++                          &s->dev.qdev.mem_reentrancy_guard, s);
> +     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a)=
;
> +     snprintf(s->usbstring_mac, sizeof(s->usbstring_mac),
> +              "%02x%02x%02x%02x%02x%02x",
> +diff --git a/include/net/net.h b/include/net/net.h
> +index 523136c7a..1457b6c01 100644
> +--- a/include/net/net.h
> ++++ b/include/net/net.h
> +@@ -145,6 +145,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
> +                        NICConf *conf,
> +                        const char *model,
> +                        const char *name,
> ++                       MemReentrancyGuard *reentrancy_guard,
> +                        void *opaque);
> + void qemu_del_nic(NICState *nic);
> + NetClientState *qemu_get_subqueue(NICState *nic, int queue_index);
> +diff --git a/net/net.c b/net/net.c
> +index f0d14dbfc..669e194c4 100644
> +--- a/net/net.c
> ++++ b/net/net.c
> +@@ -299,6 +299,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
> +                        NICConf *conf,
> +                        const char *model,
> +                        const char *name,
> ++                       MemReentrancyGuard *reentrancy_guard,
> +                        void *opaque)
> + {
> +     NetClientState **peers =3D conf->peers.ncs;
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0003.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2023-3019-0003.patch
> new file mode 100644
> index 0000000000..861d300bda
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0003.patch
> @@ -0,0 +1,88 @@
> +From 9050f976e447444ea6ee2ba12c9f77e4b0dc54bc Mon Sep 17 00:00:00 2001
> +From: Akihiko Odaki <akihiko.odaki@daynix.com>
> +Date: Thu, 28 Mar 2024 08:28:31 +0000
> +Subject: [PATCH] net: Update MemReentrancyGuard for NIC Recently
> + MemReentrancyGuard was added to DeviceState to record that the device i=
s
> + engaging in I/O. The network device backend needs to update it when
> + delivering a packet to a device.
> +
> +This implementation follows what bottom half does, but it does not add
> +a tracepoint for the case that the network device backend started
> +delivering a packet to a device which is already engaging in I/O. This
> +is because such reentrancy frequently happens for
> +qemu_flush_queued_packets() and is insignificant.
> +
> +Fixes: CVE-2023-3019
> +Reported-by: Alexander Bulekov <alxndr@bu.edu>
> +Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> +Acked-by: Alexander Bulekov <alxndr@bu.edu>
> +Signed-off-by: Jason Wang <jasowang@redhat.com>
> +
> +CVE: CVE-2023-3019
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/9050f976e=
447444ea6ee2ba12c9f77e4b0dc54bck]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + include/net/net.h |  1 +
> + net/net.c         | 14 ++++++++++++++
> + 2 files changed, 15 insertions(+)
> +
> +diff --git a/include/net/net.h b/include/net/net.h
> +index 3854f6381..df102d2c8 100644
> +--- a/include/net/net.h
> ++++ b/include/net/net.h
> +@@ -112,6 +112,7 @@ struct NetClientState {
> + typedef struct NICState {
> +     NetClientState *ncs;
> +     NICConf *conf;
> ++    MemReentrancyGuard *reentrancy_guard;
> +     void *opaque;
> +     bool peer_deleted;
> + } NICState;
> +diff --git a/net/net.c b/net/net.c
> +index 58addd110..f0491b258 100644
> +--- a/net/net.c
> ++++ b/net/net.c
> +@@ -312,6 +312,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
> +     nic =3D g_malloc0(info->size + sizeof(NetClientState) * queues);
> +     nic->ncs =3D (void *)nic + info->size;
> +     nic->conf =3D conf;
> ++    nic->reentrancy_guard =3D reentrancy_guard,
> +     nic->opaque =3D opaque;
> +
> +     for (i =3D 0; i < queues; i++) {
> +@@ -767,6 +768,7 @@ static ssize_t qemu_deliver_packet_iov(NetClientStat=
e *sender,
> +                                        int iovcnt,
> +                                        void *opaque)
> + {
> ++    MemReentrancyGuard *owned_reentrancy_guard;
> +     NetClientState *nc =3D opaque;
> +     int ret;
> +
> +@@ -779,12 +781,24 @@ static ssize_t qemu_deliver_packet_iov(NetClientSt=
ate *sender,
> +         return 0;
> +     }
> +
> ++    if (nc->info->type !=3D NET_CLIENT_DRIVER_NIC ||
> ++        qemu_get_nic(nc)->reentrancy_guard->engaged_in_io) {
> ++        owned_reentrancy_guard =3D NULL;
> ++    } else {
> ++        owned_reentrancy_guard =3D qemu_get_nic(nc)->reentrancy_guard;
> ++        owned_reentrancy_guard->engaged_in_io =3D true;
> ++    }
> ++
> +     if (nc->info->receive_iov && !(flags & QEMU_NET_PACKET_FLAG_RAW)) {
> +         ret =3D nc->info->receive_iov(nc, iov, iovcnt);
> +     } else {
> +         ret =3D nc_sendv_compat(nc, iov, iovcnt, flags);
> +     }
> +
> ++    if (owned_reentrancy_guard) {
> ++        owned_reentrancy_guard->engaged_in_io =3D false;
> ++    }
> ++
> +     if (ret =3D=3D 0) {
> +         nc->receive_disabled =3D 1;
> +     }
> +--
> +2.40.0
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197627): https://lists.openembedded.org/g/openembedde=
d-core/message/197627
> Mute This Topic: https://lists.openembedded.org/mt/105213613/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

