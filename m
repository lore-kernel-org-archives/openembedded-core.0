Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBD276E2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 14:43:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2014 06:39:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,786,1384329600"; d="scan'208";a="478484725"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2014 06:43:35 -0800
Date: Wed, 5 Feb 2014 16:43:34 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Message-ID: <20140205144334.GG5112@lpalcu-linux>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
	<cover.1391594312.git.laurentiu.palcu@intel.com>
	<CAAKB1h3PL6oyL0VG70SVXSMEROxrwX0sJDc82WO+0e=QvSKiaw@mail.gmail.com>
	<52F229E1.3040204@enea.com>
MIME-Version: 1.0
In-Reply-To: <52F229E1.3040204@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/50] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Wed, 05 Feb 2014 14:43:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 05, 2014 at 01:09:05PM +0100, David Nyström wrote:
> >
> >| NOTE: Installing complementary packages ...
> >| NOTE: Installing the following packages:
> >| /media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl: the
> >``install'' command requires at least one argument
> >| NOTE: Unable to install packages. Command
> >/media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f
> >/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/opkg.conf
> >-o
> >/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/rootfs
> >--force_postinstall --prefer-arch-to-version   install  returned 1
I'll send a quick fix for this. This, however, is not the reason of the
build failure. It's complementary packages that are installed and an
empty list is passed to install(). Since these are attempt only
packages, the build does not fail because of this. Anyway, I added a
simple check and I will send a v3.

> >| NOTE: Running intercept scripts:
> >| NOTE: Executing write_package_manifest ...
> >| DEBUG: Executing python function write_package_manifest
> >| NOTE: Building from feeds activated!
> >| NOTE: Add all feed with URL
> >file:///media/sdb5/oel/build/tmp/deploy/ipk/all
> >| NOTE: Add qemuppc feed with URL
> >file:///media/sdb5/oel/build/tmp/deploy/ipk/qemuppc
> >| NOTE: Add ppc7400 feed with URL
> >file:///media/sdb5/oel/build/tmp/deploy/ipk/ppc7400
> >| DEBUG: Python function write_package_manifest finished
> >| NOTE: Executing license_create_manifest ...
> >| DEBUG: Executing shell function license_create_manifest
> >| ls: cannot access
> >/media/sdb5/bld/tmp/sysroots/qemuppc/pkgdata/runtime-reverse/base-files: No
> >such file or directory
> >| readlink: missing operand
> >| Try 'readlink --help' for more information.
> >| basename: missing operand
> >| Try 'basename --help' for more information.
> >| WARNING: exit code 1 from a shell command.
> >| DEBUG: Python function do_rootfs finished
> >| ERROR: Function failed: license_create_manifest (log file is located at
> >/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.29007)
Now, this is the interesting part which, btw, happens on master too. That's
because you're installing from feeds and you're installing an older
version that has different packages than the latest (these are read from
package.manifest). The YP 1.5 core-image-minimal package.manifest
contains update-alternatives-cworth. The latest core-image-minimal does
not contain this package anymore. It contains update-alternatives-opkg.

The easiest way would be to add a check in license_create_manifest() to
just ignore packages that cannot be found. However, since we're dealing
with licenses here, I honestly don't know if this is the right way of
doing it...

laurentiu 

