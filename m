Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UZqyD-0004Sa-0u
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 01:07:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2013 15:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,631,1363158000"; d="scan'208";a="309855298"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2013 15:48:47 -0700
Message-ID: <518984CD.4060601@linux.intel.com>
Date: Tue, 07 May 2013 15:48:45 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1367919920.git.liezhi.yang@windriver.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] replace genext2fs with populate-extfs.sh
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
X-List-Received-Date: Tue, 07 May 2013 23:07:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Have these been reviewed on the ext mailing list already?

--
Darren

On 05/07/2013 02:48 AM, Robert Yang wrote:
> * The benefits:
>   - Really support ext4
>   - Support the sparse file (the sparse file became into the common file before)
>   - Have a uniform code for ext2/3/4 generation
>   - Remove the depends on genext2fs-native
> 
> * Impact
>   - Build time:
>     a) If we build fresh core-image-sato, there is nearly no impact.
>     b) If we do the image generation, which means:
>        $ bitbake core-image-sato
>        $ bitbake core-image-sato -ccleansstate
>        $ bitbake core-image-sato
>    About 50 extra seconds are needed, here is my test result:
>    Before the patches: 4m25s
>    After the patches: 5m17s
>    This is because the genext2fs is much faster than the 
>    populate-extfs.sh, we will replace this script by the mke2fs when it
>    supports create the filesystem from a initial directory.
> 
>   - Disk space (take core-image-sato as an example)
>     a) The image file size is the same as before (529M)
>     b) The disk usage is a little different: (du -sh)
>               before       now 
>        ext2:  364M         388M
>        ext3:  381M         404M
>        ext4:  380M         387M
> 
>    We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to 1.4.
> 
>    I have done some simple runtime testing on core-image-sato and 
>    core-image-minimal, they worked well.
> 
> // Robert
> 
> The following changes since commit 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:
> 
>   grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib robert/ext4
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ext4
> 
> Robert Yang (4):
>   e2fsprogs: the max length of debugfs argument is too short
>   e2fsprogs: let debugfs do sparse copy
>   e2fsprogs: add populate-extfs.sh
>   image_types.bbclass: replace genext2fs with populate-extfs.sh
> 
>  meta/classes/image_types.bbclass                   |   46 ++++----
>  .../e2fsprogs-1.42.7/debugfs-too-short.patch       |   28 +++++
>  .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   |   93 ++++++++++++++++
>  .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114 ++++++++++++++++++++
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    4 +
>  5 files changed, 257 insertions(+), 28 deletions(-)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


