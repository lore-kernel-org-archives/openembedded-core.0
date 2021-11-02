Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A826C43217
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.6591.1635842597277586896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h6zE2oJ4;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id t30so7186360wra.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5cVB5P3TeOYtCOLEXB9ysYlUgYKEba0iXM1aPINRdY=;
        b=h6zE2oJ44cWM83XCH8xzHlUDjlzNB1y6UiTU/MEHua88sJ+OqTvu8TZNRwnyHcxIy1
         dQz3Hk9ws6/IUqErBvrQpuC5kpWqf2Ujl9EefQt6sG4lQSXOoy/4StXsAIDgAo7UKnyf
         B7qf0jl834AFuUymFHi330AtfpFeY4TT6GMv6RUMxONJngw/zZw42/HBijkI38cghGdg
         shBWVzsuQn33cBFvB+HKcoAevX2VPdhzjX0+bDWFRLZ7kJEyqY84rNFQAMNcI4K2xtna
         YfGaorkeBJ6tjIb3pacI6MzUk+DnvwvBSrEjdtfCAYRVvhmbrCQUQJdT68es+C/owrc7
         qTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5cVB5P3TeOYtCOLEXB9ysYlUgYKEba0iXM1aPINRdY=;
        b=AQsLNrSilTUDSbD2CovdcqSQ4cNM/Nke/LCoKnJytKaW1apmpoNjbvyu5qyKYWX9Tl
         5IFnzhVRJa6nKZcSSUlZ18NcBqVE2JHUNMptNVy82ieQOQgK45SC8mDg4vYvw5iJbK8E
         3w9DkXsxRx8vfT8pnObiXgxK/6keZZ857Mrow0C/fXSVb97LmCLAUKw3i9P8fpEaMUb0
         ffNj5DVacoyQ0S+s4k5DIWLVL6pEGBHXxj4zo3K4ixkPSg09+NNqbLCDSa2/AN1+4rJv
         3BfQ42zmxMEZNKLkZxl1d6Wh7f9mMzbz1467OnJE7TgzplXxZFibVA4l2BL66UuXMUwQ
         tH9w==
X-Gm-Message-State: AOAM533G6u+/0grPtbfD0pGRXtA4QI0TORO9eDypq/L7tvogoULcAg3d
	+zIxNId8IGpOW0v+46hU65aYH1yZsMM=
X-Google-Smtp-Source: 
 ABdhPJxqYeXa3Ly3yRyNfALhSNt7Bp70IJ0Vh9ZgTkzU9kFL43N5CcGvMkQNUqx0hclUGvHyFoXfxw==
X-Received: by 2002:adf:fe4b:: with SMTP id
 m11mr29312038wrs.136.1635842595873;
        Tue, 02 Nov 2021 01:43:15 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/33] gdbm: upgrade 1.19 -> 1.22
Date: Tue,  2 Nov 2021 09:42:47 +0100
Message-Id: <20211102084303.2974802-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157755

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


