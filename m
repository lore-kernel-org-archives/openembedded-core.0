Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1A479192
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 03:28:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7K3S6lQ007894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Aug 2018 20:28:06 -0700 (PDT)
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 19 Aug 2018 20:28:05 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20180817085427.8557-1-zhixiong.chi@windriver.com>
	<3baf10fc85c46ee6ada3f4a93b004195a0f4fd10.camel@linuxfoundation.org>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <f3ad4cbe-7eeb-4d1c-ae05-6c5ab3bfecd5@windriver.com>
Date: Mon, 20 Aug 2018 11:28:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <3baf10fc85c46ee6ada3f4a93b004195a0f4fd10.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] populate_sdk_base: only depend on nativesdk-glibc-locale when SDK_OS is not mingw32
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
X-List-Received-Date: Mon, 20 Aug 2018 03:28:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

I have seen the two commits from meta-mingw layer upstream:

f49ac31f64a1adffaeb9706eb552dab66b4baff2
a07fe304228b7f41b5558de7d8f39fd5e8a430d2

, and I haven't updated the git repo for this layer in my local machine.
These two patches fixed the issue, so the patches from me are not needed 
any more.

Thanks.

On 2018年08月18日 05:30, Richard Purdie wrote:
> On Fri, 2018-08-17 at 01:54 -0700, Zhixiong Chi wrote:
>> When we add the nativesdk-glibc-locale dependence for libc-glibc, if
>> the SDK_OS
>> is mingw32, it will broken the building with the following error:
>>> NOTE: Resolving any missing task queue dependencies
>>> ERROR: Nothing RPROVIDES 'nativesdk-glibc' (but
>>> virtual:nativesdk:layers/oe-core/meta/recipes-core/glibc/glibc-
>>> locale_2.24.bb
>>> RDEPENDS on or otherwise requires it)
>>> ERROR: nativesdk-glibc was skipped:
>>> PREFERRED_PROVIDER_virtual/nativesdk-libc set to nativesdk-mingw-
>>> w64-runtime, not nativesdk-glibc
>>> NOTE: Runtime target 'nativesdk-glibc' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['nativesdk-glibc']
>>> ERROR: Required build target 'meta-toolchain' has no buildable
>>> providers.
>>> Missing or unbuildable dependency chain was: ['meta-toolchain',
>>> 'nativesdk-glibc-locale', 'nativesdk-glibc']
>> mingw32 SDK_OS doesn't need to depend on nativesdk-glibc-locale.
>>
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> ---
>>   meta/classes/populate_sdk_base.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index c456c52866..65c27b0077 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -48,7 +48,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>>   SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>>   SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
>>   PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
>> -SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
>> +SDK_DEPENDS_append_libc-glibc = " ${@bb.utils.contains('SDK_OS', 'mingw32', '', 'nativesdk-glibc-locale', d)}"
>>   
>>   # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>>   # could be set to the MACHINE_ARCH
> I appreciate this fixes a specific problem but this code is wrong
> anyway, libc-glibc is a target override and we're talking about the sdk
>   here. To illustrate, if a target image was musl based but the sdk
> glibc based, this code wouldn't work.
>
> Could we therefore correct this to correctly determine which libc is
> being used in the SDK? If we're going to fix it, lets fix it
> properly...
>
> Cheers,
>
> Richard
>
>
>
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


