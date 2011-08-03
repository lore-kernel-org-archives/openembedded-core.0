Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qoimf-0001tV-Jv
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:15:21 +0200
Received: by iyj12 with SMTP id 12so1429397iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 14:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=CMpNckOIwxqxWuPUwDxNHc/bO9WYB0w1cS4J1mKhUNQ=;
	b=urYd05c0vAQR6Hq16Sw89/rXgEH7khGrXXStWCC7LvoblcwrhOjW/01y/oDc9Y/2Ju
	IWZVAQJ/TmkqENxBWC6Y2o/A43zq69uQcRK8b7pl9f2gZRkbJWfkBhOC07LId1ZN1QoH
	ySbGobmWqURIbrZ+oh3iHvRsNvox2rWTByTWk=
Received: by 10.231.111.39 with SMTP id q39mr5042770ibp.106.1312405858042;
	Wed, 03 Aug 2011 14:10:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v16sm783426ibe.51.2011.08.03.14.10.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 14:10:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:12:29 -0700
Message-Id: <1312405950-15032-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1312405950-15032-1-git-send-email-raj.khem@gmail.com>
References: <1312405950-15032-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] autoconf: Remove code checking for hardcoded /usr/local
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2011 21:15:21 -0000

This code is only relevant for AIX and causes
problems with OE QA sniffer which detects -L/usr/local/lib
on linker commandline during cross compile and rightly barfs

This only happens when getloadavg() is not found in libc
so we do not reach that code with eglibc but only with uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autoconf/remove-usr-local-lib-from-m4.patch    |   29 ++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
new file mode 100644
index 0000000..55d2e2f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
@@ -0,0 +1,29 @@
+We have problem using hardcoded directories like /usr/local here
+which will be checked for cross builds. This is a special case which
+is valid for AIX only. We do not have AIX as one of our supported
+build host or target. Therefore we get rid of the hardcoded paths
+and make life easier for cross compilation process.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
+Index: autoconf-2.68/lib/autoconf/functions.m4
+===================================================================
+--- autoconf-2.68.orig/lib/autoconf/functions.m4	2010-09-22 14:52:19.000000000 -0700
++++ autoconf-2.68/lib/autoconf/functions.m4	2011-08-03 11:57:05.822199513 -0700
+@@ -749,15 +749,6 @@ if test $ac_have_func = no; then
+     [LIBS="-lutil $LIBS" ac_have_func=yes ac_cv_func_getloadavg_setgid=yes])
+ fi
+ 
+-if test $ac_have_func = no; then
+-  # There is a commonly available library for RS/6000 AIX.
+-  # Since it is not a standard part of AIX, it might be installed locally.
+-  ac_getloadavg_LIBS=$LIBS
+-  LIBS="-L/usr/local/lib $LIBS"
+-  AC_CHECK_LIB(getloadavg, getloadavg,
+-	       [LIBS="-lgetloadavg $LIBS"], [LIBS=$ac_getloadavg_LIBS])
+-fi
+-
+ # Make sure it is really in the library, if we think we found it,
+ # otherwise set up the replacement function.
+ AC_CHECK_FUNCS(getloadavg, [],
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 3b196a6..c6209a3 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r1"
+PR = "r2"
 
 PARALLEL_MAKE = ""
 
@@ -16,6 +16,7 @@ SRC_URI += "file://autoreconf-include.patch \
 	    file://autoheader-nonfatal-warnings.patch \
 	    ${@['file://path_prog_fixes.patch', ''][bb.data.inherits_class('native', d)]} \
             file://config_site.patch \
+            file://remove-usr-local-lib-from-m4.patch \
            "
 
 SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
-- 
1.7.4.1



