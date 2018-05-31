Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37EBC74A0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 07:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E954318415
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id SSS9dYorippS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 944DF1840A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80D901A06F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7597D1A06D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 69CF0226C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w4V7gUJb031044
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:30 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w4V7gUmc031043
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2018 09:42:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 09:42:27 +0200
Message-Id: <5f79aff0dde40f6e3d5d755126e41b89f4e97231.1527752449.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1527752449.git.pkj@axis.com>
References: <cover.1527752449.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 1/2] Revert "rpm: add a patch to help with Docker performance issues"
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
X-List-Received-Date: Thu, 31 May 2018 07:42:43 -0000

This reverts commit 6f1822e5f1eaafd8bc46e999de730c1fcca77f3a.

This patch only solved a part of the problem.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...FD_CLOEXEC-on-opened-files-before-exec-fr.patch | 49 ----------------------
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  1 -
 2 files changed, 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch b/meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch
deleted file mode 100644
index 4651409a65..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 982e47df7b82c5ffe3c414cf5641f08dba0f0e64 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 26 Jan 2018 16:32:04 +0200
-Subject: [PATCH] Revert "Set FD_CLOEXEC on opened files before exec from lua
- script is called"
-
-This reverts commit 7a7c31f551ff167f8718aea6d5048f6288d60205.
-The reason is that when _SC_OPEN_MAX is much higher than the usual 1024
-(for example inside docker), the performance drops sharply.
-
-Upstream has been notified:
-https://bugzilla.redhat.com/show_bug.cgi?id=1537564
-
-Upstream-Status: Inappropriate [upstream needs to come up with a better fix]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- luaext/lposix.c | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/luaext/lposix.c b/luaext/lposix.c
-index 0a7c26c71..c578c5a11 100644
---- a/luaext/lposix.c
-+++ b/luaext/lposix.c
-@@ -335,22 +335,10 @@ static int Pexec(lua_State *L)			/** exec(path,[args]) */
- 	const char *path = luaL_checkstring(L, 1);
- 	int i,n=lua_gettop(L);
- 	char **argv;
--	int flag, fdno, open_max;
- 
- 	if (!have_forked)
- 	    return luaL_error(L, "exec not permitted in this context");
- 
--	open_max = sysconf(_SC_OPEN_MAX);
--	if (open_max == -1) {
--	    open_max = 1024;
--	}
--	for (fdno = 3; fdno < open_max; fdno++) {
--	    flag = fcntl(fdno, F_GETFD);
--	    if (flag == -1 || (flag & FD_CLOEXEC))
--		continue;
--	    fcntl(fdno, F_SETFD, FD_CLOEXEC);
--	}
--
- 	argv = malloc((n+1)*sizeof(char*));
- 	if (argv==NULL) return luaL_error(L,"not enough memory");
- 	argv[0] = (char*)path;
--- 
-2.15.1
-
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index cf26c1e8db..ef4b737e9b 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -39,7 +39,6 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
-           file://0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch \
            file://0001-configure.ac-add-option-for-dbus.patch \
            "
 
-- 
2.12.0


