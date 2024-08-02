Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B597C52D6F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 14:21:04 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.94053.1722608462968333912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 07:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ZJvvowbs;
 spf=pass (domain: baylibre.com, ip: 209.85.166.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8152f0c63c1so290741239f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722608462; x=1723213262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oD/W69ABO8dMq0MhIPY9W0jZK5C/54X31hxyXvNqefg=;
        b=ZJvvowbsFVIAFDOulNEIjA/1MV6BKp+HxHQh4ZLgwGEHQkFyYQhjvEwo0JBTWXpZ0+
         LvK+T6V8J/m4MzCb3x5AKPXUqBAltHtZCdO4hzbNxR8wILoKI5iYBs/p4PjrQhQvIEMJ
         tE0BUa/RY0v2nw8wuvCYWE+sBG28xjB+1CqBh4p+pvLbpCMxDZBZCzUNDF1AQq1Yox8i
         DmvR2dtfmvOOlP7DY83WPBH+CznFMKzxQd43g2QsxXKHGn4uHAGmtfwMClSx6a64Kmn6
         RE55Gfqyaa9pxErYZj1MoLn2blRntSL3z57vfI5dzlj1739fSMKHoVD1N9BC9plZh5zm
         4I5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722608462; x=1723213262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oD/W69ABO8dMq0MhIPY9W0jZK5C/54X31hxyXvNqefg=;
        b=doFXBbiHqBssRrEAPMrVhxlip+NzokZjwdQEUN3OvOlgfLNjRJD0I4qQ4KtNfT8ude
         h9x3QeWgzg3lMe8xZNttiLSNdk9lFTP9zC8SA9ff71KGrdDoYQI1abs8FD7Q926UEkya
         694lnYk8xCS+20hkhvdJBnVNuWeyXDGeAu4dOrZBr2rYtWptRiyHHzwTlH8zeJLS5wYC
         JFrOxZfWAURLMLB9WCnYjWci8JZL4kigaXZg3Qj+/LOyaPJNHcKSbvzA6jDe1gYVeWhN
         5Kw6F4JnWo3vaWJ+95Um3RIRlk42/p8krQ//tVD1a89L8MBVOCgM0BpslZwqDC2VTtBI
         MbTA==
X-Gm-Message-State: AOJu0YxAmo5ZzD66xAPwEdO6M97igSMl13f5mWfCyYkQ2HuG2qRbuAKj
	RvH8+jO7c4RRphZeZkP6h9XvKIMxkRhXq1ffwzGMkaxz1BC2ZoAINGqHZp5Wia+Q9FVFCiWFaoT
	E
X-Google-Smtp-Source: AGHT+IEkIw3uWslcpQzVDQHhZonXScOeuiHliVajrYnMS8BQhCsFfWXa6kgvDWt/3vMfwDwMqbVVRg==
X-Received: by 2002:a05:6602:140c:b0:803:5e55:ecb2 with SMTP id ca18e2360f4ac-81fd42b7e3fmr502110939f.0.1722608461802;
        Fri, 02 Aug 2024 07:21:01 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c8d6a2733bsm480896173.101.2024.08.02.07.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 07:21:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] nettle: upgrade 3.9.1 -> 3.10
Date: Fri,  2 Aug 2024 10:21:00 -0400
Message-Id: <20240802142100.372254-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 14:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202914

Refresh two patches to apply on top of 3.10.

11 of the ptests pass without the sc-valgrind.sh file, so make sure
that's copied to the image fo ptests.

Changelog: https://git.lysator.liu.se/nettle/nettle/-/blob/master/ChangeLog

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...get-to-only-build-tests-not-run-them.patch | 21 ++++++++++-----
 ...der-files-of-openssl-only-if-enable_.patch | 26 +++++++++++++------
 .../{nettle_3.9.1.bb => nettle_3.10.bb}       |  3 ++-
 3 files changed, 34 insertions(+), 16 deletions(-)
 rename meta/recipes-support/nettle/{nettle_3.9.1.bb => nettle_3.10.bb} (94%)

diff --git a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
index e3f5c6de7d..345fc43ebe 100644
--- a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
+++ b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
@@ -1,4 +1,7 @@
-Add target to only build tests (not run them)
+From e9fcb2177fda228ac065d189240e2d992e86e5bf Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 2 Aug 2024 09:48:43 -0400
+Subject: [PATCH] Makefile.in: Add target to only build tests (not run them)
 
 Not sending upstream as this is only a start of a solution to
 installable tests: It's useful for us already as is.
@@ -8,16 +11,20 @@ Upstream-Status: Inappropriate [not a complete solution]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Refactored for 3.4
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Refactor for 3.10, including turning it into an mbox for easier use.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  Makefile.in           | 3 +++
  testsuite/Makefile.in | 2 ++
  2 files changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index e5ccfc7..15c9275 100644
+index 2bf7f1e8..403a868a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -52,6 +52,9 @@ clean distclean mostlyclean maintainer-clean tags:
+@@ -53,6 +53,9 @@ clean distclean mostlyclean maintainer-clean tags:
  	  echo "Making $@ in $$d" ; (cd $$d && $(MAKE) $@); done
  	$(MAKE) $@-here
  
@@ -28,18 +35,18 @@ index e5ccfc7..15c9275 100644
  	true
  
 diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
-index 3f5e5f6..8fd68a3 100644
+index 0699fa0d..8ac9983c 100644
 --- a/testsuite/Makefile.in
 +++ b/testsuite/Makefile.in
-@@ -122,6 +122,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../nettle-internal.$(OBJEXT) \
+@@ -137,6 +137,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../non-nettle.$(OBJEXT) \
  # data.
  VALGRIND = valgrind --error-exitcode=1 --leak-check=full --show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
  
 +buildtest: $(TS_ALL)
 +
- check: $(TS_ALL)
+ check: $(TS_ALL) $(TS_ALL:sc-%=%)
  	TEST_SHLIB_DIR="$(TEST_SHLIB_DIR)" \
  	  srcdir="$(srcdir)" \
 -- 
-2.17.1
+2.39.2
 
diff --git a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
index d5f266681e..49d633b5f7 100644
--- a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
+++ b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
@@ -1,4 +1,4 @@
-From ffee6b5f6204a0210f717968ec6ce514d70acca1 Mon Sep 17 00:00:00 2001
+From 5f7cdd2b878298577accade43a38e1a0951d17b4 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Fri, 9 Dec 2016 15:23:17 +0800
 Subject: [PATCH] nettle: check header files of openssl only if
@@ -15,22 +15,32 @@ refactored for 3.4. pending not in as of 3.4
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
 
-Index: nettle-3.4/configure.ac
-===================================================================
---- nettle-3.4.orig/configure.ac
-+++ nettle-3.4/configure.ac
-@@ -185,9 +185,11 @@ AC_HEADER_TIME
+Refactor for 3.10.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ configure.ac | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4f27e663..673c1492 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -197,9 +197,11 @@ AC_TYPE_SIZE_T
  AC_CHECK_SIZEOF(long)
  AC_CHECK_SIZEOF(size_t)
  
--AC_CHECK_HEADERS([openssl/evp.h openssl/ecdsa.h],,
+-AC_CHECK_HEADERS([openssl/evp.h openssl/ec.h openssl/rsa.h],,
 -[enable_openssl=no
 - break])
 +if test "x$enable_openssl" = "xyes"; then
-+  AC_CHECK_HEADERS([openssl/evp.h openssl/ecdsa.h],,
++  AC_CHECK_HEADERS([openssl/evp.h openssl/ec.h openssl/rsa.h],,
 +  [enable_openssl=no
 +   break])
 +fi
  
  # For use by the testsuite
  AC_CHECK_HEADERS([valgrind/memcheck.h])
+-- 
+2.39.2
+
diff --git a/meta/recipes-support/nettle/nettle_3.9.1.bb b/meta/recipes-support/nettle/nettle_3.10.bb
similarity index 94%
rename from meta/recipes-support/nettle/nettle_3.9.1.bb
rename to meta/recipes-support/nettle/nettle_3.10.bb
index 396708cf87..92bc78263c 100644
--- a/meta/recipes-support/nettle/nettle_3.9.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.10.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
-SRC_URI[sha256sum] = "ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3"
+SRC_URI[sha256sum] = "b4c518adb174e484cb4acea54118f02380c7133771e7e9beb98a0787194ee47c"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -46,6 +46,7 @@ do_install_ptest() {
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
         install ${S}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
         install ${S}/testsuite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/
+        install ${S}/testsuite/sc-valgrind.sh ${D}${PTEST_PATH}/testsuite/
 
         # Install a symlink for dlopen-test
         ln -sr ${D}${libdir}/libnettle.so.*.* ${D}${PTEST_PATH}/libnettle.so
-- 
2.39.2


