Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B7BC54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 14:06:59 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.10441.1710252408827869466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 07:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=jrAszyPV;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42CE6jWT175371
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 15:06:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710252405;
	bh=/Ygwg1xu6tw5nALyGeI397She7+vz0qj7mwZgeqWskk=; l=536;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jrAszyPVBikNpRHLs1K33iPym2ZwptEUufQcSVO5A7DKv6OgEqOC62NLX4ZcgoUq3
	 KrObOVzmBvGKvBK76MxW/tzAU7BaTzIB97c5hG/NaQHOgYeEMDCLltLYSuw07Sx0pZ
	 QQGpwBG4aENjuQwB2BymkNAOxZlki2yW1ix/KoL5vwTw7PRChv9fOyAsy3FV71TGfz
	 WAatnUPmB8chifS+a64IPETHNGijTeYLBwYo87gr+9gjCjQ7lrAQa0CyvyByWnHPXJ
	 rywdfFUXtSMyIOC9f2iYYopElYHDDCvzcBiNYeCDx4YdDltg8MvJcQ3IFdFcxQ5F2K
	 47URms2MvKLWA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42CE6d0f303623
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Tue, 12 Mar 2024 15:06:40 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 99SMEKJYB8; Tue, 12 Mar 2024 15:06:39 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 42CE6d5b113809
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 12 Mar 2024 15:06:39 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rk2m6-0000000BDAb-41Mu;
	Tue, 12 Mar 2024 15:06:39 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/7, v3] openssh: replace complete
 configuration files by patch
In-Reply-To: <CANNYZj9NGCR8-R5+9LaE-etEBmx2VnYE+ecQY_Jtq4DbT4mFYQ@mail.gmail.com>
	(Alexander Kanavin's message of "Tue, 12 Mar 2024 14:10:09 +0100")
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
	<c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710177387.git.enrico.scholz@sigma-chemnitz.de>
	<c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710241040.git.enrico.scholz@sigma-chemnitz.de>
	<CANNYZj9NGCR8-R5+9LaE-etEBmx2VnYE+ecQY_Jtq4DbT4mFYQ@mail.gmail.com>
Date: Tue, 12 Mar 2024 15:06:38 +0100
Message-ID: <ly7ci7bl3l.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65f0616fb121c496daa8f425
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 14:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196991

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> Why is the patch inappropriate for upstream submission? To me it looks
> like it should be at least proposed.
>
> ++Include /etc/ssh/sshd_config.d/*.conf

Underlying feature exists for 4 years and nearly every major linux
distribution (including OE) has such a line.  So I assume there is a
reason that it is not upstream yet.

I added an upstream report
(https://bugzilla.mindrot.org/show_bug.cgi?id=3672) and will update
patch status when resubmitting.



Enrico

