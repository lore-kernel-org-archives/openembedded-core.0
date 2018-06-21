Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4F27717A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 18:22:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5LIMHCp014519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 11:22:18 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 21 Jun 2018 11:22:17 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2018 11:22:17 -0700
Message-ID: <20180621182217.225893-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] postinst-intercepts: do not execute any variant of delay_to_first_boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 18:22:17 -0000
Content-Type: text/plain

As of commit 2c5c6e3ff we create multilib variants of intercept
hooks but we did not account for delay_to_first_boot variants.
This was covered up until commit a335e7867, but will now cause
an error.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/lib/oe/package_manager.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 20a41d5..9aa5847 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -382,7 +382,8 @@ class PackageManager(object, metaclass=ABCMeta):
             if script == "postinst_intercept" or not os.access(script_full, os.X_OK):
                 continue
 
-            if script == "delay_to_first_boot":
+            # we do not want to run any multilib variant of this
+            if script.startswith("delay_to_first_boot"):
                 self._postpone_to_first_boot(script_full)
                 continue
 
-- 
2.7.4


