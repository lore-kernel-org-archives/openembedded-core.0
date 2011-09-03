Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzuwd-0004Fa-Ar
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 20:27:55 +0200
Received: by bkbzu17 with SMTP id zu17so3341494bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=T6xGAFP0s+A9kbVa1JX2/axK9Kd9fK6mf9nZDYE7dHk=;
	b=rgc+16b1fqhwLLL8qvlc0KwwkDP2Ciu60VXpjosRN4Kx6SKPsZ+1/875Phk31W6Mb6
	urOqF7fKgJAXjZg5gnQcSBreCokVFUFj7nXK1+fO2RZs7egp0Rm2JoY+wFOgD2poEhbJ
	+Cp0LFugLgHHH5HMYTyppwMl1s2AqU2mH+G2k=
Received: by 10.204.139.206 with SMTP id f14mr1213673bku.309.1315074177510;
	Sat, 03 Sep 2011 11:22:57 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id q9sm1082438bkd.8.2011.09.03.11.22.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 11:22:56 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 22:22:44 +0400
Message-Id: <1315074165-20137-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
References: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/3] icu-3.6: fix building with big make -j
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
X-List-Received-Date: Sat, 03 Sep 2011 18:27:55 -0000

icu-3.6 buildsystem contains small problem which causes some parallel
builds to fail. Fix that.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../icu/files/fix-parallel-build.patch             |   19 +++++++++++++++++++
 meta/recipes-support/icu/icu-3.6.inc               |    1 +
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/icu/files/fix-parallel-build.patch

diff --git a/meta/recipes-support/icu/files/fix-parallel-build.patch b/meta/recipes-support/icu/files/fix-parallel-build.patch
new file mode 100644
index 0000000..5b01a4c
--- /dev/null
+++ b/meta/recipes-support/icu/files/fix-parallel-build.patch
@@ -0,0 +1,19 @@
+Upstream-Status: pending
+
+Fix parallel builds
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: source/data/Makefile.in
+===================================================================
+--- source.orig/data/Makefile.in	2011-09-02 02:03:37.000000000 +0400
++++ source/data/Makefile.in	2011-09-02 02:06:26.000000000 +0400
+@@ -351,8 +351,8 @@
+ endif
+
+
+-build-dir: $(BUILD_DIRS)
+-$(BUILD_DIRS):
++$(MAINBUILDDIR) $(BUILD_DIRS): build-dir
++build-dir:
+	-$(MKINSTALLDIRS) $(BUILD_DIRS)
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index 1c611bd..18efd16 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -3,6 +3,7 @@ HOMEPAGE = "http://www-01.ibm.com/software/globalization/icu/index.jsp"
 
 BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-3_6-src.tgz \
            file://gccfix.patch;apply=yes \
+           file://fix-parallel-build.patch \
            file://use-g++-for-linking.patch;apply=yes"
 SRC_URI = "${BASE_SRC_URI} \
            file://noldlibpath.patch;apply=yes"
-- 
1.7.2.5



