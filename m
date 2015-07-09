Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB436017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 08:37:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t698bmCb022913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jul 2015 01:37:48 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Jul 2015 01:37:48 -0700
Message-ID: <559E32DA.7090300@windriver.com>
Date: Thu, 9 Jul 2015 16:37:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1436253346.git.liezhi.yang@windriver.com>	
	<b43e9f344635ef03616702689d946a769132e171.1436253346.git.liezhi.yang@windriver.com>
	<1436307274.27597.197.camel@linuxfoundation.org>
In-Reply-To: <1436307274.27597.197.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] toolchain-scripts.bbclass: use MLPREFIX to instead of MULTILIB_VARIANTS
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
X-List-Received-Date: Thu, 09 Jul 2015 08:37:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2015 06:14 AM, Richard Purdie wrote:
> On Tue, 2015-07-07 at 00:17 -0700, Robert Yang wrote:
>> Fixed when enable multilib:
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> $ bitbake core-image-minimal
>>
>> No lib32 package should be built since we don't build
>> lib32-core-image-minimal, but a lot them are built:
>> lib32-opkg-utils
>> lib32-cryptodev-linux
>> lib32-sqlite3
>> lib32-libtool-cross
>> lib32-ncurses
>> lib32-db
>> lib32-diffutils
>> lib32-zlib
>> lib32-gcc-cross-i686
>> lib32-gcc-cross-initial-i686
>> lib32-flex
>> lib32-libgcc-initial
>> lib32-libffi
>> lib32-linux-libc-headers
>> lib32-expat
>> lib32-openssl
>> lib32-glibc
>> lib32-binutils-cross-i686
>> lib32-gcc-runtime
>>
>> This is because MULTILIB_VARIANTS is always avaliable when multlib is
>> enabled, use MLPREFIX to fix the problem so that lib32/lib64 packages will
>> only be built when build lib32/lib64-core-image-minimal.
>>
>> [YOCTO #7961]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/toolchain-scripts.bbclass |    5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
>> index 9378918..d05a5a3 100644
>> --- a/meta/classes/toolchain-scripts.bbclass
>> +++ b/meta/classes/toolchain-scripts.bbclass
>> @@ -144,8 +144,9 @@ python __anonymous () {
>>       deps = ""
>>       for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
>>           deps += " %s:do_populate_sysroot" % dep
>> -        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
>> -            clsextend = oe.classextend.ClassExtender(variant, d)
>> +        mlprefix = d.getVar('MLPREFIX', True)
>> +        if mlprefix:
>> +            clsextend = oe.classextend.ClassExtender(mlprefix[:-1], d)
>>               newdep = clsextend.extend_name(dep)
>>               deps += " %s:do_populate_sysroot" % newdep
>>       d.appendVarFlag('do_configure', 'depends', deps)
>
> I'm starting to get mildly annoyed with this. Back in 2014 it was
> insisted the correct behaviour here was that the cache artefacts for
> *all* multilibs shoul be pulled into the SDK. This was done with:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=bb213d8e60746d61d80505487d5f14a4eb45231b
>
> where the code quite clearly iterates MULTILIB_VARIANTS for this reason.
> We've therefore gone to some lengths to preserve that.
>
> So which is this code supposed to do? I don't honestly know any more. I
> do agree its extremely annoying that the images trigger the multilib
> builds though and I think we need to fix that. This class is used from:
>
> populate_sdk_base
> meta-ide-support
> meta-environment
>
> so perhaps the best way to do this is have a function like:
>
> def toolchain_get_depends(d):
>      import oe.classextend
>      deps = ""
>      for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
>          deps += " %s:do_populate_sysroot" % dep
>          for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
>              clsextend = oe.classextend.ClassExtender(variant, d)
>              newdep = clsextend.extend_name(dep)
>              deps += " %s:do_populate_sysroot" % newdep
>      return deps
>
> then meta-ide-support can do:
>
> do_populate_ide_support[depends] += "${@toolchain_get_depends(d)}"
>
> meta-environment can do:
>
> do_generate_content[depends] += "${@toolchain_get_depends(d)}"
>
> and I can't actually see why populate_sdk_base needs the
> toolchain-scripts class at all. Perhaps someone can spot why it needs
> the inherit or the dependency?

Hi RP,

Thanks, after more investigation, I think that populate_sdk_base doesn't need
inherit toolchain-scripts, and once we remove it from populate_sdk_base.bbclass,
things work well, which means that when "bitbake core-image-minimal", no
lib32 recipes build, and when "bitbake lib32-core-image-minimal", the required
lib32 recipes will be built and installed to sdk.

We can drop this patch, and I will send a new patch to fix the problem.

// Robert

>
> Cheers,
>
> Richard
>
>
>
>

