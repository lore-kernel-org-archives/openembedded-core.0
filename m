Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199CBC54E67
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 14:57:17 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.14669.1710428227749643306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 07:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=pnJGiNVm;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42EEv5Kb195654
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 15:57:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710428225;
	bh=ah2IlI/Y4VlOhtAGioBzeAVNPlanAfMa+QFC6hjQAiQ=; l=663;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=pnJGiNVmdOxcRupr7E2qk2M3AWvm0zUcQx01DWF1Rw88NYwFxlHV1cIPZuYZ+nSvN
	 qITndEV+OYkXHhS1mr5oKLwBySS5Vtunx7A6TeibAwlsE1DOqkXHpxdkVpfqe27Nt0
	 Dgw4YldKmZScDONeUK4ISAp6fP+sEJr7lVITa2B6mSfVnPfBGzcCQP6bvazzje2nyt
	 WJ5sZRRJedzaWqL5BRKeK4pxUvfwtPBQagjkiITfYmR2N8WJ2CnOq+lZN88VXYBsp3
	 cCmhlFfCR8MYfG2mlJ+nz0jX+GMLwDCX3es0SkwiU17KehsL/kuZWtKAeqadEihHn2
	 87o+5txFOHBTQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42EEv32F359938
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Thu, 14 Mar 2024 15:57:03 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id XU8NHQK5VV; Thu, 14 Mar 2024 15:57:02 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42EEv2Rl192841
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 14 Mar 2024 15:57:02 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rkmVy-00000001XOd-3DBe;
	Thu, 14 Mar 2024 15:57:02 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7] Replace sshd_config patching by snippets
In-Reply-To: <68d71da3a6f49e2ac4594fa8ca633cdc7eb2e0fe.camel@linuxfoundation.org>
	(Richard Purdie's message of "Thu, 14 Mar 2024 13:40:57 +0000")
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
	<17BC9C80577EA5C2.22340@lists.openembedded.org>
	<68d71da3a6f49e2ac4594fa8ca633cdc7eb2e0fe.camel@linuxfoundation.org>
Date: Thu, 14 Mar 2024 15:57:02 +0100
Message-ID: <lyo7bg9801.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65f3103eb121c496daa9009d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 14:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197111

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> Some further related warnings:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9031/steps/11/logs/warnins

| stdio: WARNING: Nothing RPROVIDES 'nativesdk-openssh-config' ...

ok

I will reduce dependency from

|-RRECOMMENDS:${PN} += "openssh-config"

to

|+RRECOMMENDS:${PN}-sshd:class-target += "openssh-config"


| stdio: WARNING: Nothing RPROVIDES 'nativesdk-openssh-scp' ...
| stdio: WARNING: Nothing RPROVIDES 'nativesdk-openssh-sshd' ...
| stdio: WARNING: Nothing RPROVIDES 'nativesdk-openssh-ssh' ...

are these warnings really new?



Enrico

