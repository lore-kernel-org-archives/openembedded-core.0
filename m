Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7972077824
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489512359; x=1521048359;
	h=date:from:to:cc:subject:message-id:reply-to:references:
	mime-version:in-reply-to;
	bh=/FMreJcfnenZrRpUKNEEbxLEE8R9UGUBYEzh0JfJV1E=;
	b=kARQi7ORyKQ5L/JrW5xqYdGQW8uXZzXjMBcCZqNzEf2ZDOGHh+xiyyYT
	8gxY1T0QPn0Ow7E9v3RPg/rwEruICQ==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2017 10:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,165,1486454400"; d="scan'208";a="236028260"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 14 Mar 2017 10:25:53 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A94C82C8001;
	Tue, 14 Mar 2017 10:25:47 -0700 (PDT)
Date: Tue, 14 Mar 2017 19:11:47 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <20170314171147.GA28498@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
	<7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
MIME-Version: 1.0
In-Reply-To: <a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Tue, 14 Mar 2017 17:25:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 13, 2017 at 05:16:31PM +0100, Daniel Schultz wrote:
> 
> 
> Am 08.03.2017 um 14:43 schrieb Ed Bartosh:
> >On Wed, Mar 08, 2017 at 02:41:10PM +0100, Gary Thomas wrote:
> >>On 2017-03-08 11:57, Ed Bartosh wrote:
> >>>On Wed, Mar 08, 2017 at 10:44:21AM +0100, Daniel Schultz wrote:
> >>>>Hi,
> >>>>
> >>>>I created two kickstart files (am335x-sdimage.wks, am335x-emmc.wks)
> >>>>and added them to the local.conf.
> >>>>
> >>>>When I build the image only the first wks in WKS_FILES will be used
> >>>>by WIC and the second will be ignored. Is it possible to build two
> >>>>images in one build?
> >>>>
> >>>
> >>>I don't think it's possible to build more than one image for the same
> >>>type. wic is not an exception here.
> >>>
> >>>>Includes of the wks files in local.conf:
> >>>>WKS_FILES_ti33x = "am335x-sdimage.wks am335x-emmc.wks "
> >>>
> >>>WKS_FILES variable is to provide possible wks files to use. First one found will
> >>>be used to produce an image.
> >>
> >>Would it work to add/define this variable in the corresponding *image*.bb recipe
> >>rather than local.conf?
> >
> >Yes, it would if image recipe is unique, i.e. images of the same type
> >can be produced for different recipes.
> >
> But isn't wic different to other images like e.g. ext? I agree that
> there are other images that need only build once, but wic images can
> contain these and therefore act as a wrapper.
>
Makes sense.

> Do I have misunderstood the design of wic?
>
> I mean MMC and EMMC are very similar, but different in the
> bootloader and it would be a overhead to create an extra image for
> all EMMC images.

You don't need to create more than one rootfs with the same content. You
can refer to the same rootfs in multiple .wks files, but the recipes
have to be unique. In your example MMC and EMMC image recipes can create
directories for boot partition and their .wks files can use those
directories and common root directory produced by another recipe, e.g.
by core-image-minimal.

It's not a big deal to run wic sequentially to produce multiple images,
but it will create more problems than it solves I believe. It will be slower and
will make a mess in image naming in deploy directory.

--
Regards,
Ed

