Return-Path: <bastien.jauny@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7212C02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 15:48:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.13703.1737128896819620689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 07:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Qov3jnwR;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: bastien.jauny@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1280491f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 07:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1737128895; x=1737733695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pZO/5ZEidRF78JXBan041S300XlM0F9vJlJtairVpm4=;
        b=Qov3jnwR+1Lbzg3Cru0i13vv5xtHACSKSU6zoI9zqWfSNZXLjDqznPllZhcXoAht8w
         GdSUYr24cfPtu6qFpt/VaNOWLOC5tmecArGiNWWBpWEtLb8mIG/WMkggX15cAwzRT8CK
         Ax1H9zKKtGh9sLwxMaKR1vE+x6QcMKi2ztkKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737128895; x=1737733695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZO/5ZEidRF78JXBan041S300XlM0F9vJlJtairVpm4=;
        b=SI63QYWiIKT1jo4oIq6sTFSX9wxN+hPy7FdYjeOsBFCCeAYV6z/50XF+6jnc8ohn8M
         nwSLyDaxww/aw9Qj8JIk3tWuJZx2bIEKc6+zCJhCwsAv8rvQLEI1X6tokPP9MkVnsW4N
         LQNl2a1N+XtiBDbfUkdhFxNukZneFnMitYITzWSMbkHSS+2FJITCwQ4EIpUlG92hQlUi
         xqm+8qWnb0wYESFXeahqyXMKoIs6fX6LsLZTXmWHfcSF5B/6r5PvVREKLy/3/PxTULRY
         d76OpSSo4LrKH+oVmqFwz3r8moO2IjTBHcC1CNHi7aelOga30wHyOBaqQGe/iigLKVCC
         4L9Q==
X-Gm-Message-State: AOJu0YxIIOHCeTazo0lr9tCsVmwOi6otyMMpVamsFmmSd27f8NX9ITVk
	yniCfmBZ8JRAF74u59iYWW6YHv0SGs/hlmmT5Ukn7pBM7b8LpGlGJ6PjuLFEGHpHpeHVKvsJoyz
	Z
X-Gm-Gg: ASbGncugjKa/laEP+PtQZ5dp+6rHtHI2gtOqore1hjdkDO2xIG64OY6fnN/w1TwQY64
	O7Jkp0zBO/vU8Y3hTgcLq09E2I7U67Czdd+yGOpes9NlcSlO+hO1VgMkdBVaMlG86g9bREEYgdb
	f7DQskSHF+Rl9wvwYJ7IkQrB+o864Fw4gxyO6iJBexnjwqMJvuwOLqSDaNRaGiuI3PvRCauVMQN
	oSKJKrKrbkx0dySwbe4mtVIX0Qz8RyXd4xPkn9tq6Gth2npal4HqWvdLl9clEJ1IIgZRzqgPZV4
	uv/D+v3+YxcVXm2rKY9vtPx6B7pwyuFl8LnN6Amoal/OWWxfHg==
X-Google-Smtp-Source: AGHT+IGH30cfevBRZBtPGN97Q9OCmDbf1g03MMHwCxulx3MUjNxwyYtkyc4OMsKCMxTKmD5bTWYEag==
X-Received: by 2002:a05:6000:2a6:b0:38b:d9a3:6cff with SMTP id ffacd0b85a97d-38bf565f093mr3535626f8f.16.1737128894898;
        Fri, 17 Jan 2025 07:48:14 -0800 (PST)
Received: from FRSMI24-NEIGE.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e06asm2847378f8f.95.2025.01.17.07.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:48:14 -0800 (PST)
From: Bastien Jauny <bastien.jauny@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Bastien JAUNY <bastien.jauny@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] classes/logging: Added the bbverbnote command to the logging set
Date: Fri, 17 Jan 2025 16:48:07 +0100
Message-ID: <20250117154807.2465736-1-bastien.jauny@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 15:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209991

From: Bastien JAUNY <bastien.jauny@smile.fr>

Fixes [YOCTO #15688]

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Bastien JAUNY <bastien.jauny@smile.fr>
---
 meta/classes-global/logging.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-global/logging.bbclass b/meta/classes-global/logging.bbclass
index ce03abfe42..136f1e1733 100644
--- a/meta/classes-global/logging.bbclass
+++ b/meta/classes-global/logging.bbclass
@@ -32,6 +32,16 @@ bbnote() {
 	fi
 }
 
+# Notify the user of a noteworthy condition.
+# Output: logs console
+bbverbnote() {
+        if [ -p ${LOGFIFO} ]; then
+                printf "%b\0" "bbverbnote $*" > ${LOGFIFO}
+        else
+            echo "NOTE: $*"
+        fi
+}
+
 # Print a warning to the log. Warnings are non-fatal, and do not
 # indicate a build failure.
 # Output: logs console

