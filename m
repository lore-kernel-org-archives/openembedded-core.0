Received: from outbound-relay9.guardedhost.com (outbound-relay9.guardedhost.com [216.239.133.221])
 by mx.groups.io with SMTP id smtpd.web11.4068.1608104297610155538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 23:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.221, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx02.guardedhost.com [IPv6:2607:fe90:1:1::53:1])
	by outbound-relay1.guardedhost.com (Postfix) with ESMTP id 4Cwn6c4KZ8z4x7r0;
	Wed, 16 Dec 2020 07:38:16 +0000 (GMT)
Received: from alaperry-ubuntu-build.43vr1hlvonre5le4v1ueig2kyb.xx.internal.cloudapp.net (unknown [52.151.43.11])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPSA id 4Cwn6b5GXHz30DS;
	Wed, 16 Dec 2020 07:38:15 +0000 (GMT)
From: "Alan Perry" <alanp@snowmoose.com>
To: openembedded-core@lists.openembedded.org
Cc: Alan Perry <alanp@snowmoose.com>
Subject: [PATCH] binutils: add libopcodes package for perf
Date: Wed, 16 Dec 2020 07:37:54 +0000
Message-Id: <20201216073754.4371-1-alanp@snowmoose.com>
X-Mailer: git-send-email 2.17.1
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: A8E59584-3F71-11EB-918B-B3D96A92F8E6
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx2.omnis.com
X-Virus-Status: Clean

Add a package for libopcodes, since, like libbfd, it is needed by
perf. Without separate packages for these libraries, all of the
binutil tools get added as well.

Signed-off-by: Alan Perry <alanp@snowmoose.com>
---
 meta/recipes-devtools/binutils/binutils_2.35.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.35.bb b/meta/recipes-devtools/binutils/binutils_2.35.bb
index 2e645e1ed8..976e49765a 100644
--- a/meta/recipes-devtools/binutils/binutils_2.35.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.35.bb
@@ -52,9 +52,11 @@ do_install_class-native () {
 	rmdir ${D}/${libdir}64 || :
 }
 
-# Split out libbfd-*.so so including perf doesn't include extra stuff
-PACKAGE_BEFORE_PN += "libbfd"
+# Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
+# extra stuff
+PACKAGE_BEFORE_PN += "libbfd libopcodes"
 FILES_libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
+FILES_libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 
 SRC_URI_append_class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
-- 
2.17.1

