Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE40BC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 07:28:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.194731.1698305323326335336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 00:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nnZVBq6k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B322560007;
	Thu, 26 Oct 2023 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698305321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qo76xP2FpBCod1YgIos15NmzcDpPPRq2KcA94rQY+3k=;
	b=nnZVBq6k+sAHbHE6MZ6YWfYKTaRs6U1GPrbVPIGhX+itlo9LDqnbJ550Bm/ZDkfwycM3yF
	ks3TldbzsPbic4GOAOfvhodMrwfg4H2mcnfrEraPdMmxyXRsaKwdGrygFRbgKWKlraCLxs
	xVyhe0t/5uaePYlu35vo/DWjvw5i9vXIRd3UvYjFfr8RJPv/NLKl2bRvNi0k+RYAcJmn8q
	WXdhUru4U/DVnM6U0MBGLuwE3LpbTrMsBvIOsxo2FI+V/uOoqeMtX967o/df/GrR3XxCpX
	VsazLDbPyrIHLAPMJ72+kDuEsM/9t4y7kAfB00ZO6X7CZ8QYjBvLy2jXQZfdeA==
Date: Thu, 26 Oct 2023 09:28:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Matsunaga-Shinji" <shin.matsunaga@fujitsu.com>
Cc: rybczynska@gmail.com, richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org, Shunsuke Tokumoto
 <s-tokumoto@fujitsu.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: Classify patched CVEs into 3
 statuses
Message-ID: <20231026092839.7069e7e8@booty>
In-Reply-To: <20231025051344.24088-1-shin.matsunaga@fujitsu.com>
References: <20230922083400.3157-1-shin.matsunaga@fujitsu.com>
	<20231025051344.24088-1-shin.matsunaga@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189701

Hello Matsunaga-Shinji,

On Wed, 25 Oct 2023 14:13:44 +0900
"Matsunaga-Shinji" <shin.matsunaga@fujitsu.com> wrote:

> CVEs that are currently considered "Patched" are classified into the following 3 statuses:
> 1. "Patched"      - means that a patch file that fixed the vulnerability has been applied
> 2. "Not affected" - means that the package version (PV) is not affected by the vulnerability
> 3. "Undecidable"  - means that versions cannot be compared to determine if they are affected by the vulnerability
> 
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>

This patch triggers a selftest failure:

AssertionError: 'Not affected' != 'Patched'
- Not affected
+ Patched

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2329/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5912/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5962/steps/14/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

