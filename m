Return-Path: <Fupan.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64A136010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 02:24:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9C2O6AE004368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Oct 2017 19:24:06 -0700 (PDT)
Received: from [128.224.176.119] (128.224.176.119) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 11 Oct 2017 19:24:05 -0700
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170930022455.137406-1-fupan.li@windriver.com>
	<LOXP123MB0117058358878B6D1DD5307E85720@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
From: fupan <fupan.li@windriver.com>
Message-ID: <58df7aa3-65b8-671a-973e-74c348f90632@windriver.com>
Date: Thu, 12 Oct 2017 10:23:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <LOXP123MB0117058358878B6D1DD5307E85720@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: [oe] [meta-java][PATCH] openjdk-8-common: Fix the issue of building failed adlc on host with gcc < 6
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
X-List-Received-Date: Thu, 12 Oct 2017 02:24:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2017/10/3 18:14, Andrew Goodbody wrote:
>> -----Original Message-----
>> From: Fupan Li <fupan.li@windriver.com>
>>
>> The patch recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-
>> flags.patch
>> had tried to fix this issue, and it tried to filter out the
>> TARGET_FLAGS/TARGET_
>> CXXFLGAS, but for the flags such as "-fno-lifetime-dse" was added to
>> CFLAGS/CXXFLAGS,
>> directly, thus that patch failed to filter it out.
>>
>> To fix this issue, it's better to add those GCC version specific flags to
>> BUILD_CFLAGS/
>> BUILD_CXXFLAGS and TARGET_CFLAGS/TARGET_CXXFLAGS separatedly,
>> thus that patch can work
>> as expected.
>>
>> Signed-off-by: Fupan Li <fupan.li@windriver.com>
>> ---
>>   recipes-core/openjdk/openjdk-8-common.inc | 36
>> ++++++++++++++++++++-----------
>>   1 file changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
>> core/openjdk/openjdk-8-common.inc
>> index 83828e1..c609232 100644
>> --- a/recipes-core/openjdk/openjdk-8-common.inc
>> +++ b/recipes-core/openjdk/openjdk-8-common.inc
>> @@ -231,27 +231,39 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-
>> pointer-checks"
>>   # version is and only add the flags that are appropriate for that GCC
>>   # version.
>>
>> -def version_specific_cflags(d):
>> +def version_specific_cflags(d, toolchain):
>>       extraflags = None
>>       version = None
>>
>> -    if bb.data.inherits_class('native', d):
>> -        from subprocess import Popen, PIPE
>> +    from subprocess import Popen, PIPE
>> +    cmd = d.expand('%s -dumpversion' % toolchain ).split()
>> +    cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
>> +    version = cc.communicate()[0].decode('utf-8')[0]
>>
>> -        cmd = d.expand('${CC} -dumpversion').split()
>> -        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
>> -        version = cc.communicate()[0].decode('utf-8')[0]
>> +    if version.isdigit():
>> +        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>> +        return extraflags
>> +    return ''
>> +
>> +python __anonymous() {
>> +    if bb.data.inherits_class('native', d):
>> +        toolchain = d.getVar('CC', True)
>> +        extraflags = version_specific_cflags(d, toolchain)
>> +        d.appendVar("CFLAGS", ' ' + extraflags)
>> +        d.appendVar("CXXFLAGS", ' ' + extraflags)
>>       else:
>>           # in the cross case, trust that GCCVERSION is correct. This won't
>>           # work if the native toolchain is Clang, but as of this writing that
>>           # doesn't work anyway.
>>           version = d.getVar('GCCVERSION', expand=True)[0]
>> -
>> -    if version.isdigit():
>>           extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>> -        return extraflags
>> -    return ''
>> +        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
>> +        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
>> +
>> +        toolchain = d.getVar('BUILD_CC', True)
>> +        extraflags = version_specific_cflags(d, toolchain)
>> +        d.appendVar("BUILD_CFLAGS", ' ' + extraflags)
>> +        d.appendVar("BUILD_CXXFLAGS", ' ' + extraflags)
>> +}
>>
>> -CFLAGS_append = " ${@version_specific_cflags(d)}"
>> -CXXFLAGS_append = " ${@version_specific_cflags(d)}"
>>   CXX_append = " -std=gnu++98"
>> --
>> 2.11.0
> I get the following build failure with the above patch now, backing it out makes the build work OK.
Hi, Andrew

What's your build host, and can you give me
the steps to reproduce this issue on my side?

Thanks!

Fupan
>
> ERROR: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjre-8_102b14.bb: Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 13, function: <module>
>       0009:__anon_35__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_devshell_bbclass(d)
>       0010:__anon_101__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_sstate_bbclass(d)
>       0011:__anon_313__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_package_ipk_bbclass(d)
>       0012:__anon_154__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_siteinfo_bbclass(d)
>   *** 0013:__anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc(d)
>       0014:__anon_108__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_update_alternatives_bbclass(d)
> File: '/home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjdk-8-common.inc', lineno: 260, function: __anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc
>       0256:        # work if the native toolchain is Clang, but as of this writing that
>       0257:        # doesn't work anyway.
>       0258:        version = d.getVar('GCCVERSION', expand=True)[0]
>       0259:        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>   *** 0260:        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
>       0261:        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
>       0262:
>       0263:        toolchain = d.getVar('BUILD_CC', True)
>       0264:        extraflags = version_specific_cflags(d, toolchain)
> Exception: ValueError: invalid literal for int() with base 10: 'l'
>
> ERROR: Failed to parse recipe: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjre-8_102b14.bb
> ERROR: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjdk-8_102b14.bb: Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 13, function: <module>
>       0009:__anon_35__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_devshell_bbclass(d)
>       0010:__anon_101__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_sstate_bbclass(d)
>       0011:__anon_313__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_package_ipk_bbclass(d)
>       0012:__anon_154__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_siteinfo_bbclass(d)
>   *** 0013:__anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc(d)
>       0014:__anon_108__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_update_alternatives_bbclass(d)
> File: '/home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjdk-8-common.inc', lineno: 260, function: __anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc
>       0256:        # work if the native toolchain is Clang, but as of this writing that
>       0257:        # doesn't work anyway.
>       0258:        version = d.getVar('GCCVERSION', expand=True)[0]
>       0259:        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>   *** 0260:        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
>       0261:        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
>       0262:
>       0263:        toolchain = d.getVar('BUILD_CC', True)
>       0264:        extraflags = version_specific_cflags(d, toolchain)
> Exception: ValueError: invalid literal for int() with base 10: 'l'
>
> Andrew
>


