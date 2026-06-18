Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36586CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 19:06:51 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26837.1781809606651209916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 12:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=r77OgSKL;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gh9FH11Dxz9tnw;
	Thu, 18 Jun 2026 21:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781809603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjtqqN+uVK9D1otk1Xiz59NXp9UielTabVI4wAMdTpY=;
	b=r77OgSKL8Knh1SBma2ccjVKh1FeARhn6u+cYs5vZjJVbNAyINWb7czeuRBFW/Am1JlfU8A
	2SbgPcIo2hL5UHMVrIp2ZiHd8155y1aUFLWkIMbTpuZcTR1J3ekmTWa6R0N6tujp1MJYYp
	7GqGPvYNnahFo8T2xTxlJeJkXhjKBJSzLx9u814R28Lr60gjgg0KfcGt2Ic5S57Tdw8/RA
	EQk9KnymT0u++5Fww27j4to1eviIXo/Bb8G5hskRzuUr69/KV7BPTjgGTZ1q0CFuP9e/i+
	wV83YRigKssCdGA75rmcIidS4gzBsFDxLz+Sa0RfkCQbAizI0Ft19bXn8jwhCA==
Message-ID: <72fabcb4-57d2-4b70-acb9-90fd52ea0469@mailbox.org>
Date: Thu, 18 Jun 2026 21:06:41 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] kernel-fit-image.bbclass: Fix operation with
 KERNEL_DTBVENDORED = "1"
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Yoann Congal <yoann.congal@smile.fr>
References: <20260616214945.40714-1-marek.vasut@mailbox.org>
 <DJBYLLSOVDCK.3V9DIPDH2YV6M@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DJBYLLSOVDCK.3V9DIPDH2YV6M@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: twzq33mmxhgejoq3qom1w1efj9zfxb93
X-MBO-RS-ID: e48fc922aa9014f7077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 19:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239100

On 6/18/26 8:25 AM, Mathieu Dubois-Briand wrote:
> On Tue Jun 16, 2026 at 11:49 PM CEST, Marek Vasut via lists.openembedded.org wrote:
>> In the case KERNEL_DTBVENDORED = "1" , the fitImage configuration
>> subnode names used to contain the vendor prefix in OE 5.0 , e.g.:
>> "
>> $ mkimage  -l fitImage
>> ...
>>   Configuration 0 (conf-freescale_imx8mn-board.dtb)
>>                         ^^^^^^^^^^
>> ...
>> "
>>
>> With OE 6.0 this is no longer the case and KERNEL_DTBVENDORED = "1"
>> and KERNEL_DTBVENDORED = "0" behave exactly the same way:
>> "
>> $ mkimage  -l fitImage
>> ...
>>   Configuration 0 (conf-imx8mn-board.dtb)
>> ...
>> "
>>
>> Users depend on the correct configuration subnode names as those
>> are used in the U-Boot "bootm" command when booting fitImages.
>>
>> Fix this by converting each entry in the KERNEL_DEVICETREE list
>> into the configuration subnode name by replacing all of its path
>> separators with underscores.
>>
>> Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image implementation")
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Yoann Congal <yoann.congal@smile.fr>
>> ---
>> NOTE: This should ideally be added into OE 6.0 too
>> ---
> 
> Hi Marek,
> 
> Thanks for your patch.
> 
> It looks like this is breaking the
> fitimage.KernelFitImageRecipeTests.test_fit_image_ext_dtb_dtbo selftest:
> 
> 2026-06-17 18:15:46,751 - oe-selftest - INFO - fitimage.KernelFitImageRecipeTests.test_fit_image_ext_dtb_dtbo (subunit.RemotedTestCase)
> 2026-06-17 18:15:46,752 - oe-selftest - INFO -  ... FAIL
I think the oe selftest fails because KERNEL_DTBVENDORED is undefined, I 
inverted the conditional to handle that case and sent a V2, locally the 
oe selftest for fitImage now passes. Thanks !

