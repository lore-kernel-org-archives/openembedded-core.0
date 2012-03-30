Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDhXo-00037T-QL
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 21:31:33 +0200
Received: by pbcum15 with SMTP id um15so1919330pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gAu0asRs96LeMxQ3G2kCf/8ZqIOKStHL6beOv4hYJ/w=;
	b=Ka5sr3K6mgry6q42MpTi4gF5JezJFVqsHrTyMZscPaO7oJjg/0H6pj1cMQ9fLrmq9+
	u7BqeeAYYLZhJ5JYQIwshdVE9SqEKBCnU8ZkSE1gUowjMftvZoIxuLkj/ZG7xcgdkf6R
	LFfwuEX5SWW5/rBQsZZTqkF1A594OCG1nSDJoKyZk88elmP3ft34ZEFDHWIEFJ0bnPtd
	UJs+KqnuInZMPjILJ5D28fQk1hVcJSMsze4Bsm9FY5Xw8SKbYW8hxhAiM8IqEeP+VNhG
	c7EGMsSJl1p/zusNYkWKDNpbGuSKltwdyU6RQ8lZb/437TRWk/8JhlTQTsMmzCZIqwNQ
	N9fg==
Received: by 10.68.231.41 with SMTP id td9mr79365pbc.25.1333135347111;
	Fri, 30 Mar 2012 12:22:27 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id b6sm7971720pbf.32.2012.03.30.12.22.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 12:22:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 12:21:30 -0700
Message-Id: <1333135290-13424-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] webkit: Fix build with gcc-4.7
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
X-List-Received-Date: Fri, 30 Mar 2012 19:31:33 -0000

Include unistd.h for all linux and not
just for android.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-sato/webkit/files/function-scope.patch |   21 ++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/files/function-scope.patch

diff --git a/meta/recipes-sato/webkit/files/function-scope.patch b/meta/recipes-sato/webkit/files/function-scope.patch
new file mode 100644
index 0000000..a20a805
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/function-scope.patch
@@ -0,0 +1,21 @@
+we need to include unistd.h on all linux platforms therefore
+extend the conditional inclusion accordingly
+
+This gets proper declation of sleep() into the source file
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: webkit-gtk-1.7.2+svnr101488-r3/Tools/DumpRenderTree/TestNetscapePlugIn/PluginTest.cpp
+===================================================================
+--- webkit-gtk-1.7.2+svnr101488-r3.orig/Tools/DumpRenderTree/TestNetscapePlugIn/PluginTest.cpp	2012-03-30 12:11:04.912613223 -0700
++++ webkit-gtk-1.7.2+svnr101488-r3/Tools/DumpRenderTree/TestNetscapePlugIn/PluginTest.cpp	2012-03-30 12:14:21.840622752 -0700
+@@ -29,7 +29,7 @@
+ #include <assert.h>
+ #include <string.h>
+ 
+-#if defined(ANDROID)
++#if defined(__linux__)
+ #include <unistd.h>
+ #endif
+ 
diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9181c2c..7db573d 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -15,7 +15,7 @@ SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -28,6 +28,7 @@ SRC_URI = "\
   file://GNUmakefile.am \
   file://gtk-doc.make \
   file://nodolt.patch \
+  file://function-scope.patch \
  "
 
 S = "${WORKDIR}/"
-- 
1.7.5.4



