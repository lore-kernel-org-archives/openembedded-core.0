Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TGnwI-0000oK-Ct
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:29:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8Q9H0FK017641
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 02:17:00 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 26 Sep 2012 02:17:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 17:22:16 +0800
Message-ID: <03f41d916fc8d7813612d4d750ecc89c7d4a8382.1348645880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1348645880.git.liezhi.yang@windriver.com>
References: <cover.1348645880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] rootfs_rpm.bbclass: maybe no rpm postinst script
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
X-List-Received-Date: Wed, 26 Sep 2012 09:29:54 -0000
Content-Type: text/plain

There maybe no rpm postinst script (e.g., core-image-minimal), then the
"*" is not expanded, and there would be error:

head: cannot open `rpm-postinsts/*' for reading: No such file or directory

Check whether it exists or not will fix the problem.

[YOCTO #3172]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d95ccfa..c86cd09 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -81,7 +81,9 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	# Report delayed package scriptlets
 	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*; do
-		echo "Delayed package scriptlet: `head -n 3 $i | tail -n 1`"
+		if [ -f $i ]; then
+			echo "Delayed package scriptlet: `head -n 3 $i | tail -n 1`"
+		fi
 	done
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
-- 
1.7.11.2



