Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48F227E715
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 02:11:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5C2BJhl028706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jun 2019 19:11:19 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 11 Jun 2019 19:11:18 -0700
To: <richard.purdie@linuxfoundation.org>, Sakib Sajal
	<sakib.sajal@windriver.com>, "Chen, Qi" <qi.chen@windriver.com>
References: <1607ff2c-d02a-a867-f761-bd3ecd2d1af3@windriver.com>
	<f89948476688118012710c34f880bac3d5114faf.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f630eb20-16b6-bb2c-6f8b-62bca4029799@windriver.com>
Date: Tue, 11 Jun 2019 22:11:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f89948476688118012710c34f880bac3d5114faf.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bash ptests: use runuser? also remaining errors.
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
X-List-Received-Date: Wed, 12 Jun 2019 02:11:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 6/11/19 8:05 PM, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-06-11 at 15:00 -0400, Randy MacLeod wrote:
>> Richard, et. al.
>>
>> I have two patches (ptest-runner, bash) that enable all but two [*]
>> of the bash-ptests to pass. A potential problem is that when started
>> by
>> ptest-runner, 'su' (both busybox and util-linux versions), results in
>> a few of bash's tests failing whereas they work if started by
>> 'runuser'.
>> The test failure is due to a warning:
>>       bash: cannot set terminal process group (16036): \
>>             Inappropriate ioctl for device
>> that contaminates the test logs and makes a diff with the expected
>> results fail. I can easily redirect that warning to /dev/null but
>> that seems wrong and would be a patch that we'd have to carry in
>> oe-core.
>>
>> To get 'runuser' from util-linux into an image, it seems that you
>> need:
>>    - the RDEPENDS for ptest,
>>    - REQUIRED_DISTRO_FEATURES = "pam" in bash.inc, and
>>    - to set the 'pam' DISTRO_FEATURE in your local.conf.
> 
> The requirement for pam is a problem as we can't require that for
> ptests.

Ugh, I was expecting that you might say that. :-/

> 
>> Is that something you are willing to do for all ptests or perhaps
>> just for bash's ptests?  If so, I'll clean-up my ptest-runner patch
>> and send this to the list.
>>
>>
>> I also considered using util-linux's 'setpriv' but enabling that
>> has turned into a mess of dependency loops and other build problems.
>> man runuser:
>>      If the PAM session is not required then recommended solution
>>      is to use setpriv(1) command.
> 
> What kind of dependency loops? Can we just enable it for target builds,
> would that help?

The loops are due to adding libcap-ng to the DEPENDS for
util-linux so that 'setpriv' can be built. With that
change we have:
    util-linux -> libcap-ng -> python3 -> util-linux

libcap-ng provides both a low-level library and
a python wrapper. If I split that up quickly by just commenting
out the python parts and util-linux builds fine so that's
promising.

>> Other solutions to properly starting user tests from root are
>> welcome!
> 
> Not sure but I think we're going to need to find some. Enabling setpriv
> sounds like the easiest first option but it depends on the errors.

Okay, I'll work on that next, err now... and it mostly works!
Now there are 4 ptest failures rather than 2 with runuser.
A newer version of util-linux/sys-utils/setpriv.c has a
   --reset-env
option that I suspect will help with that.

Chen,
Do you happen to have a util-linux update underway?
I need 2.33.2 or newer.


It's possible that there's also still a bug in ptest-runner that
should be fixed or some shell hackery that might work-around
the problems seen with 'su'.

Thanks for the quick reply,

../Randy

> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux

