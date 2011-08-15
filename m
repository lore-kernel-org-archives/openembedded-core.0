Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QsuGJ-0002k7-DH
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:19:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7FAEdTG023233
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 03:14:39 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 15 Aug 2011 03:14:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 18:18:33 +0800
Message-ID: <bdd2c02c63135504189aca642d137a097c219706.1313400143.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313400142.git.liezhi.yang@windriver.com>
References: <cover.1313400142.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] The Skeleton initscript doesn't work on minimal image
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
X-List-Received-Date: Mon, 15 Aug 2011 10:19:15 -0000
Content-Type: text/plain

Fixes bug [YOCTO #1165]

The /etc/init.d/skeleton doesn't work on minimal image, this is
because of the pidofproc doesn't return "$?" correctly, so store
$? in the variable status would fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../initscripts/initscripts-1.0/functions          |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index c1eac3e..dd7da2b 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -18,7 +18,8 @@ pidofproc () {
 
 	# pidof output null when no program is running, so no "2>/dev/null".
 	pid=`pidof $1`
-	case $? in
+	status=$?
+	case $status in
 	0)
 		echo $pid
 		return 0
@@ -28,7 +29,7 @@ pidofproc () {
 		exit 127
 		;;
 	*)
-		return $?
+		return $status
 		;;
 	esac
 }
-- 
1.7.1



