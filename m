Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E12667E553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:06:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5J25NtK005798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2019 19:05:38 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 18 Jun 2019 19:05:24 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org>
	<1560844016-105234-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1sqnCrE8G52LQHMeC-E_6uaH_NVN+Eg7+irdbBPM1fxHRw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <0dbaef96-781e-e2cf-f85f-5240c22a58bd@windriver.com>
Date: Wed, 19 Jun 2019 10:05:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqnCrE8G52LQHMeC-E_6uaH_NVN+Eg7+irdbBPM1fxHRw@mail.gmail.com>
X-Originating-IP: [128.224.162.186]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Wed, 19 Jun 2019 02:06:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/18/19 11:59 PM, Khem Raj wrote:
> On Tue, Jun 18, 2019 at 12:47 AM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> The SDK was unable to find the C++ header pieces correctly since it's
>> using a generic compiler, not one specifically targeting the multilib
>> vendor prefix and default tune.  This adds the right mapping to ensure
>> SDKs work as expected. And fix problem in below configurations:
>>
>> multilib configuration 1:
>> MACHINE="qemumips64"
>> MULTILIBS ?= "multilib:lib32 multilib:libn32"
>> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>> require conf/multilib.conf
>>
>> ignoring nonexistent directory "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32
>>
>> multilib configuration 2:
>> MACHINE="qemumips64"
>> MULTILIBS = 'multilib:lib64 multilib:lib32'
> machine is already 64bit so default lib config will be 64bit, what is
> multilib:lib64 for here ?

This config is get from autobuilder.

machine is set to qemumips64, but DEFAULTTUNE is set to mips64-n32,

so this should be why use multilib:lib64.

>
>> DEFAULTTUNE = 'mips64-n32'
>> DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
>> DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
>> require conf/multilib.conf
>>
>> For this configuration:
>> for target gcc-runtime, need to create symlink like mips64-poly-linux --> mips64-poky-linux-gnu32
>> for target lib64-gcc-runtime, need to create symlink like mips64-poly-linux/32 --> mips64-pokymllib64-linux
>> in order to avoid conflict during populate_sdk, create symlink for subfoler bits/ext for target gcc-runtime,
>> this is ugly, but seems no better way to cover all kinds of configuration.
>>
>> single lib configuration:
>> MACHINE="qemumips64"
>> DEFAULTTUNE = "mips64-n32"
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++++++++++++------------
>>   1 file changed, 17 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> index 3d03d8e..ba767e1 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -86,10 +86,6 @@ do_install () {
>>          if [ -d ${D}${infodir} ]; then
>>                  rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>>          fi
>> -       if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>> -               ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
>> -       fi
>> -
>>   }
>>
>>   do_install_append_class-target () {
>> @@ -98,20 +94,29 @@ do_install_append_class-target () {
>>          fi
>>
>>          if [ "${TARGET_OS}" = "linux-gnun32" ]; then
>> -               if [ "${MULTILIBS}" != "" ]; then
>> -                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
>> -                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
>> +               if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
>> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
>> +               elif [ "${MULTILIB_VARIANTS}" != "" ]; then
>> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
>>                  else
>>                          ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>>                  fi
>> -       fi
>> -       if [ "${TARGET_OS}" = "linux-gnux32" ]; then
>> -               if [ "${MULTILIBS}" != "" ]; then
>> -                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
>> -                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
>> +       elif [ "${TARGET_OS}" = "linux-gnux32" ]; then
>> +               if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
>> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
>> +               elif [ "${MULTILIB_VARIANTS}" != "" ]; then
>> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
>>                  else
>>                          ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>>                  fi
>> +       elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>> +               mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
>> +               ln -s ../${TARGET_SYS}/bits ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits
>> +               ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
>>          fi
>>
>>          if [ "${TCLIBC}" != "glibc" ]; then
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
BRs

Sandy(Li Changqing)


