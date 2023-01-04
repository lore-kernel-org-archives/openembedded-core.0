Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C835BC54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9383.1672830373513666754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cELZQ0SS;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id s9so552678wru.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/4oxgl+x44r48/NZKhz2l3mUFAMcEgKL8NaK3YLa20=;
        b=cELZQ0SSwBMN3WzRYh1B4H7Ye75a1f7NRVE4f42h0unLUe6LKXWZwy5yXaEf1x0Iz/
         CclPUy1nb6NIE3sVMbQtf2yqZDGeraEJbLR/iiLfF/Ghq/EzkZxf04qnvo0aizGMW90U
         aC/SNFtQ82koemKF9MDY2X48oepgkGgnGqXVM1A0QCxW2dPxwDaGdrLrt8wcp5+tFhmQ
         x+z/FEMS6MIyfjS6Qq2tzaBkb7FlDTVCeyopyRm6/XiHfHXDs/W5T81x4OsaSidZDgiF
         tFXhDZ2gwITL8f2m8LO7UhXRJShFHxiydHWKZ0db2LAOed+/ZYIYJAZaL1OFGcKblLlu
         uIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/4oxgl+x44r48/NZKhz2l3mUFAMcEgKL8NaK3YLa20=;
        b=nwvo40RFpyA2GLaqTFyTBHLImEll7dculHnkdq7dJyx387FQ+JQdMm2bdFOujxFu9l
         ScqBq3OubUO7Cu0CJ5Vzt1WxAXUrjYPd0/stSsqJqMNcb1SfiaaC5PrdnEA67NntywHn
         6Hq0OI+GIT9c+wU25KapnSD/Y0DVe5aiJCfv6W48tj3vN5gRdkLbYcGIdDhnndH8gScx
         08POM30qwrRmRaIxZByPUS/sDODgLW+pGxURiwViHwZBFcfiXkydj7ddSodstTKRZAN1
         Md9s0hDOJm/zWhDgjP3KtHWgWIsCNsOWoLTOVCdTiis/KCINEIFvScZYA8Jm5go4oQKF
         IY5A==
X-Gm-Message-State: AFqh2krFHPOnIC+aOYW3J8Ot/Cy/VJjVTAtC8iNUA/ei6vG6imRsYCtn
	N6iftJJYq22CX9I5RbbUd41Jw5LPC+U=
X-Google-Smtp-Source: AMrXdXu6PQMgUccDqgygAbdiX/9UTWcA933Xr+TMX4ZOSNpuEDd/nKzdGf4TU/6rEEn3CIZ5GwLbCg==
X-Received: by 2002:adf:dc0f:0:b0:242:4f41:4dae with SMTP id t15-20020adfdc0f000000b002424f414daemr29359153wri.71.1672830372040;
        Wed, 04 Jan 2023 03:06:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/77] meson: upgrade 0.64.0 -> 1.0.0
Date: Wed,  4 Jan 2023 12:04:56 +0100
Message-Id: <20230104110548.2537259-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175410

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/meson/{meson_0.64.0.bb => meson_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.64.0.bb => meson_1.0.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.64.0.bb b/meta/recipes-devtools/meson/meson_1.0.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.64.0.bb
rename to meta/recipes-devtools/meson/meson_1.0.0.bb
index 34a04d52ab..a7740cc6dd 100644
--- a/meta/recipes-devtools/meson/meson_0.64.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.0.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "c5e27e091c2a35b9049e152a6535045ebbd057253aeb67856de6ecbb7b917bab"
+SRC_URI[sha256sum] = "aa50a4ba4557c25e7d48446abfde857957dcdf58385fffbe670ba0e8efacce05"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.30.2


