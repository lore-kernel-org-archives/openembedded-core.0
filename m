Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDC9962132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Nov 2016 16:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uADGGCZO005185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 13 Nov 2016 08:16:12 -0800 (PST)
Received: from soho-mhatle-m.local (147.11.116.45) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 13 Nov 2016 08:16:11 -0800
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.LFD.2.20.1611121436420.20479@localhost.localdomain>
	<ca53cb96-5c1e-35f1-55f3-8f61897de18f@windriver.com>
	<alpine.LFD.2.20.1611130434570.28277@localhost.localdomain>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d8928e95-46b1-4369-521d-62178c8c6510@windriver.com>
Date: Sun, 13 Nov 2016 11:16:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1611130434570.28277@localhost.localdomain>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: WRL error: "Can't locate Config_heavy-target.pl in @INC" -- OE versus WRL
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
X-List-Received-Date: Sun, 13 Nov 2016 16:16:21 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 11/13/16 4:49 AM, Robert P. J. Day wrote:
> 
>   sorry, i'm still confused, let me make sure i understand this ...
> 
> On Sat, 12 Nov 2016, Mark Hatle wrote:
> 
>> On 11/12/16 2:45 PM, Robert P. J. Day wrote:
>>>
>>>   (note: this is actually an error i'm getting under wind river linux
>>> 8, i'm just curious as to why OE works just fine.)
>>>
>>>   as mentioned, when trying to build a trivial hand-rolled perl recipe
>>> under wind river linux 8, i'm getting:
>>>
>>> | Can't locate Config_heavy-target.pl in @INC (@INC contains: ... long
>>> path snipped ...) at
>>> .../tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Config.pm
>>> line 88.
>>
>> My suspicion is that you are not using the buildtools-tarball with
>> your OE build, ...
> 
>   that would be correct, i've never used that, never needed to, on my
> fedora system. which means (correct me if i'm wrong) that i *am* using

You are using host content to build instead of the buildtools-tarball content.
(buildtools-tarball is supposed to include all of the host's tools necessary to
build a reasonable system with the correct versions.)

> some natively-installed content, based on ASSUME_PROVIDED from
> bitbake.conf. and i notice there's a few extra lines there than what i
> remember from quite some time back, including

All the assumed provide says is if anything requires one of those items, assume
it exists -- don't complain or try to build it.

>     hostperl-runtime-native \
> 
> so i'll have to look at what that means. but the point here is that
> the OE build *does* work.
> 
>> but Wind River Linux automatically uses this in an attempt to avoid
>> host incompatibilities with all of the random hosts our customers
>> use.
> 
>   ok, so WRL builds and uses the buildtools-tarball, and that's where
> i get the aforementioned error.

if there is a bug in the buildtools-tarball content (nativesdk packages) then it
can manifest itself like this.

>> To use the OE version of buildtools-tarball, you will have to build
>> it, extract it and then source the environment file.
> 
>   and that's where i'm confused ... i'm not using the OE version of
> buildtools-tarball with my OE build and things *work*, so why would i
> want to use it *now*? this seems backwards.

If your host is missing content and you don't have root access.. you don't have
a choice but to build the components yourself -- or the easier way to build and
use the buildtools-tarball.

A -lot- of commercial customers do not have root access on their build machines
(either at their desk or elsewhere).  So when they find something is missing,
say python3 or the right version or tar or make or git... they don't have any
easy way to fix the problem.  The buildtools-tarball content provides these and
other components.

>>>   but building precisely the same recipe under regular OE (actually,
>>> poky) works just fine. i did some searching, and found this:
>>>
>>> https://patchwork.openembedded.org/patch/111047/
>>>
>>> but i have no idea what it means. i also notice that the standard
>>> bitbake.conf (which i haven't looked at in a while), now contains a
>>> few more ASSUME_PROVIDED entries, including:
>>>
>>>     hostperl-runtime-native \
>>>     hostpython-runtime-native \
>>
>> f4dade8e meta/conf/bitbake.conf         (Ed Bartosh                2016-01-07
>> 13:39:39 +0200 179)     hostperl-runtime-native \
>> 8a474057 meta/conf/bitbake.conf         (Ed Bartosh                2016-01-13
>> 10:03:04 +0200 180)     hostpython-runtime-native \
>>
>> These are newer then Wind River Linux 8, which is based on Yocto Project 2.0 /
>> Jethro which was released around Nov 2015.
>>
>>> while the WRL version contains:
>>>
>>>     perl-native-runtime \
>>>     python-native-runtime \
>>
>> You you look at Jethro you will see:
>>
>> 34927dfa meta/conf/bitbake.conf         (Richard Purdie          2007-12-18
>> 15:04:06 +0000 174)     perl-native-runtime \
>> 34927dfa meta/conf/bitbake.conf         (Richard Purdie          2007-12-18
>> 15:04:06 +0000 175)     python-native-runtime \
>>
>> So you are attempting to compare apples to oranges (master/morty/krogoth against
>> jethro.)
> 
>   so ... what is the solution here? how would i tweak my WRL build to
> resolve this issue? again, apologies for asking a WRL question on the
> OE list, i'm just trying to understand the difference.

First if you are comparing any commercial embedded Linux to OE, be sure to be
comparing the same version.  In this case WRL 8 to master, morty or krogoth is
not a reasonable comparison as it is based on Jethro.  (The commercial vendor
will be able to tell you what version they are based on.)

If you are having a specific problem with a commercial distribution you should
contact them for support.  Our support organization can help you determine if
it's a usage problem, or something broken in our product.

I've not run across this issue, so I can't help any further on the product side.

--Mark

> rday
> 


