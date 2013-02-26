Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UASt5-0004Xv-Sr
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:20:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 14:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="268074847"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.55])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 14:03:49 -0800
Message-ID: <512D3146.7050503@linux.intel.com>
Date: Tue, 26 Feb 2013 14:03:50 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<1361902512.22501.51.camel@phil-desktop.brightsign>
In-Reply-To: <1361902512.22501.51.camel@phil-desktop.brightsign>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] Create ext* filesystems using debugfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 22:20:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/26/2013 10:15 AM, Phil Blundell wrote:
> On Tue, 2013-02-26 at 17:24 +0800, Robert Yang wrote:
>>     Before:
>>     $ time bitbake core-image-minimal
>>     
>>     real    1m10.823s
>>     user    0m37.108s
>>     sys     0m15.894s
>>     
>>     After:
>>     $ time bitbake core-image-minimal
>>     
>>     real    1m17.501s
>>     user    0m29.304s
>>     sys     0m20.731s
>>     
>>     # 7 seconds lost.
>>   
>>   - For a core-image-sato generation (IMAGE_FSTYPES="tar.bz2 ext3"):
>>   
>>     Before:
>>     $ time bitbake core-image-sato
>>     
>>     real    11m10.645s
>>     user    2m43.503s
>>     sys     1m1.589s
>>     
>>     After:
>>     $ time bitbake core-image-sato
>>     
>>     real    11m53.131s
>>     user    3m18.988s
>>     sys     2m8.350s
>>     
>>     # 43 seconds lost.
>>   
>> * The rootfs size changes
>>   - The image size are the same by "ls -h", but different by "du -sh":
>>     (core-image-sato)
>>   
>>     $ ls -lh BEFORE.rootfs.ext3 AFTER.rootfs.ext3 | awk '{print $5"\t"$NF}'
>>     357M BEFORE.rootfs.ext3
>>     357M AFTER.rootfs.ext3
>>     
>>     $ du -sh BEFORE.rootfs.ext3 AFTER.rootfs.ext3
>>     238M    BEFORE.rootfs.ext3
>>     357M    AFTER.rootfs.ext3
> 
> So, am I understanding correctly that your patch causes the rootfs
> generation to take longer, and the resulting files to be bigger?  It
> doesn't seem totally obvious to me that this is a good thing, and your
> cover letter doesn't provide any other explanation for why the changes
> are desirable.  Can you expand on the rationale for doing this?


A better motivation description is indeed required.

Basically, genext2fs doesn't support creating ext4 filesystems. It
creates, as I understand it, an ext2 filesystem, then adds a journal,
and sets some bits. It can't support the newer features like extents. So
what we end up with is a bit of a hack for a filesystem.

The ext tools (e2fsprogs) unfortunately don't provide an integrated
solution for generating prepopulated filesystem images as many other
mkfs* tools do. One thing missing was symlink support in libext2fs. I
added that support and demonstrated a script which uses the e2fsprogs
debugfs tool that can populate the newly formatted filesystem from a
directory and without root privileges.

Robert's patches integrate this stage of development into OE-Core. As I
replied to Saul's 0/7 response:

"We can go about this in two ways. One is to just
prototype this in a branch and use it to validate the functionality and
not make any changes to oe-core image generation until mke2fs has
initial directory support. The other is to merge this and get broader
testing of the concept and later move to the full mke2fs implementation
once it becomes available. I understand the resistance to the latter,
but long term I think it will result in a more robust solution as we
will have caught more of the corner cases and have been able to do a
better job integrating into mke2fs the first time."


> Also, when sending patches for review, there is no point in sending a
> series which adds a new file and then makes changes to it as separate
> patches (in particular when the changes are just whitespace).  Please
> squash those into a single patch before posting them on the list.


I think Robert was trying to maintain some history by keeping my
original script intact. I agree, it isn't necessary and those three
patches can be merged into one.

Thank you for reviewing!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


