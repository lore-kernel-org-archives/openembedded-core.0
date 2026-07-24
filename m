Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204B3C53213
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:18 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15308.1784883734503824641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YnPRLTnz;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so1977896d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883733; x=1785488533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCDX5OLyeuUFlcsHyIODBEz30VkYmr7EHg9pTF3hQaA=;
        b=YnPRLTnzI/MeLvZaKLP5I0bcNH5EpV8IGQxqPMq4hNCm8C4eXemRHbCptKWRlgYKvz
         T4vC/hEyAeeDuxQ/AWsTgSmLQndQwDMRU+fXT90dv+wJjEnnkhKLy2DSWgBB+VWKzdrM
         dKkJxQOusQ+GcUMXH/fYjOrSGZyTmVzfpljufezDrvO4kwdxctrMjVPQiNgj6hzYLjSr
         L6XOmc4qDpvG7cSoxliwKlqlaQR8Uf2LHCFnXnvoxV1mutC+H94ym22BvDsz1rrcFZVx
         E1Fgb1MtbNjdlrU2xXd7ZvXVHrzc/B+TwyTa8iiDHcUOIViyX+pwu0248uAIwwkNCycV
         RRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883733; x=1785488533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SCDX5OLyeuUFlcsHyIODBEz30VkYmr7EHg9pTF3hQaA=;
        b=Wcm6q1leXqhbJZosJiq9XezldppWFb5tWjfAXxdXlSTOLyJGJDAFHDnCkF5RpPZAYK
         GXBUL44Hq/M+PAgbqMKz27w0HYEhMshcCDd3emwc7lfkyNFxNY8SD2SlrVHh1QgZZJM+
         IzAq8lpRGPXZbkgfdFeC0FtEjWCWARxj9ZpoE7CIinWyMmASV6YPml1lyDfS2TfwAJi5
         H2lO2Zi7NBTKAHsdqj0FRGgvuKUq2kUj6t3fsjPYyyMi9kmLeiF6LUlx8nEJFUfRYdGp
         TssPdqrDOWRER6WH5xqfgE8G6y0KbVXl/7U481++Bq5XbOS0r+mAno/YZ2FqScLZpCgz
         DhMA==
X-Gm-Message-State: AOJu0YyivDmR0Ek1SMy0xagIrzXteihW6lA4NiKSmBSGlmEPfDUv2+op
	5N8u2RfLA7v1cT5gK89LHeic9tIciBU/sAvI/qOMsx3Z1MMtcZpeA/dkcsHdIg==
X-Gm-Gg: AR+sD10xTzbc7plHjipZyaLDrEzpdEzIeCnioVYsxKyzIi64717e0jNVahDFLnwXMVo
	hDRlOwKK5EbDeb2vZ/fxmnG0e6+IIG4HbqrHbpWjPgBhGAM7WlMncZD0W0K3iPU52v2PXaYzxY/
	ggdxxtQd//lBavJmFqWkRqu/w6heJ39gvnb49bwiSGd1fRRErVLOoG8TiliUxpjxyB+J54AiDF7
	nYDzZrHoX0Al9D9qMZsmgJ89fgU1Lv9uF3i7Jgu3yw4xU7ktMpDMFJDM9YX9ta+0slae+5BCHMl
	G9/vF+dTXYbhiLvZ0tQ+S0J/hstOJn0QyQAdTEhD7tjELz/omKje86rtVpp7I9eI02X0YFW76Wb
	uEx6xiX1XA/YubQTRnHI4RtdfzrQsw/WkTBNtLN6ndTZvYJm2Pnnc8gzX8OeLFsYa/DbSpmqFak
	VBnmi10r5ZyNO8XCWGs4ieDfKMHuuGU2WaKxvTugXBqkOwXWMiIHUfgoQ=
X-Received: by 2002:ad4:5c8f:0:b0:907:83cb:4204 with SMTP id 6a1803df08f44-907ca2c753bmr71407286d6.14.1784883733396;
        Fri, 24 Jul 2026 02:02:13 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:12 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 08/10] nativesdk-packagegroup-sdk-host: add an lldb SDK feature
Date: Fri, 24 Jul 2026 05:01:44 -0400
Message-ID: <20260724090146.19924-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241918

Some developers prefer lldb to gdb as their SDK host debugger. It is a
large addition and not wanted by default, so make it opt-in.

Add an "lldb" SDK feature that pulls in nativesdk-lldb. It is not enabled
by default; a configuration that wants it adds the "lldb" feature to
SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- reordered ahead of the default-on qemu and gdb features so the opt-in
  features are grouped together

changes in v3:
- new in v3
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 31710a23969e..9e3190af2a56 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -31,6 +31,7 @@ RDEPENDS:${PN} = "\
     nativesdk-perl-module-integer \
     ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'sbom', 'nativesdk-python3-spdx-tools nativesdk-python3-sbom-cve-check', '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'lldb', 'nativesdk-lldb', '', d)} \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a


