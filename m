Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14617C76196
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 14:16:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.102748.1679667397645616468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 07:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pwd0xDUK;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso1095932wmq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679667396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5swK8m41Ga3idyolVMN8ZalALr+isfeoHZdM4PnodeU=;
        b=pwd0xDUK06WyZHoLgRQs7/O85BFAM1ptavOc41kcvoJPQvA2T/yvCbxhxuEy/yNC7m
         bRjIo5j1x9xybgjsdfl7tUJMi+cFNcOfh3W5rYTI92xbIvvIdG3AY8alB7Rygsk++Syo
         Cs3CYB1L3A4RvLhEe2IJg3D9LT+nPx89lZeitXB7aryP4c/UuSNMwlvvNOcWVFV8sJhE
         Lgicl+jr6mIzk7hrLPH4ClF+gnHVwNprmGovrgE63rT2b0ObGBMPUP/7RYrfYC4M5pGT
         rWgAbqoiPEzKCBqddE+J/LF1ja5JrmZa2eeKV/glQQesPmfdGiqq81+ndDN3otpx/pkn
         Zl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679667396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5swK8m41Ga3idyolVMN8ZalALr+isfeoHZdM4PnodeU=;
        b=bmR8ceI4BuTzvqBMgprQYYpQbA2BVzoxs962M73rjREsDbUBDU4zUy5jALBdHOxa5I
         Xgy1OS/0UYqv961e1AOL/fLFMnrJVKd7ixTHJLAdF01JTrZPBC1PSl0O3Kj2uHSI4kuf
         AB3o3XA7OOh5FuFetRd1975q9dJRGJT+Z3RF5DrAZSGYXWGewcYfzUlMJRRg8K2PZDxO
         ve8TSRVzg958jlitx6gQlAUL/c4C+oBZlx7J2GEWm0u9sz6SIdEXPlfgU9hMGDJaczP4
         +vIIaxevVHg2CGMxvzQfwB9UMdx93hCE/EnRjePYO+1/0nwz0Hf1kHgD8+b0psWYvwXx
         qeEQ==
X-Gm-Message-State: AO0yUKW8IsO5h3q2swn6wH4HSvG3V6wRoug49Tz6SDl9tmVNgylxW8/Y
	7FdJ2yvq80nPicfO0XG99fZNj0X4NCw=
X-Google-Smtp-Source: AK7set+n2XkdJuEMqcrgibFTr+4QrDU1Z0ajY3UUl8n6aL2jkr6toYe8qTc6CYKybDkzz5rZPbKU1w==
X-Received: by 2002:a05:600c:3789:b0:3eb:966f:5811 with SMTP id o9-20020a05600c378900b003eb966f5811mr2705596wmr.3.1679667395994;
        Fri, 24 Mar 2023 07:16:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t16-20020a7bc3d0000000b003ed1f6878a5sm5032379wmj.5.2023.03.24.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 07:16:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] python3-scons: upgrade to v4.5.2
Date: Fri, 24 Mar 2023 15:16:26 +0100
Message-Id: <20230324141626.1361740-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 14:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179036

* fixes:
  https://github.com/SCons/scons/issues/4231
  which caused e.g. iotifity to fail in do_compile

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/{python3-scons_4.5.1.bb => python3-scons_4.5.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.5.1.bb => python3-scons_4.5.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.5.1.bb b/meta/recipes-devtools/python/python3-scons_4.5.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-scons_4.5.1.bb
rename to meta/recipes-devtools/python/python3-scons_4.5.2.bb
index 279347ac9c..e0173a309e 100644
--- a/meta/recipes-devtools/python/python3-scons_4.5.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.5.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "9daeabe4d87ba2bd4ea15410765fc1ed2d931b723e4dc730a487a3911b9a1738"
+SRC_URI[sha256sum] = "813360b2bce476bc9cc12a0f3a22d46ce520796b352557202cb07d3e402f5458"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.40.0


