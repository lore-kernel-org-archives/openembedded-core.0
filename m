Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE55C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:47:24 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.331.1743781637994969516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WKognbAb;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54c090fc7adso2513704e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743781636; x=1744386436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmLyEwiXDwrYwDXxZw3yj1AWcSdgQZpuUgM2d79Cy7w=;
        b=WKognbAb0JkqeOZ3LRYgifdL4fCUhlkILCIsRrVlNymVT6aYSaBDKgpCCcDyFFfo77
         Z9x5XQK6jvRYVJr4FBOA4w8ciJZo+q/UUN1oy2h1ho4YjnHPT5Rs1kztPOlv7gcbmBiE
         J097d1ONdrIRCrISN7nGyPYUnwNLG5vaH9hvncNaWAE/ztRe9PhnXW/wlBIK6TFqmsZN
         8/cw2PbIRaRLyFegwEygp6ByLAqi5wBcn45AsCULlSlGJCdC0nkex0yIR3j4qH6mEHnW
         5HRzlzcAVVHML4rAOLIS9L3k6PR+kOovBG0GfPzPNO3phoNMkvk1dCUZkzel7MbISBHQ
         leYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743781636; x=1744386436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmLyEwiXDwrYwDXxZw3yj1AWcSdgQZpuUgM2d79Cy7w=;
        b=H8O8P5PIlhWtoF5XlN3zehQirnh5LCTWg96VyKYM6EXYIFO5JPuR5pOXxbOy6M4eMO
         SqXmKFy/RkRt37Uia6bokGRMoVgqImcKKJoL40HVld8pZN43AT9MvqMkvQwVFDRKhlNW
         ehfPOQp7EdnqXMd8M9WIPi42Gc2dqKWbxTggRi3rQ3YdJeQGPT7yr7iAm/GS/yjREkG2
         hNgqC7KAuLSLNtTvgDYm+Q+HbmI9jxfMIoXjlWDB+GMsoX3EH1stPs6Vhp3iIUVfbHe+
         kVy9oKGSt6tLk2o/of2UcrbInvPRxV1ryaTXarZ64sQ3f0jbspUEBjseK6cIr9Z7n3Tf
         HLXw==
X-Gm-Message-State: AOJu0Yzox38kN788hBSYH2xrtV+aDNwyLeK4CB2T0n0JLkOKe5cnF2ba
	wgVHWe2THonMiVJof6QpsHMbqr9xebb1Zzhnt+cSqSI/6519MFjghhIW1et+QkHsisrEZ3HNU59
	YXW8=
X-Gm-Gg: ASbGncsgSn46SofNMKsJAytk6/U0LanvGPgsUN7H8EhlsohQWaS5AgC6FOfcMJAGbm3
	9n6mzAbtyU3vKHPZ8idud6BIqmXoZ3YhLrSInYQNOLf14VXGZIOgpxMPXiOiSlCNNqLF70rXgD7
	T2bHBG6gSMud8uw6NkR/9H8NtNYEEId215MWAbFo+b8QlmamawJAeks8dFVN69fLUrigh9+OuY4
	nbz8oB+58NrWIe9qxNUJNJH10wV3LqKrhZRHffMnetHAl8ArrTLZEKdR2akaED1xEg0+SLnpXKh
	8z6ytJI32BCy+zWyd5BgS4FyWXcPeR+16tXiL8U1QJ9UieYGY8GoImhMyMzGJIzxaR32d2yZsTY
	9fkkHAjDfDeedsfPPca6jJA==
X-Google-Smtp-Source: AGHT+IHTrg1OLp01ogc4H4joUhvPNywGLOjMEk/CkZoPNXvaqCAO4nu2sgvnUjDWsIAfq/uAmJG+RA==
X-Received: by 2002:a05:6512:1092:b0:545:1e2d:6b73 with SMTP id 2adb3069b0e04-54c232de6e0mr943200e87.13.1743781636040;
        Fri, 04 Apr 2025 08:47:16 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c72sm462931e87.152.2025.04.04.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:47:15 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] poky-bleeding.bbclass: support recipes with multiple scm SRCREVs
Date: Fri,  4 Apr 2025 18:47:01 +0300
Message-ID: <20250404154702.441150-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214349

Recipes with multiple repositories in SRC_URI use SRCREV with
repo postfix. Set them to AUTOREV too.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-poky/classes/poky-bleeding.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-poky/classes/poky-bleeding.bbclass b/meta-poky/classes/poky-bleeding.bbclass
index 3bfdcf1454..b12aea61b0 100644
--- a/meta-poky/classes/poky-bleeding.bbclass
+++ b/meta-poky/classes/poky-bleeding.bbclass
@@ -12,6 +12,11 @@ python pokybleeding_version_handler () {
         if "pseudo" in bpn:
             bb.warn("Here 5 %s %s" % (d.getVar("PN"), bpn))
         d.setVar("SRCREV", "${AUTOREV}")
+        srcrev_format = d.getVar("SRCREV_FORMAT")
+        if srcrev_format:
+            for multi_scm in d.getVar("SRCREV_FORMAT").split("_"):
+                if multi_scm != "":
+                    d.setVar("SRCREV_%s" % multi_scm, "${AUTOREV}")
         if "+git" not in d.getVar("PV"):
             d.appendVar("PV", "+git")
 }
-- 
2.43.0


