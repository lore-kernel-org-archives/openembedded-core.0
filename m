Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Suin0-0002Lx-2K
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:33:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2012 04:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="187588086"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2012 04:21:25 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 14:21:16 +0300
Message-Id: <cover.1343387245.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/6] relocatable SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 11:33:02 -0000

Hi,

This patchset adds relocatable SDK functionality. Instead of a tarball, the
output of "bitbake meta-toolchain/meta-toolchain-sdk" will be a self extracting
archive.

The user will then execute the .sh script and give it the target
directory for SDK installation (default is /opt/poky). The installer will then
extract the embedded tarball to the user provided location and will set up the
SDK: change the paths in the environment script, change the dynamic loader path
in all binaries and, also, change the ls.so.cache path in the dynamic loader
itself, together with the SYSDIR paths/lengths.

With that, no more root privileges are needed in order to install the SDK.

Thanks,
Laurentiu

The following changes since commit 651b223c5fc93c7504e304e954b9ae4640ed47c6:

  usbutils: avoid dependency on bash (2012-07-26 18:52:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/relocatable_sdk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/relocatable_sdk

Laurentiu Palcu (6):
  eglibc: relocatable SDK changes
  binutils: relocatable SDK: change PT_INTERP section size
  scripts: add script for relocating the SDK
  populate_sdk_base.bbclass: create self-extracting archive
  relocatable.bbclass: split it up, to reuse code
  package.bbclass: change RPATHs for nativesdk packages

 meta/classes/chrpath.bbclass                       |   89 +++++++++
 meta/classes/package.bbclass                       |    5 +
 meta/classes/populate_sdk_base.bbclass             |   82 ++++++++
 meta/classes/relocatable.bbclass                   |   91 +--------
 .../eglibc/eglibc-2.15/relocatable_sdk.patch       |   70 +++++++
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    6 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    5 +
 .../binutils/binutils/relocatable_sdk.patch        |   13 ++
 scripts/relocate_sdk.py                            |  200 ++++++++++++++++++++
 9 files changed, 470 insertions(+), 91 deletions(-)
 create mode 100644 meta/classes/chrpath.bbclass
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
 create mode 100755 scripts/relocate_sdk.py

-- 
1.7.9.5



