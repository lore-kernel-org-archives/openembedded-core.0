Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D7FC55184
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21342.1785666558847824549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=grjvFWt/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so10772625e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666557; x=1786271357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yTeNB4QesozJkXvrDsutqqLC6lSqlj8S7RMFHn67bik=;
        b=grjvFWt/hHRzj63ku32b6JEXjyVTO7+BrX/b/di3iZyInJmefXBIdfFCSdi4tp1z0s
         x9B4SUenHPqE/Zh2UkxM+U++rTEqmmDipl3gu7QJTvo+RtutJjJTy2OLegEsDyrGEVXS
         IWU/uGk0JKDAfXi5O6iP+63bD8b/EKPlSmr8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666557; x=1786271357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yTeNB4QesozJkXvrDsutqqLC6lSqlj8S7RMFHn67bik=;
        b=NaTuL7KJp0APG96Vtfh3F8PJ11YY2RpFe9ocuLkdwhh9s7hAcJFl9j1aqEyaDL3v8b
         eB4n2KTN1rP4IJyGk2++m69MZcp+HjQJTMNseUN8mqEQu9ZNX0lwEa/KfbucLc7h62mA
         kP3N+xbg2+5SKS2iWHRFQAIHCPrqLYhDQvnWLX0K/W02mgWpnUGt8DL4ro93LLUohqIQ
         MLyQUOmoEfyWgYDr4be7rOl6q8m0CueYCz6S53okZjkgghOidYNuvBwz8u13lC6wzQ5N
         7F7K53WHrQXTrX3ULLFDlw/JAnMj6WkfWewHLhbI3tNtIGowFtr03+pF91HYlIEjQnYW
         WUiw==
X-Gm-Message-State: AOJu0Yy3rsUWLaE9sQThCJ0Vhro38/lCe+8yHfuZto2b/35wcNTRsISd
	a7qNOMN08M82l+Z9wKL8LyS1zUB56H9Zvdzu7kIyVlpz9EANgjb9xDx6iDiRG1tOYUO/zC6DNPQ
	wlisH73A=
X-Gm-Gg: AR+sD132kqoQxoPpQ00Tx7j1eEIaBjNgjNH1nIOXRM0f8UXnT24FHMXzA2AGOLsN96n
	flSbqe47oFRwid8gSvkFy83ZAuDCwS1WwMkpZ9KmWJxfcGXAQh1shrnwJxC6uvYPhxDg3iBwZDo
	fjCWG829/3BoBnYFnGwB0NXwR4PbHCkdx47ErtB0bkut/0JYdyWcExcR0Ju64Foys3hvBEi1RCw
	8Een2XgTQcefslUOO9sDYFzpTYcf4pvLn0wOctGPSIhgEziO8qFULpkq2tbfuEhFpC4t3hIuGON
	9EjjD9+rzDc3oFxM4PLTryd2dwBjYA/TZK37WU6xwbFK3wl+awxeXgdBS6t3pxBfHXOlyPmVqt6
	A17hyhMMbGybas/3SwyVKlGbhUJ9W+OYtQsKya082E3bUrjfMfOr/gXMaCR/obqrILj0/3aBa3C
	6hmWcU1VMHCN7fKt+74iOnTnOpk5fSJ6dqei8wSuYHni5d9vpjE7y6wDfpQXo30aANjzbEJzhVE
	hafsCwSVL4T5mBXDw==
X-Received: by 2002:a05:600c:4e52:b0:495:3f84:a792 with SMTP id 5b1f17b1804b1-4980c674dcamr147297345e9.12.1785666556923;
        Sun, 02 Aug 2026 03:29:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/25] toolchain-scripts: Drop usage of kernel-arch
Date: Sun,  2 Aug 2026 11:28:45 +0100
Message-ID: <20260802102854.3952760-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242541

We can just access the function directly instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 8c062ef0e74..d94dcdee39b 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
+inherit toolchain-scripts-base siteinfo meson-routines
 
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
 # doesn't always match our expectations... but we default to the stock value
@@ -155,7 +155,7 @@ toolchain_shared_env_script () {
 	echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
-	echo 'export ARCH=${ARCH}' >> $script
+	echo 'export ARCH=${@oe.kernel.map_kernel_arch(d)}' >> $script
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
 	echo 'export OECORE_TUNE_CCARGS="${TUNE_CCARGS}"' >> $script
 

