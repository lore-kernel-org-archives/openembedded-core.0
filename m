Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7722.1614918147768864035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LGjIdfT5nGHJ3mWn0a8oosMj2n9gfYL95XN4K07nIQKVPYzunAatu5iBSMjnxcXj62XWNnzpMz
 elPJmjrr9bsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670979"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:24 -0800
IronPort-SDR: uxGhHsE9zfS26ph5lAYGLvM4RkC6jjLraLFaXNnZ2N+sOET5s1lpky52GublbIzuJAkPgBLvxN
 ni8BgazWDhBQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128863"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/52] oeqa/commands: Fix compatibility with python 3.9
Date: Fri,  5 Mar 2021 12:20:55 +0800
Message-Id: <b59c8a26fbb5bd1409bbc3b78073e5dd55910f90.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Python 3.9 dropped isAlive() so use the preferred is_alive().

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bb06428cbb2ac0f3d98a1696f050d3393385503)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 8b3e12038d..a71c16ab14 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -125,11 +125,11 @@ class Command(object):
 
     def stop(self):
         for thread in self.threads:
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.terminate()
             # let's give it more time to terminate gracefully before killing it
             thread.join(5)
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.kill()
                 thread.join()
 
-- 
2.29.2

