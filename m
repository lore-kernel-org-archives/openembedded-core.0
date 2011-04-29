Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QFkZE-0003xi-Ht
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 12:04:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Apr 2011 03:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,286,1301900400"; d="scan'208";a="427686463"
Received: from unknown (HELO helios) ([10.255.12.245])
	by azsmga001.ch.intel.com with SMTP; 29 Apr 2011 03:02:20 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 29 Apr 2011 11:02:15 +0100
Message-Id: <5034751978f76c713d2ece1118a6a7e9fd14e5e3.1304069968.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1304069968.git.paul.eggleton@linux.intel.com>
References: <cover.1304069968.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 10:33:32 +0100
Date: Fri, 29 Apr 2011 11:02:15 +0100
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] netbase: fix check for nfsroot in if-pre-up.d script
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
X-List-Received-Date: Fri, 29 Apr 2011 10:04:56 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

The if-pre-up.d/nfsroot script was no longer functioning correctly due to
a change in iproute2's installation of the "ip" executable. The script will
now function correctly regardless of whether ip is in /bin or /sbin.

Fixes [YOCTO #1006].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/netbase/netbase-4.45/nfsroot |    2 +-
 meta/recipes-core/netbase/netbase_4.45.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase-4.45/nfsroot b/meta/recipes-core/netbase/netbase-4.45/nfsroot
index fc384a8..750c0a9 100644
--- a/meta/recipes-core/netbase/netbase-4.45/nfsroot
+++ b/meta/recipes-core/netbase/netbase-4.45/nfsroot
@@ -27,7 +27,7 @@ exec 0<&9 9<&-
 
 test $nfsroot -eq 0 && exit 0
 
-if test -x /sbin/ip ; then
+if [ -x /bin/ip -o -x /sbin/ip ] ; then
     nfs_iface=`ip route get $nfs_addr | grep dev | sed -e 's/^.*dev \([-a-z0-9.]*\).*$/\1/'`
 fi
 
diff --git a/meta/recipes-core/netbase/netbase_4.45.bb b/meta/recipes-core/netbase/netbase_4.45.bb
index 68cde85..319afa7 100644
--- a/meta/recipes-core/netbase/netbase_4.45.bb
+++ b/meta/recipes-core/netbase/netbase_4.45.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r0"
+PR = "r1"
 
 inherit update-rc.d
 
-- 
1.7.1



