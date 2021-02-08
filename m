Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.65.1612799553420189932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 07:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y0EZmD9q;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.53, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f53.google.com with SMTP id f16so13001178wmq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 07:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MBWabprv8vfezf5LAGv6uAi4VKYHoQ0qOeI0IgvPSz4=;
        b=Y0EZmD9qYcXkbq+j2imvTljPhbgwv+iC0eZQE09M0MPdtqnmz7wWySX8Y70PZ8rCqN
         1NbGLULfyGwD9Iu2pTq1qCJNtduTibqT1L3WaBkv7BneEMZ8uGpRa/LWmKB5rPv2dg40
         siOdItogudGI9zdw9wwjf3widJ1dVetMdfzs5oTowR7gJCvnyo46vBDs9MKdJBZKdvGL
         xDW9jxQ5Yk5CJPoEloLGHVVdqtmRhuVDmQRYcECRieHwbCE0S42s6N/OfVNCiBIdDnQK
         nmQRalvu9LpzW9ODmikruvn7DDgQC4BUerFpaYjHTgqG20IuYLdsQvCKPnnYCnN/Efd4
         9L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MBWabprv8vfezf5LAGv6uAi4VKYHoQ0qOeI0IgvPSz4=;
        b=sX8KYtHrPN1qtcfg5C55pN6B37RggCWzSA4qUG+6OUw8YJ0kOEofatuWIxAuCv/8LK
         JrP4BAPbe7bdJytG0yShxJRtO5n9U7Qml9d9SlmVgM2nos4XrUlbgElNO0CLbtppmmOz
         4aV3o5AthRgSKlyryicUqQXAZrc1CNfTMdehM5oVxrVFqkufF5N/o0aJmufdjO+NhKyl
         M0xivmipcfsGY1EFPnWjV+el+Mtm6GdKGqaTtosugj1eRgan+jwrn64Adv7OajvdB5yv
         8+znmWzmOCp8oZTSHlVllySv9uScb54H7oaFoEPIJG3esPF2VqDZm2+x3ZX3iE7+fILy
         p4jA==
X-Gm-Message-State: AOAM533xih/sum3r/UELfMFjWSI0eI657Ka98kVE87MZBNwJDCkwkWoc
	DWfuQlH2dhYoATDND7d6hj6C94pgo5gj+0VAwHQhzg==
X-Google-Smtp-Source: ABdhPJx6t23cYUOmpdpWHA9O7o0Fuf0l40FR+0pBgsVjs0ZtZml7FMiNcTn2Wqa4d1YPyV7pq25Cob40pciMuwXo9No=
X-Received: by 2002:a05:600c:4f48:: with SMTP id m8mr15348712wmq.12.1612799551575;
 Mon, 08 Feb 2021 07:52:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612792088.git.steve@sakoman.com> <347808ca0898452d9656317cd24559bc34f9ed78.1612792088.git.steve@sakoman.com>
 <CA+chaQesbg883MCuZ=r23jjTiV=pCdgsOnoVKLJTunOYyr8LWQ@mail.gmail.com>
In-Reply-To: <CA+chaQesbg883MCuZ=r23jjTiV=pCdgsOnoVKLJTunOYyr8LWQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 8 Feb 2021 05:52:18 -1000
Message-ID: <CAOSpxdaHWWhg0m5PyTbB9ruL_sp89vOPzdid7nFriOtLKZka8g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 18/28] image_types: Ensure tar archives are reproducible
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 4:20 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Please add this only together with
> https://git.openembedded.org/openembedded-core/commit/?id=3ecea58f2a3382d9f4b410d6ad7089111334cb6f

Just noticed that this morning, I will move this patch to the next
batch along with the follow on patch.

Steve

> RP dropped this one from last gatesgarth PR as well until both are applied at the same time:
> https://lists.openembedded.org/g/openembedded-core/message/147712
>
> On Mon, Feb 8, 2021 at 2:54 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> The tar output seems to vary depending on the version of tar used and distro
>> configuration. Be explict about the output format to avoid this and be
>> determinstic.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit c56f3c9febc1732aa1302524c6c4da36f16bd1f7)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/classes/image_types.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index d81747527b..6de16d42b9 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -126,7 +126,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
>>  # required when extracting, but it seems prudent to use it in both cases.
>>  IMAGE_CMD_TAR ?= "tar"
>>  # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
>> -IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>> +IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=gnu --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>>
>>  do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>>  IMAGE_CMD_cpio () {
>> --
>> 2.25.1
>>
>>
>> 
>>
