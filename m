Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E717FCF394A
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:29:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.21031.1726756150058447779
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o5ntRWzo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5538B60005;
	Thu, 19 Sep 2024 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726756148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U1j74peR0q2RbXwMmTUz4xXiBKVdbSYpxqmBZRS/Ix4=;
	b=o5ntRWzoH1P/lQBPyMgRqWoHkd6MvuguEFlBR8GX1iYL74qfQbt2OsQ1KWunq24Jpobvbt
	VJbmnY+MoJ3ihrJVF3RoBH0z+iSS5Ievhtm8QFLNKBq1Nls0vGkNctvGISTzVEYOWoFo+W
	w2AQC0xznkrXlcWxxYaNPHaeI3PYjBAmuFREh2Iloka0IeboNUaveE3gxOvJ5JtAZyX1dy
	aCPakFu24yv9iYf1bOSZSeQJ2xTY9jI5xdvRiwtXnPXhXhVXUv4ZkmDa7gn2WmzGm/uEy+
	+BOM/r13DFGTeEhE7Ntecc7vP3Gj0C/88ZTSFJHnVzekbobhzN1DWr2jLj3ixg==
Message-ID: <f2d9c941-46f9-410d-84a0-f1861b6e1418@bootlin.com>
Date: Thu, 19 Sep 2024 16:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] oeqa/postactions: do not uncompress
 retrieved archive on host
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Steve Sakoman <steve@sakoman.com>
References: <20240812151404.134030-1-alexis.lothore@bootlin.com>
 <20240812151404.134030-3-alexis.lothore@bootlin.com>
 <17F6955C7A69DDF6.31299@lists.openembedded.org>
 <7a062edc9676b801da41ea875a7a4e82267a751f.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <7a062edc9676b801da41ea875a7a4e82267a751f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204691

Hello Richard,

On 9/19/24 14:58, Richard Purdie wrote:
> On Thu, 2024-09-19 at 08:42 +0100, Richard Purdie via
> lists.openembedded.org wrote:
>> On Mon, 2024-08-12 at 17:14 +0200, Alexis Lothoré via
>> lists.openembedded.org wrote:
>>> From: Alexis Lothoré <alexis.lothore@bootlin.com>

[...]

>>> --- a/meta/lib/oeqa/utils/postactions.py
>>> +++ b/meta/lib/oeqa/utils/postactions.py
>>> @@ -68,7 +68,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc,
>>> artifacts_list, outputdir):
>>>          (status, output) = tc.target.run(cmd, raw = True)
>>>          if status != 0 or not output:
>>>              raise Exception("Error while fetching compressed
>>> artifacts")
>>> -        p = subprocess.run(["tar", "zxf", "-", "-C", outputdir],
>>> input=output)
>>> +        with open(archive_name, "wb") as f:
>>> +            f.write(output)
>>>      except Exception as e:
>>>          bb.warn(f"Can not retrieve artifacts from test target:
>>> {e}")
>>
>>
>> This change is causing failures since archive_name isn't defined
>> anywhere :/
> 
> I'd also note that scarthgap actually throws errors:
> 
> https://valkyrie.yoctoproject.org/#/builders/73/builds/135/steps/12/logs/stdio
> 
> Exception: NameError: name 'artifact_path' is not defined
> 
> which is related to some of these patches :/.

I am out of  office right now with limited access to computer (I come back next
week but then I will be traveling to attend Kernel Recipes). If no one fixes it
before, I'll take a look and send a fix once I return to the office (end of next
week)

Alexis

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


