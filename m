Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AA7E7FDCF
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13489.1770113973581797349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SdB9zbkO;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43246af170aso388704f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113971; x=1770718771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF8dHALoC2vtaipqQDqq8YaFVlDF4xvBFhA3WZ1D004=;
        b=SdB9zbkOA4r4baKj8qZ/tSDEyvrVMrh5e/ap4R/bX/FWO6GR3LBY62Lsrmci8X4RKW
         VdAfJjwEPO8D1es2dZFRwoh8iuqKtizuIVdzmaLHoNB2ta/DQNPE3al8aIRZkc/l81T0
         PuMToNnvvTuJz4AKsLFBJ/rF9wqrh2GVIVlxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113971; x=1770718771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NF8dHALoC2vtaipqQDqq8YaFVlDF4xvBFhA3WZ1D004=;
        b=Q5jZIN+m4uVYRR/g8gnJm8dniKaTuhGyJMiDRFTubsBSSK+sqWWhrcXhraLc05wAnX
         Ft4aohOKyxgGk5M0Y7DfVdOTmRjdo6KPiC99mnD1+YSqodQthBiM5VT4fNq1hNFclnxM
         icx0v4sXYobvV0j4hFsAXCKuEDH0epW0cPwcBVVOLJ5URgUMzjTAoZiL4g59fFxdWQLO
         lj24scPAnO08ksRu9YRj3xu83J6IRYORs9PzibywfAqbswSjfLbceeT/TaafFXhBfgSD
         DI3xrBmcZ2qTKAJqqIwCS2GpsChXoYP2S+vmwZTmcIR42w83X+LGP9gI9MrH+0pXHbxP
         QUCQ==
X-Gm-Message-State: AOJu0YzELvLpyi8OcWUzOK+y7ft6iT3q28Aj8L8j1e9XkQV40tZIiYYP
	b0MoZa1dqGt6AROq2vH7hfoN4vRTqn7+O7Av6k4uP79U72qXn7shgJb4181z5V2OwuGKpgrv1II
	sU1tNRTA=
X-Gm-Gg: AZuq6aJ8GGu5kGGWxNmbBKrVwOuluuq2+mJjG7WbnFnwG/pUql1BcxLep3FgIOl4p8r
	6v1Ggwya/cO7fJ0VknH3tulYk74/XIQuyXHh0VZyGNsHkpNBaAU1x/7OrtuU/WQ4GSqdcEyFOjW
	TdWXGa+G+Nkj3Io9rx6xB+Wfo7qiaWvKBR5b15Lxs/wRNrg/tNCn0koBk0Ut8JVg1108q0+jpUb
	j1ZEay/6xrMM2u8IWXWdNGE3eVqtARMoHsBqSsBdlV25heoAJdGci+VL6UFDPRCWfLDzbZTDz91
	2wGBiLrOwVB7j3pvJmc/qf85jeTMrRaZfE+VzkbuOxf9ajNbccbI1uIioPmJecuqz8vsHswwO/m
	maeetXKXk76Zd0MLnAApk3uN+D5yCHLHG0HP7gx5PhPbwVT5mT4AfRpyizf0Nbpfuu9mXKvfCHb
	7DQGq44aXgHMB9qk+Me7go91wgpPMMe51c+RUgCQLkoHBLJCjGrLb7t37d3GXAg3a7qltbhL6i6
	o+E8JmvJSmQsScPW3uoFPTGwA==
X-Received: by 2002:a05:6000:2089:b0:435:bdc2:461 with SMTP id ffacd0b85a97d-436114476b8mr3762623f8f.21.1770113971561;
        Tue, 03 Feb 2026 02:19:31 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 14/22] libtheora: set CVE_PRODUCT
Date: Tue,  3 Feb 2026 11:16:43 +0100
Message-ID: <39b1422652ff940e3ec457d605ba83830d880793.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230442

From: Ken Kurematsu <k.kurematsu@nskint.co.jp>

In the NVD database, the product name of libtheora is theora.
This was set to ensure that cve-check works correctly.

Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8ddda60332e2a3219e905c1545b5da917f855c6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
index 04de8507fb1..bacaf3aee66 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe
 
 UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
 
+CVE_PRODUCT = "theora"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples --disable-doc"

