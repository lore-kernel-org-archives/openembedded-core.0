Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-03.prod.phx3.secureserver.net
	(p3plsmtpa11-03.prod.phx3.secureserver.net [68.178.252.104])
	by mail.openembedded.org (Postfix) with ESMTP id 4441665CC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 16:26:54 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa11-03.prod.phx3.secureserver.net with 
	id pUSt1o0071mTNtu01USt9p; Wed, 10 Sep 2014 09:26:55 -0700
Message-ID: <54107BCD.10900@pabigot.com>
Date: Wed, 10 Sep 2014 11:26:53 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
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
X-List-Received-Date: Wed, 10 Sep 2014 16:26:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2014 10:13 AM, Darren Hart wrote:
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
>> Personally, I'm leaning towards a couple of big changes in this area:
>>
>> a) "binning" the kernel-dev package and replacing it with some kind of
>> separate full source recipe like this.
>>
>> The benefit is a fully functional on target source which is only built
>> by people who care about it. This means for most users/builds, we no
>> longer need to generate that huge package. The downside is a little more
>> complexity for those that needs this but its not much.
> The other downside is that the most common use case (building external
> modules) would now require a lot more disk space than with just kernel-dev
> (something like 150 MB more iirc).

There are three use cases where I've wanted kernel source on target:

1) Building the whole kernel.  Pretty rare, but could happen. Debian 
appears to provide a linux-source package that provides the whole source 
in /usr/src/linux-source-$(uname -r).  I'd want it to come with the 
contents of ${S} at the point where the compile task was ready to run.   
I'd love it to also come with a shallow git repository already present: 
I can't see anybody wanting to do on-target kernel modifications without 
having SCM underneath, and it takes a long time to "git add --all" a 
kernel tree on a class 4 uSD card.  It doesn't need the entire history, 
just maybe three commits: the upstream stable base release, a record of 
the changes/patches done by kern-tools or other kernel-building recipes, 
and a final commit that archives the as-built .config as a defconfig 
somewhere.

2) Building external modules.  Very common, and AFAICT normally packaged 
as "linux-headers" on debian systems, living in 
/usr/src/linux-headers-$(uname -r).  I think simply renaming kernel-dev 
to this and changing where it unpacks would do.  No need for git here 
since its unlikely people would be modifying the headers.

3) Building device trees.  I haven't figured out how to do this other 
than rebuilding the whole kernel which is a major pain, but inspection 
suggests the current kernel-dev (proposed linux-headers) might have that 
functionality.

Peter

>
>>
>> b) binning the separate kernel staging dir and making it work more like
>> the gcc shared work directory. This means external module builds and the
>> tools like perf and so on would use this shared source directory.
> I was thinking along the same lines here as well.
>
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
> Good points.
>
>> I do feel the whole situation with the current kernel size is out of
>> control and badly affecting user experience.
> Yup.

I don't know that there's much that can be done: I wouldn't want 
anything removing parts of the source tree from a kernel on a 
presumption that the user wouldn't want them installed.  But yeah, the 
thing's a pig.

