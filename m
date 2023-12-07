Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4BDC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 13:23:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.83421.1701955379561302698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 05:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JWutY/Kr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so4624035e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 05:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701955378; x=1702560178; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yzAGpUrYDfYvaPwOo1QWp5vPEvRNsiYzI3EHmdkJMeQ=;
        b=JWutY/Krb7sIjNaJ3r6H49/hRXn3mgpiMhMUGWVxH11ozx5U/XLfSr+WbSRqq/litA
         jS2CcwZ2WzIC1I3FaqsuF08wI1lsD5wDCM9v3ekGUtTudlNUWcXhlVKDmImfN+c0HNBx
         9oMubyttJuyEpkgnS955PxAc5NcO0Wz0l0+PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701955378; x=1702560178;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzAGpUrYDfYvaPwOo1QWp5vPEvRNsiYzI3EHmdkJMeQ=;
        b=W+qEXEebt5ZfiaM0omd1uicDbl67c81X/hEXzsFkXB45kGP9pwqWeG5EZA9XxqS9yd
         2FKbQOwdB0WEo5Xl16sH5ARYjTAVWSKGuAquRvRC+Tgf6rvh7+G48zYnXoMsagWg/uMf
         TKtWMdOQTAD/HBiFIx8Z03nXMUgz/wbccF70MYIJ0g5MKtfT3xPKpu0vCdvAxL+CzyJZ
         0z43qUSXGTBc7tefYXOjf7ciowzR5wEA4hN2ERn51xcRrGG+R7fNZ4R749oJsBSA0bN8
         +9zdSYcjH2d4mpasoeWrCGbjn4NX50N7ckxL6bKA0dPhwIsZ/hoWUyNnz18VArfcdP97
         /aeA==
X-Gm-Message-State: AOJu0YxonY1eEhP6kthIY1w659DTjUV24myEW+Qtk6VK3KXh9OWSq1ed
	rMq/q6HNFgKSgiRtD17xAhs69g==
X-Google-Smtp-Source: AGHT+IE6H2X8HH4aiOT9xOONN5SjFtW8bnsGRLROMdw75juI5ngBF5FrTRmYeb8Ey5Ulv3TVF3nu5Q==
X-Received: by 2002:a05:600c:364f:b0:40c:7a3:8606 with SMTP id y15-20020a05600c364f00b0040c07a38606mr736765wmq.326.1701955376264;
        Thu, 07 Dec 2023 05:22:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:30b4:b44a:2cc6:3876? ([2001:8b0:aba:5f3c:30b4:b44a:2cc6:3876])
        by smtp.gmail.com with ESMTPSA id az15-20020a05600c600f00b0040b481222e3sm1961062wmb.41.2023.12.07.05.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:22:55 -0800 (PST)
Message-ID: <00ccaa59e55541e3294acdfe532379985a3cd22b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] useradd: Fix issues with useradd
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, =?ISO-8859-1?Q?Eil=EDs?=
	'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 07 Dec 2023 13:22:54 +0000
In-Reply-To: <CANNYZj-yakHq4q+TVONzN2GyYc8jxhC3Jb4hebbekKXv9WbJfg@mail.gmail.com>
References: <cover.1701952927.git.pidge@baylibre.com>
	 <1560cc968f5f93a925cc3ba9436f13210dc4e4c5.1701952927.git.pidge@baylibre.com>
	 <CANNYZj-yakHq4q+TVONzN2GyYc8jxhC3Jb4hebbekKXv9WbJfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 13:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191953

On Thu, 2023-12-07 at 13:58 +0100, Alexander Kanavin wrote:
> On Thu, 7 Dec 2023 at 13:45, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in
> <pidge@baylibre.com> wrote:
> > -USERADDSETSCENEDEPS:class-target =3D "${MLPREFIX}base-passwd:do_popula=
te_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-nativ=
e:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroo=
t_setscene"
> > +USERADDSETSCENEDEPS:class-target =3D "${MLPREFIX}base-passwd:do_popula=
te_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-nativ=
e:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroo=
t_setscene ${@' '.join(['%s:do_populate_sysroot_setscene' % pkg for pkg in =
d.getVar("USERADD_DEPENDS").split()])}"
>=20
> I'd like to clarify: do all these recent fixes mean that we can also
> add dynamic library dependencies of shadow-native into this list (it
> becomes an issue with latest versions of shadow currently not in
> oe-core)?
>=20
> Specifically, this commit
>=20
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-ve=
rsion-updates&id=3D9fdbe321fa53785cc35bd1bb4054366383ef20e5
>=20
> doing
>=20
> -USERADDSETSCENEDEPS:class-target =3D
> "${MLPREFIX}base-passwd:do_populate_sysroot_setscene
> pseudo-native:do_populate_sysroot_setscene
> shadow-native:do_populate_sysroot_setscene
> ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
> +USERADDSETSCENEDEPS:class-target =3D
> "${MLPREFIX}base-passwd:do_populate_sysroot_setscene \
> + pseudo-native:do_populate_sysroot_setscene \
> + shadow-native:do_populate_sysroot_setscene \
> + attr-native:do_populate_sysroot_setscene \
> + libbsd-native:do_populate_sysroot_setscene \
> + libmd-native:do_populate_sysroot_setscene \
> + ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
>=20
> has been rejected by RP with the suggestion that shadow should be
> linked statically, but now I'm not sure if the argument still holds.

After my recent change, we could in theory do this as bitbake might be
able to make it work. It does run the risk of circular dependencies and
these setscene inter-task dependencies are *horrible* in general from
an sstate perspective though as my other comments about these
dependencies leading to poor behaviour still stand.

To be clear about what you're saying above, you're saying that if any
of those native dependencies are missing, we cannot use/install the
sstate object. We have to defer installing that sstate until all the
others are downloaded and available too.

My preference is still to statically link shadow to avoid this pretty
horrible side effect.

Cheers,

Richard

