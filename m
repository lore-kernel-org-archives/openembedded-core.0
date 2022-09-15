Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2653ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 11:26:51 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.8868.1663241206584171079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Dj0hgtyN;
 spf=pass (domain: linaro.org, ip: 209.85.214.172,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pl1-f172.google.com with SMTP id v1so18034582plo.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=XP+zV1TbabraFAMfyrzlV1n/wDq2hWJj6fFxzL60hJA=;
        b=Dj0hgtyN+DVO5mRbwdpkL0lVocQiscU1mHk82xhoL8AaMgurm2g936j6tye4HTJ4y1
         jpN8qQoMq9JWPogWhDg9oMcLq8QC0i//fazNRH1OReY138ug7i84MTa/1a/S+aczDSzC
         ITF0DQMS/yLfhC1XWDZJhuTEUYOBHYr7kyjhSuiRXiRFSiYri4S6pTef4dHL/jA24KuJ
         DCrcMGaGztvszeB9uqxZ1WKvV8TtuKdxn1v92Y28MCKrJnjZXTCO0rgEUcLgd27TdM58
         KOrOegxq4D43HfNLdGNlYSZVsxUPF86VYihWsm9T/FzDTJOFyIB3+ZE8c8madT07x+Cu
         C7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XP+zV1TbabraFAMfyrzlV1n/wDq2hWJj6fFxzL60hJA=;
        b=5YRCFJEuh6J2bFZYoJndWvmfYrtIEpIzLHvh266xHu2m15q1ii2P7v9UwxIrAyslxW
         y9wewsfeQH2BcM+IXCyLdQjYVCp5BlKA1kkl8w+n141gk5fbUon4omjftf+SmhuUSvXl
         S17mED+WdOCLn10U8doKdlh/rc/XnuBqFM6v3M+Mjuu7ik5wNPMlpQjO5lBAQzMmEhsZ
         t/G5nMciS8Fq0sgXcQ0wV6bqxqHdW/OjNpJ551Qg5vRUZ84wDxrRHRq9aC7oBp0sRdbH
         dQFVGDlBddAJ0t78urdeWf7Nit63XHVXJNdCA7p17LasZRPxwgy4kGyHkUnRJY9tf5Ze
         k54g==
X-Gm-Message-State: ACrzQf0Zp55Uu1GUEG48YYFXjzzTrHZ8Z0W4ykysWzkC3q0AgLsyMBl7
	MugsAEPFYULZ3IyCzsnYBvrKyLTm54HmWFo8AsI7sA==
X-Google-Smtp-Source: 
 AMsMyM5IDcEvqlYA2JdQkj1JfwqHIAUXEQ8R4CM+cd2ygyF3goxJIZYFUeJvt/sRdlW806pjMfTgC1JTydf4HsTqZeo=
X-Received: by 2002:a17:90b:35cf:b0:202:6f3d:53a7 with SMTP id
 nb15-20020a17090b35cf00b002026f3d53a7mr10389989pjb.63.1663241205992; Thu, 15
 Sep 2022 04:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
 <41221D4F-B1B5-4FFF-9F98-E8B4B8A035CB@arm.com>
In-Reply-To: <41221D4F-B1B5-4FFF-9F98-E8B4B8A035CB@arm.com>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Thu, 15 Sep 2022 14:26:50 +0300
Message-ID: 
 <CAJFpGrP11ifFQnK1n3MHvMUaJPwgh6igdav7zotvRQevX70vwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 11:26:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170691

Hi,

On Thu, 15 Sept 2022 at 14:18, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 14 Sep 2022, at 09:09, Mikko Rapeli via lists.openembedded.org <mikko.=
rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> > Found the root cause. As suggested on #pyco too maybe native openssl
> > was mising legacy support.
> > It wasn't but loading the on purpose hidden openssl legacy.so was
> > failing. It is located in
> > recipe-sysroot-native/usr/lib/ossl-modules/legacy.so and only found
> > via OPENSSL_MODULES
> > variable which wasn't set for python3-native users. These custom
> > variables are set in the native openssl
> > wrapper script and this also fixes the not found openssl.cnf. Now I
> > could send a patch which sets
> > the OPENSSL_CONF, OPENSSL_ENGINES and OPENSSL_MODULES paths for python3
> > users via python3native.bbclass:
>
> I=E2=80=99m glad this was root-caused before it was merged, because yes, =
this is the =E2=80=98correct=E2=80=99 (best known) fix right now:
>
> ~/Yocto/meta-arm % git grep "export OPENSSL_MODULES"
> meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb:expor=
t OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
> meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb:export OPENSSL_MOD=
ULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
> meta-arm/recipes-security/optee/optee.inc:export OPENSSL_MODULES=3D"${STA=
GING_LIBDIR_NATIVE}/ossl-modules=E2=80=9D
>
> A better solution is needed for sure.  At least when the certificates can=
=E2=80=99t be found you get somewhat understandable errors, the python3-cry=
pto error is opaque at best.
>
> OpenSSL supporting runtime-relocation with a single variable would be nic=
e, but iirc from glancing at the source code previously not a trivial chang=
e.  That said it does cause sufficient pain that maybe we just have to carr=
y the patch.
>
> Alternatively, we extend the magic relocation to native recipes.  Even le=
ss trivial=E2=80=A6

I'm working on the relocation patches but they are quite ugly, as are
the various code paths inside openssl
which handle these env variables and which fall back to compile time defaul=
ts.

Though I suspect that openssl developers may not want see the patches
resolving "OpenSSL_version" symbol
at runtime for finding the config file paths... But it's still better
than exporting these environment variables everywhere
to get relocation working.

Cheers,

-Mikko

