Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B1C1D6FFED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2A09Xsu031722; Thu, 10 Mar 2016 00:09:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j-cCfPWEvz7b; Thu, 10 Mar 2016 00:09:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2A09Ua7031718
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Mar 2016 00:09:31 GMT
Message-ID: <1457568570.2804.206.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 Mar 2016 00:09:30 +0000
In-Reply-To: <20160309235207.GO2542@jama>
References: <18448427.V3ACvxT67R@rjs-zotac.streifs.net>
	<CAJTo0La2CZAKw0Cd4_NpPLt=qXy3x3Arv36huhUMmCH3tV14YA@mail.gmail.com>
	<20160309225058.GM2542@jama>
	<1457564551.2804.199.camel@linuxfoundation.org>
	<20160309235207.GO2542@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Peter A. Bigot" <pab@pabigot.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org,
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
X-List-Received-Date: Thu, 10 Mar 2016 00:09:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-10 at 00:52 +0100, Martin Jansa wrote:
> On Wed, Mar 09, 2016 at 11:02:31PM +0000, Richard Purdie wrote:
> > On Wed, 2016-03-09 at 23:50 +0100, Martin Jansa wrote:
> > > What's even more interesting is that even gcc-cross-initial has
> > > different signatures for 2 ARM MACHINEs with different
> > > DEFAULTTUNES
> > > 
> > > OE qemuarm7@ ~/build/oe-core $ grep ^DEFAULTTUNE= env.gdb-cross
> > > -arm*
> > > env.gdb-cross-arm:DEFAULTTUNE="armv5te"
> > > env.gdb-cross-arm7:DEFAULTTUNE="armv7a-neon"
> > > 
> > > OE qemuarm7@ ~/build/oe-core $ ls tmp-glibc/sstate
> > > -diff/1457556601/*/*/*gcc-cross-initial*/*do_configure*
> > > tmp-glibc/sstate-diff/1457556601/qemuarm/x86_64-linux/gcc-cross
> > > -initial-arm/5.3.0
> > > -r0.do_configure.sigdata.e54e7a04acf1029cc37463114c7e4dba
> > > tmp-glibc/sstate-diff/1457556601/qemuarm7/x86_64-linux/gcc-cross
> > > -initial-arm/5.3.0
> > > -r0.do_configure.sigdata.3496e3dde08a49b14462741cc6f8d239
> > > OE qemuarm7@ ~/build/oe-core $ bitbake-diffsigs tmp-glibc/sstate
> > > -diff/1457556601/*/*/*gcc-cross-initial*/*do_configure*
> > > basehash changed from 5848199c69eee0db746de21c5458c13d to
> > > 673cd8d19bc4cbea132900a670593df6
> > > Variable EXTRA_OECONF value changed from '--with-newlib --without
> > > -headers --disable-shared --disable-threads --disable-multilib -
> > > -disable-__cxa_atexit --enable-languages=c --program
> > > -prefix=${TARGET_PREFIX} --with-sysroot=/not/exist --with-build
> > > -sysroot=${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECONF_INITIAL} 
> > > ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with
> > > -ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}
> > > ${EXTRA_OECONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} -
> > > -with
> > > -native-system-header-dir=${SYSTEMHEADERS}${DISABLE_STATIC} 
> > > ${@gettext_oeconf(d)}
> > > DISTRO_FEATURES{ld-is-gold} = Unset' to '--with-newlib --without
> > > -headers --disable-shared --disable-threads --disable-multilib -
> > > -disable-__cxa_atexit --enable-languages=c --program
> > > -prefix=${TARGET_PREFIX} --with-sysroot=/not/exist --with-build
> > > -sysroot=${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECONF_INITIAL} 
> > > ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with
> > > -ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}
> > > ${EXTRA_OECONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} -
> > > -with
> > > -native-system-header-dir=${SYSTEMHEADERS}${DISABLE_STATIC} 
> > > ${@gettext_oeconf(d)} --with-arch=armv7-a
> > > DISTRO_FEATURES{ld-is-gold} = Unset'
> > 
> > To answer my own question, it looks like:
> > 
> > gcc-configure-common.inc:EXTRA_OECONF_append_armv6 = " --with
> > -arch=armv6"
> > gcc-configure-common.inc:EXTRA_OECONF_append_armv7a = " --with
> > -arch=armv7-a"
> > gcc-configure-common.inc:EXTRA_OECONF_append_armv7ve = " --with
> > -arch=armv7-a"
> > 
> > which effectively comes from:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/recipes-devto
> > ols/gcc/gcc-configure
> > -common.inc?id=c0a071e16ec04f485f06eece5b807e5afbe1c1f1
> > 
> > The concept of having one gcc for each arch precludes such changes
> > :(.
> > 
> > I believe these overrides need to move to the gcc-target.inc file.
> 
> Reverting this change in Dizzy based build fixes the signatures for
> gcc-cross(-initial)-arm
> 
> for gdb-cross-arm, there is still datadir -> TUNE_PKGARCH dependency
> from even
> older change:
> 
> OE qemuarm7@ ~/build/oe-core/openembedded-core $ git show -1 3e87aba1
> commit 3e87aba1ee2ca0e39ba66fb7cba52e48df499c23
> Author: Phil Blundell <pb@pbcl.net>
> Date:   Wed Apr 24 16:15:54 2013 +0100
> 
>     gdb-cross: Adjust ${datadir} to avoid file conflicts in sysroot
>     
> 
> +datadir .= "/gdb-${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
> 
> Reverting this change fixes gdb-cross-arm signatures.
> 
> Will try what happens when I revert this in master and move --with
> -arch
> options to gcc-target.inc only.

I have an untested patch for the latter:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip
&id=3b30d958abff7ab913ed9d4852dfd44a57e84eb1

(just not gotten to it yet).

We do have a bigger problem in that I think if you switch tunes between
things which change TARGET_OS (e.g. an x86 x32 build, mips n32 or ppc
spe) we'll have the same issue. To fix that we'll likely need the
target OS mangling that cross-canadian does and that is going to be
pretty invasive to implement.

The good news is that sstate will remove/install the correct gcc-cross
quite happily so whilst annoying, builds don't break.

The ppc spe v1 issue is more pressing since python3 is breaking on the
autobuilder due to that :(

Cheers,

Richard

