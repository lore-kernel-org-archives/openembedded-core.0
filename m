Return-Path: <richard.purdie@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6264B605FF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 22:26:22 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2017 14:26:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,183,1484035200"; d="scan'208";a="67757272"
Received: from praffert-mobl1.ger.corp.intel.com (HELO hex) ([10.252.0.206])
	by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2017 14:26:20 -0800
Message-ID: <1487543179.17001.15.camel@intel.com>
From: Richard Purdie <richard.purdie@intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Sun, 19 Feb 2017 14:26:19 -0800
In-Reply-To: <1487067990.13854.328.camel@intel.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
	<1487005422.13854.247.camel@intel.com>
	<1487067990.13854.328.camel@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Sun, 19 Feb 2017 22:26:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-02-14 at 11:26 +0100, Patrick Ohly wrote:
> My testing was flawed: in addition to the RDEPENDS there also was a
> DEPENDS with the same entry, and despite what was said earlier about
> build dependencies, that entry did have an effect. So it is a bit
> more
> complicated.
> 
> The way I'd expect this to work for native tools is this:
>      1. DEPENDS should be ignored (build dependencies like compiler
>         which are not needed when using the resulting tool)

Firstly. this is not true at all. Native recipes have build
dependencies just the same as target recipes. They depend on the native
compiler but you could say that is in ASSUME_PROVIDED. A recipe which
uses gettext macros would DEPENDS on gettext-native, it gets
autoreconf'd just like a target recipe and hence has the same kind of
dependency requirements. Obviously native recipe only depend on other
native recipes though. qemu-native DEPENDing on things like libsdl-
native is another example.

By comparison RDEPENDS of a native recipe are only needed after its
been compiled and we're about to run it (at least by definition).

>      2. RDEPENDS_${PN} needs to be used (essential runtime
> dependencies,
>         set the same way as for the target recipes, because then
>         BBCLASSEXTEND native mostly works automatically)
>      3. RDEPENDS_foo for foo != ${PN} is *not* used - that's
> basically a
>         convention, and addresses the issue I mentioned where it is
>         unclear for a native recipe whether it really has such a
> package
> 
> But the actual implementation isn't quite doing this. Instead,
> extend_recipe_sysroot() in staging.bbclass and setscene_depvalid() in
> sstate.bbclass look at the task dependencies.

Effectively staging.bbclass calls into sstate.bbclass and they both run
off exactly the same base dependency data which is represented by task-
depends.dot.

> Here's an example, using Poky e758547db = current master:
> $ bitbake wic-tools
> ...
> $ grep gettext tmp/work/i586-poky-linux/wic-tools/1.0-
> r0/temp/log.do_prepare_recipe_sysroot
> Considering setscene task: ['gettext-native', 'do_populate_sysroot']
>   considering dependency: ['gettext-native', 'do_populate_sysroot']
> Skipping setscene dependency virtual:native:/work/poky/meta/recipes-
> core/gettext/gettext_0.19.8.1.bb:do_populate_sysroot for installation
> into the sysroot
> ...
> $ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/
> -name gettext
> tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/usr/share/gettext
> tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/installeddeps/gettext
> 
> "gettext" is not installed.

wic-tools is a target recipe (whether it should be or not is a
different question). From an sstate perspective, execution of a target
recipe will not need any indirect native build tools so it is correctly
ignoring gettext-native.

> Let's add it to RDEPENDS_${PN} of dosfstools-native, one of the
> dependencies of wic-tools:
> $ echo 'RDEPENDS_dosfstools-native_append_pn-dosfstools-native = "
> gettext-native"' >conf/auto.conf
> $ bitbake -e dosfstools-native | grep ^RDEPENDS
> RDEPENDS_dosfstools-native="gettext-native"
> RDEPENDS=""
> RDEPENDS_kernel-base=""
> RDEPENDS_dosfstools-native-staticdev="dosfstools-native-dev (= 4.1-
> r0)"
> RDEPENDS_dosfstools-native-dev="dosfstools-native (= 4.1-r0)"

I checked the bitbake code and it will only see RDEPENDS, not RDEPENDS-_${PN} since PACKAGES is empty in the -native case. That explains what
you see above however I tried dropping the _${PN} piece and it still doesn't find the gettext-native dependency.

With a little more digging, I realised that base.bbclass does:

do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"

Note that this is "deptask", not "rdeptask".

The lack of the "r" means it will work off DEPENDS, not RDEPENDS.

[...]

> Nothing. RDEPENDS_dosfstools-native was completely ignored. To me 
> that looks like a missing feature or even a bug, if it was meant to 
> work already.
>
> I'm leaning towards the "bug" theory. There are examples where
> RDEPENDS
> is set explicitly for native recipes, albeit inconsistently:
> meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:RDEPENDS_class-native =
> "libxslt-native"
> meta/recipes-graphics/xorg-
> app/mkfontdir_1.0.7.bb:RDEPENDS_${PN}_class-native += "mkfontscale-
> native"

I think the system is working as designed however the design is
suboptimal as I've hinted at before and the metadata is confused and
mainly appears to work by luck.

> Of these two, only setting RDEPENDS_class-native actually has an
> effect
> (tested by adding socat-native to the assignment). mkfontscale-native
> gets installed through some other, indirect dependency.
> 
> Digging deeper, it seems that it also depends on whether a recipe
> sets
> PACKAGES. The insane.bbclass pkgvarcheck allows RDEPENDS (without
> suffix) if PACKAGES is empty, which is the case for native recipes -
> unless a recipe sets PACKAGES explicitly, as libnewt does with
> PACKAGES_append.

I think my explanation above does clarify that?

> It gets more confusing. Based on the observation about xmlto, I'd
> expect
> that this change to libnewt should have an effect:
> 
> $ git diff meta/recipes-extended/newt
> diff --git a/meta/recipes-extended/newt/libnewt_0.52.19.bb
> b/meta/recipes-extended/newt/libnewt_0.52.19.bb
> index a26ce1fbe75..0a1d693e110 100644
> --- a/meta/recipes-extended/newt/libnewt_0.52.19.bb
> +++ b/meta/recipes-extended/newt/libnewt_0.52.19.bb
> @@ -38,7 +38,8 @@ CLEANBROKEN = "1"
>  
>  export CPPFLAGS
>  
> -PACKAGES_prepend = "whiptail "
> +PACKAGES_prepend_class-target = "whiptail "
> +RDEPENDS_class-native = "socat-native"
>  
>  do_configure_prepend() {
>      sh autogen.sh
> 
> It changes PACKAGES and RDEPENDS as expected, but tasks dependencies
> do
> not:
> 
> $ bitbake -e libnewt-native | grep -e PACKAGES= -e ^RDEPENDS=
> RDEPENDS="socat-native"
> PACKAGES=""
> $ bitbake -g libnewt-native
> $ grep -e '->.*socat-native' task-depends.dot 
> 
> Nothing.

This is because of the deptask verses rdeptask.

> Here's the same test for xmlto:
> 
> $ git diff meta/recipes-devtools/xmlto
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> index ce5d1e0c502..9e995fe5e9d 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -13,7 +13,7 @@ SRC_URI[md5sum] =
> "a1fefad9d83499a15576768f60f847c6"
>  SRC_URI[sha256sum] =
> "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
>  
>  inherit autotools
> -RDEPENDS_class-native = "libxslt-native"
> +RDEPENDS_class-native = "libxslt-native socat-native"
>  
>  # xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
>  RDEPENDS_${PN} = "docbook-xml-dtd4 \
> 
> $ bitbake -e xmlto-native | grep -e PACKAGES= -e ^RDEPENDS=
> RDEPENDS="libxslt-native socat-native"
> PACKAGES=""
> $ bitbake -g xmlto-native 
> $ grep -e '->.*socat-native' task-depends.dot 
> "socat-native.do_populate_sysroot" -> "socat-native.do_install"
> "socat-native.do_patch" -> "socat-native.do_unpack"
> "socat-native.do_unpack" -> "socat-native.do_fetch"
> "socat-native.do_compile" -> "socat-native.do_configure"
> "socat-native.do_prepare_recipe_sysroot" -> "socat-native.do_fetch"
> "socat-native.do_configure" -> "socat-
> native.do_prepare_recipe_sysroot"
> "socat-native.do_configure" -> "socat-native.do_patch"
> "socat-native.do_install" -> "socat-native.do_compile"
> "xmlto-native.do_populate_sysroot" -> "socat-
> native.do_populate_sysroot"
> 
> If this email sounds confused, then that's because I am - sorry for
> that ;-}
> 
> Can someone clarify how RDEPENDS really works at the moment for
> native
> recipes?
> 
> Now regarding DEPENDS being ignored: that's not quite the case
> either.
> 
> $ echo 'DEPENDS_append_pn-dosfstools-native = " socat-native"'
> >conf/auto.conf
> $ bitbake wic-tools
> ...
> $ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/ -name socat
> tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/usr/bin/socat
> 
> In other words, a build dependency got installed although it
> shouldn't really be needed.

We can't tell the difference between a build dependency which may
contain a library we link to and need at runtime and one that does not.

> Finally, re-running do_populate_sysroot_setscene does not remove
> entries
> which no longer should be there. Test case:
> 
> $ echo 'DEPENDS_append_pn-dosfstools-native = " socat-native"'
> >conf/auto.conf
> $ bitbake wic-tools:do_prepare_recipe_sysroot | cat
> ...
> NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot:
> Started
> NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> NOTE: Tasks Summary: Attempted 682 tasks of which 681 didn't need to
> be rerun and all succeeded.
> $ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/ -name socat
> tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/usr/bin/socat
> $ echo  >conf/auto.conf
> $ bitbake wic-tools:do_prepare_recipe_sysroot | cat
> ...
> NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot:
> Started
> NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> NOTE: Tasks Summary: Attempted 674 tasks of which 673 didn't need to
> be rerun and all succeeded.
> $ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/ -name socat
> tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/usr/bin/socat
> $ bitbake -c clean wic-tools
> ...
> $ bitbake wic-tools:do_prepare_recipe_sysroot | cat
> ...
> NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot:
> Started
> NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> NOTE: Tasks Summary: Attempted 674 tasks of which 672 didn't need to
> be rerun and all succeeded.
> $ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-
> native/ -name socat
> 
> Is there a missing [cleandirs] for the recipe-sysroot-native or is
> this
> reuse of the existing content intentional?

It is "intentional" since you can have two tasks running in parallel,
each with different dependencies which both have to be installed into
the sysroot. Neither will know about the dependencies the other has.

What does happen is that any changed/unreachable dependency will be
removed from the sysroot though since we can detect those. I wish we
could do better but since its recipe specific, not task specific, we're
stuck with this problem as far as I can tell.

Hopefully that at least explains some of what is happening. As I've
said, I do think we need work/cleanup in this area.

Cheers,

Richard



