Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A85271366
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsU1m010825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:54:05 +0800
Message-ID: <29ccaef31e95f27136f1400c7d6875fc10cdbd52.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 19/26] packagegroup-core-boot: conditionally rdepend on VIRTUAL-RUNTIME_initscripts
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:30 -0000
Content-Type: text/plain

If we are building a systemd image with 'sysvinit' not in DISTRO_FEATURES,
the initscripts should not be installed into the image, as they are useless.
What's more, we as now support executing scripts under /etc/rcS.d, the
boot time will be increased by these scripts as the systemd will try to
translate them into temporary service files.

These init scritps are actually needed only when 'sysvinit' is in
DISTRO_FEATURES.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 886c334..09f5373 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -27,6 +27,7 @@ VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
                     modutils-initscripts \
                     init-ifupdown \
+                    ${VIRTUAL-RUNTIME_initscripts} \
                    "
 
 RDEPENDS_${PN} = "\
@@ -38,7 +39,6 @@ RDEPENDS_${PN} = "\
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
-    ${VIRTUAL-RUNTIME_initscripts} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-- 
1.9.1


