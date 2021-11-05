Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C9AC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 08:48:21 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.2744.1636102100261150975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nAi+qnxl;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u18so12546094wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5cVB5P3TeOYtCOLEXB9ysYlUgYKEba0iXM1aPINRdY=;
        b=nAi+qnxlmUasfYsMi3Z5bXOiewu6nhW1CXsUSZQBvnRwG37a42VLEsY24U9UVFZ+jS
         V2LSlYqD9taz7Pcq8XVUzPmapFVu7f2VO7Fvz9ZtgFqq3x9V98l28TKC1Alqo1g7vUi5
         gAyUcYW7qiZevNWbtCQenlrDbzxP7wXZ8p6eCnLgEW06lCUJM9DNKAyXsy0sJAWBQG6/
         RNpepqMlUoSy6+NBehSS73MvT4h/gh/E3WS707N2Lw4A4gIL0toRKUtM9HK5ds9YF0UM
         6MXIf4UTsIqNMLMbSaL5x9vPQyG3D5lxv566trjUR60A1PXRnKuayWq0bnWlgfbQaiIw
         y+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5cVB5P3TeOYtCOLEXB9ysYlUgYKEba0iXM1aPINRdY=;
        b=cRFox7tbUrIVISuoiJT5rBIgIoFfdCA4LMj3r9p57GLgc2UXBIDrRdLnVJauuusfmv
         TiuELJUPOQsZzI0ZjGuldnNHMoAMTleRdtqIfiWC+EYxptbIIfdIJq1zRHL8AhTrtHIo
         M8016fnnFCXmM+2WO4QiTUztaBrkCoObXt9T5wWdJUCkIRnA9O3+QsTgPvNLrPHIHJP3
         0Nx461W50K9xxR6JKGLDtS92OqR8SVRYrWoVe8VDBz0eteMOjkoIKXJEe9G/zO3YXulK
         B3iEMWWYnEJCZpWBD/WZfGJE013e/ABNDEaKZ4yrqR32zRwfuma2t2NnCAxrjQYiuTKI
         GeOQ==
X-Gm-Message-State: AOAM532/u0lxQpw+Z5o7MYuyfDb0wAZVaXs6hA+rPm6cyTIiMjg0/zI4
	tM1VOLYxd9Cawo0ylGFyQGtcvZghAPI=
X-Google-Smtp-Source: 
 ABdhPJzYfVn4h0uX3F8xm/QaK+k0EkRZjb3aTnFZDGDaXlyM6+diDJqZBDxVAqyJfHJR7m9KSKXDMA==
X-Received: by 2002:a5d:550f:: with SMTP id
 b15mr63135834wrv.212.1636102098765;
        Fri, 05 Nov 2021 01:48:18 -0700 (PDT)
Received: from nereus.lab.linutronix.de. ([109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d7sm7230432wrw.87.2021.11.05.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:48:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/7] gdbm: upgrade 1.19 -> 1.22
Date: Fri,  5 Nov 2021 09:48:06 +0100
Message-Id: <20211105084812.1828227-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 08:48:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157882

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/gdbm/files/ptest.patch    | 18 +++++++++---------
 .../gdbm/{gdbm_1.19.bb => gdbm_1.22.bb}        |  3 +--
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.22.bb} (90%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index 1e67dbd554..187f09655d 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -1,4 +1,4 @@
-From 41448708e163c8ec1f980464e7dd6741db427c8a Mon Sep 17 00:00:00 2001
+From 8bea84a598b51a7ac7e50aa8f0f20857a9b6b07b Mon Sep 17 00:00:00 2001
 From: Josep Puigdemont <josep.puigdemont@enea.com>
 Date: Sun, 4 May 2014 16:02:07 +0200
 Subject: [PATCH] Add install-ptest rules.
@@ -13,12 +13,12 @@ Upstream-Status: Pending
  2 files changed, 16 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index ecc03df..9fbbda5 100644
+index 25e200d..03d5ef0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -55,3 +55,8 @@ ChangeLog:
-                 awk -f $(top_srcdir)/git2chg.awk                            \
-                     -v append=$(top_srcdir)/$(prev_change_log) > ChangeLog; \
+@@ -64,3 +64,8 @@ ChangeLog:
+             mv ChangeLog.tmp ChangeLog;                                     \
+           rm -f ChangeLog.tmp;                                              \
          fi
 +
 +install-ptest:
@@ -26,12 +26,12 @@ index ecc03df..9fbbda5 100644
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index dbe17dd..06f537f 100644
+index 337cbed..92ec3be 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -169,3 +169,14 @@ EXTRA_DIST += \
-   gdbmtool/base.exp\
-   config/default.exp
+@@ -139,3 +139,14 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+ 
+ SUBDIRS = gdbmtool
  
 +buildtests: $(check_PROGRAMS) $(TESTSUITE)
 +
diff --git a/meta/recipes-support/gdbm/gdbm_1.19.bb b/meta/recipes-support/gdbm/gdbm_1.22.bb
similarity index 90%
rename from meta/recipes-support/gdbm/gdbm_1.19.bb
rename to meta/recipes-support/gdbm/gdbm_1.22.bb
index 1d1a0c8dd1..5cb12cd57c 100644
--- a/meta/recipes-support/gdbm/gdbm_1.19.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.22.bb
@@ -13,8 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
-SRC_URI[sha256sum] = "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
+SRC_URI[sha256sum] = "f366c823a6724af313b6bbe975b2809f9a157e5f6a43612a72949138d161d762"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.20.1


