Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id C74E677010
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:23:12 +0000 (UTC)
Received: by wicjd9 with SMTP id jd9so47772621wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=v/ihLfkU+MnzuAv75yKycCKDC7NJPmrsLobolUcrW18=;
	b=t8Px7tz7NTr9JMto/4C5+tFVATKbCJ2Q/MAVjkW9PPrmnE338A5qwpr1uCtH96pFMN
	F27VF8lU5+/c+LouRhkY+ERPA5v5Pl1L5XOCRtpAN2G/Y6oOKz98lSCGG79Iof1+ZJwj
	/ZFTRGytgih8PLqowf43jxuaBOhL215YpByFYeEn0BRHn4T9VlbJlPDg72EfsVFD+WP8
	lPcCvOql1LWTKR6gvPlUD2LNRiezrmpZavRXzh9VQDenM0S/T/y4YzigluB/mDvU5Ycc
	9YOC4HpAT4fmWCTffPHMj0sMlxLakE3LsPl14JJNPLU1Unr8DLb3cX8/QNXbna9x3XSE
	pz4w==
X-Received: by 10.180.84.33 with SMTP id v1mr419191wiy.39.1441146192432;
	Tue, 01 Sep 2015 15:23:12 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id c3sm29264439wja.3.2015.09.01.15.23.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Sep 2015 15:23:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 15:23:03 -0700
Message-Id: <0a6a335ab8cc0424b1322cc9ad4085325de21f35.1441145177.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <a3ec49e286110440a69f0cd3b7fd5dee7ba4ae07.1441145177.git.chris_larson@mentor.com>
References: <a3ec49e286110440a69f0cd3b7fd5dee7ba4ae07.1441145177.git.chris_larson@mentor.com>
In-Reply-To: <cover.1441145177.git.chris_larson@mentor.com>
References: <cover.1441145177.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/3] insane.bbclass: add host-user-contaminated test
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
X-List-Received-Date: Tue, 01 Sep 2015 22:23:14 -0000

From: Christopher Larson <chris_larson@mentor.com>

- Add a test which checks for any paths outside of /home which are owned by
  the user running bitbake.
- Add the test to WARN_QA by default.

This test has been in meta-mentor for some time, and in our ERROR_QA for our
builds, and has caught a number of issues for us.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/insane.bbclass | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 63376e7..2ecf523 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -31,14 +31,14 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
             unknown-configure-option symlink-to-sysroot multilib \
-            invalid-pkgconfig \
+            invalid-pkgconfig host-user-contaminated \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d \
             "
-FAKEROOT_QA = ""
+FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
 enabled tests are listed here, the do_package_qa task will run under fakeroot."
 
@@ -950,6 +950,39 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
                         sane = False
     return sane
 
+HOST_USER_UID := "${@os.getuid()}"
+HOST_USER_GID := "${@os.getgid()}"
+
+QAPATHTEST[host-user-contaminated] = "package_qa_check_host_user"
+def package_qa_check_host_user(path, name, d, elf, messages):
+    """Check for paths outside of /home which are owned by the user running bitbake."""
+
+    if not os.path.lexists(path):
+        return
+
+    dest = d.getVar('PKGDEST', True)
+    home = os.path.join(dest, 'home')
+    if path == home or path.startswith(home + os.sep):
+        return
+
+    try:
+        stat = os.lstat(path)
+    except OSError as exc:
+        import errno
+        if exc.errno != errno.ENOENT:
+            raise
+    else:
+        check_uid = int(d.getVar('HOST_USER_UID', True))
+        if stat.st_uid == check_uid:
+            messages["host-user-contaminated"] = "%s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_uid)
+            return False
+
+        check_gid = int(d.getVar('HOST_USER_GID', True))
+        if stat.st_gid == check_gid:
+            messages["host-user-contaminated"] = "%s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_gid)
+            return False
+    return True
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
2.2.1


