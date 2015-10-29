Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEFEB755F4;
	Thu, 29 Oct 2015 20:26:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9TKQ9iW007000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Oct 2015 13:26:09 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 13:26:09 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<56327C86.60202@windriver.com>
	<CAMKF1soy5s8iwBBP21cVS=o2ynkKBmoijStH3MjEoYz8uu4yaA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <563280E0.2080809@windriver.com>
Date: Thu, 29 Oct 2015 15:26:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soy5s8iwBBP21cVS=o2ynkKBmoijStH3MjEoYz8uu4yaA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Thu, 29 Oct 2015 20:26:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 10/29/15 3:14 PM, Khem Raj wrote:
> On Thu, Oct 29, 2015 at 1:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 10/29/15 10:42 AM, Khem Raj wrote:
>>> Hi All,
>>>
>>> I would like to get everyone’s opinion on the libcs we maintain in OE-Core, as of now, we have
>>>
>>> glibc + cross localedef + kconfig patches which are left overs from eglibc days
>>
>> I do find the above useful -- include the kconfig part.
>>
>>> uclibc - which is more of less unmaintained
>>
>> I've never used uclibc with the Yocto Project framework.  I think musl is a lot
>> more compelling moving forward.
>>
>>> Its a significant effort to keep forward porting the kconfig changes since it touches everywhere in glibc, (I do it in my local glibc tree)
>>> almost every week there is a commit in upstream glibc which breaks the kconfig patches, I know there are distribution profiles
>>> like poky-tiny which uses glibc in this capacity, and may be then their are other custom one’s made on top, I would like us to not carry major
>>> patches which almost makes our component a fork due to obvious maintenance cost. I think there is viable alternatives to tiny libcs in musl now.
>>>
>>> I would like to make a proposal for 2.1 release where
>>>
>>> 1. Drop kconfig support in glibc and we become inline with upstream
>>
>> I really would like to keep kconfig support still.  It's definitely useful, but
>> it's of course not the main workflow.
> 
> its a lot of work and upstream is not so keen on supporting it either,
> so even if we spend time to clean it up
> and send upstream it might need dedicated maintenance which is going
> to be quite frequent breakages
> since no one will test all kconfig combos. At this point this is the
> biggest drag to take glibc forward I spend lot of time on keeping
> these
> patches moving forward. so we want
> to avoid needless effort if there is so little userbase for it. Cross
> localedef and others we still will keep.

I definitely understand this.... I wonder if the right answer is to create a
project for this either under the Yocto Project umbrella or just as a separate
project.. everything remains 'glibc' except for the kconfig chunk.

That -might- be able to relieve the burden from your shoulders.. but it wouldn't
be an overnight process.  (And if nobody actually cares, it might prove that
point and make it easier to justify removing.)

>>
>>> 2. Move musl support to OE-Core from meta-musl
>>
>> I wouldn't object to his.
>>
>>> 3. Drop uclibc or leave it in current broken state, I would like to pull it out into a layer in meta-openembedded and we can leave the core plumbing as it is in OE-Core
>>
>> I definitely wouldn't object to this.  I do think keeping the uclibc hooks and
>> such in oe-core for the time being does make sense.  It would be interesting to
>> know how often it is still being used... (and I do think musl is a better
>> replacement for this use-case.)
>>
>>> 4. Poky-tiny switches to use musl
>>
>> I think there are two usages here.. one is a small 'glibc' interface where the
>> API is glibc compatible, but restricted..
>>
>> And a "don't care about the libc, as long as it works and is small" use case
>> which was traditionally uclibc, but now can be fulfilled by musl.
>>
>> I do still think a 'tiny' glibc is useful -- however with musl being a lot more
>> capable of working then uclibc was, the usefulness may be diminishing.
>>
>>> may other disto’s have moved to using musl as system C library e.g. alpine linux, openwrt, and I am also deploying it in  real products
>>> its pretty mature and well maintained with very healthy community around it. Right now meta-musl is capable of building and running
>>> core-image-sato/core-image-weston for all supported Qemu arches in OE-Core, the amount of software it can build is no less than uclibc
>>> support in OE-Core.
>>
>> This certainly makes it worthwhile to consider putting into oe-core proper.
>> Again, I have no objections to introducing musl.
>>
>> --Mark
>>
>>> if collectively we think, this is a good move then I can work on all of above items in early phases of 2.1 so we can settle any
>>> outstanding issues, due to the shuffle especially in poky-tiny
>>>
>>> Thoughts ?
>>>
>>> -Khem
>>>
>>>
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


