Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SAwUW-0006v7-UG
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:52:45 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9A9732FD24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 00:43:44 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 21:43:41 -0700
Message-Id: <e7e0cacf7bc478c69f9798846d8bdeb9ff4da6a6.1332453478.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332453478.git.scott.a.garman@intel.com>
References: <cover.1332453478.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1332453478.git.scott.a.garman@intel.com>
References: <cover.1332453478.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9A9732FD24.EF1C2
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/2] package_rpm.bbclass: ensure base-passwd and shadow get installed first
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
X-List-Received-Date: Fri, 23 Mar 2012 04:52:45 -0000

When generating images, we need to make sure that base-passwd and
shadow get installed before other packages, which might need to create
custom user accounts.

Thanks to Richard Purdie for the initial version of this fix.

This fixes [YOCTO #2127]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/package_rpm.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 80b1619..e83fc55 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -439,7 +439,14 @@ package_install_internal_rpm () {
 
 	fi
 
-	cat ${target_rootfs}/install/install_solution.manifest > ${target_rootfs}/install/total_solution.manifest
+	# If base-passwd or shadow are in the list of packages to install,
+	# ensure they are installed first to support later packages that
+	# may create custom users/groups (fixes Yocto bug #2127)
+	infile=${target_rootfs}/install/install_solution.manifest
+	outfile=${target_rootfs}/install/total_solution.manifest
+	cat $infile | grep /base-passwd-[0-9] > $outfile || true
+	cat $infile | grep /shadow-[0-9] >> $outfile || true
+	cat $infile | grep -v /shadow-[0-9] | grep -v /base-passwd-[0-9] >> $outfile
 	cat ${target_rootfs}/install/install_multilib_solution.manifest >> ${target_rootfs}/install/total_solution.manifest
 
 	# Construct install scriptlet wrapper
-- 
1.7.5.4



