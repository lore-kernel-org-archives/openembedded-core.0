Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D2CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:15:06 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.6459.1741212897961855508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MHYwINwL;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so15551551fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741212896; x=1741817696; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1wZ9c4RDgkTavqKM/0Ps55Ls+BJwugYj7FvfmZfbmYQ=;
        b=MHYwINwLSetVHPKsCTpDulFrMwm/rl9Sw/X+ti8iafgmiQIOXB+bhnuUEWXPbc3m2E
         FEzVxI0HMtKG6DU/TMwRVSmPCfSuMZitktV14Ng2uuUU5qm7h3p35F3Ji68EFvY2j7Nx
         MJo1ajntivP/K2pBuVmb0sI9C5sKvPMx+zhbjxTr/pJrDv90ZVS+C15kIvHTKqmEDvxJ
         F+nDRPxIEFx4OECJ8e4gFT/x4L6ihsClyIIPU3wlmANWE8ZzwH4YbVjimjPsfmmPBAh7
         UVf+POOikgz9TvQWXzT9wwrZdEerkCHpru3uXztVsp6X7HkeCyQc81frvyGQ9Fekd+xv
         E/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212896; x=1741817696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wZ9c4RDgkTavqKM/0Ps55Ls+BJwugYj7FvfmZfbmYQ=;
        b=L2PD5CkCCZ9EwNTO7gEVAuMLosqC/DMOq8OvzkYD05+rIWyjmhWdk1vx9HqGtfzchv
         3gSo67DYxdyZKgnOWNdmphLMZxP+XFsqHI09YkyXU4STZd+e58MLrjZoiucVzyJdymxN
         kigy08MQzA0+bk9HZt+N9+tAWA6swtmULf8I+LBI7CPSVyLSLSw73POWQiiVmLyL3flb
         Kg74Kvl73Yigc1Tsb6VET0SL4h/lRmiPT7/WfcVh6yti77fHfTD9DgwCRAHoyObt8RYO
         jYdm9aFvq+AqeuJMaKdwy3nxZnZ8UEzn2GsFCd5sNjYE3T/2XhFa/tDdn6G7IoGSG7Mu
         /mVA==
X-Gm-Message-State: AOJu0YxQmMZeeka3qGZpMSHJvkTSgdTG1Vx870+kbKesiUyNINi7ox21
	g3B//1+yVbwAIRmCH7NNmfwpoW2FtOd6K+mPxKBLP9SmqG+SIdjlVbIYMtp/xuklLVv3H9OvDk+
	7OwA=
X-Gm-Gg: ASbGnctpdBhVnZNmPQ6UuesBgtplaZUJaUhf51LOs9eXQ8S8prFUzGx9q42t8pkQ5lp
	KwZ6vWNUzMQSlfAz6D6pxPVO7rhXcNKphwL/hGtBuU20/bv6HW+wruYFNX0ME7Wn7nSKzE9i0+J
	gLSBL7PBHYEFIt286PXj3Obv/W269isPsq6r7d2gAxjpqZYIdxi87rALr6pvHjH+w9JcxLEgmmD
	j6tbuYyQ6aLFpFfhJ8bVLGRp8exRNN0j64FbvhF9SYn7iwhKj/viud1+CX7ScrFs+VaA8nP1t9H
	ip5N1wlR6oxxq9AmHGDTWL9GSLqK8P27YGUdnXij/nm3plX9z+Mww7I1n+UDqKP0kIjqWeyeRXW
	skLasqz2geo5A4TVkApMuzF2E
X-Google-Smtp-Source: AGHT+IEd1QfZbGucfSzWjGvd9LrTOnryYj6T9r5rgAvL5uHsyqI4CpaojsPnV1owSUov+Jn5UJyNxg==
X-Received: by 2002:a2e:a9a7:0:b0:30b:c36c:ba96 with SMTP id 38308e7fff4ca-30be33e6468mr4085561fa.1.1741212896052;
        Wed, 05 Mar 2025 14:14:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bae18057csm13031211fa.26.2025.03.05.14.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:14:54 -0800 (PST)
Date: Thu, 6 Mar 2025 00:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Balaji Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcpcd: fix for unexpected syscall 135 for 10.1.0 version
Message-ID: <nusi2skcsvsplsotq55paza3iar6vh6pr2ei7jxyp6n6t7nc2r@hdejz62wmusf>
References: <20250305064101.4065316-1-quic_bpothuno@quicinc.com>
 <kxtt4okxjormycbnwxffxqadztn2mgzthuu6btjlkzqsdhihhc@deieyeztitxj>
 <88cc44853dc94eb3b5b7a0c9abfa4ff3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88cc44853dc94eb3b5b7a0c9abfa4ff3@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212367

On Wed, Mar 05, 2025 at 12:08:09PM +0000, Balaji Pothunoori (QUIC) wrote:
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Wednesday, March 5, 2025 2:17 PM
> > To: Balaji Pothunoori (QUIC) <quic_bpothuno@quicinc.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [PATCH] dhcpcd: fix for unexpected syscall 135 for 10.1.0 version
> > 
> > On Wed, Mar 05, 2025 at 12:11:01PM +0530, Balaji Pothunoori wrote:
> > > Current dhcpcd (version 10.1.0) service crashes on the WiFi (wlan0)
> > > interface with the following error:
> > 
> > There are newer releases, which already have this patch. Any reason for not
> > upgrading? For example there was an AUH message from March 1st.
> 
> Few patches are applied as OE Specific in https://git.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/dhcpcd/files 
> Hence, I can't perform end to end testing for upgrade, So proceeded with patch BACKPORT for 10.1.0 version.

I don't follow this. Surely you can. Upgrade the dhcpcd, refresh the
patches (or just apply the patch from AUH, I hope you've seen it),
verify the end-result, post the upgrade patch.

> 
> > 
> > >
> > > "ps_seccomp_violation: unexpected syscall 135"
> > >
> > > This update pulls in fix #421 for dhcpcd 10.1.0 to address this issue.
> > >
> > > Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> > > ---
> > >  .../dhcpcd/dhcpcd_10.1.0.bb                   |  1 +
> > >  ...llow-the-__NR_rt_sigprocmask-syscall.patch | 30
> > > +++++++++++++++++++
> > >  2 files changed, 31 insertions(+)
> > >  create mode 100644
> > > meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_si
> > > gprocmask-syscall.patch
> > >
> > > diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > > b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > > index 3f806bb18783..99b72852bf34 100644
> > > --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > > +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > > @@ -15,6 +15,7 @@ SRC_URI =
> > "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
> > >             file://dhcpcd.service \
> > >             file://dhcpcd@.service \
> > >
> > > file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
> > > +
> > > + file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch \
> > >             "
> > >
> > >  SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
> > > diff --git
> > > a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_
> > > sigprocmask-syscall.patch
> > > b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_
> > > sigprocmask-syscall.patch
> > > new file mode 100644
> > > index 000000000000..7058330165f3
> > > --- /dev/null
> > > +++ b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR
> > > +++ _rt_sigprocmask-syscall.patch
> > > @@ -0,0 +1,30 @@
> > > +From e9e40400003db2e4f12dba85acabbaf2212a520f Mon Sep 17
> > 00:00:00
> > > +2001
> > > +From: Scott Shambarger <devel@shambarger.net>
> > > +Date: Sat, 7 Dec 2024 16:37:28 +0000
> > > +Subject: [PATCH] linux: Allow the __NR_rt_sigprocmask syscall
> > > +
> > > +Fixes recent glibc changes to getrandom() used by arc4random().
> > > +Fixes #421.
> > > +
> > > +Upstream-Status: Backport
> > > +See details in
> > > +https://github.com/NetworkConfiguration/dhcpcd/issues/421
> > 
> > This doesn't follow the established standard. I doubt that it will not trigger QA
> > error.
> 
> Validated the patch using " patchtest --patch <patch_name>"

See https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status

> 
> > 
> > --
> > With best wishes
> > Dmitry
> 
> Regards,
> Balaji.
> 

-- 
With best wishes
Dmitry

