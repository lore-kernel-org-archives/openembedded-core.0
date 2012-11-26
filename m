Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1Tcxi4-0003VO-UP
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 13:22:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAQ2O6b3001620
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:24:07 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 25 Nov 2012 18:24:06 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Nov 2012 10:24:03 +0800
Message-ID: <1353896643-25812-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH] rootfs_rpm.bbclass: normalize arch output of list_installed_packages
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
X-List-Received-Date: Mon, 26 Nov 2012 12:22:49 -0000
Content-Type: text/plain

list_installed_packages should output uniform formatted archs for all
packaging system(deb, rpm and ipk), for they are used by common code to
grab the package infos. Otherwise, it will lead some -dbg packages to be
missed processing in come cases.

It's introduced by commit: fc985f51, package_rpm.bbclass: fix the arch
(replace "-" with "_").

Fixed by replacing "_" back to "-" in list_installed_packages, make it
output real arch values which can be safely used.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c86cd09..300dd5f 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -153,7 +153,7 @@ list_installed_packages() {
 
 	# print the info, need to different return counts
 	if [ "$1" = "arch" ] ; then
-		echo "$GET_LIST" | awk '{print $1, $2}'
+		echo "$GET_LIST" | awk '{gsub("_", "-", $2); print $1, $2}'
         elif [ "$1" = "file" ] ; then
 		echo "$GET_LIST" | awk '{print $1, $3}'
         else
-- 
1.7.11



