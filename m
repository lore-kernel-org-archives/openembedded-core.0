Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D858C4707B
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 19:21:42 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.26280.1704828096962141625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 11:21:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WBY+Ci94;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6dbcebaf9a9so2121910a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704828096; x=1705432896; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry+yKJoFdP7PK+xxT4cL38VIlAO+yS03OxSzmxvb7F4=;
        b=WBY+Ci94sW+tprjev4E7LBjVugVuQC4bHoWdJQKhS1ED/ox0r3JdB//gxTVQ4lOK/z
         x+ACjkTSF2is9gRpmLfLc631RzLHmlRCbWEJHzR+oDWpkzWeBVpCS1nuQjfY5fpdZNIR
         nPN6RBYEireFJB+/F8pD2QC1VNcNe4MdIe2UNgNBozri5RgXpETHVZirfWdXO4UTR/zt
         exjB1fdpXwwr+MGYC1DMiWDFKUuk9h/Nv6yYJ/5KyC3h7qzWhmCfnK6K0IMyATB3eeST
         taFC1ToSR+LmTCkeQHh93Arq/9xRYyU71Olw3HQtb0xA9rqBfbu/zpoiSEbARjwlvjfx
         dJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704828096; x=1705432896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ry+yKJoFdP7PK+xxT4cL38VIlAO+yS03OxSzmxvb7F4=;
        b=mWEIg9YgNek79khGSeVGJnafAJljrnCR5impNI8BXuqXdDqbXnTEjQSeO8qgExzN0O
         zqk4DAIfgqQ0HNfuAbqnzlD7YIoSpJ+yofHWLk7f65aFsg7i5/nqlzoWKP+lOD1ZBwue
         WUF3uhelCUYPAnGdnAsKaxxV17ioR4nHfUz1RgkbJVX8dmjwlUz7eSxkww33bFVqwzsu
         jSEvhYH7Q3akZsM+bqYcsZAM9VkNjdr/p0AiOiesU17a/SpXABTSSghpBjg9trFEVaR3
         eNeUejnzz+g4HbK06M76avjIsHXxkJi3aHIMWVQMX4w1IsTV0tehruAotFIcUuIy1vMR
         1GGA==
X-Gm-Message-State: AOJu0YyOi6EC7rG7qWBH1Vkbl6BCRsovaph38V/C0drcN4X8vK5NAVM6
	GapsVityOB9rP5Fp00GiGwIFVGytBwybxBn1/3M=
X-Google-Smtp-Source: AGHT+IFdH5U0loGyMAYcmM8GI33lteqsNvGtZcjR7TR+WjW6yFcyQZ7QFsPXgjrGgncmQyNMn+GEls9FlsZy+foCC1Y=
X-Received: by 2002:a05:6871:a001:b0:206:3ab:581a with SMTP id
 vp1-20020a056871a00100b0020603ab581amr6345772oab.112.1704828096197; Tue, 09
 Jan 2024 11:21:36 -0800 (PST)
MIME-Version: 1.0
References: <17A8B0DD7AD4D31C.21327@lists.openembedded.org>
 <PLXZ6S.UNFZMOJ43CYT3@t-online.de> <CAMKF1soVHRa7Ksw5jtkedFQuJzM08tEzK-810p0RtGmKe_YRMQ@mail.gmail.com>
 <X3D07S.A0X5NA8SN0Y53@t-online.de>
In-Reply-To: <X3D07S.A0X5NA8SN0Y53@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jan 2024 11:21:10 -0800
Message-ID: <CAMKF1sq33sL35xazmQAGG58LM7GwxpRM8TRzp8DWGX6wkkSzNg@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 19:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193480

On Tue, Jan 9, 2024 at 11:10=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Tue, Jan 9 2024 at 08:38:32 AM -08:00:00, Khem Raj <raj.khem@gmail.com=
> wrote:
>
> Is upstream also switching to use cmake as primary build system ?
>
>
> If you are speaking of chromeOS, I bet they use cmake
>
> I had a look at what linux distributions do. Archlinux and Fedora use the=
 cmake build system and also Debian provides the cmake config files in sid
> https://packages.debian.org/sid/alpha/libwebp-dev/filelist

OK that should be good enough reason for us to see that we can use cmake to=
o.

