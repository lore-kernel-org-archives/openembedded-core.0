Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE0271A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 10:56:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jan 2017 02:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="812202725"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2017 02:56:27 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D4F4E6A4080;
	Mon, 23 Jan 2017 02:55:29 -0800 (PST)
Date: Mon, 23 Jan 2017 12:34:03 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Rick Altherr <raltherr@google.com>
Message-ID: <20170123103403.GA15174@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <CAPLgG=muXdcmCcFCC7NY8Zk9ANH5yf616T5b9Bc31OCJq=AD3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPLgG=muXdcmCcFCC7NY8Zk9ANH5yf616T5b9Bc31OCJq=AD3w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to use WIC to generate raw flash images
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
X-List-Received-Date: Mon, 23 Jan 2017 10:56:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 20, 2017 at 10:37:15AM -0800, Rick Altherr wrote:
> For OpenBMC (based on Yocto), the target is an SoC that has an external
> boot flash connected via SPI.  Right now, we have a class (
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image-overlay.bbclass)
> used by our top-level image recipe (
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/images/obmc-phosphor-image.bb)
> that manually constructs a flash image from the kernel, rootfs, etc.

This is indeed very interesting work. We definitely need support of flash images in oe-core.

> I'd like to move to an upstream-supported approach and I think that is WIC.

> What I don't understand is:
> - How do I build a raw flash image where it is divided into partitions but
> has no partition table?

Wic doesn't support this type of images, but it shouldn't be hard to add
option to skip partitioning to .wks syntax and wic code.

> - How do I set padding to be 0xFF instead of 0x00?
The same thing here. Currently wic images are sparse files created by
os.ftruncate, but it's not a big deal to fill them with 0xFF

> - How do I include u-boot in the image?

This can be done by using/extending rawcopy plugin or writing similar
one.

> Do I need to add a new imager plugin to support writing raw images with
> non-zero padding and no partition table?  For U-Boot, do I add a new
> bootimg plugin?

This sounds reasonable. Can you create a bug for this in bugzilla to discuss design and implementation details?

--
Regards,
Ed

