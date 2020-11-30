Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53736.1606698750617407323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FA1iNVRrLYU2KnxdBYsKXpXVi7G0y0Zio/Db8jmHPFUuuXknl8yqOjs8jo0I7JDTpjLR/2uP2H
 aWwtlSdM+ZHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004438"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004438"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:17 -0800
IronPort-SDR: HEwXl0CR6eXpHd2YLql+L0n3yrjIStnEsounbFn3HNxIeSeqbSjNUNSDryTd9K8qfHJkhmEeUa
 j1xqvK6BRAvw==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302727"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/21] e2fsprogs: Fix a ptest permissions determinism issue
Date: Mon, 30 Nov 2020 09:11:32 +0800
Message-Id: <b99796ec9436b63e4fc7cb7d12c0c9bcceef5d4b.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When comparing builds built with different host umasks, this file jumped out.
The umask from do_compile was influencing ${D} and as cp was used to add the
file it wasn't deterministic. Fix the file mode to ensure determinism.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37f37f4a52de3711973b372160f23672b61ff6ad)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
index 15054768dd..e6a4bd1f8c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
@@ -125,6 +125,8 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
+	# This file's permissions depends on the host umask so be deterministic
+	chmod 0644 ${B}/tests/test_data.tmp
 	cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' \
-- 
2.28.0

