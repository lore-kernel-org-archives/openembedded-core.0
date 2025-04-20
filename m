Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C124AC369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 21:51:32 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.4397.1745185892312454291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 14:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Isb+IhwH;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af52a624283so2856640a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 14:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745185892; x=1745790692; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=39fnHAwYJ0d+rlkhg9VNz72KxDrySBLZYq9kpXYmSsQ=;
        b=Isb+IhwH2BuOatNv015+Aa/2Utfa9Be9t2YyJ6XS3qzHjzs/NqjQpVmcBy3Pg6GQoS
         mt2NFtrsBGcg/Igrs7NxhUAkxhbcxmebqHE3ahu07tjC/pv8/PA4L1FAcKJBQRKVqFzI
         3Noj7WuHpGbGnXkhcB/XsPDPpdH+kraBLIo/JhCB01lt+/uhX6q590j9yNhlJFwCCDwN
         e9QK8hU4TXOCeiv4KouOMdjr1uHyHPvZXpkhc+5bZyedIXivVUy2zYjIcvMZuJQ+Z6BX
         LK2f4S6bQWa8C+30s0PrwXDZonhSAZ/c9CrNSSXiC2bFf0ugbQccrSYpg5DDfuC9sFfg
         X5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745185892; x=1745790692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39fnHAwYJ0d+rlkhg9VNz72KxDrySBLZYq9kpXYmSsQ=;
        b=sECI5DdCwlvl1S9s80tdviwltiR0BdwWWwAv9wPXCCXs5J3tu2hxSqw1fK6UJr4Z7W
         pnhoYPmQEpPeRs8CdVMAnmMYpaa/EwVFaAFg2TQ5KWKNrz7TI61UjJopbs9HoX3mcRET
         XGCQY8aNkCr7kMXnRAvtixxhTvQJu5xuwj8UGyuBGAuQ5k6a3soCfrGiHjFY/rbmoctf
         64N5bCfcuQNAhQ9RNJShzifgjUW1HCP2tCv57qvRO3ULyxJ5WFCFyv0EifLGomLM1WzC
         OsjDSoN+hXI5X9miG+FverKA12FZBTTvK+V6Sr+T4na5sAGPB71BTphX1v6iG8+XiZsu
         kBQg==
X-Gm-Message-State: AOJu0YziIpjCYtWijz7SxZaHBSulCWu+sIDVEGyaH61fDqvtUwWcIgGg
	dyOHRybnG1iXDmcjU4mjCg8HXDG8hevqymgZlTVkmZAET6nPXXewnNn+Dp9KFjTmF9Xy741zu6i
	Ex9T4QZ9Sf2NKBC9a9mTrbjuh4Ec=
X-Gm-Gg: ASbGncsThnHiFkVG5yo8UgGpNPWSY7PFakuxlpfcURj8/Ymiws+qg7J5PTCzNyiXblb
	d5BhzQiS2nkjrMR/dwO4nQ2/m3JQWlHyF8VmNsNqYXQLbSDAuridEtLAb/AGo4xnogUMhNNfu86
	gKlj7RUQqZd8cKfiRHvNLB+JgWd7XqGUs8
X-Google-Smtp-Source: AGHT+IGs9VKnJo5oq9NHIQ2Yd9nafL9jQ9DFH5hutDx0MVVrSum7iM2nQoaloE3uyBY8FjpL7zJXY1aBI3FaxORxu1I=
X-Received: by 2002:a17:90b:3d47:b0:2f9:d0cd:3403 with SMTP id
 98e67ed59e1d1-3087c37c06emr12737574a91.16.1745185891490; Sun, 20 Apr 2025
 14:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250418195446.1914594-1-bruce.ashfield@gmail.com> <0da9657f7a33ece23b31415e225e099964fef5b2.camel@linuxfoundation.org>
In-Reply-To: <0da9657f7a33ece23b31415e225e099964fef5b2.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 20 Apr 2025 17:51:20 -0400
X-Gm-Features: ATxdqUHmtziwCTwkGCOuEuhLh_Z9qdsp1NPY1OOqc5mofUSBnjFObabaSC-fuXs
Message-ID: <CADkTA4PXD8V0TzJ0aDwxWnfzbjYqcSmgBRFyuqEcHXcizD4jUA@mail.gmail.com>
Subject: Re: [OE-core] 0/2] linux-yocto: -stable and config changes (for
 current release)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002123b906333cc124"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 21:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215158

--0000000000002123b906333cc124
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 4:58=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2025-04-18 at 15:54 -0400, bruce.ashfield@gmail.com wrote:
> > This is the iommu configuration change you were waiting for, but I
> > had already updated to 6.12.23, so that -stable change is coming
> > along with the meta/cfg update to pickup the configuration.
> >
> > If there are any issues with the -stable update, I can attempt to
> > jiggle the patches such that the cfg: iommu patch brings along the
> > 6.12.23 kver bump, but not the actual -stable update itself. The -
> > stable would then follow later without an associated meta data
> > update.
> >
> > But since that is a manual operation, I wanted to send the patches
> > as-is and let's see how they do on the AB.
>
> Thanks, I'm not too worried about the kernel version bump but there was
> an issue in testing with poky-tiny which looks related to the config
> change:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1422
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2099421/raw

Indeed. Where this has moved is missing some of the dependencies so the
allnoconfig of -tiny is missing the value and hence the warning.

Is that config qemux86 -tiny ?

I'll start a build and see what I can do.

Bruce


>
> WARNING: linux-yocto-tiny-6.12.23+git-r0 do_kernel_configcheck: [kernel
> config]: specified values did not make it into the kernel's final
> configuration:
>
>     [NOTE]: 'CONFIG_IOMMU_API' last val (y) and .config val (n) do not
> match
>     [INFO]: CONFIG_IOMMU_API : n
>     [INFO]: raw config text:
>
>         config IOMMU_API
>                 bool
>
>     [INFO]: config 'CONFIG_IOMMU_API' was set, but it wasn't assignable,
> check (parent) dependencies
>
>     [INFO]: selection details for 'CONFIG_IOMMU_API':
>         Symbols currently n-selecting this symbol (no effect):
>           - DRM_NOUVEAU
>           - VFIO
>           - XEN_GRANT_DMA_IOMMU
>           - IOMMU_DMA
>           - FSL_PAMU
>           - MSM_IOMMU
>           - AMD_IOMMU
>           - INTEL_IOMMU
>           - IOMMUFD
>           - OMAP_IOMMU
>           - ROCKCHIP_IOMMU
>           - SUN50I_IOMMU
>           - TEGRA_IOMMU_SMMU
>           - EXYNOS_IOMMU
>           - IPMMU_VMSA
>           - SPAPR_TCE_IOMMU
>           - APPLE_DART
>           - ARM_SMMU
>           - ARM_SMMU_V3
>           - S390_IOMMU
>           - MTK_IOMMU
>           - MTK_IOMMU_V1
>           - QCOM_IOMMU
>           - HYPERV_IOMMU
>           - VIRTIO_IOMMU
>           - SPRD_IOMMU
>
>
>
>
>     [NOTE]: 'CONFIG_IOMMU_IOVA' last val (y) and .config val (n) do not
> match
>     [INFO]: CONFIG_IOMMU_IOVA : n
>     [INFO]: raw config text:
>
>         config IOMMU_IOVA
>                 tristate
>
>     [INFO]: config 'CONFIG_IOMMU_IOVA' was set, but it wasn't assignable,
> check (parent) dependencies
>
>     [INFO]: selection details for 'CONFIG_IOMMU_IOVA':
>         Symbols currently n-selecting this symbol (no effect):
>           - VIDEO_INTEL_IPU6
>           - VIDEO_TEGRA_VDE
>           - TEGRA_HOST1X
>           - DRM_TEGRA
>           - VDPA_SIM
>           - VDPA_USER
>           - VIDEO_IPU3_IMGU
>           - IOMMU_DMA
>           - AMD_IOMMU
>           - INTEL_IOMMU
>
>
>
>
>     [NOTE]: 'CONFIG_INTEL_IOMMU' last val (y) and .config val (n) do not
> match
>     [INFO]: CONFIG_INTEL_IOMMU : n
>     [INFO]: raw config text:
>
>         config INTEL_IOMMU
>                 bool "Support for Intel IOMMU using DMA Remapping Devices=
"
>                 select IOMMU_API
>                 select IOMMU_IOVA
>                 select IOMMUFD_DRIVER if IOMMUFD
>                 select NEED_DMA_MAP_STATE
>                 select DMAR_TABLE
>                 select SWIOTLB
>                 select PCI_ATS
>                 select PCI_PRI
>                 select PCI_PASID
>                 depends on PCI_MSI && ACPI && X86 && IOMMU_SUPPORT
>                 help
>                   DMA remapping (DMAR) devices support enables independen=
t
> address
>                   translations for Direct Memory Access (DMA) from device=
s.
>                   These DMA remapping devices are reported via ACPI table=
s
>                   and include PCI device scope covered by these DMA
>                   remapping devices.
>
>         Config 'INTEL_IOMMU' has the following Direct dependencies
> (INTEL_IOMMU=3Dn):
>                 PCI_MSI(=3Dy) && ACPI(=3Dy) && X86(=3Dy) && IOMMU_SUPPORT=
(=3Dn)
>         Parent dependencies are:
>              IOMMUFD [n] PCI_MSI [y] ACPI [y] IOMMU_SUPPORT [n] X86 [y]
>     [INFO]: config 'CONFIG_INTEL_IOMMU' was set, but it wasn't assignable=
,
> check (parent) dependencies
>
>
>     [NOTE]: 'CONFIG_INTEL_IOMMU_FLOPPY_WA' last val (y) and .config val
> (n) do not match
>     [INFO]: CONFIG_INTEL_IOMMU_FLOPPY_WA : n
>     [INFO]: raw config text:
>
>         config INTEL_IOMMU_FLOPPY_WA
>                 bool
>                 default y
>                 depends on X86 && INTEL_IOMMU && IOMMU_SUPPORT
>                 help
>                   Floppy disk drivers are known to bypass DMA API calls
>                   thereby failing to work when IOMMU is enabled. This
>                   workaround will setup a 1:1 mapping for the first
>                   16MiB to make floppy (an ISA device) work.
>
>         Config 'INTEL_IOMMU_FLOPPY_WA' has the following Direct
> dependencies (INTEL_IOMMU_FLOPPY_WA=3Dn):
>                 X86(=3Dy) && INTEL_IOMMU(=3Dn) && IOMMU_SUPPORT(=3Dn)
>         Parent dependencies are:
>              X86 [y] IOMMU_SUPPORT [n] INTEL_IOMMU [n]
>     [INFO]: config 'CONFIG_INTEL_IOMMU_FLOPPY_WA' was set, but it wasn't
> assignable, check (parent) dependencies
>
>
>
> NOTE: recipe linux-yocto-tiny-6.12.23+git-r0: task do_kernel_configcheck:
> Succeeded
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002123b906333cc124
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 20, 2025 at 4:58=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Fri, 2025-04-18 at 15:54 -04=
00, <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a> wrote:<br>
&gt; This is the iommu configuration change you were waiting for, but I<br>
&gt; had already updated to 6.12.23, so that -stable change is coming<br>
&gt; along with the meta/cfg update to pickup the configuration.<br>
&gt; <br>
&gt; If there are any issues with the -stable update, I can attempt to<br>
&gt; jiggle the patches such that the cfg: iommu patch brings along the<br>
&gt; 6.12.23 kver bump, but not the actual -stable update itself. The -<br>
&gt; stable would then follow later without an associated meta data<br>
&gt; update.<br>
&gt; <br>
&gt; But since that is a manual operation, I wanted to send the patches<br>
&gt; as-is and let&#39;s see how they do on the AB.<br>
<br>
Thanks, I&#39;m not too worried about the kernel version bump but there was=
<br>
an issue in testing with poky-tiny which looks related to the config<br>
change:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/buil=
ds/1422" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/50/builds/1422</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/209942=
1/raw" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/valkyrie/api/v2/logs/2099421/raw</a><span class=3D"gmail_default" sty=
le=3D"font-size:small"></span></blockquote><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small"></span></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Indeed. Where this has moved is missing some of the d=
ependencies so the allnoconfig of -tiny is missing the value and hence the =
warning.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Is that config q=
emux86 -tiny ?</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll s=
tart a build and see what I can do.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
WARNING: linux-yocto-tiny-6.12.23+git-r0 do_kernel_configcheck: [kernel con=
fig]: specified values did not make it into the kernel&#39;s final configur=
ation:<br>
<br>
=C2=A0 =C2=A0 [NOTE]: &#39;CONFIG_IOMMU_API&#39; last val (y) and .config v=
al (n) do not match<br>
=C2=A0 =C2=A0 [INFO]: CONFIG_IOMMU_API : n <br>
=C2=A0 =C2=A0 [INFO]: raw config text:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config IOMMU_API<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
<br>
=C2=A0 =C2=A0 [INFO]: config &#39;CONFIG_IOMMU_API&#39; was set, but it was=
n&#39;t assignable, check (parent) dependencies<br>
<br>
=C2=A0 =C2=A0 [INFO]: selection details for &#39;CONFIG_IOMMU_API&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Symbols currently n-selecting this symbol (no e=
ffect):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - DRM_NOUVEAU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - VFIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - XEN_GRANT_DMA_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - IOMMU_DMA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - FSL_PAMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - MSM_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - AMD_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - INTEL_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - IOMMUFD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - OMAP_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - ROCKCHIP_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - SUN50I_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - TEGRA_IOMMU_SMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - EXYNOS_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - IPMMU_VMSA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - SPAPR_TCE_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - APPLE_DART<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - ARM_SMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - ARM_SMMU_V3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - S390_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - MTK_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - MTK_IOMMU_V1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - QCOM_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - HYPERV_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - VIRTIO_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - SPRD_IOMMU<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 [NOTE]: &#39;CONFIG_IOMMU_IOVA&#39; last val (y) and .config =
val (n) do not match<br>
=C2=A0 =C2=A0 [INFO]: CONFIG_IOMMU_IOVA : n <br>
=C2=A0 =C2=A0 [INFO]: raw config text:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config IOMMU_IOVA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate<br>
<br>
=C2=A0 =C2=A0 [INFO]: config &#39;CONFIG_IOMMU_IOVA&#39; was set, but it wa=
sn&#39;t assignable, check (parent) dependencies<br>
<br>
=C2=A0 =C2=A0 [INFO]: selection details for &#39;CONFIG_IOMMU_IOVA&#39;:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Symbols currently n-selecting this symbol (no e=
ffect):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - VIDEO_INTEL_IPU6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - VIDEO_TEGRA_VDE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - TEGRA_HOST1X<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - DRM_TEGRA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - VDPA_SIM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - VDPA_USER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - VIDEO_IPU3_IMGU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - IOMMU_DMA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - AMD_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - INTEL_IOMMU<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 [NOTE]: &#39;CONFIG_INTEL_IOMMU&#39; last val (y) and .config=
 val (n) do not match<br>
=C2=A0 =C2=A0 [INFO]: CONFIG_INTEL_IOMMU : n <br>
=C2=A0 =C2=A0 [INFO]: raw config text:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config INTEL_IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Support =
for Intel IOMMU using DMA Remapping Devices&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select IOMMU_API<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select IOMMU_IOVA<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select IOMMUFD_DRIV=
ER if IOMMUFD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select NEED_DMA_MAP=
_STATE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select DMAR_TABLE<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select SWIOTLB<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select PCI_ATS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select PCI_PRI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select PCI_PASID<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on PCI_MSI =
&amp;&amp; ACPI &amp;&amp; X86 &amp;&amp; IOMMU_SUPPORT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA remappin=
g (DMAR) devices support enables independent address<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translations=
 for Direct Memory Access (DMA) from devices.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 These DMA re=
mapping devices are reported via ACPI tables<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and include =
PCI device scope covered by these DMA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remapping de=
vices.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Config &#39;INTEL_IOMMU&#39; has the following =
Direct dependencies (INTEL_IOMMU=3Dn):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCI_MSI(=3Dy) &amp;=
&amp; ACPI(=3Dy) &amp;&amp; X86(=3Dy) &amp;&amp; IOMMU_SUPPORT(=3Dn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Parent dependencies are:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOMMUFD [n] PCI_MSI [y] ACP=
I [y] IOMMU_SUPPORT [n] X86 [y]<br>
=C2=A0 =C2=A0 [INFO]: config &#39;CONFIG_INTEL_IOMMU&#39; was set, but it w=
asn&#39;t assignable, check (parent) dependencies<br>
<br>
<br>
=C2=A0 =C2=A0 [NOTE]: &#39;CONFIG_INTEL_IOMMU_FLOPPY_WA&#39; last val (y) a=
nd .config val (n) do not match<br>
=C2=A0 =C2=A0 [INFO]: CONFIG_INTEL_IOMMU_FLOPPY_WA : n <br>
=C2=A0 =C2=A0 [INFO]: raw config text:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config INTEL_IOMMU_FLOPPY_WA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default y<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on X86 &amp=
;&amp; INTEL_IOMMU &amp;&amp; IOMMU_SUPPORT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Floppy disk =
drivers are known to bypass DMA API calls<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thereby fail=
ing to work when IOMMU is enabled. This<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 workaround w=
ill setup a 1:1 mapping for the first<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16MiB to mak=
e floppy (an ISA device) work.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Config &#39;INTEL_IOMMU_FLOPPY_WA&#39; has the =
following Direct dependencies (INTEL_IOMMU_FLOPPY_WA=3Dn):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 X86(=3Dy) &amp;&amp=
; INTEL_IOMMU(=3Dn) &amp;&amp; IOMMU_SUPPORT(=3Dn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Parent dependencies are:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X86 [y] IOMMU_SUPPORT [n] I=
NTEL_IOMMU [n]<br>
=C2=A0 =C2=A0 [INFO]: config &#39;CONFIG_INTEL_IOMMU_FLOPPY_WA&#39; was set=
, but it wasn&#39;t assignable, check (parent) dependencies<br>
<br>
<br>
<br>
NOTE: recipe linux-yocto-tiny-6.12.23+git-r0: task do_kernel_configcheck: S=
ucceeded<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000002123b906333cc124--

