Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494574"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494574"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075416"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:37 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/28] openssh: Remove temporary keys before generating new ones
Date: Fri, 16 Jul 2021 10:42:03 +0800
Message-Id: <dceba60f817c61d36868a2def642fc4164ff53ab.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Asfak Rahman <asfakr@outlook.com>

Key generation may wait for user input, due to the existence of
temporary keys resulting from power interruption in the first boot.
This prevents users from login via ssh.

Signed-off-by: Asfak Rahman <asfakr@outlook.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3196249a6917a32491be56e70bbf26d3b9818e0e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index 1931dc7153..ef117de897 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -6,6 +6,7 @@ generate_key() {
     local DIR="$(dirname "$FILE")"
 
     mkdir -p "$DIR"
+    rm -f ${FILE}.tmp
     ssh-keygen -q -f "${FILE}.tmp" -N '' -t $TYPE
 
     # Atomically rename file public key
-- 
2.31.1

