Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8B2677289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:24:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD9OF5e020935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 13 Nov 2015 01:24:15 -0800
Received: from [128.224.163.148] (128.224.163.148) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 13 Nov 2015 01:24:14 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1446645475.git.liezhi.yang@windriver.com>
	<3da4fc0c20bf2ab7ac4c489aaa37d707e769d6c3.1446645475.git.liezhi.yang@windriver.com>
	<CAJTo0Lb6zSiunoe73fu==ZHD6yFsT+4d9FTRmxDgfpV-p0tY=Q@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5645AC3C.80804@windriver.com>
Date: Fri, 13 Nov 2015 17:24:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6zSiunoe73fu==ZHD6yFsT+4d9FTRmxDgfpV-p0tY=Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cross-canadian/libgcc: fix aarch64's multilib SDK
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
X-List-Received-Date: Fri, 13 Nov 2015 09:24:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2015 12:27 AM, Burton, Ross wrote:
>
> On 4 November 2015 at 13:58, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
>     this makes multilib sdk doesn't work, for example:
>
>     MACHINE = qemuarm64
>     require conf/multilib.conf
>     MULTILIBS = "multilib:lib32"
>     DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
>
>     $ bitbake core-image-minimal -cpopulate_sdk
>
>     Then extract SDK, the
>     environment-setup-armv7a-vfp-neon-pokymllib32-linux-gnueabi
>     doesn't work since:
>     * The CC is arm-pokymllib32-linux-gnueabi-gcc
>        which doesn't exist, the patch for cross-canadian.bbclass
>        fixes problem.
>     * Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi
>        which doesn't exist, the patch for libgcc-common.inc fixes the
>        problem.
>
>     [YOCTO #8616]
>
>
> This breaks the allarch sstate sanity test on the autobuilder which verifies
> that allarch recipes don't have different hashes for a no-op change to the machine.

Hi Ross,

After more investigations, the different between:
MACHINE=qemux86 bitbake -Snone meta-toolchain
MACHINE=qemuarm bitbake -Snone meta-toolchain

is do_extra_symlinks' checksum, there is an ABIEXTENSION for
nativesdk-libgcc-initial when qemuarm (eabi), and no "eabi" when
qemux86.

But as the commit said, the "eabi" is a must for qemuarm since its compiler
arm-pokymllib32-linux-gnueabi-gcc contains eabi, otherwise it doesn't work.

Maybe let the test case don't compare between qemuarm and qemux86 since
arm is special ? Or do you have any other suggestions, please ?


// Robert

>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/242/steps/Running%20oe-selftest/logs/stdio
>
> Ross

