Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNYps-0001Sc-Kc
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 00:42:40 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CCEBA3046B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 18:36:22 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:36:23 -0800
Message-Id: <5a66d5c0a8546166f76fb41cb48c033f8d6ed61f.1320708905.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320708905.git.scott.a.garman@intel.com>
References: <cover.1320708905.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320708905.git.scott.a.garman@intel.com>
References: <cover.1320708905.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CCEBA3046B.D6951
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] useradd.bbclass: fix how RDEPENDS is setup
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
X-List-Received-Date: Mon, 07 Nov 2011 23:42:40 -0000

Fix bug where only packages named PN included base-passwd in
RDEPENDS.

This fixes [YOCTO #1727]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index fb70b3e..0f9b84c 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -4,7 +4,6 @@ USERADDPN ?= "${PN}"
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = " base-passwd shadow-native shadow-sysroot"
-RDEPENDS_${USERADDPN}_append = " base-passwd shadow"
 
 # This preinstall function will be run in two contexts: once for the
 # native sysroot (as invoked by the useradd_sysroot() wrapper), and
@@ -147,6 +146,11 @@ fakeroot python populate_packages_prepend () {
 		preinst += d.getVar('useradd_preinst', True)
 		bb.data.setVar('pkg_preinst_%s' % pkg, preinst, d)
 
+		# RDEPENDS setup
+		rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
+		rdepends += " base-passwd shadow"
+		bb.data.setVar("RDEPENDS_%s" % pkg, rdepends, d)
+		
 	# We add the user/group calls to all packages to allow any package
 	# to contain files owned by the users/groups defined in the recipe.
 	# The user/group addition code is careful not to create duplicate
-- 
1.7.5.4



