Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0A584737F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 22:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t67MEmme002574; Tue, 7 Jul 2015 23:14:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NgbrGioXC_KU; Tue,  7 Jul 2015 23:14:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t67MEYkV002569
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Jul 2015 23:14:45 +0100
Message-ID: <1436307274.27597.197.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 07 Jul 2015 23:14:34 +0100
In-Reply-To: <b43e9f344635ef03616702689d946a769132e171.1436253346.git.liezhi.yang@windriver.com>
References: <cover.1436253346.git.liezhi.yang@windriver.com>
	<b43e9f344635ef03616702689d946a769132e171.1436253346.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 07 Jul 2015 22:14:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-07 at 00:17 -0700, Robert Yang wrote:
> Fixed when enable multilib:
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> $ bitbake core-image-minimal
> 
> No lib32 package should be built since we don't build
> lib32-core-image-minimal, but a lot them are built:
> lib32-opkg-utils
> lib32-cryptodev-linux
> lib32-sqlite3
> lib32-libtool-cross
> lib32-ncurses
> lib32-db
> lib32-diffutils
> lib32-zlib
> lib32-gcc-cross-i686
> lib32-gcc-cross-initial-i686
> lib32-flex
> lib32-libgcc-initial
> lib32-libffi
> lib32-linux-libc-headers
> lib32-expat
> lib32-openssl
> lib32-glibc
> lib32-binutils-cross-i686
> lib32-gcc-runtime
> 
> This is because MULTILIB_VARIANTS is always avaliable when multlib is
> enabled, use MLPREFIX to fix the problem so that lib32/lib64 packages will
> only be built when build lib32/lib64-core-image-minimal.
> 
> [YOCTO #7961]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/toolchain-scripts.bbclass |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 9378918..d05a5a3 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -144,8 +144,9 @@ python __anonymous () {
>      deps = ""
>      for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
>          deps += " %s:do_populate_sysroot" % dep
> -        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
> -            clsextend = oe.classextend.ClassExtender(variant, d)
> +        mlprefix = d.getVar('MLPREFIX', True)
> +        if mlprefix:
> +            clsextend = oe.classextend.ClassExtender(mlprefix[:-1], d)
>              newdep = clsextend.extend_name(dep)
>              deps += " %s:do_populate_sysroot" % newdep
>      d.appendVarFlag('do_configure', 'depends', deps)

I'm starting to get mildly annoyed with this. Back in 2014 it was
insisted the correct behaviour here was that the cache artefacts for
*all* multilibs shoul be pulled into the SDK. This was done with:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=bb213d8e60746d61d80505487d5f14a4eb45231b

where the code quite clearly iterates MULTILIB_VARIANTS for this reason.
We've therefore gone to some lengths to preserve that.

So which is this code supposed to do? I don't honestly know any more. I
do agree its extremely annoying that the images trigger the multilib
builds though and I think we need to fix that. This class is used from:

populate_sdk_base
meta-ide-support
meta-environment

so perhaps the best way to do this is have a function like:

def toolchain_get_depends(d):
    import oe.classextend
    deps = ""
    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
        deps += " %s:do_populate_sysroot" % dep
        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
            clsextend = oe.classextend.ClassExtender(variant, d)
            newdep = clsextend.extend_name(dep)
            deps += " %s:do_populate_sysroot" % newdep
    return deps

then meta-ide-support can do:

do_populate_ide_support[depends] += "${@toolchain_get_depends(d)}"

meta-environment can do:

do_generate_content[depends] += "${@toolchain_get_depends(d)}"

and I can't actually see why populate_sdk_base needs the
toolchain-scripts class at all. Perhaps someone can spot why it needs
the inherit or the dependency?

Cheers,

Richard



