Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T9HHQ-0001CI-CX
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 17:12:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q85F0CeG006922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 08:00:12 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 5 Sep 2012 08:00:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 22:54:07 +0800
Message-ID: <cfc2249ab533864f2716612838731e7831a1cb60.1346824226.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1346824226.git.liezhi.yang@windriver.com>
References: <cover.1346824226.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] package_rpm.bbclass: fix incremental rpm image generation
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
X-List-Received-Date: Wed, 05 Sep 2012 15:12:36 -0000
Content-Type: text/plain

* Check ${target_rootfs}/etc/passwd rather than
  ${target_rootfs}${rpmlibdir} to make sure that it has been previously
  installed.

* Remove the "--nodeps" when incremental image generation, it should
  take care of the dependencies. Still use "--replacefiles --replacepkgs" in
  case there are conflicts.

[YOCTO #3047]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 742f292..b2b8cee 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -191,7 +191,7 @@ rpm_update_pkg () {
 
         # Attempt to install the incremental pkgs
         if [ -s $installdir/incremental.manifest ]; then
-            rpm_common_comand --nodeps --replacefiles --replacepkgs \
+            rpm_common_comand --replacefiles --replacepkgs \
                -Uvh $installdir/incremental.manifest
         fi
     else
@@ -517,7 +517,7 @@ EOF
 			${target_rootfs}/install/original_solution_sorted.manifest > \
 			${target_rootfs}/install/diff.manifest
 		mv ${target_rootfs}/install/diff.manifest ${target_rootfs}/install/total_solution.manifest
-	elif [ "${INC_RPM_IMAGE_GEN}" = "1" -a -d "${target_rootfs}${rpmlibdir}" ]; then
+	elif [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "${target_rootfs}/etc/passwd" ]; then
 		echo "Skipping pre install due to existing image"
 	else
 		# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
-- 
1.7.1



