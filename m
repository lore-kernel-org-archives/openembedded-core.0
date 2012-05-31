Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Sa6Hg-0000FB-3z
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 16:23:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4VED7BM015480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 07:13:07 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 31 May 2012 07:13:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 22:13:31 +0800
Message-ID: <cover.1338434706.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] V2 opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Thu, 31 May 2012 14:23:28 -0000
Content-Type: text/plain

* Changes of V2:
  - Add the test plan and more explanations in the cover letter as Saul suggested.

* Test info (PACKAGE_CLASSES = "package_ipk")
  - Test to make sure the bug has been fixed
    1) bitbake core-image-sato-sdk with MACHINE=qemux86
    2) bitbake core-image-sato with MACHINE=crownbay

    === Test result:
    Without this patch, the xserver-xorg-*_1.11.2-r3_i586.ipk would be
    install to the crownbay's image, this is incorrect since what
    crownbay needs are xserver-xorg*_1.9.3-r1.core2.ipk, the core2 pkgs
    would be installed correctly on crownbay's image. And check
    tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/temp/log.do_rootfs,
    no i586 pkgs should be installed.

  - Test the upgrade (with nothing changed in the feeds)
    # opkg update
    1) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs update

    # opkg upgrade
    2) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs upgrade

    === Test result:
    Nothing to do though there are xserver-xorg-*_1.11.2-r3_i586.ipk
    which have a higher version than the installed
    xserver-xorg*_1.9.3-r1.core2.ipk, becuase the priority of
    i586 is lower than core2 in core2's image.

  - Test the installation
    # opkg remove
    1) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs \
       remove --force-depends xserver-xorg

    # opkg install
    2) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs \
       install xserver-xorg

    === Test result:
    The xserver-xorg_1.9.3-r1_core2.ipk will be installed, the
    reason is the same as the previous one

* More explanations

  This patch only affects it's good_pkg_by_name behaviour, Here are its
  selecting priorities: (From high to low)
  
  1, The pkg set manually
  2, The good_pkg_by_name
  3, The held pkg
  4, Choose the higher arch one
  5, Use the latest one
  
  If of them is matched, then the left ones would be ignored, for
  example, if the first one matches, others would be ignored.
      
  This patch affects the second one(good_by_pkg_name), what it did in
  the past: If there are both core2/pkg-1.0.apk and i586/pkg-1.1.apk
  match, it would use i586/pkg-1.1.apk since its version is higher and
  ignore the arch priorities, but we have set the arch priorities in
  opkg.conf clearly:
  
  arch i586 31
  arch core2 41
  
  What we need is core2/pkg-1.0.apk since we may set the specific pkg
  version for the board (for example, the xorg-server for crownbay), let
  it respect to the arch priorities in such a case.

* Both rpm(fixed) and ipk have the similar issue, dpkg is OK.

* TODO
  - In the following upgrade scene (with pkg changed in the feeds)
    # opkg remove
    1) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs \
       remove --force-depends xserver-xorg
    # Remove xserver-xorg_1.9.3-r1_core2.ipk to make
    # xserver-xorg_1.11.2-r3_i586.ipk install to the image.
    2) mv tmp/deploy/ipk/core2/xserver-xorg_1.9.3-r1_core2.ipk tmp/bak/
    # Run opkg-make-index to re-create the feeds
    3) ./tmp/sysroots/i686-linux/usr/bin/opkg-make-index \
       -r tmp/deploy/ipk/core2/Packages \
       -p tmp/deploy/ipk/core2/Packages \
       -m tmp/deploy/ipk/core2
    # Install xserver-xorg_1.11.2-r3_i586.ipk
    4) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs \
       install xserver-xorg
    # Add xserver-xorg_1.9.3-r1_core2.ipk back to the feeds
    5) mv tmp/bak/xserver-xorg_1.9.3-r1_core2.ipk tmp/deploy/ipk/core2/
    # Run opkg-make-index to re-create the feeds
    6) ./tmp/sysroots/i686-linux/usr/bin/opkg-make-index \
       -r tmp/deploy/ipk/core2/Packages \
       -p tmp/deploy/ipk/core2/Packages \
       -m tmp/deploy/ipk/core2
    # opkg update
    7) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs update
    # opkg upgrade
    8) ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
       /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
       -o /path/to/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs upgrade

    Nothing will be done currently, since the opkg_upgrade.c will check
    the version again before really download the pkg and upgrade it,
    I'm not sure whether this is what we need, if we think that it is
    better, I'd like to work on it in another patch. There is another
    way to achieve:
    opkg install --force-downgrade xserver-xorg

    Then the xserver-xorg_1.9.3-r1_core2.ipk will be installed.

// Robert

The following changes since commit 363424cdc78cafa278008f973c2b4288297ebf8c:

  image.bbclass: Ensure ${S} is cleaned at the start of rootfs generation (2012-05-25 11:28:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/ipk_arch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ipk_arch

Robert Yang (1):
  opkg 0.1.8: respect to the arch when choose the alternatives

 .../opkg/opkg/respect-to-arch.patch                |   47 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    3 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 3 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/respect-to-arch.patch



