Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C0DC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 16:44:00 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.27404.1706892238051285399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 08:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PPa5C9dz;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a35e65df2d8so314507666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 08:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706892236; x=1707497036; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9j2/CsEz0xge+tEFkpfyLXlNS1Jsn75+zURgrikvbcQ=;
        b=PPa5C9dzofkyQOHX/H8MxKHLzxWdQFmu8tdIk0UXTrqSa6BHq3U0Jc6zscQrW4x/X9
         RKt7Bnpxj5juuNker9bsrc8lQP6+nBwtk3EqSuvBuQFwChKBFeiuwY4ybgeDbHQWm+mK
         iYjfMJCjC4yUfwA7f4xpx3OTQMaON458QoNDAxY2x9EQ5xvA3GEz9pJ8w1evfhkkomuA
         7a7/1mgrB7UUIok6X3kCjTvfKM2txwr8ETKJzpV8AsOHZl8inMRAKmEH2O+8ylCjV0eC
         mUHxgoWTtv4B4+/q/z3ik+GbkWkapsqlKlOoMlRNEWfmNxf9Esh2aYMAWPBGMTXiZl9i
         1WIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706892236; x=1707497036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9j2/CsEz0xge+tEFkpfyLXlNS1Jsn75+zURgrikvbcQ=;
        b=Dw4kAr9tjPpy05mS/HsBsikWeBvmMvzW2yXPcUixzK8MC/jfId4kfC3hsbgGGbnoJn
         +i93b2X8EGyEHUxtwTdQ8ACXk+JprpyxfUB5ahfYrK2MtECWMV0Zx/Y90tziczZTLvpR
         ctk7T9SOXpOF70dj+zK9vEUzx6F/ofLDpRJtp844WyP9nh5YRThWbEz6840zpTThEFPo
         8T6WD8nNkAJrxcmUTnbzDoZA0bIgYsoGj6RjctAhTQIRc9LPlu5xdR5RglDLDFGqslqE
         B39XNIwfUw4IrUdXQpOmo28ab8hmIHwJh+oWZzDe3QJKfIUSezr2kVnOPRAhV9P9sn+6
         cZvg==
X-Gm-Message-State: AOJu0YyVh0Zfae1Kjmi9bZ7K5/oExgoBZotpMrq4eA0FSHJeT+rBZbLW
	a8EAl0ZCmtBHG9BB/ZsxwjHu5ymOfY/2egl3XnbFJ+c5DI0MKvZpKVAhqPWiYKVBedxXJR8I+dO
	9Aw/J+9dV260n6sEfb1AEpxHQf9yhSuV3pKtm/A==
X-Google-Smtp-Source: AGHT+IHIQnSyEQQzkBaJq/XWTGjdfnOtGSVXw2FbBVkQ7jxICMUIe4HxEZlDRmo3MTgERQdBdCbnQd6jJ9/rOWzVK28=
X-Received: by 2002:a17:907:36b:b0:a36:696f:3e20 with SMTP id
 rs11-20020a170907036b00b00a36696f3e20mr1806873ejb.66.1706892236383; Fri, 02
 Feb 2024 08:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20240202120735.3742584-1-Deepthi.Hemraj@windriver.com> <06967e71-38e7-45e7-99c1-952bf1e95696@windriver.com>
In-Reply-To: <06967e71-38e7-45e7-99c1-952bf1e95696@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 2 Feb 2024 06:43:45 -1000
Message-ID: <CAOSpxdZ7N9Wvdk_jG5sQzweOhiQz-O1auxwmryON+E9hD1TH0w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
To: randy.macleod@windriver.com
Cc: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>, rwmacleod@gmail.com, umesh.kalappa0@gmail.com, 
	pgowda.cve@gmail.com, shivams@gmail.com, sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194810

On Fri, Feb 2, 2024 at 6:38=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2024-02-02 7:07 a.m., Hemraj, Deepthi via lists.openembedded.org wrote=
:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Issue: LIN1022-4854
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../binutils/0035-CVE-2023-39129.patch        | 50 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2023=
-39129.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
>
> This commit fixes the version of gdb internal to binutils.
> I had forgotten that binutils carried a copy of gdb so it's good that you=
 noticed but
> our binutils recipe disables compiling gdb or gdb-server:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/binutils/binutils_2.38.bb?h=3Dkirkstone#n21
>
> And from a mickledore build, it seems that we don't install an  binary wi=
th gdb in it's name, as expected from the reicpe;
>
> =E2=9D=AF fd gdb tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packa=
ges-split/
> tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/gold/gdb-index.cc
> tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/gold/gdb-index.h
> tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/include/gdb
> tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/include/gdb/gdb-index.h
>
>
> Added Khem in case Steve isn't sure if we should be patching the internal=
 gdb in binutils.
> I guess it won't do any harm but it is extra work that we could just avoi=
d.
>
>
> If you need to re-submit, please do so with a proper shortlog:
> You have:
> [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
>
> It should be something like:
> [kirkstone][PATCH V3 1/2] binutils: internal gdb: Fix CVE-2023-39129

Given the number of open issues with this patchset I'm going to drop
this version and wait for a "V4" that addresses these issues.

Steve

