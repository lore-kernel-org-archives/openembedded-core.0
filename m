Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qm7s2-0006Xq-1h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 19:26:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6RHJMQS016953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:21:54 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 27 Jul 2011 10:19:23 -0700
Message-ID: <4E30489A.100@windriver.com>
Date: Wed, 27 Jul 2011 12:19:22 -0500
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
In-Reply-To: <1311780347.30326.376.camel@phil-desktop>
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
X-List-Received-Date: Wed, 27 Jul 2011 17:26:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/27/11 10:25 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
>> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
>> means I was thumb instructions.
>>
>> So armv5 and armv5t are distinct in the contents of the tunings.
> 
> Ah, I see.  Does that go for v4t too?  I can imagine cases where you
> would want to say "select the v4T ISA but generate ARM code not Thumb".

Yes, for all of them, the TUNENAME selects the features that you want to use to
compile, and suggests the other information like compatible architectures.

In the case where you want to build primarily one, and optionally the other the
tunename makes it easy..

Say you want all of your system thumb, except for a few specific programs..

TUNENAME = "armv4t"

TUNENAME_pn-mysql = "armv4"

In the opposite case, where you want everything ARM, except for a few thumb:

TUNENAME = "armv7"
TUNENAME_pn-bash = "armv7t"

PACKAGE_EXTRA_ARCHS_tune-armv7 = ${PACKAGE_EXTRA_ARCHS_tune-armv7t}

Second line ensures that the base armv7 tune inherits the "more complete" set of
compatible machines.

(Note, in most cases I would expect a machine/BSP configuration to do most of
this inheriting... or if someone was being tricky they can do it manually.)
>> Yes, the mention of DSP should be using the 'e'.  What I'm not sure of is does
>> the "dsp" capabilities actually change any of the code or support generated.  If
>> not then we can ignore it.
> 
> Yes.  PLD, for example, is only available in ARMv5E (not ARMv5) and this
> will affect any code which uses __builtin_prefetch().  I don't think GCC
> will ever open-code the saturating arithmetic instructions, but it does
> expose the v5/v5e distinction through preprocessor macros and source
> code might use that to select asm() statements which use those opcodes.

So then the question is.. with OE-core and core based distros.. are there enough
armv5 (w/ or w/o e) left to justify having both?  If not.. then we select the
one with the 'e' since it's more common.

>> For armv5 this gives us:
>>
>> armv5, armv5t, armv5e, armv5te... add in their VFP variants and the hard float
>> EABI...
> 
> Does anybody really want the hardfloat abi on armv5?  I guess it doesn't
> hurt all that much to offer it, but anything that makes that monstrous
> set of .inc files bigger seems like a bad thing.

I was surprised anyone wanted the hardfloat ABI at all.. :P ...but anyway... if
it'll work on armv5 (and the previous question about is armv5 relevant answered)
we can choose it or not..  It was there to be complete in the original
version...  (also armv5 w/ VFP is the lowest compatible machine for a HF
implementation.)

--Mark

> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



