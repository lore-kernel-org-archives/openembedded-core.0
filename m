Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403FBC3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:17:24 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2667.1746807443616919591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N2B++08v;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376e311086so3382959b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746807443; x=1747412243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFMgMSz8/0aKHfggeG5i0dYwHquLD4wC0PyHnr38Nas=;
        b=N2B++08vP8Gf4ZtZHQ9cH1Bs/IegrvoPlLBnWjKD3jVKLEjWpxjSHJQTKizFFvnejj
         ySmfTsMwg3UdV/pRRpnzpa41OmPY9k7+Vh3hl2Um+RAkss7nUfF0ZyGx1CAppt/8mTlB
         /AEfJXouF7417pwZlp7BWUYi3s7k30Lu8egendefoeWFSuzyqZMtu1N1XEZonreBYSdd
         d96/ybVSqS75zJXfKWu4iKt5hn+YpfkXU+8Z1D5RMBPptot5sFXAnjo6/oa062npm0Iy
         nqIFXUDMOkTtYVE6M5iViSTiBmCVFWo6JTqGF1Ebi5KWPBdnskWST9/Fu7x09F2YTZlJ
         ZOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807443; x=1747412243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFMgMSz8/0aKHfggeG5i0dYwHquLD4wC0PyHnr38Nas=;
        b=wzxUdvhq7igMpzTNadFddMkz2gox4WvYiXHgmgvfeu6xGHj2kVwaM9HGKKSmX5NOP6
         t+M9ZgslxQe6Baqvr46TGcXlLldt2+x3QZB3F0DdSi6Eipt3eqUlCchG244DWZF+UTvv
         bwI8hGlFZAinjdky/9027rG86IKXLLYca/aOw8EAw1aLVP/0H+xy6+mMctokE/XoG8Fp
         /4TPfcuxjKACKmYN1tLo+ExoB5hd70ybzOG2C63k+yP9zJUorL2fPpF69nB7jTggkk3J
         qKTD7q9OqZUZkXfzYsBEi1XkIIVxz2Uxk8AzM1mC0jToXN/gUcVdK/yLG2fY+mSkUFPr
         cpag==
X-Gm-Message-State: AOJu0YzE3NjOy+9kQTfw6tW2mO0u1oLAD0TkKHSmj6FsShQRdWevYob8
	QhMkknNPh0Xxmw1K0E+ydvHWlzGbCxygRBnBgaou+XLl4A1729pvOLM8J4L/noHozZ5wU7w6JJL
	P
X-Gm-Gg: ASbGncs2xEIbjrIAgne399L3tJGxjabCqTHwaBixLg8oYN6v7/caxeGKQxbWn4HF44b
	3+dnWIJpEl5zqpSwxK2wkjbOC2hO8pn8k7PBJLZsXKiTEDoa4wpJVGLgNk2l8fH7hPL2xOSVq1E
	3LpJgc2EnMTR3m1Uue5eyiR1aS2Twf1WOi94X2tk+GeQkrk3Zi+eD9wzSJRnuY0eNKg2LzAC+p9
	jp9gblKJZUXP4r9qv4SG6naSt2951rOHt1jv1JOkEOtF8/nVrsvdzxBeT4mEQWxMd7OMJcn3Kw4
	lgs0QgR0lozKpGr9OZ8BvPvGvoC66fUyreQCx0kbAXc=
X-Google-Smtp-Source: AGHT+IFyaGIn8j4xCZ87l+zTif9F2SqrJxG6dBafg0umIRAQDQLusiCzQf/suaY+59NjQUsApMUbdg==
X-Received: by 2002:a05:6a20:3d81:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-215abb54c9fmr6506943637.7.1746807442892;
        Fri, 09 May 2025 09:17:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050fesm1919134b3a.24.2025.05.09.09.17.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:17:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] ghostscript: ignore CVE-2025-27837
Date: Fri,  9 May 2025 09:16:39 -0700
Message-ID: <fb5dc4a476bc4054493d6a7eb64a423e3665afb9.1746806788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746806788.git.steve@sakoman.com>
References: <cover.1746806788.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216237

From: Peter Marko <peter.marko@siemens.com>

This CVE only impacts codepaths relevant for Windows builds.
Se [1] from Debian which marks it as not applicable.

[1] https://security-tracker.debian.org/tracker/CVE-2025-27837

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 3d4ac77cfa..fd0506f438 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -26,6 +26,8 @@ CVE_CHECK_IGNORE += "CVE-2013-6629"
 CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 # Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet
 CVE_CHECK_IGNORE += "CVE-2025-27833"
+# Only impacts codepaths relevant for Windows builds
+CVE_CHECK_IGNORE += "CVE-2025-27837"
 
 def gs_verdir(v):
     return "".join(v.split("."))
-- 
2.43.0


