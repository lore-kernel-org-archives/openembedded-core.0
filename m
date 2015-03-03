Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4CADE65DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 11:25:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 03 Mar 2015 03:20:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,681,1418112000"; d="scan'208";a="659695992"
Received: from tmlemanx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.7.97])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2015 03:25:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 03 Mar 2015 11:25:43 +0000
Message-ID: <1842926.0Cr3xtp9ZT@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1502271553110.8885@localhost>
References: <alpine.LFD.2.11.1502271553110.8885@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: inconsistency with adding LICENSE lines to images
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
X-List-Received-Date: Tue, 03 Mar 2015 11:25:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 27 February 2015 15:58:32 Robert P. J. Day wrote:
>   just noticed the following ... in OE image definition files under
> recipes-core:
> 
> core-image-base.bb
> core-image-minimal.bb
> core-image-minimal-dev.bb
> core-image-minimal-initramfs.bb
> core-image-minimal-mtdutils.bb
> 
> it *seems* to make sense that image definitions that require or
> include other core image bb files don't need to add the line:
> 
> LICENSE = "MIT"
> 
> as they pick it up from the include'd or require'd file, but image
> recipe files that
> 
> inherit core-image
> 
> *do* need to define their own license.
> 
>   but if one then goes under recipes-extended/images, it looks a bit
> strange as, for example, here's core-image-full-cmdline.bb:
> 
> DESCRIPTION = "A console-only image with more full-featured Linux system \
> functionality installed."
> 
> IMAGE_FEATURES += "splash ssh-server-openssh"
> 
> IMAGE_INSTALL = "\
>     packagegroup-core-boot \
>     packagegroup-core-full-cmdline \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     "
> 
> inherit core-image
> 
>   so ... what's the licensing there? this image inherits directly from
> core-image, but doesn't define a license? am i misunderstanding the
> need for a license?

There shouldn't be a need to set this for image recipes whether they inherit 
image or core-image, since recipes don't generally distribute any files other 
than those that come from packages that they include (which have their own 
licenses) - it wouldn't be practical to list all of the licenses for all of 
the components of the image, that is what we produce the license manifest for. 

On the other hand, if you re-enable do_fetch and add files to SRC_URI within 
the image recipe (which should generally be avoided but is done in rare cases 
- build-appliance-image is one example) then you probably ought to be 
concerned with the LICENSE value. Having said that I don't know if the license 
manifest logic actually looks at the LICENSE value for the image at all, I 
suspect it does not.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

