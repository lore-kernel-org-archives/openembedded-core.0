Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Slnb9-0004bP-Uw
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:51:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q62KesZ5022802
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 13:40:54 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 2 Jul 2012 13:40:53 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jul 2012 15:50:27 -0500
Message-ID: <cover.1341262097.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/7 v3] Enable the ability to create an image matching SDK
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
X-List-Received-Date: Mon, 02 Jul 2012 20:51:56 -0000
Content-Type: text/plain

Rebased and patch 7/7 added to correct an oversight in base.bbclass.

--- v2

Only difference is patch 1/6, I accidently sent and older broken version of the
patch.  This is the correct version.

--- v1

After this series of patches, it is possible to generate an SDK that 
matches the image.  The SDK and all related code is only activated if an image
recipe is built using the "populate_sdk" task, such as:

bitbake core-image-sato -c populate_sdk

Existing SDK images, such as meta-toolchain or meta-toolchain-gmae continue to
work without modifications.

The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:

  package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS (2012-07-02 16:44:57 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/sdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk

Mark Hatle (7):
  Fix manual log file paths
  populate_sdk.bbclass: Split into two parts
  populate_sdk: Allow for attempt only packages in the SDK
  populate_sdk_base.bbclass: Change to using task specific depends
  populate_sdk: enable basic multilib support
  image.bbclass: Add support to build the SDK in parallel with the
    image
  base.bbclass: Add cross-canadian-${TRANSLATED_TARGET_ARCH} to the
    license exclusion list

 meta/classes/base.bbclass              |    2 +-
 meta/classes/image.bbclass             |    7 ++-
 meta/classes/package_deb.bbclass       |    4 +-
 meta/classes/package_ipk.bbclass       |    2 +-
 meta/classes/package_rpm.bbclass       |   10 +-
 meta/classes/populate_sdk.bbclass      |   91 +---------------------
 meta/classes/populate_sdk_base.bbclass |  128 ++++++++++++++++++++++++++++++++
 meta/classes/populate_sdk_deb.bbclass  |    6 +-
 meta/classes/populate_sdk_ipk.bbclass  |    5 +-
 meta/classes/populate_sdk_rpm.bbclass  |    4 +-
 meta/classes/rootfs_deb.bbclass        |    2 +
 meta/classes/rootfs_ipk.bbclass        |    2 +
 meta/classes/toolchain-scripts.bbclass |   16 +++--
 13 files changed, 171 insertions(+), 108 deletions(-)
 create mode 100644 meta/classes/populate_sdk_base.bbclass

-- 
1.7.3.4



