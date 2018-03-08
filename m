Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB2B6789A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053903"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:41 +0200
Message-Id: <20180308181804.31261-19-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/42] at: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:11 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/at/at/makefile-fix-parallel.patch | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/at/at/makefile-fix-parallel.patch b/meta/recipes-extended/at/at/makefile-fix-parallel.patch
index 932a4c0bfe6..d6056dceffa 100644
--- a/meta/recipes-extended/at/at/makefile-fix-parallel.patch
+++ b/meta/recipes-extended/at/at/makefile-fix-parallel.patch
@@ -15,13 +15,13 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  Makefile |    4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index 2a9b918..aa7c04a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -75,7 +75,9 @@ at: $(ATOBJECTS)
+Index: at-3.1.20/Makefile.in
+===================================================================
+--- at-3.1.20.orig/Makefile.in
++++ at-3.1.20/Makefile.in
+@@ -76,7 +76,9 @@ at: $(ATOBJECTS)
  atd: $(RUNOBJECTS)
- 	$(CC) $(LDFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB)
+ 	$(CC) $(LDFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB) $(SELINUXLIB)
  
 -y.tab.c y.tab.h: parsetime.y
 +y.tab.h: y.tab.c
@@ -30,6 +30,3 @@ index 2a9b918..aa7c04a 100644
  	$(YACC) -d parsetime.y
  
  lex.yy.c: parsetime.l
--- 
-1.7.9.5
-
-- 
2.16.1


