Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QmB6R-0001iv-Ms
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 22:53:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6RKmxCD019669
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 13:48:59 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 27 Jul 2011 13:48:58 -0700
Message-ID: <4E3079BA.30705@windriver.com>
Date: Wed, 27 Jul 2011 15:48:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop>
	<4E30489A.100@windriver.com>
	<1311795061.3398.9.camel@lenovo.internal.reciva.com>
In-Reply-To: <1311795061.3398.9.camel@lenovo.internal.reciva.com>
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 20:53:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/27/11 2:31 PM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 12:19 -0500, Mark Hatle wrote:
>> On 7/27/11 10:25 AM, Phil Blundell wrote:
>>> On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
>>>> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
>>>> means I was thumb instructions.
>>>>
>>>> So armv5 and armv5t are distinct in the contents of the tunings.
>>>
>>> Ah, I see.  Does that go for v4t too?  I can imagine cases where you
>>> would want to say "select the v4T ISA but generate ARM code not Thumb".
>>
>> Yes, for all of them, the TUNENAME selects the features that you want to use to
>> compile, and suggests the other information like compatible architectures.
>>
>> In the case where you want to build primarily one, and optionally the other the
>> tunename makes it easy..
>>
>> Say you want all of your system thumb, except for a few specific programs..
>>
>> TUNENAME = "armv4t"
>>
>> TUNENAME_pn-mysql = "armv4"
>>
>> In the opposite case, where you want everything ARM, except for a few thumb:
>>
>> TUNENAME = "armv7"
>> TUNENAME_pn-bash = "armv7t"
> 
> I'm not quite sure that this answers the question I was trying to ask.
> 
> The thing about v4/v4T is that, unlike later versions of the
> architecture, plain v4 doesn't include the BX instruction.  So, if you
> want your code to be interworking-capable without requiring linker
> shims, you need to specify -march=armv4t (and -mthumb-interwork) even
> for CUs that you want to compile as ARM code.
> 
> If the architecture name implies the execution state then it doesn't
> appear as though there is going to be any way to select -march=armv4t
> without also selecting -mthumb, which would make it impossible to build
> interworking-capable ARM-state code for v4T.

It was my understanding that interwork was always enabled these days.  Does
interworking require a thumb compatible arm core?

--Mark

>> So then the question is.. with OE-core and core based distros.. are there enough
>> armv5 (w/ or w/o e) left to justify having both?  If not.. then we select the
>> one with the 'e' since it's more common.
> 
> I'm not aware of anybody using a non-e ARMv5 with OE at all.  The two
> most common v5-class implementations, by some margin I think, are the
> ARM9x6 family and Xscale, and all of those are at least v5TE. 
> 
> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



