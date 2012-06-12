Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeXzx-00027I-4U
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:33 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9C3742FE86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:53 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:35 -0700
Message-Id: <83c5acfe4731990c296be1bf67059452a72f9584.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9C3742FE86.7425F
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 04/16] sudo: fixed wrong `chmod` path
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:33 -0000

From: Mihai Lindner <mihaix.lindner@linux.intel.com>

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
-- 
1.7.9.5



