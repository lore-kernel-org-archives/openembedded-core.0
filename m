Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A46C369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:32:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9335.1745595169220765239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 08:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gzbbace/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913958ebf2so1862141f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745595167; x=1746199967; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5/k7EY/JGmpwzhxI2kGtPR0O3cJXlwd71WmKHGeE5U=;
        b=gzbbace/CCCP4KSZ/+KLAq2g23thvaOP9o6SASlJ+F/Wp3rKpeOFOQ0U3oKgM1gy9F
         ab4BrrEq5IgxgtA7s3T/0+zOSM+PQqSlsa0us2Tl1sWYvgoFtaD6il+0LslwcMTnJRaA
         Z4EN6txaF+r1heC6kWYu0hLTggvRsSjUiNgWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595167; x=1746199967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5/k7EY/JGmpwzhxI2kGtPR0O3cJXlwd71WmKHGeE5U=;
        b=SDeLQuYGw7S1a398lN0g9+kTLESAUOFCpb1Q3QhNECFDHwJkRRdOE1W+Gk2fd56Y+5
         pIRxaHAsXgO+EXbiOXFIDWPoSbQk6d+OkP2pBEoBXjZFEHtFwZL3vVaYLH9MmLETLI6M
         wc4PYW4/Sohry+fw4yIVkJrLa7lJclWfAdKLFbG0jiXyLA9cNeB/EmvOuk2rBBm/IJZr
         AAHkwF6O/Ia46lTXRQK2jV3PdWiC+8QZsDUFYzMozEl2rotMe0qOQmLSEiTAcRJoGsbb
         rufDQeqxEvA/ypRuSQEWBxVrZ3Dtvsj35ujCPCKuFpgPrtVjW+FEXY82GBhVwSC+kuqS
         P5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUMfcihpRuZNhXW+frPT9T3q/HOwe2ZzjImrhRb+p2pDsHEpr6T+gXkg3D6A4amhJVEZweV38ZuJjiN4pMvDKucOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlAk8m5sqgZ/hRQII5aZ4iQE1X35nI20XCY4zOlU4Bgf6eacaw
	u49/A94Gy0jpDlpCQ/yR/6g5JpVCCu++MyKnBW9CNFHvT1iF5+truvQIqxVhUGA=
X-Gm-Gg: ASbGncttG6mR7WJqNRpqYIJBg9z0f5KZXc1o414ymKsy3nTtoXZnUOmucpRcqzVlEJY
	D2jioyhx1s55GtAgRUIXfwIO4quTHWN+gu/IfOPIynX5gY5KRLP5Wk0Kg8syFtfgzp8R1aWNALa
	FnIOMncEJizi4yz1WBB2sIM9up1giFxAHYGYAeAc5o5w5znYqhdP76umKmFRew6WV1cFFLWM0U1
	LCXfi/vTgahlZb6nnv6BCBRJ9EfOWPglEQOv6O8GL+u9/YpTjBCZ49vB2vK5duXx7Oj5IHagZ0B
	wCLT85CVEV/Byj0EMEJ+XDuUCfH8kki9ZnCDwfGaSLLzi9NMXU9E6cd8V2ze9eLihi5N1C/Ez/f
	xk1zmhB4IjoKlrQGkSaaa37xjwElsuRU6k3y10NsG
X-Google-Smtp-Source: AGHT+IHDvgb3ymtS/VIySpPEXZtSdXwAo7v3RQl2+lj4Ex5Vf9uRE3SHT2BL6iv66Hg5U8K30XnStA==
X-Received: by 2002:a05:6000:22c2:b0:39c:1258:7e18 with SMTP id ffacd0b85a97d-3a074f8929fmr2241445f8f.57.1745595167255;
        Fri, 25 Apr 2025 08:32:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1? ([2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba34sm62892125e9.5.2025.04.25.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:32:46 -0700 (PDT)
Message-ID: <76b6266900221f41a43835a3a4962b7b129309ba.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH V4 5/5] lib/classes/recipes: refactor
 qemu.bbclass functions into library functions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2025 16:32:45 +0100
In-Reply-To: <20250420040528.4012613-5-Qi.Chen@windriver.com>
References: <20250420040528.4012613-1-Qi.Chen@windriver.com>
	 <20250420040528.4012613-5-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 15:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215481

On Sun, 2025-04-20 at 12:05 +0800, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are gen=
erally
> useful. Add a deprecation notice in qemu.bbclass so that we can remove it=
 in
> the future.
>=20
> The re-definition of qemu_wrapper_cmdline in allarch.bbclass is replaced =
by
> re-definition of the write_qemuwrapper function. We need to do this
> because we need to have the same signature across different machines for
> recipes inheriting both allarch and meson.
>=20
> Note that we cannot use vardepsexclude on oe.qemu.qemu_xxx functions
> conditionally in allarch.bbclass because python module functions currentl=
y
> do not support per-recipe vardepsexclude handling.

I've been slowly merging in pieces of this series and in general I'm
supportive of what it is doing. It has been a long term goal to get
more of the python code into the python library directory
in=C2=A0particular.

One thing this patch does which I don't like is that it moves
QEMU_OPTIONS into bitbake.conf.

When the original patch set was discussed, I was very clear that I
didn't like user mode qemu being available everywhere by default. I
wanted recipes to have some clear sign they were using user mode qemu
and that it should be something we strongly discourage.

With this patch applied, there becomes zero barrier to using qemu from
recipes, it is effectively hidden.

I'm particularly frustrated that the patch commit log makes no mention
of the QEMU_OPTIONS change.

I'd ask this patch is split up further, into the function change with
the QEMU_OPTIONS part and the class deprecation left out. We can then
further discuss that separately. As you might gather, I'm less keen on
taking that aspect of it.

I do realise why WindRiver want to do this and I believe the changes
are helping make what you want to do easier but I suspect dropping the
qemu class entirely isn't going to be something we can do.

Cheers,

Richard

