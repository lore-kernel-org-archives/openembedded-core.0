Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RxLjK-0003bG-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 17:59:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Feb 2012 08:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="66492793"
Received: from unknown (HELO [10.255.14.125]) ([10.255.14.125])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Feb 2012 08:51:38 -0800
Message-ID: <4F3A9118.8050806@linux.intel.com>
Date: Tue, 14 Feb 2012 08:51:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Xiaofeng Yan <xiaofeng.yan@windriver.com>
References: <4F21BE12.3000008@linux.intel.com>
	<4F24F672.5090107@linux.intel.com> <4F38E8CB.6090101@windriver.com>
In-Reply-To: <4F38E8CB.6090101@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Source Archiver Class
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
X-List-Received-Date: Tue, 14 Feb 2012 16:59:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2012 02:41 AM, Xiaofeng Yan wrote:
> Hi Saul,
>
> I have some issues when I writing design document. The following
> description is my understanding. I take package "zlib" for example .
>>
>>
>> This is a progression list of what the source archives should include:
>>
>> 1 - Original Upstream Archive & Patches
>> - 2 archives (tarballs)
> $ls zlib-orgsource
> zlib-1.2.5.tar.bz2(after do_fetch)
> zlib-patches.tar.bz2( the patches come from
> meta/recipes-core/zlib/zlib-1.2.5)

Almost correct, I believe that the work Bruce and Chris have done 
recently will allow you to get the patches.

I am not sure we want to just tar up the 
meta/recipes-core/zlib/lib-1.2.5 directory since it might contain other 
file or patches that we don't actaully use.  We need to get the patches 
that are actually applied.

>> 2 - Original Source code & Patches
>> - could include additional code
> Please give me more detailed information
One tarball with the patches extracted in the patches directory with the 
series file (possibly a script to apply the patches).

>> - post unpack
>> - 1 archive
> $ls zlib-orgsource
> zlib-1.2.5.tar.bz2(after do_unpack, patches are not included in this
> package.)
>
> No patch in this directory.
Need to add the patches via patch mechanism to the source tarball, but 
without actually applying the patches.

So, this is just one tarball.
zlib-1.2.5-prepatch.tar.bz2
>>
>> 3 - Original Source code & Patches & temp (scripts & logs)
>> - Could possibly include the .bb and .inc files
>> - 2 archives (from #2 & temp tarball)
> $ls zlib-orgsource
> zlib-1.2.5.tar.bz2(after do_unpack, patches are not included in this
> package.)
> zlib-patches.tar.bz2( the patches come from
> meta/recipes-core/zlib/zlib-1.2.5)

Again see above, we need to get only the patches that will actually be 
applied.

> zlib-scripts-logs.tar.bz2(include zlib_1.2.5.bb,zlib.inc and tmp/log_*)
>
> So there are 3 tarballs in this directory.
Yes

>> 4 - Patched source code
>> - original source code could be removed
>> - post do_patch
> $ls zlib-source
> zlib-1.2.5.tar.bz2(after do_patch)
Correct
Maybe better zlib-1.2.5-patched.tar.bz2

>> 5 - Patched source code & temp
>> - 2 archives (from #4 & temp tarball)
> $ls zlib-source
> zlib-1.2.5.tar.bz2(after do_patch)
> zlib-logs.tar.bz2(include tmp/log_*)
Correct
Same as #4 change the tarball  name

>> 6 - Configured Source
>> - post do_configure
> $ls zlib-source
> zlib-1.2.5.tar.bz2(after do_configure)
zlib-1.2.5-configured.tar.bz2

>> 7 - SRPM format of Original Source & Patches
>> - rpm will apply the patches
>> - internally contains #2 above
> $ls zlib-srpm
> zlib-1.2.5.src.rpm
>
> zlib-1.2.5.src.rpm includes zlib-1.2.5.tar.bz2(after do_unpack, patches
> are not included in this package.) and zlib-patches.tar.bz2
>> 8 - SRPM various of #3 above
> $ls zlib-srpm
> zlib-1.2.5.src.rpm
>
> zlib-1.2.5.src.rpm includes zlib-1.2.5.tar.bz2(after do_unpack, patches
> are not included in this package.) ,zlib-patches.tar.bz2 and
> zlib-scripts-logs.tar.bz2
>
> Do you have any suggestion about the above description?
>
Just the naming and where the patches come from we need to provide the 
mechanism (series file) for how to apply the patches also.

Sau!

> Thanks
> Yan
>
>
>> ...
>> 100 - Buildable SRPM
>> - can actually build, this is way future!
>>
>> (Patches = patch files & series list)
>>
>> Each of these build on the previous in some way, the key being that we
>> generate a tarball for the source from the existing state of the
>> WORKDIR, a challenge maybe to create the source snapshot after the build
>> has already occurred.
>>
>> The SPDX License info could also be included in any of these
>>
>> After talking with Richard, we think we have a novel approach to make
>> this work. It would entail using the postfuncs feature similar to the
>> way that Shared State does it's work. The existing copyleft_compliance
>> class functionality can be folded into this as a filter. Additional
>> flags could be passed from individual classes to a core set of methods
>> in an archiver class defining the type of data (source, patches, temp,
>> env, recipe info, ...) and format (tar, sprm, ...)
>>
>> I noted that recipe type code might be better suited as generic code, as
>> I believe there are other places that could benefit from that code.
>>
>> The sourcepkg class seems to be a basic archiver and differ that
>> includes the metadata/environment (as dumpdata), this could be replaced
>> by the new approach. While the src_distribute class copies the
>> downloaded archive and then creates a link, into LICENSE directories
>> along with the patches. The src_distribute by default seems to move
>> files and create links (incorrectly btw!). This work can be done by the
>> archiver class.
>>
>> The Nugget: Create a new core "archiver" class that implements a general
>> functions that can archive the original tarball or workdir at various
>> states along task list with additional metadata (recipe info, temp dir,
>> environment). This class would be inherited by a set of classes that use
>> the postfunc (similar to sstate) that setup what level of archive is
>> needed (based on the list above).
>>
>> Thoughts, Comments?
>>
>> Thanks
>>
>>
>>
>
>


