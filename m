Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1Te0fY-0002J6-KN
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 10:44:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAT9UG7W001742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 01:30:16 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 29 Nov 2012 01:30:15 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2012 17:30:12 +0800
Message-ID: <1354181412-2207-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH] rootfs_rpm.bbclass: fix a regression introduced by list_installed_packages change
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
X-List-Received-Date: Thu, 29 Nov 2012 09:44:43 -0000
Content-Type: text/plain

A regression was introduced by commit:190cb591 that it doesn't
consider the situation that some archs contain "_" originally, so it
results in issues when dealing with archs like qemux86_64, x85_64.

Added a conditional statment in to handle that case.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 300dd5f..c4fb470 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -153,7 +153,7 @@ list_installed_packages() {
 
 	# print the info, need to different return counts
 	if [ "$1" = "arch" ] ; then
-		echo "$GET_LIST" | awk '{gsub("_", "-", $2); print $1, $2}'
+		echo "$GET_LIST" | awk -v archs="${PACKAGE_ARCHS}" '{if(!index(archs, $2)) {gsub("_", "-", $2)} print $1, $2}'
         elif [ "$1" = "file" ] ; then
 		echo "$GET_LIST" | awk '{print $1, $3}'
         else
-- 
1.7.11



