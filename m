Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB80C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 07:13:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13428.1646550809608913436
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IXSsNcFI;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id t19so7688910plr.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vgGxuZQB9FS4T98i6fVlPyLJrzeNWQ0Fk+0LviQewgI=;
        b=IXSsNcFIXb7p94XDdqtjDUfO87vbrtfw6dvl0tje6ITEaQjUSIvbUrHlLrUAHY0BjL
         P/KD0APzXvUmevibc/DFdO0kxpjNRaEBmGZkIYr3E0l1KLEh+VfxQclKbDpIeSQ6+F/l
         3Q0OHQetzWo7ygu3ygWceJ6KkzHaMm6WOtq3n4KGw41UL5bowfOCnvvDzdokO9dd8gsg
         4x2BUj3zeRL2ctmc/Fo6Z5J7pcYY9dMA2wza1jZCAKrCO3hkKjoM/V+1R/hj0i1ov6bd
         rtFel2izlX9ISeCVMgfOmGM37ghNMDq8vIuaPsWFiYAIGOhVTpPwlZGvH9/B5i2JqAh0
         Jijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vgGxuZQB9FS4T98i6fVlPyLJrzeNWQ0Fk+0LviQewgI=;
        b=XGTEAUWqROpJHQWCYuORnggB5ivfEL/DyyoyqzwglsVm/h5hZrmeFcoOOBjg64V8th
         yP34kQ0KhWVDXjr4zLrDnGWuFNWPOI38pT/wFdHu9FQAHrcLOAdwdcXw5XQKXY2EsTKa
         ASNld3b+ZyxzCF/WstCfsTWwyy5CznnzUmGjOvjUBtjTuVGqzLs6REUZWAOp6UkZRqV4
         9/UuOMlihoyaJkmifV3D/u76Uk6LTR/xifvQXWlSDQ8Tsrzx/va91kQ7SWSOyNYGFMoG
         EF288p85uxGRLTkGzRhzLKLRNUWoa4XiYt8j43p0TT6G9qqeFYkhws+KRw05VUP9YZIX
         i6TA==
X-Gm-Message-State: AOAM532pchVbkQSU7zhCJ6JWHfx7x10wRpDdIHqS5k6cd+hMPkc5pdyW
	qoUP3Osbmdpi17xrKAO+fBtVyPaXgw6IHQ==
X-Google-Smtp-Source: 
 ABdhPJxmwuUtGGwSwr02VQ88IjBPMgvvag4OgbxfHo0eiznwibjHKDO78jB75Z49Emuna8kGF0i20Q==
X-Received: by 2002:a17:90b:1e03:b0:1bf:2b74:e716 with SMTP id
 pg3-20020a17090b1e0300b001bf2b74e716mr7053792pjb.189.1646550808618;
        Sat, 05 Mar 2022 23:13:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k7-20020a6555c7000000b0034e101ca75csm8457725pgs.6.2022.03.05.23.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 23:13:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] systemtap: Enable for riscv64
Date: Sat,  5 Mar 2022 23:13:24 -0800
Message-Id: <20220306071325.1698626-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 07:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162780

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index b7218f02e05..5b5521b174e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -11,7 +11,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-PR28804-tune-default-stap-s-buffer-size-on-small-RAM.patch \
            "
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
 
 S = "${WORKDIR}/git"
-- 
2.35.1


