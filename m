Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id DA814721E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:50:25 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 35C70F811D8; Tue, 20 Jan 2015 09:50:26 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1B2ECF811D8;
	Tue, 20 Jan 2015 09:50:25 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jan 2015 09:50:35 -0700
Message-Id: <1421772635-29236-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH v2] perl: Backport fix for bug #123591
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
X-List-Received-Date: Tue, 20 Jan 2015 16:50:34 -0000

This patch fixes a crash in perl when using formatted strings @...
[v2] Added Signed-off-by line in actual patch.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../perl/perl-5.20.0/fix-FF_MORE-crash.patch        | 21 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.20.0.bb           |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch

diff --git a/meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch b/meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch
new file mode 100644
index 0000000..9ec041c
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Backport
+Reference: https://rt.perl.org/Public/Bug/Display.html?id=123591
+  From 62db6ea5fed19611596cbc5fc0b8a4df2c604e58 Mon Sep 17 00:00:00 2001
+  From: Tony Cook <tony@develop-help.com>
+  Date: Mon, 19 Jan 2015 16:03:18 +1100
+  Subject: [PATCH 1/1] [perl #123538] always set chophere and itembytes at the same time
+
+  Previously this would crash in FF_MORE because chophere was still NULL.
+
+Signed-off-by: Gary Thomas <gary@mlbassoc.com>
+Index: perl-5.20.0/pp_ctl.c
+===================================================================
+--- perl-5.20.0.orig/pp_ctl.c
++++ perl-5.20.0/pp_ctl.c
+@@ -590,6 +590,7 @@ PP(pp_formline)
+                         break;
+                 }
+                 itembytes = s - item;
++                chophere = s;
+ 		break;
+ 	    }
diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index 3ca0f53..bc7866b 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -63,6 +63,7 @@ SRC_URI += " \
 	file://fix_bad_rpath.patch \
 	file://perl-archlib-exp.patch \
 	file://dynaloaderhack.patch \
+	file://fix-FF_MORE-crash.patch \
 	\
         \
         file://config.sh \
-- 
1.9.1


