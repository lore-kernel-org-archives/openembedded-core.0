Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C455CD6E7E
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:59:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6471.1780700391936888578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Avr6xquP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b64c8311so27626035e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780700390; x=1781305190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqHkD/DL6LWgzw4AyJO+He6TWa492EWVQ9hdJTc2Sbg=;
        b=Avr6xquPkG//4erHB48IkJc+f0b5lUyHeMxLni0b09v7r+wk7AoF1l5FdD3TsWycbA
         OWCrVHCa4xRYkbbwDuSEHxD3xJN4WO+NgEBo7d4+ANM7UoU0cvdUlEFDJCz4EwSyfhuJ
         s5BMt18r3g9YyHFbd7FwGrLz1vzZvfbLac+/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780700390; x=1781305190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqHkD/DL6LWgzw4AyJO+He6TWa492EWVQ9hdJTc2Sbg=;
        b=YaSr/OLf7OuMSB7PKgmOrAT+DaPsbIcz0byqwAAufhyw7Ru5nfc5UohhYiBoyyjomz
         OMT22yekS2y8+iNtfTmL67UvhiuzalCmGK9hO07/aAsDrypW24W+dMS6fyNRrtk7WXuD
         ciWEXhh/m7MAz4OLP1JpBzAT+TdItnhYLlcscvBYwr9u+LXVJVZdBIKbgYlmsdSy9t0Z
         BsRGc7xSFplI8ifel8m5qcrBITEaNTL1uANCUqXAaHEaf2RtmnrJSAeFH5gKqpdRljro
         TN+2k4ueaE93yjF+gVPs+O17gDXXZdv+VaruFMXdXnJwJzKVSozkS/p98Q+IxhoLI0tj
         K0jw==
X-Gm-Message-State: AOJu0YzcuDoZuvffkYucDlfkv9fai5l23hNYNytr36IRbRb1Yf8Skor1
	jN9xmX42IxEMQ7nvAUZTXCS6sizYhDUVT+IXXyddethyHDXTk8wVkDybRcmVE1xjhRnTCIbm3Na
	jNVlt
X-Gm-Gg: Acq92OHTDWFTozipcLZ1KedCRQm0njlpuK0xJJpImC/wsLXzu0uQXuLX498Ch5aw3Ox
	yxQa068eXJS/Xfzov6eLdiI9YpidTqQNG2wRUL6mH1YijkC48RJBqk4Su+O4T9EqC67GqDnkGV7
	1Zqrm7uu0JckQazzg/jp8x48bBkFpZCsfety+f3ul8y/4dEuzJHzWtM6PlOwgJTqEHAqtbL/D8T
	7lSex3Qoe/kBxZ9l0q3plkMKWAGuQG3PrAmn5WucXrwLfFYPHPgOW8OkKszUEaXGvlRCSUDIIyv
	X+AkR5hg4dJEAdPOLqYFUcFUkqxmDkL/XwRX77XoScNcUZ9HShE+yplzMhzuwWfVYhPr9tewt8q
	CfxNTO0R2xYF3Zjl180IxdBBg3EnxPDIxnGG5dN0+LchYvxOfLT2pY/xCNJrradUvz+SgBkQY1R
	HyiCvFc7xQE+/WJjfkw5l3CVwR64K5Qn/e/8ApAsUXVNTVQXNh+0ie/vIVOxteCDg=
X-Received: by 2002:a05:600c:458a:b0:48f:e518:d110 with SMTP id 5b1f17b1804b1-490c2614beemr82939705e9.32.1780700389914;
        Fri, 05 Jun 2026 15:59:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1012:8ac6:f163:489d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm73280725e9.2.2026.06.05.15.59.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:59:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gettext: Add missing xz-native DEPENDS for reproducibility
Date: Fri,  5 Jun 2026 23:59:48 +0100
Message-ID: <20260605225948.74743-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238214

gettext target packages contain .xz archives and we need to use
xz-native to generate these in a reproducible way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/gettext/gettext_1.0.bb
index e20ad8807de..08b4819f275 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '',
 # without glib in PACKAGECONFIG vendor copy of the lib will be used
 LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'glib', '', 'file://libtextstyle/lib/glib/ghash.c;md5=e3159f5ac38dfe77af5cc0ee104dab2d;beginline=10;endline=27', d)}"
 
-DEPENDS = "gettext-native virtual/libiconv"
+DEPENDS = "gettext-native virtual/libiconv xz-native"
 DEPENDS:class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES:class-native = "virtual/gettext-native"

