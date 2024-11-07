Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A858D4336A
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 14:34:35 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.73234.1730990066178220136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 06:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GYXedHA5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so945722e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 06:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730990064; x=1731594864; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7uKFQTLq8ONjteyOba4VJ/b815WNIrFfxhWPyxwYQI=;
        b=GYXedHA54XM6dmpxKzzo6pRcV6opIhjfv4AX4KU9KtO2eILq3CunaNlNHhPkpQKLur
         1aS8nPzlD/xkfilVhDYtbArvDWDJXBO+LeaAHCKaxGWtXm8YbEoU2HYIKHwp8ZKuY1Ww
         07mPN/a/ZKF9cmROfr2KJHBGk7IT5ke2pNAEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730990064; x=1731594864;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7uKFQTLq8ONjteyOba4VJ/b815WNIrFfxhWPyxwYQI=;
        b=FMIox6fIldRB5vvViRiC6H6m/bloVyVRScvDgqOXpCEw7YmOP5ww6vgkdOkYycRY4f
         NKPzEtE5HqHmk4+tpx6Cu9z6a9KGM4DexhIA/tRfbeSOE/3EGj2A0mGrgtXwCxSWGaRs
         kZ6H5TpIFcYthqjrnR3DcGr7YSzsLe6s02hm4bb+aWgsq+gC9y45P//I2SWi0jMrOpbP
         KrH+3QkxijRinBPdvh/9eC7S9Ac3vsgdjKV8sACUiscGUrAZMiXDaaaesYYUQHigFacY
         520IUEXfF2xydrqfgfEoq7/OeTRYhwqVhivAheG8v+NKYpyWDqw7X6LdQpu5HBT6R6Bt
         y6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUxjPZoSLTNL+OJ9KsjK29pN6LdnzJ8S7tIfeuZp2JEn+aR03JTdQvFMsU6pjoG0oZ0zrLtaznDrVRbIWORfWOUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGeQFaFaCSdfKStrLdezRM5UmR690aYQ32qIP8CIyltCDM0xDw
	bwmAiEt1bWWUnJCamrxxY8pmyTHaAQ/kzNOAKxgPQSyauFWnHCUOXRZw23zT/vw=
X-Google-Smtp-Source: AGHT+IEfr/Y9xfUOkzOx+cuk6Qrwm9uwat+PawZrQY55oSBn+i9NcWUotQsoJTgfnc+uBQW+7qT0kA==
X-Received: by 2002:a05:6512:1092:b0:53b:20a1:1c4a with SMTP id 2adb3069b0e04-53b34a19077mr23050010e87.42.1730990064082;
        Thu, 07 Nov 2024 06:34:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:26bd:4c7b:b843:5a5b? ([2001:8b0:aba:5f3c:26bd:4c7b:b843:5a5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054b3fesm26203015e9.17.2024.11.07.06.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:34:23 -0800 (PST)
Message-ID: <4b28e23a7849ad020eb75fd8914dc56577926db6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libbsd: fix header conflict for multilib
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 07 Nov 2024 14:34:22 +0000
In-Reply-To: <20241107024327.1354616-1-yi.zhao@windriver.com>
References: <20241107024327.1354616-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 14:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206835

On Thu, 2024-11-07 at 10:43 +0800, Yi Zhao via lists.openembedded.org wrote=
:
> The cdefs.h was modify for time32 and time64 respectively in 0.12.2[1].
>=20
> Fix:
> Error: Transaction test error:
> =C2=A0 file /usr/include/bsd/sys/cdefs.h conflicts between attempted inst=
alls
> =C2=A0 of libbsd-dev-0.12.2-r0.core2_64 and lib32-libbsd-dev-0.12.2-r0.x8=
6
>=20
> [1] https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/32d18dcf47a8ac9=
f0e21b787bc154f8ca72dbdd8
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
> =C2=A0meta/recipes-support/libbsd/libbsd_0.12.2.bb | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20

Sadly it isn't this simple and has been discussed before:

https://lists.openembedded.org/g/openembedded-core/topic/105817273#msg19919=
2

I'm open to ideas but there are challenges here.

Cheers,

Richard

