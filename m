Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A16C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 18:41:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web09.277.1652899265911636562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 11:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=jqc3H4b8;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24IIexGT614960
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 20:40:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652899259;
	bh=GTw2Zqr5rjMScKfybjRwTXHshqwbCRdfbSYZpZcnJz8=; l=499;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=jqc3H4b82AkgfaOQEvlr25sc+LEAoZ+bri8EP07URpyMFU7SIS9vTLG6uZQk4epJr
	 /vc9TXqs9YmmEm+qGAnfWuvavZW+GlaZP9qBQPQmv8xkoB8UQCPOa4ahEJbeMLENP3
	 5kfIgGhHc45wrWIT6x4j0OYb3MiXRY6TaqF5wmgJHxHrPmCxMNLTLXDVZNNU61Xotb
	 yves3zQt49hK7rddG2CKKwDkICbndMmNS6vuP1/I/jOD010NtldtLujYuLebXNEyXE
	 0LWq9jLzQ7wan9OiotK1tLwzMoEbmu8uusISAzvEgulXvDeNmZJ6YfgkpeT0WjjbBA
	 FAE6XBJvSK4Zg==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24IIevod783623
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Wed, 18 May 2022 20:40:58 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 109905FA9E5; Wed, 18 May 2022 20:40:56 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24IIeuXQ591007
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 18 May 2022 20:40:56 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrObP-000LPZ-UF;
	Wed, 18 May 2022 20:40:55 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] npm.bblcass dysfunctional in kirkstone
References: <lypmkbuozf.fsf@ensc-pc.intern.sigma-chemnitz.de>
	<01d7118ffeb634d6867b5ad3b95d59a96ad07357.camel@linuxfoundation.org>
Date: Wed, 18 May 2022 20:40:55 +0200
In-Reply-To: 
 <01d7118ffeb634d6867b5ad3b95d59a96ad07357.camel@linuxfoundation.org>
	(richard purdie's message of "Wed, 18 May 2022 11:35:28 +0100")
Message-ID: <lyfsl6vg3s.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 18:41:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165862

richard.purdie@linuxfoundation.org writes:

>>    Is there any solution or other ways to use npm in kirkstone?
>
> We're lacking people working on the npm/node support. If people send
> patches to fix it and add test cases we can look to improve it but this
> kind of thing doesn't happen without developers working on it and we
> simply don't have those at the moment :(.

ok; I am on it and I got it to work.  But I have to cleanup things first
before I can submit the changes.


Enrico

