Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJB-0001in-Qd
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2011 16:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="687688429"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2011 16:44:34 -0700
Message-Id: <652c6cefcc6cfa4d84196f58602697175acb8d59.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 10:33:32 +0100
Date: Tue, 03 May 2011 16:44:34 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 10/33] netbase: fix check for nfsroot in if-pre-up.d script
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
X-List-Received-Date: Tue, 03 May 2011 23:47:14 -0000

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
1.7.4.1



