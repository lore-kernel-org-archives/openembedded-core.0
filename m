Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C76B6D571
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:23:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD1NsnP021590
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:23:54 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 12 Nov 2013 17:23:54 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 19:23:19 -0600
Message-ID: <cover.1384305535.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/6] Misc changes relating to toolchain and image gen
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
X-List-Received-Date: Wed, 13 Nov 2013 01:23:53 -0000
Content-Type: text/plain

A few misc fixes relating to toolchain and image generation.

The first two in the set simply updated gcc to remove the -symlinks package
in favor of update-alternatives.

The next fixes an issue w/ the previous binutils patch and upgrades.

Next 2 update packagegroups to make revise and use the 
packagegroup-core-buildessentials.

The final patch fixes an issue w/ the image generatation.  If the 
IMAGE_INSTALL contains a dependency instead of a package name, the system
was not able to translate it into a package.  This now works properly.

Note, there is a case where an unresolvable set could be determined (rare,
but it is possible), in this case the user would need to add whatever is
required to fix it to the IMAGE_INSTALL.  (This could happen when 2 or more
conflicting packages all have the same provide, but none of them are in
the IMAGE_INSTALL line.  The system will attempt to determine which to
use, by checking if any of them are already in the IMAGE_INSTALL -- otherwise
it chooses the first entry.  If something else implied by a packagegroup
chooses a different version, a conflict would be generated.)

The following changes since commit 616354f13732d13c17434d5b60b166f691c25761:

  binutils: Add gnu-config-native to DEPENDS (2013-11-12 16:00:20 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/misc1
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc1

Mark Hatle (6):
  gcc: Use alternatives for the *-symlinks packages.
  gcc: Drop *-symlinks
  binutils: Ensure old -symlinks packages get removed
  packagegroups: Remove toolchain *-symlinks packages
  packagegroup-self-hosted: Use packagegroup-core-buildessentials
  package_rpm: Allow translation of requirement to package name

 meta/classes/package_rpm.bbclass                   |  79 +++++++++++++++-
 .../packagegroup-core-buildessential.bb            |   4 -
 .../packagegroups/packagegroup-self-hosted.bb      |  16 +---
 meta/recipes-devtools/binutils/binutils.inc        |   1 +
 meta/recipes-devtools/gcc/gcc-target.inc           | 103 +++++++++++++--------
 5 files changed, 141 insertions(+), 62 deletions(-)

-- 
1.8.1.2.545.g2f19ada


