Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 95B926093B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v36BRap9002822; 
	Thu, 6 Apr 2017 12:27:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ME3zwwBzSN9o; Thu,  6 Apr 2017 12:27:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v36BOC0j002218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 6 Apr 2017 12:24:13 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cw5WO-0002UA-K7; Thu, 06 Apr 2017 12:24:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 12:24:10 +0100
Message-Id: <1491477850-9510-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491477850-9510-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1491477850-9510-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] glibc/gcc/libgcc-initial: Delete do_build tasks for -initial
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
X-List-Received-Date: Thu, 06 Apr 2017 11:27:38 -0000

We've had a lot of users running into RSS issues where -initial recipes
were being installed into sysroots alongside their counterparts and
causing overlapping files issues.

In general this was through do_build dependencies. Such dependencies are
bad in general and I'd encourage people to compare the taskgraphs with
using a more specific dependency like do_populate_sysroot, do_image_complete
or do_deploy as often the more specific dependency will result in a much
cleaner build.

Regardless, we don't want -initial dependencies getting in the way like
this and there are cases a do_build dependency could make sense.

Deleting the do_build task in these cases makes sense since this is not
a build "endpoint" we'd ever want a user to use, its a behind the scenes
piece of bootstrappping.

Unfortunately to make this work, we need a newer bitbake version which
has a bitbake bug fixed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-initial.inc       | 3 +++
 meta/recipes-devtools/gcc/gcc-cross-initial.inc | 4 ++++
 meta/recipes-devtools/gcc/libgcc-initial.inc    | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index f94603c..b86e2fb 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -52,3 +52,6 @@ do_siteconfig () {
 }
 
 inherit nopackages
+
+# We really only want this built by things that need it, not any recrdeptask
+deltask do_build
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 5c0208a..d440d88 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -82,3 +82,7 @@ do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_AR
 inherit nopackages
 
 COMPILERINITIAL = "-initial"
+
+
+# We really only want this built by things that need it, not any recrdeptask
+deltask do_build
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 5b4bc3b..950ad86 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -15,3 +15,6 @@ EXTRA_OECONF += "--disable-shared"
 COMPILERINITIAL = "-initial"
 
 inherit nopackages
+
+# We really only want this built by things that need it, not any recrdeptask
+deltask do_build
-- 
2.7.4


