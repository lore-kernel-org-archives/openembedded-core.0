Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.4836.1619148549301248362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 20:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N3T71C017665
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 20:29:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 20:29:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 20:29:06 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] cmake.bbclass: remove ${B} before cmake_do_configure
Date: Fri, 23 Apr 2021 11:29:03 +0800
Message-ID: <20210423032904.1086-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It is fallible to remove ${B} in directory ${B} itself. And it does fail
when call bitbake by third-party wrapper script.

Use flag 'cleandirs' to remove ${B} first if build out of source tree.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/cmake.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8876ce5aa5..f01db7480b 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -149,16 +149,14 @@ addtask generate_toolchain_file after do_patch before do_configure
 
 CONFIGURE_FILES = "CMakeLists.txt"
 
+do_configure[cleandirs] = "${@d.getVar('B') if d.getVar('S') != d.getVar('B') else ''}"
+
 cmake_do_configure() {
 	if [ "${OECMAKE_BUILDPATH}" ]; then
 		bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
 	fi
 
-	if [ "${S}" != "${B}" ]; then
-		rm -rf ${B}
-		mkdir -p ${B}
-		cd ${B}
-	else
+	if [ "${S}" = "${B}" ]; then
 		find ${B} -name CMakeFiles -or -name Makefile -or -name cmake_install.cmake -or -name CMakeCache.txt -delete
 	fi
 
-- 
2.17.1

