Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A02216FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 21:21:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8ILLtr2003474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Sep 2017 14:21:55 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 18 Sep 2017 14:21:54 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
	<CAMKF1soGGZ6J1x0yADqOUjbB2Nm8vD=_usgz+PRf8z=8emnfug@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <95f1039b-16b3-df4e-d9c2-0ce018f68dda@windriver.com>
Date: Mon, 18 Sep 2017 16:21:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soGGZ6J1x0yADqOUjbB2Nm8vD=_usgz+PRf8z=8emnfug@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain / /bin/sh requirement / ldconfig backfill
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
X-List-Received-Date: Mon, 18 Sep 2017 21:21:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/18/17 3:53 PM, Khem Raj wrote:
> On Mon, Sep 18, 2017 at 12:30 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> I tried to build the meta-toolchain, toolchain SDK today and received an error.
>> My system is configured to use package_rpm by default...
>>
>> The error I got was:
>>
>> Error:
>>  Problem: package
>>           packagegroup-core-standalone-sdk-target-1.0-r8.noarch requires
>>           libstdc++6, but none of the providers can be installed
>>   - conflicting requests
>>   - nothing provides /bin/sh needed by libstdc++6-7.2.0-r0.i586
>>
>>
>> The /bin/sh dependency seems kind of odd at first, but after a little research
>> it turns out that by default 'ldconfig' support is now enabled.  This
>> automatically adds a post-install script to any package with a library in it:
>>
>> #!/bin/sh
>> if [ x"$D" = "x" ]; then
>>         if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
>> fi
>>
>>
>> That in-turn causes the dependency of /bin/sh to occur.
>>
>> Because of this, there is no way (with a default configuration) to build
>> meta-toolchain....
>>
>> Investigating further, ldconfig support moved from "USE_LDCONFIG" to a
>> distribution configuration.  It does this via the "DISTRO_FEATURES_BACKFILL"
>> (introduced in commit: a905df2dd8f43a2febffa64a39b6e508510326a0)
>>
>>
>> If I add to my configuration:
>>
>>  DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " ldconfig"
>>
>> This works around the issue...  but doesn't resolve the default issue....
>>
>> So my question is, is this behavior (the failure case) really acceptable without
>> telling the user what is happening?  Or do we need to add something to the
>> system that says meta-toolchain can't be used with this DISTRO_FEATURE?  or...
>>
> 
> ldconfig is not very useful with cross toolchain unless its a cross tool too
> I think the particular recipe should check for distro feature before calling
> it out in a post_install

Since it just installs target packages, which causes this issue -- that really
is the problem.

If someone WANTS ldconfig, this could fail for them (without a message
explaining "why").   If someone doesn't want ldconfig, it's not really all that
obvious how to disable it.

I suspect in my own distributions I need to just unconditionally set the
DISTRO_FEATURES_BACKFILL_CONSIDERED line.

--Mark

