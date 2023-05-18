Return-Path: <arena.lor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC7EC7EE22
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 10:40:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.13721.1684406411841865924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 03:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=blvUfkwX;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: arena.lor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f475366522so11913835e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 03:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684406410; x=1686998410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3BxxDzT80iN9x2rt2Y6o+wnYyFTnaAFBwqAJOWVjWQ=;
        b=blvUfkwXIIsUu2MntDLF+ILHu6RirXqVTGyC+MqjVflXVdPZ1QkerF6HfhDzqsdbiS
         Cqk+Ce0zbfxiP3MpFkRKUYkIPXgpMnEyUC99MzLvxB2xTQLJvKzD7q7r3zhrHg3TPFMa
         jdg9cz3D69SVFI1M2akdu6tkvNL016TvnZO3NZhtcyX0T3htWyA5Kq7zBgdYEAQ9OTAb
         COytkauNI2+KXgqTI/xokEwjegqj7iaeWPntX2jzztfmHKACkF56KNjcY0MqfNZwoCrR
         cvDkNHjpUtJPK3+IzfTtOoUos9qIXfnqyHErdEyzMHajQJdgtSpmMP/MR4MYYdNrTv0b
         p57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684406410; x=1686998410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3BxxDzT80iN9x2rt2Y6o+wnYyFTnaAFBwqAJOWVjWQ=;
        b=JdbkxPtnfngivkJxMc3bhDa/JQmyIOhHwBPDuSybFny/Lt143HgV34mL5dFU0w2Us/
         A+iMAjgzFkCGcuQFcN1Xj0j+r3n7rNeh5p2yYKM+qblA4kN5MRi5xgaAbyIUxHXqlm4S
         galiPrrLYxf/fnAMtlo6NN65J05Wwosi3l5njvmME3V0XGb4ued/rBQQhEr4Gj/Y2KSW
         btl0txqasWTSc1f97dbWA6XUj1w7Jr2ITJYygzjPqe/50tFvDr30WTObWa8ns4fEqTjV
         BMyPxPffzTck5NnoiaXMibn+8GpM79llLVoFTdtQBp/PQE90LcHscKUGXqtZ5x+PIjZz
         r6Pg==
X-Gm-Message-State: AC+VfDxAkZtsY5pPC95/lrtFFAiPkWp0SBrLRtDC5Rf4aXnEqMRu4ymp
	VgV3K7mIxeN9IgbPzE2i+LeYfH6OZVFAvA==
X-Google-Smtp-Source: ACHHUZ6/N0J9e2PlNqxQmWWGYfPZBVolmGPuBAKZ3HeO6GNahBgBXguscGUM81HqAZXKHiGhs9umrw==
X-Received: by 2002:a05:600c:2286:b0:3f4:f206:f274 with SMTP id 6-20020a05600c228600b003f4f206f274mr1127349wmf.26.1684406409769;
        Thu, 18 May 2023 03:40:09 -0700 (PDT)
Received: from larena-optiplex-7070.powersoft.it (srvsp.powersoft.it. [93.146.228.90])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003f1751016desm1626242wmh.28.2023.05.18.03.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 03:40:09 -0700 (PDT)
From: arena.lor@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Lorenzo Arena <arena.lor@gmail.com>
Subject: [PATCH v2] conf: add nice level to the hash config ignred variables
Date: Thu, 18 May 2023 12:40:06 +0200
Message-Id: <20230518104006.1243290-1-arena.lor@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5C75B35A-E9AD-4E06-9D70-4F1B2D2B720E@arm.com>
References: <5C75B35A-E9AD-4E06-9D70-4F1B2D2B720E@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 10:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181516

From: Lorenzo Arena <arena.lor@gmail.com>

This is needed as each user could be setting different nice levels
while building, however this should not make the shared cache unusable.

Signed-off-by: Lorenzo Arena <arena.lor@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2db84a46ee..314cc46662 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -954,7 +954,7 @@ BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
     HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
-    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT"
+    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT BB_NICE_LEVEL"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python task nostamp \
-- 
2.34.1


