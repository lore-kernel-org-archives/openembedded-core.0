Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1C59760232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 13:00:26 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so35505828wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 05:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hIcQiO17D3RydKOgbqJW6tRcHHcobXRMoIdngTOai0o=;
	b=nglcQoxpm0fgvTQzSYsY945vaefBLaVwLTnLu1RChzbHKn8IHq/jOUo6Kv1+Iu105E
	OFCy5ylsljFfaH2hIVP2i2H9Fo1LJjpPleISibHrLPa+KHpxm6gWrksDPkUSmUMFfP/Z
	txxEp9xbX2c93KfJ3nLVpfHOowOBXQG3FM8isZQ2/78zYIh9Q5SbhITzxiof0y8hzU79
	zf9WCA9GwEDxGKx4NhF3Yj2FuB3lW7V7MOk9cO/ri2+FfjqA8Rda5zJ/lrG43/aCeOek
	bwXKtnTfdryLhRtA47S32s4ZFXicWnjSy9BV8szx22z2NSekPWeDFFfUYmx1C1kBiuj5
	ODig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hIcQiO17D3RydKOgbqJW6tRcHHcobXRMoIdngTOai0o=;
	b=gOE1j0AC74jWVdW4Trm1Pm8jt46t7lHH9ANrMHqrE5KOX5K2CbmXxd4iUZqFgG98ca
	OzImxDddwaGj2Ks63dI02jRa+HtDm9D45+kInQmvw6L93EY0WcxPyKuENu1ebVVy4i52
	ichDh7ZkT4kduDg/9qWoPWOQuwdWVeAo8p1zJceBj0SUAr0RfnOjKnB14bMdRxnnqM74
	WLMLeiZbhepNWJZ3uV97vMy7i5rCSE/ZF6QurdDFvGjrIDz2KnyFF0Rdt2oaPro75auA
	xWd52MijC1vdYNz+/2tk9QAiD3jMu+E74UHW3iKxm0g6q70zqcRFArxxFRHxYzCO0eQz
	Nnig==
X-Gm-Message-State: AD7BkJIIDGv98i9+RR6Yo7BY4PuRzMULQCfimitXskccYX5QVtq+97qhwZ35bL+WMuTYi5ou
X-Received: by 10.194.112.98 with SMTP id ip2mr20529579wjb.24.1456837226832;
	Tue, 01 Mar 2016 05:00:26 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lh1sm30726635wjb.20.2016.03.01.05.00.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 05:00:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 13:00:24 +0000
Message-Id: <1456837224-13101-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] rpm: fix races over rpmqv.c in parallel builds
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
X-List-Received-Date: Tue, 01 Mar 2016 13:00:27 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch | 37 +++++++++++++++-------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
index b3c14fd..b2437a8 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
@@ -1,4 +1,7 @@
-rpm: compile rpmqv.c instead of rpmqv.cc
+From e8bae261615e19ff8a28683765c9539cfb22a086 Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Thu, 17 Jul 2014 18:14:54 -0700
+Subject: [PATCH 1/9] rpm: compile rpmqv.c instead of rpmqv.cc
 
 Some versions of gcc, 4.4.5 for example, will put a reference to __gxx_personality_v0
 into rpm.o and rpmbuild.o.  This means we must link with g++, and the Makefile we
@@ -10,28 +13,38 @@ Upstream-Status: Inappropriate [other]
 
    When linking with g++ is really necessary, the upstream package will do that.
 
+Also instead of symlinking files in two places, which can and does race in
+parallel builds, simply refer to the file's full location [RB]
+
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+---
+ Makefile.am | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
-Index: rpm/Makefile.am
-===================================================================
---- rpm.orig/Makefile.am
-+++ rpm/Makefile.am
-@@ -202,14 +202,16 @@ rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAG
+diff --git a/Makefile.am b/Makefile.am
+index 1dade0a..55f8669 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -201,15 +201,13 @@ rpm_SOURCES =		build.c
+ rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
  rpm_LDADD =		rpm.o $(myLDADD)
  rpm.o:	$(top_srcdir)/rpmqv.c
- 	ln -sf $< rpmqv.cc
-+	ln -sf $< rpmqv.c
+-	ln -sf $< rpmqv.cc
 -	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c rpmqv.cc
-+	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c rpmqv.c
++	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $^
  
  rpmbuild_SOURCES =	build.c
  rpmbuild_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
  rpmbuild_LDADD =	rpmbuild.o $(myLDADD)
  rpmbuild.o:	$(top_srcdir)/rpmqv.c
- 	ln -sf $< rpmqv.cc
-+	ln -sf $< rpmqv.c
+-	ln -sf $< rpmqv.cc
 -	$(COMPILE) -DIAM_RPMBT -o $@ -c rpmqv.cc
-+	$(COMPILE) -DIAM_RPMBT -o $@ -c rpmqv.c
++	$(COMPILE) -DIAM_RPMBT -o $@ -c $^
  
  .syntastic_c_config: Makefile
  	@echo $(COMPILE) | tr ' ' '\n' | sed -e '1d' > $@
+-- 
+2.7.0
+
-- 
2.7.0


