Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22468EED60E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:26:36 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.23233.1694791592305563072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a1ijPfnr;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.169, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b703a0453fso37827141fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791590; x=1695396390; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/4f8Ze2fGaD/KmoiWaEnbl/4q/mg9s5om/J2IW5NEQ=;
        b=a1ijPfnrk++xlSpK2WKf8n9j8jJ/66BnyRrmtAa3MlyY8h22a15koz427oLQvmzZQm
         D7GffQxOUTYi4a5rtkIlw4MXm4uhv8UmxUmByynp7UdK5R7lIUdzDph8TBkDb34fmhIb
         kFR1FETL4lGPbpJqRgO+4ANB8MhNNGgkw9idCgl3htkZAvnJLGzTri3zzEFDbdi9J+t6
         JihECvDq8qRU58S2slNU5DnRyFZ3an1CkK7Y6GG4J+DH+oEMz/YU584joFPpox5F6fjr
         JXxrJKTZk8UvMYgkrXGn/SsTL3EoLLia2zA37VVI1K86/g9BiJmrSn9vRfw3dRbHht67
         bVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791590; x=1695396390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/4f8Ze2fGaD/KmoiWaEnbl/4q/mg9s5om/J2IW5NEQ=;
        b=Yxuy4JhYr4H/aNI7sCAInxk0hRvO2PkHT5bqDSGjH44tEm/jinflGQSkPRAxNcojcc
         DWXPe57tMRJl70u1ZXSwOfFXJy55lUwg07pMM9nbIrykzrYNxOW0OGNEioo+yGvhN5oH
         9As3wK9+GLqi0cmLQOcvBnbxhkNDKf/ljwLT8LMHZJ954DDALVxmfZdR6WGJoOA5JIav
         mY/cUN4izPzkQuzeguw75wSs3Gl7mBNGVNHKSYLw6Vz15ByA4or2d6vONmNs2KhjLglU
         c0aJVvC19qjeKbCV/PtPQJi0fZQJswsWAM+2TYakMJ6p23g8RkpxDkUCfrh9mA/+2ikm
         +XBg==
X-Gm-Message-State: AOJu0YwqRS3DFjJRjKIMGwtGpUvTesD9Uksan0Rd9j7+qZJXd9q1Clrm
	rjEYko1OYeWGm34TifCVvr9UWYHjBTfs8JRClKcfcqBY8cHcOeYD
X-Google-Smtp-Source: AGHT+IEw0nDMjzl3mVbsnlVN9fjmGfC5Y9IQJJAS5L89/Y7WR4fL9587esGDQVdJ1TeOWghO/+sMIfqqkt4L944JI1U=
X-Received: by 2002:a2e:88cb:0:b0:2bc:d33e:ccc5 with SMTP id
 a11-20020a2e88cb000000b002bcd33eccc5mr1865781ljk.41.1694791590366; Fri, 15
 Sep 2023 08:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230913080229.196711-1-yogita.urade@windriver.com>
 <20230913080229.196711-2-yogita.urade@windriver.com> <17847C8738CE261C.14053@lists.openembedded.org>
In-Reply-To: <17847C8738CE261C.14053@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 15 Sep 2023 05:26:19 -1000
Message-ID: <CAOSpxdabLMW-o5Og79e+LyB+7utmxwwNiypzY=imA3fuQZpXrg@mail.gmail.com>
Subject: Re: [OE-core][mickledore][PATCH 2/2] qemu: fix CVE-2023-0330
To: steve@sakoman.com
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187677

On Wed, Sep 13, 2023 at 4:44=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Unfortunately this change breaks the qemux86 and qemux86-64 tests on
> the autobuilder:

The versions of this patch for both mickledore and kirkstone break
qemux86 and qemux86-64 in the same way, so I can't take the patch for
either branch.

Steve

>
> https://errors.yoctoproject.org/Errors/Details/736394/
> https://errors.yoctoproject.org/Errors/Details/736395/
>
> In both cases:
>
> Failed: qemux86-64 does not shutdown within timeout(120)
>
> There was recently an issue fixed in the master branch where x86 was
> broken after a version upgrade:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D3d3fa94ee6d7e=
a58e3ec64d28bd6414437806cfd
>
> Not sure if it is related, since the commit message indicates "won't
> boot" as the symptom and this appears to be a shutdown issue. Perhaps
> Richard can comment.
>
> Steve
>
> On Tue, Sep 12, 2023 at 10:02=E2=80=AFPM Urade, Yogita via
> lists.openembedded.org
> <Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Yogita Urade <yogita.urade@windriver.com>
> >
> > A DMA-MMIO reentrancy problem may lead to memory corruption bugs
> > like stack overflow or use-after-free.
> >
> > Summary of the problem from Peter Maydell:
> > https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae=
5KcknhPRD5fPBZA@mail.gmail.com
> >
> > Reference:
> > https://gitlab.com/qemu-project/qemu/-/issues/556
> >
> > qemu.git$ git log --no-merges --oneline   --grep CVE-2023-0330
> > b987718bbb hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI control=
ler (CVE-2023-0330)
> > a2e1753b80 memory: prevent dma-reentracy issues
> >
> > Included second commit as well as commit log of a2e1753b80 says it
> > resolves CVE-2023-0330
> >
> > Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |   3 +-
> >  ...23-0330.patch =3D> CVE-2023-0330-0001.patch} |   0
> >  .../qemu/qemu/CVE-2023-0330-0002.patch        | 136 ++++++++++++++++++
> >  3 files changed, 138 insertions(+), 1 deletion(-)
> >  rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch =3D> CVE-2=
023-0330-0001.patch} (100%)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.=
patch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index 2efe63cdc0..1a50e4d524 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -36,7 +36,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
> >             file://qemu-guest-agent.init \
> >             file://qemu-guest-agent.udev \
> >             file://ppc.patch \
> > -          file://CVE-2023-0330.patch \
> > +          file://CVE-2023-0330-0001.patch \
> > +          file://CVE-2023-0330-0002.patch \
> >            file://CVE-2023-3301.patch \
> >            file://CVE-2023-3255.patch \
> >            file://CVE-2023-2861.patch \
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
> > similarity index 100%
> > rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
> > rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch b=
/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> > new file mode 100644
> > index 0000000000..a21b01bd25
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> > @@ -0,0 +1,136 @@
> > +From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
> > +From: Alexander Bulekov <alxndr@bu.edu>
> > +Date: Tue, 12 Sep 2023 10:49:46 +0000
> > +Subject: [PATCH] memory: prevent dma-reentracy issues
> > +
> > +Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DM=
A.
> > +This flag is set/checked prior to calling a device's MemoryRegion
> > +handlers, and set when device code initiates DMA.  The purpose of this
> > +flag is to prevent two types of DMA-based reentrancy issues:
> > +
> > +1.) mmio -> dma -> mmio case
> > +2.) bh -> dma write -> mmio case
> > +
> > +These issues have led to problems such as stack-exhaustion and
> > +use-after-frees.
> > +
> > +Summary of the problem from Peter Maydell:
> > +https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWa=
e5KcknhPRD5fPBZA@mail.gmail.com
> > +
> > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> > +Resolves: CVE-2023-0330
> > +
> > +Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > +Reviewed-by: Thomas Huth <thuth@redhat.com>
> > +Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
> > +[thuth: Replace warn_report() with warn_report_once()]
> > +Signed-off-by: Thomas Huth <thuth@redhat.com>
> > +
> > +CVE: CVE-2023-0330
> > +
> > +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/comm=
it/a2e1753b8054344f32cf94f31c6399a58794a380]
> > +
> > +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > +---
> > + include/exec/memory.h  |  5 +++++
> > + include/hw/qdev-core.h |  7 +++++++
> > + softmmu/memory.c       | 16 ++++++++++++++++
> > + 3 files changed, 28 insertions(+)
> > +
> > +diff --git a/include/exec/memory.h b/include/exec/memory.h
> > +index 91f8a2395..124628ada 100644
> > +--- a/include/exec/memory.h
> > ++++ b/include/exec/memory.h
> > +@@ -741,6 +741,8 @@ struct MemoryRegion {
> > +     bool is_iommu;
> > +     RAMBlock *ram_block;
> > +     Object *owner;
> > ++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access=
 hotpath */
> > ++    DeviceState *dev;
> > +
> > +     const MemoryRegionOps *ops;
> > +     void *opaque;
> > +@@ -765,6 +767,9 @@ struct MemoryRegion {
> > +     unsigned ioeventfd_nb;
> > +     MemoryRegionIoeventfd *ioeventfds;
> > +     RamDiscardManager *rdm; /* Only for RAM */
> > ++
> > ++    /* For devices designed to perform re-entrant IO into their own I=
O MRs */
> > ++    bool disable_reentrancy_guard;
> > + };
> > +
> > + struct IOMMUMemoryRegion {
> > +diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > +index 785dd5a56..886f6bb79 100644
> > +--- a/include/hw/qdev-core.h
> > ++++ b/include/hw/qdev-core.h
> > +@@ -162,6 +162,10 @@ struct NamedClockList {
> > +     QLIST_ENTRY(NamedClockList) node;
> > + };
> > +
> > ++typedef struct {
> > ++    bool engaged_in_io;
> > ++} MemReentrancyGuard;
> > ++
> > + /**
> > +  * DeviceState:
> > +  * @realized: Indicates whether the device has been fully constructed=
.
> > +@@ -194,6 +198,9 @@ struct DeviceState {
> > +     int alias_required_for_version;
> > +     ResettableState reset;
> > +     GSList *unplug_blockers;
> > ++
> > ++    /* Is the device currently in mmio/pio/dma? Used to prevent re-en=
trancy */
> > ++    MemReentrancyGuard mem_reentrancy_guard;
> > + };
> > +
> > + struct DeviceListener {
> > +diff --git a/softmmu/memory.c b/softmmu/memory.c
> > +index bc0be3f62..0ad556b5b 100644
> > +--- a/softmmu/memory.c
> > ++++ b/softmmu/memory.c
> > +@@ -541,6 +541,18 @@ static MemTxResult access_with_adjusted_size(hwad=
dr addr,
> > +     if (!access_size_max) {
> > +         access_size_max =3D 4;
> > +     }
> > ++
> > ++    /* Do not allow more than one simultaneous access to a device's I=
O Regions */
> > ++    if (mr->dev && !mr->disable_reentrancy_guard &&
> > ++        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readon=
ly) {
> > ++        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
> > ++            warn_report_once("Blocked re-entrant IO on MemoryRegion: =
"
> > ++                             "%s at addr: 0x%" HWADDR_PRIX,
> > ++                             memory_region_name(mr), addr);
> > ++            return MEMTX_ACCESS_ERROR;
> > ++        }
> > ++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D true;
> > ++    }
> > +
> > +     /* FIXME: support unaligned access? */
> > +     access_size =3D MAX(MIN(size, access_size_max), access_size_min);
> > +@@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size(hwadd=
r addr,
> > +                         access_mask, attrs);
> > +         }
> > +     }
> > ++    if (mr->dev) {
> > ++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D false;
> > ++    }
> > +     return r;
> > + }
> > +
> > +@@ -1170,6 +1185,7 @@ static void memory_region_do_init(MemoryRegion *=
mr,
> > +     }
> > +     mr->name =3D g_strdup(name);
> > +     mr->owner =3D owner;
> > ++    mr->dev =3D (DeviceState *) object_dynamic_cast(mr->owner, TYPE_D=
EVICE);
> > +     mr->ram_block =3D NULL;
> > +
> > +     if (name) {
> > +--
> > +2.35.5
> > --
> > 2.40.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187605): https://lists.openembedded.org/g/openembedde=
d-core/message/187605
> Mute This Topic: https://lists.openembedded.org/mt/101332759/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

