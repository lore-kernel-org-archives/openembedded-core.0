Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B236ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 20:35:31 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.29192.1661459725558658953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J753FF2F;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 414BE100003;
	Thu, 25 Aug 2022 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661459723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dpBEl/V1GIS4IArXmD5/HS7s2/grbfxGx3ZltwX0Zi4=;
	b=J753FF2FxeEetCFW4I1sTMbHsNsUfAUd6YcV76sODeeJYZXYbFhmIIWjxGeciNYhEkEMkv
	UBW1sgcRwvguAh0byhTIFtP/s+8QADqal+Kf3/3Xeu8HqYGZ9I8sKqoKCsdUB2ECIpab+0
	g5vgHPdHTXTzYBOXC56rJ+DOrh0k4oQtTQuB1Z6fOmM+8WEhj/Cl4afnZskIXTcmc/vLnq
	kT3cdX3JmpM53IxGv76QFeArh0XPrDllcWh2kkdXcQG81yHzgXbEDJV0Wdzy9+M3suGTHj
	VwNqBEyBD4nX8TXWPfViZjW8CYXwnKlPlXsf5a9er3anVuWKI8OunEuI1hei8A==
Date: Thu, 25 Aug 2022 22:35:21 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] apr: Cache configure tests which use
 AC_TRY_RUN
Message-ID: <20220825223521.04c7284d@booty>
In-Reply-To: <20220825072103.641291-1-raj.khem@gmail.com>
References: <20220825072103.641291-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 20:35:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169893

Hi Khem,

On Thu, 25 Aug 2022 00:21:03 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> AC_TRY_RUN macro means the test needs to run to find the result and we
> are cross compiling so this will always get wrong results, this results
> in miscompiling apache2 on musl because it disables rlimit
> (ac_cv_struct_rlimit) wrongly.
> 
> All these variables are determined with AC_TRY_RUN checks
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

There are several failures with this patch applied:

| locks/unix/proc_mutex.c: In function 'proc_mutex_choose_method':
| locks/unix/proc_mutex.c:1494:28: error: 'mutex_proc_pthread_methods' undeclared (first use in this function); did you mean 'mutex_posixsem_methods'?
|  1494 |         new_mutex->meth = &mutex_proc_pthread_methods;
|       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                            mutex_posixsem_methods

and other undeclared mutex-related symbols.

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1446/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3720/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5767/steps/11/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

