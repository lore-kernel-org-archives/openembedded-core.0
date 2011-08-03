Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qoimi-0001td-4t
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:15:24 +0200
Received: by gyg4 with SMTP id 4so444255gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 14:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lwkS9ovPWPvrPamtOQvtrgsJntCz+Tl6BBR3VnMPlXg=;
	b=JwYXBAkd9Q9Y5bs+d2BdxHOB5YRFfGSYMRlMzXncPVioy5c5viij/WNjKTGdb+LKog
	2YHAcTnW9omM9hFabb7P8vSTrR7fTS4BStzpPCfUhZkm7u8jo63qOaU3H2rL7OPiqKLa
	sp949MvnrjWsYo6QwCey5xlABLzN3LUTB8dOQ=
Received: by 10.42.130.133 with SMTP id v5mr5596574ics.207.1312405859216;
	Wed, 03 Aug 2011 14:10:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v16sm783426ibe.51.2011.08.03.14.10.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 14:10:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:12:30 -0700
Message-Id: <1312405950-15032-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1312405950-15032-1-git-send-email-raj.khem@gmail.com>
References: <1312405950-15032-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] coreutils: Fix build on uclibc
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
X-List-Received-Date: Wed, 03 Aug 2011 21:15:24 -0000

coreutils has getloadavg.m4 of its own. So we need
to make sure that we remove the portions which look
into hardcoded /usr/local/lib paths. These tests are
only for AIX so we dont lose much

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../remove-usr-local-lib-from-m4.patch             |   31 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.12.bb      |    6 ++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch
new file mode 100644
index 0000000..aac097a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch
@@ -0,0 +1,31 @@
+We have problem using hardcoded directories like /usr/local here
+which will be checked for cross builds. This is a special case which
+is valid for AIX only. We do not have AIX as one of our supported
+build host or target. Therefore we get rid of the hardcoded paths
+and make life easier for cross compilation process.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
+
+Index: coreutils-8.12/m4/getloadavg.m4
+===================================================================
+--- coreutils-8.12.orig/m4/getloadavg.m4	2011-08-03 14:03:59.982197767 -0700
++++ coreutils-8.12/m4/getloadavg.m4	2011-08-03 14:04:20.402197763 -0700
+@@ -44,16 +44,6 @@ AC_CHECK_FUNC([getloadavg], [],
+        [LIBS="-lutil $LIBS" gl_have_func=yes])
+    fi
+ 
+-   if test $gl_have_func = no; then
+-     # There is a commonly available library for RS/6000 AIX.
+-     # Since it is not a standard part of AIX, it might be installed locally.
+-     gl_getloadavg_LIBS=$LIBS
+-     LIBS="-L/usr/local/lib $LIBS"
+-     AC_CHECK_LIB([getloadavg], [getloadavg],
+-                  [LIBS="-lgetloadavg $LIBS" gl_have_func=yes],
+-                  [LIBS=$gl_getloadavg_LIBS])
+-   fi
+-
+    # Set up the replacement function if necessary.
+    if test $gl_have_func = no; then
+      AC_LIBOBJ([getloadavg])
diff --git a/meta/recipes-core/coreutils/coreutils_8.12.bb b/meta/recipes-core/coreutils/coreutils_8.12.bb
index 00746b9..0004ce7 100644
--- a/meta/recipes-core/coreutils/coreutils_8.12.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.12.bb
@@ -7,13 +7,15 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r2"
+PR = "r3"
 DEPENDS = "gmp"
 DEPENDS_virtclass-native = ""
 
 inherit autotools gettext
 
-SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.gz \
+           file://remove-usr-local-lib-from-m4.patch \
+          "
 
 SRC_URI[md5sum] = "fce7999953a67243d00d75cc86dbcaa6"
 SRC_URI[sha256sum] = "9e233a62c98a3378a7b0483d2ae3d662dbaf6cd3917d3830d3514665e12a85c8"
-- 
1.7.4.1



