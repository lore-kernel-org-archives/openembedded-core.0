Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B78186FF60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 06:28:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4U6S9Sd026982
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 29 May 2016 23:28:09 -0700 (PDT)
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Sun, 29 May 2016 23:28:08 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1464145184.git.zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <574BDD75.105@windriver.com>
Date: Mon, 30 May 2016 14:28:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1464145184.git.zhe.he@windriver.com>
X-Originating-IP: [128.224.162.234]
Cc: Ashfield Bruce <bruce.ashfield@windriver.com>
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
X-List-Received-Date: Mon, 30 May 2016 06:28:10 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi Richard,

Do we have plan to try this in v2.2 m1 or some milestone later?

Thanks,
Zhe

On 05/25/2016 04:47 PM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> This has been reviewed several rounds and no more comments are provided so far.
> Here is the brief history. More details can be found in the previous threads.
> Hopefully this can be merged in v2.2 m1.
>
> v1 to v2: 
>  - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
>  - Update related doc files
>  - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
>  - Link built vmlinuz to boot directory for reference
>
> v2 to v3: 
>  - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order that users can still use the old variables.
>  - Run oe_rummake in a loop for every types so that we can add different configurations to them easily in the future.
>  - Warn, intead of die, users if one of the types are over the size limit.
>  - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2. 
>  - Remove the doc parts. They will be submitted yocto-docs later.
>  - Change some grep usage to make it more clear.
>  - Correct a typo.
>
> v3 to v4: 
>  - Adjust according to the latest code context
>
> The following changes since commit c7e614c438706fb3ed7520b4990ebb3973366942:
>
>   useradd: Fix infinite build loop (2016-05-23 10:33:45 +0100)
>
> are available in the git repository at:
>
>   git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=zhe%2Fyocto-bug-6945
>
> for you to fetch changes up to 4cd0e844d4153f2eb2cc54fafbfd161341ef4539:
>
>   kernel: Make symbol link to vmlinuz in boot directory (2016-05-24 22:57:35 -0400)
>
> ----------------------------------------------------------------
> He Zhe (2):
>       kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>       kernel: Make symbol link to vmlinuz in boot directory
>
>  meta/classes/kernel-fitimage.bbclass      |  20 ++++++++-------
>  meta/classes/kernel-grub.bbclass          |  44 +++++++++++++++++++++-----------
>  meta/classes/kernel-uimage.bbclass        |  10 +++++---
>  meta/classes/kernel.bbclass               | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
>  meta/conf/documentation.conf              |   3 ++-
>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 ++++++++++++++++++++++--------------
>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>  7 files changed, 212 insertions(+), 103 deletions(-)
>
> He Zhe (2):
>   kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>   kernel: Make symbol link to vmlinuz in boot directory
>
>  meta/classes/kernel-fitimage.bbclass      |  20 ++--
>  meta/classes/kernel-grub.bbclass          |  44 ++++---
>  meta/classes/kernel-uimage.bbclass        |  10 +-
>  meta/classes/kernel.bbclass               | 187 +++++++++++++++++++++---------
>  meta/conf/documentation.conf              |   3 +-
>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>  7 files changed, 212 insertions(+), 103 deletions(-)
>


