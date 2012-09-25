Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TGVSk-0001d5-TG
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:46:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8PDXKgn002016
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:33:20 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 25 Sep 2012 06:33:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2012 21:38:36 +0800
Message-ID: <352cdca21cbdaec95d82f141f7fe0bd86615eedb.1348561895.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1348561895.git.liezhi.yang@windriver.com>
References: <cover.1348561895.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] package_rpm.bbclass: change the arch's "-" to "_" for platform
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
X-List-Received-Date: Tue, 25 Sep 2012 13:46:11 -0000
Content-Type: text/plain

The platform and platform_extra will be written to /etc/rpm/platform,
the rpm's arch has changed the "-" to "_", so the value in platform
should also be updated.

[YOCTO #3159]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 64689d8..be6bd45 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -276,8 +276,8 @@ process_pkg_list_rpm() {
 package_install_internal_rpm () {
 
 	local target_rootfs="${INSTALL_ROOTFS_RPM}"
-	local platform="${INSTALL_PLATFORM_RPM}"
-	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
+	local platform="`echo ${INSTALL_PLATFORM_RPM} | sed 's#-#_#g'`"
+	local platform_extra="`echo ${INSTALL_PLATFORM_EXTRA_RPM} | sed 's#-#_#g'`"
 	local confbase="${INSTALL_CONFBASE_RPM}"
 	local package_to_install="${INSTALL_PACKAGES_RPM}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
-- 
1.7.11.2



