Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 756F771F50
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 17:14:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Nov 2014 09:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,313,1413270000"; d="scan'208";a="631275678"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2014 09:14:27 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:14:52 -0600
Message-Id: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv2 0/8] license_class: Added support for LICENSE_PRIORITY in manifest creation
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
X-List-Received-Date: Tue, 04 Nov 2014 17:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The major change is when you have OR'ed LICENSE only one is choose according
LICENSE_PRIORITY preferences if LICENSE_PRIORITY isn't specified the left one
is choosen.

Some minor changes was done in the core/packagegroups and glibc-locale recipes
adding LIC_FILES_CHECKSUM to avoid warnings in manifest creation.

The test was done building qemux86/core-image-sato with and without these set of
patches and then run diff recursive under common-licenses created directory.

You can find a tarball with common-license directories, resulted diff and 
local.conf at:

https://bugzilla.yoctoproject.org/attachment.cgi?id=2223

Aníbal Limón (8):
  license_class: Reimplemented manifest creation in python
  license_class: Added support for INCOMPATIBLE_LICENSE into
    license_create_manifest
  license_class: Added LICENSE_PRIORITY support
  license_class: Fix remove + trim in license_create_manifest.
  license_class: license_manifest_creation improvment copying licenses
    to target
  license_class: license_create_manifest improve package file read
  packagegropups: Added LIC_FILES_CHKSUM with MIT license to avoid    
    warning when create license manifest.
  glibc-locale: Added LIC_FILES_CHKSUM for avoid warnings in license    
    manifest creation.

 meta/classes/license.bbclass                       | 236 +++++++++++++--------
 meta/conf/documentation.conf                       |   1 +
 meta/recipes-core/glibc/glibc-collateral.inc       |   2 +
 .../nativesdk-packagegroup-sdk-host.bb             |   1 +
 .../packagegroups/packagegroup-base.bb             |   1 +
 .../packagegroups/packagegroup-core-boot.bb        |   1 +
 .../packagegroup-core-buildessential.bb            |   1 +
 .../packagegroup-core-eclipse-debug.bb             |   1 +
 .../packagegroups/packagegroup-core-nfs.bb         |   1 +
 .../packagegroups/packagegroup-core-sdk.bb         |   1 +
 .../packagegroup-core-ssh-dropbear.bb              |   1 +
 .../packagegroups/packagegroup-core-ssh-openssh.bb |   1 +
 .../packagegroup-core-standalone-sdk-target.bb     |   1 +
 .../packagegroups/packagegroup-core-tools-debug.bb |   1 +
 .../packagegroup-core-tools-profile.bb             |   1 +
 .../packagegroup-core-tools-testapps.bb            |   1 +
 .../packagegroups/packagegroup-cross-canadian.bb   |   1 +
 .../packagegroups/packagegroup-self-hosted.bb      |   1 +
 .../packagegroup-core-device-devel.bb              |   1 +
 .../packagegroup-core-full-cmdline.bb              |   1 +
 .../packagegroups/packagegroup-core-lsb.bb         |   1 +
 .../packagegroups/packagegroup-core-clutter.bb     |   1 +
 .../packagegroups/packagegroup-core-directfb.bb    |   1 +
 .../packagegroups/packagegroup-core-x11-base.bb    |   1 +
 .../packagegroups/packagegroup-core-x11-xserver.bb |   1 +
 .../packagegroups/packagegroup-core-x11.bb         |   1 +
 .../nativesdk-packagegroup-qt-toolchain-host.inc   |   1 +
 .../packagegroups/packagegroup-core-qt.bb          |   1 +
 .../packagegroups/packagegroup-core-qt4e.bb        |   1 +
 .../packagegroup-qt-toolchain-target.inc           |   1 +
 .../packagegroups/packagegroup-core-x11-sato.bb    |   1 +
 31 files changed, 180 insertions(+), 87 deletions(-)

-- 
1.9.1


