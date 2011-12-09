Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZ5Db-000497-Ab
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 19:30:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 10:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100564247"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 10:23:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  9 Dec 2011 10:23:42 -0800
Message-Id: <16829a23671d57e0045978576600f527c53fc349.1323454935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/15] mesa: Properly create share library for x32
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
X-List-Received-Date: Fri, 09 Dec 2011 18:30:47 -0000

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



