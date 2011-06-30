Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcPls-0003GX-5l for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:31:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMRuE0029016
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:27:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28127-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:27:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMRnes028997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:27:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110630172627.GC2871@raven.pace.internal>
References: <20110630172627.GC2871@raven.pace.internal>
Date: Thu, 30 Jun 2011 23:27:30 +0100
Message-ID: <1309472850.20015.475.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Adding an external toolchain to oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 22:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2011-06-30 at 18:26 +0100, Tom Parkin wrote:
> We have been working to support a Codesourcery Lite MIPS toolchain
> recently.  RP__ (on IRC) asked me to write up the process such that
> others may benefit from our experiences.
> 
> Aside: I think this information would probably be best hosted on a
> wiki, so once we've made any required changes I will seek to post this
> on the OpenEmbedded wiki.  Let me know where I should put it.

I really appreciate this writeup, thanks!

Before we put this on the wiki do you think you'd be able to help us
clean up this process as I think we can make this easier for people?

If you are willing, I'd like to propose we drop the old 2008q3 .bb files
and replace them with ones from the toolchain you've worked with so its
a working example.

I'd then like to find ways to allow this to work "out the box" rather
than needing as much hacking to OE-Core such as the TARGET_OS change.

> Toolchain addition writeup follows:
> 
> 
> 
> We wanted to add support in oe-core for a Codesourcery Lite MIPS
> toolchain.  The toolchain we targetted was a legacy release based
> around gcc-4.2.  Toolchain binaries and release notes can be obtained
> from the Codesourcery website:
> 
> http://www.codesourcery.com/sgpp/lite/mips/portal/subscription3130
> 
> 
> # Step 0: install the toolchain on your development host
> 
> The recipes we create for the external toolchain expect that the
> toolchain has been downloaded from the Codesourcery website and
> installed onto the development host.
> 
> We downloaded the tarball version of the toolchain and installed it
> under /usr.
> 
> 
> # Step 1: create recipes for the new toolchain
> 
> Taking the existing recipes for the CSL 2008q3 as a template, we
> cloned the following files:
> 
>    cp meta/conf/distro/include/tcmode-external-csl2008q3.inc \
>       meta/conf/distro/include/tcmode-external-csl-mips-4.2-177.inc
> 
>    cp meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb \
>       meta/recipes-core/meta/external-csl-toolchain_mips-4.2-177.bb
> 
> Unlike OpenEmbedded (or Poky), oe-core doesn't directly make use of
> the "distro" concept; and so toolchain and libc choices are controlled
> directly from local.conf.  To use the new MIPS toolchain, add the
> following to local.conf:
> 
>    TCMODE = "external-csl-mips-4.2-177"
>    TCLIBC = "glibc"
> 
> 
> # Step 2: fix up toolchain recipe bitrot
> 
> The CSL 2008q3 recipe we cloned seems to have bitrotted a bit relative
> to the current oe-core tree.  We had to make the following changes to
> allow our new mips-4.2 recipes to work:
> 
>    *  Rework the do_configure_prepend() function in
>       libc-package.bbclass as a task added to the queue before
>       do_configure().  This allowed us to override the function in the
>       toolchain recipe which inherits from libc-package.
> 
>    *  Add a LIC_FILES_CHECKSUM variable to the toolchain recipe.
> 
>    *  Replace hardcoded target prefixes with TARGET_PREFIX.
> 
>    *  Add libgcc and compilerlibs to the toolchain PROVIDES list.

These issues should get addressed if you were able to provide new
toolchain recipes?

> 
> # Step 3: tell OE that the toolchain provides locale information
> 
> The CSL MIPS toolchain provides locale information out of the box, so
> we modified the toolchain recipe to suit by setting
> GLIBC_INTERNAL_USE_BINARY_LOCALE to "precompiled".  You have to also
> set ENABLE_BINARY_LOCALE_GENERATION to "0" in local.conf to prevent
> this setting getting overridden, though!

Ouch, we should find a way for the local.conf setting not to be needed.

> 
> # Step 4: hack around the non-standard toolchain naming convention
> 
> OE expects toolchain naming to align with the target prefix, e.g.
> 
>    arch-vendor-os-
> 
> The CSL toolchain is named slightly differently:
> 
>    mips-linux-gnu-
> 
> To work around this we set the variables TARGET_VENDOR and TARGET_OS
> appropriately in the toolchain include file:
> 
>    TARGET_VENDOR = ""
>    TARGET_OS = "linux-gnu"
> 
> To allow us to do this without tclibc-glibc.inc overriding the setting
> of TARGET_OS we had to change the assignment of TARGET_OS in
> tclibc-glibc.inc (to use "?=" rather than "=").

This is probably going to be the hardest issue to fix. I would like to
find a way to do it but that variable is tricky to handle for various
reasons...

> In order to have the rest of OE recognise our new target prefix, we
> had to modify two lookup tables: one in siteinfo.bbclass, and one in
> insane.bbclass.

I wonder if we can use some wildcards or some other mechanism to avoid
that.

> # Step 5: fix up packages which depend on features CSL doesn't have
> 
> The CSL MIPS toolchain is built around sanitised kernel headers from a
> 2.6.24 kernel.  Various packages in the oe-core tree play poorly with
> these headers, so we had to make a series of fixes for these issues.
> 
>    *  Update to util-linux-2.19.1 for changes to better deal with
>       kernels which don't support fallocate.
> 
>    *  Add extra patches to the OpenSSL configure script to support a
>       linux-gnu-mips target.
> 
>    *  Add a missing header include in glib for targets which have no
>       inline asm "atomic" implementation in the glib tree.  MIPS is
>       such a target!
> 
>    *  Use busybox mdev rather than udev.  Udev wants libc to support
>       O_CLOEXEC, which isn't the case for the libc headers included in
>       the CSL toolchain.

Its certainly useful to document these but since they're
version/toolchain specific, I think these are less interesting from an
OE-Core perspective.

Could you get away with using more recent kernel headers or does that
cause issues within the toolchain? I guess that ultimately depends what
kernel version you're using for your target too.

> # Step 6: endianness specification
> 
> Typically cross-compiling MIPS toolchains reflect which endianness
> they support by default in their naming, e.g. mipsel for little endian
> targets, and mips for big endian targets.
> 
> The CSL MIPS toolchain supports both little and big endian targets
> with the same toolchain with the "mips" prefix.  Endianness is
> specified using the -EL and -EB arguments to gcc.
> 
> OE doesn't expect this to be the case, so we had to make some
> modifications to ensure that the endianness arguments were correctly
> provided to gcc throughout the build.

Did you do this by changing TOOLCHAIN_OPTIONS or TARGET_CC_ARCH out of
interest?

Cheers,

Richard




