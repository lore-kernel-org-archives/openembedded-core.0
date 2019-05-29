Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF2F87E043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 09:00:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T904YE023086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 02:00:04 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 02:00:01 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 17:00:00 +0800
Message-ID: <1559120400-4089-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] busybox-inittab/sysvinit-inittab: add rconflicts
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
X-List-Received-Date: Wed, 29 May 2019 09:00:03 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

when both installed, do_rootfs report error like:
file /etc/inittab conflicts between attempted installs of
busybox-inittab-1.30.1-r0.qemux86 and sysvinit-inittab-2.88dsf-r10.qemux86

so add each other to rconflicts

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/busybox/busybox-inittab_1.30.1.bb    | 2 ++
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.30.1.bb b/meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
index a83620e..c347daf 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
@@ -30,3 +30,5 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} = "${sysconfdir}/inittab"
 CONFFILES_${PN} = "${sysconfdir}/inittab"
+
+RCONFLICTS_${PN} = "sysvinit-inittab"
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index bfd890d..8781492 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -90,5 +90,4 @@ CONFFILES_${PN} = "${sysconfdir}/inittab"
 USE_VT ?= "1"
 SYSVINIT_ENABLED_GETTYS ?= "1"
 
-
-
+RCONFLICTS_${PN} = "busybox-inittab"
-- 
2.7.4


