Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DC6C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 06:38:52 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.22536.1699598327368721208
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 22:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ffkBTRg8;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9e5dd91b0acso96849766b.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 22:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699598325; x=1700203125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73wPzavUAduD9pvWIrm/eko5rQwSJ0cyJMGCDlGG4R0=;
        b=ffkBTRg8W6K4PrvYB9mRp/gL0gcH4y1vNdY7ahnMe3OFUQTK1hDN6sYpCm9DFxwss+
         UmWUvPCLhf2EJeakbAiWoVFZCx2gxj1nS5Fy0GHvbBhjBRvIRJsMgk4/H71UorZWI8NE
         YAIZX00m4bhrkTHc7hMRi7r8Y8UoEn10vrNyMbrcel7QRyxFZjfFcqX2B2eUBVUDI2W6
         3ISxXUDZaY0JxNCcms7ve7fj4yceQPGaXfBbSxlWa1UXeD1SRtrrAkOjdnOpZE6t9iMz
         boF34QXZjRRUNxfTFinqzL+8Cmnpw/kKM5zQjAu1Ykt1gQVixG1INMvgwWKDBmleuQ8K
         +EZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699598325; x=1700203125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73wPzavUAduD9pvWIrm/eko5rQwSJ0cyJMGCDlGG4R0=;
        b=SNA2OJfK4xGp6/YJBaOPUOwJ7F+0aq8HPW3fWoRrwYo8f4nkpzSuVvfMidJHrpBvuy
         J87/SeyJZpAXfc4821vp/1a+Y+SIHiDvNGoxu+qeRZTKjp+qT1A8l36E/ifAP1gJy4es
         wVx4wz7rhkN87kCMYP8XOKrHOsjFcSu7pKWJHQG0b1cGJu0NdWwp7mn5tV5vTRsct9Yl
         F+ZD5dKl0vq8UJGlXhonkVTzQQUm5ah4IyZQhVGU+StX5mNeMfl6Y4YTZXQdBmdj5M5b
         E95BxnuQhn6bCC5zrTzRC3pjofh/WaVLZo7fgq+DVZC3uRc40ESPplF0/SYX9D/v8avR
         KIhQ==
X-Gm-Message-State: AOJu0YzmWDK8aiVx8AEZaxlrP3MR/uUQYjEPTQOVvknOFbGre5XA4Ks6
	v5267T6AB8e2TS4cqRw9EF7R5ZSyFd04hizl
X-Google-Smtp-Source: AGHT+IFqu7XZLM5Yt38WepW5b11+zSRWrrvad13N7rAvJRryJSKAB5ZIZJZKQqcsH8yt9De4APg4VQ==
X-Received: by 2002:a17:907:9403:b0:9be:263b:e31e with SMTP id dk3-20020a170907940300b009be263be31emr6023351ejc.33.1699598325072;
        Thu, 09 Nov 2023 22:38:45 -0800 (PST)
Received: from slackware.local ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id jg16-20020a170907971000b009e5ce1acb01sm757907ejc.103.2023.11.09.22.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 22:38:44 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] staging.bbclass: Inlcude native dirs for nativesdk build
Date: Fri, 10 Nov 2023 07:37:35 +0100
Message-Id: <20231110063735.20734-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 06:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190399

Some build systems (like cmake) check whether target binaries are
present even if they are not used during compilation. Excluded ${bindir}
causes such recipes to faile to build nativesdk variant. The good
example of that is protobuf/grps nativesdk build.

For more details refer this long discussion:
https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-global/staging.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index d229f40107..72c811d609 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \
     ${localstatedir} \
 "
 SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
+SYSROOT_DIRS:append:class-nativesdk = " ${SYSROOT_DIRS_NATIVE}"
 SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
 SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
 
-- 
2.35.1


