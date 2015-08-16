Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id A981260125
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 01:17:18 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so42951688pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 18:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wj4sBrWsm+mLJRkYq9ZQ0NaC0+mUHF4IzEbh4RSn3sg=;
	b=lq+boBrRm4Wv361edS/gNvidrHrPb6uJU/QyxuTpjNzrLaJqxlF2kSUoSJEuk8gmJb
	TeWTXwWYz6Oqq+150J2rpz41gfivR06HNGN36GTnNyQcoHIbSuGA9b5Qvoq3AFALnw9R
	ien6avrLv5DqVC5P6aI/y7ypFJiBUN2iATX+MYXhbGFZjYCkKRCKBOlhXlc46djX3Qof
	NT8MPzVL5jzMvQA8kEGHngir1ywbz2L9Plg/1zOZ1tAIc6gZcUN+crVghRsEfLUCpqbq
	gJUl05UnNwN5/uI7noNZx3qq+0tENNVUSU/6C8RpM/hGQ9+z5D/DgO7/UENaXHlmoinL
	KKcA==
X-Received: by 10.70.94.170 with SMTP id dd10mr2817264pdb.146.1439687838541;
	Sat, 15 Aug 2015 18:17:18 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	bz4sm9957620pbd.6.2015.08.15.18.17.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Aug 2015 18:17:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Aug 2015 18:26:11 -0700
Message-Id: <1439688374-29411-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/4] glibc: Consider adding -Wno-error in cases when not using -O2
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
X-List-Received-Date: Sun, 16 Aug 2015 01:17:21 -0000

glibc has recently turned on Werror globally which is good but then not
all option combos are well tested so there still remains cleanup needed
when not using -O2, so lets just disable Werror in such cases, until
fixed upstream

Change-Id: I2d491c360a15b0752c97ff77ee0faaeede6e8d2a
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 74ad0b5..0cccd05 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -12,12 +12,20 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 # entire image as -O0, we override it with -O2 here and give a note about it.
 def get_optimization(d):
     selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
-    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O2", "x", "", d) == "x":
+        return selected_optimization
+    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
+        bb.note("glibc can't be built with -O, -O -Wno-error will be used instead.")
+        return selected_optimization.replace("-O", "-O -Wno-error")
+    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
         bb.note("glibc can't be built with -O0, -O2 will be used instead.")
         return selected_optimization.replace("-O0", "-O2")
     elif bb.utils.contains("SELECTED_OPTIMIZATION", "-Os", "x", "", d) == "x":
         bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
         return selected_optimization.replace("-Os", "-Os -Wno-error")
+    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O1", "x", "", d) == "x":
+        bb.note("glibc can't be built with -O1, -O1 -Wno-error will be used instead.")
+        return selected_optimization.replace("-O1", "-O1 -Wno-error")
     return selected_optimization
 
 SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
-- 
2.5.0


