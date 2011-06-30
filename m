Received: from cluster-b.mailcontrol.com ([85.115.56.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom.Parkin@pace.com>) id 1QcLqL-0004Cm-9z
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 20:20:01 +0200
Received: from salexc3.pace.internal (salts-gw1.pace.co.uk [194.60.90.1])
	by rly33b.srv.mailcontrol.com (MailControl) with ESMTP id
	p5UHQS0f016116 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 18:26:28 +0100
Received: from localhost ([136.170.166.74]) by salexc3.pace.internal with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 30 Jun 2011 18:26:27 +0100
Date: Thu, 30 Jun 2011 18:26:27 +0100
From: Tom Parkin <tom.parkin@pace.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110630172627.GC2871@raven.pace.internal>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 30 Jun 2011 17:26:28.0020 (UTC)
	FILETIME=[D8234740:01CC374A]
X-Scanned-By: MailControl A-12-00-01 (www.mailcontrol.com) on 10.66.0.143
Subject: Adding an external toolchain to oe-core
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
X-List-Received-Date: Thu, 30 Jun 2011 18:20:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

We have been working to support a Codesourcery Lite MIPS toolchain
recently.  RP__ (on IRC) asked me to write up the process such that
others may benefit from our experiences.

Aside: I think this information would probably be best hosted on a
wiki, so once we've made any required changes I will seek to post this
on the OpenEmbedded wiki.  Let me know where I should put it.

Toolchain addition writeup follows:



We wanted to add support in oe-core for a Codesourcery Lite MIPS
toolchain.  The toolchain we targetted was a legacy release based
around gcc-4.2.  Toolchain binaries and release notes can be obtained
from the Codesourcery website:

http://www.codesourcery.com/sgpp/lite/mips/portal/subscription3130


# Step 0: install the toolchain on your development host

The recipes we create for the external toolchain expect that the
toolchain has been downloaded from the Codesourcery website and
installed onto the development host.

We downloaded the tarball version of the toolchain and installed it
under /usr.


# Step 1: create recipes for the new toolchain

Taking the existing recipes for the CSL 2008q3 as a template, we
cloned the following files:

   cp meta/conf/distro/include/tcmode-external-csl2008q3.inc \
      meta/conf/distro/include/tcmode-external-csl-mips-4.2-177.inc

   cp meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb \
      meta/recipes-core/meta/external-csl-toolchain_mips-4.2-177.bb

Unlike OpenEmbedded (or Poky), oe-core doesn't directly make use of
the "distro" concept; and so toolchain and libc choices are controlled
directly from local.conf.  To use the new MIPS toolchain, add the
following to local.conf:

   TCMODE = "external-csl-mips-4.2-177"
   TCLIBC = "glibc"


# Step 2: fix up toolchain recipe bitrot

The CSL 2008q3 recipe we cloned seems to have bitrotted a bit relative
to the current oe-core tree.  We had to make the following changes to
allow our new mips-4.2 recipes to work:

   *  Rework the do_configure_prepend() function in
      libc-package.bbclass as a task added to the queue before
      do_configure().  This allowed us to override the function in the
      toolchain recipe which inherits from libc-package.

   *  Add a LIC_FILES_CHECKSUM variable to the toolchain recipe.

   *  Replace hardcoded target prefixes with TARGET_PREFIX.

   *  Add libgcc and compilerlibs to the toolchain PROVIDES list.


# Step 3: tell OE that the toolchain provides locale information

The CSL MIPS toolchain provides locale information out of the box, so
we modified the toolchain recipe to suit by setting
GLIBC_INTERNAL_USE_BINARY_LOCALE to "precompiled".  You have to also
set ENABLE_BINARY_LOCALE_GENERATION to "0" in local.conf to prevent
this setting getting overridden, though!


# Step 4: hack around the non-standard toolchain naming convention

OE expects toolchain naming to align with the target prefix, e.g.

   arch-vendor-os-

The CSL toolchain is named slightly differently:

   mips-linux-gnu-

To work around this we set the variables TARGET_VENDOR and TARGET_OS
appropriately in the toolchain include file:

   TARGET_VENDOR = ""
   TARGET_OS = "linux-gnu"

To allow us to do this without tclibc-glibc.inc overriding the setting
of TARGET_OS we had to change the assignment of TARGET_OS in
tclibc-glibc.inc (to use "?=" rather than "=").

In order to have the rest of OE recognise our new target prefix, we
had to modify two lookup tables: one in siteinfo.bbclass, and one in
insane.bbclass.


# Step 5: fix up packages which depend on features CSL doesn't have

The CSL MIPS toolchain is built around sanitised kernel headers from a
2.6.24 kernel.  Various packages in the oe-core tree play poorly with
these headers, so we had to make a series of fixes for these issues.

   *  Update to util-linux-2.19.1 for changes to better deal with
      kernels which don't support fallocate.

   *  Add extra patches to the OpenSSL configure script to support a
      linux-gnu-mips target.

   *  Add a missing header include in glib for targets which have no
      inline asm "atomic" implementation in the glib tree.  MIPS is
      such a target!

   *  Use busybox mdev rather than udev.  Udev wants libc to support
      O_CLOEXEC, which isn't the case for the libc headers included in
      the CSL toolchain.


# Step 6: endianness specification

Typically cross-compiling MIPS toolchains reflect which endianness
they support by default in their naming, e.g. mipsel for little endian
targets, and mips for big endian targets.

The CSL MIPS toolchain supports both little and big endian targets
with the same toolchain with the "mips" prefix.  Endianness is
specified using the -EL and -EB arguments to gcc.

OE doesn't expect this to be the case, so we had to make some
modifications to ensure that the endianness arguments were correctly
provided to gcc throughout the build.

-- 
Tom Parkin
Senior Software Engineer
Pace Plc

Bringing Technology Home

Victoria Road, Saltaire, West Yorkshire, BD18 3LF, United Kingdom. www.pace.com

Think before you print! Please consider the environment before printing this e-mail.


This message has been scanned for viruses by BlackSpider MailControl. - www.blackspider.com


