Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7376FF7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 09:44:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2G9i4pH018468
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:44:05 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 16 Mar 2016 02:44:04 -0700
From: Dengke Du <dengke.du@windriver.com>
To: 
CC: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2016 05:43:59 -0400
Message-ID: <2317b145ac8fcddf55b4f65266cf50745ddd3de1.1458121278.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458121278.git.dengke.du@windriver.com>
References: <cover.1458121278.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pTest-tcl fail fixed
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
X-List-Received-Date: Wed, 16 Mar 2016 09:44:05 -0000
Content-Type: text/plain

http.test httpold.test socket.test failed when run the pTest-tcl,because
the tcl script "info hostname" in /usr/lib/tcl/ptest/tests/http.test fail.
The file /etc/hosts didn't contain the map from hostname to 127.0.0.1, so
it need to add the map. In order to ensure the rootfs correct,add it at
build time, add the following command:
	"sed -i '1s/$/    ${MACHINE}/' ${WORKDIR}/hosts"
in do_install() function in the file meta/recipes-core/netbase/netbase_5.3.bb

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/netbase/netbase_5.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/netbase/netbase_5.3.bb b/meta/recipes-core/netbase/netbase_5.3.bb
index ccd89ff..6688d55 100644
--- a/meta/recipes-core/netbase/netbase_5.3.bb
+++ b/meta/recipes-core/netbase/netbase_5.3.bb
@@ -14,6 +14,7 @@ SRC_URI[md5sum] = "2637a27fd3de02a278d2b5be7e6558c1"
 SRC_URI[sha256sum] = "81f6c69795044d62b8ad959cf9daf049d0545fd466c52860ad3f933b1e97b88b"
 
 do_install () {
+	sed -i '1s/$/    ${MACHINE}/' ${WORKDIR}/hosts
 	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
 	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
-- 
1.9.1


