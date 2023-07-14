Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC37DC3DA41
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.824.1689374016992212222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pMK18Eoi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b9cd6a0051so15729825ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374016; x=1691966016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9rFSq9ddEx3rpQNiLTiDRnZenq6uHOs9qRXvQsZca4=;
        b=pMK18EoicMsAwumVGv8/dBFRyxevZqOwmUB7rXDgsmoBG5ntzIUf7JrdG2YfCenpWh
         seQIPB0ym9O/ftHeum5RyLgnbxE+LUfqyV7YD7UI5y4L1F4TOS5kFOFPzowrr15c4M2H
         61xGnd6ucLdmCmbKUQsi70HtAeTgE1EYM6QGzowB9o+8NYlVe/WHlFPHlLoDE4cXkrkT
         k1iuU0BOXtDgJogA5FQ0XZOExBQB9NB7reCkG5xqwOQoORuxwWzOcaR78dEIcmKdxfeA
         8ULk12odIhglH5e/tJgzPJOO7Q1Lom3Wog7y69fS+mn77RvsC93hJvx0YpPCJ4O2czk8
         l4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374016; x=1691966016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9rFSq9ddEx3rpQNiLTiDRnZenq6uHOs9qRXvQsZca4=;
        b=QDrzxqiGDwSi0FzzHyaz9NwZhwVhFnl7v1A3JDvI4ESJWFG3YPHUudJhj6o3TEWHkF
         ofrA7ZSAydke97q61SBcb90vSTi93fYuCJLjL063edx/qBr89ZUlqhg+uGQY6GOMJUsi
         t4UQgVVukWqmju1xBvozgKhIuWA4JoWm7mTBclt5HN89tTs279A7IEnwW8RwRscNhuf3
         MnrlQnPkLCkOLT8BOM1xVA8WVmnfTn4Zxhr3JFka7RlioakCUZl1odxYH+pidc+OoG8Z
         7tPkyUz/caSNdf7OpZxgcGcyKBa4FucTyDmTP3nuEc597vuHGaFfo0M6ECQ++acszNUp
         f7Ow==
X-Gm-Message-State: ABy/qLbEfAfVptluq1N20wo+y9rBh6VPKM6iu501Ht4qtg/y9fA+mT8D
	aE1td/166FwuzouGBWtLesaWtIlAOvNVFVNbWnI=
X-Google-Smtp-Source: APBJJlEQkPBalL6A2GnEo7kLgwsD3umc9MZ2FDgzGHnuKHuUv26xMdkYxtinC8ywGGexahttKDY4Pw==
X-Received: by 2002:a17:902:7d96:b0:1b9:cca6:551b with SMTP id a22-20020a1709027d9600b001b9cca6551bmr3956113plm.7.1689374015997;
        Fri, 14 Jul 2023 15:33:35 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/26] libproxy: fetch from git
Date: Fri, 14 Jul 2023 12:32:46 -1000
Message-Id: <32b258f5ce261b2576d20e0dac4123fa020642d7.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184294

From: Alexander Kanavin <alex.kanavin@gmail.com>

Upstream no longer provides tarballs for newer versions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e971f27cb4ad78b4df3c3bca2948f3cb60d0d5cf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.18.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.18.bb b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
index 01ba2a6fe9..748b1bd2c0 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.18.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
@@ -12,10 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "69b5856e9ea42c38ac77e6b8c92ffc86a71d341fef74e77bef85f9cc6c47a4b1"
+SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
+SRCREV = "caccaf28e3df6ea612d2d4b39f781c4324019fdb"
+S = "${WORKDIR}/git"
 
-inherit cmake pkgconfig github-releases
+inherit cmake pkgconfig
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)} gnome3"
 PACKAGECONFIG[gnome] = "-DWITH_GNOME=yes,-DWITH_GNOME=no,gconf"
-- 
2.34.1


