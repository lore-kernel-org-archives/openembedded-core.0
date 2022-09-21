Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9ABC32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 13:38:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6522.1663767525695093055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O/SJ9oM1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id s14so7952696wro.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=3/wXlsDByMf2Hg6hO4sRxw1Hr2vVqETlPkxfaUmSMb4=;
        b=O/SJ9oM16OFejLPcALhilTPzaNevLyg6afO5tHpRjIQdtQf3fif1R26AvhJLTOslu3
         Djo1XLC1JJIWNegOlNkhuCEKbz1ha7Emkz5OtGuHZUwOaK6FCCfQ8Qh45qjs3O3RhDF1
         O3P+nm3wPgQ915B+W8ZWAG9+Ls0D0Ub0OhPRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=3/wXlsDByMf2Hg6hO4sRxw1Hr2vVqETlPkxfaUmSMb4=;
        b=YuzdKEIdtag8Be5OCApe4PM2s3Z5cvQ6WsBhM9q/Znm1tiw3GaRtan+LuuczbNTqKd
         /mMxrbwwPHLXwW4qHeNDKCX8mkIshuGEvKUHw9uS8rmBspqvA/zAG83ENBp3m6DwlO3S
         56Xc3N3uL8bLrw1yl8eaYf+lg0RcUMx/oIq5qcpRemaDH+K3KSGhIv0CgajKJM4xHbr1
         NIIGVKz4l7CfdBvVDFrUIBcMPw2ikZZaCOqLh7T+IMfRaG/FX9bPTlH71O/n1mc4cuyi
         +InuFDU2vEQ6obJQ6Chs0/FBkYMdrwilZa81a4Pm3ym5JGm3upFPwMfINXtygsmb8Fee
         jDNQ==
X-Gm-Message-State: ACrzQf1SqwnJ2+ktIAzlUqWcAEQGrIErM696Dcm8P2IMEptQnwawnTjW
	y5vrJ7Kmpje45M3iTExQTr1pBQ==
X-Google-Smtp-Source: 
 AMsMyM7iG6EnZ1lhjCeK2TYTK6qW7vKRRwr+3ANJwjfT1DDDAG+UpNHTh+ViB4yRKT/OPjI1izeLlQ==
X-Received: by 2002:a5d:4442:0:b0:22a:e096:9039 with SMTP id
 x2-20020a5d4442000000b0022ae0969039mr15762013wrr.304.1663767524152;
        Wed, 21 Sep 2022 06:38:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b663:b06:b4c5:e314?
 ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 x12-20020a05600c2d0c00b003a6125562e1sm2940640wmf.46.2022.09.21.06.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 06:38:43 -0700 (PDT)
Message-ID: 
 <23829f12dfaa55631dd7783d7a4c8846dbfdfe23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] gcompat: Add __getauxval wrapper needed on
 aarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2022 14:38:42 +0100
In-Reply-To: <20220921022332.3890912-1-raj.khem@gmail.com>
References: <20220921022332.3890912-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 13:38:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170951

On Tue, 2022-09-20 at 19:23 -0700, Khem Raj wrote:
> Update SRCREV to bring in few bug fixes
> Install a .so symlink which could be used during linking
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Symlink should point to base_libdir not libdir

It still breaks:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5884/step=
s/11/logs/stdio

Cheers,

Richard

