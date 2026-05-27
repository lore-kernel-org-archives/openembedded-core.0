Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3C6CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 17:36:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26084.1779903357644901071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 10:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bW6hSmfJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903974854dso55489965e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 10:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779903356; x=1780508156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTXuFFuCSaGcChWSRSh9TH3Kn/cnJJvmOKqsD5F85RY=;
        b=bW6hSmfJQ8eJtqdaZVTtXZjaQ6aNA5AZTpCRuk9y35Ze4y1AWnehu/ZkOcWU9QginK
         /9u9Y8W9x0f+ZTUvQnWYwrgMmyWh6Ju4dNoCwsM+A+/1Zf1Bo1VMK+HNVZqORmxKk+/v
         28PWDHipqiMABit7tSwTQaRkYb/xD1JXWYZvvuHTTfEdMBQxiJQTJ/rN2A/F+u4n1vAD
         qH4jBYiyEVXu376CsjHZD94XTdJzUHP/GLy/gYQTm0+/3SaNu/Ihs6lopcT8R9yU7N1n
         Bdh5rDXKtL8e8g7y0+2q0AcdEi5JVBksvynLgbEeRzyzyWvhWHR7YKj3lcfI4+rE1AOq
         Nvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903356; x=1780508156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gTXuFFuCSaGcChWSRSh9TH3Kn/cnJJvmOKqsD5F85RY=;
        b=oXke8fcgVMJmPfhLWFbGttQovmjpnMdXHalrQooEE5p2Uy26ei49c4Kvv8AOVbQbLf
         AJQWRPM2UgwuG62VaEDNcyR/DKU6MAq2EVl3u1CRzXLBGaRmK8CjGKufDkIwUaoMS6vX
         Tr+vxjG+87KXujlAnXo9uCA42zQqOndBc7q01RwHRyv0eTO2ccrNud9tMGIxbUqy9DIV
         6EIwA6DVbIKycaL/EclBqG1b5uO5bLMteSrM/nXmsmKHWvli1MTZJtHDxiFvKNFqHoAr
         WypBlt2h9ALNGgYRQoacU4n+EnxyL5Yfx0oRxDsDtBpexsr/ZYFgYsfcgSrv+SJ1DfTT
         Fcwg==
X-Gm-Message-State: AOJu0Yzw+iAmSHIio/8mHZGWEv9dyLcJZOlkhRQD97uyvrlk98bFCFHX
	2CSFBVZtbYePD3lRHeQtW0AfOnbZ4NBbsd7s3UYlJgYWl0LFOxmckX6QKppd4g==
X-Gm-Gg: Acq92OEmfDtGf+sSoxO2quzNz02C+8XzmIrOweSXgkeZWv40G9VYt/ZN6PT++jqEQeJ
	eEvSgb0pEWPk58lEupUu6Mi+YkTJnHCKtYqIUFY9yEIbN6neIVgLZtc6GQ52X5T7dgYXn9VFPVe
	O/BNtSRG14FIZbYSBTZ7WVy7hznWhL4CC1YMkTV6zDlyeceXP3NsFA0wfO679BmNhzBkX2V3Lpb
	FWU4SiLcyvoTASyRZdrzE6lL/hmal4K5RBg+augc//yViAmVmnqQzINGcGBxXkbsCjEoFQ7IsUX
	o2qi8aKLrBNdocnNvn4xiTUp13rgMM7JcgbodxPLINbdGHygzOEidk7o1o6BO4HW7LNWPnjoS6+
	G1b5jxL3GzS4Y3bApfh3HZpeASNDlATTudXPhP0rBvgere6HtI57TZ9D5J/sS1QzgLgylz0jIrw
	/iear9NSlk73R0kfMLnd0E35fL0RHyGvLfn4MVBn4Vvp+VjVEeTWemxRD+v9kjSfBoVrsrIA==
X-Received: by 2002:a05:600c:a402:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-490426adf66mr331469835e9.13.1779903355916;
        Wed, 27 May 2026 10:35:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4907eacb47asm30816845e9.3.2026.05.27.10.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:35:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python3-chardet: lock version check to 6.x versions
Date: Wed, 27 May 2026 19:35:47 +0200
Message-ID: <20260527173547.188244-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527173547.188244-1-alex.kanavin@gmail.com>
References: <20260527173547.188244-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 17:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237673

From: Alexander Kanavin <alex@linutronix.de>

There's a well-publicised controversy around AI-assisted rewrite
for the purpose of relicensing from GPL to BSD:
https://lwn.net/Articles/1061534/

Both Debian and Fedora are steering clear of 7.x:

https://src.fedoraproject.org/rpms/python-chardet/pull-request/15
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129923

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb b/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
index 14c3247b35..0ca0aef3ac 100644
--- a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
+++ b/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
@@ -4,6 +4,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI[sha256sum] = "6b78048c3c97c7b2ed1fbad7a18f76f5a6547f7d34dbab536cc13887c9a92fa4"
+UPSTREAM_CHECK_REGEX = "chardet-(?P<pver>6\..*)\.tar"
 
 inherit pypi python_hatchling
 
-- 
2.47.3


