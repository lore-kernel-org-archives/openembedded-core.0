Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 533CD6C733
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 21:15:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s07LEvZk023782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jan 2014 13:14:57 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 7 Jan 2014 13:14:57 -0800
Message-ID: <52CC6E40.5060608@windriver.com>
Date: Tue, 7 Jan 2014 16:14:40 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<openembedded-core@lists.openembedded.org>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
	<52CC633C.6000404@free-electrons.com>
	<52CC65E5.6010003@windriver.com>
	<52CC68F0.1030605@free-electrons.com>
In-Reply-To: <52CC68F0.1030605@free-electrons.com>
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 21:15:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-07 03:52 PM, Alexandre Belloni wrote:
> On 07/01/2014 21:39, Bruce Ashfield wrote:
>
>>>
>>> As shown in my commit log, using yes '' | make oldconfig is still
>>> getting it wrong.
>>
>> But that was also my point. Since the target suggested in this
>> patch hasn't always existed (and hence has a kernel version binding),
>> why not use olddefconfig with this patch, and leave the functionality
>> closer to its existing behaviour ? We'd still have a kernel capability
>> binding, but we'd not have the =y converted to =m, and the default of
>> 'y' for new functionality would be maintained.
>>
>
> Hum, I'm not sure I follow you. oldnoconfig and olddefconfig are exactly
> the same. oldnoconfig has been renamed olddefconfig in 3.7 and
> oldnoconfig is an alias to olddefconfig since then. I'm using
> oldnoconfig only to be able to use that on a wider range of kernel versions.

I need to go run some of my own tests (and poke that the code). I'm
running out of time for the day, so need to have a closer look when
things slow down.

I'm not so much concerned about the differences between:

   defconfig -> savedefconfig -> config

and

   defconfig -> new kernel (oldconfig) -> config

vs

   defconfig -> new kernel (olddefconfig) -> config

i.e. What do the new config options offered by the new kernel
generate in the final .config between the two techniques.

Personally, I think the make target that is run should be configurable
via a variable (yes, I know we all hate new variables), but getting
this right for everyone is hard, and also not forcing everyone to write
their own kernel_do_configure() if they don't like this behaviour.

Bruce

>
>


