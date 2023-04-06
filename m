Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEF8C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.162507.1680796942953414508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RkauMXK7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id d22so24024832pgw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796942; x=1683388942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2ipQVtPBK3Fbd8TRu+R0EH2BoZd9S5KIz27LFTFGmc=;
        b=RkauMXK7IrR1dnJh1IqbdnlGdfGRUZa8+c7eI+mWYlCYdxeJhDmKSR+gmYSlXRlGgW
         y3aHZZY5LwVsYhNYABOkwsUr9OOhwUc6mbJjgpEGc8lHJcZ5wJxZRl2ml6TP/E7FC48n
         PT0PLnLleeg8oqHxERAw9mbr4KkeXLsJmZlF6anCRe2DJtJt4kVPbAR4RLnakttzcaIr
         GW9/PI5icEY+MYYrrb8cjkfC1yIlxIyyYy5D3i0W2cexfAQZ/hjvwF8MplrO0O06wVSU
         70hYqUURvoOR1WDvQ6b1LjQs9qTZbG265d9wju1HweiZCdRZK1nPMlI793ngJw02krQP
         cm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796942; x=1683388942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2ipQVtPBK3Fbd8TRu+R0EH2BoZd9S5KIz27LFTFGmc=;
        b=wMZE7fNRegocrebGgTqEJO4u1bHDv613XF3x7cL/+/uld5nGuEV8bHtMzcBe6qLMBU
         Y8I2+skOlmxl/PSMj4ZDOhiEBVV5xjnHvXCd/ezcKiCpc1XarJueMBcozUDteCgL3XeB
         g1c4t7RkViRksb1YY00P49gZ/PASvdDyw92UwQxpdaU3o2oVJllTKF2diG8Z+1ZjdK7H
         8nPRLDIr8ceWtNxwNHl3FT/I8ePb/ZIDSvzVWsctxNI0W4z87uhdTUs/QQ0St+f8MGl8
         C24WGIPz0qdbYB7BYITiIW8lHc/3YgPi2l0eFCce8ZgMEdoR8yh9SjO3WKSSoFhMU8Fs
         bKqQ==
X-Gm-Message-State: AAQBX9fZ3Gfibfzj9NOZdHjgyVFnV/vP47VbAi6+j32hgcoqM2l/fK0M
	hQ7iFxHb7E43etwI2udWmMOvJeB4td+R3qP3cBc=
X-Google-Smtp-Source: AKy350aMdE/ZoDe4KufmkJhaslie5Tf/Jj3h+iWgudhuDKdD8E2p4Wag30oowV7xGo8s8P7mai1lHQ==
X-Received: by 2002:a62:1842:0:b0:62a:4503:53ba with SMTP id 63-20020a621842000000b0062a450353bamr10272226pfy.26.1680796941891;
        Thu, 06 Apr 2023 09:02:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/26] xdg-utils: Fix CVE number
Date: Thu,  6 Apr 2023 06:01:29 -1000
Message-Id: <2d03615127bb58d7865e04230ff42421b56a4c43.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179780

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In the previous commit I somehow mixed up and used an incorrect CVE number.
Use the correct one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3e2729f686ff6e16e11590bcd701c057ae5f1e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xdg-utils/{CVE-2020-27748.patch => CVE-2022-4055.patch}     | 2 +-
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xdg-utils/xdg-utils/{CVE-2020-27748.patch => CVE-2022-4055.patch} (99%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
similarity index 99%
rename from meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch
rename to meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
index ec3605e158..b236030108 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
@@ -14,7 +14,7 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/xdg-utils/-/issue
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-CVE: CVE-2020-27748
+CVE: CVE-2022-4055
 
 
 Index: xdg-utils-1.1.3/scripts/xdg-email.in
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index d95bcccd2a..4d93180535 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
            file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
-           file://CVE-2020-27748.patch \
+           file://CVE-2022-4055.patch \
           "
 
 SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
-- 
2.34.1


