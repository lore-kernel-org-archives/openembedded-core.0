Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAECAC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.30322.1683300029219178751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0F+eIJHW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-64359d9c531so1484187b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300028; x=1685892028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oZItepweu8ol/2aV25gYfUucXg0AbhJYYZq8d+7Z10=;
        b=0F+eIJHWWyEyxGcPkjrLSjrtBvtUY8QOZPLMD65m3rZijNL1E9jDEMfgmixBnD3qEg
         8vSmYLkLbDZdFO/N8+3H+sp0SEK11W0sBoH/F/NoctmjSPLOzS9gt3ksvNsvF7sNcbEC
         UUXcgUhsaUBgMD6ovc4SmvzJbBXSztjqUWLspppQTWIzeotodKDS6+IOklH4jxL7rLBD
         0XXsYTSKMnHy+FV5ERsIyzDTQ/U32SK3fE+bNV+mHobvYhHa3LPBzEMcO8kqEIFyVsjl
         dVU1yYeptm4WEbKThn3xQeZG4OZOhnwTcdsG5ZDWiFQTsbFFL5atN80qi1fOPzhW8qp7
         lfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300028; x=1685892028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oZItepweu8ol/2aV25gYfUucXg0AbhJYYZq8d+7Z10=;
        b=NOMHZRD4bQcsQzEBZgEupAauZXZobGVMm/41UMF7hyic9eM2QL/tp3/PYkCht31uug
         n49hxyQU9o1ids9Pp91xsZEUn0urGCfNPbM2A3ULiOjvzi1AANXauuLmW2UnI7lA0BPP
         uzMSuJB6fFIIS0tDpvMBiDm54tvioTFtEIIxSA35VJDp9SLGe+h1MxyrfdifUDTMC1YP
         79Tu/B86ZceMSfI1XTV3wUUfYevwZkzpq/piqJkPgh4Q8fs2hl/cqswlD61o1+85N9rN
         Guh1iwS6hfrxnn/1duQuLW/reMZ14siLz+/Jpq8m7euynLgbrk/wgiEetd/OItdy5hmu
         P1fw==
X-Gm-Message-State: AC+VfDzf8CBn+pGJkmNUX51cT/jwFfsIZ5737Rsv6+7GH4DNVlTjT5Zc
	OT7p9hT2WYeexEEgpLvfeRzQjgW0ZBaxP45E2As=
X-Google-Smtp-Source: ACHHUZ57v2xOcWGbHPtZ7rsWARwnvlLEM8SoP1ZP2BjHvHkRiF/+o7VZ0PaCyu3A94FnKUlUb60YSg==
X-Received: by 2002:a05:6a00:1503:b0:643:96e:666b with SMTP id q3-20020a056a00150300b00643096e666bmr2517747pfu.34.1683300028109;
        Fri, 05 May 2023 08:20:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/35] pango: upgrade 1.50.13 -> 1.50.14
Date: Fri,  5 May 2023 05:19:26 -1000
Message-Id: <3c8dd786aa685606222ce86b3e17936291110f45.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180935

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix underline thickness in scaled contexts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f34ee7f08bdf94297042969b114da38b71168c5b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pango/{pango_1.50.13.bb => pango_1.50.14.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.13.bb => pango_1.50.14.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.13.bb b/meta/recipes-graphics/pango/pango_1.50.14.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.13.bb
rename to meta/recipes-graphics/pango/pango_1.50.14.bb
index e673366dc7..ec7a913009 100644
--- a/meta/recipes-graphics/pango/pango_1.50.13.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.14.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "5cdcf6d761d26a3eb9412b6cb069b32bd1d9b07abf116321167d94c2189299fd"
+SRC_URI[archive.sha256sum] = "1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


