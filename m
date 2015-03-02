Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id C749D7212A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 04:28:30 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Mon, 2 Mar 2015 15:28:31 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t224STke021789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Mar 2015 15:28:31 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YSHy0-0008KR-Tb; Mon, 02 Mar 2015 15:28:29 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 15:28:22 +1100
Message-Id: <1425270502-22898-1-git-send-email-openembedded-devel@urbanec.net>
X-Mailer: git-send-email 2.3.1
Cc: Peter Urbanec <openembedded-devel@urbanec.net>
Subject: [PATCH] glibc: Fix check for -Os.
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
X-List-Received-Date: Mon, 02 Mar 2015 04:28:32 -0000

The check is supposed to be for -Os, but it's actually testing -O0.

Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
---
 meta/recipes-core/glibc/glibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 4d5e98b..e33f596 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -15,7 +15,7 @@ def get_optimization(d):
     if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
         bb.note("glibc can't be built with -O0, -O2 will be used instead.")
         return selected_optimization.replace("-O0", "-O2")
-    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-Os", "x", "", d) == "x":
         bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
         return selected_optimization.replace("-Os", "-Os -Wno-error")
     return selected_optimization
-- 
2.3.1


