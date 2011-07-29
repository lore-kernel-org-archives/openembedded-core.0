Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmgqO-0006J5-1f
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:46:48 +0200
Received: by gwb11 with SMTP id 11so2905518gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1qfWoATgE+dgHgHWMvPWWbXvyLTajaZAtUOmCM+1sCg=;
	b=xBzQeoWQ5Okj955h81Ak4gsyBm6gtFj49pvjoNl8aXmISVy5z2yOSfd9KRDsA3HFmX
	BjqQr9nf5A+tkZNSB90vY/7XY8mgvkAyMzdcOWpoR7panSktZX8/019JOlKufX3mZGZs
	CLF2K5AhjVos50CMjTqKJl/5z4mh3s4q1Gcbo=
Received: by 10.142.55.7 with SMTP id d7mr578915wfa.440.1311921747816;
	Thu, 28 Jul 2011 23:42:27 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d14sm1061065wfh.13.2011.07.28.23.42.26
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 23:42:26 -0700 (PDT)
Message-ID: <4E325623.6060708@gmail.com>
Date: Thu, 28 Jul 2011 23:41:39 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>	<1311777255.30326.347.camel@phil-desktop>	<4E302785.9070705@windriver.com>	<1311780347.30326.376.camel@phil-desktop>
	<4E30489A.100@windriver.com>
In-Reply-To: <4E30489A.100@windriver.com>
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
X-List-Received-Date: Fri, 29 Jul 2011 06:46:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 10:19 AM, Mark Hatle wrote:
> On 7/27/11 10:25 AM, Phil Blundell wrote:
>> On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
>>> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
>>> means I was thumb instructions.
>>>
>>> So armv5 and armv5t are distinct in the contents of the tunings.
>>
>> Ah, I see.  Does that go for v4t too?  I can imagine cases where you
>> would want to say "select the v4T ISA but generate ARM code not Thumb".
>
> Yes, for all of them, the TUNENAME selects the features that you want to use to
> compile, and suggests the other information like compatible architectures.
>
> In the case where you want to build primarily one, and optionally the other the
> tunename makes it easy..
>
> Say you want all of your system thumb, except for a few specific programs..
>
> TUNENAME = "armv4t"
>
> TUNENAME_pn-mysql = "armv4"
>
> In the opposite case, where you want everything ARM, except for a few thumb:
>
> TUNENAME = "armv7"
> TUNENAME_pn-bash = "armv7t"
>
> PACKAGE_EXTRA_ARCHS_tune-armv7 = ${PACKAGE_EXTRA_ARCHS_tune-armv7t}
>
> Second line ensures that the base armv7 tune inherits the "more complete" set of
> compatible machines.
>
> (Note, in most cases I would expect a machine/BSP configuration to do most of
> this inheriting... or if someone was being tricky they can do it manually.)
>>> Yes, the mention of DSP should be using the 'e'.  What I'm not sure of is does
>>> the "dsp" capabilities actually change any of the code or support generated.  If
>>> not then we can ignore it.
>>
>> Yes.  PLD, for example, is only available in ARMv5E (not ARMv5) and this
>> will affect any code which uses __builtin_prefetch().  I don't think GCC
>> will ever open-code the saturating arithmetic instructions, but it does
>> expose the v5/v5e distinction through preprocessor macros and source
>> code might use that to select asm() statements which use those opcodes.
>
> So then the question is.. with OE-core and core based distros.. are there enough
> armv5 (w/ or w/o e) left to justify having both?  If not.. then we select the
> one with the 'e' since it's more common.
>
>>> For armv5 this gives us:
>>>
>>> armv5, armv5t, armv5e, armv5te... add in their VFP variants and the hard float
>>> EABI...
>>
>> Does anybody really want the hardfloat abi on armv5?  I guess it doesn't
>> hurt all that much to offer it, but anything that makes that monstrous
>> set of .inc files bigger seems like a bad thing.
>
> I was surprised anyone wanted the hardfloat ABI at all.. :P ...but anyway... if
> it'll work on armv5 (and the previous question about is armv5 relevant answered)
> we can choose it or not..  It was there to be complete in the original
> version...  (also armv5 w/ VFP is the lowest compatible machine for a HF
> implementation.)
>

hardfloat ABI may not work with VFP implementation which is on the armv5 
cores it was designed around vfpv3
> --Mark
>
>> p.
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



