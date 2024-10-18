Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D94D3F2B4
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 22:08:34 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.33574.1729289312296201377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 15:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nnzxiPCC;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e5fcf464ecso1325250b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729289310; x=1729894110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RkQ3Yr25/1Aih2s/xea43dFsB8mIfMeCEVp68moFTY=;
        b=nnzxiPCC72OD442vIP9W2VFUYmsRCq7HfBuKv7BsmB1txazdz/0QWQDZ3r2Kb2kMQw
         sRyRK/rFXKQ8KHI6uUu6tUPXgVoPzG7bZzW/n4nqPiBfO1Bd3Fmjt4GOuNeYYWIvkLXG
         l9ra4E0sCi2FZq1biibbRdggSQQ3KWD2BLds2hnHuQl6Bf+9w4/G4HvdAIrxOXSbAiSj
         yk35fxQmRoE0ITAl3oxHsD7iOjqiS2WIyGw8xOvDGRWvUcfTG5E/UFFB9UI3OcTzrWkH
         2I7DnNSBcB65yB4V3YQQr0xZgdlS+/g0MAGx7MaX6GrnMsjrfM/nT0JaZwxIk1rasngx
         a6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729289310; x=1729894110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RkQ3Yr25/1Aih2s/xea43dFsB8mIfMeCEVp68moFTY=;
        b=m7+Qmeq70g74uuPhp6/b3eTXrzkEO6PswnpXjTYkgthjuY6efFtWeDiev6Tg25SNgU
         hHhMiy3ytef+d70FaXOOGycdO3fUHezQyPmN22AOBMDFKAxioYDxdsqOYbI5oQyj66I9
         ywY7iVy0sCYIl8+aD7yrpDNM0JVNXNlm1OtNE1BPIM4ez2cIORN2RkBbFaVLmKtfwa3o
         D53x6JH3CF3MgvCCZLIJgysIB1805+++zB6Xz4LVkihf7EWFhog99r0JuMB3nnPl9I+Z
         UpGls6rDg4soxb/CA+1q+MijZnoP2bPNVe5NhWp8YVFA5byjaQ2NtnoKI0VIom6JCUo5
         6WXA==
X-Gm-Message-State: AOJu0Yzs7oYpzmCumwNoo4rFWM7zvtLvOf0B7fV7xIPzFlB/IzemxxpX
	OwZwcfhpvTJx6Z30eoCaGCUyRamRCtGlaSSkR7FrwpiY6spBC1ybLD7mcA==
X-Google-Smtp-Source: AGHT+IFk2V0kNZybZ2XdOyZMYM9ZqaKWn6G37mxbhKi9AyvxnFGGeXBw4Zj1dTniVT22dt4H8uCNWA==
X-Received: by 2002:a05:6808:164a:b0:3e0:43b5:d768 with SMTP id 5614622812f47-3e602cf9a4cmr3554428b6e.27.1729289310576;
        Fri, 18 Oct 2024 15:08:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::9a72])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6029b7874sm554446b6e.8.2024.10.18.15.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 15:08:30 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/4] lib: package: Check for incompatible licenses in locale packages
Date: Fri, 18 Oct 2024 15:59:04 -0600
Message-ID: <20241018220818.4042304-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241018220818.4042304-1-JPEWhacker@gmail.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 22:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206076

Checks if incompatible licenses are present in the dynamically generated
locale packages

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/package.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c213a9a3ca6..37fbfe355cb 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -685,9 +685,11 @@ def split_locales(d):
     description = d.getVar('DESCRIPTION') or ""
     locale_section = d.getVar('LOCALE_SECTION')
     mlprefix = d.getVar('MLPREFIX') or ""
+    locale_pkgs = []
     for l in sorted(locales):
         ln = legitimize_package_name(l)
         pkg = pn + '-locale-' + ln
+        locale_pkgs.append(pkg)
         packages.insert(locale_index, pkg)
         locale_index += 1
         files = []
@@ -702,6 +704,7 @@ def split_locales(d):
             d.setVar('SECTION:' + pkg, locale_section)
 
     d.setVar('PACKAGES', ' '.join(packages))
+    oe.license.skip_incompatible_package_licenses(d, locale_pkgs)
 
     # Disabled by RP 18/06/07
     # Wildcards aren't supported in debian
-- 
2.46.2


