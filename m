Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 884A06EA2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:40:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2014 07:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,765,1389772800"; d="scan'208";a="503572684"
Received: from unknown (HELO [10.255.12.30]) ([10.255.12.30])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2014 07:39:53 -0700
Message-ID: <1396276792.11878.24.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Mon, 31 Mar 2014 09:39:52 -0500
In-Reply-To: <5338CA5F.2080104@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<CAP9ODKoAeOS46F4LqnaMGfJ_5QJKo=vnnRLOgHU0sRC4imRz3Q@mail.gmail.com>
	<CANFVK7_uz3pr=WTdjqg8eXnfQzCSPnvaQq+kymud=YTj-8AV9g@mail.gmail.com>
	<CAP9ODKqVPgoyH_XveWsJugSyHfBd0q0cccKWD2wkTMg7dKJd-Q@mail.gmail.com>
	<5338CA5F.2080104@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Mon, 31 Mar 2014 14:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2014-03-30 at 22:52 -0300, João Henrique Ferreira de Freitas
wrote:
> Hi Tom,
> 
> Let's back in this context. This is really important and I was waiting 
> to complete the previous stage.
> 
> Em 17-03-2014 13:11, Otavio Salvador escreveu:
> >>>
> >>> If my understand is right, I like the feature. My only concern is
> >>> people overusing it and adding contents which are not 'tracked' in the
> >>> build system in a product release which seems attractive when we first
> >>> think about it but cause some management, tracking and authenticity
> >>> check problems in long term.
> >>>
> >>>
> >>> I don't know how to better address this from wic perspective. Usually
> >>> we end doing multiple images as part of the build process for those
> >>> special cases and I don't know how wic could be 'told' about those
> >>> secondary rootfs existence.
> >>>
> 
> I have been working on it since Otavio's concerns about 'contents which 
> are not tracked'.
> 
> So extending my previous patches (80% done) to handle this situation is 
> quite easy. Like this:
> 
> bitbake directdisk-multi-image-e img1=core-image-minimal -e 
> img2=core-image-minimal -e img3=core-image-minimal
> 
> directdisk-multi-image.wks:
> 
> part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label 
> boot --active --align 1024
> 
> part / --source rootfs --image-name=img1 --ondisk sda --fstype=ext3 
> --label primary --align 1024
> 
> part /standby --source rootfs --image-name=img2 --ondisk sda 
> --fstype=ext3 --label secondary --align 1024
> 
> part /root --source rootfs --image-name=img3 --ondisk sda --fstype=ext3 
> --label root_sec --align 1024
> 
> 
> If the user put '--image-name' and '--rootfs-dir' the '--image-name' 
> takes precedence.
> 
> As wic is a generic tool, the user could prefer to use images from OE or 
> any other rootfs-dir.
> 
> Tom, what do you think? Could I go ahead?
> 

So is the idea that you want to allow the user the convenience of being
able to use the equivalent of '-e imagename' for any partition, rather
than having to explicitly specify the full path?

'-e imagename' was always meant as just a convenience to the user, since
currently the easiest way to generate the artifacts is to first create
an oe image.  If you think about it, having to create an oe image or
images in order to create another (wic-generated) image doesn't really
make a lot of sense - it's basically just a temporary situation pending
better integration, etc.  So for that reason, I wouldn't want to see the
idea of an --image-name incorporated into the image-creation .wks files.

But I think you could accomplish the same thing by just allowing the
indirect string e.g. rootfs2 to resolve to either a full path, or as an
image name, which would be treated as an instance of '-e image-name' for
that partition.

For example, we have the unmodified parttion in the .wks file as usual:

  part /standby --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext3 --label secondary --align 1024

Which could be resolved as either a full path to the rootfs dir:

  wic create directdisk-multi-indirect-both --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal

Or extracted from the '-e' ROOTFS_DIR output from the 'core-image-minimal' image:

  wic create directdisk-multi-indirect-both --rootfs-dir rootfs2=core-image-minimal

Does that make sense for this?

Tom


> Thanks
> 



