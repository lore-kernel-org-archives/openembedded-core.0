Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4B9C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:17 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15306.1784883729375680366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GbigbS2t;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e6a434cabso9978785a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883728; x=1785488528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9TSewrfmfMIhtf4lzYMy50xL9GAckCJvPSGTmvkHtag=;
        b=GbigbS2tPtrJn8ARYm1lYVAikZzoJlJDWozvBEnN0DR7Qq1pLjOhDfOEaBp2hC6lZh
         KajmaGp5PoCDnUhpupY9Hl3wxbGzR3ft6mYNhSQuqaoCGUioxyS7OUXjYFVTck8xH6BE
         +xvnaTmfmMBA++11SjIquKGMMvihTu2O3flu0T9oW5dSKC2RZ1AyvVIu+wsAh7HBNJ9y
         DnHsXUL/rjtfoRTxu3vXCwzlQ1830HHmFmSxb/cE8TD3JKkW3xgWEtdqLiaNV14TGzHY
         PSNX9YP9kdna9GEuF8EtrWfDQ4QQhsp5YQP1R87z5kshKdgtoc9i7ZvwIiK+QB50vpUe
         VCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883728; x=1785488528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9TSewrfmfMIhtf4lzYMy50xL9GAckCJvPSGTmvkHtag=;
        b=faaulkhmQ0kvTnlJlA55+BCWIzCCh74iJYGPnxMq+4F62f76VFXmMfZC5gGOwkk5PF
         u1oxLze7HdgVObpvj6Jn47F8xohNztbSlGJCPIVJ0JeV/ZPhe9+th/HXLS+k72h9/y2F
         XJSW1YaLZWqj5mDXxRuC9UZsbUbDbS+suVwbwE5rX/be9fg/+xCGQIaPyHbTrPHI4rLp
         kgvtBl9dOcq/iGKpZ7EAHuIIE818hIKw3h+5fBLBi57g/6Q2JdcdVnUX/66ALTMIBICu
         tSdMVITFno30DI70EDXpzdyXmXhP0HB3TNE5nyQqlcKa6UUVTwZ9b3jh0nz8hduujpqV
         Rz8A==
X-Gm-Message-State: AOJu0YzYrWej1ijolXLFWbI6LgbI5i43pb9s/1x7cbQCiQ46KfeiUQJM
	Jh+AFJszqPr+fkYj4Il4ucvjGIxti9bRXQJf6zQ1MQdcCt+nQzVyWdYmJ+QbQg==
X-Gm-Gg: AR+sD10bItOaoZOaN7ozC+2f0s3Yanu8jqj73OphPq3SBmOI8xwOXu2XKiknEac22Mc
	403R5sibiMs2rEV0Gii8LuCOL53ry7hLldnZYRYP66Ze2B+1O5GpKa/gH2DXhw6YNHMZsPhFiqB
	4Vtwi8U9TIVAEFnDlG5+EuGKsMBLwLbQGYZOOVrhKYeQMw2KgS+KqV12hn2byZwq2Ou4WhYlLTy
	UdPIDq38J1Q6TZqV8nzvh9NB+QgYYtFiMDKvRrDZLhbRnyKN8pWcPebqfResnKDLqawllTaUOS/
	KiR6EwKNHZnwI4AjfJEBORJ5kcwUHp2bWoZkhSdDaTbliVTbgDUiMyARYB5lIBldtQQ8Z5f6gKz
	ZiZQHjmWP+OXVX4zs8T8O7UR2oSF49OnywUqaNo+SdUi+BNFHmUCeEurHq30ZakOPbKz8dMbVlU
	owxP8c9PpP+9sdIu0+MEShpVyGgHDWizOCCxsSGGRS4qRw
X-Received: by 2002:a05:620a:2793:b0:92e:cac7:96e6 with SMTP id af79cd13be357-931038edbdcmr618712585a.58.1784883728214;
        Fri, 24 Jul 2026 02:02:08 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 05/10] nativesdk-packagegroup-sdk-host: add an SDK_FEATURES lever
Date: Fri, 24 Jul 2026 05:01:41 -0400
Message-ID: <20260724090146.19924-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241915

Add SDK_FEATURES, a mechanism for optionally adding features to a
standalone SDK, in the same spirit as DISTRO_FEATURES, MACHINE_FEATURES
and IMAGE_FEATURES: a configuration adds a feature to the list and gets
the corresponding additions, and a developer reads the setting and knows
exactly what is being included.

This commit only introduces the variable (defaulting to empty) and
documents it; the features that consume it are wired up separately. An
empty default changes nothing on its own.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- split out from the v3 "add wic via a new SDK_FEATURES lever" patch:
  this patch now introduces only the SDK_FEATURES variable and its
  documentation, defaulting to empty, with the individual features added
  in their own patches
---
 meta/conf/bitbake.conf       | 1 +
 meta/conf/documentation.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da247..8f590ed374f0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,6 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
+SDK_FEATURES ?= ""
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 842cf31739de..42c8327e10ff 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -361,6 +361,7 @@ SANITY_TESTED_DISTROS[doc] = "A list of the host distribution identifiers that t
 SDK_ARCH[doc] = "The target architecture for the SDK."
 SDK_DEPLOY[doc] = "The directory set up and used by the populate_sdk_base to which the SDK is deployed."
 SDK_DIR[doc] = "The parent directory used by the OpenEmbedded build system when creating SDK output."
+SDK_FEATURES[doc] = "The list of optional features to add to the standalone SDK's host tools. Analogous to IMAGE_FEATURES but for the SDK host side."
 SDK_NAME[doc] = "The base name for SDK output files."
 SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creating SDK output."
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
-- 
2.50.0.173.g8b6f19ccfc3a


