Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47B9170101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 11:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9F9D41808E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xXjcMqd8Ihiq
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 2EA5518058
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 17CB015E7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 0C16E15DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 08EA71136
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2LBfnEn022145
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:41:49 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2LBfnDE022144
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2016 12:41:49 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 12:41:46 +0100
Message-Id: <f9ea855f1ddcfd6e723fc8114f9ef827535a44ba.1458560461.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458560461.git.pkj@axis.com>
References: <cover.1458560461.git.pkj@axis.com>
In-Reply-To: <cover.1458560461.git.pkj@axis.com>
References: <cover.1458560461.git.pkj@axis.com>
Subject: [PATCH 1/1] oe-buildenv-internal: Correct the sed expression which updates $PATH
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
X-List-Received-Date: Mon, 21 Mar 2016 11:41:51 -0000

Without this, the code that adds paths to $PATH could cause it to end
up with a trailing : which would then cause an error from the sanity
checker.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index bc6a4fe..8eee008 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -99,7 +99,7 @@ fi
 # Make sure our paths are at the beginning of $PATH
 for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
     # Remove any existences of $newpath from $PATH
-    PATH=$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\1#g;s#^:##")
+    PATH=$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
 
     # Add $newpath to $PATH
     PATH="$newpath:$PATH"
-- 
2.1.0


