Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QMgYX-0000ib-FE
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:12:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 May 2011 06:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,231,1304319600"; d="scan'208";a="438255412"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2011 06:09:57 -0700
Message-Id: <cover.1305722976.git.dexuan.cui@intel.com>
Old-Date: Wed, 18 May 2011 20:49:36 +0800
Date: Wed, 18 May 2011 21:10:22 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/1][v3] Automatically generate package repos for rpmand deb [bug #1024]
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
X-List-Received-Date: Wed, 18 May 2011 13:12:53 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

This was made to address http://bugzilla.yoctoproject.org/show_bug.cgi?id=1024.

Thanks a lot to RP and Saul's suggestions, the patch becomes much cleaner now.

As to DEB, I found currently in target, some important config files, like
/etc/apt/sources.list, for deb/apt are missing. As a result, we can't
install/remove package in target at all.
I tried to resolve this by add "deb http://192.168.7.1/deb/all/ ./" into
target's /etc/apt/sources.list, but later "apt-get update" failes -- it
tries to find a file named Packages.gz, but the direcory only has
Packages.bz2 -- not sure why apt-get here doesn't try to find Packages.bz2
when it can't find Packages.gz and do_rootfs does succeed with Packages.bz2.
Later after I tried to manually generate Packages.gz from Packages.bz2 and did
"mkdir -p /var/cache/apt/archives/partial/; mkdir -p /var/log/apt/",
"apt-get update" and "apt-get remove" finally can work, but "apt-get install"
could still fail: "package architecture (arm) does not match system (armel)".
The issues need more effort to be fixed.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/master
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (1):
  package-index.bb: add support for deb and rpm.

 meta/classes/package_deb.bbclass        |    9 +++++++++
 meta/classes/package_ipk.bbclass        |    9 +++++++++
 meta/classes/package_rpm.bbclass        |    9 +++++++++
 meta/recipes-core/meta/package-index.bb |    6 ++----
 4 files changed, 29 insertions(+), 4 deletions(-)

-- 
1.7.2



