Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F2CC5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 14:56:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14413.1708700183198394835
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 06:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hmIQ35Z1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00832240009;
	Fri, 23 Feb 2024 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708700181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZ4/ZEYFRjPTdiiPxddGgtqpYMUWObhE3zdAukqtLkk=;
	b=hmIQ35Z1SThrqNZQ1NnZlilhM7NjV0qEyTjVT5KRxFCBKwwX0zgMFV+V5bAd/PDE8r6hq3
	7olh4RTUKOC1NvxE3RjREyYQR4S/8EcBbiQVeaSQt6e2OS4qcgmXbufEJA2GsT6IlSdGUH
	05vye1IicQJcJxJB6+x/AF/cDPI/uGhJn2W0QZx0lf+FZBjPbUY+nfWnIiGC+kLO6LL25a
	sniqFeWRV4CpgWxZWglkNA+oE98NfWzJohj7YDfrWwpwVbLJSr4sXyZFsbMdg/YYHCV3IB
	9G02WcGXbaiTE72UHJd8CrdVlgZYDK+bHV0RSHwJbgSVBP2KG8iBlKXupJ0ecg==
Message-ID: <b61672c6-1540-43f5-9338-39e39166e164@bootlin.com>
Date: Fri, 23 Feb 2024 15:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 2/5] testimage: create a list of failed test
 post actions
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240223140345.1362972-1-alexis.lothore@bootlin.com>
 <20240223140345.1362972-3-alexis.lothore@bootlin.com>
 <d3714ffadcf0daaa8915c0fcce0de11cc7dc0879.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <d3714ffadcf0daaa8915c0fcce0de11cc7dc0879.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 14:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196095

On 2/23/24 15:42, Richard Purdie wrote:
> On Fri, 2024-02-23 at 15:03 +0100, Alexis Lothoré via lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>
>>
>> testimage is able to detect whenever a test run leads to some tests
>> failing, and execute some actions in this case. The only action currently
>> defined in such case is to retrieve artifacts from the target under test,
>> as listed in TESTIMAGE_FAILED_QA_ARTIFACTS
>>
>> In order to be able to add multiple actions, define a central function to
>> gather all "post actions" to run whenever a test has failed
>> (run_failed_tests_post_actions). This function contains a table listing all
>> functions to be called whenever a test fails. Any function in this table
>> will be provided with bitbake internal data dictionary ("d") and the
>> current runtime testing context ("tc"). Isolate all this feature in a
>> dedicated postactions.py file inherited by testimage.
>> This patch does not bring any functional change.
>>
>> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
>> ---
>> Changes in v2:
>> - move functions in a lib in oeqa instead of a bbclass
>> - use new shared helper get_json_result_dir()
>> ---
>>  meta/classes-recipe/testimage.bbclass | 42 +----------------
>>  meta/lib/oeqa/utils/postactions.py    | 68 +++++++++++++++++++++++++++
>>  2 files changed, 70 insertions(+), 40 deletions(-)
>>  create mode 100644 meta/lib/oeqa/utils/postactions.py
> 
> This patch doesn't apply in testimage.bbclass (hunk #3). Could you
> check the branch you're basing these off please?

My bad, I was _almost_ on master, but with a small commit adding some logs, and
I forgot about it.
v3 incoming.

Thanks,

Alexis

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


