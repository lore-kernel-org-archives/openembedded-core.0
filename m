Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C239AC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 13:36:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.5415.1668173757708645538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 05:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B0RdoKwM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id v7so2977985wmn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FFGaD4DOaki3ymIANNNV4ah6GeHRwi+vYbhlf81ZEUM=;
        b=B0RdoKwMEPxAQ/ncuiCGI2jAGvuK7zArFAMU9dwz/6AAge9ldf33vjzzsF9U1n/O1Q
         yLDSF/LUw1RO6zmajlmWXSQH2NMzSfNjt+tVeypj0zTLI089oZz92CdhmPlg70vZLqIN
         LH2w82RD+vxJcJco9gHh7nGK70HJGLGYtigVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFGaD4DOaki3ymIANNNV4ah6GeHRwi+vYbhlf81ZEUM=;
        b=xmXAP6Zpd1BnD0yKibJ9F3aHjEYtZqC+UYKv5nWymWWNWBGgqpN0qnT34X4Zsnxxgc
         XEpb3+5TdLEMgHFqEvkwElCkKMRoxhYuDFQLg9QwcKfojRL+lkwAvnLGlQuirCzxj0fr
         9hvCW++lteLO5sJBFA+G5YK246UIzFx+oRvZnHmwbNc2O5TN+RodeOEgzcuMVVcxKj1C
         KaB4ggjh1HZFTB7a4XZP0DoE7EBl8vT/ch1Pgckxh3YvAFqTxSfwPnwIaHUD3kISCGr7
         S/zkqfi5/pQwSIfBCO3qFIPJ5eWobc3oIHPvhxWEtMeyUia+RhKDMOzj4IEKHeNCzW5g
         e68g==
X-Gm-Message-State: ANoB5pnpcEmXgTp1lKEvcOIOq7ljZBLUliMIjK2xxNO8sHr3ZP8EOM7Z
	o+hQHuhpgwxc1GG1TDZcjs+ksw==
X-Google-Smtp-Source: AA0mqf4cNVdQXDvPaVbDPYWPs0MwTuOc0TDZhyH+o+bdmGH0lx2AMj/Xoi+U+fYa2ujXWvx0XrH2BA==
X-Received: by 2002:a05:600c:1e1e:b0:3c7:135a:2e4f with SMTP id ay30-20020a05600c1e1e00b003c7135a2e4fmr1321417wmb.30.1668173756029;
        Fri, 11 Nov 2022 05:35:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2115:4271:c44b:61ee? ([2001:8b0:aba:5f3c:2115:4271:c44b:61ee])
        by smtp.gmail.com with ESMTPSA id d8-20020a1c7308000000b003cf7928e731sm2984381wmb.9.2022.11.11.05.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 05:35:55 -0800 (PST)
Message-ID: <1945179b38c4a062ccf90f0b275755625ec9a6f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to
 be accelerated
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rasmus.villemoes@prevas.dk, openembedded-core@lists.openembedded.org
Cc: paul.eggleton@linux.microsoft.com
Date: Fri, 11 Nov 2022 13:35:53 +0000
In-Reply-To: <7d37134e-3239-f6dd-fe35-4ac5f7d519be@prevas.dk>
References: 
	<1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com>
	 <7a3e2fb0a5f0e71581fa4c2da529454bd2eb27ad.camel@linuxfoundation.org>
	 <3386323.QJadu78ljV@linc> <7d37134e-3239-f6dd-fe35-4ac5f7d519be@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173129

On Fri, 2022-11-11 at 14:25 +0100, Rasmus Villemoes via
lists.openembedded.org wrote:
> On 10/11/2022 21.32, Paul Eggleton via lists.openembedded.org wrote:
> > Hi Richard
> >=20
> > On Thursday, 10 November 2022 11:14:24 NZDT Richard Purdie wrote:
>=20
> > > Adding in yet further if/else paths with magic variables to control
> > > them isn't filling me with confidence.
> >=20
> > I understand that. I was hoping to figure out a way to avoid adding sig=
nificant=20
> > extra complexity.
> >=20
>=20
> FWIW, we've long since given up on using kernel-fitimage.bbclass, it is
> way to inflexible (e.g. there's no way to build two FIT images with the
> same kernel but different initramfs).
>=20
> It is much simpler to just have a separate small kernel-fit.bb recipe
> which pulls vmlinux or Image or whatnot, plus the .dtbs, from
> DEPLOY_DIR_IMAGE along with the initramfs images, provide our own .its
> file(s), and build the FIT image(s) there. That automatically avoids
> rebuilding the kernel when only something in initramfs has changed.
>=20
> Building the kernel and packaging the binary into some container format
> really doesn't need to be done in the same recipe.

I'm open to the idea of changing it to do that as that is how I'd
prefer it worked. I don't use it or know much about the needs people
have so I end up guided by others though...

Cheers,

Richard

