Return-Path: <jsbronder@cold-front.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 905D7787ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 20:45:04 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 7071F20D3B;
	Tue, 20 Feb 2018 15:45:05 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 20 Feb 2018 15:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=lcv8A2AvdxEJkWJf/9wL456xVg+SXkCjqfPjfMZzC9M=; b=nCwVm
	XPVEHUhQGkK9TylA52T+0Hl6067QE22m+a0LIn33YWa56FDcuvl5xEFIpzcrLeKw
	xSX+xBKdQY8ouhrDGOvbfRx3ffPlQnyclyHpdIhuCq2DfN8anpsNpG3QHFW1sJfY
	e7T4/Ys4i9FgZF4gXQwvgUhgsW4e1a0QdJll8M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=lcv8A2AvdxEJkWJf/9wL456xVg+SX
	kCjqfPjfMZzC9M=; b=SwgiEi46lp5POk/uVCRKQ3SnRTJLNmeRsw3CQ40SLZgfy
	qO1IqJsKV2Rab7IL088lmKS1yUxP8Ji/aVzgHq07mwsY9x3OSKfPoLAn+eFYvVWC
	GwOGOsNQRHmqwf4CiNgzpUrgzkP6hCrvT6jCpe+FfRK0e8IDS8EDD+w2Aj5trvkB
	KF+NrXN6eiK3uapD1trx/r/SRN98c5t2JzL9IktT+kd0nrnBOvt7eAc19sSivstB
	AGE3rM0wbSZSc3qIy19JhFFIhFMA4TkqFPBn0FFGxb67IEnBx0xXgio37Kc6/Qrh
	8HTO36raRGXlUZYaTy9/d7QMC3bcwkWOX1vMhFE6w==
X-ME-Sender: <xms:0YiMWhHc1-PMIof_NjT0g-46IwJNRcTww44ItoMJDywkZMpSs4tZ5w>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 24F2324522;
	Tue, 20 Feb 2018 15:45:05 -0500 (EST)
Date: Tue, 20 Feb 2018 15:45:04 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20180220204504.GA16668@lasswell>
References: <20180220164126.13123-1-jsbronder@cold-front.org>
	<CADkTA4PYMiMCKSE-rua7pjHaYgg_U3caan=Sy_i6r2Agc-8vUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PYMiMCKSE-rua7pjHaYgg_U3caan=Sy_i6r2Agc-8vUQ@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel: module: module-base: depend on elfutils-native
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
X-List-Received-Date: Tue, 20 Feb 2018 20:45:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/02/18 12:06 -0500, Bruce Ashfield wrote:
> On Tue, Feb 20, 2018 at 11:41 AM, Justin Bronder
> <jsbronder@cold-front.org> wrote:
> > libelf is required for CONFIG_STACK_VALIDATION which is required by
> > CONFIG_UNWINDER_ORC (the default in 4.14+).
> 
> As you'll see in the discussion about adding bison-native, we don't want to add
> these version specific dependencies globally.

I was watching but didn't see a definitive conclusion in that thread yet.
Ignoring out of tree modules, I suppose it is pretty trivial to just add the
extra DEPENDS to the kernel recipe for a while until they're required by all
supported kernel versions.  However, for out of tree modules, it's a bit more of
a burden to add it for every recipe.  Is that the suggested way forward to deal
with this or is there a better method?

> 
> >
> > We also need to update the module classes to pass HOSTCC and HOSTCPP
> 
> This is already covered in my v3 "make-modules-script" changes.

That does cover the patch to module-base.bbclass, but it's missing the addition
to EXTRA_OEMAKE in module.bbclass which is still needed in order to be able to
find elfutils-native if I add it to the DEPENDS of the module.

> 
> Bruce
> 
> > just like the kernel class already does.  Otherwise the test for libelf
> > in the kernel Makefile fails.
> > ---
> >  meta/classes/kernel.bbclass      | 2 +-
> >  meta/classes/module-base.bbclass | 1 +
> >  meta/classes/module.bbclass      | 4 +++-
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 5cdff581ef..d3a7e1e1cb 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
> >  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
> >
> >  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> > -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
> > +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native elfutils-native"
> >  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
> >
> >  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
> > diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> > index f851b85163..3b56e04534 100644
> > --- a/meta/classes/module-base.bbclass
> > +++ b/meta/classes/module-base.bbclass
> > @@ -23,5 +23,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  do_make_scripts() {
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >         make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > +                  HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
> >                    -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
> >  }
> > diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> > index 78d1b21dbd..89dee2dae8 100644
> > --- a/meta/classes/module.bbclass
> > +++ b/meta/classes/module.bbclass
> > @@ -1,10 +1,12 @@
> >  inherit module-base kernel-module-split pkgconfig
> >
> > +DEPENDS += "elfutils-native"
> > +
> >  addtask make_scripts after do_prepare_recipe_sysroot before do_configure
> >  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
> >  do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
> >
> > -EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
> > +EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR} HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> >
> >  MODULES_INSTALL_TARGET ?= "modules_install"
> >  MODULES_MODULE_SYMVERS_LOCATION ?= ""
> > --
> > 2.13.6
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

-- 
Justin Bronder

