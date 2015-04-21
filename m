Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 72BA260167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 12:39:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Apr 2015 05:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,615,1422950400"; d="scan'208";a="698538918"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2015 05:39:55 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5C6F36A408F;
	Tue, 21 Apr 2015 05:39:29 -0700 (PDT)
Date: Tue, 21 Apr 2015 15:39:48 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Message-ID: <20150421123948.GA27392@linux.intel.com>
References: <1429546400.1918.13.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1429546400.1918.13.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic: Implement --build-rootfs command line option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Apr 2015 12:39:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 06:13:20PM +0200, Adrian Freihofer wrote:
> Let wic call bitbake seems to be a great idea.
> 
> One question is open to me. What's the recommended approach to resolve
> the dependencies between the image, the bootloader and native tools
> which are additionally required to create the final disk image?
This is open to me too. I was kinda surprised when I saw that no images from 'wic list images' output can be built for not that obvious reasons:
$ for image in `wic list images | cut -f3 -d' '` ; do wic create $image -e core-image-minimal; done
Checking basic build environment...
Done.

Creating image(s)...

Error: Couldn't find HDDDIR, exiting

Checking basic build environment...
Done.

Creating image(s)...

Error: No boot files defined, IMAGE_BOOT_FILES unset
Checking basic build environment...
Done.

Creating image(s)...

Error: Couldn't find HDDDIR, exiting

Checking basic build environment...
Done.

Creating image(s)...

Error: Please build syslinux first

Only last message makes sense to me. The rest two don't give any hints on how to solve the problem.

> Basically the right place to resolve this dependency is the kickstart
> file. Bitbake should not even know that syslinux or any other bootloader
> will be added to the final disk image. In other words
> IMAGE_EXTRA_DEPENDS or similar are not the right place to add the
> bootloader dependency anymore. But if bitbake does not provide e.g.
> syslinux-native wic will fail to use it. This is kind of a chicken egg
> problem...
> A nice solution would be if wic would maintain a simple dependency list
> For example: There is a kickstart file assembling a disk image including
> my-mini-image and syslinux-native. To create the partition layout,
> parted-native is required as well. Hence bitbake should be called like
> this: "bitbake my-mini-image parted-native syslinux-native" before wic
> starts assembling the disk image. my-mini-image is provided by the -e
> parameter of wic. The latter two tools should be provided by the wic
> plugins creating the partitions and the disk image. My proposal is to
> extend the internal API of wic by a dependency list where plugins can
> append required tools e.g. during start up of wic. This would enable the
> disk plugin to request "parted-native" and the boot partition plugin to
> request "syslinux-native" before bitbake is called.

I like the proposal. Just want to point out to a couple of things.
First, parted-native seems to be essential tool for wic, so wic core should check for it from my point of view.
Second, it depends on the environment if wic is able to find bootloader or not. For example, baking bootloader is not always enough for wic to find it. I'm still puzzled by this fact, but it depends on the MACHINE and may be other parameters. For example, wic is not able to find bootloader if core-image-minimal is built for default machine qemux86(see errors above), but it works just fine for intel-corei7-64.

So, I would propose to start from making wic to work for any build. This way we can understand requirements better.

> Further on one more problem could be solved easily. If wic takes care
> about the final disk assembly bitbake --fetch-only might not be
> sufficient to download everything needed to create the whole firmware.
> This makes it hard to create a complete premirror. If wic would support
> the dependency list as mentioned above and provide a command line
> parameter --fetch-only everything would be consistent. Instead of
> calling "bitbake  my-mini-image  --fetch-only" the user just calls the
> corresponding wic command with --fetch-only appended. This would result
> in "bitbake my-mini-image parted-native syslinux-native --fetch-only".

What's fetch-only option? I don't see it among bitbake options.

--
Regards,
Ed

