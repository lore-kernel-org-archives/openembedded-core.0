Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0407CC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 16:16:42 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.930.1652199395736821813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 09:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UbhEcKY+;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id l18so33946754ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ee4jGArwLwsZ9l3F+4sxNmhjLNMgr76SD9srJ9WcYoc=;
        b=UbhEcKY+QZl579i6HAagRRu0w29+oS83s2H1M/7jSFYCy5dtPU9bx++p0X954heo0k
         Pl/rZYwhTGyzLaqel7uh0RXjzR7fYIO/rEV/NuT/iYA3IyEJGXuG9PKI5Hn9Jx5b5MSx
         MrQcSQKT1EteF3WDQz0kPEdyn70ncEdRmnvAOPgifzgYRbTmIoLX0RG0X3OmiDc0HuCj
         7KZ4m3jn8WyuXNQXfrY5u3jyjf9SOr7/LgK9De/zlAbGj/uXtISdk5csWaHbQ5QHn2/c
         hI+F65jO8MbKyrsqeDxEBYqWTQy22JTxP8aEXuTjO1jv02iHTMi+CgZDyERz6Nmh2NYX
         QXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ee4jGArwLwsZ9l3F+4sxNmhjLNMgr76SD9srJ9WcYoc=;
        b=Ck2NCwF4EuqxrdO7iV+Ngf9LzotjYXFD7JDct8hVun8tkGYU7P1rQ0hzlBjF5a4KXf
         7qWNPkQeC7BTw1NPsbdLpd2nUAjCSC8+6fwoMIyLN5YPJP+GT+S0Ne76n4/g3qwIyyp/
         QCTPCvU8tJXJgBeMe9qzLD8MNfd2lCJDmyKEgDvwC88CmamPFZVcfJvvdJL7MLpesQ0t
         l5vE+SGtnayXwroRGlZ7ftB0hXcCbGlHirdQFKjD0zRTAy7LDtx+3lwFhAYbKjmiTpZl
         rv2H6Tw8q6Mhw8zxk2kKI/bI8muqkD4J5IrnjwGAD5aAv6NGD/acOfpmFten6sG9oFk4
         3i6Q==
X-Gm-Message-State: AOAM531B7/C9GlY7BdxmiD79HtAwRdW03ttTD88XxCQy1CkFSjT6EivY
	853wMuGbISNfxe670zplzhkkLTt9+ML9Z6ss4QZtOg==
X-Google-Smtp-Source: 
 ABdhPJyLUOPviSEDb6XaC75GcRjU6LuaUwXAOTdHFq05VgS+8EMQQXPSBx7YliyT9+6moc8vqxps2g/Jd9f8zGePpdw=
X-Received: by 2002:a17:907:7f14:b0:6f4:2a57:e1df with SMTP id
 qf20-20020a1709077f1400b006f42a57e1dfmr20472112ejc.18.1652199393932; Tue, 10
 May 2022 09:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220509062438.12448-1-badganchipv@gmail.com>
 <21438.1652195156118038664@lists.openembedded.org>
In-Reply-To: <21438.1652195156118038664@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 10 May 2022 06:16:22 -1000
Message-ID: 
 <CAOSpxdZ38+0orzUyDtu+TOD9zWSC0d0SwALggH9gqpMSXfrFrA@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] libinput: Add fix for
 CVE-2022-1215
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 16:16:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165464

On Tue, May 10, 2022 at 5:07 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:

> It seems something is wrong with this patch and also in the patching tool=
 within Yocto as well.
>
> When I apply this patch, it is getting applied cleanly, without any warni=
ngs and/or patch-fuzz, which means the source code should reflect as per th=
e patch.
> But when I go to the source code on the path "build/tmp/work/<architectur=
e>/libinput/1.15.2-r0/libinput-1.15.2" and see the file "src/evdev.c", it s=
eems below two Hunk's are not getting reflected.

Yikes!  This is quite concerning.

I can confirm that these two hunks are not being applied.  I also
checked the hunks before and after these two and those seem to be
applied correctly.

Looking at your CVE patch, it does seem that there is an extra newline
before these two hunks.  I tried removing the newline, but the 2 hunks
are still not applied.

I then tried deliberately malforming the first of the hunks to see if
it was just being ignored for some reason.  However, as expected the
patch process failed at the malformed hunk, so this part of the patch
is definitely being parsed.

Will keep looking into this, but would appreciate help from any
experts in the patching process!

Steve

>
> @@ -2469,7 +2478,7 @@ evdev_device_get_output(struct evdev_device *device=
)
>  const char *
>  evdev_device_get_sysname(struct evdev_device *device)
>  {
> - return udev_device_get_sysname(device->udev_device);
> + return device->sysname;
>  }
>
>  const char *
> @@ -3066,6 +3075,8 @@ evdev_device_destroy(struct evdev_device *device)
>   if (device->base.group)
>   libinput_device_group_unref(device->base.group);
>
> + free(device->log_prefix_name);
> + free(device->sysname);
>   free(device->output_name);
>   filter_destroy(device->pointer.filter);
>   libinput_timer_destroy(&device->scroll.timer);
>
> Can you please check this from your end too? If this is the case, there i=
s a serious issue where patching is failing silently which needs attention.
>
> As I have seen the patch in the testing branch "http://cgit.openembedded.=
org/openembedded-core-contrib/commit/?h=3Dstable/dunfell-nut&id=3D6a31bfaee=
4d715f31e69cea1eed05484d9d7a999" I considered to post this email as it seem=
s you also did not get any warnings/error during the patching and even comp=
ilation.
>
> Thanks,
> Ranjitsinh Rathod
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165459): https://lists.openembedded.org/g/openembedde=
d-core/message/165459
> Mute This Topic: https://lists.openembedded.org/mt/90983830/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

