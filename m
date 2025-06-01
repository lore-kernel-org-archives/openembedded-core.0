Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2A1C5B552
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 00:41:39 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.18352.1748738492623167974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 May 2025 17:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WAigWGSG;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70f94fe1e40so22255977b3.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 May 2025 17:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748738491; x=1749343291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bNZcNzh7+Npa/o3arCFLkUPVNqYR1U2H4okIwundfk=;
        b=WAigWGSGAGQlODoz2k02DE2xhlo8lZKf5GHdzv+kPjngpKeQLznHa7BEfa6XTjkvjb
         VIZcwSsqxHf97UgCw3Pl8hXhwzaBGH0DaCXC+zv4Qi5HnKXCp6qH+n3CHzz2VG4kyL1+
         7rbwea+sMZV6P2tVvef/JcImKxe2d7f730pm59cal9/D1bLlXDqMZfjicNK/LmiGgosS
         26401xcRfWo6m3cbyu1Lcq5DX83s/kR/Sn0jd4L7jcqrt3samn8YlLNAEkgIgD3u0gUy
         b9TGcKCJvMo3O/KG575ZzCI7NLgR2QkHDHFyzBhduuGbVnlaWFZMRXXVevPl8xhphZx3
         Hnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748738491; x=1749343291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bNZcNzh7+Npa/o3arCFLkUPVNqYR1U2H4okIwundfk=;
        b=hruz6DslD8lUGlbQ28YFpIEuUW/aNrnVSuPwxL9JS7dDeG4K+ygEfub95w1CMRB4w6
         4aO0xudduOziIl/EXkeCq4w9RFHPq1QZdSwSx6UjJ6L54IkSIG+2GQkCapXMqhujbUWK
         yMLwP/LFP6iEqC0BpO7WXF9rMw8pA5qxYMcwoe/wmR6fSZrmGJREAVODNRhslCBLzc1N
         TuIPL7IOu/ybio1ThzhDKa7XEmc3De6z9nZcGmhlyG4rO0KK0NoL5uwduwc4BGq9VXRI
         YfSoA8JuydzqIfXm3jxklzGz8TMy+/5GaiE5l9AlMQxWI11BaMPHIWIgG58NhGUeoRon
         bjEw==
X-Gm-Message-State: AOJu0Yxn7xrzw43qLpGOM21BcgROs5KCIfiqdYLQ9Xij215Wx5GF+FKq
	immfX58EYod7VFnYE4CA0PVJEd99tCedMaw9Vk6VzWK4fQ6l4JidajkLBp+hUw14
X-Gm-Gg: ASbGncsHBq8jE2FvZckELNxAI8GwLqKNVF+gKIOODoETIg2r/JHHJbC54GlBhuR06ZC
	qR8TI1Fm6wl0ENmGyQX6BYgLe564dpv/xEymPUcGPH1nJuL0BatOVAi5XeFlOSS1VZYGhG0Jp9R
	0aQnf8Tk0aaCM/tFfkCggtGW2v7aUpxhgNQvbsD+GYsW2XmEMtG64CnTp1uWY0xM/Wcystdzthb
	v4rOkAZFuQltkKIh2RtpvjSSszDdU0Waun/+OTa0PQspxmJFAIxQeLW628zReWLC7QkaovlVF5r
	OJ9/gH1mr+p3hmeD23SnffdChGAK2hFTtoJ/bSxjUObZ+1Geg/kKNJ5QF6sLo8LuVRMJxwZ2ghj
	e7g3qBzxD+A==
X-Google-Smtp-Source: AGHT+IFtYt5VJkPv9PF7jF7EH3stW2ouVXJfPcEkzqHA+afP13UPDtAcrE0FXJF6JKW4+mCg7gwpZQ==
X-Received: by 2002:a05:690c:9b03:b0:70d:f09a:bb4d with SMTP id 00721157ae682-70f97f084b7mr127745117b3.0.1748738491079;
        Sat, 31 May 2025 17:41:31 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8acd52b2sm14734567b3.82.2025.05.31.17.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 17:41:30 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] icu: upgrade 76-1 -> 77-1
Date: Sat, 31 May 2025 20:41:11 -0400
Message-ID: <20250601004111.128872-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 00:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217554

License-Update: Update copyright year of Unicode 3.0 license 2024 -> 2025

Update the HOMEPAGE to reflect where the address actually resolves.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-support/icu/{icu_76-1.bb => icu_77-1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/icu/{icu_76-1.bb => icu_77-1.bb} (94%)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_77-1.bb
similarity index 94%
rename from meta/recipes-support/icu/icu_76-1.bb
rename to meta/recipes-support/icu/icu_77-1.bb
index f11e72d356..90af2cdc27 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
 portable set of C/C++ and Java libraries for Unicode support, software \
 internationalization (I18N) and globalization (G11N), giving applications the \
 same results on all platforms."
-HOMEPAGE = "http://site.icu-project.org/"
+HOMEPAGE = "https://icu.unicode.org/"
 
 LICENSE = "ICU"
 DEPENDS = "icu-native autoconf-archive-native"
@@ -92,7 +92,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=7c364a0debecf16d5a13de2b7f1aaabd"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=cf57d9459a2c5f88ecd83c75207cc5ff"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('-')
@@ -124,8 +124,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "dfacb46bfe4747410472ce3e1144bf28a102feeaa4e3875bac9b4c6cf30f4f3e"
-SRC_URI[data.sha256sum] = "133ae58a67d68b46f7296822904cd3c30126a0b4b2f65f0f905e7f47c0ef9e47"
+SRC_URI[code.sha256sum] = "588e431f77327c39031ffbb8843c0e3bc122c211374485fa87dc5f3faff24061"
+SRC_URI[data.sha256sum] = "1e08bfafa442260ccabf9a872d4eab12de813d42b90769df056bab032b37e1d3"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.43.0


