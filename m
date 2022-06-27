Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72364C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 16:37:49 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.44118.1656347853090172822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 09:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=tl38k/Pj;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 25RGbTPg372581
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 18:37:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1656347849;
	bh=WdbF6TxPHLjg/59bzeHUYucNfzap2PzbmsHYF6q1cvw=; l=325;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=tl38k/PjBuQHhT6yrZQZ+n7PE2eoFRqG/jR4SXWwza1XC1f8icS2CbGlDLxa3SlIp
	 p8ztRWKrhseY2l4futrwauSFXyaSNH2oszeJYhyFOeL4EniQQrDlHxJmDOCCle+DYq
	 0u3nfwbr2MWTK29ntbvSL4Ii/7sOWJEXMAZP9QNZkijXSdkvnGzTOH6vWfy/4Ye7Ft
	 WvAD6Dbq6lshl1P8J1R0WuYf4W0VxXtGayxuJsTfezvAnSp91J5X3e99PDf6AnSxp7
	 6O0aEJ5y9AAk5QIZ6cYFJNaClC9JQJydRrnVgYUy6v454GXLp/8WwBxvW55ZHX4eXy
	 ZyNG2y8/QtF0w==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 25RGbR3A1068105;
	Mon, 27 Jun 2022 18:37:27 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 36CBD2355FA; Mon, 27 Jun 2022 18:37:26 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 25RGbQva177573
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 27 Jun 2022 18:37:26 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1o5rjq-009uvz-0E;
	Mon, 27 Jun 2022 18:37:26 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Michael Opdenacker via lists.openembedded.org"
 <michael.opdenacker=bootlin.com@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        michael.opdenacker@bootlin.com
Subject: Re: [OE-core] Error building an npm package: npmignore: not found
References: <d5e6b77b-096d-3dd8-8c42-18c7adbb9fb2@bootlin.com>
Date: Mon, 27 Jun 2022 18:37:25 +0200
In-Reply-To: <d5e6b77b-096d-3dd8-8c42-18c7adbb9fb2@bootlin.com> (Michael
	Opdenacker via lists openembedded org's message of "Tue, 21 Jun 2022
	18:19:32 +0200")
Message-ID: <lyo7yef4fu.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 16:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167327

"Michael Opdenacker via lists.openembedded.org"
<michael.opdenacker=bootlin.com@lists.openembedded.org> writes:

> I'm testing the Yocto Project Documentation for creating NPM packages

npm is broken since kirkstone; see
https://patchwork.yoctoproject.org/project/oe-core/list/?series=4303 for
patches.



Enrico

