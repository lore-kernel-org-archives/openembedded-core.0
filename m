Return-Path: <pab@pabigot.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Mar 2016 10:41:34 UTC
Received: from p3plsmtpa07-06.prod.phx3.secureserver.net
	(p3plsmtpa07-06.prod.phx3.secureserver.net [173.201.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 201996612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:41:34 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-06.prod.phx3.secureserver.net with 
	id UAaQ1s00W0BVjqb01AaRde; Thu, 10 Mar 2016 03:34:26 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>, openembedded-core@lists.openembedded.org
References: <18448427.V3ACvxT67R@rjs-zotac.streifs.net>
	<CAJTo0La2CZAKw0Cd4_NpPLt=qXy3x3Arv36huhUMmCH3tV14YA@mail.gmail.com>
	<20160309225058.GM2542@jama>
	<1457564551.2804.199.camel@linuxfoundation.org>
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
Message-ID: <56E14DB0.7040500@pabigot.com>
Date: Thu, 10 Mar 2016 04:34:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457564551.2804.199.camel@linuxfoundation.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Rudolf J Streif <rudolf.streif@gmail.com>
Subject: Re: Wrong sstate signatures for cross toolchain Was: [yocto] Building gdb-7.10 for arm with master
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
X-List-Received-Date: Thu, 10 Mar 2016 10:41:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2016 05:02 PM, Richard Purdie wrote:
> On Wed, 2016-03-09 at 23:50 +0100, Martin Jansa wrote:
>> What's even more interesting is that even gcc-cross-initial has
>> different signatures for 2 ARM MACHINEs with different DEFAULTTUNES
>>
>> OE qemuarm7@ ~/build/oe-core $ grep ^DEFAULTTUNE= env.gdb-cross-arm*
>> env.gdb-cross-arm:DEFAULTTUNE="armv5te"
>> env.gdb-cross-arm7:DEFAULTTUNE="armv7a-neon"
>>
>> OE qemuarm7@ ~/build/oe-core $ ls tmp-glibc/sstate
>> -diff/1457556601/*/*/*gcc-cross-initial*/*do_configure*
>> tmp-glibc/sstate-diff/1457556601/qemuarm/x86_64-linux/gcc-cross
>> -initial-arm/5.3.0
>> -r0.do_configure.sigdata.e54e7a04acf1029cc37463114c7e4dba
>> tmp-glibc/sstate-diff/1457556601/qemuarm7/x86_64-linux/gcc-cross
>> -initial-arm/5.3.0
>> -r0.do_configure.sigdata.3496e3dde08a49b14462741cc6f8d239
>> OE qemuarm7@ ~/build/oe-core $ bitbake-diffsigs tmp-glibc/sstate
>> -diff/1457556601/*/*/*gcc-cross-initial*/*do_configure*
>> basehash changed from 5848199c69eee0db746de21c5458c13d to
>> 673cd8d19bc4cbea132900a670593df6
>> Variable EXTRA_OECONF value changed from '--with-newlib --without
>> -headers --disable-shared --disable-threads --disable-multilib -
>> -disable-__cxa_atexit --enable-languages=c --program
>> -prefix=${TARGET_PREFIX} --with-sysroot=/not/exist --with-build
>> -sysroot=${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECONF_INITIAL}
>> ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with
>> -ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}
>> ${EXTRA_OECONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} --with
>> -native-system-header-dir=${SYSTEMHEADERS}${DISABLE_STATIC}
>> ${@gettext_oeconf(d)}
>> DISTRO_FEATURES{ld-is-gold} = Unset' to '--with-newlib --without
>> -headers --disable-shared --disable-threads --disable-multilib -
>> -disable-__cxa_atexit --enable-languages=c --program
>> -prefix=${TARGET_PREFIX} --with-sysroot=/not/exist --with-build
>> -sysroot=${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECONF_INITIAL}
>> ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with
>> -ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}
>> ${EXTRA_OECONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} --with
>> -native-system-header-dir=${SYSTEMHEADERS}${DISABLE_STATIC}
>> ${@gettext_oeconf(d)} --with-arch=armv7-a
>> DISTRO_FEATURES{ld-is-gold} = Unset'
> To answer my own question, it looks like:
>
> gcc-configure-common.inc:EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
> gcc-configure-common.inc:EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
> gcc-configure-common.inc:EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
>
> which effectively comes from:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=c0a071e16ec04f485f06eece5b807e5afbe1c1f1
>
> The concept of having one gcc for each arch precludes such changes :(.

Yes.  Fundamentally the Yocto concept of arch appears to be inconsistent 
with gcc's concept in that the defaults for Yocto don't match the 
defaults for gcc on the same platform.  At the time I submitted that 
patch reworking how the toolchain is built wasn't feasible.

I'm not working with Yocto at this time so can't contribute to the 
solution, however if/when I get the opportunity I can help verify that 
the bug the patch fixed hasn't been re-introduced.

Peter
> I believe these overrides need to move to the gcc-target.inc file.
>
> Cheers,
>
> Richard
>


