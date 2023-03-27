Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A5EC76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 14:12:10 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.35959.1679926325274138384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 07:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Qceb/36v;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id w9so36854941edc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679926323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVhin3b7LQAVx9niKl8gUkeobwXY+1TVKBqjJntl92M=;
        b=Qceb/36vaMbvuZxlgWO2BEhVRrrIbaeHFY/VWRdUPwLLdhg61MmBgocaNMYNm3uYHi
         CoiriYMrR//GLjF/XCpefCz6dx+io/vo2leDT81OEy8rvAd4jTDRjySikZup3k/Aqu6e
         boDzzfJiWvvHrV2E//A5ABo3CzID1puWVk6gCEiXjJI/DjyagTwZbmikpyZDKTFs0acO
         gcsCd1gNNDpIItc9iim3BCun4PGssdJ684ElpLDPiQOl6CNVUvpSsa9wYJwQvOZb3b/P
         ZTcq8bxA9xfR3IWQZXqBRMM7P2/2JsvovoCvUu/Z9yvplDNXzaZtECJpJp9aFMtLgzqu
         uhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVhin3b7LQAVx9niKl8gUkeobwXY+1TVKBqjJntl92M=;
        b=FyJdQJ80ZFIfNeGV/EaIz9DMcIzNAyPboozqFG0tjyPObwSQtu8rFOEog4IC2S3oB7
         sqR5dCQl8TUJdhT6hB85uL0H3FV/E6B2pOtvNskElSJM55fSmjas9xxmUncdIEBXvsyO
         e4iipZpg9VUGr/qRPif/wcOHaN55iMxp8O6ADtNyTPhEYRU2S9jb3a5iHfg4fd1+i9Nr
         xGP76ohJb5geOBfiV+FHZbkzvs13jWTvwRLDLjCMjWy9qSIO/I6aSfIqPrJlrti5zOPM
         PuOHfj1Lno/JROJLRxZ6vy7k8aOUhEGEIhBB47uuycfYVfi+HnNp58DPlXPVyRnnKD/x
         29yg==
X-Gm-Message-State: AAQBX9ePHV+POLJcd9JpHRyaF1iVfOmHS/gS/p4WCuKILPFDqhq9K00n
	/Mv4DTZi1GCClsNyPAX8i+iIkI6rJEahYQfMyDJ8mg==
X-Google-Smtp-Source: AKy350bL8sE3W+XjH43DQADoFNw9FJ0/MRbMiZJj32SxzTAOZQpjc/WsMwbczTybi5zNjEVMFqL/Hu4SYq/lEfIV+l0=
X-Received: by 2002:a17:906:ee89:b0:92e:a234:110a with SMTP id
 wt9-20020a170906ee8900b0092ea234110amr6079183ejb.3.1679926323026; Mon, 27 Mar
 2023 07:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230325144247.34549-1-kai.kang@windriver.com>
In-Reply-To: <20230325144247.34549-1-kai.kang@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 27 Mar 2023 04:11:51 -1000
Message-ID: <CAOSpxdbHPUAhUAv2zW=-fksgGwFTVF6bvPHGKQ1Hyo1nM5Ownw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2 1/2] QEMU: CVE-2022-4144 QXL:
 qxl_phys2virt unsafe address translation can lead to out-of-bounds read
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 14:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179159

We already seem to have a version of this patch in dunfell:

https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D754=
cce68614c7985d5848134635a6b318f4505ab

If you have corrections to the above patch, please submit a patch with
those corrections.

Thanks!

Steve


On Sat, Mar 25, 2023 at 4:42=E2=80=AFAM Kai Kang <kai.kang@eng.windriver.co=
m> wrote:
>
> From: Hitendra Prajapati <hprajapati@mvista.com>
>
> Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/com=
mit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>
> Replace the tabs with spaces to correct the indent.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   9 +-
>  .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
>  2 files changed, 108 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 36d0b9320f..0649727338 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -112,10 +112,11 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}=
.tar.xz \
>             file://CVE-2022-0216-1.patch \
>             file://CVE-2022-0216-2.patch \
>             file://CVE-2021-3750.patch \
> -          file://CVE-2021-3638.patch \
> -          file://CVE-2021-20196.patch \
> -          file://CVE-2021-3507.patch \
> -          file://CVE-2021-3929.patch \
> +           file://CVE-2021-3638.patch \
> +           file://CVE-2021-20196.patch \
> +           file://CVE-2021-3507.patch \
> +           file://CVE-2021-3929.patch \
> +           file://CVE-2022-4144.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2022-4144.patch
> new file mode 100644
> index 0000000000..3f0d5fbd5c
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
> @@ -0,0 +1,103 @@
> +From 6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
> +Date: Mon, 28 Nov 2022 21:27:40 +0100
> +Subject: [PATCH] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt
> + (CVE-2022-4144)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Have qxl_get_check_slot_offset() return false if the requested
> +buffer size does not fit within the slot memory region.
> +
> +Similarly qxl_phys2virt() now returns NULL in such case, and
> +qxl_dirty_one_surface() aborts.
> +
> +This avoids buffer overrun in the host pointer returned by
> +memory_region_get_ram_ptr().
> +
> +Fixes: CVE-2022-4144 (out-of-bounds read)
> +Reported-by: Wenxu Yin (@awxylitol)
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
> +
> +Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@linaro.org>
> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Message-Id: <20221128202741.4945-5-philmd@linaro.org>
> +
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622]
> +CVE: CVE-2022-4144
> +Comments: Deleted patch hunk in qxl.h,as it contains change
> +in comments which is not present in current version of qemu.
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + hw/display/qxl.c | 27 +++++++++++++++++++++++----
> + 1 file changed, 23 insertions(+), 4 deletions(-)
> +
> +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> +index cd7eb39d..6bc8385b 100644
> +--- a/hw/display/qxl.c
> ++++ b/hw/display/qxl.c
> +@@ -1440,11 +1440,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
> +
> + /* can be also called from spice server thread context */
> + static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pq=
xl,
> +-                                      uint32_t *s, uint64_t *o)
> ++                                      uint32_t *s, uint64_t *o,
> ++                                      size_t size_requested)
> + {
> +     uint64_t phys   =3D le64_to_cpu(pqxl);
> +     uint32_t slot   =3D (phys >> (64 -  8)) & 0xff;
> +     uint64_t offset =3D phys & 0xffffffffffff;
> ++    uint64_t size_available;
> +
> +     if (slot >=3D NUM_MEMSLOTS) {
> +         qxl_set_guest_bug(qxl, "slot too large %d >=3D %d", slot,
> +@@ -1468,6 +1470,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevic=
e *qxl, QXLPHYSICAL pqxl,
> +                           slot, offset, qxl->guest_slots[slot].size);
> +         return false;
> +     }
> ++    size_available =3D memory_region_size(qxl->guest_slots[slot].mr);
> ++    if (qxl->guest_slots[slot].offset + offset >=3D size_available) {
> ++        qxl_set_guest_bug(qxl,
> ++                          "slot %d offset %"PRIu64" > region size %"PRI=
u64"\n",
> ++                          slot, qxl->guest_slots[slot].offset + offset,
> ++                          size_available);
> ++        return false;
> ++    }
> ++    size_available -=3D qxl->guest_slots[slot].offset + offset;
> ++    if (size_requested > size_available) {
> ++        qxl_set_guest_bug(qxl,
> ++                          "slot %d offset %"PRIu64" size %zu: "
> ++                          "overrun by %"PRIu64" bytes\n",
> ++                          slot, offset, size_requested,
> ++                          size_requested - size_available);
> ++        return false;
> ++    }
> +
> +     *s =3D slot;
> +     *o =3D offset;
> +@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL=
 pqxl, int group_id)
> +         offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
> +         return (void *)(intptr_t)offset;
> +     case MEMSLOT_GROUP_GUEST:
> +-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
> ++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)=
) {
> +             return NULL;
> +         }
> +         ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
> +@@ -1944,9 +1963,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qx=
l, QXLPHYSICAL pqxl,
> +     uint32_t slot;
> +     bool rc;
> +
> +-    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
> +-    assert(rc =3D=3D true);
> +     size =3D (uint64_t)height * abs(stride);
> ++    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
> ++    assert(rc =3D=3D true);
> +     trace_qxl_surfaces_dirty(qxl->id, offset, size);
> +     qxl_set_dirty(qxl->guest_slots[slot].mr,
> +                   qxl->guest_slots[slot].offset + offset,
> +--
> +2.25.1
> +
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179097): https://lists.openembedded.org/g/openembedde=
d-core/message/179097
> Mute This Topic: https://lists.openembedded.org/mt/97844421/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

