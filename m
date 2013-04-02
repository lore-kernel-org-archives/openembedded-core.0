Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UNA9A-0007ry-Dt
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 00:57:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Apr 2013 15:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,396,1363158000"; d="scan'208";a="311416305"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2013 15:40:32 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2013 15:42:48 -0700
Message-Id: <293e2e6b20a096d41ba43b70d6c3fec0d343d1ef.1364942359.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1364942359.git.dvhart@linux.intel.com>
References: <cover.1364942359.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/3] base-passwd: Add input group
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
X-List-Received-Date: Tue, 02 Apr 2013 22:58:01 -0000

Fixes [YOCTO 4164](1/3)

Add input group for the /dev/input/* devices. This is needed for
rootless X without adding a security hole by making the device o+rw.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Saul Wold <sgw@linux.intel.com>
---
 .../base-passwd/base-passwd-3.5.26/input.patch     |   22 ++++++++++++++++++++
 .../recipes-core/base-passwd/base-passwd_3.5.26.bb |    5 ++-
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/input.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.26/input.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.26/input.patch
new file mode 100644
index 0000000..f1bfc2f
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd-3.5.26/input.patch
@@ -0,0 +1,22 @@
+Add an input group for the /dev/input/* devices.
+
+Upstream-Status: Invalid [configuration]
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+---
+ group.master |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: base-passwd-3.5.26/group.master
+===================================================================
+--- base-passwd-3.5.26.orig/group.master
++++ base-passwd-3.5.26/group.master
+@@ -12,6 +12,7 @@ uucp:*:10:
+ man:*:12:
+ proxy:*:13:
+ kmem:*:15:
++input:*:19:
+ dialout:*:20:
+ fax:*:21:
+ voice:*:22:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
index febddcf..1c7e6b0 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
@@ -1,12 +1,13 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r1"
+PR = "r2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
-           file://nobash.patch"
+           file://nobash.patch \
+           file://input.patch"
 
 SRC_URI[md5sum] = "74245e5c21dc74d9675c77cd8dfa02e6"
 SRC_URI[sha256sum] = "258a78317aa563143d10375c6e1e63a60898e503887f00fffd70b6b297c1b429"
-- 
1.7.5.4



