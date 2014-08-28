Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44B84706AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7546F1808A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xEANM40nSOPb
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 3CF3118118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 25E7513EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 1ABF413E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 18BF13E049
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7SFB89E015261
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7SFB85C015260
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 17:11:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 17:11:03 +0200
Message-Id: <712bdb997adab9138755c0ae04cb1b697e0e2484.1409238578.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1409238578.git.pkj@axis.com>
References: <cover.1409238578.git.pkj@axis.com>
In-Reply-To: <cover.1409238578.git.pkj@axis.com>
References: <cover.1409238578.git.pkj@axis.com>
Subject: [PATCH 1/2] lib/oe/utils: Make multiprocess_exec() return anything
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
X-List-Received-Date: Thu, 28 Aug 2014 15:11:18 -0000

The variable "results" was accidentally used for multiple different
things at the same time, which unintentionally discarded anything that
was supposed to be returned from the function...

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 92e21a4..3544256 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -167,11 +167,11 @@ def multiprocess_exec(commands, function):
     imap = pool.imap(function, commands)
 
     try:
-        results = list(imap)
+        res = list(imap)
         pool.close()
         pool.join()
         results = []
-        for result in results:
+        for result in res:
             if result is not None:
                 results.append(result)
         return results
-- 
1.9.0


