Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 572817717A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C70872E136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3ldfD-r0D78u
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id B58192E198
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9F163834
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9080818FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8C946102B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSLu9026700
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLW5026699
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:12 +0200
Message-Id: <c9f63f4a526764d91ee21955e7d9594d71114abd.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
Subject: [PATCH 1/7] Revert "rootfs.py: add more info to the warning message"
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
X-List-Received-Date: Wed, 18 May 2016 22:28:27 -0000

The reverted commit added a warning with the log line that triggered
the log check for error messages before the warning that states that
an error has been found in the log. However, the error line is output
by the call to bb.fatal() that follows immediately after the original
warning, which makes it redundant. Additionaly, having two warnings
contradicts the intent of commit 8dfdd329 where the log warnings were
tidied up.

This reverts commit f9cf31525fc885e1a0f65bd55654631257f87078.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/rootfs.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 95fd3ab..f6fb06c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -75,7 +75,6 @@ class Rootfs(object):
                 m = r.search(line)
                 if m:
                     found_error = 1
-                    bb.warn('[log_check] In line: [%s]' % line)
                     bb.warn('[log_check] %s: found an error message in the logfile (keyword \'%s\'):\n[log_check] %s'
 				    % (self.d.getVar('PN', True), m.group(), line))
 
-- 
2.1.0


