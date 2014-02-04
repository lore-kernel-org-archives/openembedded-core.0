Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AB5EF6E44F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 15:34:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Feb 2014 07:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,780,1384329600"; d="scan'208";a="475825044"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2014 07:34:16 -0800
Date: Tue, 4 Feb 2014 17:34:16 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Message-ID: <20140204153414.GD5112@lpalcu-linux>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
	<52EFA891.7060806@enea.com> <20140203164718.GA5112@lpalcu-linux>
	<52F0F464.5060107@enea.com> <52F0FDF5.8000603@enea.com>
MIME-Version: 1.0
In-Reply-To: <52F0FDF5.8000603@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/49] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Tue, 04 Feb 2014 15:34:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 04, 2014 at 03:49:25PM +0100, David Nyström wrote:
> 
> Oops, bug on my behalf in above example, but it still fails the same
> way when using a correct IPK_FEED_URI.
> 
> IPK_FEED_URIS += " \
>            all##file:///media/sdb5/repo/build/tmp/deploy/ipk/all \
> 	   ${MACHINE}##file:///media/sdb5/repo/build/tmp/deploy/ipk/${MACHINE} \
> 
> ${TARGET_ARCH}##file:///media/sdb5/repo/build/tmp/deploy/ipk/${TARGET_ARCH}
> \
> 	   "
Ok, I succeeded to check this in master. Apparently, I understood this
wrong. In my tests I was deleting the tmp/ and sstate-cache/ and I was
not expecting the target packages to be re-built. It turns out that this
entire process takes place but when the rootfs is created, the provided
feeds are used... I learned something new today! :)

Regarding the refactored code, indeed, it does not work in this case. It
always tries to create the index files in the deploy/ipk directory
before continuing with the rootfs creation. I guess a condition should
be added in the new code to check for BUILD_IMAGES_FROM_FEEDS and skip
the index creation step... Shouldn't be hard to fix.

laurentiu

