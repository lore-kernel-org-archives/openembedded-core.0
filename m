Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5DAC00528
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 11:42:09 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.8907.1690371720953342801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 04:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=ToPNort5;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 36QBfw15485598
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 13:41:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1690371718;
	bh=kfphEXhjbL5+eYUSbnsfyk3JWmbqPNkKd3VzmKuVSOA=; l=1331;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=ToPNort5P2gXk9xywUCiq39bXoowNjbPib4xQLGdDcNm9xs3Km3MGo/DaTUrC257e
	 jLqYeNvITI9pgfcaMomZPblJofUMAKtbXmLq6//DCUemzFEWgtC4Uk3SeEks0RxGxI
	 z1BYDNONj//ytfome5ZcWAaBsTpUu8RH7RPN9Vq/m+/170hahmHhWwWtixxN/6z5Sg
	 6KeNqEP6BxBRJKDH/he3orlukaYZ/P35vhNl95eFaMy5UTd5HYX0cuhbF2uGZf4efz
	 PChSuAa4cBhYJCDd6Op4TBsGatQi9kj5XrSI+iemTgJL7g+zyqPva8ymoFGNOGAhdW
	 94hoeCKkjnJQw==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 36QBfuO2616884
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 26 Jul 2023 13:41:56 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id VKW30BSKHO; Wed, 26 Jul 2023 13:41:55 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de ([192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 36QBftSi475374
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 26 Jul 2023 13:41:55 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qOctv-000Yk0-1k;
	Wed, 26 Jul 2023 13:41:55 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oe.data: allow to mask out secret variables
References: <20230726110946.129932-1-enrico.scholz@sigma-chemnitz.de>
	<CANNYZj_kQcXA6hfDJBCMrE9DjP5dkoHsFwozzM5oKpuMzecNyw@mail.gmail.com>
Date: Wed, 26 Jul 2023 13:41:55 +0200
In-Reply-To: <CANNYZj_kQcXA6hfDJBCMrE9DjP5dkoHsFwozzM5oKpuMzecNyw@mail.gmail.com>
	(Alexander Kanavin's message of "Wed, 26 Jul 2023 13:19:48 +0200")
Message-ID: <ly1qguvr0c.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64c10683a75c1ce670d19c29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 11:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184878

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> Please no. These things can leak out in a million other ways

no; that is very unlikely.  The parts which are dealing with secrets
usually take care about not leaking them.

All major CI systems have the same problem (need secret variables) and
at least gitlab solves it in the same way (mark it as to be masked and
replace it in logs).


> (e.g. if you publish logs),

Secrets do not appear in the usual 'bitbake ...' output only in the deep
.../temp/log.do_* files.

I do not think that people are really publishing these files.


> it's better to just scrub them prior to publishing with a post-script.

Sounds unergonomic; you have to know which variables are secret.  You
have to read and interpret the testdata.json file, substitute values and
write it back.

It is much better to do it in the first place.  The classes which are
dealing with secrets can mark them as such.


> Having secrets in bitbake variables is a bad idea to begin with.

Yes; because they are exported in testdata.json ;)

Else, there are sometimes not many ways to work without them.
E.g. SSTATE_MIRRORS has contain the secret token because it is used
directly by bitbake; perhaps I could use a wget wrapper and write a
custom curl python class...



Enrico

