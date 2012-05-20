Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SXYVA-0004yb-JK
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 15:54:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 06:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147924250"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 06:43:35 -0700
Received: from [10.237.105.40] (unknown [10.237.105.40])
	by linux.intel.com (Postfix) with ESMTP id 0F7A22C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 06:43:04 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 20 May 2012 13:17:32 -0000
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
X-Patchwork-Id: 28005
Message-Id: <6b907017a92c4178980b18fbe2fef47cbd2b1a34.1337519599.git.mihaix.lindner@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [1/1] sudo: fixed wrong `chmod` path
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
X-List-Received-Date: Thu, 24 May 2012 13:54:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Placed $D between braces ${D} to be correctly expanded to the
workdir path, instead of a path relative to host rootfs.
Currently, bitbake sudo fails on host systems where sudo is not
installed.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>

---
meta/recipes-extended/sudo/sudo_1.8.4p4.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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



