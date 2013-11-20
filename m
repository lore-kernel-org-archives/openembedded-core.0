Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id 228416CC8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 00:30:34 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 2ACB5A01F05; Tue, 19 Nov 2013 18:31:57 -0600 (CST)
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Nov 2013 18:31:57 -0600
Message-Id: <16a4c667fd7dde1f7d503942c45e03a6bda98ae8.1384907111.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1384907111.git.peter.seebach@windriver.com>
References: <cover.1384907111.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1384907111.git.peter.seebach@windriver.com>
References: <cover.1384907111.git.peter.seebach@windriver.com>
Subject: [PATCH 1/1] sanity.bbclass: Don't fatal() when trying to dump environment.
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
X-List-Received-Date: Wed, 20 Nov 2013 00:30:34 -0000

It is distressing when bitbake -e can't run due to sanity check
failures, because the solution often involves figuring out what
configuration file are being read and what values they are setting.
Solution: Don't do that. If the datasmart object reports that
tracking is enabled, emit an error() but not a fatal(), and also
warn the user that things may be badly broken.

This depends on a change to bitbake (adding the isTracking() method).

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/sanity.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6807a23..1ef811d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -82,11 +82,17 @@ def raise_sanity_error(msg, d, network_error=False):
             bb.event.fire(bb.event.SanityCheckFailed(msg), d)
         return
 
-    bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
+    msg = (""" OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
     Following is the list of potential problems / advisories:
     
     %s""" % msg)
+    if d.isTracking():
+	bb.warn("Environment tracking enabled: NOT exiting on sanity check failures.")
+	bb.warn("Results may be inconsistent or meaningless; proceed at your own risk.")
+        bb.error(msg)
+    else:
+        bb.fatal(msg)
 
 # Check a single tune for validity.
 def check_toolchain_tune(data, tune, multilib):
-- 
1.7.1


