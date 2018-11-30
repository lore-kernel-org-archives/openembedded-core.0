Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D31026C0C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 03:21:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAU3LjNW005083
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 19:21:45 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 29 Nov 2018 19:21:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2018 11:39:08 +0800
Message-ID: <7a0dc7e0666fb0c07ea7dd49f5c0aa5eb06ff87a.1543548740.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543548740.git.liezhi.yang@windriver.com>
References: <cover.1543548740.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cooker: simplify BB_DANGLINGAPPENDS_WARNONLY
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
X-List-Received-Date: Fri, 30 Nov 2018 03:21:46 -0000
Content-Type: text/plain

- d.getVar('BB_DANGLINGAPPENDS_WARNONLY', False) -> d.getVar('BB_DANGLINGAPPENDS_WARNONLY')
  There is no reason to use 'False'.

- Use bb.utils.to_boolean for warn_only.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 bitbake/lib/bb/cooker.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 16681ba..28a16c5 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -928,9 +928,8 @@ class BBCooker:
 
         if appends_without_recipes:
             msg = 'No recipes available for:\n  %s' % '\n  '.join(appends_without_recipes)
-            warn_only = self.data.getVar("BB_DANGLINGAPPENDS_WARNONLY", \
-                 False) or "no"
-            if warn_only.lower() in ("1", "yes", "true"):
+            warn_only = self.data.getVar("BB_DANGLINGAPPENDS_WARNONLY")
+            if bb.utils.to_boolean(warn_only):
                 bb.warn(msg)
             else:
                 bb.fatal(msg)
-- 
2.7.4


