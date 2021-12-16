Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A977C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 20:06:11 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.1790.1639685169622710432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 12:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=Q0zm2NOv;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.169,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f169.google.com with SMTP id z9so386944qtj.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iRWil/VLVDK/Tnl0gxe2Hn4s8UWWz3Abna028/Q4q1s=;
        b=Q0zm2NOvt0Nl/odwgr2cpQihcvVGg1PO1de7aTDlhXG4imvZQSpySdLf3yJr1Jpcio
         ZzM848VpzCIHfAvk/uQ8IV5XTyLxkdk4MPW83P+s7XDGFbh0+uoOh/jrHxmYJKVErYk8
         ipZ2hwNdSEq/LAXFq8tLWyzvhJgBJXGrD0mJiFmj9dwbXNKDNxzVOMpqMgeiFy7USdgW
         IPUsAscyt9p70EBHi14RGEd4r1VCMDQ0jgsN90KIFc936hjxdtrvX+01cykjfG5qhAeh
         IeCdAJOIkG1Vk4JG6cwrcPX+9U0XQYQEcZlDz1w9fjBCck12NbEDitrWVVD31HGZ4EKu
         ZYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iRWil/VLVDK/Tnl0gxe2Hn4s8UWWz3Abna028/Q4q1s=;
        b=EysedO6dEXMEexH7qk9HxFMCBhFQBJdCwFlo33xTI6Z+7eONCWPzzEv1VlMG29e+Ys
         agKFp1OkIg9VQTkI0iHzT0mVJSrKX9qjdAbJM11Rin3zMbThNjB7qkChtL5VCdI9sqQ9
         5kBDk9eedP6EGvYCYS7PfyRdAHbK0TWQyD4ZjQj4ghWGpCX8MbL8sLbqpzNDs78XXEIt
         9n2d/ECM6U9vo7IcmnHdFSzYwh1wv6D9pxWv9VSCjI1aIiJb4CPioHHuL4C2/PKCIa5G
         SenArsLur0b//U3O5nt6CET/BNpJOy64RP5VZprIPG9YFo2JG6BCvsM+BLVLUMTpBufu
         JXJg==
X-Gm-Message-State: AOAM530vdjgSJpdXXqvScDUtpoQz+8ZCNaGxgeUUAlVCDhxWVyBIR6+b
	mvToGnrT/Md0FWHvG5XO70U7QQKRBY71JInc
X-Google-Smtp-Source: 
 ABdhPJxh2TtygZ5srWhWt8Wi85oMGgeoQhwPRjS1/yNCN/D8HowrGBoEnVRt645IhF5dXV9LofQKvw==
X-Received: by 2002:a05:622a:1990:: with SMTP id
 u16mr18686302qtc.355.1639685168223;
        Thu, 16 Dec 2021 12:06:08 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id
 w10sm3594932qkp.121.2021.12.16.12.06.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 12:06:07 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f176.google.com with SMTP id l8so403193qtk.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 12:06:07 -0800 (PST)
X-Received: by 2002:a05:622a:291:: with SMTP id
 z17mr19173700qtw.138.1639685167017;
 Thu, 16 Dec 2021 12:06:07 -0800 (PST)
MIME-Version: 1.0
References: 
 <DBBPR04MB77532C73CEB549654929130EE2779@DBBPR04MB7753.eurprd04.prod.outlook.com>
In-Reply-To: 
 <DBBPR04MB77532C73CEB549654929130EE2779@DBBPR04MB7753.eurprd04.prod.outlook.com>
Date: Thu, 16 Dec 2021 17:05:55 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqky_Ybv-R1xM+QMgw73chMo46-_=oEEKtBKwATYvo8yQ@mail.gmail.com>
Message-ID: 
 <CAP9ODKqky_Ybv-R1xM+QMgw73chMo46-_=oEEKtBKwATYvo8yQ@mail.gmail.com>
Subject: Re: [OE-core] CMAKE_SYSTEM_PROCESSOR inconsistent in SDK
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: "Patches and discussions about the oe-core layer
 (openembedded-core@lists.openembedded.org)"
 <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 20:06:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159804

Hello Tom,

Em qui., 16 de dez. de 2021 =C3=A0s 15:55, Tom Hochstein
<tom.hochstein@nxp.com> escreveu:
> A colleague notes a cmake problem in the SDK due to CMAKE_SYSTEM_PROCESSO=
R being set to 'cortexa53-crypto', which the package doesn't recognize. The=
 package builds fine with bitbake because CMAKE_SYSTEM_PROCESSOR is set to =
'aarch64', which the package does recognize.
>
> The value for the SDK comes from this commit:
>
> https://github.com/openembedded/openembedded-core/commit/4143f3b0ce0d0c52=
f5b0babc1bb16ac0ac9610eb#diff-68a2f5f7520be29f69417255d4067d5e97b8681596cd8=
51d946d241c8a1dda76
>
> Is there a problem with this commit? Or is there something missing that p=
revents 'cortexa53-crypto' to resolve to the more general 'aarch64'?

I believe this is indeed a bug as the SDK and OE environment should be
consistent. I think we ought to fix the CMake SDK support so it is
consistent on both environments.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

