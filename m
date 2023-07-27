Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79624C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.8984.1690468598047045405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Y4bg/izJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-992dcae74e0so135674366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468596; x=1691073396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bq4/7fQf8am0gdRis6DN0ixH29loRuIkTx6ppm+xnA=;
        b=Y4bg/izJWlSQRt8/84PkJXXIWbgYEzneed+0oYWUv47pWPP6Vo7OiwfFupJqoc+c2Q
         EyXFo9dwo5kphcBNwYwwXmV2UAiKL0Dyh+Zv/qnc4xMpveQ5BEGTYtheMr72ivRHm7+l
         F6MSSDt8cWQnH1D3yurdaSmiQW6dB3uXObWoQ0j6Qc4Lx1CRWee649CW/XMbjLxzggt9
         TMeclVxUmpZ+JGFnIM1taOgZW1u0inYXWspL0AFkrz0K0cqGp4hZCphsCEOvSp2b0VH6
         hNMToOfEHp2NAEmc2/pwRSLDdmQfUlQYJzt/f+Gr/iNRlakojk+xO/FPtmn3eB3Grlfw
         Lzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468596; x=1691073396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bq4/7fQf8am0gdRis6DN0ixH29loRuIkTx6ppm+xnA=;
        b=TbbF3w8wxpdXAnAh1pDqNL5BxUqlXAjX5DPXCZSSHVOXjxBfT3ifjpy6vsBEgepMfP
         tXhPsZK1GZysb0MyMg4x1DKCZsh7v02mJ25NB/kMirivYC1ZxjZqcDFfhLblloKDqn6v
         duqMWfLmdeZy0kh8sbkpMoGxEN9bB+AYxYm6EM7+NF+JJM7jUc0gwMS2GVP/YH5RG8Bk
         A8CgI+qnH6a3sqD342PVUhJqJKKBD8g6UQxsgEiWcWVOzIaP2+RXUcPBR5AN+jAH3e1C
         gE7bkHByQzd+b+ny9zhQpdCKl5oY0o9zN/89B6h5tWU38KgFjCWO8IeN15/Vg1lOyC97
         X9fg==
X-Gm-Message-State: ABy/qLZYwJ2bqhoyCvwLsv4dUq0RQEwz0WFmFmyX4r3xyEKYyVQLvlLt
	tw/HxBHOUAS6XjbbYWgnXc6jRejVTdk=
X-Google-Smtp-Source: APBJJlFGtbePG0H5yVfdnXj7FuV/kCOigEbk9BK4U61T+6TA13pF1o9nfokGwD6OjIlC1zAkv0kgHQ==
X-Received: by 2002:a17:906:7a16:b0:99b:4378:a5aa with SMTP id d22-20020a1709067a1600b0099b4378a5aamr2417595ejo.49.1690468596244;
        Thu, 27 Jul 2023 07:36:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/21] systemd: upgrade 253.3 -> 253.7
Date: Thu, 27 Jul 2023 16:36:17 +0200
Message-Id: <20230727143627.3718496-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184950

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemd/{systemd-boot_253.3.bb => systemd-boot_253.7.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_253.3.bb => systemd_253.7.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_253.3.bb => systemd-boot_253.7.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_253.3.bb => systemd_253.7.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_253.3.bb b/meta/recipes-core/systemd/systemd-boot_253.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_253.3.bb
rename to meta/recipes-core/systemd/systemd-boot_253.7.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index d50f2c9cba6..c2f2899044f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "ed18c2ab79e8b94182d5dcf31d58457763f3e3e1"
+SRCREV = "f1c4da0414640cf201147144f558e1af31a3ae80"
 SRCBRANCH = "v253-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_253.3.bb
rename to meta/recipes-core/systemd/systemd_253.7.bb
-- 
2.30.2


