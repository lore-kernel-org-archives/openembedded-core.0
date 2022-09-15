Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0730C6FA89
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:14:02 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.10688.1663251238893247798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6Qf5Q8x9;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id y17so37441112ejo.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=oXca/BznrzMjVE0PnafyUGbEEnOnBspvA0znBa17t0w=;
        b=6Qf5Q8x9DzWBKOkposNmORn2kkYfKwZmNTiJs1ZUwc57y08whyuq/PFS5YEj+Yaxyg
         1q0HVtiaoL7OlSFMG/Kz6D5ah1cHWFAX7055fhfzMaH+JADdNZn4yh/rZPrDztERM6f/
         6GiVLXmMR/eROyJh+zPZNkvvNX6BkLaE1hsnrmvFMF7BJfpmV9nlDw5BWifR669bKdK1
         V6YaQvk/dq7bRchZ0RjWazFD4nPuXNzPPpSzNot/WYMdsUB8pGhOEYf+jPMlDPOBBYi6
         xkgndT/1LKO8KRMC5D9xRctUu4wXS1ZCKbRhYzzRIpbv0VebV/sIJ3VQgAwWpnM46NFZ
         yjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oXca/BznrzMjVE0PnafyUGbEEnOnBspvA0znBa17t0w=;
        b=FE3sdjtqVyPvz5U1G3aSy+NZU7tgVmBCb/ERYCu5lwzTD+m53VzHnh9HAdpMsZPup2
         +8RoAQl8a+HTaLvzqLFLMKXQ7LaNf9OLeuRvE+oeR7eGxM5dDNzIpKnucnWrUxC4Q/YL
         r9AGRECEXqYNM+XVUPE4MerHd0zaK16PbDnmW0aQ0Fl20m6nHN27X6HBL5oL1psf6Hmu
         eO2hueeCFxiSmXG4FGetsnyb0Si7RGAfJ/EFF2EeroTR8xnYbRyTKgXVb6mR/hjahLI6
         X4gLudP3ShG1xjYruP7LvjPUuwUJHXuxBxdQpDWXoTauY8VIH948IlFuBuAwJ9AWyHSq
         lgGQ==
X-Gm-Message-State: ACrzQf0ErNgTdvriNF8CF8dcdqHx7QUzKSmPBKbgnjOw3reK98X6OIqE
	S2Qqekc1r5dA/THIAOZYvxvNh6cnBfGpv2BBcKfBRw==
X-Google-Smtp-Source: 
 AMsMyM4YwgkQN2NwgNM5cDI7EIbC9L2ezTCQjb51+Gj5LEiPKKQv6+LONStXNnvMQQEnzViSOeKUrDvOmNYFinPN7ws=
X-Received: by 2002:a17:907:1690:b0:77c:37be:2345 with SMTP id
 hc16-20020a170907169000b0077c37be2345mr121530ejc.359.1663251236635; Thu, 15
 Sep 2022 07:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220914060411.20436-1-chee.yang.lee@intel.com>
 <20220914060411.20436-2-chee.yang.lee@intel.com>
In-Reply-To: <20220914060411.20436-2-chee.yang.lee@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 15 Sep 2022 04:13:44 -1000
Message-ID: 
 <CAOSpxdYAKGNap-ce1oio1NvWXiecMkJKT95GUkeqaRDLtHV12w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell 2/2] qemu: fix and ignore several CVEs
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170697

On Tue, Sep 13, 2022 at 8:04 PM Lee Chee Yang <chee.yang.lee@intel.com> wro=
te:
>
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> backport fixes:
> CVE-2020-13754, backport patches as debian security tracker notes
>   https://security-tracker.debian.org/tracker/CVE-2020-13754
>
> CVE-2021-3713
> CVE-2021-3748
> CVE-2021-3930
> CVE-2021-4206
> CVE-2021-4207
> CVE-2022-0216, does not include qtest in patches, the qtest code were not=
 available in v4.2.
>
> Ignore:
> CVE-2020-27661, issue introduced in v5.1.0-rc0
> https://security-tracker.debian.org/tracker/CVE-2020-27661

While this patch applies and builds without error, it results in quite
a few runtime errors during
oe-selftest:

https://errors.yoctoproject.org/Errors/Details/671970/

Not sure which of the CVE fixes cause this :-(

Steve

> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  14 ++
>  .../qemu/qemu/CVE-2020-13754-1.patch          |  91 +++++++++++++
>  .../qemu/qemu/CVE-2020-13754-2.patch          |  69 ++++++++++
>  .../qemu/qemu/CVE-2020-13754-3.patch          |  65 +++++++++
>  .../qemu/qemu/CVE-2020-13754-4.patch          |  39 ++++++
>  .../qemu/qemu/CVE-2021-3713.patch             |  67 ++++++++++
>  .../qemu/qemu/CVE-2021-3748.patch             | 124 ++++++++++++++++++
>  .../qemu/qemu/CVE-2021-3930.patch             |  53 ++++++++
>  .../qemu/qemu/CVE-2021-4206.patch             |  89 +++++++++++++
>  .../qemu/qemu/CVE-2021-4207.patch             |  43 ++++++
>  .../qemu/qemu/CVE-2022-0216-1.patch           |  42 ++++++
>  .../qemu/qemu/CVE-2022-0216-2.patch           |  52 ++++++++
>  12 files changed, 748 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-1.patc=
h
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-2.patc=
h
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-3.patc=
h
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13754-4.patc=
h
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216-1.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216-2.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index a773068499..c1db723e90 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -100,6 +100,17 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.=
tar.xz \
>             file://CVE-2020-13791.patch \
>             file://CVE-2022-35414.patch \
>             file://CVE-2020-27821.patch \
> +           file://CVE-2020-13754-1.patch \
> +           file://CVE-2020-13754-2.patch \
> +           file://CVE-2020-13754-3.patch \
> +           file://CVE-2020-13754-4.patch \
> +           file://CVE-2021-3713.patch \
> +           file://CVE-2021-3748.patch \
> +           file://CVE-2021-3930.patch \
> +           file://CVE-2021-4206.patch \
> +           file://CVE-2021-4207.patch \
> +           file://CVE-2022-0216-1.patch \
> +           file://CVE-2022-0216-2.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> @@ -117,6 +128,9 @@ CVE_CHECK_WHITELIST +=3D "CVE-2007-0998"
>  # https://bugzilla.redhat.com/show_bug.cgi?id=3D1609015#c11
>  CVE_CHECK_WHITELIST +=3D "CVE-2018-18438"
>
> +# the issue introduced in v5.1.0-rc0
> +CVE_CHECK_WHITELIST +=3D "CVE-2020-27661"
> +
>  COMPATIBLE_HOST_mipsarchn32 =3D "null"
>  COMPATIBLE_HOST_mipsarchn64 =3D "null"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-1.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2020-13754-1.patch
> new file mode 100644
> index 0000000000..fdfff9d81d
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-1.patch
> @@ -0,0 +1,91 @@
> +From 5d971f9e672507210e77d020d89e0e89165c8fc9 Mon Sep 17 00:00:00 2001
> +From: "Michael S. Tsirkin" <mst@redhat.com>
> +Date: Wed, 10 Jun 2020 09:47:49 -0400
> +Subject: [PATCH] memory: Revert "memory: accept mismatching sizes in
> + memory_region_access_valid"
> +
> +Memory API documentation documents valid .min_access_size and .max_acces=
s_size
> +fields and explains that any access outside these boundaries is blocked.
> +
> +This is what devices seem to assume.
> +
> +However this is not what the implementation does: it simply
> +ignores the boundaries unless there's an "accepts" callback.
> +
> +Naturally, this breaks a bunch of devices.
> +
> +Revert to the documented behaviour.
> +
> +Devices that want to allow any access can just drop the valid field,
> +or add the impl field to have accesses converted to appropriate
> +length.
> +
> +Cc: qemu-stable@nongnu.org
> +Reviewed-by: Richard Henderson <rth@twiddle.net>
> +Fixes: CVE-2020-13754
> +Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1842363
> +Fixes: a014ed07bd5a ("memory: accept mismatching sizes in memory_region_=
access_valid")
> +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> +Message-Id: <20200610134731.1514409-1-mst@redhat.com>
> +Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> +
> +https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=3D5d971f9e672507210e77d02=
0d89e0e89165c8fc9
> +CVE: CVE-2020-13754
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + memory.c | 29 +++++++++--------------------
> + 1 file changed, 9 insertions(+), 20 deletions(-)
> +
> +diff --git a/memory.c b/memory.c
> +index 2f15a4b..9200b20 100644
> +--- a/memory.c
> ++++ b/memory.c
> +@@ -1352,35 +1352,24 @@ bool memory_region_access_valid(MemoryRegion *mr=
,
> +                                 bool is_write,
> +                                 MemTxAttrs attrs)
> + {
> +-    int access_size_min, access_size_max;
> +-    int access_size, i;
> +-
> +-    if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> ++    if (mr->ops->valid.accepts
> ++        && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, at=
trs)) {
> +         return false;
> +     }
> +
> +-    if (!mr->ops->valid.accepts) {
> +-        return true;
> +-    }
> +-
> +-    access_size_min =3D mr->ops->valid.min_access_size;
> +-    if (!mr->ops->valid.min_access_size) {
> +-        access_size_min =3D 1;
> ++    if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> ++        return false;
> +     }
> +
> +-    access_size_max =3D mr->ops->valid.max_access_size;
> ++    /* Treat zero as compatibility all valid */
> +     if (!mr->ops->valid.max_access_size) {
> +-        access_size_max =3D 4;
> ++        return true;
> +     }
> +
> +-    access_size =3D MAX(MIN(size, access_size_max), access_size_min);
> +-    for (i =3D 0; i < size; i +=3D access_size) {
> +-        if (!mr->ops->valid.accepts(mr->opaque, addr + i, access_size,
> +-                                    is_write, attrs)) {
> +-            return false;
> +-        }
> ++    if (size > mr->ops->valid.max_access_size
> ++        || size < mr->ops->valid.min_access_size) {
> ++        return false;
> +     }
> +-
> +     return true;
> + }
> +
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-2.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2020-13754-2.patch
> new file mode 100644
> index 0000000000..7354edc54d
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-2.patch
> @@ -0,0 +1,69 @@
> +From dba04c3488c4699f5afe96f66e448b1d447cf3fb Mon Sep 17 00:00:00 2001
> +From: Michael Tokarev <mjt@tls.msk.ru>
> +Date: Mon, 20 Jul 2020 19:06:27 +0300
> +Subject: [PATCH] acpi: accept byte and word access to core ACPI register=
s
> +
> +All ISA registers should be accessible as bytes, words or dwords
> +(if wide enough).  Fix the access constraints for acpi-pm-evt,
> +acpi-pm-tmr & acpi-cnt registers.
> +
> +Fixes: 5d971f9e67 (memory: Revert "memory: accept mismatching sizes in m=
emory_region_access_valid")
> +Fixes: afafe4bbe0 (apci: switch cnt to memory api)
> +Fixes: 77d58b1e47 (apci: switch timer to memory api)
> +Fixes: b5a7c024d2 (apci: switch evt to memory api)
> +Buglink: https://lore.kernel.org/xen-devel/20200630170913.123646-1-antho=
ny.perard@citrix.com/T/
> +Buglink: https://bugs.debian.org/964793
> +BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D964247
> +BugLink: https://bugs.launchpad.net/bugs/1886318
> +Reported-By: Simon John <git@the-jedi.co.uk>
> +Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> +Message-Id: <20200720160627.15491-1-mjt@msgid.tls.msk.ru>
> +Cc: qemu-stable@nongnu.org
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> +
> +https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=3Ddba04c3488c4699f5afe96f=
66e448b1d447cf3fb
> +CVE: CVE-2020-13754
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/acpi/core.c | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> +index f6d9ec4..ac06db3 100644
> +--- a/hw/acpi/core.c
> ++++ b/hw/acpi/core.c
> +@@ -458,7 +458,8 @@ static void acpi_pm_evt_write(void *opaque, hwaddr a=
ddr, uint64_t val,
> + static const MemoryRegionOps acpi_pm_evt_ops =3D {
> +     .read =3D acpi_pm_evt_read,
> +     .write =3D acpi_pm_evt_write,
> +-    .valid.min_access_size =3D 2,
> ++    .impl.min_access_size =3D 2,
> ++    .valid.min_access_size =3D 1,
> +     .valid.max_access_size =3D 2,
> +     .endianness =3D DEVICE_LITTLE_ENDIAN,
> + };
> +@@ -527,7 +528,8 @@ static void acpi_pm_tmr_write(void *opaque, hwaddr a=
ddr, uint64_t val,
> + static const MemoryRegionOps acpi_pm_tmr_ops =3D {
> +     .read =3D acpi_pm_tmr_read,
> +     .write =3D acpi_pm_tmr_write,
> +-    .valid.min_access_size =3D 4,
> ++    .impl.min_access_size =3D 4,
> ++    .valid.min_access_size =3D 1,
> +     .valid.max_access_size =3D 4,
> +     .endianness =3D DEVICE_LITTLE_ENDIAN,
> + };
> +@@ -599,7 +601,8 @@ static void acpi_pm_cnt_write(void *opaque, hwaddr a=
ddr, uint64_t val,
> + static const MemoryRegionOps acpi_pm_cnt_ops =3D {
> +     .read =3D acpi_pm_cnt_read,
> +     .write =3D acpi_pm_cnt_write,
> +-    .valid.min_access_size =3D 2,
> ++    .impl.min_access_size =3D 2,
> ++    .valid.min_access_size =3D 1,
> +     .valid.max_access_size =3D 2,
> +     .endianness =3D DEVICE_LITTLE_ENDIAN,
> + };
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-3.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2020-13754-3.patch
> new file mode 100644
> index 0000000000..2a8781050f
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-3.patch
> @@ -0,0 +1,65 @@
> +From 8e67fda2dd6202ccec093fda561107ba14830a17 Mon Sep 17 00:00:00 2001
> +From: Laurent Vivier <lvivier@redhat.com>
> +Date: Tue, 21 Jul 2020 10:33:22 +0200
> +Subject: [PATCH] xhci: fix valid.max_access_size to access address regis=
ters
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3Dutf8
> +Content-Transfer-Encoding: 8bit
> +
> +QEMU XHCI advertises AC64 (64-bit addressing) but doesn't allow
> +64-bit mode access in "runtime" and "operational" MemoryRegionOps.
> +
> +Set the max_access_size based on sizeof(dma_addr_t) as AC64 is set.
> +
> +XHCI specs:
> +"If the xHC supports 64-bit addressing (AC64 =3D =C3=A21=C3=A2), then so=
ftware
> +should write 64-bit registers using only Qword accesses.  If a
> +system is incapable of issuing Qword accesses, then writes to the
> +64-bit address fields shall be performed using 2 Dword accesses;
> +low Dword-first, high-Dword second.  If the xHC supports 32-bit
> +addressing (AC64 =3D =C3=A20=C3=A2), then the high Dword of registers co=
ntaining
> +64-bit address fields are unused and software should write addresses
> +using only Dword accesses"
> +
> +The problem has been detected with SLOF, as linux kernel always accesses
> +registers using 32-bit access even if AC64 is set and revealed by
> +5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes in memor=
y_region_access_valid"")
> +
> +Suggested-by: Alexey Kardashevskiy <aik@au1.ibm.com>
> +Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> +Message-id: 20200721083322.90651-1-lvivier@redhat.com
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=3D8e67fda2dd6202ccec093fd=
a561107ba14830a17
> +CVE: CVE-2020-13754
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/usb/hcd-xhci.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> +index b330e36..67a18fe 100644
> +--- a/hw/usb/hcd-xhci.c
> ++++ b/hw/usb/hcd-xhci.c
> +@@ -3184,7 +3184,7 @@ static const MemoryRegionOps xhci_oper_ops =3D {
> +     .read =3D xhci_oper_read,
> +     .write =3D xhci_oper_write,
> +     .valid.min_access_size =3D 4,
> +-    .valid.max_access_size =3D 4,
> ++    .valid.max_access_size =3D sizeof(dma_addr_t),
> +     .endianness =3D DEVICE_LITTLE_ENDIAN,
> + };
> +
> +@@ -3200,7 +3200,7 @@ static const MemoryRegionOps xhci_runtime_ops =3D =
{
> +     .read =3D xhci_runtime_read,
> +     .write =3D xhci_runtime_write,
> +     .valid.min_access_size =3D 4,
> +-    .valid.max_access_size =3D 4,
> ++    .valid.max_access_size =3D sizeof(dma_addr_t),
> +     .endianness =3D DEVICE_LITTLE_ENDIAN,
> + };
> +
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-4.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2020-13754-4.patch
> new file mode 100644
> index 0000000000..6bad07d03f
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13754-4.patch
> @@ -0,0 +1,39 @@
> +From 70b78d4e71494c90d2ccb40381336bc9b9a22f79 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Tue, 30 Jun 2020 13:12:11 -0700
> +Subject: [PATCH] hw/riscv: Allow 64 bit access to SiFive CLINT
> +
> +Commit 5d971f9e672507210e77d020d89e0e89165c8fc9
> +"memory: Revert "memory: accept mismatching sizes in
> +memory_region_access_valid"" broke most RISC-V boards as they do 64 bit
> +accesses to the CLINT and QEMU would trigger a fault. Fix this failure
> +by allowing 8 byte accesses.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> +Message-Id: <122b78825b077e4dfd39b444d3a46fe894a7804c.1593547870.git.ali=
stair.francis@wdc.com>
> +
> +https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=3D70b78d4e71494c90d2ccb40=
381336bc9b9a22f79
> +CVE: CVE-2020-13754
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/riscv/sifive_clint.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> +index b11ffa0..669c21a 100644
> +--- a/hw/riscv/sifive_clint.c
> ++++ b/hw/riscv/sifive_clint.c
> +@@ -181,7 +181,7 @@ static const MemoryRegionOps sifive_clint_ops =3D {
> +     .endianness =3D DEVICE_LITTLE_ENDIAN,
> +     .valid =3D {
> +         .min_access_size =3D 4,
> +-        .max_access_size =3D 4
> ++        .max_access_size =3D 8
> +     }
> + };
> +
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3713.patch
> new file mode 100644
> index 0000000000..cdd9c38db9
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch
> @@ -0,0 +1,67 @@
> +From a114d6baedf2cccb454a46d36e399fec1bc3e1c0 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Wed, 18 Aug 2021 14:05:05 +0200
> +Subject: [PATCH] uas: add stream number sanity checks.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The device uses the guest-supplied stream number unchecked, which can
> +lead to guest-triggered out-of-band access to the UASDevice->data3 and
> +UASDevice->status3 fields.  Add the missing checks.
> +
> +Fixes: CVE-2021-3713
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reported-by: Chen Zhe <chenzhe@huawei.com>
> +Reported-by: Tan Jingguo <tanjingguo@huawei.com>
> +Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +Message-Id: <20210818120505.1258262-2-kraxel@redhat.com>
> +
> +https://gitlab.com/qemu-project/qemu/-/commit/13b250b12ad3c59114a6a17d59=
caf073ce45b33a
> +CVE: CVE-2021-3713
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/usb/dev-uas.c | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> +index 6d6d1073..0b8cd4dd 100644
> +--- a/hw/usb/dev-uas.c
> ++++ b/hw/usb/dev-uas.c
> +@@ -830,6 +830,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBP=
acket *p)
> +         }
> +         break;
> +     case UAS_PIPE_ID_STATUS:
> ++        if (p->stream > UAS_MAX_STREAMS) {
> ++            goto err_stream;
> ++        }
> +         if (p->stream) {
> +             QTAILQ_FOREACH(st, &uas->results, next) {
> +                 if (st->stream =3D=3D p->stream) {
> +@@ -857,6 +860,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBP=
acket *p)
> +         break;
> +     case UAS_PIPE_ID_DATA_IN:
> +     case UAS_PIPE_ID_DATA_OUT:
> ++        if (p->stream > UAS_MAX_STREAMS) {
> ++            goto err_stream;
> ++        }
> +         if (p->stream) {
> +             req =3D usb_uas_find_request(uas, p->stream);
> +         } else {
> +@@ -892,6 +898,11 @@ static void usb_uas_handle_data(USBDevice *dev, USB=
Packet *p)
> +         p->status =3D USB_RET_STALL;
> +         break;
> +     }
> ++
> ++err_stream:
> ++    error_report("%s: invalid stream %d", __func__, p->stream);
> ++    p->status =3D USB_RET_STALL;
> ++    return;
> + }
> +
> + static void usb_uas_unrealize(USBDevice *dev, Error **errp)
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3748.patch
> new file mode 100644
> index 0000000000..b291ade4e3
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch
> @@ -0,0 +1,124 @@
> +From bedd7e93d01961fcb16a97ae45d93acf357e11f6 Mon Sep 17 00:00:00 2001
> +From: Jason Wang <jasowang@redhat.com>
> +Date: Thu, 2 Sep 2021 13:44:12 +0800
> +Subject: [PATCH] virtio-net: fix use after unmap/free for sg
> +
> +When mergeable buffer is enabled, we try to set the num_buffers after
> +the virtqueue elem has been unmapped. This will lead several issues,
> +E.g a use after free when the descriptor has an address which belongs
> +to the non direct access region. In this case we use bounce buffer
> +that is allocated during address_space_map() and freed during
> +address_space_unmap().
> +
> +Fixing this by storing the elems temporarily in an array and delay the
> +unmap after we set the the num_buffers.
> +
> +This addresses CVE-2021-3748.
> +
> +Reported-by: Alexander Bulekov <alxndr@bu.edu>
> +Fixes: fbe78f4f55c6 ("virtio-net support")
> +Cc: qemu-stable@nongnu.org
> +Signed-off-by: Jason Wang <jasowang@redhat.com>
> +
> +https://github.com/qemu/qemu/commit/bedd7e93d01961fcb16a97ae45d93acf357e=
11f6
> +CVE: CVE-2021-3748
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/net/virtio-net.c | 39 ++++++++++++++++++++++++++++++++-------
> + 1 file changed, 32 insertions(+), 7 deletions(-)
> +
> +diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> +index 16d20cdee52a..f205331dcf8c 100644
> +--- a/hw/net/virtio-net.c
> ++++ b/hw/net/virtio-net.c
> +@@ -1746,10 +1746,13 @@ static ssize_t virtio_net_receive_rcu(NetClientS=
tate *nc, const uint8_t *buf,
> +     VirtIONet *n =3D qemu_get_nic_opaque(nc);
> +     VirtIONetQueue *q =3D virtio_net_get_subqueue(nc);
> +     VirtIODevice *vdev =3D VIRTIO_DEVICE(n);
> ++    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
> ++    size_t lens[VIRTQUEUE_MAX_SIZE];
> +     struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
> +     struct virtio_net_hdr_mrg_rxbuf mhdr;
> +     unsigned mhdr_cnt =3D 0;
> +-    size_t offset, i, guest_offset;
> ++    size_t offset, i, guest_offset, j;
> ++    ssize_t err;
> +
> +     if (!virtio_net_can_receive(nc)) {
> +         return -1;
> +@@ -1780,6 +1783,12 @@ static ssize_t virtio_net_receive_rcu(NetClientSt=
ate *nc, const uint8_t *buf,
> +
> +         total =3D 0;
> +
> ++        if (i =3D=3D VIRTQUEUE_MAX_SIZE) {
> ++            virtio_error(vdev, "virtio-net unexpected long buffer chain=
");
> ++            err =3D size;
> ++            goto err;
> ++        }
> ++
> +         elem =3D virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
> +         if (!elem) {
> +             if (i) {
> +@@ -1791,7 +1800,8 @@ static ssize_t virtio_net_receive_rcu(NetClientSta=
te *nc, const uint8_t *buf,
> +                              n->guest_hdr_len, n->host_hdr_len,
> +                              vdev->guest_features);
> +             }
> +-            return -1;
> ++            err =3D -1;
> ++            goto err;
> +         }
> +
> +         if (elem->in_num < 1) {
> +@@ -1799,7 +1809,8 @@ static ssize_t virtio_net_receive_rcu(NetClientSta=
te *nc, const uint8_t *buf,
> +                          "virtio-net receive queue contains no in buffe=
rs");
> +             virtqueue_detach_element(q->rx_vq, elem, 0);
> +             g_free(elem);
> +-            return -1;
> ++            err =3D -1;
> ++            goto err;
> +         }
> +
> +         sg =3D elem->in_sg;
> +@@ -1836,12 +1847,13 @@ static ssize_t virtio_net_receive_rcu(NetClientS=
tate *nc, const uint8_t *buf,
> +         if (!n->mergeable_rx_bufs && offset < size) {
> +             virtqueue_unpop(q->rx_vq, elem, total);
> +             g_free(elem);
> +-            return size;
> ++            err =3D size;
> ++            goto err;
> +         }
> +
> +-        /* signal other side */
> +-        virtqueue_fill(q->rx_vq, elem, total, i++);
> +-        g_free(elem);
> ++        elems[i] =3D elem;
> ++        lens[i] =3D total;
> ++        i++;
> +     }
> +
> +     if (mhdr_cnt) {
> +@@ -1851,10 +1863,23 @@ static ssize_t virtio_net_receive_rcu(NetClientS=
tate *nc, const uint8_t *buf,
> +                      &mhdr.num_buffers, sizeof mhdr.num_buffers);
> +     }
> +
> ++    for (j =3D 0; j < i; j++) {
> ++        /* signal other side */
> ++        virtqueue_fill(q->rx_vq, elems[j], lens[j], j);
> ++        g_free(elems[j]);
> ++    }
> ++
> +     virtqueue_flush(q->rx_vq, i);
> +     virtio_notify(vdev, q->rx_vq);
> +
> +     return size;
> ++
> ++err:
> ++    for (j =3D 0; j < i; j++) {
> ++        g_free(elems[j]);
> ++    }
> ++
> ++    return err;
> + }
> +
> + static ssize_t virtio_net_do_receive(NetClientState *nc, const uint8_t =
*buf,
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3930.patch
> new file mode 100644
> index 0000000000..b1b5558647
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch
> @@ -0,0 +1,53 @@
> +From b3af7fdf9cc537f8f0dd3e2423d83f5c99a457e8 Mon Sep 17 00:00:00 2001
> +From: Mauro Matteo Cascella <mcascell@redhat.com>
> +Date: Thu, 4 Nov 2021 17:31:38 +0100
> +Subject: [PATCH] hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE S=
ELECT
> + commands
> +
> +This avoids an off-by-one read of 'mode_sense_valid' buffer in
> +hw/scsi/scsi-disk.c:mode_sense_page().
> +
> +Fixes: CVE-2021-3930
> +Cc: qemu-stable@nongnu.org
> +Reported-by: Alexander Bulekov <alxndr@bu.edu>
> +Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
> +Fixes: #546
> +Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> +Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> +Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> +
> +https://gitlab.com/qemu-project/qemu/-/commit/b3af7fdf9cc537f8f0dd3e2423=
d83f5c99a457e8
> +CVE: CVE-2021-3930
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/scsi/scsi-disk.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> +index e8a547dbb7..d4914178ea 100644
> +--- a/hw/scsi/scsi-disk.c
> ++++ b/hw/scsi/scsi-disk.c
> +@@ -1087,6 +1087,7 @@ static int mode_sense_page(SCSIDiskState *s, int p=
age, uint8_t **p_outbuf,
> +     uint8_t *p =3D *p_outbuf + 2;
> +     int length;
> +
> ++    assert(page < ARRAY_SIZE(mode_sense_valid));
> +     if ((mode_sense_valid[page] & (1 << s->qdev.type)) =3D=3D 0) {
> +         return -1;
> +     }
> +@@ -1428,6 +1429,11 @@ static int scsi_disk_check_mode_select(SCSIDiskSt=
ate *s, int page,
> +         return -1;
> +     }
> +
> ++    /* MODE_PAGE_ALLS is only valid for MODE SENSE commands */
> ++    if (page =3D=3D MODE_PAGE_ALLS) {
> ++        return -1;
> ++    }
> ++
> +     p =3D mode_current;
> +     memset(mode_current, 0, inlen + 2);
> +     len =3D mode_sense_page(s, page, &p, 0);
> +--
> +GitLab
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-4206.patch
> new file mode 100644
> index 0000000000..80ad49e4ed
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch
> @@ -0,0 +1,89 @@
> +From fa892e9abb728e76afcf27323ab29c57fb0fe7aa Mon Sep 17 00:00:00 2001
> +From: Mauro Matteo Cascella <mcascell@redhat.com>
> +Date: Thu, 7 Apr 2022 10:17:12 +0200
> +Subject: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
> + (CVE-2021-4206)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Prevent potential integer overflow by limiting 'width' and 'height' to
> +512x512. Also change 'datasize' type to size_t. Refer to security
> +advisory https://starlabs.sg/advisories/22-4206/ for more information.
> +
> +Fixes: CVE-2021-4206
> +Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Message-Id: <20220407081712.345609-1-mcascell@redhat.com>
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +https://gitlab.com/qemu-project/qemu/-/commit/fa892e9a
> +CVE: CVE-2021-4206
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/display/qxl-render.c | 7 +++++++
> + hw/display/vmware_vga.c | 2 ++
> + ui/cursor.c             | 8 +++++++-
> + 3 files changed, 16 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> +index 237ed293ba..ca217004bf 100644
> +--- a/hw/display/qxl-render.c
> ++++ b/hw/display/qxl-render.c
> +@@ -247,6 +247,13 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QX=
LCursor *cursor,
> +     size_t size;
> +
> +     c =3D cursor_alloc(cursor->header.width, cursor->header.height);
> ++
> ++    if (!c) {
> ++        qxl_set_guest_bug(qxl, "%s: cursor %ux%u alloc error", __func__=
,
> ++                cursor->header.width, cursor->header.height);
> ++        goto fail;
> ++    }
> ++
> +     c->hot_x =3D cursor->header.hot_spot_x;
> +     c->hot_y =3D cursor->header.hot_spot_y;
> +     switch (cursor->header.type) {
> +diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> +index 98c83474ad..45d06cbe25 100644
> +--- a/hw/display/vmware_vga.c
> ++++ b/hw/display/vmware_vga.c
> +@@ -515,6 +515,8 @@ static inline void vmsvga_cursor_define(struct vmsvg=
a_state_s *s,
> +     int i, pixels;
> +
> +     qc =3D cursor_alloc(c->width, c->height);
> ++    assert(qc !=3D NULL);
> ++
> +     qc->hot_x =3D c->hot_x;
> +     qc->hot_y =3D c->hot_y;
> +     switch (c->bpp) {
> +diff --git a/ui/cursor.c b/ui/cursor.c
> +index 1d62ddd4d0..835f0802f9 100644
> +--- a/ui/cursor.c
> ++++ b/ui/cursor.c
> +@@ -46,6 +46,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
> +
> +     /* parse pixel data */
> +     c =3D cursor_alloc(width, height);
> ++    assert(c !=3D NULL);
> ++
> +     for (pixel =3D 0, y =3D 0; y < height; y++, line++) {
> +         for (x =3D 0; x < height; x++, pixel++) {
> +             idx =3D xpm[line][x];
> +@@ -91,7 +93,11 @@ QEMUCursor *cursor_builtin_left_ptr(void)
> + QEMUCursor *cursor_alloc(int width, int height)
> + {
> +     QEMUCursor *c;
> +-    int datasize =3D width * height * sizeof(uint32_t);
> ++    size_t datasize =3D width * height * sizeof(uint32_t);
> ++
> ++    if (width > 512 || height > 512) {
> ++        return NULL;
> ++    }
> +
> +     c =3D g_malloc0(sizeof(QEMUCursor) + datasize);
> +     c->width  =3D width;
> +--
> +GitLab
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-4207.patch
> new file mode 100644
> index 0000000000..8418246247
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch
> @@ -0,0 +1,43 @@
> +From 9569f5cb5b4bffa9d3ebc8ba7da1e03830a9a895 Mon Sep 17 00:00:00 2001
> +From: Mauro Matteo Cascella <mcascell@redhat.com>
> +Date: Thu, 7 Apr 2022 10:11:06 +0200
> +Subject: [PATCH] display/qxl-render: fix race condition in qxl_cursor
> + (CVE-2021-4207)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Avoid fetching 'width' and 'height' a second time to prevent possible
> +race condition. Refer to security advisory
> +https://starlabs.sg/advisories/22-4207/ for more information.
> +
> +Fixes: CVE-2021-4207
> +Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Message-Id: <20220407081106.343235-1-mcascell@redhat.com>
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +https://gitlab.com/qemu-project/qemu/-/commit/9569f5cb
> +CVE: CVE-2021-4207
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/display/qxl-render.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> +index d28849b121..237ed293ba 100644
> +--- a/hw/display/qxl-render.c
> ++++ b/hw/display/qxl-render.c
> +@@ -266,7 +266,7 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXL=
Cursor *cursor,
> +         }
> +         break;
> +     case SPICE_CURSOR_TYPE_ALPHA:
> +-        size =3D sizeof(uint32_t) * cursor->header.width * cursor->head=
er.height;
> ++        size =3D sizeof(uint32_t) * c->width * c->height;
> +         qxl_unpack_chunks(c->data, size, qxl, &cursor->chunk, group_id)=
;
> +         if (qxl->debug > 2) {
> +             cursor_print_ascii_art(c, "qxl/alpha");
> +--
> +GitLab
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216-1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2022-0216-1.patch
> new file mode 100644
> index 0000000000..6a7ce0e26c
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216-1.patch
> @@ -0,0 +1,42 @@
> +From 6c8fa961da5e60f574bb52fd3ad44b1e9e8ad4b8 Mon Sep 17 00:00:00 2001
> +From: Mauro Matteo Cascella <mcascell@redhat.com>
> +Date: Tue, 5 Jul 2022 22:05:43 +0200
> +Subject: [PATCH] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
> + (CVE-2022-0216)
> +
> +Set current_req->req to NULL to prevent reusing a free'd buffer in case =
of
> +repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the =
patch.
> +
> +Fixes: CVE-2022-0216
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> +Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> +Reviewed-by: Thomas Huth <thuth@redhat.com>
> +Message-Id: <20220705200543.2366809-1-mcascell@redhat.com>
> +Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> +
> +https://gitlab.com/qemu-project/qemu/-/commit/6c8fa961da5e60f574bb52fd3a=
d44b1e9e8ad4b8
> +CVE: CVE-2022-0216
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/scsi/lsi53c895a.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> +index c8773f73f7..99ea42d49b 100644
> +--- a/hw/scsi/lsi53c895a.c
> ++++ b/hw/scsi/lsi53c895a.c
> +@@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
> +         case 0x0d:
> +             /* The ABORT TAG message clears the current I/O process onl=
y. */
> +             trace_lsi_do_msgout_abort(current_tag);
> +-            if (current_req) {
> ++            if (current_req && current_req->req) {
> +                 scsi_req_cancel(current_req->req);
> ++                current_req->req =3D NULL;
> +             }
> +             lsi_disconnect(s);
> +             break;
> +--
> +GitLab
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216-2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2022-0216-2.patch
> new file mode 100644
> index 0000000000..137906cd30
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216-2.patch
> @@ -0,0 +1,52 @@
> +From 4367a20cc442c56b05611b4224de9a61908f9eac Mon Sep 17 00:00:00 2001
> +From: Mauro Matteo Cascella <mcascell@redhat.com>
> +Date: Mon, 11 Jul 2022 14:33:16 +0200
> +Subject: [PATCH] scsi/lsi53c895a: really fix use-after-free in lsi_do_ms=
gout
> + (CVE-2022-0216)
> +
> +Set current_req to NULL, not current_req->req, to prevent reusing a free=
'd
> +buffer in case of repeated SCSI cancel requests.  Also apply the fix to
> +CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cance=
l
> +the request.
> +
> +Thanks to Alexander Bulekov for providing a reproducer.
> +
> +Fixes: CVE-2022-0216
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> +Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> +Tested-by: Alexander Bulekov <alxndr@bu.edu>
> +Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
> +Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> +
> +https://gitlab.com/qemu-project/qemu/-/commit/4367a20cc4
> +CVE: CVE-2022-0216
> +Upstream-Status: Backport
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + hw/scsi/lsi53c895a.c               |  3 +-
> + 1 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> +index 99ea42d49b..ad5f5e5f39 100644
> +--- a/hw/scsi/lsi53c895a.c
> ++++ b/hw/scsi/lsi53c895a.c
> +@@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
> +             trace_lsi_do_msgout_abort(current_tag);
> +             if (current_req && current_req->req) {
> +                 scsi_req_cancel(current_req->req);
> +-                current_req->req =3D NULL;
> ++                current_req =3D NULL;
> +             }
> +             lsi_disconnect(s);
> +             break;
> +@@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
> +             /* clear the current I/O process */
> +             if (s->current) {
> +                 scsi_req_cancel(s->current->req);
> ++                current_req =3D NULL;
> +             }
> +
> +             /* As the current implemented devices scsi_disk and scsi_ge=
neric
> +--
> +GitLab
> +
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170635): https://lists.openembedded.org/g/openembedde=
d-core/message/170635
> Mute This Topic: https://lists.openembedded.org/mt/93672603/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

