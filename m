Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE5DC001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:25:28 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.15085.1690982725757204532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jXZ6eNAk;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe463420fbso3071101e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690982724; x=1691587524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tzo7EHKfCN0EsoGFgyRv44AygWXM7dE1+kcqAJ36ZsM=;
        b=jXZ6eNAkIP9WOB9lnMw9U9VdEMPRZk9XElzrrju7DdmGrgcgrL5p+cLLh6IlmY79r6
         88Ws4+YH3a0PRFLHIxPROJpHLkZQkcM6a5sV0fxjuDPnXzS4AWHwo19YqoVVB5wOWVBS
         N/VOwwT6OnB561HxQZTze6NXVtyrLfL033GlQTTcjXU7tVqxSyaNmsQIzU/qhvL2+Jf2
         nMtE6W73wJ3jWSk5bVkMCXrP820BSYjVx33y7DsdmhsAl5Uai0ZWMGrAJYNnyByqjQpW
         BBWsVbZoNnQ62qyOer1ele1caBPw5LIfJnHL8Lve3BVAloTWqJoKLw2WCTiF4EhC//GT
         0S7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982724; x=1691587524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzo7EHKfCN0EsoGFgyRv44AygWXM7dE1+kcqAJ36ZsM=;
        b=LZBBNmIDwRPteIzZ4mGG4+BuBYh//ApuXCV0OIoW5oM/pTnoPDxDtP9K01Pjoc1qQu
         ZZxlK/2AETc5o5l1ynOXZiLDC2DE4McbpnpaN2Fb/uf/RK9AXsMDavgHuEPXiSimu7b/
         pUEfOgxv/G8np/3KZvLA6EJ1LISb9KfmhkhHLZEExhaTA5emzu0ANwoN/LovikA7yAWP
         mMk+GWkKulH8q/whuumTUZPp58GnSvMBpu3xI3meZIl0ZK0Rj65007qFgu2qsDyd1YUn
         cg8y6f48n1yPOBIG7jqf+TkJPJ1RmFu3ep//0UsGxKKL1A9y9kumeI1SP/TNgBdi3N0U
         jyFg==
X-Gm-Message-State: ABy/qLbNIgHMBvUccN9Ep5pwpo1FYNRwi7OqxV5N2TZjx/Ys9ujDefSS
	CdK1P6hCFryyMPRtWtGab6APBw==
X-Google-Smtp-Source: APBJJlGsYOkpKjdxxza70M+5aV/BCrgGOIQ87imUOhabGQGT2x1eKaaZWqvs7BYdW3OOEkx6TV7ruA==
X-Received: by 2002:a19:4314:0:b0:4fd:fef7:95a5 with SMTP id q20-20020a194314000000b004fdfef795a5mr4154771lfa.11.1690982723774;
        Wed, 02 Aug 2023 06:25:23 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id v11-20020a056512096b00b004fdc5557a70sm2943706lft.141.2023.08.02.06.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:25:23 -0700 (PDT)
Date: Wed, 2 Aug 2023 16:25:21 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Joel Stanley <joel@jms.id.au>
Cc: =?iso-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Andrew Geissler <geissonator@gmail.com>, mdmii@outlook.com
Subject: Re: [OE-core] [PATCH] kernel: Don't fail if Modules.symvers doesn't
 exist
Message-ID: <ZMpZQU+duutoPL16@nuoska>
References: <20230802114705.90137-1-joel@jms.id.au>
 <CA+cAkeqRRNUyPxDZrk_3kkQCT2xbE72S5vxrZ_VvHH-xcEB2YA@mail.gmail.com>
 <CACPK8Xd1DqL9WoV=kwxDO3bzcBEB_KhH-1oKhKE2xoqZzX9a-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8Xd1DqL9WoV=kwxDO3bzcBEB_KhH-1oKhKE2xoqZzX9a-A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185396

Hi,

On Wed, Aug 02, 2023 at 01:15:34PM +0000, Joel Stanley wrote:
> On Wed, 2 Aug 2023 at 12:45, Fr�d�ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> >
> >
> > On Wed, 2 Aug 2023 at 13:47, Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> The one liner tests using `[ ] && action` need to have || true after the action,
> >> otherwise the line returns false and the recipie fails.
> >>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >> ---
> >>  meta/classes-recipe/kernel.bbclass | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> >> index 247ef4a48aa7..f1bc41e82be8 100644
> >> --- a/meta/classes-recipe/kernel.bbclass
> >> +++ b/meta/classes-recipe/kernel.bbclass
> >> @@ -486,7 +486,7 @@ kernel_do_install() {
> >>         install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
> >>         install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
> >>         install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
> >> -       [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
> >> +       [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true
> >>  }
> >>
> >
> > By doing that, you simply silent possible error of the action after the test, below is a little snippet showing that
> 
> Sure. But the test is looking for the file, so if it doesn't exist
> then the command install won't run.
> 
> I can't think of any realistic situation where install would fail if
> the file is present.
> 
> > I think the origin of your issue is that the action failed , having the log of kernel_do_install task would help.
> 
> That isn't the case.
> 
> The issue is the Modules.symvers file is not found. This is expected,
> because the kernel does not use modules.

This crucial bit of information is not in the commit message, please add it.

Then, I think there are better ways to detect if kernel modules are disabled
completely. See for example kernel.bbclass line 430:

if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then

Cheers,

-Mikko

