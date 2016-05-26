Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBB00605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 07:59:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4Q7xLKw014411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 26 May 2016 00:59:22 -0700
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 26 May 2016 00:59:21 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1464145184.git.zhe.he@windriver.com>
	<CADkTA4N95b3-HCGzgq3bU4mSbDEQQiejR6Uy0Pth1_NE9AZSuA@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <5746ACD6.3010503@windriver.com>
Date: Thu, 26 May 2016 15:59:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4N95b3-HCGzgq3bU4mSbDEQQiejR6Uy0Pth1_NE9AZSuA@mail.gmail.com>
X-Originating-IP: [128.224.162.234]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/2] Yocto Bug #6945
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
X-List-Received-Date: Thu, 26 May 2016 07:59:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 05/25/2016 08:12 PM, Bruce Ashfield wrote:
>
>
> On Wed, May 25, 2016 at 4:47 AM, <zhe.he@windriver.com <mailto:zhe.he@windriver.com>> wrote:
>
>     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>
>     This has been reviewed several rounds and no more comments are provided so far.
>     Here is the brief history. More details can be found in the previous threads.
>     Hopefully this can be merged in v2.2 m1.
>
>     v1 to v2:
>      - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
>      - Update related doc files
>      - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
>      - Link built vmlinuz to boot directory for reference
>
>     v2 to v3:
>      - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order that users can still use the old variables.
>      - Run oe_rummake in a loop for every types so that we can add different configurations to them easily in the future.
>      - Warn, intead of die, users if one of the types are over the size limit.
>      - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.
>      - Remove the doc parts. They will be submitted yocto-docs later.
>      - Change some grep usage to make it more clear.
>      - Correct a typo.
>
>     v3 to v4:
>      - Adjust according to the latest code context
>
>
>
> v4 looks ok to me.
>
> There was another series posted: [kernel-multi: stage and package multiple kernels], did
> you have a look at that one? Do these two series work properly together ?
>

These two can not work properly together for the moment. My series build multi types of
kernels. "kernel-multi" aims at building another version of kernel by optionally extending
kernel.bbclass to kernel-multi.bbclass.

If we want both of the two features, "kernel-multi" might need to be changed according to
mine, since it inherits kernel.bbclass and overrides some variables before doing its own job.
e.g. "kernel-multi" uses KERNEL_IMAGETYPE as the only kernel image type, whereas my
series use KERNEL_IMAGETYPE plus KERNEL_IMAGETYPES as bug #6945 wants.

Thanks,
Zhe

> Bruce
>
>
>     The following changes since commit c7e614c438706fb3ed7520b4990ebb3973366942:
>
>       useradd: Fix infinite build loop (2016-05-23 10:33:45 +0100)
>
>     are available in the git repository at:
>
>       git.yoctoproject.org/poky-contrib <http://git.yoctoproject.org/poky-contrib> zhe/yocto-bug-6945
>       http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=zhe%2Fyocto-bug-6945
>
>     for you to fetch changes up to 4cd0e844d4153f2eb2cc54fafbfd161341ef4539:
>
>       kernel: Make symbol link to vmlinuz in boot directory (2016-05-24 22:57:35 -0400)
>
>     ----------------------------------------------------------------
>     He Zhe (2):
>           kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>           kernel: Make symbol link to vmlinuz in boot directory
>
>      meta/classes/kernel-fitimage.bbclass      |  20 ++++++++-------
>      meta/classes/kernel-grub.bbclass          |  44 +++++++++++++++++++++-----------
>      meta/classes/kernel-uimage.bbclass        |  10 +++++---
>      meta/classes/kernel.bbclass               | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
>      meta/conf/documentation.conf              |   3 ++-
>      meta/recipes-kernel/linux/linux-dtb.inc   |  49 ++++++++++++++++++++++--------------
>      meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>      7 files changed, 212 insertions(+), 103 deletions(-)
>
>     He Zhe (2):
>       kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>       kernel: Make symbol link to vmlinuz in boot directory
>
>      meta/classes/kernel-fitimage.bbclass      |  20 ++--
>      meta/classes/kernel-grub.bbclass          |  44 ++++---
>      meta/classes/kernel-uimage.bbclass        |  10 +-
>      meta/classes/kernel.bbclass               | 187 +++++++++++++++++++++---------
>      meta/conf/documentation.conf              |   3 +-
>      meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
>      meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>      7 files changed, 212 insertions(+), 103 deletions(-)
>
>     --
>     2.8.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"


