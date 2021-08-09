Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466866"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462932"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/23] createrepo-c: fix createrepo-c failed in nativesdk
Date: Mon,  9 Aug 2021 23:35:45 +0800
Message-Id: <d99b4dac74add826aa63ecb20c427d2884985329.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: hongxu <hongxu.jia@windriver.com>

In sdk, call createrepo-c failed with:
...
$ createrepo_c --update ./test_repo/rpm
Directory walk started Critical: Failed to detect compression for file
./test_repo/rpm/cortexa72/hello-2.10-r0.cortexa72.rpm: magic_load() failed: could not find any valid magic files!
...

Since commit [ea666fbc74 createrepo-c: set path to magic database for
native and nativesdk] applied, the MAGIC is incorrectly assigned.

The variable datadir will be expanded automatically for nativesdk,
do not need to add prefix ${SDKPATHNATIVE} to MAGIC

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54368f1b02e1ac4aa068515730a8c8bcd3683eb3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
index e0433806b2..7480affbc0 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
@@ -33,8 +33,8 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
         create_wrapper ${D}/${bindir}/createrepo_c \
                 RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
-                MAGIC=${SDKPATHNATIVE}${datadir}/misc/magic.mgc
+                MAGIC=${datadir}/misc/magic.mgc
         create_wrapper ${D}/${bindir}/modifyrepo_c \
-                MAGIC=${SDKPATHNATIVE}${datadir}/misc/magic.mgc
+                MAGIC=${datadir}/misc/magic.mgc
         rm -rf ${D}/etc
 }
-- 
2.31.1

