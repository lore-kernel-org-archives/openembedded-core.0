Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04E607016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 21:47:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7ILlTr6006767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:47:30 -0700
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 14:47:29 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1471500427.git.liezhi.yang@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <25cd51bc-61e5-574d-65c0-542b2d2821a5@windriver.com>
Date: Thu, 18 Aug 2016 16:47:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1471500427.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/8] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Thu, 18 Aug 2016 21:47:31 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

General comment on the patch set.

I do like what this change is trying to accomplish.  However, I think putting
QEMU knowledge into the 'arch' is a bad idea -- unless it's being used to run
the emulator for build-time work.

The arch could very well be used by kernels that simply can't run in QEMU.  I'd
prefer if the QEMU settings were .inc files that were included into BSPs that
were compatible or something like that -- keep them out of the tunes, but make
it easy for a BSP creator to include them.

--Mark

On 8/18/16 1:15 AM, Robert Yang wrote:
> Previously, runqemu had hard coded machine knowledge, which limited its
> usage, for example, qemu can boot genericx86, but runqemu can't, we need
> edit runqemu/runqemu-internal a lot if we want to boot genericx86.
> 
> Now bsp conf files can set vars to make it can be boot by runqemu, and
> qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
> Please see qemuboot.bbclass' comments on how to set the vars.
> 
> * Re-write it in python3, which can reduce lines from 1239 to about 750
>   lines
> * All the machine knowledges are gone
> * Most of the TUN_ARCH knowledge are gone except aarch64 and powerpc,
>   it's not easy to remove the two, so leave them there atm
> * All the previous options are preserved, and there is a new way to run
>   runqemu: (it doesn't need run "bitake -e" in such a case)
>   $ runqemu tmp/deploy/images/qemux86
>   or:
>   $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
>   or:
>   $ runqemu tmp/deploy/images/qemuarm/qemuboot.py
> * Fixed audio support, not limited on x86 or x86_64
> * The kvm support is not limited on x86 or x86_64
> * Fix SLIRP mode
> * Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
>   DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it after
>   stop.
> * More bsps can be boot, such as genericx86 and genericx86-64.
> * The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to
>   meta-xilinx' mailing list.
> * I can't find any qemush4 bsp or how to build it, so it is not
>   considered atm.
> 
> * Tested the following machines, all of them work well:
>   genericx86 genericx86-64
>   qemuarm qemuarm64
>   qemumips qemumips64 qemuppc
>   qemux86 qemux86-64
>   qemuzynq qemuzynqmp
> 
> And also test "bitbake core-image-sato -ctestimage" which uses runqemu, it
> also works.
> 
> // Robert
> 
> The following changes since commit c86bf80abd87acb0da5860806822c64ec9dee089:
> 
>   oeqa.buildperf: use oe.path.remove() (2016-08-17 10:35:27 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
> 
> Robert Yang (8):
>   qemu.inc: inherit qemu-boot.bbclass
>   arm: set vars for runqemu
>   qemuarm64.conf: set vars for runqemu
>   arch-x86.inc: set vars for runqemu
>   arch-mips.inc: set vars for runqemu
>   qemuppc.conf: set vars for runqemu
>   qemuboot.bbclass: add it for runqemu
>   runqemu: refactor it and remove machine knowledge
> 
>  meta/classes/qemuboot.bbclass                |   59 ++
>  meta/conf/machine/include/mips/arch-mips.inc |    6 +
>  meta/conf/machine/include/qemu.inc           |    2 +
>  meta/conf/machine/include/tune-cortexa8.inc  |    4 +
>  meta/conf/machine/include/x86/arch-x86.inc   |   15 +
>  meta/conf/machine/qemuarm.conf               |    5 +
>  meta/conf/machine/qemuarm64.conf             |    9 +
>  meta/conf/machine/qemuppc.conf               |    6 +
>  scripts/runqemu                              | 1261 +++++++++++++++-----------
>  scripts/runqemu-internal                     |  739 ---------------
>  10 files changed, 842 insertions(+), 1264 deletions(-)
>  create mode 100644 meta/classes/qemuboot.bbclass
>  delete mode 100755 scripts/runqemu-internal
> 


