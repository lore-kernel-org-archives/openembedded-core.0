Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA2916D750
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 11:42:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQBgAsF029115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Nov 2013 03:42:10 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 26 Nov 2013 03:42:10 -0800
Message-ID: <5294890E.6040902@windriver.com>
Date: Tue, 26 Nov 2013 19:42:06 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1384419666.git.hongxu.jia@windriver.com>		
	<ac4248f073a505534a6fc9b7c9922b6781b85685.1384419666.git.hongxu.jia@windriver.com>		
	<528E0D2D.4010202@windriver.com> <1385041807.16887.131.camel@ted>	
	<528F4C55.3080106@windriver.com> <1385123276.16887.163.camel@ted>
In-Reply-To: <1385123276.16887.163.camel@ted>
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
X-List-Received-Date: Tue, 26 Nov 2013 11:42:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

This issue could be reproduced only by building multilib packagegroup
package in the first time.

*Step:
1) bitbake packagegroup-core-nfs-server

2) bitbake lib32-packagegroup-core-nfs-server
     Only the first time to do the build has this issue:
     ...
    WARNING: The recipe lib32-packagegroup-core-nfs is trying to install 
files into a shared area when those files already exist. Those files  
and their manifest location are:
/home/jiahongxu/yocto/build-20131120-yocto-qemux86-64/tmp/deploy/rpm/all/packagegroup-core-nfs-server-1.0-r2.all.rpm
       Matched in manifest-allarch-packagegroup-core-nfs.deploy-rpm
    ...

*Why was the first build?
1) If not the first time to build lib32-packagegroup-*, the
    lib32-packagegroup*'s manifest existed, and the current
    build could remove the existed rpm package by reading
    and cleaning the manifest.

2) During the first time, its manifest didn't exist, so there was
    no cleaning operation. But if packagegroup-*'s manifest existed,
    the existed conflict file check will search it, and report the
    warning.

//Hongxu



On 11/22/2013 08:27 PM, Richard Purdie wrote:
> On Fri, 2013-11-22 at 20:21 +0800, Hongxu Jia wrote:
>> Hi Richard,
>>
>> 1. What is the situation to set PACKAGE_ARCH = "${MACHINE_ARCH}"
>> in packagegroup recipe?
>>
>> In this case, MACHINE is qemux86-64, and the packagegroup-core-nfs's
>> RDEPENDS are:
>> "packagegroup-core-nfs-server" -> "nfs-utils" [style=dashed]
>> "packagegroup-core-nfs-server" -> "nfs-utils-client" [style=dashed]
>>
>> We check one utility in nfs-utils by invoking file:
>> $ file image/usr/sbin/exportfs
>> image/usr/sbin/exportfs: ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for
>> GNU/Linux 2.6.34, not stripped
>>
>> Should we consider the nfs-utils and lib32-nfs-utils are different
>> arch? If the answer is yes, the lib32-packagegroup-core-nfs's
>> RDEPENDS should be:
>> "lib32-packagegroup-core-nfs-server" -> "lib32-nfs-utils-client"
>> [style=dashed]
>> "lib32-packagegroup-core-nfs-server" -> "lib32-nfs-utils" [style=dashed]
>>
>> In this situation, I think we should set PACKAGE_ARCH with
>> "${MACHINE_ARCH}" in packagegroup-core-nfs recipe.
>>
>> But there are lots of packagegroup packages that didn't have set
>> PACKAGE_ARCH with "${MACHINE_ARCH}" in their recipe. After a quick
>> search in oe-core, 7 packagegroup recipes did set and almost 33 didn't,
>> so how about use PACKAGE_ARCH = "${MACHINE_ARCH}" by default for
>> packagegroup or just did not inherit allarch in packagegroup.bbclass?
>>
>> 2. What shoud we do if packagegroup packages is allarch?
>>
>> When the packagegroup packages is allarch and multilib is enabled,
>> should we still *do the multilib work* for this allarch recipe?
>> If we do, the override issue happened.
>>
>> In this case, if we don't set PACKAGE_ARCH with "${MACHINE_ARCH}",
>> packagegroup-core-nfs and lib32-packagegroup-core-nfs have different
>> ${WORKDIR}:
>>
>> WORKDIR="${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
>> MULTIMACH_TARGET_SYS="${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
>>
>> In packagegroup-core-nfs, we have:
>> TARGET_VENDOR="-poky"
>> PN="packagegroup-core-nfs"
>>
>> In lib32-packagegroup-core-nfs, after the multilib process we have:
>> TARGET_VENDOR="-pokymllib32"
>> PN="lib32-packagegroup-core-nfs"
>>
>> So we had better to forbid multilib work for the allarch recipe.
> Do you have
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=26559c581695f60861483691e08eee06f524287f applied to your tree?
>
> I'm hoping this issue does not exist when that patch is applied.
>
> Cheers,
>
> Richard
>


