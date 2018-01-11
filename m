Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 99E6578824
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 17:01:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0BH1aRv004119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 Jan 2018 17:01:38 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eZgES-0001g4-Us; Thu, 11 Jan 2018 17:01:36 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 17:01:35 +0000
Message-Id: <1515690095-6391-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515690095-6391-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1515690095-6391-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/4] sstate: Avoid indirect bison/flex-native dependencies
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
X-List-Received-Date: Thu, 11 Jan 2018 17:01:39 -0000

This avoids adding flex-native or bison-native to the sysroot without a specific
dependency in the recipe and means indirect dependencies (e.g. X -> Y -> binutils-cross -> flex-native)
no longer met the dependency incidentally. This improves determinism and avoid
build failures when people switch to external toolchains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6808942..7509561 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -921,6 +921,13 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
     if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
         return True
 
+    # Don't pull in flex-native or bison-native without a specific dependency in the recipe
+    # This improves determinism in the metadata and avoids the dependency being met incidentally,
+    # e.g. from binutils-cross which doesn't happen in the external toolchain case
+    if taskdependees[task][1] == 'do_populate_sysroot':
+        if taskdependees[task][0] == "flex-native" or taskdependees[task][0] == "bison-native":
+            return True
+
     # We only need to trigger packagedata through direct dependencies
     # but need to preserve packagedata on packagedata links
     if taskdependees[task][1] == "do_packagedata":
-- 
2.7.4


