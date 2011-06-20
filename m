Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QYVIZ-0002Hr-Dl
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 05:37:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2011 20:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,391,1304319600"; d="scan'208";a="15735109"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 19 Jun 2011 20:33:42 -0700
Message-ID: <4DFEBF96.9030806@intel.com>
Date: Sun, 19 Jun 2011 20:33:42 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308249837.git.scott.a.garman@intel.com>	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>	<4DFA97A1.9090909@gmail.com>
	<4DFB820B.9070303@intel.com>	<BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>	<4DFB8CAE.8030100@intel.com>	<BANLkTin19xUSV4Rg7u16e3C_s9xkKieasQ@mail.gmail.com>	<4DFB98A2.9040303@intel.com>
	<4DFEACB3.7090405@windriver.com>
	<BANLkTinnb_w2PNoADc3jgqpxeLcyG=z6YA@mail.gmail.com>
In-Reply-To: <BANLkTinnb_w2PNoADc3jgqpxeLcyG=z6YA@mail.gmail.com>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic	login.defs options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2011 03:37:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2011 07:41 PM, Khem Raj wrote:
> On Sun, Jun 19, 2011 at 7:13 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 6/17/11 1:10 PM, Scott Garman wrote:
>>> On 06/17/2011 10:22 AM, Otavio Salvador wrote:
>>>> On Fri, Jun 17, 2011 at 17:19, Scott Garman<scott.a.garman@intel.com>    wrote:
>>>>> Sorry, I forgot to mention that shadow-utils-native is what is used to
>>>>> modify the passwd/group files in the target sysroot. It seems that having a
>>>>> -native recipe install files into a target sysroot would be worse than
>>>>> including an optional file with base-passwd that may or may not be used in
>>>>> target systems.
>>>>
>>>> Why not make an shadow-target package with this?
>>>
>>> To just install a login.defs file? I'm open to it if a few more people
>>> think this is a better idea.
>>
>> The file is needed in order for the utilities that add, remove and modify
>> users/groups to function properly.  The full version from shadow utils is used
>> so we are sure we can dead with both shadow-less and shadowed filesystem images.
>>   (It's also more full featured then busybox, yet busybox is still compatible
>> with it.)
>>
> Will shadow be able to override this file ?
> one thing I see is that it wont get any updates that shadow might
> do to this file in future.

Now that I think of it, the reason Koen ran into the error messages was 
that the login.defs I shipped with base-passwd had various variables 
uncommented that the shadow recipe comments out (there's a sed script 
included with shadow which does this). Which means that his image, which 
had shadow installed, was *not* overriding the login.defs from base-passwd.

I'm now convinced that creating a shadow-cross package which just ships 
a login.defs file is the right thing to do, and to remove it from 
base-passwd. Thanks everyone for the feedback thus far.

I will be away at a conference for most of this coming week, but will 
try to squeeze this in on Monday.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


