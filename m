Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 194887717A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C9D022E203
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2FoUu93mMNJd
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id D7CAA2E1FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id BF523190E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id AFBA9190B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id AD1D41019
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSL7N026708
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLAj026707
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:14 +0200
Message-Id: <dd82eca676e95f4df5924b1e9749d164d7a9c76a.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
Subject: [PATCH 3/7] rootfs.py: Simplify the regular expression used in _log_check_warn()
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
X-List-Received-Date: Wed, 18 May 2016 22:28:25 -0000

In commit 0387d095 lines with "NOTE:" in them were excluded from the
log check for warnings. However, those lines were only there in the
first place since the regular expression that is used to find warning
messages explicitly included those lines...

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/rootfs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0a2753e..a92aa22 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -41,11 +41,11 @@ class Rootfs(object):
         pass
 
     def _log_check_warn(self):
-        r = re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn|WARNING:)')
+        r = re.compile('^(warn|Warn|WARNING:)')
         log_path = self.d.expand("${T}/log.do_rootfs")
         with open(log_path, 'r') as log:
             for line in log:
-                if 'log_check' in line or 'NOTE:' in line:
+                if 'log_check' in line:
                     continue
 
                 m = r.search(line)
-- 
2.1.0


