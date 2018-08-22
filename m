Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7D4A78F79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:17:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7M3HZbM022874
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 20:17:35 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 21 Aug 2018 20:17:34 -0700
To: ChenQi <Qi.Chen@windriver.com>, <richard.purdie@linuxfoundation.org>
References: <cover.1534832871.git.kai.kang@windriver.com>
	<c3486f8b-70ae-028b-5208-97f876462c71@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <7cd64d13-0010-02e9-a8cd-7760f94a306e@windriver.com>
Date: Wed, 22 Aug 2018 11:17:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c3486f8b-70ae-028b-5208-97f876462c71@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V2][PATCH 0/3] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Wed, 22 Aug 2018 03:17:36 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月22日 10:36, ChenQi wrote:
> There's some oe-selftest failures on autobuiler.
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1300/steps/Running%20oe-selftest/logs/stdio 
>

The patches are to disable allarch when multilib is used. So failure of  
test case sstatetests.SStateTests.test_sstate_allarch_samesigs_multilib
is to be expected.

I'll check the other 4 testcase failures.

Regards,
Kai

>
> Best Regards,
> Chen Qi
>
> On 08/21/2018 02:36 PM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> V2:
>> * move content of allarch.bbclass to allarch-enabled.bbclass and only
>>    inherit allarch-enabled when multilib is not used
>> * update SSTATE_DUPWHITELIST
>>
>> Build pass for following targets on qemux86-64 and qemuarm64 for rpm,
>> ipk and deb.
>>
>> * core-image-sato
>> * core-image-sato -c populate_sdk
>> * world
>> * buildtools-tarball
>>
>> Known issues:
>> There are 2 *existing* multilib related issues which are not caused by
>> this serial of patches:
>>
>> 1 QA warnings of lib32-meta-ide-support and lib32-perf
>>
>> WARNING: lib32-meta-ide-support-1.0-r3 do_configure: Manifest
>> /buildarea1/jkang-taf/WRL1018/OV/0730/host/build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-ncurses.populate_sysroot 
>>
>> not found in intel_x86_64 corei7-32 core2-32 i686 i586 x86 allarch
>> x86_64_x86_64-nativesdk (variant '')?
>>
>> WARNING: lib32-perf-1.0-r9 do_install: Manifest
>> /buildarea1/jkang-taf/WRL1018/OV/0730/host/build/tmp-glibc/sstate-control/manifest-x86_64_i686-binutils-cross-x86_64.populate_sysroot 
>>
>> not found in x86_64_i686 (variant '')?
>>
>> 2 fails to build lib32-buildtools-tarball
>>
>> ERROR: lib32-buildtools-tarball-1.0-r0 do_populate_sdk: No manifest
>> generated from: qemuwrapper-cross in
>> /buildarea3/kkang/poky-20141111/poky/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb 
>>
>>
>> I am working on them.
>>
>>
>> The following changes since commit 
>> 99506b0017bdf8dbf42ec5dc048d91a5609dabe3:
>>
>>    weston-init: run login before start weston.service (2018-08-20 
>> 17:38:23 +0100)
>>
>> are available in the Git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib kangkai/allarch-enabled
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/allarch-enabled
>>
>> Kai Kang (3):
>>    cmake.bbclass: fix wrong toolchain flags of nativesdk package
>>    allarch: disable allarch when multilib is used
>>    sstate.bbclass: update SSTATE_DUPWHITELIST
>>
>>   meta/classes/allarch-enabled.bbclass | 52 ++++++++++++++++++++++++++++
>>   meta/classes/allarch.bbclass         | 51 ++-------------------------
>>   meta/classes/cmake.bbclass           |  1 +
>>   meta/classes/icecc.bbclass           |  2 +-
>>   meta/classes/multilib.bbclass        |  2 +-
>>   meta/classes/multilib_global.bbclass |  2 +-
>>   meta/classes/package.bbclass         |  6 ++--
>>   meta/classes/sstate.bbclass          |  4 ++-
>>   8 files changed, 64 insertions(+), 56 deletions(-)
>>   create mode 100644 meta/classes/allarch-enabled.bbclass
>>
>
>

-- 
Regards,
Neil | Kai Kang


