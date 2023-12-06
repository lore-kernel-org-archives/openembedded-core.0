Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FAAC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 09:19:36 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.27462.1701854367613651234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 01:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZiDSKqp;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50bef9b7a67so4601790e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 01:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701854365; x=1702459165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXeb77PmMiWYx3zFrlorHV30ZDE4L6Wkte+KcxUIRIw=;
        b=nZiDSKqp8V1H+rCbjYHRB2cs6ZFYNiQ/YgpHeuqsiAZpxmHO88I5sPeLOPHIVFZ2lk
         y1hRdk5cefCK27ZIYejAL3PmJJYZzpcIqz7U3ZERBzIRackK4G9fnHgUN8Svu8znOIS1
         PpmJe2gHw/sJfSYvJws0F2OlWVhtdOZotYZk8l13poTiJskSJ+LW3vAxAvnqroku7Sh1
         4Ah7m2eU0cqV/aGQ3ZsZ4okwmFZ8eJ8ru51jOGohMedsuQZBSD3fVAhfcsINqm4R3bsO
         IanyKBxKuo+hbUiSQI7pNsOE8Xu5O0YZIuz4pX0/f5lfWPHcJq/BPpjPQpg987sBtml4
         6PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701854365; x=1702459165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXeb77PmMiWYx3zFrlorHV30ZDE4L6Wkte+KcxUIRIw=;
        b=a32e1bxxnZuJbfvxVw+kzSMARUz3CqnfubF5LRl8ZQi9/OQBFLIFp3hsJTLO/brCGQ
         706DKAV2A+T1QIxTqSxm9jsPxI+RogrCS+6h/uZgqgsCYGCmofL1Js5u7lt6U/ujkb7j
         LRjl0vT2C/0itJirrm2YCGsSV7YO1ZjPa53Ccm6LKz3nYP2BO21GrW2zGH2RcD2TIMod
         fHCsBfQMn7R7nm/+5Z+3E2e0JuKQ/P6+CUr2sFuu4qpDOJdneJA6dUf2Ka80Hq7Cr+aT
         vzCKh6dXj80Uj84ETYmVcOZhCHZcoyAYevBViGt0b/jSlpy8eWaksSQ0K92r2ML3U4CK
         Djhw==
X-Gm-Message-State: AOJu0YwvQ7kEInJuzota1mjcg6Hn33o4Pd0n748wQXIZAGCpdxlPUE59
	0+GHjvBniWp0dbEbGx1N6HxYezg29nc=
X-Google-Smtp-Source: AGHT+IFQAnhKEwVO1QfZ3SeCtt6ZxxUvECf9RQGum8OyOIPKeJDKGpvLXsBERd82/zfzSfs4zzhz4A==
X-Received: by 2002:ac2:5b0e:0:b0:50c:6b:f161 with SMTP id v14-20020ac25b0e000000b0050c006bf161mr383417lfn.106.1701854365055;
        Wed, 06 Dec 2023 01:19:25 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906668f00b00a1b65958c54sm2676408ejo.125.2023.12.06.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:19:24 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] update_gtk_icon_cache: Fix for GTK4-only builds
Date: Wed,  6 Dec 2023 10:19:22 +0100
Message-ID: <20231206091922.157015-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 09:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191877

Try to execute both gtk-update-icon-cache and
gtk4-update-icon-cache after checking whether the
commands are available.

This attempts to match what gtk-icon-cache.bbclass is doing.

This fixes running update_gtk_icon_cache during do_rootfs
for an image that contains only GTK4 related packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 scripts/postinst-intercepts/update_gtk_icon_cache | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/update_gtk_icon_cache b/scripts/postinst-intercepts/update_gtk_icon_cache
index 99367a2855..a92bd840c6 100644
--- a/scripts/postinst-intercepts/update_gtk_icon_cache
+++ b/scripts/postinst-intercepts/update_gtk_icon_cache
@@ -11,7 +11,11 @@ $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --u
 
 for icondir in $D/usr/share/icons/*/ ; do
     if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
+        for gtkuic_cmd in gtk-update-icon-cache gtk4-update-icon-cache ; do
+            if [ -n "$(which $gtkuic_cmd)" ]; then
+                $gtkuic_cmd -fqt  $icondir
+            fi
+        done
     fi
 done
 
-- 
2.43.0


