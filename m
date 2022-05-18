Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A756CC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:14:45 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.3201.1652868876692030298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=JENlxnsq;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24IAEWWX874946
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 12:14:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652868872;
	bh=/HFxgGREqhO2ehdRW77tfc+aFF7WteBX8LgYArprLec=; l=991;
	h=From:To:Subject:Date;
	b=JENlxnsqh6pc3wmUquUxOfa18f6wHmJ2XRjk0VfgDEAI7x1AgZy0yZFMf0xQlvxQO
	 rGWtkH8x0qculuOKuivcheGnSVVkR0nTMUqjUrZkbsK/wubz4/g+5wYsPpCYyTPe9D
	 oveZWBu96pc8o/8zaH7g/tuUXC7iTn7c5VDdaMW9rrAmfy7Wiutj8uHd14xjaQimdV
	 YesJqsVRUk5jVfgVNRTYrrvddCZWZpz5l32J+rG4wODEX5vLgQZ+5Ksu2Ofhbm+sQT
	 EAy2pJKGCA/tBgeU8quhY2vedCVgP0+mIg/ARy738UxVfMpPEHOjGdiZQMj3+elh7U
	 rZ+aWOry0MZKQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24IAETuN778943
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Wed, 18 May 2022 12:14:30 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 6DEFEB162A5; Wed, 18 May 2022 12:14:28 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24IAESGw587767
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from ensc@sigma-chemnitz.de;
 Wed, 18 May 2022 12:14:28 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrGhI-00FTji-8w
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2022 12:14:28 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Subject: npm.bblcass dysfunctional in kirkstone
Date: Wed, 18 May 2022 12:14:28 +0200
Message-ID: <lypmkbuozf.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165795

Hello,

with nodejs 16, 'npm.bbclass' stops to work and fails (at least) because
of:

1. 'ignore-scripts' has no effect with 'npm pack' anymore.  This command
   will now execute 'prepare' scripts which usually fail.

   Patching out 'scripts/prepare' from package.json should solve it (can
   be done by npm.bbclass).

   This problem happens in do_configure()


2. In do_compile(), 'npm install <tarball>' is executed.  This tries to
   contact the registry to fetch the manifest of dependencies.  Because
   offline mode is enforced, it will fail with ENOTCACHED.

   E.g.

   | npm install md5-2.3.0.tgz
   | npm sill fetch manifest charenc@0.0.2
   | npm verb stack Error: request to https://registry.npmjs.org/charenc failed: cache mode is 'only-if-cached' but no cached response is available
   | npm ERR! code ENOTCACHED


   This url (https://registry.npmjs.org/charenc) was not added to the
   npm cache.

   Is there any solution or other ways to use npm in kirkstone?


Enrico

