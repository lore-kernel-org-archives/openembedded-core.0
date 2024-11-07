Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA47D5AE45
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:30 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.63348.1730946567538253299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I3khlovV;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cbe3ea8e3fso3047756d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946566; x=1731551366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss+K4EAHRNKQabH4LAn4crgFlhSj134RUxWTNLsAV0Y=;
        b=I3khlovVAsISahUpiSQPV3FOuU1Cq469021WhScR0Ol5dQh7m21lqQ2Y3Nn4KbAbRa
         K3lSRBTv5M1BsQLC77ZbpvgycbG1c6WSqWM69/vBUnuhKjY9I5SKqSJRWaPr0NUPoMr2
         +Q1XbTONnVSG8drzc4A+/R8K888RYKRABRxBOLdMWzRaWnY1J+dfGp/WgiZyKeUrQ/BB
         EXpgH80zlQPyBYTUppmw3j6J+lwipF3gpS/p3JYfoFins7idY1GJnoUX9WomY0MUBUnD
         DqxwPcGQZfzWhYcPc6BTdw8vy6Y9VKlZL2MpG8QV3ScRuhyfTavTR4xTJN6FuPUVo+hH
         JqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946566; x=1731551366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss+K4EAHRNKQabH4LAn4crgFlhSj134RUxWTNLsAV0Y=;
        b=p6j9MthrvX84HQd0zx+0wOul8SgBJYhmESFyvH3uUE3tcSfl8+zabDJB2ZKNMIwBvx
         e97HVOKbz7lTOW9H6HBSAlKnJNFX7CPMJxJOeDIyrev9iXlCBvveIY8GTI5HYNdspNT4
         JWYd6zpcI36dUjzA32hi53c8L7ysWALV939BavAbVrP/B03ybYCZT0gAON7PCwUyWfkW
         ILhBckwMM7G4FfxLwjmjYco2XsbA9WYPPHTUoL/yuCUUNgioBqDc9mRv/GnbL+oVmvCk
         We5cWRrwuZAcRv4jadQogunrOieH8Ecjg35PGLQ5YjoEBJXMOaKYwpdlPyfjydJ2rdqm
         ZPiA==
X-Gm-Message-State: AOJu0YwKBgFfstBkSNAFE2sF83wo/ua4+Wn2Id+7Ti/i77rxW0TXjqyf
	0QgA7S4WmPhktuTQqK/edE4VBhpwWpCwaPt36o9G9pLnhjpaj6yHA5qkHxcl
X-Google-Smtp-Source: AGHT+IHSN6l9QVY6vVOlCGitR7p14mj8QGWxSEVvD4EvnN3hA5SKnYnVifYYjo4BI0JxZ8l6iNgZIA==
X-Received: by 2002:a05:6214:3a8b:b0:6cd:ed0b:3392 with SMTP id 6a1803df08f44-6d396c8b8f1mr5285346d6.39.1730946566555;
        Wed, 06 Nov 2024 18:29:26 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:25 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] kernel-yocto: allow early exit to configuration audit
Date: Wed,  6 Nov 2024 21:29:10 -0500
Message-Id: <10f89d1d8ffd7955d8e149bee1eb9cbaf0f3baa1.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206809

From: Bruce Ashfield <bruce.ashfield@gmail.com>

With the ability to tag raw configuration fragments as "hardware",
there is a chance that badly behaved fragments throw warnings or
cause other issues that are not applicable during development (or
you understand the risk).

Allow kernel configuration audit to be skipped if KMETA_AUDIT is
not set (by default it is), to provide a flag for control over
auditing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e73adcc725..a5d89dc2c8 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -568,6 +568,11 @@ python do_config_analysis() {
 python do_kernel_configcheck() {
     import re, string, sys, subprocess
 
+    audit_flag = d.getVar( "KMETA_AUDIT" )
+    if not audit_flag:
+       bb.note( "kernel config audit disabled, skipping .." )
+       return
+
     s = d.getVar('S')
 
     # if KMETA isn't set globally by a recipe using this routine, use kgit to
-- 
2.39.2


