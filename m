Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B73D1AD54
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 12:51:17 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.21801.1729083071296527760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 05:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xPxylAb/;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e297bd161e0so761652276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729083070; x=1729687870; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+RHwyQbDPaEE4rGa//Wc2PNyW8QouxXZ6a6UBdKe58=;
        b=xPxylAb/i38QaSp+0g/9WiASGqmBekdRU57DXxwbHnE+nctInMCPtn6hppiyX0blzK
         oIhFN+5gw9cJAeIe7iifbYjhTXjnWqHv1zxtUxoDDM3ZzZfb8WRVWzpIyN7haEDrlN6j
         qWQg4+n9AZh70JAkO8cBEtQGdys+L/iaE0CFe0AVbM4OK/wxacYnVzkuv2zPLBcibzHp
         mdA6CjAlXWMwR3siA/YvbCYdpaNUzbcFOW/cL1kYx4/UjiSILgVsNpKU8jyUHaC2fmNo
         C968VT1H0Y2gA3cr86hJh46GfCnDOIIh2Z2R1Z7WM/wPhtFPEJBdP0Lg8c3c4lpZNfvj
         FJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083070; x=1729687870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+RHwyQbDPaEE4rGa//Wc2PNyW8QouxXZ6a6UBdKe58=;
        b=kk5qsTigGuyd+IvOhM3hoWH6C9cqsTKJV5F0wnMwUirJJm//19+rYQsxG3Tdja61/6
         ll9rznhkWumxrfbNa2s6U+zlzdvAPT5icsgdxvZ4O8xqL78isUXoRlEVgXMQi4E0X3F3
         aTr1+QFFnKXSZE/XX9hj8SqPGIL5G72JPy731Ohh7ngk0FJmB+DlGoT1y8dGg5nRtFT4
         nqF/Jy+9Oy3V1E8TFN77aW333PI18/wq1hIsFBYqL52tWAWGAQFHnR/N8VWXirSAfmjr
         rydlI9xm8JPZsx601Ji3YC8qKapkBV1EsDJjBJ3uAVbZoHpB4ueTU7yR0PHajSO/GG+k
         bUgA==
X-Gm-Message-State: AOJu0YxyigytUrDJuu9DdysAlSXYUkJlkk/7jLRlkMbK9wxN5gysxRGx
	j/m909yNY9NzcozCLawlN2/Hzd5c/y3SlQWS0IcXeN9e461nHgXo+uw8FktlDI3A2YbxiCagwMx
	PCmI1rEOcl2g3gv4tZ34yhDC4OvumVtblc86g2g==
X-Google-Smtp-Source: AGHT+IGkFatYgpKg7+PMsg6I8boEueekycDFepmzwPQcmHaojPNARu0ONjbxcP8al5JvzRwieVn0GngJZt9ENFiaCFQ=
X-Received: by 2002:a25:d0d5:0:b0:e29:769b:453a with SMTP id
 3f1490d57ef6-e29769b4a30mr2929076276.35.1729083070437; Wed, 16 Oct 2024
 05:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241016101644.27269-1-mail2szahir@gmail.com>
In-Reply-To: <20241016101644.27269-1-mail2szahir@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 16 Oct 2024 05:50:59 -0700
Message-ID: <CAOSpxdaDk4kp_jwX40qmSDkSxmdaScwbwNNEBweAmXZAQG_nAQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ffmpeg: Add "libswresample
 libavcodec" to CVE_PRODUCT
To: mail2szahir@gmail.com
Cc: openembedded-core@lists.openembedded.org, zahir.basha@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 12:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205966

Could you also send this patch for master? Since the issue also exists
in master, we'll need to fix it there before I can take the patch for
the stable branches.

Thanks!

Steve

On Wed, Oct 16, 2024 at 3:17=E2=80=AFAM aszh07 via lists.openembedded.org
<mail2szahir=3Dgmail.com@lists.openembedded.org> wrote:
>
> Currently, CVE_PRODUCT only detects vulnerabilities where the product is =
"ffmpeg".
>
> However, there are also vulnerabilities where the product is "libswresamp=
le",
> and "libavcodec" as shown below.
> https://app.opencve.io/vendors/?vendor=3Dffmpeg
>
> Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulner=
abilities
> where the product is "libswresample libavcodec" as well.
>
> Signed-off-by: aszh07 <mail2szahir@gmail.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> index 1295d5cdf1..022220b58f 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> @@ -186,3 +186,5 @@ INSANE_SKIP:${MLPREFIX}libavutil =3D "textrel"
>  INSANE_SKIP:${MLPREFIX}libswscale =3D "textrel"
>  INSANE_SKIP:${MLPREFIX}libswresample =3D "textrel"
>  INSANE_SKIP:${MLPREFIX}libpostproc =3D "textrel"
> +
> +CVE_PRODUCT =3D "ffmpeg libswresample libavcodec"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205961): https://lists.openembedded.org/g/openembedde=
d-core/message/205961
> Mute This Topic: https://lists.openembedded.org/mt/109041180/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

