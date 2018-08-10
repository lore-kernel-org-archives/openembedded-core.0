Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B995778D86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 09:27:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7A9RFHP008096
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 02:27:41 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 10 Aug 2018 02:27:34 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2018 17:38:03 +0800
Message-ID: <1533893883-11594-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: add runtime depends for nfs-export-root
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
X-List-Received-Date: Fri, 10 Aug 2018 09:27:50 -0000
Content-Type: text/plain

When DISTRO_FEATURE enable "systemd", the nfs-server.service in nfs-utils
depends on /etc/exports, but the file "/etc/exports" installed by package
nfs-export-root. Otherwise the service would failed.

So we should add the runtime depends for nfs-export-root.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
index 6d450c7..581f334 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 # util-linux for libblkid
 DEPENDS = "libcap libevent util-linux sqlite3 libtirpc"
 RDEPENDS_${PN} = "${PN}-client bash"
+RDEPENDS_${PN}_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'nfs-export-root', '' ,d)}"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 inherit useradd
-- 
2.7.4


