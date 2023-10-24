Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4EBC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 17:00:01 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.153184.1698166793274608121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 09:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxslyRmn;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-57d086365f7so2797085eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 09:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698166792; x=1698771592; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/W7r3cVa8VNDDYvKKLF6zuofD+dxFyqp9hr4+gNalQ=;
        b=XxslyRmnKLro5c1LWyzSgryALMduEMQCFZyOPGVuaB0y8gqObw76bb/zuhM0msaZCe
         cmOwz6AJKMmZ+CdMagGzbyK82EM5hekSoqwKB2/hCtoFcFjHop69npk3EEu7LiECA+zD
         oiTWSPLII9FdYSeRl7TMuiWsnelvas08otkDmz2W4F/eHlvzh1LNF5atx6qtTQzASpQH
         5/prNbsxwZf+O7AJRH7uTyQ0S0sP+zesptO+wSuLHbpgcIAdHoOYn7iSaQrBMVayaCZi
         cc6ijnAnKH9/36Qh8wLcz55fZBXdzom9OIeEEriuS+bg+/4gna8XZghIPrRUghYmS18C
         vT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698166792; x=1698771592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/W7r3cVa8VNDDYvKKLF6zuofD+dxFyqp9hr4+gNalQ=;
        b=UlqjcEm0V8DzDqfvM/HJRd+sW7J/OX8CYBNGcnwe8ioh4b8x+TRoy+s8fSgz9ahdJ6
         ouhJE0TcMQbP+M7DZyJ6+3QLYLKGOB71qAN2TskgWdLAqQ2L22tP3gznXzUPnJ29ALWS
         ISaiGpv1TdtxqRsikP0+CBYu7mQjxj59N5xkuja8QYYlWM3n2nDqrXgXmMaat8Pkr0Jq
         airal7usbNvua3GY5VhJRZa7snyfedd9ZYxcp5nrWytLkJeLw8rPw4k+Ghpen+OBS9f0
         Ss7P4Dxf42GdFnbnPwedRam9xDD2rBQMYDANpPCKaZXML32KTBV87ytVvCfkjlAN8Tsd
         tNdQ==
X-Gm-Message-State: AOJu0YyJtG+Dbso31QZi0/M8i8pfgvOQ9nR6Y6ug4C0azbWkNzsOJuZu
	SniG7IOt8Y1QbYYr3o0ILR/+4n9hfEYYrKBza7w=
X-Google-Smtp-Source: AGHT+IGgOlnoDrecX6wJTJnY1XBW+g4zK6VMRrdfOuMxXySlivXZEamDLt3jG62HsoTav4A2gNV2mniBGx8wGlU3F/M=
X-Received: by 2002:a4a:d85a:0:b0:581:40d0:7166 with SMTP id
 g26-20020a4ad85a000000b0058140d07166mr12502722oov.8.1698166792467; Tue, 24
 Oct 2023 09:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231020124450.9736-1-niko.mauno@vaisala.com> <20231020124450.9736-4-niko.mauno@vaisala.com>
 <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
 <d96313a1-5ed6-4ea5-977f-84c21ba0c37f@vaisala.com> <6190e445-52d0-441c-b105-809429c23f3a@gmail.com>
 <befadde7-70bf-4042-876a-f00377aecc4a@vaisala.com>
In-Reply-To: <befadde7-70bf-4042-876a-f00377aecc4a@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Oct 2023 09:59:26 -0700
Message-ID: <CAMKF1sr2Ycin4yZ6Dg74OBH9fvaUDTGXN6r50RdM8mzuuvxqUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] package_rpm.bbclass: Support compression override
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 17:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189654

On Tue, Oct 24, 2023 at 5:49=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com>=
 wrote:
>
> On 20.10.2023 19.34, Khem Raj wrote:
>  > it seems you are quite sensitive to size, I wonder if opkg backend is
>  > better suited for your usecase than rpm.
>
> Hi Khem, thanks for the idea. We used opkg a few years ago, however
> certain technical reasons were in favor of rpm which we have used since.
> Perhaps we have a bit different view, smaller image means for us
> spending less time building, booting and flashing firmware (i.e. not
> just disk space consumption alone).

Using xz certainly is slower than using zstd so it certainly will regress o=
n
your first consideration about build time. booting is perhaps not
impacted unless
compressed file system is used and you are changing the compression
type for that.
flashing again is subjective, if you carry package metadata into
images it might matter
otherwise I would think your images with opkg or rpm should be about
the same size if you
include packager into your image then opkg might be slightly smaller.

>
> -Niko

