Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 32F7B601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 14:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4PERw0N003243 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 15:27:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zR3MlNYFjN1S
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 15:27:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4PERqYq003238
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 15:27:53 +0100
Message-ID: <1464186472.9570.102.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 25 May 2016 15:27:52 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] diffutils: Add patch to fix gplv2 version with gcc6
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
X-List-Received-Date: Wed, 25 May 2016 14:28:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/diffutils/diffutils-2.8.1/fix_gcc6.patch b/meta/recipes-extended/diffutils/diffutils-2.8.1/fix_gcc6.patch
new file mode 100644
index 0000000..f915287
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils-2.8.1/fix_gcc6.patch
@@ -0,0 +1,31 @@
+Fixes to allow diffutils to build with gcc v6.
+
+RP
+2016/5/25
+
+Index: diffutils-2.8.1/lib/posix/regex.h
+===================================================================
+--- diffutils-2.8.1.orig/lib/posix/regex.h
++++ diffutils-2.8.1/lib/posix/regex.h
+@@ -529,7 +529,9 @@ extern int re_exec _RE_ARGS ((const char
+ /* For now unconditionally define __restrict_arr to expand to nothing.
+    Ideally we would have a test for the compiler which allows defining
+    it to restrict.  */
++#ifndef __restrict_arr
+ #define __restrict_arr
++#endif
+ 
+ /* POSIX compatibility.  */
+ extern int regcomp _RE_ARGS ((regex_t *__restrict __preg,
+Index: diffutils-2.8.1/src/diff.c
+===================================================================
+--- diffutils-2.8.1.orig/src/diff.c
++++ diffutils-2.8.1/src/diff.c
+@@ -71,6 +71,7 @@ static void usage (void);
+ static bool recursive;
+ 
+ /* In context diffs, show previous lines that match these regexps.  */
++struct re_pattern_buffer function_regexp;
+ static struct regexp_list function_regexp_list;
+ 
+ /* Ignore changes affecting only lines that match these regexps.  */
diff --git a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
index bf425bb..fe56f9c 100644
--- a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
+++ b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
@@ -6,7 +6,8 @@ require diffutils.inc
 PR = "r7.0"
 
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz \
-           file://diffutils_fix_for_automake-1.12.patch"
+           file://diffutils_fix_for_automake-1.12.patch \
+           file://fix_gcc6.patch"
 
 SRC_URI[md5sum] = "71f9c5ae19b60608f6c7f162da86a428"
 SRC_URI[sha256sum] = "c5001748b069224dd98bf1bb9ee877321c7de8b332c8aad5af3e2a7372d23f5a"



