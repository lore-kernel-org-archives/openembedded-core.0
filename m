Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3894EC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.51383.1658306706167762581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hEnqGVXH;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id t3so22904293edd.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XFEBkEAJoZu93O1msV/pbbxq0zfqlUXlmCWzKDMmpMU=;
        b=hEnqGVXHgxISwGDI9KWfhynzMZQ8r3MzQL/rv+aj0DAur40b7h6ZwySs+3jLFZPOES
         lkcFLXK9c9NYVHYdcuqVcpK32vOhX3Irn7o6vvq9HM8SvYYlg+uu2nRZZaCo0MxO9HIl
         inOCydSAvC+10EGaD2SKyChSTKtlQweC0/e9digN/TwckcrIxj5MC+Yd1R41IZAN27Ds
         Mly1oje+7O0YnGJxsM5Kvn8kD2bQ1EKKQEMtMwOPSQD5cKF7wZXsxPqHEh2h2yXHXOF3
         a7m46A79kz6Uu2oWx3bY1qiz0jtlf2ytRgP7t/1uD3DfQPBdbSBuYWdjpFAL0mr6vhwc
         sCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFEBkEAJoZu93O1msV/pbbxq0zfqlUXlmCWzKDMmpMU=;
        b=Jfm0iggwoSEilVy1rdHRMdwh90Q8WU0pJMbZ94dO+m/N5oaOraOL6akdoze5XvFAfg
         qEEISZT/mT+qNKa+6KrO4ClYwQGvfGIvvRK0NrWzMK2jILPsDRuJRwAZsf1vkO7aY4Rz
         dYXjlNyKsSWHSabRs+dASOa/JiObAgcEdBPe8TC0e+6lQFa0dMnfeW+A6vnqXvIUwaiP
         7Nwz7PHXMgBNwXyem3YRjuWXiE8ZjQ81yvgh26PKzJ9mqJiIz0r9jNUiypHt3k6DoDqe
         CS9sNQan+XD/XlP5DfSB4ahDyVI30CplAy/o+PvCpH2I0gBFdksIN6u4TL8fon1LhnoU
         RlMw==
X-Gm-Message-State: AJIora9TqFaVnmGcwIvRm1E6vqM34hs/mXmypL3uY5SNUogeoiH7EwGM
	vU2mH3VMXTHyli46AI74CKq7xAjDojE=
X-Google-Smtp-Source: 
 AGRyM1tufJDgnT/makOOCE/F18YOC/6DgMvVJDGrhMu+4a25m3NtXNsffKf/I+cNhPszQHxnZh3Z4Q==
X-Received: by 2002:a05:6402:4488:b0:43a:7b6e:4b04 with SMTP id
 er8-20020a056402448800b0043a7b6e4b04mr48940630edb.202.1658306724397;
        Wed, 20 Jul 2022 01:45:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/51] meson: upgrade 0.62.2 -> 0.63.0
Date: Wed, 20 Jul 2022 10:44:26 +0200
Message-Id: <20220720084442.2940187-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168329

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/meson/{meson_0.62.2.bb => meson_0.63.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.62.2.bb => meson_0.63.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.62.2.bb b/meta/recipes-devtools/meson/meson_0.63.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.62.2.bb
rename to meta/recipes-devtools/meson/meson_0.63.0.bb
index acfc64fd4f..42e64e351f 100644
--- a/meta/recipes-devtools/meson/meson_0.62.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "a7669e4c4110b06b743d57cc5d6432591a6677ef2402139fe4f3d42ac13380b0"
+SRC_URI[sha256sum] = "3b51d451744c2bc71838524ec8d96cd4f8c4793d5b8d5d0d0a9c8a4f7c94cd6f"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.30.2


