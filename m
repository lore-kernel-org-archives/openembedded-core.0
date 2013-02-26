Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UASnG-0004NQ-7E
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:14:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2013 13:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="268072432"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.55])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 13:58:17 -0800
Message-ID: <512D2FF9.5070005@linux.intel.com>
Date: Tue, 26 Feb 2013 13:58:17 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<512CF727.7090000@linux.intel.com>
In-Reply-To: <512CF727.7090000@linux.intel.com>
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
X-List-Received-Date: Tue, 26 Feb 2013 22:14:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/26/2013 09:55 AM, Saul Wold wrote:
> On 02/26/2013 01:24 AM, Robert Yang wrote:
>> ===Contents===
>>    * Summary
>>    * Brief design
>>    * Test info
>>    * The rootfs generation time changes
>>    * The rootfs size changes
>>
>> * Summary:
>>    The ext3 and ext4 rootfs generation relied on genext2fs and flipping
>>    some bits to "convert" the ext2 filesystem to ext3 and ext4 in the past,
>>    now we use the mkfs.ext3/ext4 to create the image, and use mkdebugfs.sh
>>    to copy the files to the image.
>>
>> * Brief design:
>>    - Upgrade the e2fsprogs to the update to date version (the git
>>      repo) which contains the "symlink" command in debugfs shell that we
>>      need.
> This should really be an RFC
> 
> This work was intended to be a step toward incorporating it into 
> genext2fs directly.


I think that was a thinko, but I'll correct for everyone else's benefit.
This will eventually be incorporated into libext2fs and mke2fs directly
and genext2fs will be retired as obsolete.


> At this point we do not want to switch to the GIT
> version of e2fsprogs, there is an update to e2fsprogs pending on the 
> patch queue that addes the symlink support (crossed with your request)
> 
>>    - Replace the current genext2fs command with mkdebugfs.sh in
>>      image_types.bbclass.
> 
> The goal is to change genext2fs to support a rootfs option an not 
> replace it with mkdebugfs.


Again, mke2fs. We can go about this in two ways. One is to just
prototype this in a branch and use it to validate the functionality and
not make any changes to oe-core image generation until mke2fs has
initial directory support. The other is to merge this and get broader
testing of the concept and later move to the full mke2fs implementation
once it becomes available. I understand the resistance to the latter,
but long term I think it will result in a more robust solution as we
will have caught more of the corner cases and have been able to do a
better job integrating into mke2fs the first time.


> 
>>    - The new steps to generate the root filesystem are:
>>      -> use "dd" command to make rootfs.ext* file
> Why the dd?


mke2fs requires an image file to format. We could create it in other
ways, but this seems reasonable. We could probably reduce the time to
create it by using a larger block size. Say 1M?


> 
>>      -> run "mkfs.ext* rootfs.ext*" to create the filesystem
>>      -> run the mkdebugfs.sh to generate the root filesystem
>>
> 
> 
> 
>> * Test info: (MACHINE = qemuarm, IMAGE_FSTYPES = "ext2 ext3 ext4 tar.bz2")
>>    $ bitbake core-image-minimal core-image-sato meta-toolchain-sdk core-image-sato-sdk
>>    $ runqemu runqemu qemuarm core-image-sato ext3
>>    $ runqemu runqemu qemuarm core-image-minimal ext3
>>
>>    All of them are OK
> 
> What about booting an ext4 image, part of the goal of this was to enable 
> ext4.


Seconded.



-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


