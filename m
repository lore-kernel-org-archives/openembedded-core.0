Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30A5E9D80B
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 14:43:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36094.1775400195757730260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 07:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FtIUM3E1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so3089251f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775400194; x=1776004994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJoDX8zhKtMN47gXeP7I0PVIeO9RzWivP23rEYqwt5w=;
        b=FtIUM3E13gU+zZP+4IIj5KTrB64Se6nrdA+Uqlm+ovxkHFGy+F5ADKOYm2xlPsPmkg
         JOnAQmRAZs8B/BExGVyJPfJqYi7obMsttZm1R6fWNbtGlMZZlC5TAKRamZpkFPxJNaKO
         kOglLQUbObPqzjX7WSVbnX+JhhjZCAA6vqurE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400194; x=1776004994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJoDX8zhKtMN47gXeP7I0PVIeO9RzWivP23rEYqwt5w=;
        b=cRenN11ImwXj1RjE2V5jooQMq6RTsFBFU61JrMItLQdH1wHLz1j9/Wb2frxEAOhGO6
         A8iuzTrAGEMTrU48aAF8gWNSC0nnLOFKOu3eBaf27xxgIkkg5BEi9lo4EoRaVZKZ7iAw
         Zwh9W88baMeCGDxGNPRjBmxL5mPw3OYNT3NA64DnL+BM/0fF4LD2Z7aX6K8PkuGU8bzG
         m+TLE9O4m+lQc5emLvWFQfg3BwlCujbLplfoo2rR/87ftBjJKGTyaLeW3qMRUEWMa1rb
         D/U3uugfdcMIRwaHa0nuHwEwGEje9lG7gGN529RgK2JUmujHPS3uuER8wTuGAtBxyz6F
         VqZg==
X-Gm-Message-State: AOJu0Yy626ffguf9KfpIxHl5+XTeVnqyXpwf6TXwGUyMjX8mVf8u55HT
	sSrk66uRV9xmDBbmrBD3RXt7eLu/yRyrwZcsa2WaZfxNwZEEC9421W9B7nWfWmZqMhUltd9eb/6
	wbihp
X-Gm-Gg: AeBDieuXSB98BR2bJqmdTVBNWUfeKv6bpxo84pACZpaR1gJWXiXcnhvflHNzxRdFyvi
	mKae7GC8On9y1khnq2uEc3W9MDp8wHgtgU3EZ8BSRi9v+9OZNTTcDEIcYODZBX0hBkz9OFczxwB
	MuZXacOnQFr2rwxzTY239jsreq+KzP+GNl8vioSMpYyyam83DlGT5OUzc4iYo4JMEfRAQ69Yyq3
	PYHxAUJRzrnN+V2PrGKNhF+XrODrkd11YoBOgp9j/4mIKdemRhSUo89g9Alm8cglXcLkIMYdgEA
	s5X5CNjFm6I9605YFbEHXnP3/FcbZMnt8geW/ZGXuolDuKqMNuCzTTKQXSBxA+sNdQFYw4lM674
	XjD2rA1m7aCRZnle63JGpfxCDiD4VPN3AWR0QGoD6FNJi09JNO7/vw6CCVOUtU7QBRU426aCd1g
	qSpn3Vy0sybEfwSf0MntVY3yU2y2iIHXaq5WQIrMrKqVzUndpt5SMv
X-Received: by 2002:a05:6000:1acf:b0:43b:498f:b039 with SMTP id ffacd0b85a97d-43d2926ae4fmr13385093f8f.9.1775400193723;
        Sun, 05 Apr 2026 07:43:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5468sm32474083f8f.13.2026.04.05.07.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:43:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] sanity: Add check for old wks/wic paths
Date: Sun,  5 Apr 2026 15:43:09 +0100
Message-ID: <20260405144311.3734472-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405144311.3734472-1-richard.purdie@linuxfoundation.org>
References: <20260405144311.3734472-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234632

To allow us to clean up the old wic/wks search paths and standardise, detect the
old locations and show the user a sanity check error if they exist.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 2e486966a93..1a490f8d618 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -839,6 +839,13 @@ def check_sanity_version_change(status, d):
         "An error occurred during checking the C++ toolchain for '--std=gnu++20' support. "
         "Please use a g++ compiler that supports C++20 (e.g. g++ version 10 onwards)."))
 
+    # Check there aren't obsolete wic/wks directories
+    for component in d.getVar("BBPATH").split(":") + d.getVar("BBLAYERS").split():
+        for subcomponent in ['wic', 'scripts/lib/wic/canned-wks']:
+            testpath = os.path.join(component, subcomponent)
+            if os.path.exists(testpath):
+                status.addresult("wic/wks files at %s need to be moved to files/wic within the layer to be found/used\n" % testpath)
+
 def sanity_check_locale(d):
     """
     Currently bitbake switches locale to en_US.UTF-8 so check that this locale actually exists.

