Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C676BC52D73
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 16:32:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.37967.1723048332167707011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 09:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EXb1yzv+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280c55e488so316185e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723048330; x=1723653130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=88QRmi7l5tyQY4heYiQMHUFxnLzNxLMUCygUZ067Rj8=;
        b=EXb1yzv+3B4LEispR3D2XVkoD/lFN1apsX3bp8vdjjEGJ/mGJpMVcPT5DuXAFXxlC3
         e8sPoB0O6obOeUZiDMbbwcoF8qlDnwnOSai+S7tULTe3YnvXAiC+hHoR3ERWMrRaAdH4
         9AOPOxU7J7ndVnInczETqc8AfSDDnn0Dxn6qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723048330; x=1723653130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88QRmi7l5tyQY4heYiQMHUFxnLzNxLMUCygUZ067Rj8=;
        b=nn8oYtZklLHr9p9NbjtTtIdSxmGWqXkqFSHNUTWqG0F9Sd7EPSxAkVQEln9/ezYnDe
         kpIosaqu+kmwzEHHYybF41i9WFCWuQlFz3aV8cb3CcidA+W2B3nzSFlWeA3QVp0fdRnx
         6/CJA5M+NxM1XrGIDFGuRqoOnP6RXjBWcnLKANlhVTGRNaI/ZuaHEZ12rZm2KdiUs5Cd
         1BNDXTBqLq8+YVwGap6YdpUwcy5YWAHiEL8QwiCNiKz6Wd/j3XfHNAzBQUq01w0lriQQ
         1Sd7gb9HKUaRIG8hvla6C9ni+OMB1Mf1yLt96Ok7Dm0RJ+sGZcvOX/GJEpAlRaQkUUEA
         XDvQ==
X-Gm-Message-State: AOJu0YwDMXREKsjS+4zFKK7Nv0XVc6r3yNUvuP5MxdgvWU2nKMHd9uS+
	keVISIUJKPjMSP0qIV6hHb9JHnUW7ccs/VJQ4Oe3oYEPHE0KB+t4OinREQ+36PVmeUzL85aSi9O
	oRfo=
X-Google-Smtp-Source: AGHT+IE+mc8EwX88CLDMTRyUI6JneCI5S/vKyhW/7nQmjTFrDJrew0OXbi7ibXMfhmWDpiujBHeoEw==
X-Received: by 2002:a05:600c:1c94:b0:428:b4a:7001 with SMTP id 5b1f17b1804b1-429052f8dd4mr20319755e9.15.1723048330144;
        Wed, 07 Aug 2024 09:32:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:db20:52fd:c091:c903])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059719ebsm37440875e9.18.2024.08.07.09.32.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 09:32:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Drop vim-tools INSANE_SKIP as not needed
Date: Wed,  7 Aug 2024 17:32:08 +0100
Message-ID: <20240807163209.231840-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 16:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203090

The install function already removes the executable bit on these tools
so that perl, python, awk and csh don't become dependencies. The INSANE_SKIP
therefore isn't needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 071deed338b..e5dcd00c969 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -128,7 +128,6 @@ FILES:${PN}-data = "${datadir}/${BPN}"
 # We do not want to complain if perl or gawk are not on the target.
 #
 FILES:${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
-INSANE_SKIP:${PN}-tools = "file-rdeps"
 
 FILES:${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \

