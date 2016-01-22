Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF2760620
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 14:09:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0ME9OTL030771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 22 Jan 2016 06:09:24 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jan 2016 06:09:23 -0800
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
References: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1452528799-11292-4-git-send-email-markus.lehtonen@linux.intel.com>
	<5693D956.40107@windriver.com>
	<1452615851.13987.6.camel@linux.intel.com>
	<1452680933.13987.10.camel@linux.intel.com>
	<1453375237.13987.27.camel@linux.intel.com>
	<56A0F794.7060603@windriver.com>
	<2EA21AEF-AF0C-4AFF-A18B-6358B6C6115F@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <56A23812.3080501@windriver.com>
Date: Fri, 22 Jan 2016 08:09:22 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <2EA21AEF-AF0C-4AFF-A18B-6358B6C6115F@linux.intel.com>
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
X-List-Received-Date: Fri, 22 Jan 2016 14:09:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 1/22/16 4:43 AM, Markus Lehtonen wrote:
> Hi Mark,
> 
> 
> 
> (CC'd the mailing list which was accidentally dropped from my previous email)
> 
> On 21/01/16 17:21, "Mark Hatle" <mark.hatle@windriver.com> wrote:
> 
>> On 1/21/16 5:20 AM, Markus Lehtonen wrote:
>>> On Wed, 2016-01-13 at 12:28 +0200, Markus Lehtonen wrote:
>>>> On Tue, 2016-01-12 at 18:24 +0200, Markus Lehtonen wrote:
>>>>> Hi Mark,
>>>>>
>>>>> Thank you for your review! Comments below.
>>>>>
>>>>> On Mon, 2016-01-11 at 10:33 -0600, Mark Hatle wrote:
>>>
>>> [...SNIP...]
>>>
>>>>>>
>>>>>> Why are you removing existing signatures?  I believe for many cases this is
>>>>>> actually incorrect.
>>>>>>
>>>>>> RPM (5) has the ability to have an endless number of signatures within a given
>>>>>> package.  The package SHOULD included the internal non-repudiable signature...
>>>>>>
>>>>>> (to refresh memory) all RPM 5 packages include an internal non-repudiable
>>>>>> signature.  Think of this as an extended md5sum, sha256sum, etc.  It doesn't
>>>>>> change that a package is 'authentic' in any way (often the purpose of signatures
>>>>>> like what this code is doing), but instead keeps a high reliability way to sign
>>>>>> and verify the package is signed properly.
>>>>>>
>>>>>> This is used for validation if the system doing the install does not have the
>>>>>> public key that the package was signed with.
>>>>>>
>>>>>> ... as well as one or more repudiable signatures that can be used to verify that
>>>>>> it's "authentic" in some way.  A system could very easily have OSV, OEM, and ISV
>>>>>> keys install on them.  You can program RPM in such a way that it will refused to
>>>>>> install packages with unknown authentication keys or the non-repudiable key as well.
>>>>>>
>>>>>> So, I believe running delsign is wrong.  If the obs-signd can't handle ADDING
>>>>>> signatures to packages, then I'd say it is broken and should be fixed in some
>>>>>> way -- or at least the signature deletion code should be optional.
>>>>>
>>>>> Yes, unfortunately this is currently the limitation of obs-signd. It
>>>>> refuses to sign if there are signatures present in the rpm package.
>>>>> Using --delsign is "unfortunate" consequence of this and that should've
>>>>> probably been described in a comment. Making signature deletion a
>>>>> configurable setting is hopefully a decent resolution for now. I will
>>>>> send a new version of the patchset later.
>>>>
>>>> Backing up a bit here. I did some quick testing and it seems that RPM5
>>>> does not support multiple signatures (anymore?). Doing --addsign seems
>>>> to overwrite the existing signatures similarly to --resign. Support for
>>>> multiple signatures were removed from RPM4 years ago.
>>>>
>>>> In this light, doing --delsign should be ok. What do you think?
>>>
>>> Hi Mark. Do you have any comments to the above? I'd like to get this
>>> patchset out of my hands :)
>>
>> RPM5 does have multiple signatures, but only allows one of each of the three
>> types to be installed.  The delsign shouldn't be used as it might remove the
>> wrong signature.
> 
> AFAIU, rpm only allows one signature so be present. The file format allows that, but, the rpm tool does not (anymore). For example, rpm --addsign will remove an existing DSA signature when adding an RSA signature. The SHA1 / MD5 digests are not touched by --delsign.
> 
> 
>> (Three types are DSA/RSA, ECDSA, and simple SHA256 or similar.)
> 
> I didn't know that rpm(5?) supports ECDSA signatures.
> 
> 
>> But making the --delsign optional I think is the best approach.  (It would be
>> better to move it to the obs-sign script itself -- but I can live with doing it
>> on the OE side since people are trying to use their owns systems.)
> 
> I still believe that making it optional is just worthless and complicates things because doing rpm --addsign has exactly the same effect.
> 
> 
>> The alternative would be to not call the script 'obs-sign', but instead call an
>> arbitrarily named (and defined in a bitbake variable) script.. Then THAT script
>> can do the del and call the obs-sign.)
> 
> Hmm, I probably don't like this idea that much. This user-written script would need to be a bit more complex as a it needs to support multiple operations (signrpm, detach sign, export pubkey). Of course, I could write a default script and put it under scripts/ but somehow feels more complex than needed.

The more I look at this, the more I think that makes sense.

I've had some of my (WR Linux) release guys look at this, and the obs-sign
mechanism will not work for us.  So we're going to have to write some custom
signing code anyway.  It will be much easier if there is a generic interface.
The previous thought was to use the obs-sign "interface", but write our own...
but at that point OBS has nothing to do with it.. It's just really being used as
a signing interface.

I'm assuming at this point that we're not alone in this need.  I've talked to a
variety of commercial people and they all have slightly different signing
policies and mechanisms.  Everything from, we don't sign the packages but check
separate checksums -- to we sign locally with a local keyring key -- to we sign
locally with a special in-memory key -- to after every package is built we have
to upload the package to an (internal password protected) FTP/HTTP site and
trigger it to be signed, then once signed we download it.  (And of course OBS
specific signing...)

I think in this case an external script makes this all much easier for someone
to implement their specific policy and procedures, especially with a defined
API.  Including default scripts with this as useful runners or examples would
definitely be a part of the work in my mind.

--Mark

> 
> Thanks,
>   Markus
> 
> 


