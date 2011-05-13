Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QKp6C-0007ky-BH
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 11:55:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2011 02:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,363,1301900400"; 
   d="scan'208";a="1209451"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2011 02:53:06 -0700
Message-Id: <cover.1305279161.git.dexuan.cui@intel.com>
Old-Date: Fri, 13 May 2011 17:32:41 +0800
Date: Fri, 13 May 2011 17:53:37 +0800
To: openembedded-core@lists.openembedded.org, mark.hatle@windriver.com,
	qing.he@intel.com
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/1] [v2] Automatically generate package repos for rpm and deb [bug #1024]
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
X-List-Received-Date: Fri, 13 May 2011 09:55:56 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

This was made to address http://bugzilla.yoctoproject.org/show_bug.cgi?id=1024.
Please comment.

This version moved the package_update_index_* into package_*.bbclass.

As to RPM, both package_update_index_rpm(creating solvedb) and
createrepo(creating rpm-metadata) seems necessary.
Mark, please comment on this.

As to DEB, I found currently in target, some important config files, like
/etc/apt/sources.list, for deb/apt are missing. As a result, we can't
install/remove package in target at all.
I'm trying to resolve this by add "deb http://192.168.7.1/deb/all/ ./" into
the file, but later "apt-get update" failes -- it tries to find a file named
Packages.gz, but the direcory only has Packages.bz2. Not sure what's wrong. Investigating.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/package-index
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/package-index

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (1):
  package-index.bb: add support for deb and rpm.

 meta/classes/package_deb.bbclass        |    9 +++++++++
 meta/classes/package_ipk.bbclass        |   12 ++++++++++++
 meta/classes/package_rpm.bbclass        |    7 +++++++
 meta/recipes-core/meta/package-index.bb |    8 --------
 4 files changed, 28 insertions(+), 8 deletions(-)

-- 
1.7.2



