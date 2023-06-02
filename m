Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1557DC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 12:39:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.11477.1685709552812864879
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 05:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y1fdOpF9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685709550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhPNKjEawlr7q+hyctYwGh6kCbFj3j4nnl4XVjc4eaQ=;
	b=Y1fdOpF9ye1hEqOGCNkzp3XrlOuqinK7zYRZHb/U+Eh3f0tea55FB5XerqSQVMIPFtH+Qo
	/UYAFX6BUGnAOb9Z6IeW8BZM3naDXBcCVSu5APUxNaZpOK3WZbDA3eJ9pFrOYcsnEo8uTX
	csXabrWisRBV7sbKwNAiLCwao9hPHLobyA/m9VoP6Ztymo1s3me4FyL9iageSZfwI6ZC31
	ChhV9nfm8sr32eKUeeP45Gq0IvuW9p2nJcuTRwNkDMxcP7meWtpmLj8z7bsLJGzPZ2xZdX
	PUVRooEuTLCJHEaopa/+gP8FwLTgeffqRVQouotWe5Q2K2LVKh4+7sgu7Ng3Kg==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA45460006;
	Fri,  2 Jun 2023 12:39:09 +0000 (UTC)
Message-ID: <fdc10ec6-515f-c844-2928-ea121efe39d5@bootlin.com>
Date: Fri, 2 Jun 2023 14:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [OE-Core][RFC][PATCH 2/3] testimage: shut down DUT later
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-3-alexis.lothore@bootlin.com>
 <88493a5e4afaa5917192c9d7baa2f5c3357a0185.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <88493a5e4afaa5917192c9d7baa2f5c3357a0185.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 12:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182314

Hello Richard,
On 6/2/23 13:55, Richard Purdie wrote:
> On Fri, 2023-06-02 at 11:50 +0200, Alexis Lothoré via
> lists.openembedded.org wrote:
>> Move target stop (for Qemu targets: qemu image stop) later in testimage
>> main function, especially _after_ having access to general test results, to
>> allow executing some other actions (like retrieving some files) on DUT
>> depending on test results (e.g. : retrieve some log files)
>>
>> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
>> ---
>>  meta/classes-recipe/testimage.bbclass | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
>> index 1bf0cb450ce4..6b10c1db09f9 100644
>> --- a/meta/classes-recipe/testimage.bbclass
>> +++ b/meta/classes-recipe/testimage.bbclass
>> @@ -393,7 +393,6 @@ def testimage_main(d):
>>          results = tc.results
>>      finally:
>>          signal.signal(signal.SIGTERM, orig_sigterm_handler)
>> -        tc.target.stop()
>>  
>>      # Show results (if we have them)
>>      if results:
>> @@ -404,6 +403,8 @@ def testimage_main(d):
>>                          dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
>>          results.logSummary(pn)
>>  
>> +    tc.target.stop()
>> +
> 
> I've not really had a chance to think about this properly, sorry but
> there is an issue that jumps out at me in this patch.
> 
> The stop is delibverately in a finally: clause so it always runs even
> if there is an exception in the code. You've moved it outside of this
> so the target would no longer be shut down any more in such an
> exception case. This would potentially leave images running in the case
> of exceptions and we want to avoid that.

I felt the danger while touching this part (and tested at least with a Ctrl-C
that everything was behaving correctly), but indeed I did not think enough about
the "any exception other than KeyboardInterrupt or BlockingIOError". I'll then
drop the patch moving this stop, and if it's ok, move the artifacts retrieval in
the finally clause, just before the stop.

> Cheers,
> 
> Richard

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


