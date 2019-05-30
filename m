Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 029D27E33A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:32:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4U5WiMT016782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 22:32:44 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 22:32:44 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2019 13:32:20 +0800
Message-ID: <1559194340-420777-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
References: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 V2] systemd: add rconflicts
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
X-List-Received-Date: Thu, 30 May 2019 05:32:44 -0000
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
index 93a23dd..90f235b 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -603,6 +603,8 @@ FILES_udev += "${base_sbindir}/udevd \
 
 FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
 
+RCONFLICTS_${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
+
 INITSCRIPT_PACKAGES = "udev"
 INITSCRIPT_NAME_udev = "systemd-udevd"
 INITSCRIPT_PARAMS_udev = "start 03 S ."
-- 
2.7.4


