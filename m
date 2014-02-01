Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 182CF6E9C5
	for <Openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 14:07:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s11E7fRB015468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 1 Feb 2014 06:07:41 -0800 (PST)
Received: from ord-jrw.corp.ad.wrs.com (172.25.32.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 1 Feb 2014 06:07:41 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Sat, 1 Feb 2014 08:07:39 -0600
Message-ID: <1391263659-21108-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] unfs3: Fix compile regression from unfs3 port
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
X-List-Received-Date: Sat, 01 Feb 2014 14:07:42 -0000
Content-Type: text/plain

A line got dropped from the original patch when porting to the latest
unfs3.  The regression was introduced in commit 7d8075c64 (unfs3: Fix
dependencies and allow target builds).

This patch restores the missing line from the original which had been
working fine for over a year's time.

--- a/Config/Makefile.in
+++ b/Config/Makefile.in
@@ -12,7 +12,9 @@ all: lib.a
 lib.a: $(OBJS)
        $(AR) crs lib.a $(OBJS)

-y.tab.h y.tab.c: exports.y
+y.tab.h: y.tab.c
+
+y.tab.c: exports.y
        $(YACC) -d exports.y

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../unfs3/unfs3/unfs3_parallel_build.patch         |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
index 6777769..6f64dd5 100644
--- a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
@@ -7,9 +7,9 @@ Jason Wessel <jason.wessel@windriver.com>
 Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
- Config/Makefile.in |    2 ++
+ Config/Makefile.in |    3 +++
  Makefile.in        |    3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ 2 files changed, 5 insertions(+), 1 deletion(-)
 
 --- a/Makefile.in
 +++ b/Makefile.in
@@ -25,10 +25,11 @@ Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
  	$(CC) -o $@ $(OBJS) $(CONFOBJ) $(EXTRAOBJ) $(LDFLAGS)
 --- a/Config/Makefile.in
 +++ b/Config/Makefile.in
-@@ -16,6 +16,8 @@ lib.a: $(OBJS)
+@@ -16,6 +16,9 @@ lib.a: $(OBJS)
  	$(AR) crs lib.a $(OBJS)
  
  y.tab.h y.tab.c: $(srcdir)/exports.y
++y.tab.h: y.tab.c
 +
 +y.tab.c: $(srcdir)/exports.y
  	$(YACC) -d $(srcdir)/exports.y
-- 
1.7.9.5


