Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9094CC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:38:58 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web09.5951.1652956736408003844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=j6L3as1m;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JAcs4I621638
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:38:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652956734;
	bh=oagyPGAKCZA5F5N6nYHblAtIFur65TPV1OotQ4NHkAI=; l=262;
	h=From:To:Subject:References:Date:In-Reply-To;
	b=j6L3as1mlazBGEK6G7kS17Igw3SAW9kLZ/TFVEkyLfg8WzjVD6ykDrUEa9TRgkxpA
	 GIvszDwBNpF/C8xuLUF/l2IoQ81gtitPD/KSht4nSb5y0MUpnJcJImN0/sCIAZD+QX
	 4MoBzyznFMxm3Wn4mo+ldAlU7+gpGBUO7RjQCxa8R0XmpakHNYR9PQ2zM8bD9MtuZp
	 e9I13SyEBy3x2DQ/YhyqvZ8AVX1Uzc4GzluZFkwaxqZBEDzTo9pISz04+IJvvDqcch
	 fRNhC1vlShjTZG0uaqWFa6AtDA52SkySEemnxnmGhVjAtpZ/j/29gaEluDBDAIXFQB
	 EW1OtdQLU19qA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JAcq1j2314757
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:38:52 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1D7316DFD35; Thu, 19 May 2022 12:38:51 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 24JAcomv856731
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from ensc@sigma-chemnitz.de;
 Thu, 19 May 2022 12:38:51 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrdYQ-004Pol-N9
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2022 12:38:50 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/6] npm.bbclass: work with nodejs 16
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
Date: Thu, 19 May 2022 12:38:50 +0200
In-Reply-To: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de> (Enrico
	Scholz via lists openembedded org's message of "Thu, 19 May 2022
	12:05:50 +0200")
Message-ID: <lybkvtvmbp.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 10:38:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165880

"Enrico Scholz via lists.openembedded.org"
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> writes:

> This patchset requires an additional one in the oe-meta layer.

for reference: https://lists.openembedded.org/g/openembedded-devel/message/97186

