Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DFBC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 11:09:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.19042.1707217758604652812
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 03:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dJ0XAvs0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D542F1BF205;
	Tue,  6 Feb 2024 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707217756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gY3rW4T7YJf5n5x3dnUF1M/fJKFMt5leGpjZG1o0M5w=;
	b=dJ0XAvs0Ywj5itC4uzjGggVBk80Ax5jHgC42H533H7ApNWrLHzx1AhLu8gPhReWKtIMyAq
	z/pn06e8CsuYyNXYW7nGyRgGn+vpSN10fH5T5WlNK8Rh1W+MVDSNkV+HhPuyhrUFOlEB3u
	+1EDu47M0DL8vkq+4Bl3C9J9BA0elw9dBIOiwvMmJBOdaFl4roHJiLqM2it2EZHlK2bxnp
	VIGspL36VDT1ZWcD8CnOEwTUlFSLfwVZVQ9phCAll1WM9EeZxi7Sjuar2g9qzLLWgQWSiN
	yxtsPIRpWr+Tam90ajjc6eTtX4JpABOkVB0PZmxwf+5q1vmNWhQG1vgzU9iB3w==
Message-ID: <d20952f5-2240-448b-a803-00dcc7b65575@bootlin.com>
Date: Tue, 6 Feb 2024 12:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v3 1/2] testimage: move
 TESTIMAGE_FAILED_QA_ARTIFACTS default to core-image
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20240205143757.81826-1-alexis.lothore@bootlin.com>
 <20240205143757.81826-2-alexis.lothore@bootlin.com>
 <5358961809135d87d89ec9004c7f4bc164c82fe2.camel@linuxfoundation.org>
 <93350237-c4ea-4859-93fa-113a3ccc0452@bootlin.com>
Content-Language: en-US
In-Reply-To: <93350237-c4ea-4859-93fa-113a3ccc0452@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 11:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194987

On 2/5/24 20:22, Alexis Lothoré wrote:
> Hello Richard, thanks for the fast review
> 
> On 2/5/24 16:08, Richard Purdie wrote:
>> On Mon, 2024-02-05 at 15:37 +0100, Alexis Lothoré via
>> lists.openembedded.org wrote:
> 
> [...]
> 
>>> -TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
>>> -    ${localstatedir}/log \
>>> -    ${sysconfdir}/version \
>>> -    ${sysconfdir}/os-release"
>>> -
>>>  # You can set (or append to) TEST_SUITES in local.conf to select the tests
>>>  # which you want to run for your target.
>>>  # The test names are the module names in meta/lib/oeqa/runtime/cases.
>>
>> I can imagine why ??= breaks if you use +=.
>>
>> Does this work if you change it from ??= to just = ?
> 
> I've indeed given a try to this before moving TESTIMAGE_FAILED_QA_ARTIFACTS to
> core-image, but when using "=" instead of "?=" or "??=", I observe that the part
> affecting TESTIMAGE_FAILED_QA_ARTIFACTS in core-image-ptest is not taken, so we
> are missing the ptests artifacts (but we still get the generic artifacts defined
> in testimage.bbclass). So to summarize:
> - "??=" or "?=" : we only get ptests artifacts, not the "generic" one
> (/etc/version, /var/log, etc)
> - "=": we only get the generic artifacts, not the ptests one.
> It is not clear for me why the second one fails, and
> TESTIMAGE_FAILED_QA_ARTIFACTS does not appear at all in 'bitbake -e" output,
> which makes it even more cryptic to me.
> 
>> I'd really prefer to keep this in testimage.bbclass.Recipes should be
>> able to use += if it is set with = and the addition is after the class
>> inherit.
> 
> Based on my understanding of bitbake manual, I theoretically agree with you,
> yet, as mentioned above this is not the behavior I observe, so I may be missing
> something important here. Maybe the parsing order is not the one I think I am
> observing, maybe its multiconfig, maybe something else.
> I can try to dig this further and clarify why it does not work as expected with "="

So I've did multiple attempts to make this work, and I see no way to define the
default value in testimage.bbclass with "=", and add content to it in
core-image-ptest.bbwith "+=". My understanding is that testimage is always
parsed after core-image-ptest.bb, so there is no nice way to set its default
value in there:
- "=" will always overwrite ptests artifacts set with "+="
- "?=" or "??=" will always be overwritten by ptests artifacts set with "+="
My configuration relies on IMAGE_CLASSES += 'testimage', which is also done in CI.

Still, I understand your concern about keeping default value in
testimage.bbclass. The only compromise I see here to both keep the default value
in testimage and be able to override it at user level is not to enrich it in
core-image-ptest but to redefine it:

diff --git a/meta/recipes-core/images/core-image-ptest.bb
b/meta/recipes-core/images/core-image-ptest.bb
index fb96c542c0a3..4a90181afd83 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -43,5 +43,8 @@ python () {
         raise bb.parse.SkipRecipe("No class extension set")
 }

-# Include ptest directory in artifacts to retrieve if there is a failed test
-TESTIMAGE_FAILED_QA_ARTIFACTS += "${libdir}/${MCNAME}/ptest"
+TESTIMAGE_FAILED_QA_ARTIFACTS = "\
+    ${localstatedir}/log \
+    ${sysconfdir}/version \
+    ${sysconfdir}/os-release \
+    ${libdir}/${MCNAME}/ptest"

That's for example what is done with TEST_SUITES. In this setup, we can keep a
default value in testimage, and override it as needed with append/prepend/remove
syntax at user level.

I'll wait a bit in case there's any comment or concern about this approach, and
then send a new version.

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


