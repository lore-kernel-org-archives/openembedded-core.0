Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5443EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.17391.1687961630008543995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QEPrQlF+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b7fdc66e30so22733565ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961629; x=1690553629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF24q6u7ZLngfXgyFII7l/5l8t9qWxDCBBImg2Vc5MM=;
        b=QEPrQlF+0wHdpZqChgneWd59T8qEiWkuj38vMet1VV4MgC5RojhPFzAbovOUbSQmVS
         tAlafnvcj+A5/ea/kKmgSITt2PHpHDRp406T5mfEmYJmrxokK3/tLqXcxSMQrJAmNKTo
         z7jB0Uwr2DG9FoBIrDLnOjUftlBjhGs50fJDLF4R7cvpGoXew2fN4tlsTKhQ2UOO2TYF
         dj+/gGuyDOocIVATTBYi6cXfbxMMXXGpBtWwpFRjul9SIPa5KU64qzBQXiXjjJlo7+qy
         w6GXwOWj/Yw/j2LzrMi8LOmo/I3EBl4D18y9S/bvAwnQJ0ys5n1YUgIxya8N8xEFnKFx
         1APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961629; x=1690553629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oF24q6u7ZLngfXgyFII7l/5l8t9qWxDCBBImg2Vc5MM=;
        b=JI5b1KvL4wdIi7IqqAPHihRE7k48TyAFIAGkunRli26Gyl89PMvLFWztyCoC7kDJu0
         ogz1fn5bC6u24cv7OyiNtitWTCdO/hi/sLy9hljGywPVMqwNBJ9b92VcenCZLM0FaD7b
         Uf29rbTUTkU+aaHAJNZ1+bWKZd801ASOy87iUfbYCBzS7x29UFQ03JOm/KPoiGplHSqs
         wz9GLm6Niya6fLCE93N5MsjkRd1W0i/+2bzNO6oBXIkOqvwB4rlMTCVldnz03p53vznl
         NAs1i8uSutYInAKgHgxOUMRqGqeUPf1iOa/0T2+KxtAOdSvdEyhXYHIUIKFvwCO0Hz4j
         VRBw==
X-Gm-Message-State: AC+VfDxhEWjpApXZCF9MT4uo6DD2nKMvbAGLGKOmZEb8efJzCx01YQ5Q
	36YYXODwQsZQ4YTpzFWElTPrrtxgZGxvdBEJ6bqNxQ==
X-Google-Smtp-Source: ACHHUZ5VUkePh4Xn9sML37nxuy3qeWxhmfgfZ8lZuXhdlGtyLJoN528xcs24wMxOROAw2PMbYMcRog==
X-Received: by 2002:a17:903:2285:b0:1b6:4bbd:c3a7 with SMTP id b5-20020a170903228500b001b64bbdc3a7mr9783899plh.66.1687961629173;
        Wed, 28 Jun 2023 07:13:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/29] layer.conf: Add missing dependency exclusion
Date: Wed, 28 Jun 2023 04:12:53 -1000
Message-Id: <97c84ca1e138fe95ebd67f1fe42be19ab2aeca89.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183583

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a dependency which should have been in this list but wasn't, found
when debugging create-spdx hash issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1075b9fc5d562dada45b3187cb737511ff8c7376)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index ea57123601..1f329c3efe 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -69,6 +69,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-module-install->grub \
   initramfs-module-install->parted \
   initramfs-module-install->util-linux \
+  initramfs-module-setup-live->udev-extraconf \
   grub-efi->grub-bootconf \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
-- 
2.34.1


