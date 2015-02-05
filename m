Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4D16772DF5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:12 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id et14so10850054pad.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9LlsUZf2D4nxFqW2curuTHOnpy8qWM/EIwSXsFowvFY=;
	b=kYpQwOkqlXpa+wBS+3SOlz3Kmp9ahERbE0z+oCa9NZG9K9ETJz1NZ38TM7J5X+u7dz
	WtfMd8HUVPrELc/HdJZrDkS6fev/yaayvNpmBYx40L0T/i8pHsL6j/Y6glompYFaCa4b
	sEnqPAE1BCSxZ87LPrl2w/68DNL8HRffKg52bTa56EC1LhmVMKLofVhK+jmey31qG/n8
	CM8WDZZ4Wk+wXr6SXtwaBY+RDGwQ5/130XwSKSMMsb0k66XZHGo0iFOH0LST/6yPCCav
	DsWpjSfViJpGefbq4cDsCqu4q1Dmph3fJCQc7UhlTHuZkbXQkf0EpYyYL/gLST8WGwYO
	nCmg==
X-Received: by 10.66.148.196 with SMTP id tu4mr6473474pab.125.1423152313919;
	Thu, 05 Feb 2015 08:05:13 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:38 -0800
Message-Id: <7eebf62746421e1648f61c91f444f67bf5765298.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 30/61] perl: Backport fix for bug #123591
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:13 -0000

From: Gary Thomas <gary@mlbassoc.com>

This patch fixes a crash in perl when using formatted strings @...

(From OE-Core rev: 6ff3776bb7f1a7ba2fc641bfd9b8546c4bb02466)

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


