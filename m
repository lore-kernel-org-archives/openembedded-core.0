Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.303.1591050645879061045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 15:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 051MUZJB008928
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2020 15:30:36 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 1 Jun 2020
 15:30:17 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][oe-core][PATCH 1/1] qemu: force build type to production
Date: Mon, 1 Jun 2020 15:30:17 -0700
Message-ID: <20200601223017.117133-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

qemu will not build for -Og optimization because macros
in lockable.h expect dead-code elimination.  Override DEBUG_BUILD.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-devtools/qemu/qemu_4.2.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
index a4018cc448..9b09490269 100644
--- a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
@@ -10,6 +10,11 @@ DEPENDS = "glib-2.0 zlib pixman bison-native"
 
 RDEPENDS_${PN}_class-target += "bash"
 
+# Does not compile for -Og because that level does not clean up dead-code.
+# See lockable.h.
+#
+DEBUG_BUILD = "0"
+
 EXTRA_OECONF_append_class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF_append_class-target_mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF_append_class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.17.1

