Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E8EC64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 06:47:55 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.16290.1677653268429125609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 22:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6n7Ss5y;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id z42so12848314ljq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 22:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677653266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tJ0uu4R0R9LY0sYrA8f9subV7YMyL+SEjrzm0Ese5w=;
        b=b6n7Ss5yNPtufOehPNkI5cHNXnHrX/nESZevNsVJ7yMiwRHr+UIL7DqnrXuTR/rN6H
         MfJoDhD5jkq0/NGWU/Pp9pVOlBZgZtxq4Vhb27Ki4tufgXXH80emX8U/7bb5WXOGUWsQ
         Y751kr4fsBX4WY+IjYfYsQq/PcLdn5bGUQelfg8qgXEz9lnn+5f0xhr24+QI4t1sb6e/
         oii0Xs2TJ3Y/6lb6cVp2zght4MzukNhX9DaF9esGn2SU6h71st0nCNHAlLUzSqKIeUS+
         WfUIUfzcUuMj61ajQnIPepjiKW3ubXe+aivyWExYnOReE8HPUoIUD3tg4SEDZyzkTIb6
         K0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677653266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tJ0uu4R0R9LY0sYrA8f9subV7YMyL+SEjrzm0Ese5w=;
        b=0jDn5cL0esVy9y0iW8XJsEAvUL8f3FtPao/ktBpTNK1BeBMdMTRII4DdLwPaWB6r2M
         WGD1sjr7rMqjIo30IODdpzLHsB7KrVRzAs9EfG1w7NEDSD9hm8E6IfrM4Qni926sC2wh
         8ynQzi01OOtDpW/Sr0P4elPLfepyAOHc0o0LQOYvIsioF05YzVVXfIY7HzS4/qqSQzOH
         L316kF4ZkPvwhNnbvDB8iFZXODwumkmLqQxzauWKrK4B3lqB2qM1vEehGuTZseAU+V+x
         7d14bjU0jKJpioA4xoGj1MKc3gqNQa5h/fs6OhAgroWB5/hJFhDjpnuZ/R0b+3rsbQom
         +91w==
X-Gm-Message-State: AO0yUKUjuiWQe08WLKF++GFI36Y6VI7ieWyRvmJP7UIPrGjUGbjbsdB1
	LlYIZouuWXoOd5hFuI5NwJnXNzY54RBnwNsVvqY=
X-Google-Smtp-Source: AK7set+b7Uvd9WSbRaE3jkT9nIP0px9CD/F8053rTUBU17NmTn2zzK/2GMXs+1OIFcIo5FR/oRLpvx3AkCkG/0JgdMU=
X-Received: by 2002:a05:651c:1a06:b0:295:ba28:a43 with SMTP id
 by6-20020a05651c1a0600b00295ba280a43mr4316602ljb.4.1677653266310; Tue, 28 Feb
 2023 22:47:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sp8fQHaZw=eyXD6C4qnQhLjNjZ6_upxfauEZ8jBT9egbw@mail.gmail.com>
 <22315.1677652117161137395@lists.openembedded.org>
In-Reply-To: <22315.1677652117161137395@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Mar 2023 07:47:34 +0100
Message-ID: <CANNYZj9OEj6tK8ybuXpj6qvXWmesTk+y96qdkrm2D-p4OgQKdA@mail.gmail.com>
Subject: Re: [OE-core] Yocto reproducibilty issue :: rust-llvm binary differences
To: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 06:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177869

You should not copy things between sysroot and ${D}. There is
post-processing between those steps, so do it only between sysroots
please.

Alex

On Wed, 1 Mar 2023 at 07:28, Sundeep KOKKONDA
<sundeep.kokkonda@windriver.com> wrote:
>
> Hello,
>
>
>
> I tried to copy the libLTO.so to ${D}. But this shows ERROR: rust-llvm-1.=
67.0-r0 do_package_qa: QA Issue: -dev package rust-llvm-dev contains non-sy=
mlink .so '/usr/lib/llvm-rust/lib/libLTO.so' [dev-elf] and I had a look int=
o symlink where it points... The libLTO.so files RPATH in ${D} & sysroot-de=
stdir are different as below,
>
>
>
> $ objdump -x ./image/wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm-nati=
ve/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.so | grep '=
R.*PATH'
>
>   RUNPATH              /wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm-n=
ative/1.67.0-r0/recipe-sysroot-native/usr/lib:/wdr/poky/buildA/tmp/work/x86=
_64-linux/rust-llvm-native/1.67.0-r0/recipe-sysroot-native/lib:::::::::::::=
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
::::::::::::::::::::::::::::::
>
> $ objdump -x ./sysroot-destdir/wdr/poky/buildA/tmp/work/x86_64-linux/rust=
-llvm-native/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.s=
o | grep 'R.*PATH'
>
>   RUNPATH              $ORIGIN/../..:$ORIGIN/../../../../lib:.:.:.:.:.:.:=
.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.=
:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:=
.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.
>
>
>
> Also, the libLTO.so is a symlink for libLTO.so.15. So, I tried copying bo=
th libLTO.so & libLTO.so.15 but again getting below QA error:
>
> ERROR: rust-llvm-1.67.0-r0 do_package: QA Issue: File '/usr/lib/llvm-rust=
/lib/libLTO.so' from rust-llvm was already stripped, this will prevent futu=
re debugging! [already-stripped]
>
> ERROR: rust-llvm-1.67.0-r0 do_package: QA Issue: File '/usr/lib/llvm-rust=
/lib/libLTO.so.15' from rust-llvm was already stripped, this will prevent f=
uture debugging! [already-stripped]
>
> WARNING: rust-llvm-1.67.0-r0 do_package: rust-llvm-liblto-1.67.0 was regi=
stered as shlib provider for libLTO.so.15, changing it to rust-llvm-dev-1.6=
7.0 because it was built later
>
> ERROR: rust-llvm-1.67.0-r0 do_package: Fatal QA errors were found, failin=
g task.
>
>
>
> So, I disabled stripping of binaries in kernel.bbclass (@line 743 : #oe.p=
ackage.runstrip((kernel_image_stripped, 8, strip, extra_sections))) but sti=
ll facing below errors.
>
> WARNING: rust-llvm-1.67.0-r0 do_package: rust-llvm-liblto-1.67.0 was regi=
stered as shlib provider for libLTO.so.15, changing it to rust-llvm-dev-1.6=
7.0 because it was built later
>
> WARNING: rust-llvm-1.67.0-r0 do_package_qa: QA Issue: File /usr/lib/llvm-=
rust/lib/libLTO.so.15 in package rust-llvm-liblto contains reference to TMP=
DIR [buildpaths]
>
> WARNING: rust-llvm-1.67.0-r0 do_package_qa: QA Issue: File /usr/lib/llvm-=
rust/lib/libLTO.so in package rust-llvm-dev contains reference to TMPDIR [b=
uildpaths]
>
> ERROR: rust-llvm-1.67.0-r0 do_package_qa: QA Issue: -dev package rust-llv=
m-dev contains non-symlink .so '/usr/lib/llvm-rust/lib/libLTO.so' [dev-elf]
>
> ERROR: rust-llvm-1.67.0-r0 do_package_qa: Fatal QA errors were found, fai=
ling task.
>
>
> I tried to do the same with by adding my own task with 'addtask patchso a=
fter do_install' but that is also having some issues while calling that tas=
k and that is not recommended way to do it by Richard.
>
> Is there any way I can fix it or disable these checks for my testing?
>
>
>
>
>
> Thanks,
>
> Sundeep K.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177868): https://lists.openembedded.org/g/openembedde=
d-core/message/177868
> Mute This Topic: https://lists.openembedded.org/mt/97113152/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

