Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 720096AE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 16:56:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAMGu3cD008882
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 08:56:04 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 22 Nov 2013 08:56:03 -0800
Message-ID: <528F8C9C.7010406@windriver.com>
Date: Fri, 22 Nov 2013 11:55:56 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@intel.com>, "Hart, Darren"
	<darren.hart@intel.com>
References: <1385059626.3614.10.camel@dvhart-mobl4.amr.corp.intel.com>
	<1583959.f3sbDcLors@helios>
In-Reply-To: <1583959.f3sbDcLors@helios>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: distro/machine:kernel feature mapping and version checking
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
X-List-Received-Date: Fri, 22 Nov 2013 16:56:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-22 06:05 AM, Paul Eggleton wrote:
> Hi Darren,
>
> On Thursday 21 November 2013 18:47:07 Hart, Darren wrote:
>> Regarding the following 2 bugs:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5574
>> Add kernel version / configuration check mechanism
>>
>> and
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2267
>> Integrate DISTRO_FEATURES with KERNEL_FEATURES
>>
>> There is a need to reduce errors where a DISTRO config might break due
>> to lack of kernel support, things such as systemd. There is also
>> interest in enabling certain kernel features based on
>> DISTRO/MACHINE_FEATURES, such as wifi.
>>
>> Neither of these should depend on the Kernel Version as even with the
>> right version, if the CONFIG_* feature is missing, the image will not
>> work correctly. There is also the risk of false negatives when a feature
>> has been backported to a kernel version that didn't have the feature
>> previously.
>
> Right; I hadn't appreciated this when I wrote the bug but we definitely don't
> want to be checking versions.
>
>> The recommended approach would be to check for the required CONFIG_*
>> options after the linux-yocto configuration stage.
>>
>> There is also the topic of DISTRO_FEATURES ~= "wifi" impacting how the
>> kernel will be built. The MACHINE should have some say in how this is
>> done - if the machine can never have wifi, building wifi into the kernel
>> doesn't make a lot of sense. Something like the following might make
>> sense:
>>
>> for FEATURE in DISTRO_FEATURES:
>>      if MACHINE_FEATURES contains FEATURES:
>>          KERNEL_FEATURES += FEATURE_override
>>
>> Where FEATURE_override is defined something like this:
>>
>> FEATURE = FEATURE_default
>> if exists FEATURE_distro:
>>      FEATURE = FEATURE_distro
>> if exists FEATURE_machine:
>>      FEATURE = FEATURE_machine
>
> There are a couple of slight quirks here:
>
> 1) Not all features match up between DISTRO_FEATURES and MACHINE_FEATURES like
> this, just a select list. (This is why we currently have COMBINED_FEATURES.)
>
> 2) There is some handling in packagegroup-base.bbclass to enable
> wifi/bluetooth/3g/nfc functionality in userspace if these features are *not* in
> MACHINE_FEATURES but they are in DISTRO_FEATURES *and* MACHINE_FEATURES
> indicates some means of expansion exists e.g. pci, pcmcia, usbhost. Whether we
> want to try to support this at the kernel level I don't know.
>
>> This is effectively a fragment name which needs to be provided by the
>> linux-yocto kernel meta data as it will be kernel version dependent.
>>
>> The linkage I'm not sure about is how to know what to test for in the
>> kernel.bbclass without intimate knowledge of the kernel version CONFIG
>> options in recipe space.
>
> So are you convinced you want to try to solve these two with one solution in
> kernel.bbclass rather than giving individual recipes some easy methods of
> checking kernel config options? I agree they are related, but I had imagined

Darren and I have talked about this at length, and there's a balance to
be struck. If you are supporting a multi board/card/soc/arch system
that upgrades over time, you absolutely don't want to spray knowledge
of individual kernel config options around layers and recipes. I've
lived this and wouldn't wish it on anyone again.

A little bit of abstraction into "useful" names and having a mechanism
to map those names to the options specified by particular board's
kernel config actually provides is one part since you'll know on the
front end if you've asked for something that the board can't support.
And then having a query interface or automatic check (the kconf check
can do this already) for options that didn't make the final config, is
a good second check of the whole process.

> that we'd solve them both and solve them separately; only doing the feature
> map when we're building the kernel still leaves us with recipes like udev that
> aren't controlled by a specific feature but do still have kernel config
> requirements (of course, you could just assume that if you're using sysvinit
> then you're using udev and handle the issue that way, but that seems like a
> hack to me).

You still want to avoid some sort of "distributed" kernel policy, with
too much knowledge in each and every recipe, it really does need to be
another "requires and provides" sort of interface for these recipes to
get what they need in a kernel config.

I can't say that I addressed what you were asking directly, but I thought
I'd drop in with some experience and extra context :)

Cheers,

Bruce

>
> Cheers,
> Paul
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>


