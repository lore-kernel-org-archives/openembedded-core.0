Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TGVSl-0001d6-R0
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:46:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8PDXMOU002023
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:33:22 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 25 Sep 2012 06:33:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2012 21:38:37 +0800
Message-ID: <f803471f8bfd25391e33f0914818111dbaf64366.1348561895.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1348561895.git.liezhi.yang@windriver.com>
References: <cover.1348561895.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] package_rpm.bbclass: no initial_solution in the second build
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
X-List-Received-Date: Tue, 25 Sep 2012 13:46:12 -0000
Content-Type: text/plain

There is no initial_solution.manifest in the second build when
incremental rpm image generation, since the initial solution has been
skipped. So we should check it before cat it.

[YOCTO #3128]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index be6bd45..49055f2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -317,10 +317,13 @@ package_install_internal_rpm () {
 		# we should add the previous solution manifest to the full "original" set to
 		# avoid duplicate install steps.
 		echo "Update original solution..."
-		cat ${target_rootfs}/install/initial_solution.manifest >> ${target_rootfs}/install/original_solution.manifest
-		cat ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/original_solution.manifest
-		rm ${target_rootfs}/install/initial_solution.manifest
-		rm ${target_rootfs}/install/total_solution.manifest
+		for m in ${target_rootfs}/install/initial_solution.manifest \
+			${target_rootfs}/install/total_solution.manifest; do
+			if [ -s $m ]; then
+				cat $m >> ${target_rootfs}/install/original_solution.manifest
+				rm -f $m
+			fi
+		done
 	fi
 
 	# Setup manifest of packages to install...
-- 
1.7.11.2



