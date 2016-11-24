Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE817601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 02:02:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAO221Ex003544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Nov 2016 18:02:01 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 23 Nov 2016 18:02:00 -0800
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<e1b37a8090d9fe6d93d6f68301d5c89a45a93b37.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
Date: Thu, 24 Nov 2016 10:01:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1479899811.31880.37.camel@intel.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 02:02:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/2016 07:16 PM, Patrick Ohly wrote:
> On Tue, 2016-11-22 at 23:49 -0800, Robert Yang wrote:
>> [YOCTO #10710]
>>
>> Otherwise, we can't login as root when debug-tweaks is not in
>> IMAGE_FEATURES, and there is no other users to login by default, so
>> there is no way to login.
>
> Wait a second, are you really suggesting that OE-core should have a
> default root password in its default configuration?
>
> That's very bad practice and I'm against doing it this way. Having a
> default password is one of the common vulnerabilities in actual devices
> on the market today. OE-core should make it hard to make that mistake,
> not actively introduce it.
>
> So if you think that having a root password set (instead of empty), then
> at least make it an opt-in behavior that explicitly has to be selected.
> Make it an image feature so that images with and without default
> password can be build in the same build configuration. Changing
> base-passwd doesn't achieve that.
>
> Even then I'm still wondering what the benefit of a well-known password
> compared to no password is. Both are equally insecure, so someone who
> wants to allow logins might as well go with "empty password".

The problem is that when debug-tweaks or empty-root-password is not in
IMAGE_FEATURE, there is no way to login by default, which will surprise
the user. How about:

1) Let user can set root passwd via a variable when building.

Or/And

2) Warn the user at build time when the image is unable to login.

// Robert

>

