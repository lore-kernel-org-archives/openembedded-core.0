Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5B96012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 10:43:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Jan 2016 02:43:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732246695"
Received: from dwmw2-shinybook.ger.corp.intel.com (HELO [10.252.13.32])
	([10.252.13.32])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 02:43:28 -0800
User-Agent: Microsoft-MacOutlook/0.0.0.151105
Date: Fri, 22 Jan 2016 12:43:27 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <2EA21AEF-AF0C-4AFF-A18B-6358B6C6115F@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/3] oe.gpg_sign: support obs-signd
References: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1452528799-11292-4-git-send-email-markus.lehtonen@linux.intel.com>
	<5693D956.40107@windriver.com>
	<1452615851.13987.6.camel@linux.intel.com>
	<1452680933.13987.10.camel@linux.intel.com>
	<1453375237.13987.27.camel@linux.intel.com>
	<56A0F794.7060603@windriver.com>
In-Reply-To: <56A0F794.7060603@windriver.com>
Mime-version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oe.gpg_sign: support obs-signd
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
X-List-Received-Date: Fri, 22 Jan 2016 10:43:30 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi Mark,



(CC'd the mailing list which was accidentally dropped from my previous email)

On 21/01/16 17:21, "Mark Hatle" <mark.hatle@windriver.com> wrote:

>On 1/21/16 5:20 AM, Markus Lehtonen wrote:
>> On Wed, 2016-01-13 at 12:28 +0200, Markus Lehtonen wrote:
>>> On Tue, 2016-01-12 at 18:24 +0200, Markus Lehtonen wrote:
>>>> Hi Mark,
>>>>
>>>> Thank you for your review! Comments below.
>>>>
>>>> On Mon, 2016-01-11 at 10:33 -0600, Mark Hatle wrote:
>> 
>> [...SNIP...]
>> 
>>>>>
>>>>> Why are you removing existing signatures?  I believe for many cases this is
>>>>> actually incorrect.
>>>>>
>>>>> RPM (5) has the ability to have an endless number of signatures within a given
>>>>> package.  The package SHOULD included the internal non-repudiable signature...
>>>>>
>>>>> (to refresh memory) all RPM 5 packages include an internal non-repudiable
>>>>> signature.  Think of this as an extended md5sum, sha256sum, etc.  It doesn't
>>>>> change that a package is 'authentic' in any way (often the purpose of signatures
>>>>> like what this code is doing), but instead keeps a high reliability way to sign
>>>>> and verify the package is signed properly.
>>>>>
>>>>> This is used for validation if the system doing the install does not have the
>>>>> public key that the package was signed with.
>>>>>
>>>>> ... as well as one or more repudiable signatures that can be used to verify that
>>>>> it's "authentic" in some way.  A system could very easily have OSV, OEM, and ISV
>>>>> keys install on them.  You can program RPM in such a way that it will refused to
>>>>> install packages with unknown authentication keys or the non-repudiable key as well.
>>>>>
>>>>> So, I believe running delsign is wrong.  If the obs-signd can't handle ADDING
>>>>> signatures to packages, then I'd say it is broken and should be fixed in some
>>>>> way -- or at least the signature deletion code should be optional.
>>>>
>>>> Yes, unfortunately this is currently the limitation of obs-signd. It
>>>> refuses to sign if there are signatures present in the rpm package.
>>>> Using --delsign is "unfortunate" consequence of this and that should've
>>>> probably been described in a comment. Making signature deletion a
>>>> configurable setting is hopefully a decent resolution for now. I will
>>>> send a new version of the patchset later.
>>>
>>> Backing up a bit here. I did some quick testing and it seems that RPM5
>>> does not support multiple signatures (anymore?). Doing --addsign seems
>>> to overwrite the existing signatures similarly to --resign. Support for
>>> multiple signatures were removed from RPM4 years ago.
>>>
>>> In this light, doing --delsign should be ok. What do you think?
>> 
>> Hi Mark. Do you have any comments to the above? I'd like to get this
>> patchset out of my hands :)
>
>RPM5 does have multiple signatures, but only allows one of each of the three
>types to be installed.  The delsign shouldn't be used as it might remove the
>wrong signature.

AFAIU, rpm only allows one signature so be present. The file format allows that, but, the rpm tool does not (anymore). For example, rpm --addsign will remove an existing DSA signature when adding an RSA signature. The SHA1 / MD5 digests are not touched by --delsign.


>(Three types are DSA/RSA, ECDSA, and simple SHA256 or similar.)

I didn't know that rpm(5?) supports ECDSA signatures.


>But making the --delsign optional I think is the best approach.  (It would be
>better to move it to the obs-sign script itself -- but I can live with doing it
>on the OE side since people are trying to use their owns systems.)

I still believe that making it optional is just worthless and complicates things because doing rpm --addsign has exactly the same effect.


>The alternative would be to not call the script 'obs-sign', but instead call an
>arbitrarily named (and defined in a bitbake variable) script.. Then THAT script
>can do the del and call the obs-sign.)

Hmm, I probably don't like this idea that much. This user-written script would need to be a bit more complex as a it needs to support multiple operations (signrpm, detach sign, export pubkey). Of course, I could write a default script and put it under scripts/ but somehow feels more complex than needed.


Thanks,
  Markus



