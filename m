Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ECBC636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.3155.1675840928155593088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V8nNLrUN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso737365wms.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNioa1NJkA1yz21Mz1ZHKs5dmssug0PUrb7vDci2NC0=;
        b=V8nNLrUN87gufdmdIVivdOSRA5NvAFJ3GojFfRMaj6/Jl5avog+VIGapWV1Yw7i1Tl
         QvSfqPA398leAUbplR4+J/cNgDTg1gjP0jcZyKFFi8aRFlJnitUqjc7XeGGPDDhYPQEB
         9CHTYNLABpDQYzSFMz5U4zZxv5RHZCBUAQ2Gic3RKIs9aehtYL2fx7fzC7pQSj44SqAz
         tx4obPNG0Qe7DS+4fCer5TsrS7Utpm80pwsOSv70QFic9L4df5uiYSx/6yT4jDGlDxNA
         Bo6Z3y8rRbt8zJ2tINFsjyYxYx8JU4fE5Te2qyYlO1ASj28QVgY3BvT+1MVOgy+hv0/r
         0zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNioa1NJkA1yz21Mz1ZHKs5dmssug0PUrb7vDci2NC0=;
        b=OWdXseABLTL8lN2xna+yQEVsJvyEMNgIfMhK0/N1eg321j3dWIlaC4ycTdqrwxoV8X
         yudsCThsf9LeNM+lwhesL4MxkO4XtX+aSDpKaGqwIKa2rEaoNkLGBlmxXeCmIdkvSQND
         6Lf3F44LLQyakOenR/ylgam6l6gCECJXTalbrkEYIRs+NRHTHUrFBF4XygsvxxaXbBkf
         baPHzx9ShR5F97BDuav4qXAhtdPfi87AuzjOXNNmuG9UW89OL5VgVgTcTu8n8lU37nOp
         dMeYw0VQamUdfuNVSNjsqp+T/fZqcwpg29ksY679EyqWFNVYhQgoBeT6q4nlhbGoWkQ5
         Xjpg==
X-Gm-Message-State: AO0yUKXu9az/3veMm74FchWhxZ6lY9Uiou5/g6/WQpFgvngtm5Ij1NTz
	no+d7U2ZyIaOyDO+cNZXIVS+JarG2GU=
X-Google-Smtp-Source: AK7set9BvS17ZYRGKX3mE+9I9Daio8RH/i52yCU9aQ7k86c9WRfEzdK9BTK/vgSaxBzt0p7NTmKuYg==
X-Received: by 2002:a05:600c:707:b0:3dc:5e0d:4ce7 with SMTP id i7-20020a05600c070700b003dc5e0d4ce7mr5653530wmn.11.1675840937733;
        Tue, 07 Feb 2023 23:22:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 52/52] python3-pathspec: upgrade 0.10.3 -> 0.11.0
Date: Wed,  8 Feb 2023 08:21:43 +0100
Message-Id: <20230208072143.2930292-52-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176892

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pathspec_0.10.3.bb => python3-pathspec_0.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.10.3.bb => python3-pathspec_0.11.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.10.3.bb b/meta/recipes-devtools/python/python3-pathspec_0.11.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pathspec_0.10.3.bb
rename to meta/recipes-devtools/python/python3-pathspec_0.11.0.bb
index bd1e7e3639..bf0dfbd728 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.10.3.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.11.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "56200de4077d9d0791465aa9095a01d421861e405b5096955051deefd697d6f6"
+SRC_URI[sha256sum] = "64d338d4e0914e91c1792321e6907b5a593f1ab1851de7fc269557a21b30ebbc"
 
 inherit pypi setuptools3
 
-- 
2.30.2


