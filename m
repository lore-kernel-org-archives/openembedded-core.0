Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F98E9129A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 14:50:01 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22380.1770302996104621077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 06:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=igE4VcNW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4362507f0bcso418044f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 06:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770302994; x=1770907794; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oww8G9TjPDJRMekQLDVi/ranr81yQOWYzOMyFy7KsJ8=;
        b=igE4VcNWiagtMomyl8l0JljLeNmxDU2Gwg0nXWIUXFcKWW1jaltLSHzhQCQTK3Gwfm
         qHckvOMLF1ilzZ9Vsmh6DTw0Y6lzkLPsB4AFbq32R/4GlkI6Z2hHNkibgQKp9xahbkWU
         lH1DdmQwq6KfpKr+fhoCoQgC733awCEL8K0yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770302994; x=1770907794;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oww8G9TjPDJRMekQLDVi/ranr81yQOWYzOMyFy7KsJ8=;
        b=FNjcgcMHLJf7Xd7BIUDoBwwFYGKF/3lvWSD/r7lUBD8sjq+nzgSqzof9zTPK+pednN
         +u1Nv5Uh56xKkIadiiPluH3H12vQTnHjVGhkP9Awc0hqC2fpHCI9YVX+nNVuHZKWge1e
         hasR7p2kRDFT+Muz5nwQ3AZEYXb5GqF4+QCKW+p2sEpM8uGSkqJs0eaF6uGAZo3BO5U5
         a/IE1FYxnG4rIQKD2X6U0RWfmH3ZJBF/740uisHNEvphRxkpawhz7E/6L0/Z2zlCtwFy
         DfiACoq92w7uydUZoybyJHrn3zDbsPVJffw4vSAUU3LM5odpMri0YE8dxqREasVmAVOa
         h14w==
X-Gm-Message-State: AOJu0YycAza3ouQMeVGyPzmXm/SapWH1s1j9MPzdTgb7bhIE/5acW6Z9
	LvMXAGdsVC10AwdeEOODTysPxIMPGE1qFFmJ5ndGdjxHoV8tWojyX79Tahgh3/nSAK8=
X-Gm-Gg: AZuq6aIRjeFzkX7OSkdnWuBHdMWvBFVIT2vfmamig3qwgrFkVPX/U2W8TxkiXmDd0qE
	lhRxnmKB0HkzDF+sOQBklccG/dfQdSnMcykBVXRDKhrVt7rLVNeRHJM0pqkZ8+3S/OZgVVWOpsO
	RVKpZBOWrG+AKoAoOlhjNOA8LMsqZBFIEqg735w9wN062e+kr3/HIfxyM9TCWTqX0wWNs35DQda
	pnTwLutsfUzplocvVC6hWsC163lhKn/coOxrf7CFJqVK2UdnjSg60xEqUHnLLUIljM3Z43qZbMH
	RiE2knEAYect3kN9Bia1LAbBGmCPL+e8UC7nk516g0oA6ueGEbx2zakCXLvQPVmGTHV4gaQfA+H
	h/f3XcfgicGcUZqnihor8BI3+HIRD29elZm8AjfIVPzTkjAZAkyOtCRufqdxIlbT2QE9BwpdUC0
	cH2Ed4TY+zgP2SYOfDwMkxMQidINWUGmLk/Cu42dijbbhbQlq+kDB3YBaQUEQRql1lN2GPxhcQm
	Uo=
X-Received: by 2002:a5d:5d13:0:b0:435:a43b:2dde with SMTP id ffacd0b85a97d-436213dfe91mr5177682f8f.15.1770302994430;
        Thu, 05 Feb 2026 06:49:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:118c:e754:4fe2:20ec? ([2001:8b0:aba:5f3c:118c:e754:4fe2:20ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805f8c1sm12129436f8f.37.2026.02.05.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:49:53 -0800 (PST)
Message-ID: <450d9841bf6504e9f457b9b627006b9bdca25228.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES
 set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai <kai.kang@windriver.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 05 Feb 2026 14:49:52 +0000
In-Reply-To: <968e666c-590a-4a08-99ab-fd4147251855@windriver.com>
References: <20260204020908.864912-1-kai.kang@windriver.com>
	 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
	 <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
	 <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
	 <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
	 <CADkTA4Pr3GFrZVM6LLQ-ATL-y+YFybjtgtcVMrgYrUKnDeSo7g@mail.gmail.com>
	 <260247994ff827c43a775d9f549dacb073e60f5f.camel@linuxfoundation.org>
	 <968e666c-590a-4a08-99ab-fd4147251855@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 14:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230580

On Thu, 2026-02-05 at 17:08 +0800, Kai wrote:
> =C2=A0On 2/4/26 23:53, Richard Purdie wrote:
> =C2=A0I agree the warn conditional isn't quite right. I think it should
> > be:
> >=20
> > if [ CONFIG_MODULES not set in config ];
> > =C2=A0=C2=A0=C2=A0=C2=A0bberror Broken config, CONFIG_MODULES not set
> > =C2=A0=C2=A0=C2=A0=C2=A0exit 1
> > fi
> >=20
> > so it is basically a sanity test that the config is valid.
> >=20
> > I'm a bit worried about what I'm missing though :/
> > =C2=A0
> =C2=A0The original problem is kernel config_modules is disabled, then
> external modules such as lttng-modules can't be built.
> =C2=A0
> Recipe lttng-tools RRECOMMENDS on lttng-modules. If install lttng-
> tools into image, it fails to build lttng-modules.
> =C2=A0
> Kernel config=C2=A0CONFIG_MODULES couldn't be checked whether enabled or
> disabled after bitbake parse. Then there is no
> chance to remove lttng-module from the dependencies. That why I check
> the config during the do_compile and do_install
> with bbnote and generate empty rpm package.

That is a bit different to the problem I thought this was addressing (I
was coming from the rust patches angle).

In that case we probably need to have something like "kernel-modules"
in KERNEL_FEATURES and we check in the lttng-tools recipes if kernel-
modules are in KERNEL_FEATURES. The kernel itself can then error if the
feature is selected but not configured and lttng-modules can fail to
parse with an error if it isn't set?

lttng-tools is not useful without the module support.

Cheers,

Richard





