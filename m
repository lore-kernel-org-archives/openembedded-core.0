Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 560F878A55
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 17:08:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w23H8kGH025242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 3 Mar 2018 17:08:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1esAeM-0003LJ-M3; Sat, 03 Mar 2018 17:08:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 17:08:43 +0000
Message-Id: <1520096924-12804-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520096924-12804-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1520096924-12804-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/3] image: Remove the do_package_write_* tasks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2018 17:08:47 -0000

Now we're filtering tasks in the rpm indexing code so that tasks can only
see the packages they really depend upon, having noexec package_write tasks
around is causing problems since the tasks exist but don't have manifests.

Removing the tasks entirely solves this problem and streamlines the
task execution graph too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 23ed53d..ce78c43 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -627,9 +627,9 @@ deltask do_populate_sysroot
 do_package[noexec] = "1"
 deltask do_package_qa
 do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
+deltask do_package_write_ipk
+deltask do_package_write_deb
+deltask do_package_write_rpm
 
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
-- 
2.7.4


