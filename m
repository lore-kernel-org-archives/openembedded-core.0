Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B89C71A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 02:27:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8H2RPkq015807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Sep 2018 19:27:25 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 16 Sep 2018 19:27:24 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
	<20180913182007.GA1437@jama> <20180913201046.GB1437@jama>
	<20180914112512.GA1369@jama> <20180914141236.GD1369@jama>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <dabc02da-9972-8e06-6624-a567f8aefe48@windriver.com>
Date: Mon, 17 Sep 2018 10:25:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180914141236.GD1369@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: only enable allarch when multilib is not used
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
X-List-Received-Date: Mon, 17 Sep 2018 02:27:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月14日 22:12, Martin Jansa wrote:
> On Fri, Sep 14, 2018 at 01:25:12PM +0200, Martin Jansa wrote:
>> On Thu, Sep 13, 2018 at 10:10:46PM +0200, Martin Jansa wrote:
>>> On Thu, Sep 13, 2018 at 08:20:07PM +0200, Martin Jansa wrote:
>>>> On Thu, Sep 06, 2018 at 11:52:24PM +0800, kai.kang@windriver.com wrote:
>>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>>
>>>>> Some allarch packages rdepends non-allarch packages. when multilib is
>>>>> used, it doesn't expand the dependency chain correctly, e.g.
>>>>>
>>>>> core-image-sato -> ca-certificates(allarch) -> openssl
>>>>>
>>>>> we expect dependency chain for lib32-core-image-sato:
>>>>>
>>>>> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
>>>>>
>>>>> it should install lib32-openssl for ca-certificates but openssl is still
>>>>> wrongly required.
>>>>>
>>>>> Only enable allarch when multilib is not used to fix the issue.
>>>>>
>>>>> signed-off-by: kai kang <kai.kang@windriver.com>
>>>>> ---
>>>>>   meta/classes/allarch.bbclass         | 12 +++++++++++-
>>>>>   meta/classes/icecc.bbclass           |  2 +-
>>>>>   meta/classes/multilib.bbclass        |  3 ++-
>>>>>   meta/classes/multilib_global.bbclass |  4 +---
>>>>>   meta/classes/package.bbclass         |  9 ++++++---
>>>>>   5 files changed, 21 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
>>>>> index 1eebe0bf2e..45f62a5939 100644
>>>>> --- a/meta/classes/allarch.bbclass
>>>>> +++ b/meta/classes/allarch.bbclass
>>>>> @@ -2,7 +2,17 @@
>>>>>   # This class is used for architecture independent recipes/data files (usually scripts)
>>>>>   #
>>>>>   
>>>>> -PACKAGE_ARCH = "all"
>>>>> +python allarch_package_arch_handler () {
>>>>> +    if bb.data.inherits_class("nativesdk", d) or bb.data.inherits_class("crosssdk", d):
>>>>> +        return
>>>>> +
>>>>> +    variants = d.getVar("MULTILIB_VARIANTS")
>>>>> +    if not variants:
>>>>> +        d.setVar("PACKAGE_ARCH", "all" )
>>>>> +}
>>>>> +
>>>>> +addhandler allarch_package_arch_handler
>>>>> +allarch_package_arch_handler[eventmask] = "bb.event.RecipePreFinalise"
>>>> Maybe I'm overlooking something, but doesn't this overwrite whatever
>>>> PACKAGE_ARCH as set before this?
>>>>
>>>> I have some recipes where the PACKAGE_ARCH is set to MACHINE_ARCH through
>>>> another bbclass, but then overwritten with "all" by allarch_package_arch_handler:
>>>>
>>>> # $PACKAGE_ARCH [5 operations]
>>>> #   set oe-core/meta/conf/bitbake.conf:150
>>>> #     [_defaultval] "${TUNE_PKGARCH}"
>>>> #   set meta-lg-webos/meta-webos/conf/distro/include/webos.inc:241
>>>> #     "${MACHINE_ARCH}"
>>>> #   set oe-core/meta/conf/documentation.conf:304
>>>> #     [doc] "The architecture of the resulting package or packages."
>>>> #   set meta-lg-webos/meta-webos/classes/webos_machine_impl_dep.bbclass:11
>>>> #     "${MACHINE_ARCH}"
>>>> #   set allarch.bbclass:12 [allarch_package_arch_handler]
>>>> #     "all"
>>>> # pre-expansion value:
>>>> #   "all"
>>>> PACKAGE_ARCH="all"
>>>>
>>>> But surprisingly if I do the same with e.g. packagegroup-core-boot in oe-core I get:
>>>>
>>>> # $PACKAGE_ARCH [4 operations]
>>>> #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:150
>>>> #     [_defaultval] "${TUNE_PKGARCH}"
>>>> #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:304
>>>> #     [doc] "The architecture of the resulting package or packages."
>>>> #   set /OE/build/oe-core/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-boot.bb:9
>>>> #     "${MACHINE_ARCH}"
>>>> #   set? /OE/build/oe-core/openembedded-core/meta/classes/packagegroup.bbclass:12
>>>> #     "all"
>>>> # pre-expansion value:
>>>> #   "${MACHINE_ARCH}"
>>>> PACKAGE_ARCH="qemux86_64"
>>>>
>>>> Why isn't allarch_package_arch_handler executed in the 2nd case?
>>> Now I see the difference, I was still living in the days when
>>> "disabling" allarch was possible just by setting PACKAGE_ARCH before
>>> inheritting allarch, but now I see that packagegroups do conditional
>>> inherit as well since:
>>> http://git.openembedded.org/openembedded-core/commit/?id=9c826962ec8fa45c2b035427442b90a41517144e
>>> http://git.openembedded.org/openembedded-core/commit/?id=2c9b1d304daade7b0907320aeb9c522e7ab9dcab
>>> so I'll modify currently failing recipes to do the same and stop
>>> inheritting allarch when PACKAGE_ARCH is set to something else.
>>  From public layers I've found with test-signatures script only
>> fbset-nodes recipe in meta-oe which was setting PACKAGE_ARCH after
>> allarch inherit, allarch removal sent here:
>> http://lists.openembedded.org/pipermail/openembedded-devel/2018-September/120560.html
> target-sdk-provides-dummy seems to be affected as well:
>   === Comparing signatures for task do_populate_sysroot.sigdata between qemux86 and qemux86copy ===
> ERROR: lib32-target-sdk-provides-dummy different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
> basehash changed from b0a44b2c7003b6b4aa3a023d9cb9fe82 to 3a59fa25ddb6a95aff079d477ebf3457
> Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'
>
> ERROR: target-sdk-provides-dummy different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
> basehash changed from 9e44f1deb3d15886ee96db1a3332764c to 6b417d08a5113c9b06d13b3681f5ab4f
> Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'
>
>
> It's using:
> inherit allarch
>
> python() {
>      # Put the package somewhere separate to ensure it's never used except
>      # when we want it
>      # (note that we have to do this in anonymous python here to avoid
>      # allarch.bbclass disabling itself)
>      d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
> }
>
> and DUMMYARCH = "sdk-provides-dummy-target"
>
> The difference as shown with bitbake -e before and after reverting this commit:
>
> before revert:
> # $SSTATE_MANMACH [2 operations]
> #   set? oe-core/meta/classes/sstate.bbclass:61
> #     "${SSTATE_PKGARCH}"
> #   set sstate.bbclass:100 [__anon_111_oe_core_meta_classes_sstate_bbclass]
> #     "machineName"
> # pre-expansion value:
> #   "machineName"
> SSTATE_MANMACH="machineName"
>
> # $SSTATE_PKGARCH
> #   set oe-core/meta/classes/sstate.bbclass:11
> #     "${PACKAGE_ARCH}"
> SSTATE_PKGARCH="sdk-provides-dummy-target"
>
> # $PACKAGE_ARCH [3 operations]
> #   set oe-core/meta/conf/bitbake.conf:150
> #     [_defaultval] "${TUNE_PKGARCH}"
> #   set oe-core/meta/conf/documentation.conf:304
> #     [doc] "The architecture of the resulting package or packages."
> #   set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_meta_dummy_sdk_package_inc]
> #     "${DUMMYARCH}"
> # pre-expansion value:
> #   "${DUMMYARCH}"
> PACKAGE_ARCH="sdk-provides-dummy-target"
>
> after revert:
> # $SSTATE_MANMACH
> #   set? oe-core/meta/classes/sstate.bbclass:61
> #     "${SSTATE_PKGARCH}"
> SSTATE_MANMACH="allarch"
>
> # $SSTATE_PKGARCH [2 operations]
> #   set oe-core/meta/classes/sstate.bbclass:11
> #     "${PACKAGE_ARCH}"
> #   set sstate.bbclass:98 [__anon_111__oe_core_meta_classes_sstate_bbclass]
> #     "allarch"
> # pre-expansion value:
> #   "allarch"
> SSTATE_PKGARCH="allarch"
>
> # $PACKAGE_ARCH [4 operations]
> #   set oe-core/meta/conf/bitbake.conf:150
> #     [_defaultval] "${TUNE_PKGARCH}"
> #   set oe-core/meta/conf/documentation.conf:304
> #     [doc] "The architecture of the resulting package or packages."
> #   set oe-core/meta/classes/allarch.bbclass:5
> #     "all"
> #   set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_meta_dummy_sdk_package_inc]
> #     "${DUMMYARCH}"
> # pre-expansion value:
> #   "${DUMMYARCH}"
> PACKAGE_ARCH="sdk-provides-dummy-target"
>
>
> the relevant part of the anonymous python in sstate.bbclass:
>
>      elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH") == "all":
>          d.setVar('SSTATE_PKGARCH', "allarch")
>      else:
>          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
>
> So with your change, the PACKAGE_ARCH isn't set to "all" because multilib is enabled,
> but that causes sstate.bbclass to set SSTATE_MANMACH to MACHINE instead of SSTATE_PKGARCH
> allarch, where it got MACHINE is still a bit of mystery to me.

The original story is that multilib packages such as lib32-curl depends 
on non-multilib package openssl that allarch package ca-certificates
is in the dependency chain:

lib32-curl -> ca-certificates -> openssl

I sent some versions of commits to Richard but he thought these 
solutions affect current non-multilib build too much. And Richard proposed
this solution which not affect current non-multilib build. When multilib 
is enabled/used, allarch packages are eliminated and treated as common
packages. The vars SSTATE_*  are set as the same as normal packages such 
as zlib.

Package target-sdk-provides-dummy is a little special that it sets its 
PACKAGE_ARCH in its own recipe. And affects vars which depends on 
PACKAGE_ARCH.

Regards,
Kai

>
> Cheers,
>
>>> Cheers,
>>>
>>>>>   python () {
>>>>>       # Allow this class to be included but overridden - only set
>>>>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
>>>>> index 0ca8de86c2..b5a8457747 100644
>>>>> --- a/meta/classes/icecc.bbclass
>>>>> +++ b/meta/classes/icecc.bbclass
>>>>> @@ -171,7 +171,7 @@ def use_icecc(bb,d):
>>>>>       return "yes"
>>>>>   
>>>>>   def icecc_is_allarch(bb, d):
>>>>> -    return d.getVar("PACKAGE_ARCH") == "all" or bb.data.inherits_class('allarch', d)
>>>>> +    return d.getVar("PACKAGE_ARCH") == "all"
>>>>>   
>>>>>   def icecc_is_kernel(bb, d):
>>>>>       return \
>>>>> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
>>>>> index f2ac8bdfef..7b4d6472b0 100644
>>>>> --- a/meta/classes/multilib.bbclass
>>>>> +++ b/meta/classes/multilib.bbclass
>>>>> @@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
>>>>>       if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
>>>>>           raise bb.parse.SkipRecipe("We can't extend nativesdk recipes")
>>>>>   
>>>>> -    if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
>>>>> +    if bb.data.inherits_class('allarch', e.data) and not d.getVar('MULTILIB_VARIANTS') \
>>>>> +        and not bb.data.inherits_class('packagegroup', e.data):
>>>>>           raise bb.parse.SkipRecipe("Don't extend allarch recipes which are not packagegroups")
>>>>>   
>>>>>       # Expand this since this won't work correctly once we set a multilib into place
>>>>> diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
>>>>> index d2ec1adfea..1bb62427b0 100644
>>>>> --- a/meta/classes/multilib_global.bbclass
>>>>> +++ b/meta/classes/multilib_global.bbclass
>>>>> @@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
>>>>>           return
>>>>>   
>>>>>       if bb.data.inherits_class('kernel', e.data) or \
>>>>> -            bb.data.inherits_class('module-base', e.data) or \
>>>>> -            (bb.data.inherits_class('allarch', e.data) and\
>>>>> -             not bb.data.inherits_class('packagegroup', e.data)):
>>>>> +            bb.data.inherits_class('module-base', e.data):
>>>>>               variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
>>>>>   
>>>>>               import oe.classextend
>>>>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>>>>> index 0b6f65a855..d1e9138c66 100644
>>>>> --- a/meta/classes/package.bbclass
>>>>> +++ b/meta/classes/package.bbclass
>>>>> @@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
>>>>>   
>>>>>       if key in data:
>>>>>           # Have to avoid undoing the write_extra_pkgs(global_variants...)
>>>>> -        if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
>>>>> +        if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
>>>>> +            and data[key] == basepkg:
>>>>>               return pkg
>>>>>           return data[key]
>>>>>   
>>>>> @@ -1413,7 +1414,8 @@ fi
>>>>>       if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
>>>>>           write_extra_pkgs(variants, pn, packages, pkgdatadir)
>>>>>   
>>>>> -    if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d)):
>>>>> +    if bb.data.inherits_class('allarch', d) and not variants \
>>>>> +        and not bb.data.inherits_class('packagegroup', d):
>>>>>           write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
>>>>>   
>>>>>       workdir = d.getVar('WORKDIR')
>>>>> @@ -1502,7 +1504,8 @@ fi
>>>>>       if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
>>>>>           write_extra_runtime_pkgs(variants, packages, pkgdatadir)
>>>>>   
>>>>> -    if bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d):
>>>>> +    if bb.data.inherits_class('allarch', d) and not variants \
>>>>> +        and not bb.data.inherits_class('packagegroup', d):
>>>>>           write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
>>>>>   
>>>>>   }
>>>>> -- 
>>>>> 2.18.0
>>>>>
>>>>> -- 
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>> -- 
>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>>>
>>> -- 
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>>
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>

-- 
Regards,
Neil | Kai Kang


