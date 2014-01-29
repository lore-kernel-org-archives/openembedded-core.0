Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 894016E82D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 11:47:56 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id n12so3323900wgh.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 03:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=r65MivJiPsBVCC54CmkQ/0IN/ITNXOzKGoFSlXP6pa0=;
	b=dUoKIiBssAiFcEZ2dyXynV/1EhvpeKif9j1swqaEfVTMf3HSOXTUc4aOlG1YJkRV8n
	L6DqpLvxsKgZEMrQPyuuDNqyL4xa//vIBxD76cKU/S/m8dsCirsJLR2W+ElXFTythMqB
	oepSsxlKVJpfZmhG9WpSKGkY80VT6l0GxnPkDVUej1u3CPzPbr99ntob2G0sUBxC+ZFb
	1F5RNsgi8I2UWw7cRbCsTWDM3Hnjj7nu0N0hGu8Qx8iZd1anHGlaFHjwVkbWecBNRq69
	vv1wBJ7e8r5Y/s2eQezmk2WUE3BzkHz6tpDS+FdJHM+ot2oNXgXG7hof7aN70JJWOwgm
	NQAw==
X-Gm-Message-State: ALoCoQlHg+FVfGzzVyO5tZYs67mgm0VpnUMwiYLToqHXg6579/FiZAYYHOP0ujacxsNQn0kqBJkb
X-Received: by 10.195.13.113 with SMTP id ex17mr4802746wjd.0.1390996076782;
	Wed, 29 Jan 2014 03:47:56 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id r1sm31029098wia.5.2014.01.29.03.47.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 03:47:55 -0800 (PST)
Message-ID: <52E8EA6A.2020803@dresearch-fe.de>
Date: Wed, 29 Jan 2014 12:47:54 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390833588.17424.254.camel@ted>	
	<52E8D497.1080708@dresearch-fe.de> <1390993195.24655.56.camel@ted>
In-Reply-To: <1390993195.24655.56.camel@ted>
X-Enigmail-Version: 1.6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 29 Jan 2014 11:47:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2014 11:59, Richard Purdie wrote:
> On Wed, 2014-01-29 at 11:14 +0100, Steffen Sledz wrote:
>> On 27.01.2014 15:39, Richard Purdie wrote:
>>> Its rather sad that people don't appear to read local.conf and then complain
>>> about slow builds when they're just using a single thread. Most systems have
>>> more than one core now so we might as well use a more automatic default
>>> for these values. This may lead to better experiences for new users.
>>>
>>> [YOCTO #2528]
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>>> index 71856b8..36d33e1 100644
>>> --- a/meta/conf/local.conf.sample
>>> +++ b/meta/conf/local.conf.sample
>>> @@ -18,12 +18,18 @@
>>>  # option determines how many tasks bitbake should run in parallel:
>>>  #
>>>  #BB_NUMBER_THREADS ?= "4"
>>> +#
>>> +# Default to setting automatically based on cpu count
>>> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>>>  # 
>>>  # The second option controls how many processes make should run in parallel when
>>>  # running compile tasks:
>>>  #
>>>  #PARALLEL_MAKE ?= "-j 4"
>>>  #
>>> +# Default to setting automatically based on cpu count
>>> +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
>>> +#
>>>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>>>  # be appropriate for example.
>>
>> On our Fedora-18 build host this change leads to the following exception. :(
> 
> Do you have:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=721773072da08cf0f5e1206961ada3083b6722b4

No.

But now it becomes really interesting. As mentioned before it works well on our openSUSE-13.1 build host (without this commit)???

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

