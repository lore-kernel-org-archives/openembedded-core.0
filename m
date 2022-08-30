Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD95ECAAD5
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 22:58:47 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.18900.1661900316201373539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 15:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bqXbzBGx;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id bh13so11967958pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 15:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ST2wH3/+6/Xf2L/fQrphckr+tqBEwDKjVdcqrFcsi48=;
        b=bqXbzBGxYK5Cea0z/aQ84QOdCk4/dPNgmzLr5IoGC23yLBBX79TgyG4wKc9x46ohKE
         GNQqtnFtp+bZm3q9ww/lDa2wp8dTMmbKhB2NIxxSjtf0ubsFhUAAXONDFW+lALPrlc3L
         JBGcGtZjYr1/CT5tFpOHWpm1UBUDcBbbeTSNXPEyK+pykMQhoNYeKTiPNnaOq2bsykFo
         m+nfJ5xYrexDojXM/rTDUiFhhjI/U0EXY8tIcmEIBo4IAK2bkZ7DeWkHYnrlA33/hjsd
         SV37YC1BbWK3NWE49e9Uj8kEG78hmN26ZwEqS4la9Ey25QuIW1Y/4o2daG5KsIaWyq/h
         G7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ST2wH3/+6/Xf2L/fQrphckr+tqBEwDKjVdcqrFcsi48=;
        b=kOY2IhdJcSGP6SknZwSMYnpAA9nvMrVR0SiUc7DH41gE+LOz1tdBuVo7Y/jny1ey3Y
         E8E+8sJtig0CdyGey/hJbXuGK4djG7yGjYlfkDmyh3M9KlEnfSMgVWRHZ3pHgdWxjARQ
         KBHH1sD8zShWqqoI2b4INO7LiCnDZPkATMEJrKGbmiojjaQJrgY/P6Ej8j64Ht+Ut9nf
         ZnNApsRcVf4L215XfTLYIr9sXl3CHe9A3l/AtnFabsahCmuOZDwjSmQgXOoOQuYuUoHG
         jZK7QRkaC17Hvgq/Y49U89YUP/gEDf+ehYLSyAjMzayjAVBEIX4BVHbOPvdgD81hJk+r
         Gl+w==
X-Gm-Message-State: ACgBeo24LNJ6p7uHhbtg9WVlFD4wTgdY3I/5YFDJaRV8GZRXWQkogqCM
	L/hmJQQdKTDs9asSu1gM6h7zFhwjo/3mvQ==
X-Google-Smtp-Source: 
 AA6agR4bF6IthJO29xtCBM1sdRpEKWP9VTs1ye779kY0t0TKBXc2o12QPRHPMOtzpj4gFPugVLKZVA==
X-Received: by 2002:a63:f304:0:b0:42c:1057:e37 with SMTP id
 l4-20020a63f304000000b0042c10570e37mr10248600pgh.379.1661900315429;
        Tue, 30 Aug 2022 15:58:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm10176111plb.151.2022.08.30.15.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 15:58:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ncurses: Fix configure tests for exit and mbstate_t
Date: Tue, 30 Aug 2022 15:58:32 -0700
Message-Id: <20220830225832.2700943-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 22:58:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170092

These tests do not include needed headers which results in warnings and
as errors when using -Werror or latest clang e.g.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ncurses/files/exit_prototype.patch        | 22 +++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/exit_prototype.patch

diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
new file mode 100644
index 0000000000..791421a338
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -0,0 +1,22 @@
+Add needed headers for including mbstate_t and exit()
+
+Upstream-Status: Inappropriate [Reconfigure will solve it]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/configure
++++ b/configure
+@@ -3422,6 +3422,7 @@ rm -f "conftest.$ac_objext" "conftest.$a
+   cat >"conftest.$ac_ext" <<_ACEOF
+ #line 3423 "configure"
+ #include "confdefs.h"
++#include <stdlib.h>
+ $ac_declaration
+ int
+ main (void)
+@@ -12997,6 +12998,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+ #include <stdlib.h>
+ #include <stdarg.h>
+ #include <stdio.h>
++#include <wchar.h>
+ #ifdef HAVE_LIBUTF8_H
+ #include <libutf8.h>
+ #endif
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index 9fba5b584b..ca5fa32572 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
+           file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "20db1fb41ec91cd8a1f528e770362092c5403378"
-- 
2.37.3


