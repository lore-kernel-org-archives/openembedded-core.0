Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dQL2oNe0h/HE1ZxE/xSFJPsTM7lDd0EVGDUq04zEj1JKzVY+mB8EuZcbTjMzKt76ZrrqpvzsCm
 5uAIH9H0kL5g==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258302"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258302"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:28 -0700
IronPort-SDR: AN7m5ir0cpAhcD09X5u0kagX3TbgYRpjC9k/zcV8NvmSSXvAQGunC3O3pe/ErOAVRAYLx9D8nG
 dY7DY4jvPM1g==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883648"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:27 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/10] cmake.bbclass: remove ${B} before cmake_do_configure
Date: Thu, 29 Apr 2021 12:41:02 +0800
Message-Id: <db6a315e5f6de02e226e582f878a83c427fd87cc.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It is fallible to remove ${B} in directory ${B} itself. And it does fail
when call bitbake by third-party wrapper script.

Use flag 'cleandirs' to remove ${B} first if build out of source tree.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fb6280432a36985590d9a714a5f11164aaebb51)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.30.2

