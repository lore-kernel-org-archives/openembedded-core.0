Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0305AC47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 22:31:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.7320.1705617102767632676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 14:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=T9VkL5U1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBD87240002;
	Thu, 18 Jan 2024 22:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705617100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1ERJmk6UZTQgeGinRjj6qqS8fJFj2TRG9ksmJF2nqc=;
	b=T9VkL5U1zxJ5B1Yactnh/ZspZLd6H6XZCkC7++umczycmm4tdXgZSS4ALbP4tB/cylstwm
	o7YNoXN+CV6Fm4AEt+ORJ2GejbVeMHw8KP1Qm95MhkrVy/OxJ8hoh6FUH/o00Mh/wJPi29
	I8Xa3yTY2TOjlTR7oQem+D3Fi45riJ8MAHb32UVEUY0fKjzsmuHSLqerSNhtBZH8eI0/AW
	gyHDQRnbpK0TOxgwAV2xUaH3aH2uuUJ2OmludzbofO3UYFM2F2xh4f8NPLWYKZ5zzpGU5o
	/DbnkrNJ4vSKk0V4/vwR54J/P9ELHsXyNJYDduc765QGdXlRdmUUu4Wnr+aplA==
Date: Thu, 18 Jan 2024 23:31:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/4] oeqa/runtime/rpm: raise exception if test
 rpm file cannot be found
Message-ID: <2024011822313993eb2a24@mail.local>
References: <20240118102409.2680941-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118102409.2680941-1-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 22:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194001

Hello,

This fails pkgman-non-rpm:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8412

On 18/01/2024 11:24:06+0100, Alexander Kanavin wrote:
> The tests rely on that, and so the discovery shouldn't simply
> fall through.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oeqa/runtime/cases/rpm.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
> index a4ba4e67698..bd9050a81b2 100644
> --- a/meta/lib/oeqa/runtime/cases/rpm.py
> +++ b/meta/lib/oeqa/runtime/cases/rpm.py
> @@ -88,9 +88,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
>          # and it will always be built for standard targets
>          rpm_doc = 'base-passwd-doc-*.%s.rpm' % pkgarch
>          if not os.path.exists(rpmdir):
> -            return
> +            raise Exception("Rpm directory {} does not exist".format(cls.tc.td['DEPLOY_DIR']))
>          for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
>              cls.test_file = os.path.join(rpmdir, f)
> +            break
> +        else:
> +            raise Exception("Couldn't find the test rpm file {} in {}".format(rpm_doc, rpmdir))
>          cls.dst = '/tmp/base-passwd-doc.rpm'
>  
>      @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193969): https://lists.openembedded.org/g/openembedded-core/message/193969
> Mute This Topic: https://lists.openembedded.org/mt/103805481/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

