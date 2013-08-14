Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 513BF61DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTIbv013977
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:29:18 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:17 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:29:58 -0500
Message-ID: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 00/11] Update the way we control the construction of filesystems
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:18 -0000
Content-Type: text/plain

As part of the work for the Yocto Project bug # 4079, we need a way to exclude
various packages from being installed into the image.  There are three 
mechanisms in place after these patches BAD_RECOMMENDATIONS, NO_RECOMMENDATIONS,
and PACKAGE_EXCLUDE>

There was an existing mechanism called "BAD_RECOMMENDATIONS" that has previous 
been extended for rpm(smart).  Debian(apt-get) does not appear to be capable of 
BAD_RECOMEMNDATIONS, so a warning was added that it will be ignored.

NO_RECOMMENDATIONS allows for the package manager to completely ignore 
recommended packages during install.  This has a side effect of NOT installing
kernel modules in many cases, as the kernel modules are listed as recommended
packages.  If the user uses NO_RECOMMENDATIONS, they are responsible for 
adding packages to the IMAGE_INSTALL as needed. (Works in all three package
types.)

PACKAGE_EXCLUDE is a mechanism for preventing packages from being installed
at all.  If the package is in the PACKAGE_INSTALL or PACKAGE_INSTALL_ATTEMPTONLY
it will be filtered out, and a warning issued.  During filesystem construction
if a required package was excluded an error will be generated explaining to
the end user the image couldn't be generated and which package had the 
dependency on the excluded component. (Works in all three package types.)

The patches are available at: 
git://git.yoctoproject.org/poky-contrib mhatle/oe-core-remove

Mark Hatle (11):
  image.bbclass: Add basic support for PACKAGE_EXCLUDE
  python-smartpm: Add support for excluding package from the install
  package_rpm.bbclass:  Add support for PACKAGE_EXCLUDE to RPM installs
  python-smartpm: Add support to disable installing recommends
  package_rpm.bbclass: NO_RECOMMENDATIONS support
  package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
  package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
  opkg: Add --no-install-recommends option.
  package_ipk: Add support for NO_RECOMMENDATIONS
  opkg: Add support for excluding packages from the install
  package_ipk: Add support for PACKAGE_EXCLUDE

 meta/classes/image.bbclass                         | 39 ++++++---
 meta/classes/package_deb.bbclass                   | 34 +++++---
 meta/classes/package_ipk.bbclass                   |  2 +
 meta/classes/package_rpm.bbclass                   |  8 ++
 meta/classes/rootfs_deb.bbclass                    |  8 +-
 meta/conf/bitbake.conf                             |  1 +
 meta/conf/documentation.conf                       |  9 ++
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  | 99 ++++++++++++++++++++++
 .../opkg/opkg/no-install-recommends.patch          | 78 +++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |  5 +-
 .../smart-config-ignore-all-recommends.patch       | 24 ++++++
 .../smart-flag-exclude-packages.patch              | 70 +++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  2 +
 13 files changed, 354 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/add-exclude.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch

-- 
1.8.1.2.545.g2f19ada


