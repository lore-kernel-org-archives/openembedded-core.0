Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7494F6D2C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 07:27:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2013 00:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426317657"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 00:27:31 -0700
Date: Tue, 29 Oct 2013 09:27:30 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Chris Patterson <cjp256@gmail.com>
Message-ID: <20131029072729.GB6291@lpalcu-linux>
References: <1381882516-29599-1-git-send-email-cjp256@gmail.com>
	<5268DEE0.7000506@linux.intel.com>
	<CABZSBQepb=+J-OSGkD7Kt-u9sZU0eLJ+-NSqZS-np9tp6xc2RQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABZSBQepb=+J-OSGkD7Kt-u9sZU0eLJ+-NSqZS-np9tp6xc2RQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 1.6.1
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
X-List-Received-Date: Tue, 29 Oct 2013 07:27:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

On Mon, Oct 28, 2013 at 07:54:51PM -0400, Chris Patterson wrote:
> 
> I'm not terribly familiar with the nativesdk, and (foolishly) neglected to test
> that.  However, I looked into it, and it looks like the relocatable_sdk.patch
> affects a linker script that is no longer available.  I dropped the patch and
> tested installing an oe-core sdk sysroot (via bitbake -c populate_sdk
> core-image-minimal) and qemu appears to work fine from within the sdk
> environment.
> 
> I'm open to suggestions for further testing this upgrade (particularly a case
> to cover what relocatable_sdk.patch was originally intended to resolve). I'm
> certainly not the expert here, but am willing to help out.
> 
To test this particular case, build meta-toolchain and install it in a
different location than the default one. Then, just do a 'readelf -s"
on any qemu binary and make sure the .interp section has a size of 0x1000 bytes.

If it does, then it's ok to drop the patch. That patch was needed
because qemu happened to use their own linker scripts and, in order to
have the SDK relocatable, we needed to reseve space in the .interp
section to squeeze the new path.

Laurentiu

