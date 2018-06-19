Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCCE7545B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 10:24:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5JAOMk5010217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 03:24:48 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 19 Jun 2018 03:24:18 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jun 2018 03:24:18 -0700
Message-ID: <20180619102418.116397-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] findutils: make -delete honour the -ignore_readdir_race option
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
X-List-Received-Date: Tue, 19 Jun 2018 10:24:57 -0000
Content-Type: text/plain

the '-delete' action no longer complains about disappeared files
when the '-ignore_readdir_race' option is given, too. That action
will also returns true in such a case now.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...-honour-the-ignore_readdir_race-opti.patch | 145 ++++++++++++++++++
 .../findutils/findutils_4.6.0.bb              |   4 +-
 2 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch

diff --git a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
new file mode 100644
index 0000000000..45e499a184
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
@@ -0,0 +1,145 @@
+From 0afb2efada7e435ae18ef7d3db0758464189f44f Mon Sep 17 00:00:00 2001
+From: Bernhard Voelker <mail@bernhard-voelker.de>
+Date: Tue, 30 Jan 2018 23:30:09 +0100
+Subject: find: make -delete honour the -ignore_readdir_race option
+
+* find/pred.c (pred_delete): Return true when the -ignore_readdir_race
+option is active and unlinkat() came back with ENOENT.
+* doc/find.texi (Option -ignore_readdir_race): Document the change.
+(Action -delete): Likewise.
+* find/find.1: Likewise.
+* NEWS (Bug Fixes): Mention the fix.
+
+For now, it seems a bit hard to add a proper test for this,
+so the following shell snippet demonstrates the race:
+
+  $ seq 10 | xargs touch
+  $ env time -f 'find exit status: %x\nfind time: %e' \
+      find -ignore_readdir_race -type f \
+        -delete \
+        -exec sh -c 'sleep $(basename {})' \; \
+        -printf 'find deleted: %p\n' \
+        & \
+    sleep 20; \
+    seq 10 | xargs rm -fv; \
+    wait $!
+
+Reported by Alexander Golubev in
+https://savannah.gnu.org/bugs/?52981
+
+Upstream-Status: Backport
+Signed-off-by : Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ NEWS          |  4 ++++
+ doc/find.texi | 15 ++++++++++++++-
+ find/find.1   | 22 ++++++++++++++++++++++
+ find/pred.c   |  6 ++++++
+ 4 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index 88cf17d..9809bf4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -42,6 +42,10 @@
+
+ ** Bug Fixes
+
++#52981: find: the '-delete' action no longer complains about disappeared files
++        when the '-ignore_readdir_race' option is given, too.  That action will
++        also returns true in such a case now.
++
+ Applied patch #8688: Spelling fixes.
+
+ * Major changes in release 4.5.18, 2015-12-27
+diff --git a/doc/find.texi b/doc/find.texi
+index 3580be7..0089193 100644
+--- a/doc/find.texi
++++ b/doc/find.texi
+@@ -1418,7 +1418,15 @@ gives a significant increase in search speed.
+ If a file disappears after its name has been read from a directory but
+ before @code{find} gets around to examining the file with @code{stat},
+ don't issue an error message.  If you don't specify this option, an
+-error message will be issued.  This option can be useful in system
++error message will be issued.
++
++Furthermore, @code{find} with the @samp{-ignore_readdir_race} option
++will ignore errors of the @samp{-delete} action in the case the file
++has disappeared since the parent directory was read: it will not output
++an error diagnostic, and the return code of the @samp{-delete} action
++will be true.
++
++This option can be useful in system
+ scripts (cron scripts, for example) that examine areas of the
+ filesystem that change frequently (mail queues, temporary directories,
+ and so forth), because this scenario is common for those sorts of
+@@ -2779,6 +2787,11 @@ explicitly.
+ 
+ If @samp{-delete} fails, @code{find}'s exit status will be nonzero
+ (when it eventually exits).
++
++Together with the @samp{-ignore_readdir_race} option, @code{find} will
++ignore errors of the @samp{-delete} action in the case the file has disappeared
++since the parent directory was read: it will not output an error diagnostic, and
++the return code of the @samp{-delete} action will be true.
+ @end deffn
+ 
+ @node Adding Tests
+diff --git a/find/find.1 b/find/find.1
+index 0437cd8..0d44c37 100644
+--- a/find/find.1
++++ b/find/find.1
+@@ -479,6 +479,17 @@ this option on and part of it with this option off
+ (if you need to do that, you will need to issue two \fBfind\fR commands
+ instead, one with the option and one without it).
+ 
++Furthermore,
++.B find
++with the
++.B \-ignore_readdir_race
++option will ignore errors of the
++.B \-delete
++action in the case the file has disappeared since the parent directory was read:
++it will not output an error diagnostic, and the return code of the
++.B \-delete
++action will be true.
++
+ .IP "\-maxdepth \fIlevels\fR"
+ Descend at most \fIlevels\fR (a non-negative integer) levels of
+ directories below the starting-points.
+@@ -1030,6 +1041,17 @@ and
+ .B \-delete
+ together.
+ 
++Together with the
++.B \-ignore_readdir_race
++option,
++.B find
++will ignore errors of the
++.B \-delete
++action in the case the file has disappeared since the parent directory was
++read: it will not output an error diagnostic, and the return code of the
++.B \-delete
++action will be true.
++
+ .IP "\-exec \fIcommand\fR ;"
+ Execute \fIcommand\fR; true if 0 status is returned.  All following
+ arguments to
+diff --git a/find/pred.c b/find/pred.c
+index 7e2a7bd..af3bacb 100644
+--- a/find/pred.c
++++ b/find/pred.c
+@@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct stat *stat_buf, struct predicate *pred
+ 	}
+       else
+ 	{
++	  if (ENOENT == errno && options.ignore_readdir_race)
++	    {
++	      /* Ignore unlink() error for vanished files.  */
++	      errno = 0;
++	      return true;
++	    }
+ 	  if (EISDIR == errno)
+ 	    {
+ 	      if ((flags & AT_REMOVEDIR) == 0)
+--
+cgit v1.0-41-gc330
diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb b/meta/recipes-extended/findutils/findutils_4.6.0.bb
index 072d3b3c05..db03252f54 100644
--- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 DEPENDS = "bison-native"
 
-SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
+SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+            file://0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch \
+"
 
 SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
 SRC_URI[sha256sum] = "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"
-- 
2.17.1


