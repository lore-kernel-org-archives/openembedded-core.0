Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB83AC001B0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 12:02:29 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.9212.1690372943328774399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 05:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=dR1zO9Wl;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 36QC2KSL485762
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 14:02:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1690372940;
	bh=d1a5CI+X3bnM+az0BViutwJNYU6XYuE8Ww6+jf4vkho=; l=991;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=dR1zO9Wlke5PLnUcNxobLMBIdgkEAyH4gibCecbTZx8rfQbnpbFCxdgdx6xP+OLox
	 9ge6m9v32TPUavIDyh3r7Y6+jeG9PuXVefSZZ54HPT+y/c+ctBiC/Xs5V1me+Yy7BU
	 m7Gx3so2QBenHWEqPmZw6TmUZQ8J5YIwO4+rHG/WSOasVOqaaYbRRGdw7PFY9mPw5w
	 xr2W8Iv+hy5BuEiSJhV4QibTEk6uSdFqMDtL4BOB3f7KyFHwzV9k6KdydUCWmsjlYj
	 gkn7D3bkAp0HU79NKbvyrqe1RkWmZ3msZNlDl5E+A4cGUm4K4TumFvGTV77dqE3csy
	 f+Jpy7XKsmL4Q==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 36QC2Ivd1121139
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 26 Jul 2023 14:02:19 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id BGIFBTH783; Wed, 26 Jul 2023 14:02:18 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de ([192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 36QC2ImG475508
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 26 Jul 2023 14:02:18 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qOdDe-000ZME-10;
	Wed, 26 Jul 2023 14:02:18 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oe.data: allow to mask out secret variables
References: <20230726110946.129932-1-enrico.scholz@sigma-chemnitz.de>
	<CANNYZj_kQcXA6hfDJBCMrE9DjP5dkoHsFwozzM5oKpuMzecNyw@mail.gmail.com>
	<ly1qguvr0c.fsf@ensc-pc.intern.sigma-chemnitz.de>
	<CANNYZj_AoYEoVWgJ35mxMKj=xgcysP9HzVQT39DG=HFYcR6rNA@mail.gmail.com>
Date: Wed, 26 Jul 2023 14:02:18 +0200
In-Reply-To: <CANNYZj_AoYEoVWgJ35mxMKj=xgcysP9HzVQT39DG=HFYcR6rNA@mail.gmail.com>
	(Alexander Kanavin's message of "Wed, 26 Jul 2023 13:50:31 +0200")
Message-ID: <lywmymubhx.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64c10b4aa75c1ce670d19c4c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 12:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184881

Alexander Kanavin <alex.kanavin@gmail.com> writes:

>> Else, there are sometimes not many ways to work without them.
>> E.g. SSTATE_MIRRORS has contain the secret token because it is
>> used directly by bitbake; perhaps I could use a wget wrapper and
>> write a custom curl python class...
>
> Yes, the secret needs to be in a file (or other access-controlled
> facility), and read from it by the process that needs it, and only
> directly prior to using it. Having it in a bitbake variable which gets
> passed through a million tasks and components

Where is the problem?  I known only one component
(rootfs-postcommands.bbclass) which dumps the whole environment and
leaks it.

Else, when there is a malicious component that wants to steal secrets
from a bitbake variable, what would stop it from reading the secret from
a file?

Your suggestion (write secrets in files instead of bitbake variables)
does not improve security but causes only extra work.



Enrico

