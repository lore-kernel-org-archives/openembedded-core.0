Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9A0E77198
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 03:36:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.11128.1736307391698643208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 19:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZYL7Xxko;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165cb60719so244803985ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 19:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736307391; x=1736912191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbD4k7+YUCCEjS0IB3FeiFZS0Mm+4vuCVDSPGaMJK5E=;
        b=ZYL7XxkoTC5y9dWndl+lwnDrw2wIgWPW3fhETINXu8e1kfny6qd6AHVHtAxxLRKmtv
         Sr3oGU3BJV1k6pzid2CFv65ForglYE/HIJK2s+x22xeBPyY4Tgzj+bWOh0zQGTwoNsKJ
         Ri+0mm/yOtBpThFcL68FI1x3MMYx4igQqq0SFxtNuj/WmD8n9hLybnwdlstpjXPoQWkw
         NiGFl38PUwRsSn4OkOkfYQyO1OcpT2BImJeRlf2wFJPxVZPjDE+AaWW4m6WV7EImRpul
         9i2WDT/4IczNeXQrE3IwVIJijtzbslUASQltR+Qt3gQ3IzHhoW5oJDTmEZW8Enm6uOaH
         knIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736307391; x=1736912191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbD4k7+YUCCEjS0IB3FeiFZS0Mm+4vuCVDSPGaMJK5E=;
        b=PQYDnc8oCDM1cTKu1i1qH7XTcM42RUcbJRhaQMWfKQgwMvIss/Aof7vjgAb2HkjrtN
         BjSVmTDPxB3U4lC/8VL0xLs9RvSm5ZocAIm4/2W/yRUTKEeDfl8xS/kwF/TzjjQfyfoc
         ewwPbPFqlq8dkqzDUPBPij3rd3/2tIZP8GxgWLXchsOJXG1iRxIBXblOcGhl137ofi2q
         HdIarKUheYvNw9rpfd22z/C8zNqY/vvprNEQMUpoFGaBKrsYPbTZGI911CwaIbOxKILN
         WOBjNLrVfCHzqtFu7LNKcak6mI6y2tyX4u40HiKZpw3CuiIvCmi21d8rieMvI7g+ui8A
         VcCQ==
X-Gm-Message-State: AOJu0Yzt2Z2Pd5Fn/HUlsDakQs8fb4sle4NVLBlkdaFgWGaSXObkf7W6
	qHOUjPYfDmenhOSQJjCLF77m00nUr2NpXWzVdnsgSrBXdHUZf4K0kupunw==
X-Gm-Gg: ASbGncvM2GqbXmlNgIcKnpliegWDfhOKHNIX37sI35pldV4bhAscFJlzBhE9XxnQVAr
	SRxSifRSVOVPIEaWk83egSpIbAU5m4IvshmiomKVBlt/tkzbTAQJO3Y2akAMb1EzWTAxqrvQ445
	0cZeisp3HJnSYqRsvqoXksr1BuGH782JekmLK20DTpqGlTqrskoQ24ze6+dHRmfCYijlFMNgJRD
	f5YaTiQWx3nCCJr4xOHRtSxKJW8z4RJ/38NTNuUlDiH8l1i
X-Google-Smtp-Source: AGHT+IElj7SLrrDQWRv9kyvt/cRaX9ZxE98OUpfpLieJKmOGsyOoknMV7AxjQbDaZhVS4ukn7+aBnw==
X-Received: by 2002:a17:903:124f:b0:215:83e1:99ff with SMTP id d9443c01a7336-21a83f63f68mr17136935ad.27.1736307390785;
        Tue, 07 Jan 2025 19:36:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::5bc2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm31792116a12.7.2025.01.07.19.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:36:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] webkitgtk: Fix a typo OFFF -> OFF
Date: Tue,  7 Jan 2025 19:36:26 -0800
Message-ID: <20250108033627.2889555-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108033627.2889555-1-raj.khem@gmail.com>
References: <20250108033627.2889555-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 03:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209509

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.46.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
index abbf84ccbe2..ed5055962a9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
@@ -87,7 +87,7 @@ EXTRA_OECMAKE = " \
                  -DPORT=GTK \
                  ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
                  ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} \
+                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
                  -DENABLE_MINIBROWSER=ON \
                  -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
                  -DUSE_GTK4=ON \

