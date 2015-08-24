Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id E6E8176C00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:31 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so59256902pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=C/GYlc7Wq0bidJBNrnO73F7nvTtGKjQ5BzIrWuQYBuY=;
	b=I6fSejzHkZSVWtgikbIO4gZrFRTalzhHT77Fj5kFFWefuPt3MnqILeEGhgJp5LbBKx
	qmER7O4HlwGtVfCJz5tCejVy20QMkeDAAwC4HV+PgvZomQiLwWzSKRowtbpUwUE3SxMD
	iYtqZAIRLUbGunyTM5AOIvZCYHSPLleRxKP3KVSQcvSL9oQMbPmPkq3zuMiNSe9jDFHb
	JjkxHAipj0tcalvTbYqEduV89T3ULiI6qnkSuh0xKox/zfpnZ165ARYhwHmQNsrMpbqi
	VeevilMKCbpvGurzCUAtmr2DP+vC+vmVQ2WTby1uTq38IdO9XtMeGf8ATumwBXHqfUWg
	gTcg==
X-Received: by 10.70.34.228 with SMTP id c4mr50031618pdj.114.1440454772462;
	Mon, 24 Aug 2015 15:19:32 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cr6sm7550698pdb.17.2015.08.24.15.19.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:16 -0700
Message-Id: <3843d76235f7517207f9aa178d70c731f2b2d51e.1440454290.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
References: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454290.git.chris_larson@mentor.com>
References: <cover.1440454290.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] insane.bbclass: add host-user-contaminated test
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:32 -0000

From: Christopher Larson <chris_larson@mentor.com>

- Add a test which checks for any paths outside of /home which are owned by
  the user running bitbake.
- Add the test to WARN_QA by default.

This test has been in meta-mentor for some time, and in our ERROR_QA for our
builds, and has caught a number of issues for us.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/insane.bbclass | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index cd773b7..aec9800 100644
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
 
@@ -950,6 +950,34 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
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
+    check_uid = int(d.getVar('HOST_USER_UID', True))
+    check_gid = int(d.getVar('HOST_USER_GID', True))
+
+    dest = d.getVar('PKGDEST', True)
+    home = os.path.join(dest, 'home')
+    if path == home or path.startswith(home + os.sep):
+        return
+
+    stat = os.lstat(path)
+    if stat.st_uid == check_uid:
+        messages["host-user-contaminated"] = "%s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_uid)
+        return False
+
+    if stat.st_gid == check_gid:
+        messages["host-user-contaminated"] = "%s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_gid)
+        return False
+    return True
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
2.2.1


