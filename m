Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F056CA0FF7
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 09:23:03 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.5190.1693646571124214483
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 02:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=aIDsOW71;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 3829MkTT858396
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sat, 2 Sep 2023 11:22:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1693646567;
	bh=8tkTrJ5+CwmzXhHNWeOAEJ2DEERk81hQvvkqb6tkHHM=; l=438;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=aIDsOW713ALeY13PyctEg5e1c60FWPieBQPF8NGju/cBaHgx5a0r1tk1tGqLU1SZB
	 hAvde8Nql1rR91hvJUIbwDLQ7+sqMCNHqvwTebZGepOeF7izCCh89xb3QS77efNk6T
	 1YAj78DOz8zWLsoI/i04CnQiAQKzgDcmTrIsW9GeYjdfVgiCBKyRaLsTDxW5Ts68Sj
	 LVKNy6A2DBaDxybXoHfAm+Th9Hwb4ocGCAvU5iPCy2+UyLQhLJXRUxNHoZVars6DIw
	 xGlkKUKETYE//E2OQ3iKDFrkJ6kNaylQdufHwqNcekmUkD/y+G70HxRoWxIe6XL6kb
	 45MGp07Dx+HKA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 3829MisL070512
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Sat, 2 Sep 2023 11:22:45 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id VTWFVRJ3N6; Sat, 02 Sep 2023 11:22:44 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 3829MiCM842105
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 2 Sep 2023 11:22:44 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qcMq3-001ypZ-34;
	Sat, 02 Sep 2023 11:22:43 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] rust: why is it built in do_install()
References: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de>
	<5c1df1490ce569e7644d33b33b2a44cd42dfc270.camel@linuxfoundation.org>
	<CANNYZj8jxOoj0sta7rp5EZdBqR=HX6hs45e6Co5znRzBLkyrRQ@mail.gmail.com>
Date: Sat, 02 Sep 2023 11:22:43 +0200
In-Reply-To: <CANNYZj8jxOoj0sta7rp5EZdBqR=HX6hs45e6Co5znRzBLkyrRQ@mail.gmail.com>
	(Alexander Kanavin's message of "Sat, 2 Sep 2023 07:09:06 +0200")
Message-ID: <lypm31exp8.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64f2fee46f17ba9ca2859cf3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 09:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187025

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> Any changes would have to fulfil this:
>
> 1. Rust's installation procedure should run under pseudo, e.g. in
> do_install.

The current recipe does *not* run installation under pseudo

| rust_do_install:class-target() {
|     export PSEUDO_UNLOAD=1
|     rust_runx install

Only class-native runs under pseudo (or is pseudo automatically disabled
for this class?).


Enrico

