Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2CE57E8B7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 22:02:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2019 13:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="203318381"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
	by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2019 13:18:47 -0700
Date: Wed, 7 Aug 2019 13:18:05 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190807201804.GA5857@ranerica-svr.sc.intel.com>
References: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<6832330c6d1ccc57020c0a2916e8309468b5b196.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <6832330c6d1ccc57020c0a2916e8309468b5b196.camel@linuxfoundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] ovmf: Bump to edk2-stable201905 and add improvements
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
X-List-Received-Date: Wed, 07 Aug 2019 22:02:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2019 at 07:36:26PM +0100, Richard Purdie wrote:
> On Tue, 2019-08-06 at 18:44 -0700, Ricardo Neri wrote:
> > Hi,
> > 
> > Fixes [YOCTO #13438]
> > 
> > I have implemented this patchset to bump the OVMF recipe to the
> > latest
> > stable release of OVMF: edk2-stable201905. I continued Ross Burton's
> > initial work to update the recipe [1].
> > 
> > The majority of the patches we were carrying with the recipe have
> > been
> > taken upstream in EDK2 and I have removed them. Plus, EDK2 now adds
> > openssl as a git submodule and not a patching script. Thus, I removed
> > support for this script and switched to the gitsm bitbake fetcher.
> > 
> > Also, now the EnrollDefaultKeys EFI application requires a separate
> > Platform Key and first Key Exchange Key certificate instead of an
> > hard-coded certificate embedded in the application. The hypervisor
> > shall
> > pass this certificated to EnrollDefaultKeys via the Type 11 SMBus
> > table.
> > I have updated the ovmf recipe to create the needed certificate and
> > also updated runqemu to provide such certificate when using an OVMF
> > binary with support for Secure Boot.
> > 
> > Lastly, I defined the recipe's PV and took Ross' change to use
> > python3
> > from HOSTTOOLS.
> 
> Thanks for the patches. I can't get the to apply at all. I know we have
> problems due to the line endings in ovmf and the mailing list is
> probably messing them up. Could you share a git tree with the patches
> in somewhere please?

Thanks for considering the patches, Richard! You can pull the patches
from here:

The following changes since commit 96decf673992b1cd1eebac45a5cd534eef27ebd7:

  waffle: upgrade 1.5.2 -> 1.6.0 (2019-08-07 16:08:08 +0100)

are available in the Git repository at:

  https://github.com/ricardon/openembedded-core.git rneri/ovmf_updates

for you to fetch changes up to e81cf432b29056dda5496a5454fdfb9cc15dc2fa:

  runqemu: Add support to handle EnrollDefaultKeys PK/KEK1 certificate (2019-08-07 13:09:32 -0700)

----------------------------------------------------------------
Ricardo Neri (5):
      ovmf: Update to version edk2-stable201905
      ovmf: Set PV
      ovmf: Use HOSTTOOLS' python3
      ovmf: Generate test Platform key and first Key Exchange Key
      runqemu: Add support to handle EnrollDefaultKeys PK/KEK1 certificate

 .../ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch   |   71 ---
 meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch                   |   46 --
 .../ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch        |  102 ---
 .../ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch   |   53 --
 .../ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch    |   33 +-
 .../ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch   |   66 --
 .../ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch   | 1124 ---------------------------------
 meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch             |   26 +-
 meta/recipes-core/ovmf/ovmf_git.bb                                         |   40 +-
 scripts/runqemu                                                            |   32 +
 10 files changed, 90 insertions(+), 1503 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch

Thanks and BR,
Ricardo

