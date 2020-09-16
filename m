Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.17756.1600243776383668736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 01:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08G89Es9006795
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 01:09:25 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 01:09:04 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: override DEBUG_BUILD
Date: Wed, 16 Sep 2020 01:09:04 -0700
Message-ID: <20200916080904.112915-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Override DEBUG_BUILD for qemu as the qemu upstream states it
doesn't work without optimization [1] to fix below build failure
when debug build enabled.
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:25: undefined reference to `unknown_lock_type'
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o: in function `fsdev_co_throttle_request':
 | /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: undefined reference to `unknown_lock_type'
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o:/mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: more undefined references to `unknown_lock_type' follow
 | collect2: error: ld returned 1 exit status

[1]: https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc      | 4 ++++
 meta/recipes-devtools/qemu/qemu_5.1.0.bb | 5 -----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9091115caf..bbb9038961 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,10 @@ SRC_URI[sha256sum] = "c9174eb5933d9eb5e61f541cd6d1184cd3118dfe4c5c4955bc1bdc4d39
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
+# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
+# upstream states qemu doesn't work without optimization
+DEBUG_BUILD = "0"
+
 do_install_append() {
     # Prevent QA warnings about installed ${localstatedir}/run
     if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
diff --git a/meta/recipes-devtools/qemu/qemu_5.1.0.bb b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
index 9b09490269..a4018cc448 100644
--- a/meta/recipes-devtools/qemu/qemu_5.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
@@ -10,11 +10,6 @@ DEPENDS = "glib-2.0 zlib pixman bison-native"
 
 RDEPENDS_${PN}_class-target += "bash"
 
-# Does not compile for -Og because that level does not clean up dead-code.
-# See lockable.h.
-#
-DEBUG_BUILD = "0"
-
 EXTRA_OECONF_append_class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF_append_class-target_mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF_append_class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.17.1

