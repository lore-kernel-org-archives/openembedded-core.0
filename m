Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35491C55825
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:55:07 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.15173.1700060098192999220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qq1zPDoJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9e623356d5dso773635166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 06:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700060096; x=1700664896; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZCTdowPhfaPDDozmONzNDzuoREJJqgu6OJA45hU/24=;
        b=qq1zPDoJRMEKDkcUuLG2h67RXVh9zgr0AX2Tq+bgtfX8zFnQj+dH8RV49/m389rO5q
         TZJTK1ThfD0M546d+lzgjod8AFge8oWTOF17tBdHeDzoSALjj5o6OJFGAMMpKFUD958o
         crVXHzV5uR7a1FpyZ5xQEUpQjPDLyk31FwIJ1qLrUPZkMYWHLUNU0hTyXJK0Nm5flZMt
         xlqdV09PQLhsVJWdZKKGnA0wvlInAyFReL/vt6sYpocZ81GG7Dy4VoEBfV6QGFxU9Ekl
         84jvuZ6Lsq7FbLRnbwyqUXs38d+/YSS8nTAPqwDHGe78xP0w4Pb882V5kmlkc46/Ks8E
         FOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060096; x=1700664896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZCTdowPhfaPDDozmONzNDzuoREJJqgu6OJA45hU/24=;
        b=BOZ+4IjGcmDwdYXHRW2g7dPSlUN3DJxVt8Eg1o6+V/SeWYVvn0FS+KFDCvBRP4u/76
         Mm4VBx8TNlgTznk8HhowtLW1+cNfTkHVQu5b0nsBosRQnOunneQeTqZjZO80gVIk1603
         WBkh/2xGy0Ibq7mdRcSCBzRVvgbiO8kKVsrzQNcv/zjjQBFdujY4YJKt6asR38WQA9q5
         +OuLCxyNBGi/rXYQGfZBAJlLw6XfHY/pIPtXQMnLGUSLH3SH4aYE9TVRZvlC66EopZZU
         6n5PhsssA1Q6TP6feKjyxFTjmP3hTZpxaGQMTeJEMSqq9FhK065I9UfhTv+YtrV6oVu+
         0+3w==
X-Gm-Message-State: AOJu0YyfurJS0QlInurKX1T5HeoM3B1wFpFcS9PVVXJs5kX4zqZKpLPv
	2NohmV+Gn+fj6LrWaFJZ8NdZEIOrAjN2+OQnE04+Dg==
X-Google-Smtp-Source: AGHT+IEv+U8qLzp6k5zi8n9UvNwzFFrSXO/gLJivnz6Os5LkbE05VKmMXS1fTOcyskhOcIfBn/ewFIbiONk0IA5RIk8=
X-Received: by 2002:a17:906:2a41:b0:9b9:f980:8810 with SMTP id
 k1-20020a1709062a4100b009b9f9808810mr10785131eje.34.1700060096474; Wed, 15
 Nov 2023 06:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20231114063501.195289-1-pooadire@cisco.com>
In-Reply-To: <20231114063501.195289-1-pooadire@cisco.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 15 Nov 2023 04:54:45 -1000
Message-ID: <CAOSpxdaagGq6jwpOXhRpArKXF_BiF8VoKUbBa4FSF=hiAogKvA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH] qemu: Whitelist CVE
To: pooadire@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190732

Rather than whitelist, the upstream database should be corrected.

Please send an email to cpe_dictionary@nist.gov explaining why the
database entry is incorrect, providing supporting links.

It is always best to correct the database in cases like this.

Steve

On Mon, Nov 13, 2023 at 8:35=E2=80=AFPM poojitha adireddy via
lists.openembedded.org <pooadire=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Reason:
> CVE-2021-3947, issue introduced in v6.0.0-rc0
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2021-3947
>
> Dunfell utilizes qemu v4.2.0, Hence whitelisting the CVE.
>
> Signed-off-by: poojitha adireddy <pooadire@cisco.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index e6b26aba88..9734a9719f 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -167,6 +167,9 @@ CVE_CHECK_WHITELIST +=3D "CVE-2020-27661"
>  # this bug related to windows specific.
>  CVE_CHECK_WHITELIST +=3D "CVE-2023-0664"
>
> +# the issue introduced in v6.0.0-rc0
> +CVE_CHECK_WHITELIST +=3D "CVE-2021-3947"
> +
>  COMPATIBLE_HOST_mipsarchn32 =3D "null"
>  COMPATIBLE_HOST_mipsarchn64 =3D "null"
>
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190487): https://lists.openembedded.org/g/openembedde=
d-core/message/190487
> Mute This Topic: https://lists.openembedded.org/mt/102579083/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

