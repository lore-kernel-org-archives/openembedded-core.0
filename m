Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711D2C3601A
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:40 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.78.1743546994416551096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=umlSgxDv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd89d036so130470975ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546993; x=1744151793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eo9L4GF8lqmrNqYjmxWXDxu2xOwDsIMzANK24VsYk/0=;
        b=umlSgxDvGm8NusABpn0AevNieh3su5Zym+LyO5TgsTR0weNMGRB8xmYWEDHxJ6UCf/
         365ILMXonvtQ4/arERXjAVFDeXZzCt7VJjG1ZQXXKrHK7uinuw97g7k3dSmdHif8MUSw
         97i5yWf2WxBsKYxg5MwQmmc3gotZwFZ4dqZqDqI45Si/o5ib377SBTLKu4yDajPnXaOb
         R2TmlBW6RBoi2sgBJbgeC/0URgYzzQZzwr1alLS0zMYHWqfGQskRm2WFAiW+9Vcb6GHN
         czmdTaJUNgqRkGAGdr0CvkTk00b7PO8sX6yqs82WdkvYCODroaAsxzOiTWwMPDWNbmdQ
         LRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546993; x=1744151793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo9L4GF8lqmrNqYjmxWXDxu2xOwDsIMzANK24VsYk/0=;
        b=G190A8aAygrXiA+PfZj3fM5/uZgCsWB6NVbtSb571AzfH5wJugetk+3gFkJkETZ3IR
         dKpU02AbHNrlD7WpmRLW3BzXYW/MdAR90RvZDTyeWBIppiTkQEAIGhvOW7/xzr1k432L
         G5Cqe1fOSqtKdzTiC/3WPD3XECSaJmBBLjZVj7KONWbSbx5+8luAuD+EtgBdHU3mYWi8
         G/WVDm2iqaVJHuc9u2TFlUr3RPzOMZfYNUYPHcasEP16gtOa+7DqaKbSkY6jXA3RvoWj
         tgNEjbyxtM7vnBZhhIGfFSyBmZ67c3JEn3cSy+HVQOLUhvR3WWG41j+WfQjudAgi++6W
         roHg==
X-Gm-Message-State: AOJu0YzYerV0w8x9/y4u6rE7NCJ5m0eiewxQqdTFwSO572DAZm103b6I
	CJVFs66Ptr0sT4FlbvHbFg8+8Z60eDmSwgL+nVENP9WT9rql1q1wyghzOwRuAERI/dLYuN1gdY9
	d
X-Gm-Gg: ASbGncu8zAVkYqrTabwM1ABJC4DkLKVpRX6Et3e01wdxgY5VtbAzu4ytSnfNilg/0IO
	FFbMZa2O9LZ0/qnapq3a0XrHBQZiToDD2dFrK/jprBXUPO4rm/mWXTwL7kqG7EIbtBTbqLxDgP7
	GIhXgrB79qewRU91gJmUQXVKpwqLBGhbPKkGg0Ikq9QZW9yyZM5pfsYd17SsFdt3P1CUlxUXuEU
	Zu9v6BdD3VsTsNNQDESLc5UTnv//+NbLcSrkl1PgEjE8kZbyY+zGS7ZgOZemVrewv3ITPR6IGly
	NClIBUecGu9CPDA2MCm79k8vO6ZCEuHSXV8LCLhwtnIfENY=
X-Google-Smtp-Source: AGHT+IGPZjTU8wsfk/tUQHd7TLvTIAE69d7vDRi8fkaFVTQ1DgR7PPxi2DJw4SCmljxla6l9X4n0HQ==
X-Received: by 2002:a05:6a00:b8d:b0:736:4bd3:ffab with SMTP id d2e1a72fcca58-73980416030mr15637152b3a.17.1743546993471;
        Tue, 01 Apr 2025 15:36:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] mesa: Update SRC_URI
Date: Tue,  1 Apr 2025 15:36:14 -0700
Message-ID: <6397cd1ad55927c312051cbd42d5825fa8ed969b.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214159

From: Guocai He <guocai.he.cn@windriver.com>

Update SRC_URI for mesa.
The the tarball of mesa has been changed
from:
https://mesa.freedesktop.org/archive/
to:
https://archive.mesa3d.org/

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
index 01e5b35d0e..11ecb9a9eb 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/demos/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.bz2 \
            file://0001-mesa-demos-Add-missing-data-files.patch \
            file://0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch \
            file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3c85a3ac55..16d3e108a4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58
 
 PE = "2"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+SRC_URI = "https://archive.mesa3d.org/older-versions/22.x/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-- 
2.43.0


