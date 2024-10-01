Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D540ACEB2D0
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 13:19:09 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.81540.1727788741643142746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 06:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qf1MfRP6;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.181, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e262e36df27so648813276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 06:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727788741; x=1728393541; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTMBU6Ba5cElukdd50U1gIq2+7S4HDGf3BIftH4WZrc=;
        b=Qf1MfRP6Kwc3MjnwqnctH2ATlwawmYKXnP6eDcBT5H5U0opxG9XkeHRx36ZOBXNo1u
         7G2tlPWgWHqw07MYPXUAh+/4L2PtRrs1p5JjhPpsZfVEHsUNQAFlXc+Xc9fN4TEi1MbB
         NTHvP5LTgaOmpN3w91+c9YlAzDlZWJXfxLwcmm8orWsBJYQ0X7oxu7XqjRKEAmcjZBAG
         0GaAb6BSS5qhXojEfQom6akIAq51gBZM3DP+7Mx85S2tbxI1r1DOLd7a7P4wT07ZSEqB
         5zmjVSX9Vb9xnQTVC+GQZjyxrPRtPMant3iAFeb2mXKxtcgbKu9m4p/MVsRDC59XNwwH
         DkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788741; x=1728393541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTMBU6Ba5cElukdd50U1gIq2+7S4HDGf3BIftH4WZrc=;
        b=htcjJcPgGL7OfHUFuQqndH7GGGmEzsrFiZapErXCiAk3qOcBVgcU3u3XQbo0IId8Xs
         sKjhwZg4JJWedTAjz5Vv14SiQ/8kBcHUvzy8YF1CAV1OMJ7898o9ftvoxL/rJK3OOME8
         vCYuEZX6nBcmICGgY8BMt4HCONi5RADVNIGgjarOxKML8OkyW2ZZe1xdKQY+sCNdmN6Y
         Xe8xt0UJkQd4rvxfmCYCy3RfsKZcaaXQjH7Gv/am1ix9r/U3/lRFibuQ7P98eAF2bFJE
         P/HYOMcJOHPkDlQCtSnFB/wbwfg1DKvIA9I0yA/66sBQZhZSMyWOPG2oRSEFAHOo9Idc
         wKAg==
X-Forwarded-Encrypted: i=1; AJvYcCWswwkOZzdVtxDdz9fP9rfMGyR+sydcH4wSdz50LSD+kaFUIDxkBYGW0P8SRDJaTx+3ikSLzes1jjSpIgLsG1ADcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfZNJAIgoLuC8+WWlmicB4kJCNcV2hD1dIT5E12Aox/pQi4DBI
	ywg/GxcIEi73TwVXGFRxgV+jTM9gtp1Sxj/A6VKdO3hJSH5B6ocm0g80obENTj8vmBT+1stQfra
	1m0Rq9zbbPI8jf8WMgFcBkjPfIrxiw2vZLQ2Hqw==
X-Google-Smtp-Source: AGHT+IHSMDUh7FphmyGqYS6oa2u1MmPhMD+wyDxOsSQwupWvAk0bMCneZ5oFsTCPifz618xC5t5fNBUYlEfld86fMQE=
X-Received: by 2002:a25:bfc5:0:b0:e25:cf7f:9dfe with SMTP id
 3f1490d57ef6-e262c07f907mr2589901276.23.1727788740581; Tue, 01 Oct 2024
 06:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240930115332.925080-1-purushottam27.kumar@lge.com> <14d65aee-6981-4c25-a6f1-23022ee5ff6c@cherry.de>
In-Reply-To: <14d65aee-6981-4c25-a6f1-23022ee5ff6c@cherry.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 1 Oct 2024 06:18:49 -0700
Message-ID: <CAOSpxdakThdRHkaZ0JVRXeH7N=+CPnLE+YJ9sDQsh=c9CWzL_Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v3] kmscube: Add patch to fix
 -int-conversion build error
To: quentin.schulz@cherry.de
Cc: purushottam27.kumar@lge.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 13:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205165

On Mon, Sep 30, 2024 at 7:30=E2=80=AFAM Quentin Schulz via
lists.openembedded.org
<quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>
> Hi Purushottam,
>
> On 9/30/24 1:53 PM, Purushottam Choudhary via lists.openembedded.org wrot=
e:
> > On some platforms, `EGLNativeDisplayType` is an int instead of
> > a pointer, in which case the void pointer will raise
> > a `-Wint-conversion`.
> >
> > Add change as a patch instead of updating SRCREV .
> > if we update SRCREV might will get compatiblity issue
> > with current gstreamer 1.20.7 version because SRCREV brings changes
> > which resolves negotiation issues encountered with V4L2 stateless
> > hardware video decoders when using kmscube video playback option
> > which has gstreamer dependency requirement to 1.22.0
> >
>
> @Steve for some context:
> https://gitlab.freedesktop.org/mesa/kmscube/-/commit/4961a04b4a434aefbd41=
2eb24fb76998036eaaf6
> this is the problematic commit not allowing us to bump kmscube further
> than d12ba659695631e7a22dce8fa5d0bc576a9c2241 (or we do, and revert that
> patch instead).
>
> > Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

I'm fine with this version of the patch.

Steve

