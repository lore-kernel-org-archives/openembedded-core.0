Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7802C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 13:18:34 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.8657.1644671910516678108
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 05:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=RNCyfgpA;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 21CDIPlr192079
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 14:18:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1644671905;
	bh=05TWPSYAw2nvPRIl3kpXyNqHY022Se++ASWyickSjRs=; l=1128;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=RNCyfgpA0SV0uGvnjmTTx1pUvJ0/OTngRWcgR6VWpoEG7UntZV/J/tTe3gbLyzAsd
	 TtKa0pHraAzhr2jGnHBh8dHObochThtU8eQzK0FYxqq+paBHhJodd93RLQDXbMfzdL
	 dlNZjp3X+EVD0npncymQzFNPT5Kfmq9/I7rZfWfk=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 21CDINrI529505
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Sat, 12 Feb 2022 14:18:23 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 71FC89B9728; Sat, 12 Feb 2022 14:18:21 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 21CDIKWZ185333
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 12 Feb 2022 14:18:20 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nIsI7-000MFD-4F; Sat, 12 Feb 2022 14:18:19 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when
 host gl drivers are in use
References: <20220204204027.2323845-1-alex@linutronix.de>
Date: Sat, 12 Feb 2022 14:18:19 +0100
In-Reply-To: <20220204204027.2323845-1-alex@linutronix.de> (Alexander
	Kanavin's message of "Fri, 4 Feb 2022 21:40:27 +0100")
Message-ID: <lywni0cjfo.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 13:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161670

"Alexander Kanavin" <alex.kanavin@gmail.com> writes:

> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -109,7 +109,7 @@ def qemuboot_vars(d):
>      build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>                  'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
>                  'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
>      return build_vars + [k for k in d.keys() if k.startswith('QB_')]

Build without uninative fails now with

| File: '.../meta/classes/qemuboot.bbclass', lineno: 141, function: do_write_qemuboot_conf
|      0137:        else:
|      0138:            val = d.getVar(k)
|      0139:        # we only want to write out relative paths so that we can relocate images
|      0140:        # and still run them
|  *** 0141:        if val.startswith(topdir):
|      0142:            val = os.path.relpath(val, finalpath)
|      0143:        cf.set('config_bsp', k, '%s' % val)
|      0144:
|      0145:    # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
| Exception: AttributeError: 'NoneType' object has no attribute 'startswith'



Enrico

