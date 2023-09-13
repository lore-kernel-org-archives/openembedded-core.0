Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442AAEDEC70
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:44:49 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.399.1694616279822507820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gOVu0NQM;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.181, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7f1bc4ece3so6023060276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694616279; x=1695221079; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlniY3yzD4949aCem2etJnvqQeKoFiw3HCRC0mYuD/o=;
        b=gOVu0NQMJoFwZ+2jCptZbJMn7aTDaO0IeFmHLrUv4uBJE55j/6K4ozbEP2mT0+it+/
         dltDFJthrxcyVB1T722rwC+LOU+jJo9rZ69To09FQIgW8AJ+QfDP7Pav84GblBm1FO0L
         r/f+OaK5kQ67m6yxj+51JJ/VSpI2XqVuXAD8YpYAHHtzRR+mE2ePasQljII43zCYEPgu
         x+4cbEb5xKgUp6e2ObwcwuIICqO2uxpbYhqdc9hR7ZgNcwM2pUm3bdxdvmL3dUNfBK5z
         0nGy4wXe8dyaIiu/o9oxyYml4QOD0gE0Jcp/4PnGUd8G/I0ijHgwUswdQcHRtpGML+1D
         RgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694616279; x=1695221079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlniY3yzD4949aCem2etJnvqQeKoFiw3HCRC0mYuD/o=;
        b=Em2xA7zqIEMoVVre4DBsI6RO+3xjb/+ojnE16NnZ3zajLGwfwf5/Xvug3o/DhDRGyf
         fJNEUwXXJpBes9Y0jbLpI91s3RufwTyom8j7evNiZMODTaqwUe3KOD69nWHFrg2g4Xmt
         gEWxSCcZdNGl8gR5tuLDlxZI2NGOM3zXQJ7p0EfPQe611l+7HkIVROatlXYAgUpknvC2
         01Sg7pmuLhgAI1lSx6lGU7xyMbfCed6rKL/drWtrK6beEz8dzLp86vIKFAlk5otkNAY6
         O5gQxzNnBWa8aU7zntAN2dXg4cj7XsSLx0vGLQcDKSqUGwdnvl/bTj9Et8NrjzS0/DWn
         ajig==
X-Gm-Message-State: AOJu0YyJOKW63giv5rGHlp3wxO13BCDg9sROjLKkngStqBcb6/s/fO1T
	2FdaJNEofroUrhyn4De+GQUu6bEpOLATs68Gwmp+K1k0o88wdL1oORA=
X-Google-Smtp-Source: AGHT+IHHlSoeJplaIoSrWKeM5q+Io6zWVd2qZwxaOojEssTWO5CUVvXdAWq1L/A6vcAHKbrNA7/nUdPw1+aLHpgXLzs=
X-Received: by 2002:a25:54b:0:b0:d50:60a4:a1b6 with SMTP id
 72-20020a25054b000000b00d5060a4a1b6mr2301287ybf.63.1694616277453; Wed, 13 Sep
 2023 07:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230913080229.196711-1-yogita.urade@windriver.com> <20230913080229.196711-2-yogita.urade@windriver.com>
In-Reply-To: <20230913080229.196711-2-yogita.urade@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Sep 2023 04:44:25 -1000
Message-ID: <CAOSpxdbkRWQLSBU_DFCQM=_6y0qAOXbvySjKKH_d6n-c50Mixg@mail.gmail.com>
Subject: Re: [OE-core][mickledore][PATCH 2/2] qemu: fix CVE-2023-0330
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187605

Unfortunately this change breaks the qemux86 and qemux86-64 tests on
the autobuilder:

https://errors.yoctoproject.org/Errors/Details/736394/
https://errors.yoctoproject.org/Errors/Details/736395/

In both cases:

Failed: qemux86-64 does not shutdown within timeout(120)

There was recently an issue fixed in the master branch where x86 was
broken after a version upgrade:

https://git.openembedded.org/openembedded-core/commit/?id=3D3d3fa94ee6d7ea5=
8e3ec64d28bd6414437806cfd

Not sure if it is related, since the commit message indicates "won't
boot" as the symptom and this appears to be a shutdown issue. Perhaps
Richard can comment.

Steve

On Tue, Sep 12, 2023 at 10:02=E2=80=AFPM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> A DMA-MMIO reentrancy problem may lead to memory corruption bugs
> like stack overflow or use-after-free.
>
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5K=
cknhPRD5fPBZA@mail.gmail.com
>
> Reference:
> https://gitlab.com/qemu-project/qemu/-/issues/556
>
> qemu.git$ git log --no-merges --oneline   --grep CVE-2023-0330
> b987718bbb hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI controlle=
r (CVE-2023-0330)
> a2e1753b80 memory: prevent dma-reentracy issues
>
> Included second commit as well as commit log of a2e1753b80 says it
> resolves CVE-2023-0330
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   3 +-
>  ...23-0330.patch =3D> CVE-2023-0330-0001.patch} |   0
>  .../qemu/qemu/CVE-2023-0330-0002.patch        | 136 ++++++++++++++++++
>  3 files changed, 138 insertions(+), 1 deletion(-)
>  rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch =3D> CVE-202=
3-0330-0001.patch} (100%)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.pa=
tch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 2efe63cdc0..1a50e4d524 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -36,7 +36,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://qemu-guest-agent.init \
>             file://qemu-guest-agent.udev \
>             file://ppc.patch \
> -          file://CVE-2023-0330.patch \
> +          file://CVE-2023-0330-0001.patch \
> +          file://CVE-2023-0330-0002.patch \
>            file://CVE-2023-3301.patch \
>            file://CVE-2023-3255.patch \
>            file://CVE-2023-2861.patch \
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
> rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> new file mode 100644
> index 0000000000..a21b01bd25
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> @@ -0,0 +1,136 @@
> +From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
> +From: Alexander Bulekov <alxndr@bu.edu>
> +Date: Tue, 12 Sep 2023 10:49:46 +0000
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
> +CVE: CVE-2023-0330
> +
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/a2e1753b8054344f32cf94f31c6399a58794a380]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + include/exec/memory.h  |  5 +++++
> + include/hw/qdev-core.h |  7 +++++++
> + softmmu/memory.c       | 16 ++++++++++++++++
> + 3 files changed, 28 insertions(+)
> +
> +diff --git a/include/exec/memory.h b/include/exec/memory.h
> +index 91f8a2395..124628ada 100644
> +--- a/include/exec/memory.h
> ++++ b/include/exec/memory.h
> +@@ -741,6 +741,8 @@ struct MemoryRegion {
> +     bool is_iommu;
> +     RAMBlock *ram_block;
> +     Object *owner;
> ++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access h=
otpath */
> ++    DeviceState *dev;
> +
> +     const MemoryRegionOps *ops;
> +     void *opaque;
> +@@ -765,6 +767,9 @@ struct MemoryRegion {
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
> +index 785dd5a56..886f6bb79 100644
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
> +@@ -194,6 +198,9 @@ struct DeviceState {
> +     int alias_required_for_version;
> +     ResettableState reset;
> +     GSList *unplug_blockers;
> ++
> ++    /* Is the device currently in mmio/pio/dma? Used to prevent re-entr=
ancy */
> ++    MemReentrancyGuard mem_reentrancy_guard;
> + };
> +
> + struct DeviceListener {
> +diff --git a/softmmu/memory.c b/softmmu/memory.c
> +index bc0be3f62..0ad556b5b 100644
> +--- a/softmmu/memory.c
> ++++ b/softmmu/memory.c
> +@@ -541,6 +541,18 @@ static MemTxResult access_with_adjusted_size(hwaddr=
 addr,
> +     if (!access_size_max) {
> +         access_size_max =3D 4;
> +     }
> ++
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
> +
> +     /* FIXME: support unaligned access? */
> +     access_size =3D MAX(MIN(size, access_size_max), access_size_min);
> +@@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size(hwaddr =
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
> +@@ -1170,6 +1185,7 @@ static void memory_region_do_init(MemoryRegion *mr=
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
> +2.35.5
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187553): https://lists.openembedded.org/g/openembedde=
d-core/message/187553
> Mute This Topic: https://lists.openembedded.org/mt/101332759/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

