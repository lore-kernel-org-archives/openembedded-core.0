Return-Path: <michael@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B414D12D45
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 15:00:23 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.37319.1731250822737839760
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 07:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=gHAYvL96;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.46, mailfrom: michael@amarulasolutions.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c94a7239cfso2825491a12.3
        for <Openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731250820; x=1731855620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glDo7cCxjv8cuatflrWtsGGEb6oNsJWAFNxFzEySxhY=;
        b=gHAYvL96iVNSHKeSi5DEnynHBDLNOb2c49rJQ2XDmDGUJusLdjdb2YPx/Q0w5kfP4n
         Qt5r6XfjL1ByN+2gVbcR1IS0doiLxPSsSQksfe/ZgHObZ3u3O5YRm0xNK7xIYp/wV/J7
         k9421swZ/TllESrj0SdUS3FvRmRKA95GmLz6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731250820; x=1731855620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glDo7cCxjv8cuatflrWtsGGEb6oNsJWAFNxFzEySxhY=;
        b=IkIJYi6bcnyZL50O/hNjcEFrv24KOILgCaMrg554SzDfGB83DHxJVHb/kxbX6OvI3a
         1qcqr12yCN8gK5K6AXw6mEGOB9eWUV5A2Lw8mC3m+q/V9Upq0ySBU4ehdlumCct0ta+c
         VkRRRCiSIpGzq4S1ZdRtuhJheHkY2a2nzwUDRnMpjL8TupmNhTGBBvzC2Z/y/hZuAFBY
         vBV4ZXRbT3gym8dvQY3JW80Rf9qYytIYL93URMYal2y+W9InVqeJGbwC9LNRUGLP1VBn
         1RdE8bv9bxeFIUTk5zix09KSg8kDM0kFe78boVuvHEiKwGtB/OYOJrutIfshjqtXqFQ+
         Lujg==
X-Gm-Message-State: AOJu0YwhGaAS33jmu4biIGPSytd2D69iNoe5+7mv77agb7XC09PfHTkk
	jkPJizEe89l+grGCBVIe4edzcm+4/k2ljvBHUpMhToqzVC9AJjB4HQWdziz0Xm2E5nHeEjzGKB3
	z
X-Google-Smtp-Source: AGHT+IHhMCUg6lbVDAMxUN4XEJ2M4L1T7SE2GfxDtdSnHRG91Pa96o6JtXj65DaBuk40fGZLs2awPA==
X-Received: by 2002:a05:6402:5192:b0:5cb:699c:30dd with SMTP id 4fb4d7f45d1cf-5cf0a446b13mr11237065a12.32.1731250820186;
        Sun, 10 Nov 2024 07:00:20 -0800 (PST)
Received: from panicking.amarulasolutions.com (host-82-63-53-247.business.telecomitalia.it. [82.63.53.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2f3cdsm491047266b.185.2024.11.10.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 07:00:19 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH] connman: Fix restart script
Date: Sun, 10 Nov 2024 16:00:15 +0100
Message-ID: <20241110150015.57179-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 15:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206924

The script does not work if the connman service is already stopped.
The start-stop-daemon checks for the existence of a specified process.
If such a process exists, start-stop-daemon sends it the signal specified
by --signal, and exits with error status 0.  If such  a  process  does
not exist, start-stop-daemon exits with error status 1 (0 if --oknodo is specified).
The script uses set -e so we need to add --oknodo option to stop

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 meta/recipes-connectivity/connman/connman/connman | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index a021fd4655..adb5d44fed 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -18,7 +18,7 @@ do_start() {
 }
 
 do_stop() {
-	start-stop-daemon --stop --name connmand --quiet
+	start-stop-daemon --stop --oknodo --name connmand --quiet
 }
 
 case "$1" in
-- 
2.43.0


