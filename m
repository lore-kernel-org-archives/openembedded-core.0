Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFD37F942
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 05:59:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0035x5Kv028402
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jan 2020 21:59:06 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 2 Jan 2020 21:58:52 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2020 13:58:12 +0800
Message-ID: <1578031092-239570-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] shadow: Security Advisory - shadow - CVE-2019-19882
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
X-List-Received-Date: Fri, 03 Jan 2020 05:59:05 -0000
Content-Type: text/plain

Backport patch from <https://github.com/shadow-maint/shadow/pull/199/
commits/66b7bc0dcfda12d7f58eba993bd02872cae1d713> to solve
CVE-2019-19882.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../shadow/files/CVE-2019-19882.patch              | 55 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2019-19882.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2019-19882.patch b/meta/recipes-extended/shadow/files/CVE-2019-19882.patch
new file mode 100644
index 0000000..894d867
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2019-19882.patch
@@ -0,0 +1,55 @@
+From 66b7bc0dcfda12d7f58eba993bd02872cae1d713 Mon Sep 17 00:00:00 2001
+From: Dave Reisner <dreisner@archlinux.org>
+Date: Mon, 16 Dec 2019 14:11:23 -0500
+Subject: [PATCH] Don't auto-enable ACCT_TOOLS_SETUID if PAM is detected
+
+Here's a sad story:
+
+* 70971457 is merged into shadow, allowing newgidmap/newuidmap to be
+installed with file caps rather than setuid.
+* https://bugs.archlinux.org/task/63248 is filed to take advantage of
+this.
+* The arch maintainer of the 'shadow' package notices that this doesn't
+work, and submits a pull request to fix this in shadow.
+* edf7547ad5 is merged, fixing the post install hooks.
+
+The problem here is that distros have been building shadow with PAM for
+O(years), but the install hooks have silently failed due to the
+combination of the directory mismatch (suidubins vs suidsbins) and later
+success with setuid'ing newgidmap/newuidmap.
+
+With the install hooks fixed, those of us (Arch[1] and Gentoo[2] so far)
+who never built shadow explicitly with --enable-account-tools-setuid are
+now getting setuid account tools, and don't have PAM configuration
+suitable for use with setuid account management tools.
+
+It's entirely unclear to me why you'd want this, but I assume there's
+some reason out there for it existing. Regardless, setuid binaries are
+dangerous and shouldn't be enabled by default without good reason.
+
+[1] https://bugs.archlinux.org/task/64836
+[2] https://bugs.gentoo.org/702252
+
+Upstream-Status: Backport
+CVE: CVE-2019-19882
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e3ed3b43..d6e2bfbd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -226,7 +226,7 @@ AC_ARG_ENABLE(account-tools-setuid,
+ 	   *) AC_MSG_ERROR(bad value ${enableval} for --enable-account-tools-setuid)
+ 	   ;;
+ 	 esac],
+-	[enable_acct_tools_setuid="maybe"]
++	[enable_acct_tools_setuid="no"]
+ )
+ 
+ AC_ARG_ENABLE(utmpx,
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 267d232..3bfa39e 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.
            file://shadow-4.1.3-dots-in-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
+           file://CVE-2019-19882.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
1.9.1


