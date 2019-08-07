Return-Path: <ricardo.neri-calderon@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Aug 2019 01:52:11 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C82427E668
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 01:52:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 18:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="185841484"
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2019 18:45:05 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 18:44:34 -0700
Message-Id: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/5] ovmf: Bump to edk2-stable201905 and add improvements
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
X-List-Received-Date: Wed, 07 Aug 2019 01:52:12 -0000

Hi,

Fixes [YOCTO #13438]

I have implemented this patchset to bump the OVMF recipe to the latest
stable release of OVMF: edk2-stable201905. I continued Ross Burton's
initial work to update the recipe [1].

The majority of the patches we were carrying with the recipe have been
taken upstream in EDK2 and I have removed them. Plus, EDK2 now adds
openssl as a git submodule and not a patching script. Thus, I removed
support for this script and switched to the gitsm bitbake fetcher.

Also, now the EnrollDefaultKeys EFI application requires a separate
Platform Key and first Key Exchange Key certificate instead of an
hard-coded certificate embedded in the application. The hypervisor shall
pass this certificated to EnrollDefaultKeys via the Type 11 SMBus table.
I have updated the ovmf recipe to create the needed certificate and
also updated runqemu to provide such certificate when using an OVMF
binary with support for Secure Boot.

Lastly, I defined the recipe's PV and took Ross' change to use python3
from HOSTTOOLS.

Thanks and BR,
Ricardo

[1]. http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/nopy2&id=f95649176b7916116251a092a82618dd08ff1961

Ricardo Neri (5):
  ovmf: Update to version edk2-stable201905
  ovmf: Set PV
  ovmf: use HOSTTOOLS' python3
  ovmf: Generate test Platform key and first Key Exchange Key
  runqemu: Add support to handle EnrollDefaultKeys PK/KEK1 certificate

 ....makefile-add-Wno-stringop-truncatio.patch |   71 --
 .../ovmf/ovmf/0001-ia32-Dont-use-pie.patch    |   46 -
 ...ols-header.makefile-add-Wno-restrict.patch |  102 --
 ....makefile-revert-gcc-8-Wno-xxx-optio.patch |   53 -
 ...ile-adjust-to-build-in-under-bitbake.patch |   33 +-
 ...-silence-false-stringop-overflow-war.patch |   66 -
 ...faultKeys-application-for-enrolling-.patch | 1124 -----------------
 .../ovmf/no-stack-protector-all-archs.patch   |   26 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |   40 +-
 scripts/runqemu                               |   32 +
 10 files changed, 90 insertions(+), 1503 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch

-- 
2.20.1


