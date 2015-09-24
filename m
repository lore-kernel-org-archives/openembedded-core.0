Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE48276417
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:29:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OBTnMx015964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Sep 2015 04:29:49 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 24 Sep 2015 04:29:49 -0700
Message-ID: <5603DEAB.4010005@windriver.com>
Date: Thu, 24 Sep 2015 19:29:47 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1442311946.git.liezhi.yang@windriver.com>		
	<5600C0E4.4030606@windriver.com>	
	<1443045619.19044.40.camel@linuxfoundation.org>	
	<56039856.3050902@windriver.com>
	<1443086310.19044.56.camel@linuxfoundation.org>
In-Reply-To: <1443086310.19044.56.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Fixes for mutilib SDK
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
X-List-Received-Date: Thu, 24 Sep 2015 11:29:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/24/2015 05:18 PM, Richard Purdie wrote:
> On Thu, 2015-09-24 at 14:29 +0800, Robert Yang wrote:
>>
>> On 09/24/2015 06:00 AM, Richard Purdie wrote:
>>> On Tue, 2015-09-22 at 10:45 +0800, Robert Yang wrote:
>>>> Hi RP and Ross,
>>>>
>>>> These patches are required by multilib's do_rootfs and do_populate_sdk,
>>>> otherwise they are broken or partly broken. These patches don't affect
>>>> do_rootfs or do_populate_sdk without multilib are to be installed.
>>>
>>> Thanks for these. Patches 1-4 look ok, we can try them in -next however
>>> I do worry about 5 and 6. Could you confirm if you tested those before
>>> or after the recent data store changes? Its possible the OVERRIDE fixes
>>> there may have fixed the issues 5 and 6 were trying to fix so I'd like
>>> to confirm if they're still needed or not.
>>>
>>> If they are, they don't look like the right solution so I'll need to
>>> look further at the exact issue there.
>>
>> Hi RP,
>>
>> I tested on latest master branch without patch 5 and 6, we still have
>> the issues.
>>
>> # local.conf
>> MACHINE = "qemux86-64"
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> # populate sdk for lib32-core-image-minimal
>> $ bitbake lib32-core-image-minimal -cpopulate_sdk
>>
>> # Install sdk
>> $
>> ./tmp/deploy/sdk/poky-glibc-x86_64-lib32-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh
>>
>> # Check messages on the screen:
>> SDK has been successfully set up and is ready to be used.
>> Each time you wish to use the SDK in a new shell session, you need to source the
>> environment setup script e.g.
>>    $ . /buildarea/lyang1/sdk32/environment-setup-core2-64-pokymllib32-linux
>>
>> This is incorrect, it should be environment-setup-x86-pokymllib32-linuxm
>> (core2-64 != x86).
>>
>> # Check the installed sdk, the sysroots are:
>> core2-64-pokymllib32-linux  x86_64-pokysdk-linux
>>
>> But SDKTARGETSYSROOT in environment-setup-core2-64-poky-linux and
>> environment-setup-x86-pokymllib32-linux is /path/to/sysroots/core2-64-poky-linux
>> , this is incorrect.
>
> Thanks, I will look into that further. With your first four patches
> applied, the autobuilder showed this issue:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/500/steps/Running%20Sanity%20Tests_2/logs/stdio
>
> I've not looked into what is going on there as yet.

Sorry, I looked at it just now, but I think that we need fix the test case,
the test case checks whether /usr/bin/connman-applet is 32bit, and I think
that the config is:

IMAGE_INSTALL_append = " lib32-connman-gnome"

Before these patches, only lib32-connman-gnome were installed which was
incorrect since connman-gnome should be installed, too (RDEPENDS by
packagegroup-core-x11-sato), this was similar to the bugs:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4408
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7610

Now these patches have fixed the problem, so both connman-gnome
and lib32-connman-gnome have installed, if we want to make sure
/usr/bin/connman-applet is 32bit, we need set:

RPM_PREFER_ELF_ARCH = "1"

If we'd like 64bit wins, we need set:

RPM_PREFER_ELF_ARCH = "2"

Maybe we need update our test cases or autobuilder's multilib
settings, please ?

// Robert

>
> Cheers,
>
> Richard
>
>
>

