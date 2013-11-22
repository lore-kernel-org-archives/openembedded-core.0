Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF4F96B39C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 12:21:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAMCLsce021200
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 04:21:54 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 22 Nov 2013 04:21:52 -0800
Message-ID: <528F4C55.3080106@windriver.com>
Date: Fri, 22 Nov 2013 20:21:41 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1384419666.git.hongxu.jia@windriver.com>	
	<ac4248f073a505534a6fc9b7c9922b6781b85685.1384419666.git.hongxu.jia@windriver.com>	
	<528E0D2D.4010202@windriver.com> <1385041807.16887.131.camel@ted>
In-Reply-To: <1385041807.16887.131.camel@ted>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1] lib32-packagegroup-core-nfs: fix qa issue - install files into a shared area when those files already exist
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
X-List-Received-Date: Fri, 22 Nov 2013 12:21:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

1. What is the situation to set PACKAGE_ARCH = "${MACHINE_ARCH}"
in packagegroup recipe?

In this case, MACHINE is qemux86-64, and the packagegroup-core-nfs's
RDEPENDS are:
"packagegroup-core-nfs-server" -> "nfs-utils" [style=dashed]
"packagegroup-core-nfs-server" -> "nfs-utils-client" [style=dashed]

We check one utility in nfs-utils by invoking file:
$ file image/usr/sbin/exportfs
image/usr/sbin/exportfs: ELF 64-bit LSB executable, x86-64,
version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.34, not stripped

Should we consider the nfs-utils and lib32-nfs-utils are different
arch? If the answer is yes, the lib32-packagegroup-core-nfs's
RDEPENDS should be:
"lib32-packagegroup-core-nfs-server" -> "lib32-nfs-utils-client" 
[style=dashed]
"lib32-packagegroup-core-nfs-server" -> "lib32-nfs-utils" [style=dashed]

In this situation, I think we should set PACKAGE_ARCH with
"${MACHINE_ARCH}" in packagegroup-core-nfs recipe.

But there are lots of packagegroup packages that didn't have set
PACKAGE_ARCH with "${MACHINE_ARCH}" in their recipe. After a quick
search in oe-core, 7 packagegroup recipes did set and almost 33 didn't,
so how about use PACKAGE_ARCH = "${MACHINE_ARCH}" by default for
packagegroup or just did not inherit allarch in packagegroup.bbclass?

2. What shoud we do if packagegroup packages is allarch?

When the packagegroup packages is allarch and multilib is enabled,
should we still *do the multilib work* for this allarch recipe?
If we do, the override issue happened.

In this case, if we don't set PACKAGE_ARCH with "${MACHINE_ARCH}",
packagegroup-core-nfs and lib32-packagegroup-core-nfs have different
${WORKDIR}:

WORKDIR="${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
MULTIMACH_TARGET_SYS="${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"

In packagegroup-core-nfs, we have:
TARGET_VENDOR="-poky"
PN="packagegroup-core-nfs"

In lib32-packagegroup-core-nfs, after the multilib process we have:
TARGET_VENDOR="-pokymllib32"
PN="lib32-packagegroup-core-nfs"

So we had better to forbid multilib work for the allarch recipe.

//Hongxu

On 11/21/2013 09:50 PM, Richard Purdie wrote:
> On Thu, 2013-11-21 at 21:39 +0800, Hongxu Jia wrote:
>> Hi All,
>>
>> In this case, there are two 'packagegroup-core-nfs-server-1.0-r2.0.all.rpm'
>> in tmp/deploy/rpm/all. One is made by 'bitbake packagegroup-core-nfs ',
>> and the other is made by 'bitbake lib32-packagegroup-core-nfs '.
>> The last one overrode the previous triggered the QA check.
>>
>> By default, packagegroup inherit allarch, which means the PACKAGE_ARCH
>> is "all".
>>
>> Is it proper that 'all' packages are not supposed to be expanded into the
>> multilib versions?
> Yes.
>
>> There are some other packagegroup recipes have the similar issue.
> It sounds like there is some configuration causing this to get rebuild.
> Can you run bitbake-diffsigs on the stamps for the two tasks and see why
> its building this twice? It sound only happen once.
>
> Cheers,
>
> Richard
>


