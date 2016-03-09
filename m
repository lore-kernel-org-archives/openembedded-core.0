Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B68B37317E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 23:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29N2anQ026871; Wed, 9 Mar 2016 23:02:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id izdMPGwsZxd4; Wed,  9 Mar 2016 23:02:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29N2VDr026867
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 9 Mar 2016 23:02:32 GMT
Message-ID: <1457564551.2804.199.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 09 Mar 2016 23:02:31 +0000
In-Reply-To: <20160309225058.GM2542@jama>
References: <18448427.V3ACvxT67R@rjs-zotac.streifs.net>
	<CAJTo0La2CZAKw0Cd4_NpPLt=qXy3x3Arv36huhUMmCH3tV14YA@mail.gmail.com>
	<20160309225058.GM2542@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Rudolf J Streif <rudolf.streif@gmail.com>,
	"Peter A. Bigot" <pab@pabigot.com>
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
X-List-Received-Date: Wed, 09 Mar 2016 23:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-09 at 23:50 +0100, Martin Jansa wrote:
> What's even more interesting is that even gcc-cross-initial has
> different signatures for 2 ARM MACHINEs with different DEFAULTTUNES
> 
> OE qemuarm7@ ~/build/oe-core $ grep ^DEFAULTTUNE= env.gdb-cross-arm*
> env.gdb-cross-arm:DEFAULTTUNE="armv5te"
> env.gdb-cross-arm7:DEFAULTTUNE="armv7a-neon"
> 
> OE qemuarm7@ ~/build/oe-core $ ls tmp-glibc/sstate
> -diff/1457556601/*/*/*gcc-cross-initial*/*do_configure*
> tmp-glibc/sstate-diff/1457556601/qemuarm/x86_64-linux/gcc-cross
> -initial-arm/5.3.0
> -r0.do_configure.sigdata.e54e7a04acf1029cc37463114c7e4dba
> tmp-glibc/sstate-diff/1457556601/qemuarm7/x86_64-linux/gcc-cross
> -initial-arm/5.3.0
> -r0.do_configure.sigdata.3496e3dde08a49b14462741cc6f8d239
> OE qemuarm7@ ~/build/oe-core $ bitbake-diffsigs tmp-glibc/sstate
> -diff/1457556601/*/*/*gcc-cross-initial*/*do_configure*
> basehash changed from 5848199c69eee0db746de21c5458c13d to
> 673cd8d19bc4cbea132900a670593df6
> Variable EXTRA_OECONF value changed from '--with-newlib --without
> -headers --disable-shared --disable-threads --disable-multilib -
> -disable-__cxa_atexit --enable-languages=c --program
> -prefix=${TARGET_PREFIX} --with-sysroot=/not/exist --with-build
> -sysroot=${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECONF_INITIAL} 
> ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with
> -ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}
> ${EXTRA_OECONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} --with
> -native-system-header-dir=${SYSTEMHEADERS}${DISABLE_STATIC} 
> ${@gettext_oeconf(d)}
> DISTRO_FEATURES{ld-is-gold} = Unset' to '--with-newlib --without
> -headers --disable-shared --disable-threads --disable-multilib -
> -disable-__cxa_atexit --enable-languages=c --program
> -prefix=${TARGET_PREFIX} --with-sysroot=/not/exist --with-build
> -sysroot=${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECONF_INITIAL} 
> ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with
> -ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}
> ${EXTRA_OECONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} --with
> -native-system-header-dir=${SYSTEMHEADERS}${DISABLE_STATIC} 
> ${@gettext_oeconf(d)} --with-arch=armv7-a
> DISTRO_FEATURES{ld-is-gold} = Unset'

To answer my own question, it looks like:

gcc-configure-common.inc:EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
gcc-configure-common.inc:EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
gcc-configure-common.inc:EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"

which effectively comes from:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=c0a071e16ec04f485f06eece5b807e5afbe1c1f1

The concept of having one gcc for each arch precludes such changes :(.

I believe these overrides need to move to the gcc-target.inc file.

Cheers,

Richard


