Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAWy1-0003uF-3d
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 03:42:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1R2Pea0009518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 18:25:40 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 18:25:39 -0800
Message-ID: <512D6E9D.6050909@windriver.com>
Date: Wed, 27 Feb 2013 10:25:33 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: <dvhart@linux.intel.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Wed, 27 Feb 2013 02:42:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi all,

Thank you very much for all your reviewing, I will pull your comments in
and send a RFC sooner.

// Robert

On 02/26/2013 05:24 PM, Robert Yang wrote:
> ===Contents===
>    * Summary
>    * Brief design
>    * Test info
>    * The rootfs generation time changes
>    * The rootfs size changes
>
> * Summary:
>    The ext3 and ext4 rootfs generation relied on genext2fs and flipping
>    some bits to "convert" the ext2 filesystem to ext3 and ext4 in the past,
>    now we use the mkfs.ext3/ext4 to create the image, and use mkdebugfs.sh
>    to copy the files to the image.
>
> * Brief design:
>    - Upgrade the e2fsprogs to the update to date version (the git
>      repo) which contains the "symlink" command in debugfs shell that we
>      need.
>    - Replace the current genext2fs command with mkdebugfs.sh in
>      image_types.bbclass.
>    - The new steps to generate the root filesystem are:
>      -> use "dd" command to make rootfs.ext* file
>      -> run "mkfs.ext* rootfs.ext*" to create the filesystem
>      -> run the mkdebugfs.sh to generate the root filesystem
>
> * Test info: (MACHINE = qemuarm, IMAGE_FSTYPES = "ext2 ext3 ext4 tar.bz2")
>    $ bitbake core-image-minimal core-image-sato meta-toolchain-sdk core-image-sato-sdk
>    $ runqemu runqemu qemuarm core-image-sato ext3
>    $ runqemu runqemu qemuarm core-image-minimal ext3
>
>    All of them are OK
>
> * The rootfs generation time changes
>    - For a core-image-minimal generation (IMAGE_FSTYPES="tar.bz2 ext3"):
>
>      Before:
>      $ time bitbake core-image-minimal
>
>      real    1m10.823s
>      user    0m37.108s
>      sys     0m15.894s
>
>      After:
>      $ time bitbake core-image-minimal
>
>      real    1m17.501s
>      user    0m29.304s
>      sys     0m20.731s
>
>      # 7 seconds lost.
>
>    - For a core-image-sato generation (IMAGE_FSTYPES="tar.bz2 ext3"):
>
>      Before:
>      $ time bitbake core-image-sato
>
>      real    11m10.645s
>      user    2m43.503s
>      sys     1m1.589s
>
>      After:
>      $ time bitbake core-image-sato
>
>      real    11m53.131s
>      user    3m18.988s
>      sys     2m8.350s
>
>      # 43 seconds lost.
>
> * The rootfs size changes
>    - The image size are the same by "ls -h", but different by "du -sh":
>      (core-image-sato)
>
>      $ ls -lh BEFORE.rootfs.ext3 AFTER.rootfs.ext3 | awk '{print $5"\t"$NF}'
>      357M BEFORE.rootfs.ext3
>      357M AFTER.rootfs.ext3
>
>      $ du -sh BEFORE.rootfs.ext3 AFTER.rootfs.ext3
>      238M    BEFORE.rootfs.ext3
>      357M    AFTER.rootfs.ext3
>
>      It seems that the genext2fs has optimized the rootfs generation.
>
> // Robert
>
> The following changes since commit 2cc4fe4a0874c42421b1bf3fa100160a9e60a9da:
>
>    upstream_tracking.inc: Coonectivity and multimedia packages updates (2013-02-25 05:58:20 -0800)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/e2fsprogs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/e2fsprogs
>
> Robert Yang (7):
>    e2fsprogs: upgrade to the git version (rename only)
>    e2fsprogs: upgrade to the git version
>    e2fsprogs: add the original mkdebugfs.sh
>    mkdebugfs.sh: convert the tab to 4 spaces
>    mkdebugfs.sh: several fixes
>    e2fsprogs: ship mkfsdebug.sh
>    image_types.bbclass: replace genext2fs with mkdebugfs.sh
>
>   meta/classes/image_types.bbclass                   | 45 +++++-------
>   meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |  4 +-
>   .../{e2fsprogs-1.42.6 => e2fsprogs}/acinclude.m4   |  0
>   .../fallocate.patch                                |  0
>   .../e2fsprogs/e2fsprogs/mkdebugfs.sh               | 82 ++++++++++++++++++++++
>   .../{e2fsprogs-1.42.6 => e2fsprogs}/mkdir.patch    |  0
>   .../remove.ldconfig.call.patch                     |  0
>   .../{e2fsprogs_1.42.6.bb => e2fsprogs_git.bb}      |  6 +-
>   8 files changed, 106 insertions(+), 31 deletions(-)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/acinclude.m4 (100%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/fallocate.patch (100%)
>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/mkdir.patch (100%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/remove.ldconfig.call.patch (100%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.6.bb => e2fsprogs_git.bb} (92%)
>


