Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7479671AB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 03:38:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAO3cffU023953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Nov 2016 19:38:41 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 23 Nov 2016 19:38:41 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
	<adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
	<1525289.rQK3S6YPkZ@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
Date: Thu, 24 Nov 2016 11:38:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1525289.rQK3S6YPkZ@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 03:38:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/24/2016 11:18 AM, Paul Eggleton wrote:
> On Thu, 24 Nov 2016 10:01:59 Robert Yang wrote:
>> On 11/23/2016 07:16 PM, Patrick Ohly wrote:
>>> On Tue, 2016-11-22 at 23:49 -0800, Robert Yang wrote:
>>>> [YOCTO #10710]
>>>>
>>>> Otherwise, we can't login as root when debug-tweaks is not in
>>>> IMAGE_FEATURES, and there is no other users to login by default, so
>>>> there is no way to login.
>>>
>>> Wait a second, are you really suggesting that OE-core should have a
>>> default root password in its default configuration?
>>>
>>> That's very bad practice and I'm against doing it this way. Having a
>>> default password is one of the common vulnerabilities in actual devices
>>> on the market today. OE-core should make it hard to make that mistake,
>>> not actively introduce it.
>>>
>>> So if you think that having a root password set (instead of empty), then
>>> at least make it an opt-in behavior that explicitly has to be selected.
>>> Make it an image feature so that images with and without default
>>> password can be build in the same build configuration. Changing
>>> base-passwd doesn't achieve that.
>>>
>>> Even then I'm still wondering what the benefit of a well-known password
>>> compared to no password is. Both are equally insecure, so someone who
>>> wants to allow logins might as well go with "empty password".
>>
>> The problem is that when debug-tweaks or empty-root-password is not in
>> IMAGE_FEATURE, there is no way to login by default, which will surprise
>> the user. How about:
>>
>> 1) Let user can set root passwd via a variable when building.
>>
>> Or/And
>>
>> 2) Warn the user at build time when the image is unable to login.
>
> There are problems with both of these:
>
> 1) I'm concerned that by making it trivially easy this will encourage users to
> set a root password and forget they have done so. This may lead to yet more
> products going out with default root passwords, and that is not a good thing.
>
> 2) Having no root password in this scenario is not necessarily a mistake, it
> may be intentional. If nobody ever needs to log into your device via a
> terminal, then why would you need a root password set at all? In that scenario
> you wouldn't want to be implying "this could be wrong, you should set a root
> password".

Hi Paul,

Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky, and
there is no passwd, so that user can login easily without a passwd, I think
that current status is more unsafe ? And when user realizes this, he
wants to add a passwd, but sorry, there is no easy way.
The anaconda installer's (used by Redhat) kickstart file can easily sets
a passwd, you can even set an un-encrypted password, are there many complains
about that ? When people can get your device (hardware), it's hard to prevent
people login you device.

// Robert

>
> If we need more documentation around this so that people understand how this
> aspect works (and I don't doubt that we do, people do ask about it) then by
> all means we should improved the documentation.
>
> Cheers,
> Paul
>

