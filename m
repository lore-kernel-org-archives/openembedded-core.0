Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE25C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:24 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.1831.1645557443422584085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lpeutk8R;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id i6so13049716pfc.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RtcFMuPclQ4DUz920xLyzHC54n4w5lFOmmvPeqnMHeE=;
        b=lpeutk8RyfhSRizN6Rlt3YeOwMGEvdMab5fEESZckTVc3EDjKHtXeuL9U0wagvh9Wr
         TKF0MXBOegi/uk0kCbOj+crjjKCffOseZl8VJ/k3S6/JQngo4OlkNslgvc7dzfnC7AcH
         RYL7cEYpP10pzjQYYD2lOIg4GjmHQ0Lqg1Gi6v/03j1YU6hhYXkf4irEUX94SuqRcjjX
         xqhssq+6cl3XsmvVedB3F3xd3pEHr81YnOt3tcyQ+NBkq4+0I66XKhNOoeqe3OXPqmnJ
         lZvIbCuJWMAB9IqAj+ztlpCXQOEx1subEafD/JIjkfLEh/sq2zAEIaNqAV1+K/HjDgJi
         XAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtcFMuPclQ4DUz920xLyzHC54n4w5lFOmmvPeqnMHeE=;
        b=pLFQd5+3EBkvAyQdL9nlUBRKiYoqqTyE13y+fzRyd5mL/fuiRpmDAEyF0lttnwO5n0
         C/lkJAjBcUf0TD4Wm34p2soCGml8DNufrTgcJ61gR9GCeANnLK7nkaQFcgQNuG67Y977
         XC07uMmgjVnkgUDd4dYnKty+uxC4QXHdOStJf+YqAZfDRqQ9maoPc796UNi6fH+zuLva
         0Dfo5kKSCrUpILe8WSH7jB1ELmuUxSGOMwdZ9jitbyNBrkG7qx4ou9+VUlKpj/mwy39C
         vgx4iTzi3WG0H3ZAG0+uWblQ2HeCsy2cKd6+H66dlw2rRcrKETngneCibp0ng58I4W9V
         95pg==
X-Gm-Message-State: AOAM5334A15UcZl7nYryJzuWIZA4cNZny3A2uGTWiu5cZUwDqacDHgWM
	oYa6sgfwjlThNKqLVqHQ9Jc4MmhXSWusGQ==
X-Google-Smtp-Source: 
 ABdhPJy7ecBV55de9eZUEyqOmRZgaRAHSlDGZwqs+pJYNIkf35h8BVAzmtr0Gfnxrrk4JbMIaRlDhA==
X-Received: by 2002:a63:3e03:0:b0:373:a8ba:c962 with SMTP id
 l3-20020a633e03000000b00373a8bac962mr20360014pga.420.1645557442561;
        Tue, 22 Feb 2022 11:17:22 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 12/32] python3-zipp: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:38 -0800
Message-Id: 
 <ea38d3aea9a8ac036be0afa1497a4fa63d890f42.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162203

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-zipp_3.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
index 9ce987c8702..d0f936faf7c 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebce
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 DEPENDS += "${PYTHON_PN}-toml-native"
 
-- 
2.30.2


