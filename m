Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TA6q7-0006rD-UK
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 00:15:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q87M3PWg004842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2012 15:03:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 7 Sep 2012 15:03:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Sep 2012 17:05:44 -0500
Message-ID: <bc6aa4b508418cdb8e62ba4eb152b38527731b3b.1347055413.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1347055413.git.mark.hatle@windriver.com>
References: <cover.1347055413.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] package_rpm.bbclass: Avoid unnecessary installs in complementary pass
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
X-List-Received-Date: Fri, 07 Sep 2012 22:15:52 -0000
Content-Type: text/plain

When called with the complementary install option, the first step is to
backup the install manifest so that we can avoid installing items previously
installed.  However, this backup process skipped the initial_install portion
of the manifest, causing early install items like libc6, bash, and base-files
to be installed a second time.

Fix this by cating the files to original_solution.  This is done as an append to
allow multiple calls to package_install_internal_rpm to work.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 742f292..7e3dfbe 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -313,7 +313,14 @@ package_install_internal_rpm () {
 			done
 		fi
 	else
-		mv ${target_rootfs}/install/total_solution.manifest ${target_rootfs}/install/original_solution.manifest
+		# We may run through the complementary installs multiple times.  For each time
+		# we should add the previous solution manifest to the full "original" set to
+		# avoid duplicate install steps.
+		echo "Update original solution..."
+		cat ${target_rootfs}/install/initial_solution.manifest >> ${target_rootfs}/install/original_solution.manifest
+		cat ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/original_solution.manifest
+		rm ${target_rootfs}/install/initial_solution.manifest
+		rm ${target_rootfs}/install/total_solution.manifest
 	fi
 
 	# Setup manifest of packages to install...
-- 
1.7.3.4



