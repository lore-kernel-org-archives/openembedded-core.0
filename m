Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF773C44510
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:38 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.893.1783881818288494163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=SDBDeiGD;
 spf=pass (domain: underview.tech, ip: 74.125.224.41, mailfrom: vince@underview.tech)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6611669cd16so3394966d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881817; x=1784486617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIYLcHNpjdC5NzDTlw9Oce/bJastmLMHGBSIBwAnF8o=;
        b=SDBDeiGDixqhJpr/CYcA0AJNfivVMchR+qzAX5RAclg12kNRACDO5KsUa3LdciKsew
         WaAs2J7Eq9YmtCgXGZT/x0yGShFhNJlebLDU0PvBakDf/nweokBuBSpF3AZUbOLLOVvr
         TVq2tDIv29ZlSD2h58fHq4n5QoBJQL71uqc6OvkU1nB24bOjliF7Q4NAHBSLFkIBzb1l
         7h5d+fo7mR6kywZDJcZAu/VRphJASTar3K3YhudPuP9bYwuoyyiUsLV+L/1XprQHF3jJ
         zJXcyz8mcTkJn695UMR/fUkrepFUhGob3/tyLT7ijjDhtcAtXBxIRDc2NjOono1w+mJv
         oeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881817; x=1784486617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIYLcHNpjdC5NzDTlw9Oce/bJastmLMHGBSIBwAnF8o=;
        b=XcLaWCZl80QSTMfii5Pnn8ehgUIcyhRzwaGTJqust9dUM0uUcLK3kc8JV09Fx2/QIb
         DitEnVTZFZJjrOjQ+9nnmjJ0JaawTQ6drIRS2wPcLiMXHuDqa+1LBfHi7ztx8Bu6uPAx
         IqBqkBpMrhkR8yIZfZk9wYSXOmAaMTfjQsZAvapaAX2OsUMYOVm1+jFN07nmZ7phA2ZP
         pf+yfwDTgG4tnFln4XkN1sNww6xTWTsYDOIDvQVA0tp6SHZYszSwO2Ygsgt4RkSo9s54
         2uMvKKNAMWymOjGihGfWsMUrNXYLOSsNX5d1QLexAxikhMFrwtu488+874ics8cd+1es
         +cnA==
X-Gm-Message-State: AOJu0Yy/ATKZixl7JBclfg2LgkGjPWC68k5Zn6B9YZTucd+HyyKXqlsJ
	lGC9eIPBrLHEhdLfHuugYjdE3q2uPpbkE9R14x0/SRe7Dk+9zAMPcE7LY/aTUNLTHmph2Lyc9/p
	ItthjLN4=
X-Gm-Gg: AfdE7cmCzDx05Fgka/jQnYCQihEX+bQxABiPbWD89lAYYehi2XouWY2eBNxaTUECxld
	FLsolPIRHm0RclL+034LKyqQd5A+skJNnfenTpcrt0N0kIuxmTfz9XLCRnFLrkaGbp5J+jFPrKz
	0o6kqq92ybeKjPSFtkIBByNGg99klgK43RWJ3YlQg2s36zGnORrPoZ0CBh9KvIQiIjttls7Gmel
	q/akxtlBQvsmGNgEUn3Ow37SBpeSm6PN7gJ8WGJL7ckfCJOit6cvzXRkwYEWYIuMq1pjF5mIjeX
	DmD5Doc+m9nf7wZkB88IWYOiZ77BsCYPzBQ42yGlWXACzU13mQ3TLZPgoxeyTmoqyiCt83yHNZI
	A75b6ZW71fDKgK4eOIoNYj+zBp/EbbP45+R0mO3riRI8E7sYKoaZY88pM/rZqyI+0rfW63CVxLZ
	/bL8NUjWfnCIwM/A==
X-Received: by 2002:a05:690e:1914:b0:664:ae6a:f04 with SMTP id 956f58d0204a3-667d7c2f50emr4301843d50.78.1783881817390;
        Sun, 12 Jul 2026 11:43:37 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:36 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 23/27] linux-kernel-base: rename kernel prefix
Date: Sun, 12 Jul 2026 14:43:03 -0400
Message-ID: <20260712184307.3259642-23-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240813

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/linux-kernel-base.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index e2187a73f0..a711c62a03 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -30,8 +30,8 @@ def get_kernelversion_headers(p):
     return None
 
 
-def get_kernelversion_file(p):
-    fn = p + '/kernel-abiversion'
+def get_kernelversion_file(p, kpn):
+    fn = '%s/%s-abiversion' % (p, kpn)
 
     try:
         with open(fn, 'r') as f:
@@ -39,8 +39,8 @@ def get_kernelversion_file(p):
     except IOError:
         return None
 
-def get_kernellocalversion_file(p):
-    fn = p + '/kernel-localversion'
+def get_kernellocalversion_file(p, kpn):
+    fn = '%s/%s-localversion' % (p, kpn)
 
     try:
         with open(fn, 'r') as f:
@@ -50,9 +50,9 @@ def get_kernellocalversion_file(p):
 
     return ""
 
-def linux_module_packages(s, d):
+def linux_module_packages(s, pkn):
     suffix = ""
-    return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
+    return " ".join(map(lambda s: "%s-module-%s%s" % (kpn, s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
 export KBUILD_BUILD_VERSION = "1"
 export KBUILD_BUILD_USER ?= "oe-user"
-- 
2.43.0


