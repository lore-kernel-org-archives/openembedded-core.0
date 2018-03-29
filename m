Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 66230744E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 21:57:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2TLv4ls003553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 29 Mar 2018 22:57:05 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f1fXc-0004F5-9W; Thu, 29 Mar 2018 22:57:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 22:57:03 +0100
Message-Id: <1522360623-16266-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH] multilib: Don't extend make-mod-scripts as a multilib version doesn't make any sense
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
X-List-Received-Date: Thu, 29 Mar 2018 21:57:06 -0000

The multilib version would race against then non-ml version leading
to all kinds of odd build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index fbb6980..519c1a5 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -11,7 +11,7 @@ python multilib_virtclass_handler () {
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
     provides = (e.data.getVar("PROVIDES") or "").split()
-    if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data):
+    if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data) or "make-mod-scripts" in e.data.getVar("PN"):
         raise bb.parse.SkipRecipe("We shouldn't have multilib variants for the kernel")
 
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME") or ""
-- 
2.7.4


