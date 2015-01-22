Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED337251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:48:33 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so211988pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 23:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NK7X98i+tjEQfJZLMaIP55SM+IvB8HgZzsEw9CEFuXw=;
	b=dplKL4aeP0X2/4yEkfCXDJhku6q+7XZXZjrku57u1Swz7XJlDeFM2OBdA4l9oO0c9K
	Age4zQ7I3ivi/ttEkToDfE5bUUv2UmR9iIUVsC9pvtOdG19W1F0oYG0yd4zIX51kVfjJ
	Fu0GPJRmmvXl6lN0T2oN1lqXKo3Wa1HDbxYUb9sLqZdPnvDmznA93c2+jfLbb00B2UDk
	NKvN8SDuvr29fgfkMH3TQLcDmBjRd+Wz9G7xGAbA+IQBo4H1AxbQ+OisJh6WUEdNvOGM
	ReDmfhJMDiXXMS8otMvvUSV3JYGBP6RzkXiBUGGvjC6gr3WFy0crPJOd4SKcc/smBonF
	wC4Q==
X-Received: by 10.68.69.97 with SMTP id d1mr65060pbu.126.1421912914129;
	Wed, 21 Jan 2015 23:48:34 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id jp10sm8310358pbb.2.2015.01.21.23.48.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Jan 2015 23:48:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 23:48:21 -0800
Message-Id: <1421912901-16466-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] nss: update package to 3.17.3 and build fix
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
X-List-Received-Date: Thu, 22 Jan 2015 07:48:39 -0000

From: Armin Kuster <akuster@mvista.com>

Update includes:
CVE-2014-1569
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1569

for changelog information see
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.17.3_release_notes

We had a build failure on 32 bit hosts so including a patch from:
 http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/dora-misc

Wenzong Fan (1):
  nss: workaround multilib build on 32bit host

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nss/nss.inc                   |  1 +
 .../nss/nss/nss-fix-nsinstall-build.patch          | 35 ++++++++++++++++++++++
 meta/recipes-support/nss/nss_3.17.2.bb             |  8 -----
 meta/recipes-support/nss/nss_3.17.3.bb             |  7 +++++
 4 files changed, 43 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
 delete mode 100644 meta/recipes-support/nss/nss_3.17.2.bb
 create mode 100644 meta/recipes-support/nss/nss_3.17.3.bb

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index e5e3096..6330f4e 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -16,6 +16,7 @@ SRC_URI = "\
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
+    file://nss-fix-nsinstall-build.patch \
 "
 SRC_URI_append = "\
     file://nss.pc.in \
diff --git a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
new file mode 100644
index 0000000..866de07
--- /dev/null
+++ b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
@@ -0,0 +1,35 @@
+Fix nss multilib build on openSUSE 11.x 32bit
+
+While building lib64-nss on openSUSE 11.x 32bit, the nsinstall will
+fail with error:
+
+* nsinstall.c:1:0: sorry, unimplemented: 64-bit mode not compiled
+
+It caused by the '-m64' option which passed to host gcc.
+
+The nsinstall was built first while nss starting to build, it only runs
+on host to install built files, it doesn't need any cross-compling or
+multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
+error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+===================================================
+diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
+index 1850bcb..5aee84f 100644
+--- a/nss/coreconf/nsinstall/Makefile
++++ b/nss/coreconf/nsinstall/Makefile
+@@ -18,6 +18,12 @@ INTERNAL_TOOLS  = 1
+ 
+ include $(DEPTH)/coreconf/config.mk
+ 
++# nsinstall is unfit for cross-compiling/multilib-build since it was
++# always run on local host to install built files. This change intends
++# to clean the '-m64' from ARCHFLAG and LDFLAGS.
++ARCHFLAG =
++LDFLAGS =
++
+ ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
+ PROGRAM		=
+ else
diff --git a/meta/recipes-support/nss/nss_3.17.2.bb b/meta/recipes-support/nss/nss_3.17.2.bb
deleted file mode 100644
index 039406f..0000000
--- a/meta/recipes-support/nss/nss_3.17.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require nss.inc
-
-SRC_URI += "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_2_RTM/src/${BPN}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "d3edb6f6c3688b2fde67ec9c9a8c1214"
-SRC_URI[sha256sum] = "134929e44e44b968a4883f4ee513a71ae45d55b486cee41ee8e26c3cc84dab8b"
diff --git a/meta/recipes-support/nss/nss_3.17.3.bb b/meta/recipes-support/nss/nss_3.17.3.bb
new file mode 100644
index 0000000..e7d0780
--- /dev/null
+++ b/meta/recipes-support/nss/nss_3.17.3.bb
@@ -0,0 +1,7 @@
+require nss.inc
+
+SRC_URI += "\
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_3_RTM/src/${BP}.tar.gz \
+"
+SRC_URI[md5sum] = "fba7489e1b26f2a0bfe5527430fd61e1"
+SRC_URI[sha256sum] = "f4d5e9035a2f84f25f35c283de3b0ff60d72e918748de25eaf017ed201fa21d5"
-- 
1.9.1


