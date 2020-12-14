Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JoBj2WqXm26fCycG5kgVu1MlSI2yybQhJXD5WH/I769lSDNBI4VgBRJYEIMwh5QP7nl7kqyuYZ
 4EmS0f7rj+qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752407"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752407"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:39 -0800
IronPort-SDR: dq5qoFcw8kCmyu5gi+b0h42cEXdqbmEHCYBj/SFblWSWcMbTWSKVmArWzURCLokSqKiT6fenQN
 vY6tl4c2bnuA==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670792"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/19] llvm: fix reproducibility
Date: Mon, 14 Dec 2020 11:35:11 +0800
Message-Id: <5b9b559ceb0ef11175a37106abf8378cacda352a.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a467c0a03d077861c37e317dcb2905b6388cb64c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 4c2d490315..b146d0e6e3 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -99,6 +99,11 @@ do_configure_prepend() {
 	sed -ri "s#lib/${LLVM_DIR}#${baselib}/${LLVM_DIR}#g" ${S}/tools/llvm-config/llvm-config.cpp
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
+}
+
 do_compile() {
 	ninja -v ${PARALLEL_MAKE}
 }
-- 
2.29.2

