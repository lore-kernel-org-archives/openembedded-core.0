Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 217A475393
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 22:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6DF9418378;
	Fri, 11 May 2018 00:21:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ujjZ-4i4Qg7i; Fri, 11 May 2018 00:21:47 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id EF2CA18529;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2C181E06E;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C592A1E080;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B433F2DB2;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w4AMLdGY026295;
	Fri, 11 May 2018 00:21:39 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w4AMLdZ2026294;
	Fri, 11 May 2018 00:21:39 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 00:20:42 +0200
Message-Id: <fc21a364b6714e86743cc14e43e278328f9b39ea.1525990692.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1525990692.git.pkj@axis.com>
References: <cover.1525990692.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] rpm: Assume a max limit of 1024 open files
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
X-List-Received-Date: Thu, 10 May 2018 22:21:49 -0000

If sysconf(_SC_OPEN_MAX) is much greater than the usual 1024 (for
example inside a Docker container), the performance drops sharply.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...001-Assume-a-max-limit-of-1024-open-files.patch | 61 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Assume-a-max-limit-of-1024-open-files.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Assume-a-max-limit-of-1024-open-files.patch b/meta/recipes-devtools/rpm/files/0001-Assume-a-max-limit-of-1024-open-files.patch
new file mode 100644
index 0000000000..c5ca892aa2
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Assume-a-max-limit-of-1024-open-files.patch
@@ -0,0 +1,61 @@
+From 0d40bae6c02799ea35c95acfaa8991ddf92ab232 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Fri, 4 May 2018 22:47:11 +0200
+Subject: [PATCH] Assume a max limit of 1024 open files
+
+If sysconf(_SC_OPEN_MAX) is much greater than the usual 1024 (for
+example inside a Docker container), the performance drops sharply.
+
+Upstream-Status: Inappropriate [upstream needs to come up with a better fix]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ lib/rpmscript.c | 7 +------
+ luaext/lposix.c | 8 ++------
+ 2 files changed, 3 insertions(+), 12 deletions(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 19a28fb75..ca7838835 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -160,17 +160,12 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
+     int flag;
+     int fdno;
+     int xx;
+-    int open_max;
+ 
+     /* SIGPIPE is ignored in rpm, reset to default for the scriptlet */
+     (void) signal(SIGPIPE, SIG_DFL);
+ 
+     /* XXX Force FD_CLOEXEC on all inherited fdno's. */
+-    open_max = sysconf(_SC_OPEN_MAX);
+-    if (open_max == -1) {
+-	open_max = 1024;
+-    }
+-    for (fdno = 3; fdno < open_max; fdno++) {
++    for (fdno = 3; fdno < 1024; fdno++) {
+ 	flag = fcntl(fdno, F_GETFD);
+ 	if (flag == -1 || (flag & FD_CLOEXEC))
+ 	    continue;
+diff --git a/luaext/lposix.c b/luaext/lposix.c
+index 0a7c26c71..2640db51c 100644
+--- a/luaext/lposix.c
++++ b/luaext/lposix.c
+@@ -335,16 +335,12 @@ static int Pexec(lua_State *L)			/** exec(path,[args]) */
+ 	const char *path = luaL_checkstring(L, 1);
+ 	int i,n=lua_gettop(L);
+ 	char **argv;
+-	int flag, fdno, open_max;
++	int flag, fdno;
+ 
+ 	if (!have_forked)
+ 	    return luaL_error(L, "exec not permitted in this context");
+ 
+-	open_max = sysconf(_SC_OPEN_MAX);
+-	if (open_max == -1) {
+-	    open_max = 1024;
+-	}
+-	for (fdno = 3; fdno < open_max; fdno++) {
++	for (fdno = 3; fdno < 1024; fdno++) {
+ 	    flag = fcntl(fdno, F_GETFD);
+ 	    if (flag == -1 || (flag & FD_CLOEXEC))
+ 		continue;
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index 85d791ce5c..55b0396cd8 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -41,6 +41,8 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-configure.ac-add-option-for-dbus.patch \
            "
+SRC_URI_append_class-native = " file://0001-Assume-a-max-limit-of-1024-open-files.patch"
+SRC_URI_append_class-nativesdk = " file://0001-Assume-a-max-limit-of-1024-open-files.patch"
 
 PE = "1"
 SRCREV = "bfee1410af51c1cc9724791fb8d985260a62102b"
-- 
2.12.0


