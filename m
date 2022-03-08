Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221B0C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:38 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.6474.1646731957475613796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cwzdzr95;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id qx21so37770218ejb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o9+FZWwXeLfY6BqXulMqoGuYmGPZG6yPGMp+8iBJfnw=;
        b=cwzdzr95sy26Lf+JnDc3PLWnkoFEqBcQMu8g2E1+S5vG0mkzvFoJ4+b/3L9DcVgq0a
         d0YPPTKx6kMWrKcWa+fz5dxRWLSfak8lCXb34596yiZbo0DoQZzBdaRuX2B/B2REFvcw
         jU7JLSZhueFvFceUhVO3e3LGalm7oQxUOONN1flJA543lOP00YV1Wkm6Jkz0/tHF8LB4
         Don8VOgZm33qIEKhAfNCU1aJtZXekeZY5VzuHcgty0LYszwiOHarXw8ydPV34SxwKIxd
         uUHL2F3LqntxX+Q5pidezs+qCxuUU/4CP2SjzYU42BkCJ+LSMr1GFD6P/CV9u5lCZQqZ
         0UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o9+FZWwXeLfY6BqXulMqoGuYmGPZG6yPGMp+8iBJfnw=;
        b=EnOn+q4+6FPLbHiaWtnqZTKVK5jnLQZWdxNVzuhTsK4GUjfmll/QWUJ/I7r1EUALK+
         esXQbTQqtenUOYTniQo9UTcw934M2w32MWPrUvS8WeaObRcjEib9GyB0XT8lvOBkbKUp
         F5IX3BbpEtbXS3hQmXksgrLLnvwQy6b6fqy9EzoAUE4dNOuHyoSK+3HiZWOTMlgYino3
         QDlyRqmTh2ps4J2vDFsGUAe/xpNzsbT9vmiincc4q/SNUCvU1iZhCkE3wdEMsR4r0S2y
         6rrhYIIxUc4AC5oAdwRJ5TTU6f0yWg63cTQS2g9jUjzt6LUHx3VoY6qJ48ZEBgD1z/O2
         59vw==
X-Gm-Message-State: AOAM532nevl0qHhLz9kVJ6TQAGdRouJTTfF2+oz49M8DSS001+JpfRdT
	YTYWccdwFXA4+2O+tlVs1hOdtjhIA4M=
X-Google-Smtp-Source: 
 ABdhPJyynAFHRD8NnYwrd+XlU9mVYNtgMPC6E5iP1GESncICyFAyf/TNN+PjvM/EJnqtGJXvgRZPwQ==
X-Received: by 2002:a17:907:6da3:b0:6d9:4405:1a37 with SMTP id
 sb35-20020a1709076da300b006d944051a37mr12451318ejc.548.1646731956012;
        Tue, 08 Mar 2022 01:32:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/16] harfbuzz: upgrade 3.4.0 -> 4.0.0
Date: Tue,  8 Mar 2022 10:32:19 +0100
Message-Id: <20220308093224.3436483-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162888

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_3.4.0.bb => harfbuzz_4.0.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_3.4.0.bb => harfbuzz_4.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb
index e392aa3b33..39146ade66 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7158a87c4db82521fc506711f0c8864115f0292d95f7136c8812c11811cdf952"
+SRC_URI[sha256sum] = "ab61d4e3fc0c30072e98b46aa7727fc3eed36a85d2b6b9274cec7eaadea97cb7"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.30.2


