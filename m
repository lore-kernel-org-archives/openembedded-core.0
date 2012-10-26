Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1TRlGo-0008IO-4a
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 16:52:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2012 07:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="232948455"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 26 Oct 2012 07:37:46 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.54])
	by linux.intel.com (Postfix) with ESMTP id 95B822C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 07:37:45 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 17:37:17 +0300
Message-Id: <040de77b972b11336e88c593cf2a7571977347db.1351261721.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
References: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
References: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
Subject: [PATCH 1/2] lsb_release: add sanity to avoid Unknown
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
X-List-Received-Date: Fri, 26 Oct 2012 14:52:22 -0000

Check for lsb_release command (package name should be lsb-release for
most package managers) to avoid "Unknown" Linux distributions, untested
distro warnings and "Unknown" dir in ./sstate-cache/
Also add lsb-release in host's software needs, Fedora and CentOS for now.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 documentation/poky.ent      | 4 ++--
 meta/classes/sanity.bbclass | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index 8e0af71..ae8e70e 100644
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -50,8 +50,8 @@
 <!ENTITY OE_INIT_FILE "oe-init-build-env">
 <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "awk wget git-core diffstat unzip texinfo build-essential chrpath">
 <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL "awk make wget tar bzip2 gzip python unzip perl patch diffutils diffstat git
-cpp gcc gcc-c++ eglibc-devel texinfo chrpath ccache">
+cpp gcc gcc-c++ eglibc-devel texinfo chrpath ccache lsb-release">
 <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget diffstat texinfo python-curses">
 <!ENTITY CENTOS_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip python unzip perl patch diffutils diffstat git
-cpp gcc gcc-c++ glibc-devel texinfo chrpath">
+cpp gcc gcc-c++ glibc-devel texinfo chrpath lsb-release">
 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3806bc5..f0cc11c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -2,7 +2,7 @@
 # Sanity check the users setup for common misconfigurations
 #
 
-SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
+SANITY_REQUIRED_UTILITIES ?= "bzip2 chrpath cpio diffstat gawk git gzip lsb_release makeinfo patch tar wget"
 
 python check_bblayers_conf() {
     bblayers_fn = os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
-- 
1.7.12.4



