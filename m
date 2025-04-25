Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0782EC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:42:23 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.12347.1745602940841673914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yb3dBSlB;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c7913bab2cso260646685a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745602939; x=1746207739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yykxzHOTUirwYZay7aYUSHXN5WJTlnoh/zjaqFw5yMo=;
        b=Yb3dBSlBPwdvDoLNEbgS3Hne5QDWNlxoY/eS2EMtBL/aehKAgCdoBPokpzEnnEjd6t
         AGoMTEf9YW1CaMXM03jAq6jsbiQHPHp/MnfOeoNeTEGODt+vyya3jsJfgFKuogioJVgH
         OvgBkQB9IGGGdduShmRMcdjBZFX/gWKEScm/Plbqt1FQJ3Dp2y4UU5YvD8QMEK6B0jJ1
         eRZo3XNVtfMsN8uv8ptIwwS+DQTMrGhG7Vvaocx8l8S+PHs36vSNjL5iFDDRTntVKqY/
         zHpVgTh5dzFH7VjEe9/ti0Cw+IUnu56F6T73olrtYqfUELWCAYugivuBNrQPpeuR/OZh
         qmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602939; x=1746207739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yykxzHOTUirwYZay7aYUSHXN5WJTlnoh/zjaqFw5yMo=;
        b=bW9T/Rjd7M2gqvmg+RqHdSuJ0aL5Fdf3mysPuUxswfpfES+BuSRYxp/QdrHU28IALM
         l2xQ4HHVChCy57BIYk1fAcQWsCqG2+keapSLG9Db3lpQy1XuHQ4C9MK5AsQDOnTIRAvo
         bXhJrcg/kNmx+sbRVvJGwG3zS4tp6D1XxPVgEiBWNKSbAuxvT4Arw+3NjTq6PzdesfGS
         oPI5UaUQnIGsAM6bNhpN+3htizDBOyD1uVl3Yr/6Pgt3kKYn6mMkiToowHYryEg/pRCX
         NIxqkrbpFUpUQntvBJ/A+UKQLU8zSWB/MeCXQqMC9U+bIMLV/XsRuINKsFJj8pWBBxiF
         4hYw==
X-Gm-Message-State: AOJu0YyDLI8v6LPlnP5AyeN7IF4ZDEXzy6CNdaFcff3nkD+dOw6EfLaZ
	RDhpODYfKGzeqW7JeRdCWDbafaaBJpHy07hJtouniCP+h0q5ciY8h9aJBQ==
X-Gm-Gg: ASbGncuf8ynGSNl/m7TL8rOq+cyfZjlffGPT3880g8Rl7Aa591+R/Tj31skF/niHV+0
	LJdmu2i532ZjJguqoP54JfZYlzUpzQBkQg12IX7NChtBpZStG0HCuREkd613Pb+CFEVjvU5vauA
	6q6jv/hHfRqfyvXfsv2rx1qEWsz8wBIvTC4nWQTO3i1uoSZBjleI3XMo/VV3tSqvu5aAZ8o9Vov
	wMwEgLKdJ/U1DEg6GuKkg4InfKo6DiTXB3GvYjP6unmVnhG3EkObYLVwBffPcHhrHXTBiHi2l0+
	7SKmXXM0bRI0PRokYtvzrEShbElaDyHs91J6r7aLcNxoj/kcvIZhtHlN//6UXUtsb/843ogm7XZ
	gKvhchcsO+e+tMlUIG3c=
X-Google-Smtp-Source: AGHT+IHt1Erj/isqmbZfAA693kZfDE0Vkxt638UAURDHwoIY+U/Q1/NPhj8Gy+Os3u49YK0z4sSdwg==
X-Received: by 2002:a05:620a:2585:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c966862ad7mr71521485a.11.1745602939177;
        Fri, 25 Apr 2025 10:42:19 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958eb331asm241710085a.115.2025.04.25.10.42.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:42:18 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] harfbuzz: remove meson flag work-around
Date: Fri, 25 Apr 2025 13:42:15 -0400
Message-ID: <20250425174215.19853-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215493

The issue is committed and resolved upstream, therefore remove the
work-around of explicitly having to set the meson flag 'cpp_std=c++17' when
using icu >= 75.

https://github.com/harfbuzz/harfbuzz/issues/4671
https://github.com/harfbuzz/harfbuzz/pull/4734

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
index 8945467a001d..2febcbecda31 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
@@ -32,9 +32,6 @@ PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 
 LEAD_SONAME = "libharfbuzz.so"
 
-# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671 is resolved
-EXTRA_OEMESON += "-Dcpp_std=c++17"
-
 do_install:append() {
     # If no tools are installed due to PACKAGECONFIG then this directory might
     # still be installed, so remove it to stop packaging warnings.
-- 
2.44.0.501.g19981daefd7c


