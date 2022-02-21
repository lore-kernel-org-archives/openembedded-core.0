Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F631C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:34 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.4750.1645478673263865281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FEOZSyHa;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s16so15294164pgs.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bIWn95NH7ZZ5EAPah4d73bWVjBR5j0CeQlwbjz5AVy8=;
        b=FEOZSyHaiOCtkTSsuBjqMgoFbbsiIaCne8fOnDczG6eQb9HHooXCvaBKkHyvCuA5cj
         qhVidrVwwj147j9K2HRcm6Ucm7dZxhPJVoObuc82Z7eLEOkNrrBo/ynnyvy+pMtPXJlO
         XY4lNKGPXdZyZ8nZFUzPIT16Upwt7+8RsFPaHMJS6Uxt3AKxPzAoQiu750ZYyzAW/Dwr
         3cquNeTjt5OafEqgq8z2e+bFNP9lMq7hRs3U1x+hq78mh0rbkvJfRxbabhWawl9/G3Em
         qLrFsBwfM3QYBOEAUabxSYSHJsDaKpBOCZIQXutz3EUm5l3t0pOQqBldL2drL081SraF
         e83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bIWn95NH7ZZ5EAPah4d73bWVjBR5j0CeQlwbjz5AVy8=;
        b=JX6Lp63ewprvtc3jxrX3KX9wCgGJUem/3egOsOozkfAYS1s0otI/+QUWcyDtVZOjtz
         5gAJPwtoGJd7DaXljb/CTku/lqGq1NeytWKzjsobs2KY5f59WDidRCOGiIr82wW5Unf+
         OAm31LGOVSwkvxETSgmLUXSOQ7UBaRDahUe1cQdx+IdiT9zXJQJCDvItlBLqTOF84PrW
         N/Yy/snHY4kbzezwm1w4b/w4rxqykYio+NbyWkkf8rDrGxzyX15cKH3dFdBF6AatOtbh
         hRQ/F4AnXXsQJm9H77h/CgAbODRUXw9yW6K/Uxj7QtXGlBcZVc9YZbJGnc11Ewk3MUdG
         JBRg==
X-Gm-Message-State: AOAM5322A/zSEvEfvceFLtXf3251yzrmUVux8MpfnPU0V2DLZLuSNkaP
	6j6FgKTN5KVfz7CZhBHo5Gxj5dGx5dij4w==
X-Google-Smtp-Source: 
 ABdhPJyKBi4nbfHbE5RLll7Q9mZFE0Ez2wZv6zWPTJ8Jesl9ARpXNJReD1cxADEGduFnqg3PQrZh0A==
X-Received: by 2002:a63:8649:0:b0:34c:3be:ba14 with SMTP id
 x70-20020a638649000000b0034c03beba14mr17445071pgd.139.1645478672345;
        Mon, 21 Feb 2022 13:24:32 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:31 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 19/32] meson: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:34 -0800
Message-Id: 
 <82c32de14862300d7171690ae2568c7af386be19.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162095

Upstream provides a pyproject.toml which declares setuptools.build_meta
to be backend for PEP-517 packaging.

Set PIP_INSTALL_PACKAGE as this recipe does not inherit pypi and
therefor no PYPI_PACKAGE is defined

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/meson/meson_0.61.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-devtools/meson/meson_0.61.2.bb
index 45938af6ffe..a51db1e3d44 100644
--- a/meta/recipes-devtools/meson/meson_0.61.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.2.bb
@@ -21,7 +21,9 @@ SRC_URI[sha256sum] = "0233a7f8d959079318f6052b0939c27f68a5de86ba601f25c9ee6869fb
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit setuptools3
+inherit setuptools_build_meta
+
+PIP_INSTALL_PACKAGE = "meson"
 
 RDEPENDS:${PN} = "ninja python3-modules python3-pkg-resources"
 
-- 
2.30.2


