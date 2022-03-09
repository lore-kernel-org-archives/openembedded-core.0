Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1426C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 01:18:47 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.710.1646788727317353687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 17:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kfi2Y+LO;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id c11so620590pgu.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 17:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nMhZJ8WpJFIqcMCH9OHCc+OrlCFQ1mdc/AB7xxhZMHY=;
        b=Kfi2Y+LO9+jQ+v55sqvwgbqLeRzooEF5eVAFfIi6Fo+9Ase8RqOa+UjgGB9jmVMJye
         idjqYj3/iNxfs/oqKKhwoJjTi7oETtNJsXCrda/ncP0IRXiMQOrl/3TstsfYmt0h4r8X
         ZHrKHsQ1e2t0lbKuqUX8rH0Nax8Krn4nNQFHySCyPfBp064md/f2lSfpC5nO39gR4F09
         hxcC0v8jnxRLnLfm+0Cp4nrd/xsrAxe5tHe1EGdUuKeW5PuqiT14UPw43sedr4j/Rg/3
         Oylim4NKAbtn6d6UssyjKtlLlwT6fGY/uDdVwIBdMXdCLFcTBUdJugx7CcgEhcR/Dgxv
         EBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nMhZJ8WpJFIqcMCH9OHCc+OrlCFQ1mdc/AB7xxhZMHY=;
        b=y9hIEl5hi1jK8Fk+tUKY88WGjVaKO53ZU2ZNTEKEQ0ag8bVR8pUUdVFtNGJx5yS+sN
         2PwYoYjo6cb/AdftKH2xisxyhFgLpZ7/EF6IH3enuC+GGDr+9KZO1N2i6P+Icc+Mv/Ft
         2oqxbB/5WlmdK6XDE6fs/Nt4dMlnzZxkwGcRqTeWbRZwTY3YpzWg276RdD13l3VA20cG
         7/3kHA+j9s24jrHx7j9/iOdlJ+JxYYCH/Yb/VPY1Tts+xzoD0BYvmVPXvPdyHdo8UnQa
         lrLNRG0Q8Nn6dT72C9SqZ03+4/km0q/FbDJbVl71p9bFPbhcEU4DS65mz/L8hyf00NQA
         bvKA==
X-Gm-Message-State: AOAM533TL3Z77JlNQbbKDkT2xKKqB99J62sFE2PxArMKXbymsgAqca61
	FouZzkEp+Du0jAqVvKpzMVOghaRLEWregg==
X-Google-Smtp-Source: 
 ABdhPJxLenWHxQ+s9GX2oJ3fANtvNqmgEIQMkcrRjAODkiVIZ/4ihP4tW32qXGASsE4AxliLD8YyZQ==
X-Received: by 2002:a63:84c2:0:b0:380:5d6f:6b97 with SMTP id
 k185-20020a6384c2000000b003805d6f6b97mr9564701pgd.73.1646788726534;
        Tue, 08 Mar 2022 17:18:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a63e00b000000b0037341d979b8sm309494pgh.94.2022.03.08.17.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 17:18:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Fix build when x11 is not in distro features
Date: Tue,  8 Mar 2022 17:18:30 -0800
Message-Id: <20220309011830.3130440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 01:18:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162946

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
index 062ed32b015..c7eef0a9d5e 100644
--- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
@@ -6,6 +6,8 @@ DEPENDS = "glib-2.0 zlib pixman bison-native ninja-native meson-native"
 
 DEPENDS:append:libc-musl = " libucontext"
 
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
+
 RDEPENDS:${PN}:class-target += "bash"
 
 EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.35.1


