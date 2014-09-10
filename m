Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63E0660703
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 14:42:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8AEgT9D005016
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Sep 2014 07:42:30 -0700 (PDT)
Received: from [147.11.117.218] (147.11.117.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 10 Sep 2014 07:42:29 -0700
Message-ID: <5410634F.1030701@windriver.com>
Date: Wed, 10 Sep 2014 10:42:23 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <D034EC78.A7DD4%dvhart@linux.intel.com>	
	<1410337664.19272.89.camel@ted> <54105C2A.6060006@windriver.com>
	<1410359079.24030.14.camel@ted>
In-Reply-To: <1410359079.24030.14.camel@ted>
Cc: "Brandt, Todd E" <todd.e.brandt@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Packaging kernel sources
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
X-List-Received-Date: Wed, 10 Sep 2014 14:42:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-10 10:24 AM, Richard Purdie wrote:
> On Wed, 2014-09-10 at 10:11 -0400, Bruce Ashfield wrote:
>> On 14-09-10 04:27 AM, Richard Purdie wrote:
>>> On Tue, 2014-09-09 at 17:42 -0700, Darren Hart wrote:
>>>> I'm working on a project which needs to have the full kernel sources
>>>> installed on the target. The kernel-dev package as defined by
>>>> kernel.bbclass is heavily pruned to minimize packaging time and size and
>>>> is intended to enable building of external modules on the target.
>>>>
>>>> Is there an accepted best-practice for how to get the full source packaged
>>>> and installed? I can easily write a new recipe,
>>>> linux-custom-source_git.bb, to install the sources, for example, without
>>>> impacting the packaging time of "virtual/kernel" package.
>>>>
>>>> It would be nice in some respects for it to all come from the same recipe
>>>> though, but I suspect the impact to the common-case where this is not need
>>>> would be far too great.
>>>
>>> Personally, I'm leaning towards a couple of big changes in this area:
>>
>> I'd prefer this sort of larger switch as well.
>>
>>>
>>> a) "binning" the kernel-dev package and replacing it with some kind of
>>> separate full source recipe like this.
>>>
>>> The benefit is a fully functional on target source which is only built
>>> by people who care about it. This means for most users/builds, we no
>>> longer need to generate that huge package. The downside is a little more
>>> complexity for those that needs this but its not much.
>>
>> And just so I'm clear, in this case, the current sysroot, grep, sed,
>> hack-a-thon version of the kernel would stay as is ?
>
> No, these are two things I think we need to do together. There are two
> issues, the on target one and the sysroot mess. a) deals with the
> former, b) the latter.
>
> So b) takes care of the hack-a-thon but I think we need a) as well.
>

Aha. With your clarification, I can see the difference now .. I hadn't
had coffee yet. Grabbing a full source copy for the on-target needs,
and not just the source that we've mangled or changed for our build
purposes.

Agreed that this also cleans up the target needs for kernel source and
build.

Bruce

>>> b) binning the separate kernel staging dir and making it work more like
>>> the gcc shared work directory. This means external module builds and the
>>> tools like perf and so on would use this shared source directory.
>>>
>>> The benefit would be that we no longer have the huge install step in the
>>> main kernel recipe and the populate_sysroot step shinks in size.
>>>
>>> The downside has more impact here, the problem with shared work is that
>>> it cannot be removed once extracted since the system never knows when
>>> something else may need to use it. For gcc the argument was that we have
>>> so many users (gcc-cross-initial, gcc-cross, gcc-runtime,
>>> gcc-cross-canadian, gcc-crosssdk, gcc-crosssdk-initial and so on) that
>>> the multiple copies were far worse. For the kernel, we can argue that we
>>> have a ton of disk usage from it in the sysroot anyway so this change
>>> just makes things more efficient effectively.
>>>
>>> The other issue is that for shared work dirs, the stamps need to be kept
>>> in sync, if they step out, odd things happen (i.e. do_fetch, do_unpack,
>>> do_patch task checksums need to match for linux-yocto, perf, kernel
>>> modules and anything else using it). We may need to add some better
>>> error cases to catch problems. Not an insurmountable problem, just one
>>> that will likely need to be addressed.
>>>
>>> I do feel the whole situation with the current kernel size is out of
>>> control and badly affecting user experience.
>>
>> I like (b) myself, since I'm getting tired of copying the source tree,
>> having the removals fail as we march forward through kernel versions,
>> and then needing to modify everything from the SDK to the out of tree
>> module builds to reconstruct scripts, etc.
>>
>> We'd have the same "don't patch it" restrictions for something that
>> builds out of this shared directory (like perf), so there's nothing
>> new and horrible there.
>
> Right...
>
> Cheers,
>
> Richard
>


