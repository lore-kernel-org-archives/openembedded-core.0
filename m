Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CBE7B6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 20:59:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jan 2016 12:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,377,1449561600"; d="scan'208";a="873526763"
Received: from ranerica-desk01.sc.intel.com (HELO [10.3.52.148])
	([10.3.52.148])
	by orsmga001.jf.intel.com with ESMTP; 31 Jan 2016 12:59:23 -0800
Message-ID: <1454273919.22677.18.camel@ranerica-desk01>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 31 Jan 2016 12:58:39 -0800
In-Reply-To: <1454151290.10340.82.camel@linuxfoundation.org>
References: <1453029405.27999.16.camel@linuxfoundation.org>
	<1454117651.22677.6.camel@ranerica-desk01>
	<1454151290.10340.82.camel@linuxfoundation.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: luv@lists.01.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimg/image: Enhance bootimg to respect RM_OLD_IMAGE
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
X-List-Received-Date: Sun, 31 Jan 2016 20:59:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-01-30 at 10:54 +0000, Richard Purdie wrote:
> On Fri, 2016-01-29 at 17:34 -0800, Ricardo Neri wrote:
> > [Resending from an email subscribed to the oe list...]
> > On Sun, 2016-01-17 at 11:16 +0000, Richard Purdie wrote:
> > > @@ -294,7 +286,10 @@ python do_bootimg() {
> > >          bb.build.exec_func('build_efi_cfg', d)
> > >      bb.build.exec_func('build_hddimg', d)
> > >      bb.build.exec_func('build_iso', d)
> > > +    bb.build.exec_func('create_symlinks', d)
> > When I try to use bootimg.bbclass I get the following warning:
> > 
> > WARNING: Function create_symlinks doesn't exist
> > 
> > This is because create_symlinks is defined in image.bbclass but
> > bootimg.bbclass does not inherit from it. Should it be the case? Or
> > the
> > definiton of create_symlinks should be moved to a separate file?
> 
> I guess the key question is whether anyone is using bootimg.bbclass
> without using image.bbclass, or whether that is even
> possible/practical?

Hmm. Probably only image-live.bbclass. But if I understand correctly,
that class gets inherited by image.bbclass if live is specified in the
IMAGE_FSTYPES. 
> 
> Was this an existing setup that broke?

For the Linux UEFI Validation project we have a custom luv-live-image
recipe[1] that inherits from bootimg.bbclass but not from image.bbclass.
We have not had the need thus far. Our ramdisk does inherit
image.bbclass via core-image.bbclass[2].

Perhaps our live image recipe can be reworked to inherit from
image-live? Our main customization is that we have two partitions in the
bootable media.

Thanks and BR,
Ricardo

[1].https://github.com/01org/luv-yocto/blob/master/meta-luv/recipes-core/images/luv-live-image.bb
[2].https://github.com/01org/luv-yocto/blob/master/meta-luv/recipes-core/images/core-image-efi-initramfs.bb
> 
> Cheers,
> 
> Richard



