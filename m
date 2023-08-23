Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0F3EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.13116.1692801454373270973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=IKJ0oj91;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bda9207132so45368005ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801453; x=1693406253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3x9pNEH20euNozNpIGWt28Mppxb3iTaaiBQ1K1SEqs=;
        b=IKJ0oj91A6lMtfgHVh57urAAPLVB2a5igmOcDLfxTYwI7qERFZbI9hRS9kPKMxDEoJ
         O2xsAUwOW03i4T95lmH6TjAHNItvkAfYKJR4m1vv8rIp//nA/PTiDPq3P8eLy3T9Wogb
         Psxfv4Vbo9eNF2JbcugJATbNGZv2j6MwIFocQXCove+dPLWIoEeT6Lgd9mWpl1g8tYXn
         zfa064oye6cJbx8UAx2axwlvBCiQn4dXvD77PBUrIEclqh+v5XGnQSZwqIgmoCbFbUWg
         JSH/zw1GDBCGYBTSeQoBAyKf59KyEdUQohtbnXVsPRXmzEck9tt0ME+82y9RR98YqgZp
         VuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801453; x=1693406253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3x9pNEH20euNozNpIGWt28Mppxb3iTaaiBQ1K1SEqs=;
        b=LShfMRPyacYKkSZ/OtzYi1gbIwJiECjDq8QwbU53HK0B+/8ENZ6kQsiC4dc19/m6Iz
         bMsXDT2A3OcZYlmvMZooH7sHzzHHFjVegjyhkRpUM4zn2OeRMy++0y00/Yh4P/PtU7b3
         wb5tT0BW0HaQAbJm/v0GV0uZFFxZzua2sPY+hgJUXKSzoTV8vnb1fifzoHknxhLRj4Ak
         8k26IpRU1+dwjvHBrXQ7boLasQPw7xdZ2F93a5QuHB6n72pz/VyWF842XcLnkBHzSKwv
         erhTXr/TIfr6RboZRYAgkgJHc18IUVpyHg7FUTmZg8NliF9watjCIWvX31ryOibORgQX
         TpQQ==
X-Gm-Message-State: AOJu0Ywf1pVIzw/8m7XuEte17Sbvg7xejb/q3J7UWDqqF7G1HpNhytMN
	RRisl4d+yWOCMLz3EKv4iKhPmX8TQNLCDm5iu/A=
X-Google-Smtp-Source: AGHT+IEE098zDYUvSqIqvfdfHT/mT5abBIfL86kBvpWcIeTIIn+rw7dEDxU75Ia5/bHUC9Z3h2RgxQ==
X-Received: by 2002:a17:902:ea04:b0:1ab:11c8:777a with SMTP id s4-20020a170902ea0400b001ab11c8777amr15646252plg.13.1692801453446;
        Wed, 23 Aug 2023 07:37:33 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 36/36] glibc-locale: use stricter matching for metapackages' runtime dependencies
Date: Wed, 23 Aug 2023 04:36:06 -1000
Message-Id: <ea920e3c8075f3a1b79039341f8c889f6197a07f.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186617

From: Alexander Kanavin <alex.kanavin@gmail.com>

This resolves two issues:

1. metapackages were depending on themselves (except -binaries which wouldn't match against 'glibc-binary').

2. for the nativesdk variant, due to a non-empty dependency list at parsing time caused by
issue 1, map_depends_variable() from meta/lib/oe/classextend.py was forcibly setting PACKAGES
to the initial parse-time value (e.g. missing the dynamically created packages). This meant that
three out of four nativesdk- metapackages were entireyly missing the dependencies on the
respective dynamic package sets.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a90fd3afe9184aa1870b34a826e3ba0563477d4b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 7f70b3ca4f..69b29c836c 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -37,22 +37,22 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
 # Create a glibc-binaries package
 ALLOW_EMPTY:${BPN}-binaries = "1"
 PACKAGES += "${BPN}-binaries"
-RRECOMMENDS:${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-binary") != -1])}"
+RRECOMMENDS:${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-binary-") != -1])}"
 
 # Create a glibc-charmaps package
 ALLOW_EMPTY:${BPN}-charmaps = "1"
 PACKAGES += "${BPN}-charmaps"
-RRECOMMENDS:${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-charmap") != -1])}"
+RRECOMMENDS:${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-charmap-") != -1])}"
 
 # Create a glibc-gconvs package
 ALLOW_EMPTY:${BPN}-gconvs = "1"
 PACKAGES += "${BPN}-gconvs"
-RRECOMMENDS:${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-gconv") != -1])}"
+RRECOMMENDS:${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-gconv-") != -1])}"
 
 # Create a glibc-localedatas package
 ALLOW_EMPTY:${BPN}-localedatas = "1"
 PACKAGES += "${BPN}-localedatas"
-RRECOMMENDS:${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-localedata") != -1])}"
+RRECOMMENDS:${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-localedata-") != -1])}"
 
 DESCRIPTION:localedef = "glibc: compile locale definition files"
 
-- 
2.34.1


