Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 844A9731BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:29:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u042T1rQ005126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jan 2016 18:29:01 -0800 (PST)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Sun, 3 Jan 2016 18:29:01 -0800
Message-ID: <5689D8E9.4090606@windriver.com>
Date: Mon, 4 Jan 2016 10:28:57 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1446645475.git.liezhi.yang@windriver.com>	<3da4fc0c20bf2ab7ac4c489aaa37d707e769d6c3.1446645475.git.liezhi.yang@windriver.com>	<CAJTo0Lb6zSiunoe73fu==ZHD6yFsT+4d9FTRmxDgfpV-p0tY=Q@mail.gmail.com>
	<5645AC3C.80804@windriver.com>
In-Reply-To: <5645AC3C.80804@windriver.com>
X-Originating-IP: [128.224.162.246]
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
X-List-Received-Date: Mon, 04 Jan 2016 02:29:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2015 05:24 PM, Robert Yang wrote:
>
>
> On 11/10/2015 12:27 AM, Burton, Ross wrote:
>>
>> On 4 November 2015 at 13:58, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
>>     this makes multilib sdk doesn't work, for example:
>>
>>     MACHINE = qemuarm64
>>     require conf/multilib.conf
>>     MULTILIBS = "multilib:lib32"
>>     DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
>>
>>     $ bitbake core-image-minimal -cpopulate_sdk
>>
>>     Then extract SDK, the
>>     environment-setup-armv7a-vfp-neon-pokymllib32-linux-gnueabi
>>     doesn't work since:
>>     * The CC is arm-pokymllib32-linux-gnueabi-gcc
>>        which doesn't exist, the patch for cross-canadian.bbclass
>>        fixes problem.
>>     * Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi
>>        which doesn't exist, the patch for libgcc-common.inc fixes the
>>        problem.
>>
>>     [YOCTO #8616]
>>
>>
>> This breaks the allarch sstate sanity test on the autobuilder which 
>> verifies
>> that allarch recipes don't have different hashes for a no-op change 
>> to the machine.
>
> Hi Ross,
>
> After more investigations, the different between:
> MACHINE=qemux86 bitbake -Snone meta-toolchain
> MACHINE=qemuarm bitbake -Snone meta-toolchain
>
> is do_extra_symlinks' checksum, there is an ABIEXTENSION for
> nativesdk-libgcc-initial when qemuarm (eabi), and no "eabi" when
> qemux86.
>
> But as the commit said, the "eabi" is a must for qemuarm since its 
> compiler
> arm-pokymllib32-linux-gnueabi-gcc contains eabi, otherwise it doesn't 
> work.
>
> Maybe let the test case don't compare between qemuarm and qemux86 since
> arm is special ? Or do you have any other suggestions, please ?
>
>
> // Robert
>

Ping ...


>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/242/steps/Running%20oe-selftest/logs/stdio 
>>
>>
>> Ross


