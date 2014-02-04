Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC246E8C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 08:58:48 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id u57so3721409wes.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 00:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hsGarv/4Fpuv2qyzOX7YN8QGBD0Z2w9pj5tyXpeK+lc=;
	b=FYSRCOXaQkBDWT3g8RXBe3yhX+7yTHd10eKElCnWZIrCahUT6/yiMZgIxpws6WdL2H
	Ns2ytH9RbjPfLoOTYmQ76fDxgM3ovIC41rgxpWHnwPj6+D0fi8BXkSxkuAwI2o42mq0R
	Em5JIMPcRSs37fTgZQYgUk6q8VEV4nvH2z6SD0Qa7Cu9U2Sdl1+57fWsbaHjTbYKx56k
	t7C1EJFHaFC/OceLr1E1Ilvbol6GZaHwRSazMeNpO8k7w0VNgVU27VS09fNkpP7NRA+h
	6DVEUKUogdbAdumBRVPhsrhsGSi+ac+9n4JfCW+NYvwc9L/Z1/DIar9aTcOJ/h06mYIA
	ErMQ==
X-Gm-Message-State: ALoCoQn4HfZMLrem9mwR6/9+btyiGFtxQKxlkfe/oyFqb/ZoBpBhysfnTh3ZHignuWcK5XGKDEFI
X-Received: by 10.194.71.47 with SMTP id r15mr27356422wju.19.1391504329120;
	Tue, 04 Feb 2014 00:58:49 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id n3sm33720358wix.10.2014.02.04.00.58.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Feb 2014 00:58:48 -0800 (PST)
Message-ID: <52F0ABC7.1010908@linaro.org>
Date: Tue, 04 Feb 2014 09:58:47 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>	
	<1390312633.874.84.camel@ted> <52DE7E17.2090301@linaro.org>
	<1390316993.874.85.camel@ted>
In-Reply-To: <1390316993.874.85.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2014 08:58:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2014 04:09 PM, Richard Purdie wrote:
> On Tue, 2014-01-21 at 15:03 +0100, Koen Kooi wrote:
>> On 01/21/2014 02:57 PM, Richard Purdie wrote:
>>> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
>>>> Marks original commit message and variable documentation state that stripping and splitting are independent of eachother, but package.bbclass ANDs the two INHIBIT flags to see which files can be stripped and/or split.
>>>>
>>>> Original behaviour:
>>>>
>>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>>>> INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split
>>>>
>>>> Behaviour after this patch:
>>>>
>>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>>>> INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split
>>>>
>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>> ---
>>>>    meta/classes/package.bbclass | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> FWIW this resulted in a failure on minnow:
>>>
>>> http://autobuilder.yoctoproject.org/main/builders/minnow/builds/15/steps/BuildImages/logs/stdio
>>>
>>> So we may have some fixing up to do before this change can be merged...
>>
>> I have that QA issue as warning not as error. I guess that's why my
>> builds kept working :)
>>
>> Aside from that, what are your thoughts on this patch?
>
> I'm ok with it in principle but I'd like to see known build issues fixed
> before it goes in since red autobuilders cause me enough grief
> already ;-).

What's the status on this? I know a fix went into meta-intel (albeit it 
in a legally questionable way, but that's their problem) and the other 
affected layers have received patches for it.

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

