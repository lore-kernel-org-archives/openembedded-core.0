Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D916C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.9130.1635325676382805164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zyrg4neR;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id v127so1897162wme.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fDInaWHFw76Gl3Hk75DqdSJ7Sbx+ekwcw7f5PAsdRpE=;
        b=Zyrg4neRuNa/LL2DhSrrXz6fiG8TOOB8uMtnG1ObL2JnIAnrdORWU55PjOXR+GJp1z
         uvovi0WJRHaCSxkhq8V63qDP2sWlWNGDLACdDj50hoJXUkufva7fm0Bu3qdVDsCMXLJq
         7VgngexP3M0+NN0S59y41jFphimY5LDi2yhfS5Cjnvmee6lj5y9UN1tI+hSsZG+XjkWa
         SSATKfybK5m2N0N0PPQDHTWJEGkE+1zB/1lZCpQawoTxOxW/jQ9kxXT75fP1/gvGPqWO
         5aeLcoib3CuIJGRroOupNavTaj4azFUOiLOM9v6uyG9BZ8RzOBHgUMZLbQdkJkV01lby
         +DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fDInaWHFw76Gl3Hk75DqdSJ7Sbx+ekwcw7f5PAsdRpE=;
        b=DJW/9Dzv2jVE7N9OxLY2RnXNR3PdaUQCYc+g1xhsKVhKjd6zVjztEOUz89WZo8uhWW
         1Axg3OXuvztz2kNrpNbY6ovjFGj7bUcir8F16vncYZmFf9e7Et/fS0b5kP0GbUOmKnY3
         ISB+ibayeHN5R4yVMzCuj80NAmv8EvpWd8+iYZ4/WRYzwkGYJA5BKdFChQATfIc2vpn3
         HUoveTF3U6toj8urVNt/YJx2ifLgBBJVADUrFztwUrM9YDcm56VnJk9Ctxq4Pn0XF6t5
         imQF84L6UUgho7wL+/MsPoyxcht9fIlc16HPvXOnILpD7eoycVp2CUzRsKXvE8rVrwFR
         Cbcw==
X-Gm-Message-State: AOAM530+6kbv8B4ncB4LSOAsTNAXk3WG+EEMozFPizLi6knfHYAAjsVz
	BFuwtg/YH8FKg0XbcbWcdr4xi9/tD/U=
X-Google-Smtp-Source: 
 ABdhPJydX8eioM5NFnv/W64D3y5q3G9xsumtyDOloTtySP+mg0tQQw90K13fP8/RaQqDxHVkYi2hVw==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr4512086wmk.51.1635325675042;
        Wed, 27 Oct 2021 02:07:55 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/30] powertop: address ncurses 6.3 compatibility
Date: Wed, 27 Oct 2021 11:07:31 +0200
Message-Id: <20211027090736.2546759-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157501

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...c-fix-compatibility-with-ncurses-6.3.patch | 52 +++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.14.bb |  5 +-
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch b/meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch
new file mode 100644
index 0000000000..84b05ac971
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch
@@ -0,0 +1,52 @@
+From 76d3f0851520bc8488e432f423941f1e72cc7405 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 25 Oct 2021 17:47:23 +0200
+Subject: [PATCH] src: fix compatibility with ncurses 6.3
+
+Upstream-Status: Submitted [https://github.com/fenrus75/powertop/pull/92]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/devices/devfreq.cpp | 2 +-
+ src/display.cpp         | 2 +-
+ src/lib.cpp             | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
+index 0509d0f..b194ac4 100644
+--- a/src/devices/devfreq.cpp
++++ b/src/devices/devfreq.cpp
+@@ -297,7 +297,7 @@ void display_devfreq_devices(void)
+ 			df->fill_freq_utilization(j, buf);
+ 			strcat(fline, buf);
+ 			strcat(fline, "\n");
+-			wprintw(win, fline);
++			wprintw(win, "%s", fline);
+ 		}
+ 		wprintw(win, "\n");
+ 	}
+diff --git a/src/display.cpp b/src/display.cpp
+index 7131144..cc03919 100644
+--- a/src/display.cpp
++++ b/src/display.cpp
+@@ -125,7 +125,7 @@ void show_tab(unsigned int tab)
+ 
+ 	c = bottom_lines[tab_names[tab]].c_str();
+ 	if (c && strlen(c) > 0)
+-		mvwprintw(bottom_line, 0,0, c);
++		mvwprintw(bottom_line, 0,0, "%s", c);
+ 	else
+ 		mvwprintw(bottom_line, 0, 0,
+ 			"<ESC> %s | <TAB> / <Shift + TAB> %s | ", _("Exit"),
+diff --git a/src/lib.cpp b/src/lib.cpp
+index 5e48f37..5cd1c4a 100644
+--- a/src/lib.cpp
++++ b/src/lib.cpp
+@@ -583,7 +583,7 @@ void ui_notify_user_ncurses(const char *frmt, ...)
+ 	 * buffer */
+ 	vsnprintf(notify, UI_NOTIFY_BUFF_SZ - 1, frmt, list);
+ 	va_end(list);
+-	mvprintw(1, 0, notify);
++	mvprintw(1, 0, "%s", notify);
+ 	attroff(COLOR_PAIR(1));
+ }
+ 
diff --git a/meta/recipes-kernel/powertop/powertop_2.14.bb b/meta/recipes-kernel/powertop/powertop_2.14.bb
index c176cba388..3a7c3ba31e 100644
--- a/meta/recipes-kernel/powertop/powertop_2.14.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.14.bb
@@ -7,8 +7,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
-    file://0001-wakeup_xxx.h-include-limits.h.patch \
-"
+           file://0001-wakeup_xxx.h-include-limits.h.patch \
+           file://0001-src-fix-compatibility-with-ncurses-6.3.patch \
+           "
 SRCREV = "52f022f9bbe6e060fba11701d657a8d9762702ba"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


