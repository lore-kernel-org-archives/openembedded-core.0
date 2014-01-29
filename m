Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 367ED6E87E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:46:57 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so3434071wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 04:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=U2e/Wg+lAHaGUueesY6/NP8J0plXf14eBaM2urdQxgE=;
	b=FQUccwBgSwE/hzogbz/T3wm/mA6ZTpEJLcq2VVgrp1j0TXHq4ICI4qlGnP5Xxuc1Ar
	OTP/toZ50MMhHVnoJWFOCE/6AXqHexomqaPJOABkcOn7rLm0s3R/kMzWXm027E+YcyEs
	gsjRo/USi0bCX3bqaOWznLdZettrmPcyvt4ZCArBO/gs7z4Ypkm8XWR001pJGROjLvtR
	9VtBjxmVuovzvgqsWLFsocc1/rIF+acfwHnJo72Nay8J4XttTijaueVfV4bwmEkqgGYk
	xBKJW4M2VFoT8J/HXz/ecPZgpNMXB1GClMmu7tWsWu7YYUUYOsCETNEs169XAFemfC5g
	LPJg==
X-Gm-Message-State: ALoCoQnJZQRcaQhFQI0TUirTPFd9gfWnKcxpfrcLcm+N+TAQgg7pzbWpF6Gb4oQNBNLiJjAAm87f
X-Received: by 10.180.20.100 with SMTP id m4mr19314640wie.32.1390999617738;
	Wed, 29 Jan 2014 04:46:57 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id fz5sm5155848wic.11.2014.01.29.04.46.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 04:46:56 -0800 (PST)
Message-ID: <52E8F83F.7090300@dresearch-fe.de>
Date: Wed, 29 Jan 2014 13:46:55 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1390833588.17424.254.camel@ted> <1390993195.24655.56.camel@ted>
	<52E8EA6A.2020803@dresearch-fe.de>
	<3453178.7rjKagprWh@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <3453178.7rjKagprWh@peggleto-mobl5.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 12:46:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 29.01.2014 12:52, Paul Eggleton wrote:
> On Wednesday 29 January 2014 12:47:54 Steffen Sledz wrote:
>> On 29.01.2014 11:59, Richard Purdie wrote:
>>> On Wed, 2014-01-29 at 11:14 +0100, Steffen Sledz wrote:
>>>> On 27.01.2014 15:39, Richard Purdie wrote:
>>>>> Its rather sad that people don't appear to read local.conf and then
>>>>> complain about slow builds when they're just using a single thread.
>>>>> Most systems have more than one core now so we might as well use a more
>>>>> automatic default for these values. This may lead to better experiences
>>>>> for new users.
>>>>>
>>>>> [YOCTO #2528]
>>>>>
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>> ---
>>>>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>>>>> index 71856b8..36d33e1 100644
>>>>> --- a/meta/conf/local.conf.sample
>>>>> +++ b/meta/conf/local.conf.sample
>>>>> @@ -18,12 +18,18 @@
>>>>>
>>>>>  # option determines how many tasks bitbake should run in parallel:
>>>>>  #
>>>>>  #BB_NUMBER_THREADS ?= "4"
>>>>>
>>>>> +#
>>>>> +# Default to setting automatically based on cpu count
>>>>> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>>>>>
>>>>>  #
>>>>>  # The second option controls how many processes make should run in
>>>>>  parallel when # running compile tasks:
>>>>>  #
>>>>>  #PARALLEL_MAKE ?= "-j 4"
>>>>>  #
>>>>>
>>>>> +# Default to setting automatically based on cpu count
>>>>> +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
>>>>> +#
>>>>>
>>>>>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j
>>>>>  4" would # be appropriate for example.
>>>>
>>>> On our Fedora-18 build host this change leads to the following exception.
>>>> :(> 
>>> Do you have:
>>>
>>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=721773072da08cf0f5e12
>>> 06961ada3083b6722b4
>> No.
>>
>> But now it becomes really interesting. As mentioned before it works well on
>> our openSUSE-13.1 build host (without this commit)???
> 
> Are you sure you're not overriding BB_NUMBER_THREADS / PARALLEL_MAKE on the 
> machine where it's "working"? You can use bitbake -e | less (variable history) 
> to be sure.

Yes, this was a good hint.

Sorry for disturbance.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

