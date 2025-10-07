Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7430ACCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 23:49:00 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4359.1759880933914746667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 16:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pwHHKtqV;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597Nmlii3924102;
	Tue, 7 Oct 2025 18:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759880927;
	bh=kYT92hO9kTkdIeuBxBYzkRA6dJJiDJRuFOCKEBDp6RU=;
	h=From:To:CC:Subject:Date;
	b=pwHHKtqVfluQMPg1D2lDxIjHi89Ye7My2VRjWypXy5BSKVOsihHDG2x1jl8+MAgtV
	 hNHg7SuXojN0L2Vel2lqpMzAfq1YqnJ//dtrjDVt6ODPk0C71+sa91TYrpjaYzz9Dh
	 6scacfCuOswNjD1dUwUzfno2aSq8ouGm7RuNAAN8=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597Nml67229885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Oct 2025 18:48:47 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Oct
 2025 18:48:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 18:48:47 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597Nml9b1893244;
	Tue, 7 Oct 2025 18:48:47 -0500
From: <rs@ti.com>
To: <Ross.Burton@arm.com>, <richard.purdie@linuxfoundation.org>,
        <mathieu.dubois-briand@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] sysvinit: create tmpfile dir for x11 domain socket
Date: Tue, 7 Oct 2025 18:48:10 -0500
Message-ID: <20251007234809.435300-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 23:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224575

From: Randolph Sapp <rs@ti.com>

Register a volatile directory entry for the x11 domain socket when not
using systemd. This will make sure the directory is always created with
the correct permissions. Systemd already provides their own tmpfile.d
entry for the same behavior.

Currently some x11 related applications will create this directory if it
doesn't already exist, but this is not true for everything. In addition,
if the application in question isn't started as root, it's possible this
directory can be owned by a non-root user. This isn't an issue by
itself, but it can potentially lead to problems in a multi-user
environment.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-core/sysvinit/sysvinit/02_x11  | 6 ++++++
 meta/recipes-core/sysvinit/sysvinit_3.14.bb | 2 ++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/02_x11

diff --git a/meta/recipes-core/sysvinit/sysvinit/02_x11 b/meta/recipes-core/sysvinit/sysvinit/02_x11
new file mode 100644
index 0000000000..35c3698479
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/02_x11
@@ -0,0 +1,6 @@
+# Volatile entries to match systemd
+# https://github.com/systemd/systemd/blob/main/tmpfiles.d/x11.conf
+d root root 1777 /tmp/.X11-unix none
+d root root 1777 /tmp/.ICE-unix none
+d root root 1777 /tmp/.XIM-unix none
+d root root 1777 /tmp/.font-unix none
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.14.bb b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
index d4bb797624..368d77cc2e 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.14.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
+           file://02_x11 \
            "
 SRC_URI[sha256sum] = "c90874b8c054a35991fb8c4d30c443ed1e9b1815ff6165c7b483f558be4e4b53"
 
@@ -104,6 +105,7 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${UNPACKDIR}/01_bootlogd ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${UNPACKDIR}/02_x11 ${D}${sysconfdir}/default/volatiles
 
 	chown root:shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
-- 
2.51.0


