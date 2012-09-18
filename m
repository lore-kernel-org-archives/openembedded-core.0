Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TDzzT-0001t6-Pa
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 17:45:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8IFWsBt001594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:32:54 -0700 (PDT)
Received: from usp-ub10.wrs.com (128.224.163.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 18 Sep 2012 08:32:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 23:25:09 +0800
Message-ID: <cover.1347976732.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] opkg svn: respect to the arch priority
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 15:45:36 -0000
Content-Type: text/plain

After the discussion, this seems a proper solution:

Let the arch priority win the higher version by default, and add an
option (--select-higher-version) for it to make the higher version win
the arch priority, so that the user can have another choice.

This is only for opkg_svn.bb, maybe the opkg_0.1.8.bb should be removed
since it does work on the master branch:
- It doesn't support the "--force_postinstall" option which is used by
  package_ipk.bbclass.

- It still doesn't work after remove the "--force_postinstall" option,
  it can't install the packages in complementary_pkgs.txt, I haven't
  found out the reason.

  I'd like to remove it.

* Test info
  - With MACHINE= "qemux86"
  $ bitbake core-image-sato
  - With MACHINE= "crownbay"
  $ bitbake core-image-sato

  The "xserver-xorg*_1.9.3-r1_core2.ipk" will be installed to the
  crownbay's image. It would install the "xserver-xorg*_1.11.2-r7_i586.ipk"
  in the past.

  - Simulate the upgrade command:

  > Update the list:
  $ ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
/buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
-o /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs update

  > Test the upgrade command:
  $ ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f
/buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
-o /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs upgrade 
  # Nothing has been done

  > Test the --select-higher-version
  $ ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f
/buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf
-o /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs \
--select-higher-version upgrade
  # The "xserver-xorg*_1.9.3-r1_core2.ipk" would be upgraded to
	"xserver-xorg*_1.11.2-r7_i586.ipk".

  $ runqemu qemux86
  The image started, and run the "opkg-cl" command in qemu, it worked well.

// Robert

The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:

  upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/ipk_arch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ipk_arch

Robert Yang (1):
  opkg svn: respect to the arch priority

 .../opkg/opkg/select_higher_version.patch          |  102 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 2 files changed, 104 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/select_higher_version.patch



