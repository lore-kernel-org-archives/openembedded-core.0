Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 28B8B6612D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 20:12:02 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p65so663085wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 12:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hIcQiO17D3RydKOgbqJW6tRcHHcobXRMoIdngTOai0o=;
	b=saDrB55sQmrd2TpAcLeGH7Nt1kjbOCIGoI5vIob+CIybK9m61eHSB/AcNAWOu8oRS9
	/E9upC7oC9itSqQgEo8uoisl0wmtQC//sga6rkK0KA1MzNFZGCs6htjQrLkzfY425Irv
	PlTu8pGOkcGZcV2nmSL+gIimZq2m7l9Bwg7EHd/lSHZYka2PRI6Z890H2F40+OOzjtB3
	ROAAlZg+WXbcrOYy7gRhgp8Jl/jzKGCC4Efyea+2LQQDfknm4PR32PKneAeWcKVPxRxr
	BPknyeRVmj0kgpxMyIBXOHi9KEwPnZTpipQNHNrXzBfOnwBCqGF/ENiI0syIptR0+wsZ
	b2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hIcQiO17D3RydKOgbqJW6tRcHHcobXRMoIdngTOai0o=;
	b=KKohnenwvUvaTeeBIp7cwIiad1YOYzK9LM6tUfxy/gfD3uxAWC1GRqmi3kMAChNpk0
	UxEFHdRNEzcUvSXwlmrplsRNidU6diYXDHMS996kdGVDtWApJE/ezK3waCMgSbfjuThU
	CSDwhY+VHC5uVpP++cFYHcOBHtuO+X5RhV2D1nEfp+NSC5YLno1uYnYwoxPTrWfWyB+l
	cZp+BW7bnojwxLSKTKRMWz+GmcyD24Ir/WQK2WLvlaxh09b3rYTNRq95EJj8WYLUaRka
	p2jElWGxl239f1Kf9lzHHKU3mxTOz+X7CvzoqPE9WEdcdbLOhnLjbtq8xHIdrs7Ul1a+
	zZBw==
X-Gm-Message-State: AD7BkJKS3+HnAvNQGY26wFcQbrjHQbevtEMgGxb36U7kIqxXzGg2PZFRcE92Pqv2oBycFVVA
X-Received: by 10.28.215.16 with SMTP id o16mr14599967wmg.57.1457381522506;
	Mon, 07 Mar 2016 12:12:02 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	t8sm19510714wjy.41.2016.03.07.12.12.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 12:12:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2016 20:11:59 +0000
Message-Id: <1457381519-30481-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Mon, 07 Mar 2016 20:12:03 -0000

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


