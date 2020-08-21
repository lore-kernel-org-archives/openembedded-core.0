Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.125735.1597978466701541430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 19:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07L2rmE7020919
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 19:54:15 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 20 Aug
 2020 19:53:49 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V2] connman-conf: make connman-conf only available for qemuall
Date: Fri, 21 Aug 2020 10:53:03 +0800
Message-ID: <1597978383-189322-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

connman-conf is only for qemu machines, so use COMPATIBLE_MACHINE
to limit that it is only available for qemuall, or else it can be
built successfully without the package connman-conf generated.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb | 2 ++
 meta/recipes-connectivity/connman/connman_1.38.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 9a519ec..3a6c525 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -34,3 +34,5 @@ do_install() {
 }
 
 SYSTEMD_SERVICE_${PN}_qemuall = "wired-connection.service"
+COMPATIBLE_MACHINE = "null"
+COMPATIBLE_MACHINE_qemuall = "${MACHINE}"
diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.38.bb
index 027c41e..734b8ae 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.38.bb
@@ -12,5 +12,5 @@ SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_nin
 SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
 SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
 
-RRECOMMENDS_${PN} = "connman-conf"
+RRECOMMENDS_${PN}_qemuall = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
1.9.1

