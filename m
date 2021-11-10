Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA46C43217
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.341.1636573189158910647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p9RVTwIX;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so4784333wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BIIbRc1Ss65pjYWyqIu4plgDpjcpOlsxzClehecaVrI=;
        b=p9RVTwIXibhTwxb+w5Wwve26dEnlCDYlWgSyNeWT4w/9UontnRkJ7TCppKE99LN9zf
         BA6vPoamD7qA30yu2pufL5eBHCRMx28VyJTN5WdphHWLMY7fzuQDjlMD9MBRyR6PqFv6
         WGc38FsFz729uA6tQF5R+DNJOlX8raCIYxGBpHhYLxRYA9FbMKBV2t/lOJwZPYZX1oku
         U6JH8nU3Q/m7Vpp03BCmOoiYT4st+xR1BflDpR6+gU17kL1XPjcKBaB131MLu0D/zMRt
         ypu0HiJP9KWqtWrIdXG3GtkBP7akM5Rl54Yp0msZsu6DRJmXzGDHH8FDGPQVi8b5yhs3
         06eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BIIbRc1Ss65pjYWyqIu4plgDpjcpOlsxzClehecaVrI=;
        b=38fW66BkEPniiaVGAYqJ76Qu/dbteyin3zsxQ9mQmLqDrrJB1JjDRTzw4HwBVXCLJI
         vxt3MBozx7+OkRInqJl4BqUmCTCkfi/ORxxJaaaT7lIr1vd679H+hBbK+/xQHmSmVBSe
         JajD6V5blOPwcShM7QneorcBWpeg9olDSkqIfw4CIxvBB35f0E+xdGwzfE1kXAUlUSnS
         NVem/pg8FIoOaiqHNztH3GHyEyGnjJjrKfvZuDwTQBG8BsOexh2s1iVqwppLG/+OTiD+
         Q7iBtNdF1SgRTRsclHifxCUufJDSKa+HvFsdl+I3/PAj4rUJDbxM7JCmBsCJM8IEYc05
         y/+A==
X-Gm-Message-State: AOAM532cb3wtXAh5W/iP9qsvoeds1+Sl8KYCSkZaSu+0CtiNCYG54S/6
	sBnQcqB9wZ8YFSLYnmugEmXliJX77q0=
X-Google-Smtp-Source: 
 ABdhPJw2ThiLuMCCqSYjlaR+3WRupVAaYqiyfM691Ob4VI8KijHCC7SiF87OzOls8lAKR1dZim81uQ==
X-Received: by 2002:a1c:287:: with SMTP id 129mr4306060wmc.49.1636573187689;
        Wed, 10 Nov 2021 11:39:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/24] socat: upgrade 1.7.4.1 -> 1.7.4.2
Date: Wed, 10 Nov 2021 20:39:22 +0100
Message-Id: <20211110193937.2606747-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158093

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../socat/{socat_1.7.4.1.bb => socat_1.7.4.2.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.4.1.bb => socat_1.7.4.2.bb} (92%)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb b/meta/recipes-connectivity/socat/socat_1.7.4.2.bb
similarity index 92%
rename from meta/recipes-connectivity/socat/socat_1.7.4.1.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.2.bb
index 1ad5f15b93..0edde6a2e4 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.2.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "36cad050ecf4981ab044c3fbd75c643f"
-SRC_URI[sha256sum] = "3faca25614e89123dff5045680549ecef519d02e331aaf3c4f5a8f6837c675e9"
+SRC_URI[sha256sum] = "6690a9f9990457b505097a272bbf2cbf4cc35576176f76646e3524b0e91c1763"
 
 inherit autotools
 
-- 
2.20.1


