Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TftFw-0000Sj-19
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:13:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2012 05:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="226378546"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 05:59:27 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Tue,  4 Dec 2012 15:59:07 +0200
Message-Id: <cover.1354626535.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/5] Postinstall improvements
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
X-List-Received-Date: Tue, 04 Dec 2012 14:13:52 -0000

Hi,

This is the former RFC that was on the mailing list a couple of months ago.
Hopefully, this time the patches will make it in since last time the release
was to close to have these changes in.

So, the main improvement this patchset brings is running the icon cache
generation on host, at rootfs time, after all packages have been installed. This
will cut off a lot from the target's first boot time. Also, postinstalls for
gconf and gdk-pixbuf were also changed to run on host at rootfs time.

With these changes, just a handful of packages will need to run the postinstalls
on target (did the tests with core-image-sato). I prefer to approach the
remaining packages one by one.

My preliminary tests show no issues but, since there are lots of setups out there,
testing is always welcomed. Andreas, I know you have such a setup, could you take
these patches for a spin if you find some time?

Thanks,
Laurentiu

The following changes since commit da6c266b1184eed8b1bc851f24a9ee17ab56d562:

  xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions (2012-12-03 16:38:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/postinst
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/postinst

Laurentiu Palcu (5):
  image.bbclass: run postinst scripts once, at rootfs time
  rootfs generation: export two new variables to postinst scriptlets
  gtk-icon-cache: run the icon generation at rootfs time
  gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
  gconf.bbclass: run postinstalls at rootfs time

 meta/classes/gconf.bbclass                         |   11 +++++++----
 meta/classes/gtk-icon-cache.bbclass                |   18 ++++++++++++++----
 meta/classes/image.bbclass                         |   20 +++++++++++++++++---
 meta/classes/package_rpm.bbclass                   |    2 ++
 meta/classes/rootfs_deb.bbclass                    |    2 ++
 meta/classes/rootfs_ipk.bbclass                    |    2 ++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   17 +++++++++++++++--
 7 files changed, 59 insertions(+), 13 deletions(-)

-- 
1.7.9.5



