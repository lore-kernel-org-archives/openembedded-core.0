Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95264716A3
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:25:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s927PPCM013492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Oct 2014 00:25:25 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 2 Oct 2014 00:25:24 -0700
Message-ID: <542CFDE2.60207@windriver.com>
Date: Thu, 2 Oct 2014 15:25:22 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "Ashfield, Bruce"
	<Bruce.Ashfield@windriver.com>
References: <D034EC78.A7DD4%dvhart@linux.intel.com>	<1410337664.19272.89.camel@ted>
	<D035B829.A7FF6%dvhart@linux.intel.com>
In-Reply-To: <D035B829.A7FF6%dvhart@linux.intel.com>
Cc: "Brandt, Todd E" <todd.e.brandt@intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
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
X-List-Received-Date: Thu, 02 Oct 2014 07:25:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

How's this going on, please ?

// Robert

On 09/10/2014 11:13 PM, Darren Hart wrote:
> On 9/10/14, 1:27, "Richard Purdie" <richard.purdie@linuxfoundation.org>
> wrote:
>
>> On Tue, 2014-09-09 at 17:42 -0700, Darren Hart wrote:
>>> I'm working on a project which needs to have the full kernel sources
>>> installed on the target. The kernel-dev package as defined by
>>> kernel.bbclass is heavily pruned to minimize packaging time and size and
>>> is intended to enable building of external modules on the target.
>>>
>>> Is there an accepted best-practice for how to get the full source
>>> packaged
>>> and installed? I can easily write a new recipe,
>>> linux-custom-source_git.bb, to install the sources, for example, without
>>> impacting the packaging time of "virtual/kernel" package.
>>>
>>> It would be nice in some respects for it to all come from the same
>>> recipe
>>> though, but I suspect the impact to the common-case where this is not
>>> need
>>> would be far too great.
>>
>> Personally, I'm leaning towards a couple of big changes in this area:
>>
>> a) "binning" the kernel-dev package and replacing it with some kind of
>> separate full source recipe like this.
>>
>> The benefit is a fully functional on target source which is only built
>> by people who care about it. This means for most users/builds, we no
>> longer need to generate that huge package. The downside is a little more
>> complexity for those that needs this but its not much.
>
> The other downside is that the most common use case (building external
> modules) would now require a lot more disk space than with just kernel-dev
> (something like 150 MB more iirc).
>
>>
>>
>> b) binning the separate kernel staging dir and making it work more like
>> the gcc shared work directory. This means external module builds and the
>> tools like perf and so on would use this shared source directory.
>
> I was thinking along the same lines here as well.
>
>>
>> The benefit would be that we no longer have the huge install step in the
>> main kernel recipe and the populate_sysroot step shinks in size.
>>
>> The downside has more impact here, the problem with shared work is that
>> it cannot be removed once extracted since the system never knows when
>> something else may need to use it. For gcc the argument was that we have
>> so many users (gcc-cross-initial, gcc-cross, gcc-runtime,
>> gcc-cross-canadian, gcc-crosssdk, gcc-crosssdk-initial and so on) that
>> the multiple copies were far worse. For the kernel, we can argue that we
>> have a ton of disk usage from it in the sysroot anyway so this change
>> just makes things more efficient effectively.
>>
>> The other issue is that for shared work dirs, the stamps need to be kept
>> in sync, if they step out, odd things happen (i.e. do_fetch, do_unpack,
>> do_patch task checksums need to match for linux-yocto, perf, kernel
>> modules and anything else using it). We may need to add some better
>> error cases to catch problems. Not an insurmountable problem, just one
>> that will likely need to be addressed.
>
> Good points.
>
>>
>> I do feel the whole situation with the current kernel size is out of
>> control and badly affecting user experience.
>
>
> Yup.
>

