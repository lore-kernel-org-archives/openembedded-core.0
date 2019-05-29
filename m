Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5277E303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 09:35:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T9ZXir025885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 02:35:33 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 02:35:32 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 17:35:07 +0800
Message-ID: <1559122507-53104-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559122507-53104-1-git-send-email-changqing.li@windriver.com>
References: <1559122507-53104-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] systemd: add rconflicts
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
X-List-Received-Date: Wed, 29 May 2019 09:35:32 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

add rconflicts since error during do_rootfs:
file /sbin/resolvconf conflicts between attempted installs of resolvconf-1.79-r0.noarch and systemd-1:242+0+db2e367bfc-r0.i586
file /sbin/init conflicts between attempted installs of tiny-init-1.0-r3.i586 and systemd-1:242+0+db2e367bfc-r0.i586

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 93a23dd..39ac2f0 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -603,6 +603,8 @@ FILES_udev += "${base_sbindir}/udevd \
 
 FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
 
+RCONFLICTS_${PN} = "resolvconf tiny-init"
+
 INITSCRIPT_PACKAGES = "udev"
 INITSCRIPT_NAME_udev = "systemd-udevd"
 INITSCRIPT_PARAMS_udev = "start 03 S ."
-- 
2.7.4


