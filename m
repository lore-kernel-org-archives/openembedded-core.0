Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51691EFCE3D
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 19:33:30 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26982.1772652800383298093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 11:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A3EpxNYp;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899ed41208fso78449176d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 11:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772652799; cv=none;
        d=google.com; s=arc-20240605;
        b=khRSutjG9GyIhsdLEnE39sj0MTxAutIunNS8ySHBsv6gbhJrEEMn6wUVDDLxVK4kCf
         s2seVA5Neow1gjnpI4pUvbSQEhRnynDUb6Tjv41fv/h1eaQUwvISy6UlzWfyrWBO/LvB
         oRKqX6XG7BYJTaEve3BQj+m50r8Wxw/ozIlli5j+QECkO/NEgQU/8Qmz7RiWa4BSpNMH
         7BluY5pRygCH6d4m7m/XRW06U4u7VxPRKdY2lR2NRxlANHfydS/rhwpM4Zq6rF0qKCeB
         KrwWCGQh6UhiBNbXosOX1PMxBgRgwtpZgdl+45GH/RjllaF3zkUp16+aQF//KO8mNXAg
         O0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nnlOWtmgz56g1J2If73hVpd+SDbqSi8fpHXhOmKIM8k=;
        fh=Y2p8TMVAOR/EMkY898gTcONSB2LIxK072vUfnIEMc1s=;
        b=SmXPdmsqcZifr22wnYgathE4IMYO62z9ddQKRV6pGwxZTh993NfkK2jLbTd8ekrozl
         yKTJe3uZ72us+dvA7lnXbusNNQXeeLA6E7cNLws8Ku4wFUgDSrc7vuw8zBWhMnP6nm2T
         I3auDImOF9mcFOpcm0jfLQVFtNrrEaZ7Oy/Xl8UjqzEY0lpBTWXpSwRYyzJ4e9gVIich
         zhNBAzNNXtHr1i14oSO4r3KdavoJgr1APwjtVXMTR4emBrEKcMBk3tvHfuUbQtfbTJSD
         /fOHKxAlcTZ5J1WwwWS6u8CJ+mxkX0yzbU5R3asocJRZb6L5T3asJvmlZHJNblf6DbbX
         VBcw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652799; x=1773257599; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnlOWtmgz56g1J2If73hVpd+SDbqSi8fpHXhOmKIM8k=;
        b=A3EpxNYpZxFaKvt5FhZnIx3ctB8Qk7sYJ3zSyPvqs0sqFwiQUpiznLq6Va34aMS63H
         /If404butjKDGdYvYkuxuKBrpkEi44f1bQ69uhZ6zTXcqfexvmgCAsk2aSnLVHIJ/TI2
         vIdt0JapuBMlOe6xiez9VWqIjS98YTWM1miuD2FyuP8Q9wkqkaWR/mVegq81pzgXWCWD
         X7POA8ajkV0d+DO0D/7Q54FzIH9zY13PJ62U7ERuMWY9tPF/ugsBqxkizLKGmFtEE8Ch
         wiIfJIWdpiTFIa28BbnF0CCzZnti/DaOBlVMD+G5SVA+yBtd/FOPyAJwhHj9dVo4DJqW
         cvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652799; x=1773257599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nnlOWtmgz56g1J2If73hVpd+SDbqSi8fpHXhOmKIM8k=;
        b=xVbt2J9eBjmbzu+TQbbkkof7BuRElm/zFzeI1mHQPd4lY16iYRykjndw8/08M616Uq
         bTRWTlciHsW5Yi1R+g+ESlrmLiLPfzRCUO/RV0lDFDiuVQWun36ctZp0QhjmrKdNY77y
         dNTnQOq5DNcd5X3yNxP0FcQWkrmxa6XycNBKBzg1mbTC68poo4jAG83kfjv6dEBwFH6W
         dIcE2fonZyHVfVHp7GrwDNQYlpolTCRSeVtHOflR7JVM0rzXS3lf098CnMvD/qQn6hce
         8v0dNfZhaPuF9Ws6XeXr+eXAsowxbZazb9Q+eLU2SLz8xepapdzfpanmbJ1jrehy0a7P
         cfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2zufUCqfIaniy7+OrmjZsLXC5EX1znBOo7uNvYmKszNOt8P+srmBzy2nTSG2yuKnorrGN/9yfdB/8cAqAkacYtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxk7nWHTnOT8XO+oqs3rLaf2n7gYuQA0AgRGFYpMMvJIGU4zH0s
	pp7tPuT7t1DNUqSmBS0Jd4MASlUP0SL6Lo6dtKW89hkdiiDCa+Hnnbkm1NW2FLa23QYsQjSTtkq
	oQX1Oblfvfo7SRKLOAwVmlc0ApI/NPXU=
X-Gm-Gg: ATEYQzwlso5rNSZkDsoLSVhl0V2ZH3ISi33SDOq+KPJdKSuhnncOYVR1bMgcFC0iEO5
	La9vEj9SLH64642py/VGCNcj1OXUGzjB4TOgTcp2oY72H2wd6yvBbZEmvgQMuRCn8b4yQKMLDpg
	IebeatvuJSlLUqZb2EyoMDj6EXKV2jXM7D2W6M6p+iEe61dlF0QVKJD8jW46iZ7vOBX0/5f91Zr
	8kE2j21vzOlEPDyLCXS3kgGpEVB8mqdU7mHeUAEpzdJitAEgSWsx16ZIvy9di/3j4kg7U30CoJb
	ETiaq6EZG1aEUUdiTMdBkuhjMWLEwMScmORrhYWvXA==
X-Received: by 2002:a05:6214:2a86:b0:899:f2ba:9d7a with SMTP id
 6a1803df08f44-89a19d21684mr39438176d6.39.1772652799279; Wed, 04 Mar 2026
 11:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20260304103203.1649-1-wangmy@fujitsu.com> <DGU6LGIXFAH7.3NWXCBMVFRKMC@bootlin.com>
In-Reply-To: <DGU6LGIXFAH7.3NWXCBMVFRKMC@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2026 20:33:06 +0100
X-Gm-Features: AaiRm536aRWAFBDm5oMFr6ig9zga55UlaTaBvj6viVQvO5ITwrn5cEeDxcTFnTM
Message-ID: <CANNYZj--kiqDdV+_-qWC1DVegq98nPbkGVTdf5hP8U6yrX6jbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/10] gst-devtools: upgrade 1.26.9 -> 1.28.0
To: mathieu.dubois-briand@bootlin.com
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 19:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232438

On Wed, 4 Mar 2026 at 18:41, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
> It looks like we have some build issues with the new version:
>
> ERROR: lib32-gstreamer1.0-vaapi-1.26.9-r0 do_compile: Execution of '/srv/=
pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-l=
inux/lib32-gstreamer1.0-vaapi/1.26.9/temp/run.do_compile.2061462' failed wi=
th exit code 1
> ...
> | /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-poky=
mllib32-linux/lib32-gstreamer1.0-vaapi/1.26.9/lib32-recipe-sysroot/usr/incl=
ude/gstreamer-1.0/gst/video/gstvideodmabufpool.h:53:24: error: unknown type=
 name 'GstVideoBufferPoolClass'; did you mean 'GstBufferPoolClass'?
> error: unknown type name 'GstVideoBufferPoolClass'; did you mean 'GstBuff=
erPoolClass'?
> |    53 |     VIDEO_DMABUF_POOL, GstVideoBufferPool)
> |       |
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3295
>
> Can you have a look at the issue?

I guess the correct fix is to remove the gstreamer1.0-vaapi recipe, as
the code has been removed upstream, and there's no 1.28 compatible
version for it.

Alex

