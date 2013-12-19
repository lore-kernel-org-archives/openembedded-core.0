Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9018D60FD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 05:33:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBJ5X5Xx000937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 21:33:05 -0800 (PST)
Received: from pek-xzhang1-d1.corp.ad.wrs.com (128.224.162.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 18 Dec 2013 21:33:04 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Dec 2013 13:35:32 +0800
Message-ID: <1387431332-9364-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [PATCH] nfs-utils: modify the boot sequence of the init script
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
X-List-Received-Date: Thu, 19 Dec 2013 05:33:05 -0000
Content-Type: text/plain

Move the nfscommon out of rcS and let it start just before
nfsserver. Modify the useradd parameter with long parameter
to make it more readable.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
index 80074cb..45eacd9 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
@@ -16,7 +16,8 @@ RRECOMMENDS_${PN} = "kernel-module-nfsd"
 inherit useradd
 
 USERADD_PACKAGES = "${PN}-client"
-USERADD_PARAM_${PN}-client = "-d /var/lib/nfs -r -s /bin/false rpcuser"
+USERADD_PARAM_${PN}-client = "--system  --home-dir /var/lib/nfs \
+			      --shell /bin/false --user-group rpcuser"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
            file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
@@ -41,7 +42,7 @@ INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
 INITSCRIPT_NAME = "nfsserver"
 INITSCRIPT_PARAMS = "defaults"
 INITSCRIPT_NAME_${PN}-client = "nfscommon"
-INITSCRIPT_PARAMS_${PN}-client = "start 44 S ."
+INITSCRIPT_PARAMS_${PN}-client = "defaults 19 21"
 
 inherit autotools update-rc.d systemd
 
-- 
1.8.1.2


