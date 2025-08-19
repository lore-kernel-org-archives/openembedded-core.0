Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF21CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:57:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.11907.1755604617830532223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 04:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8NETiGD;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so24025185e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604616; x=1756209416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9tOOXFj32h+5zCQQ3AxE9V7zGenOkiX3C8wIO9W/MA=;
        b=N8NETiGDY1axPu0doc8kkL/xE3T6EyRwOnfyX2zMtgVJlJvMyOwGMhKciPQeNhfI9F
         fjLcdoiHwAyRUkX3MTeq9mr3POHL8X8gDZI+2ewbKYNvmGo2MVHKHnxVOLzykOVhxhp/
         iCPMpHa+cHi/qQWdaGKsucrjgCYTMtNKMs7ougIPfNusGC81zuDUBuhFaHFO8qPWe/Fn
         YHKzdHTK/DMyZR3iXbRPOq07HIoh+geHWxpEpmHDQl83BKDVVh1qVniQ/yIroRCtccSj
         nJSd+1X1ED8MZAcmdDbFU8oNBHp6v1w+9kD1wRKolWNoGy0FWaxlBsFn+zz5Fqel26qb
         1eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604616; x=1756209416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9tOOXFj32h+5zCQQ3AxE9V7zGenOkiX3C8wIO9W/MA=;
        b=qL2S/pq0qP55dXETzSQgI4fNuxq7eUhBQa/NZxfKeqdsluV1hlK39xJqtb5HGou5Ja
         sOtOOnRJgGsRB5VyQZq1isJ7g4vKT28Ro2USxEOJRVj22IkbJbjYFDCtj6148fOQgrG6
         iBOba2feS3pisWLVUeMRPzUsh4GQexL/bd5HAKx5URHT7LUbugaqUxmMXyoTP4PM3Z/i
         QBtlfzxSNmaxJHv/F088nDD1/tzbMuw2k4ME0KxwVuWoMVV2/yukoVHWhJtMF60U5Kty
         FSo+zLeJz7bz84Zs0ATD7X9OGIQ8aJEUIY79wYdMS/B7Hr/lcC9bbsXATl1BUrPcsAta
         bDWg==
X-Gm-Message-State: AOJu0YzvRtWHZwGhNqQ5CPJ0Wgfawoi4uN/Ak1+YTJG3SOQbuo9jYCZX
	N/DXa+jesz84LvCMQSs+g2C+bq9tZlZC7re/UzrxigDV9I6NT/BV6fgVu+0/UQ==
X-Gm-Gg: ASbGncsRgGBUNGo/snV0yUvVVecoG6Asi8jPTW9Lbqe0fGehwiESGslNnh2PyC4TkFv
	yoQ8uJz7YuNu7eFTY0b6QyRfyY0ISozJxmo6kXK4LAiQEfC37oSucKDP6TUfPHczOLg0xEWzWLn
	bSUDuoXI+FcPJ7f6CywEBd7HFPCPi8loxZnh5utwGbKHqSFx6YOVk3ON0dlA9r99s+eB89zz6y1
	gVSO9DQzrJk415qAqhTR56MtQhzdS8aWss3eLWai0ygbN79fGAQBBPMc2UENnirFhQlYaReTjVb
	OM8pXvp27GueMf/GWt1rAUH6B8bVMxhaqrzlcY4TPb9VceE8W5TrvY3SsSs2agJL6ljr6dAtzgg
	Z9flvlPdnrapJ7jtHCS7gdOsYHgTnzChYbIuueB2w16uF5kuUULtl66rru6uC0JzxN+6GjQ==
X-Google-Smtp-Source: AGHT+IGGRaysf8zMPnN05IprK2uTrf2boKv69CEYoW6il1CpG3gHI5XhiOeTgZwrY8TLyndG6C+6vg==
X-Received: by 2002:a05:600c:1c9f:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-45b465aa647mr3602025e9.7.1755604615851;
        Tue, 19 Aug 2025 04:56:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cd044sm223676985e9.9.2025.08.19.04.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:56:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3 2/2] fragments/autobuilder: add go to SDK_TOOLCHAIN_LANGS
Date: Tue, 19 Aug 2025 13:56:51 +0200
Message-Id: <20250819115651.3725293-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819115651.3725293-1-alex.kanavin@gmail.com>
References: <20250819115651.3725293-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222105

From: Alexander Kanavin <alex@linutronix.de>

For reasons unknown, only rust was listed, which means
nativesdk-go was not built or tested, which lead to
breakage like one fixed in
https://git.yoctoproject.org/poky/commit/?id=a669cd2e0c760da9d7e872daea9590fc9e86d766

Note that with this change only building and installing go
into SDKsis tested, but no tests are performed with the
toolchain itself in testsdk/testimage.

For that, a bug has been filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15953

Remove go from x32 and mingw targets as it will not build for them.
(next to similar removals for rust)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_base.bbclass          | 3 +++
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index e6685cde97b..948e6334ee0 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -62,6 +62,9 @@ SDK_TOOLCHAIN_LANGS ??= ""
 SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
 # libstd-rs doesn't build for mips n32 with compiler constraint errors
 SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+# go will not build for x86-x32 or mingw
+SDK_TOOLCHAIN_LANGS:remove:linux-gnux32 = "go"
+SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "go"
 
 TOOLCHAIN_HOST_TASK ?= " \
     nativesdk-packagegroup-sdk-host \
diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index e3bac343390..85987b08995 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -9,5 +9,5 @@ IMAGE_CLASSES += 'testimage'
 SDK_EXT_TYPE = 'minimal'
 SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
-SDK_TOOLCHAIN_LANGS += 'rust'
+SDK_TOOLCHAIN_LANGS += 'go rust'
 
-- 
2.39.5


