Return-Path: <n.merinov@inango-systems.com>
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id D03C778062
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 07:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id 083374C0EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 09:46:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjryYtK6aOMU; Thu,  5 Oct 2017 09:46:24 +0200 (CEST)
Received: from nmerinov.inango-sw (unknown [194.60.247.123])
	by main-1.inango.com (Postfix) with ESMTPSA id CE32F4C0C6D;
	Thu,  5 Oct 2017 09:46:23 +0200 (CEST)
From: Nikolay Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 12:46:07 +0500
Message-Id: <20171005074607.20260-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] utils.bbclass: Support applications with keys in check_app_exist function
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
X-List-Received-Date: Thu, 05 Oct 2017 07:46:27 -0000

check_app_exist function must support cases when "app" variable defined
as "progname --keys". For example BUILD_CC="gcc -march=x86-64" must
pass sanity check.

Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
---
 meta/classes/utils.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 081e662da1..8e07eac07a 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -320,7 +320,7 @@ hardlinkdir () {
 
 
 def check_app_exists(app, d):
-    app = d.expand(app).strip()
+    app = d.expand(app).split()[0].strip()
     path = d.getVar('PATH')
     return bool(bb.utils.which(path, app))
 
-- 
2.14.2


