Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D740D78733
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465157"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:01:53 +0200
Message-Id: <20180201180210.21652-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/20] rpm: add a patch to help with Docker performance issues
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...FD_CLOEXEC-on-opened-files-before-exec-fr.patch | 49 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch b/meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch
new file mode 100644
index 00000000000..4651409a651
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch
@@ -0,0 +1,49 @@
+From 982e47df7b82c5ffe3c414cf5641f08dba0f0e64 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 26 Jan 2018 16:32:04 +0200
+Subject: [PATCH] Revert "Set FD_CLOEXEC on opened files before exec from lua
+ script is called"
+
+This reverts commit 7a7c31f551ff167f8718aea6d5048f6288d60205.
+The reason is that when _SC_OPEN_MAX is much higher than the usual 1024
+(for example inside docker), the performance drops sharply.
+
+Upstream has been notified:
+https://bugzilla.redhat.com/show_bug.cgi?id=1537564
+
+Upstream-Status: Inappropriate [upstream needs to come up with a better fix]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ luaext/lposix.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/luaext/lposix.c b/luaext/lposix.c
+index 0a7c26c71..c578c5a11 100644
+--- a/luaext/lposix.c
++++ b/luaext/lposix.c
+@@ -335,22 +335,10 @@ static int Pexec(lua_State *L)			/** exec(path,[args]) */
+ 	const char *path = luaL_checkstring(L, 1);
+ 	int i,n=lua_gettop(L);
+ 	char **argv;
+-	int flag, fdno, open_max;
+ 
+ 	if (!have_forked)
+ 	    return luaL_error(L, "exec not permitted in this context");
+ 
+-	open_max = sysconf(_SC_OPEN_MAX);
+-	if (open_max == -1) {
+-	    open_max = 1024;
+-	}
+-	for (fdno = 3; fdno < open_max; fdno++) {
+-	    flag = fcntl(fdno, F_GETFD);
+-	    if (flag == -1 || (flag & FD_CLOEXEC))
+-		continue;
+-	    fcntl(fdno, F_SETFD, FD_CLOEXEC);
+-	}
+-
+ 	argv = malloc((n+1)*sizeof(char*));
+ 	if (argv==NULL) return luaL_error(L,"not enough memory");
+ 	argv[0] = (char*)path;
+-- 
+2.15.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index d75902788e4..7b8ea46a75d 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
+           file://0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch \
            "
 
 PE = "1"
-- 
2.15.1


