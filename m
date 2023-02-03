Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CCDC61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 15:59:40 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.14483.1675439972574784563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 07:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zNoF+xaK;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: sakoman@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id a24so5827063vsl.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 07:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsL3K7RbZhFGva6nMyEUln4u0pPirZTTdk0TamoGSbY=;
        b=zNoF+xaKbiNYpHyRqjE8pgB5kaIQ0nQ+t8szP8qvaFuEumqPBSNZXvu6lrl2cuwPpf
         g2YjJ/2Jerhxsr9suCIJxx4ygME5L3mgE0fHblfxp/uC5g83A0YVPGCISS7uwigLaLoP
         lPmUMtyVb5t1SkHevq+v3Po3FhTNS3FfN5zDlCi2rKiDyfAvkGAnetrncJeIJCJ6ciRj
         dUNIaGPYjbFsCRkbaVK6JssRv0KNyF49I0qzkLaHdaWJmiJocFinaLUy6OiS0VGk0HtQ
         0blfZIzWt9UL5wDsFVHqY2lvPAUar9yJ7r8vY4ZwRBjM20ISb0qsb+ymVX4bfLQ4fFXA
         PHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsL3K7RbZhFGva6nMyEUln4u0pPirZTTdk0TamoGSbY=;
        b=aulfrEwXzpC9YUmzwq85P6HYr266c1WYEg15EGLg10vJyB+oWR9BuYp8KSqdNMd/vm
         uXho4ykAWr12Zy3xd2eowasLghr1SUbQxy73b+a8RE45aeB8+0bnukPxMtigmCtbvi2I
         t9ymkzISKmQGg4pMjJ4PbtXfjfSNp0ntYIoqfTVwttpv5762RfC1C4x9X6ZQYr45kj1j
         BLuZ3yfREbeME99q4AQuuQwbcVplI0tBkBT+ao5rmT2KlkOvIx+/TzMGVuH/tadCMsQU
         6d47+lPhQTAOSJL7KtS4GG1bXfqTT0pWJ7WKPrQCPHeb2FzQ1DfQswRZYHjhFsV4PRC4
         c5Kg==
X-Gm-Message-State: AO0yUKXh+2fnXbQBxYYsY0vcd61Wzh1E4jCZF6cgpO+2LJBJklsc2peK
	0QADWq+fXC17NZHJkqf5YH6ngujvm7nrIXJOXTY=
X-Google-Smtp-Source: AK7set/RQ4vGtgX1WrBahrd5KaOKjaMd5fn82aNRMBN0zl8O2r6Sf5D0W1MMaFRvwm/qBbXbd0k9VaCTUSZr5ZBgXiM=
X-Received: by 2002:a05:6102:3c83:b0:3ce:dcbc:23a5 with SMTP id
 c3-20020a0561023c8300b003cedcbc23a5mr1886843vsv.71.1675439971533; Fri, 03 Feb
 2023 07:59:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674657501.git.steve@sakoman.com> <7fdb46a83e117459780d5cd0997b0666b7b1a081.1674657501.git.steve@sakoman.com>
 <173F539A3738DDDD.25384@lists.openembedded.org> <CA+chaQeh-fC6FGFcaR0nmoe7LEQeuRSCzm-sE9gn_ZeW_v+HJQ@mail.gmail.com>
In-Reply-To: <CA+chaQeh-fC6FGFcaR0nmoe7LEQeuRSCzm-sE9gn_ZeW_v+HJQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 Feb 2023 05:59:20 -1000
Message-ID: <CAGDS+nmtWaY7wR2YARRRv=kjUQd+39o9QL7v7XyBBfZWVoi=JA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 07/16] QEMU: CVE-2022-4144 QXL: qxl_phys2virt
 unsafe address translation can lead to out-of-bounds read
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: bhabu.bindu@kpit.com, Hitendra Prajapati <hprajapati@mvista.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 15:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176723

On Mon, Jan 30, 2023 at 9:39 PM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> On Tue, Jan 31, 2023 at 8:18 AM Martin Jansa via lists.openembedded.org <=
Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> I haven't checked yet in dunfell, but in kirkstone this commit merged la=
st week breaks nativesdk-qemu builds.
>
>
> I can confirm it fails the same with this commit from Hitendra in dunfell=
:
>
> nativesdk-qemu/4.2.0-r0/qemu-4.2.0/hw/display/qxl.c:1508:67: error: 'size=
' undeclared (first use in this function); did you mean 'gsize'?
> |  1508 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offse=
t, size)) {
> |       |                                                                =
   ^~~~
> |       |                                                                =
   gsize
>
> as well as the same backport from Bhabu in kirkstone (already merged):
> https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=
=3D4cb3874abf4fdeb04337a48a14c765ba9b2269d4
>
> To reproduce this just enable "spice" PACKAGECONFIG in nativesdk-qemu.
>
> Hitendra, Bhabu: please have a look.

Yes, please do!  Unless I get a fix for the spice regression sometime
soon I will revert the patch in kirkstone and of course won't take the
dunfell version.

Steve

>> This chunk:
>> +@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICA=
L pqxl, int group_id)
>> +         offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
>> +         return (void *)(intptr_t)offset;
>> +     case MEMSLOT_GROUP_GUEST:
>> +-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
>> ++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size=
)) {
>> +             return NULL;
>> +         }
>> +         ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
>>
>> Uses size parameter which was added in previous commit (which wasn't bac=
kported):
>> https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325=
a35806ece9b39f
>>
>> So either both commits need to be backported or this one reworked not to=
 use undeclared size as it leads to:
>>
>> | ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
>> | ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (firs=
t use in this function); did you mean 'gsize'?
>> |  1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offs=
et, size)) {
>> |       |                                                               =
    ^~~~
>> |       |                                                               =
    gsize
>>
>> I'm surprised this wasn't caught on autobuilder already, maybe it's trig=
gered only with extra PACKAGECONFIG options we have enabled:
>> PACKAGECONFIG:append:class-nativesdk =3D " virglrenderer epoxy spice lib=
usb usb-redir"
>>
>> Regards,
>>
>>
>> On Wed, Jan 25, 2023 at 3:42 PM Steve Sakoman <steve@sakoman.com> wrote:
>>>
>>> From: Hitendra Prajapati <hprajapati@mvista.com>
>>>
>>> Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/c=
ommit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622
>>>
>>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>> ---
>>>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>>>  .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
>>>  2 files changed, 104 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
>>> index fff2c87780..898fa1a8d8 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -115,6 +115,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}=
.tar.xz \
>>>            file://CVE-2021-3638.patch \
>>>            file://CVE-2021-20196.patch \
>>>            file://CVE-2021-3507.patch \
>>> +          file://CVE-2022-4144.patch \
>>>             "
>>>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>>> new file mode 100644
>>> index 0000000000..3f0d5fbd5c
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>>> @@ -0,0 +1,103 @@
>>> +From 6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622 Mon Sep 17 00:00:00 2001
>>> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@lina=
ro.org>
>>> +Date: Mon, 28 Nov 2022 21:27:40 +0100
>>> +Subject: [PATCH] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt
>>> + (CVE-2022-4144)
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=3DUTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Have qxl_get_check_slot_offset() return false if the requested
>>> +buffer size does not fit within the slot memory region.
>>> +
>>> +Similarly qxl_phys2virt() now returns NULL in such case, and
>>> +qxl_dirty_one_surface() aborts.
>>> +
>>> +This avoids buffer overrun in the host pointer returned by
>>> +memory_region_get_ram_ptr().
>>> +
>>> +Fixes: CVE-2022-4144 (out-of-bounds read)
>>> +Reported-by: Wenxu Yin (@awxylitol)
>>> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
>>> +
>>> +Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@linaro.org>
>>> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> +Message-Id: <20221128202741.4945-5-philmd@linaro.org>
>>> +
>>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/comm=
it/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622]
>>> +CVE: CVE-2022-4144
>>> +Comments: Deleted patch hunk in qxl.h,as it contains change
>>> +in comments which is not present in current version of qemu.
>>> +
>>> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>>> +---
>>> + hw/display/qxl.c | 27 +++++++++++++++++++++++----
>>> + 1 file changed, 23 insertions(+), 4 deletions(-)
>>> +
>>> +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>>> +index cd7eb39d..6bc8385b 100644
>>> +--- a/hw/display/qxl.c
>>> ++++ b/hw/display/qxl.c
>>> +@@ -1440,11 +1440,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d=
)
>>> +
>>> + /* can be also called from spice server thread context */
>>> + static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL =
pqxl,
>>> +-                                      uint32_t *s, uint64_t *o)
>>> ++                                      uint32_t *s, uint64_t *o,
>>> ++                                      size_t size_requested)
>>> + {
>>> +     uint64_t phys   =3D le64_to_cpu(pqxl);
>>> +     uint32_t slot   =3D (phys >> (64 -  8)) & 0xff;
>>> +     uint64_t offset =3D phys & 0xffffffffffff;
>>> ++    uint64_t size_available;
>>> +
>>> +     if (slot >=3D NUM_MEMSLOTS) {
>>> +         qxl_set_guest_bug(qxl, "slot too large %d >=3D %d", slot,
>>> +@@ -1468,6 +1470,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDev=
ice *qxl, QXLPHYSICAL pqxl,
>>> +                           slot, offset, qxl->guest_slots[slot].size);
>>> +         return false;
>>> +     }
>>> ++    size_available =3D memory_region_size(qxl->guest_slots[slot].mr);
>>> ++    if (qxl->guest_slots[slot].offset + offset >=3D size_available) {
>>> ++        qxl_set_guest_bug(qxl,
>>> ++                          "slot %d offset %"PRIu64" > region size %"P=
RIu64"\n",
>>> ++                          slot, qxl->guest_slots[slot].offset + offse=
t,
>>> ++                          size_available);
>>> ++        return false;
>>> ++    }
>>> ++    size_available -=3D qxl->guest_slots[slot].offset + offset;
>>> ++    if (size_requested > size_available) {
>>> ++        qxl_set_guest_bug(qxl,
>>> ++                          "slot %d offset %"PRIu64" size %zu: "
>>> ++                          "overrun by %"PRIu64" bytes\n",
>>> ++                          slot, offset, size_requested,
>>> ++                          size_requested - size_available);
>>> ++        return false;
>>> ++    }
>>> +
>>> +     *s =3D slot;
>>> +     *o =3D offset;
>>> +@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSIC=
AL pqxl, int group_id)
>>> +         offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
>>> +         return (void *)(intptr_t)offset;
>>> +     case MEMSLOT_GROUP_GUEST:
>>> +-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
>>> ++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, siz=
e)) {
>>> +             return NULL;
>>> +         }
>>> +         ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
>>> +@@ -1944,9 +1963,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *=
qxl, QXLPHYSICAL pqxl,
>>> +     uint32_t slot;
>>> +     bool rc;
>>> +
>>> +-    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
>>> +-    assert(rc =3D=3D true);
>>> +     size =3D (uint64_t)height * abs(stride);
>>> ++    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)=
;
>>> ++    assert(rc =3D=3D true);
>>> +     trace_qxl_surfaces_dirty(qxl->id, offset, size);
>>> +     qxl_set_dirty(qxl->guest_slots[slot].mr,
>>> +                   qxl->guest_slots[slot].offset + offset,
>>> +--
>>> +2.25.1
>>> +
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176508): https://lists.openembedded.org/g/openembedde=
d-core/message/176508
> Mute This Topic: https://lists.openembedded.org/mt/96521255/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

