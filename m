Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoO9-00085Q-So
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115402"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:40 -0700
Message-Id: <91d5c1bef273763f0ea8f088dcaade550a85765b.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 01/45] sudo: fixed wrong `chmod` path
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
X-List-Received-Date: Fri, 25 May 2012 06:52:42 -0000

From: Mihai Lindner <mihaix.lindner@linux.intel.com>

Placed $D between braces ${D} to be correctly expanded to the
workdir path, instead of a path relative to host rootfs.
Currently, bitbake sudo fails on host systems where sudo is not
installed.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 meta/recipes-extended/sudo/sudo_1.8.4p4.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
index 2315322..20c4a14 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -24,6 +24,6 @@ do_install_append () {
 		fi
 	done
 
-	chmod 4111 $D/usr/bin/sudo
-	chmod 0440 $D/etc/sudoers
+	chmod 4111 ${D}/usr/bin/sudo
+	chmod 0440 ${D}/etc/sudoers
 }
-- 
1.7.7.6



