Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D319974AE6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 02:53:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w852rrar021955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 19:53:53 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 19:53:51 -0700
To: <richard.purdie@linuxfoundation.org>
References: <cover.1535288685.git.kai.kang@windriver.com>
	<00a09c8156afc325f1b30392b66caf08e0310b38.1535288685.git.kai.kang@windriver.com>
	<98fc089f8be135c19a0210df09b5a755f03d5112.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <81594ab4-f5b8-d811-8fca-cab2a5070d0e@windriver.com>
Date: Wed, 5 Sep 2018 10:52:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <98fc089f8be135c19a0210df09b5a755f03d5112.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Wed, 05 Sep 2018 02:53:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月04日 16:36, richard.purdie@linuxfoundation.org wrote:
> Hi,
>
> I think this is close and it passes the tests on the autobuilder
> however I did spot a couple of potential issues after thinking about
> this for a bit.
>
> On Sun, 2018-08-26 at 06:06 -0700, Kai Kang wrote:
>> Some allarch packages rdepends non-allarch packages. When multilib is
>> used, it doesn't expand the dependency chain correctly, e.g.
>>
>> core-image-sato -> ca-certificates(allarch) -> openssl
>>
>> we expect dependency chain for lib32-core-image-sato:
>>
>> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
>>
>> it should install lib32-openssl for ca-certificates but openssl is
>> still wrongly required.
>>
>> Copy allarch.bbclass to allarch-enabled.bbclass and only inherit
>> allarch-enabled.bbclass when multilib is not used.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/classes/allarch-enabled.bbclass | 52 ++++++++++++++++++++++++++++++++++++
>>   meta/classes/allarch.bbclass         | 51 ++---------------------------------
>>   meta/classes/icecc.bbclass           |  2 +-
>>   meta/classes/multilib.bbclass        |  2 +-
>>   meta/classes/multilib_global.bbclass |  2 +-
>>   meta/classes/package.bbclass         |  6 ++---
>>   6 files changed, 60 insertions(+), 55 deletions(-)
>>   create mode 100644 meta/classes/allarch-enabled.bbclass
>>
>>
>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
>> index 1eebe0bf2e7..0eca076df0b 100644
>> --- a/meta/classes/allarch.bbclass
>> +++ b/meta/classes/allarch.bbclass
>> @@ -1,52 +1,5 @@
>>   #
>> -# This class is used for architecture independent recipes/data files (usually scripts)
>> +# This class enables allarch only when multilib is not used.
>>   #
>>   
>> -PACKAGE_ARCH = "all"
>> -
>> -python () {
>> -    # Allow this class to be included but overridden - only set
>> -    # the values if we're still "all" package arch.
>> -    if d.getVar("PACKAGE_ARCH") == "all":
>> -        # No need for virtual/libc or a cross compiler
>> -        d.setVar("INHIBIT_DEFAULT_DEPS","1")
>> -
>> -        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
>> -        # naming anyway
>> -        d.setVar("baselib", "lib")
>> -        d.setVar("TARGET_ARCH", "allarch")
>> -        d.setVar("TARGET_OS", "linux")
>> -        d.setVar("TARGET_CC_ARCH", "none")
>> -        d.setVar("TARGET_LD_ARCH", "none")
>> -        d.setVar("TARGET_AS_ARCH", "none")
>> -        d.setVar("TARGET_FPU", "")
>> -        d.setVar("TARGET_PREFIX", "")
>> -        # Expand PACKAGE_EXTRA_ARCHS since the staging code needs this
>> -        # (this removes any dependencies from the hash perspective)
>> -        d.setVar("PACKAGE_EXTRA_ARCHS", d.getVar("PACKAGE_EXTRA_ARCHS"))
>> -        d.setVar("SDK_ARCH", "none")
>> -        d.setVar("SDK_CC_ARCH", "none")
>> -        d.setVar("TARGET_CPPFLAGS", "none")
>> -        d.setVar("TARGET_CFLAGS", "none")
>> -        d.setVar("TARGET_CXXFLAGS", "none")
>> -        d.setVar("TARGET_LDFLAGS", "none")
>> -        d.setVar("POPULATESYSROOTDEPS", "")
>> -
>> -        # Avoid this being unnecessarily different due to nuances of
>> -        # the target machine that aren't important for "all" arch
>> -        # packages.
>> -        d.setVar("LDFLAGS", "")
>> -
>> -        # No need to do shared library processing or debug symbol handling
>> -        d.setVar("EXCLUDE_FROM_SHLIBS", "1")
>> -        d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
>> -        d.setVar("INHIBIT_PACKAGE_STRIP", "1")
>> -
>> -        # These multilib values shouldn't change allarch packages so exclude them
>> -        d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
>> -        d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
>> -        d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
>> -    elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
>> -        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
>> -}
>> -
>> +inherit ${@oe.utils.ifelse(d.getVar('MULTILIB_VARIANTS'), '', 'allarch-enabled')}
> Firstly, whilst I do understand why you've made this change like this,
> I don't really like one line classes which clutter up the classes
> directory. Using inherit like this does force the expansion of the
> variable early and is very prone to "race" conditions. The above is
> safe but see below.
>
> FWIW the original code tried to switch off the value of the
> PACKAGE_ARCH variable. If we change the way we enable/disable the code,
> we should consider whether we can consistently use one mechanism for
> both.
>
> Secondly, does this change affect the behaviour of nativesdk?
>
> I think this will disable allarch for nativesdk in any multilib build
> and we don't want to do that, we only have a problem with target
> multilib allarch.

I searched oe-core for which inherits allarch and bbextend nativesdk by:

$ rgrep 'inherit.*allarch' -l meta | xargs grep -l 
'BBCLASSEXTEND.*nativesdk'
meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
meta/recipes-core/update-rc.d/update-rc.d_0.8.bb

And I checked one of them:

$ bitbake -e nativesdk-autoconf-archive > be.nativesdk-autoconf-archive

The var PACKAGE_ARCH will be set with value from nativesdk.bbclass and 
overwrite the value from allarch.bbclass:

# $PACKAGE_ARCH [4 operations]
#   set /buildarea/kkang/yocto/poky/meta/conf/bitbake.conf:150
#     [_defaultval] "${TUNE_PKGARCH}"
#   set /buildarea/kkang/yocto/poky/meta/conf/documentation.conf:304
#     [doc] "The architecture of the resulting package or packages."
#   set /buildarea/kkang/yocto/poky/meta/classes/allarch.bbclass:5
# "all"
#   set /buildarea/kkang/yocto/poky/meta/classes/nativesdk.bbclass:18
# "${SDK_ARCH}-${SDKPKGSUFFIX}"
# pre-expansion value:
# "${SDK_ARCH}-${SDKPKGSUFFIX}"
PACKAGE_ARCH="x86_64-nativesdk"

It seems update of allarch.bbclass doesn't affect nativesdk. Or did I 
miss something? Thanks.

--Kai

>
> At a guess you probably need to check class-target is in overrides and
> multilib_variants is set? The problem could be that class-target is set
> comparatively late and then we're into ordering issues.
>
> I do want to get the nativesdk issue fixed before we merge this though.
>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


