Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.13027.1597386224202254898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 23:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07E6NDn9024132
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 23:23:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 23:23:15 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <kai.kang@windriver.com>
Subject: [PATCH] gcc-target.inc: fix multilib conflict
Date: Fri, 14 Aug 2020 14:18:30 +0800
Message-ID: <20200814061830.314124-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
file /usr/bin/g++ conflicts between attempted installs of lib32-g++-symlinks-10.1.0-r0.core2_32 and g++-symlinks-10.1.0-r0.core2_64
file /usr/bin/gcc conflicts between attempted installs of lib32-gcc-symlinks-10.1.0-r0.core2_32 and gcc-symlinks-10.1.0-r0.core2_64
file /usr/bin/cpp conflicts between attempted installs of lib32-cpp-symlinks-10.1.0-r0.core2_32 and cpp-symlinks-10.1.0-r0.core2_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 1e25dad86b..03057dc71b 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -28,6 +28,10 @@ export gcc_cv_objdump = "${TARGET_PREFIX}objdump"
 
 EXTRA_OECONF_GCC_FLOAT = "${@get_gcc_float_setting(bb, d)}"
 
+inherit multilib_script
+MULTILIB_SCRIPTS += " ${MLPREFIX}g++-symlinks:${bindir}/g++ ${MLPREFIX}gcc-symlinks:${bindir}/gcc \
+                      ${MLPREFIX}cpp-symlinks:${bindir}/cpp"
+
 PACKAGES = "\
     ${PN} ${PN}-plugins ${PN}-symlinks \
     g++ g++-symlinks \
-- 
2.17.1

