Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.48154.1612244094073717358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xW847u+nwT/Tei/sqdthlTpiGUA233gV0fBEq6KbVQd9/lU3KNlwWMeo3WTEnEJSgg/91fEmSC
 hlh5ekR9DaSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876945"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876945"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:36 -0800
IronPort-SDR: uZ3A9Zir8cztElhRJeVaoNr0uZgg163C5/PVR1CXp3FD7oW6d5o3boltu/UyixKy3qbTnKb3VO
 YpPfVUNGJntA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370361009"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/25] python3: Use addtask statement instead of task dependencies
Date: Tue,  2 Feb 2021 13:34:03 +0800
Message-Id: <782f7f4f73d7b1e1bd649db1984a63d94d2410fe.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

The externalsrc class deletes do_patch task which results with:
| ERROR: Task do_create_manifest in <PATH>/python3_3.8.2.bb depends upon
| non-existent task do_patch in <PATH>/python3_3.8.2.bb

Use addtask to define correct order to prevent this error, since addtask
mechanism accepts deleted tasks.

[YOCTO #14151]

(From OE-Core rev: a746d034fa7eaad4f4876fa61c5a8c3c15e211c8)

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8ed8b81af60c7d9c7a1c614ad137408637bc43ed)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3_3.8.5.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
index 8c34ae2b40..0e588d7e4c 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -307,11 +307,8 @@ do_create_manifest() {
 }
 
 # bitbake python -c create_manifest
-addtask do_create_manifest
-
 # Make sure we have native python ready when we create a new manifest
-do_create_manifest[depends] += "${PN}:do_prepare_recipe_sysroot"
-do_create_manifest[depends] += "${PN}:do_patch"
+addtask do_create_manifest after do_patch do_prepare_recipe_sysroot
 
 # manual dependency additions
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
-- 
2.29.2

