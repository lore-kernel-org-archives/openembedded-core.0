Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYWx8-00031h-8U
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 06:55:30 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Dec 2011 21:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83495556"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 07 Dec 2011 21:48:35 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	hjl.tools@gmail.com
Date: Wed,  7 Dec 2011 21:48:28 -0800
Message-Id: <ab9eb1bda82bc5924f06c97c10d5be9853bbf7db.1323323130.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
References: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
Subject: [PATCH 06/11] mesa: Properly create share library for x32
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
X-List-Received-Date: Thu, 08 Dec 2011 05:55:30 -0000

From: "H.J. Lu" <hjl.tools@gmail.com>

Also pass -mx32 parameter to gcc to create create share library
for x32.

Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-Off-By: H.J. Lu <hjl.tools@gmail.com>
---
 .../mesa/mesa/mesa_fix_for_x32.patch               |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
index 22a2339..dfd67fe 100644
--- a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
+++ b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
@@ -4,10 +4,10 @@ get correct compiler options for x32 gcc.
 
 Received this patch from H.J. Lu <hjl.tools@gmail.com>
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/06
 
---- Mesa-7.11/bin/mklib.x32	2011-11-30 14:29:14.976465283 -0800
-+++ Mesa-7.11/bin/mklib	2011-11-30 14:32:48.591525193 -0800
+--- Mesa-7.11/bin/mklib.x32	2011-12-06 13:15:17.968695114 -0800
++++ Mesa-7.11/bin/mklib	2011-12-06 13:17:13.872152249 -0800
 @@ -335,7 +335,12 @@ case $ARCH in
  	    set ${OBJECTS}
  	    ABI32=`file $1 | grep 32-bit`
@@ -22,3 +22,17 @@ Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
  	    fi
  
              if [ "${ALTOPTS}" ] ; then
+@@ -392,7 +397,12 @@ case $ARCH in
+ 	    set ${OBJECTS}
+ 	    ABI32=`file $1 | grep 32-bit`
+ 	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-		OPTS="-m32 ${OPTS}"
++		ABIX32=`file $1 | grep x86-64`
++		if [ "${ABI32}" ]; then
++		    OPTS="-mx32 ${OPTS}"
++		else
++		    OPTS="-m32 ${OPTS}"
++		fi
+ 	    fi
+             if [ "${ALTOPTS}" ] ; then
+                 OPTS=${ALTOPTS}
-- 
1.7.6.4



