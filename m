Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5CBEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 15:23:27 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.1353.1687533797481615808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 08:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mb9NCCzX;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f86a7a5499so1027482e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687533795; x=1690125795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbKMj+ucJu03YaQW2Vz0fqqnqBLnCq8gxapOaIqvHK4=;
        b=mb9NCCzX3Wl9PoCTmXJOORnprZDzooWyAY+gsRxoE4dqQbw/WELcuEJD4aRBdoHryL
         WxSDez+v/3+RQsbjbJ3xbo4qlK0mwTFkR+1NhZ8r/wmPbY7W76ngss6wXdA2PhpyFN2d
         C9sbQQIRgxKiwxDnJb523QKTv9hcx8KhCIoqr6H4NQnlSpZDF8XlruYfDUvPJ+nmNLlj
         +Ohy5plvmYEdozaMmtFQjY7LvOQMlhCeXE1QpWKj4t7FLhtVgNykg9pPdgepnp4MbAVx
         Sq8//6RnDysBjdDTY9pD6FlNUQwV1MoNuLMZDQuEFDIWUK6t3P+pOEY4yj4WMK38QwiM
         YEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533795; x=1690125795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbKMj+ucJu03YaQW2Vz0fqqnqBLnCq8gxapOaIqvHK4=;
        b=W+YF5vdf2dqWtXIVW6orlUFtQUYJdymL8xu25zRMZ6p7wq3hyMyMgtyLcQz2jRQE/7
         hZVO39dnwSKMLtMRoafD2LPjvy9cLwZCNdJtIXadr4TIWTdQPqBBl2ULRzC54ng9iKZP
         t/QjyPPlunz7v8ndPRITON0c/JCoj9bBCCkpIvU6guecZu3QkpfFfb2e7V7W1kiONB3r
         cyE+mFehzRWQDIInNciceqxRqaB4vWbhRRl1oe2PGby+ExhOhexxzGeHP+4Vy9+Xgz/a
         aR0/4El/zeneGXkKL/h+VwE0EGxcfcSFPMkkI9Cpfscd5JfhTH7lnD60CraHJ8gCJhdO
         nMWQ==
X-Gm-Message-State: AC+VfDyLQnN/F/uDUsvOBGML6u91IZz87qTWwn0ZPRfXymb+O5c5h/oc
	glyKbyGuaPwrtiORlzwmnAy6Xrsyu5OtasbX0E0=
X-Google-Smtp-Source: ACHHUZ7Z9+4i8UMAY0mWEeb1Dc0dZp1jJ2/W5AAb7ozA/WXaZ/9l6hskjVr/KhJeDYwc15N6KBWBj3Vs2fsQAMrXV70=
X-Received: by 2002:a19:e044:0:b0:4f8:75bb:3301 with SMTP id
 g4-20020a19e044000000b004f875bb3301mr8695470lfj.20.1687533795354; Fri, 23 Jun
 2023 08:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-3-maxime.roussinbelanger@gmail.com>
 <CANNYZj-pa8CDzKEU12OxYpAqXG3z+ptwoW90pZ6Ps=h2p+YQKw@mail.gmail.com>
 <CAE=T-s7EzA1J+F36TqZJ2soXKUkT4r4AxctP4JNDe1snYFW9_A@mail.gmail.com>
 <CANNYZj--pKA7ASdohuoOmrOwK+UZAJPS1WsFVcbqRXEvw+3K-Q@mail.gmail.com> <CAE=T-s5zCTKjZ6g6-J_dUYjJFrL5AK69Y-dRtmdA+=zeXcCUyw@mail.gmail.com>
In-Reply-To: <CAE=T-s5zCTKjZ6g6-J_dUYjJFrL5AK69Y-dRtmdA+=zeXcCUyw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Jun 2023 17:23:04 +0200
Message-ID: <CANNYZj_ykQWmvhk0SEv9UNpVDtR0wG+brpd5T35azq1YivqGEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 15:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183332

On Fri, 23 Jun 2023 at 16:59, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
> If user wants to install nativesdk dgb/src package you need to add that f=
lag,
> so instead of modifying the `BUILDSDK_CPPFLAGS`, it should probably be
> documented.
>
> Do you have any pointers where it could be documented?

The Yocto SDK manual I suppose?

Alex

