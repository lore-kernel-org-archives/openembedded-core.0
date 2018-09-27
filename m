Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DD5CF79481
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 14:42:02 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1g5XUR-0003fC-Hf from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2018 07:42:03 -0700
Received: from P7520.world.mentorg.com (137.202.0.90) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 27 Sep 2018 15:41:59 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2018 19:41:43 +0500
Message-ID: <1538059303-13007-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Subject: [PATCH v2] glibc-package.inc: correct intention for deleting /usr/lib as needed
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
X-List-Received-Date: Thu, 27 Sep 2018 14:42:03 -0000
Content-Type: text/plain

In case the baselib is lib64 we would want to delete /usr/lib
after removing the /usr/lib/locale dir and the implementation
wanted to do that earlier as well but the fault was checking
an already removed dir (/usr/lib/locale) before trying to
remove /usr/lib as that check would always fail.
Now we simply try to delete /usr/lib after deleting
/usr/lib/locale to make sure it deletes cleanly and is empty
at the time of deletion.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 9ea41b7..a98ae1a 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -207,10 +207,11 @@ do_poststash_install_cleanup () {
 	rm -rf ${D}/${localedir}
 	rm -rf ${D}${datadir}/locale
 	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
-		if [ -d ${D}${exec_prefix}/lib/locale ] ; then
-			rm -rf ${D}${exec_prefix}/lib/locale
+		if [ -d ${D}${exec_prefix}/lib ]; then
 			# error out if directory isn't empty
-			rm -f ${D}${exec_prefix}/lib
+			# this dir should only contain locale dir
+			# which has been deleted in the previous step
+			rmdir ${D}${exec_prefix}/lib
 		fi
 	fi
 }
-- 
2.7.4


