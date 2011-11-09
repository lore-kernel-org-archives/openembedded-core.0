Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNyRF-0003Hb-Vy
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 04:02:58 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0565F2FD07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 21:56:39 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 18:56:37 -0800
Message-Id: <b2e206f9714ff6f7818e42d2efdabb1417132523.1320807056.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0565F2FD07.91685
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/4] useradd.bbclass: do not modify -nativesdk packages
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
X-List-Received-Date: Wed, 09 Nov 2011 03:02:58 -0000

Exclude the addition of user/group code and RDEPENDS changes for
-nativesdk packages.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 3b2d1db..64d6861 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -153,10 +153,11 @@ fakeroot python populate_packages_prepend () {
 		rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
 		rdepends += " base-passwd shadow"
 		bb.data.setVar("RDEPENDS_%s" % pkg, rdepends, d)
-	
+
 	# Add the user/group preinstall scripts and RDEPENDS requirements
 	# to packages specified by USERADD_PACKAGES
-	useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
-	for pkg in useradd_packages.split():
-		update_useradd_package(pkg)
+	if not bb.data.inherits_class('nativesdk', d):
+		useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
+		for pkg in useradd_packages.split():
+			update_useradd_package(pkg)
 }
-- 
1.7.5.4



