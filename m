Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3627CD8C8C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6128.1780698858113820525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kUIp8Y3y;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fe59255beso1248582f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698856; x=1781303656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1b/RWT3CX6pFso51GLtSDgLZ131ZkGjJOMO4Ap/vdW4=;
        b=kUIp8Y3yHDpxT5/RMlbfrl3Y5AR9vZzAZuYadIbEyvq9e317txBDlLkR/iZlzmFu2G
         ESMwAk2VSIjsi8pRhoRUwSF2gqEYTOFM20aeCAtWuIrkED9Mm9IGR9y/gYwhnZ8jSyEh
         ABLtn+m9kou69ExyucHRv/eGsAOSzRLUIDf2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698856; x=1781303656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1b/RWT3CX6pFso51GLtSDgLZ131ZkGjJOMO4Ap/vdW4=;
        b=KlqbUDpTanp/3v2kQ88/BgUS4WMQm9HaxHCV/TOl6lMFETf4sOwYeUM2kNRrUtD/la
         ++yTwTt0LJDK3PCJaHhoSzWnPt726NKItX1zymuYALqOs2dBxqTB3eNz7I3/KXQs6G9a
         MzKa7pZjB/PKPnUnwy7beUQwpjW4eX4dIcXosSg/TVNHMecFrWiz8nd7z7P8flNyS5bw
         0JKrOp+i6jaSd+UMlo1ty6Akz7JXWhxCJeP11NYTYX634bfMktbpjS+DnuldukUbjA1r
         q9ayb/U5SVyswW3wdEHALuVjPs6GzPY28b4QLV/iHocGwZpZWhAU+PfR2Y3NEOohtI+P
         NHcw==
X-Gm-Message-State: AOJu0Yzo5Ol1PDo5HdGNpcgy+QwHdPLoJlBUaxknSzSp1wXb5rDKDJ7S
	Emu3d6ZTCfaAFeQ/HNsHlAFKf6GlZVQBoxRC/sz6K9TU+kxIbgmqHR+G67R0JnA0Cgadq5j8R2M
	FrfNX
X-Gm-Gg: Acq92OFSbFz5EZUae9RenrbpBxf3AZk3hL61tY5vNYA8ivW2XiPKg0DH9ndga8VEU+L
	6Y9CYG4DAJm2KE4tgsfhHHx8+GAssUMd5/B4hgVGQVAONLZX2CXLqJfJ4LB10vnZIajreFt18bl
	QkmDIO19FQjwxo21oTt+Sd2Gyw4alD026uLyyOmIyG7X6tBjWVn/6ehY3wLW26qD3LiTHGib7Om
	+WdNtk2aHHrFadZJc07LVnB55kkPIqHBvJoT0een6IvPNMqNedVwtmKnZJckxNUbIKtP7/X73tZ
	w0sSnGcPma1js2kg/s//8EVGbOtl863PaQODMsZkXHM7dWAo1SUiPi9c4w37fumNEDIW8ohOXCJ
	PjD3gt8Xvu7xNong4JDOQ6+92sO9WzDm3VAW+xQC3F0aiDNTHqYzj4rUuh91h48O1YLRipcyLO4
	eKonKBxwbYWx4pTqJZZEs9NWnQOtS1uvzfHGglBXUSrzhfG7TzsQItkDGkkysiTc6uFmQrxnHE4
	X0N8e1BOMeuxTvizEs4Kr0/P0KOMOkDFxpWBYo=
X-Received: by 2002:a05:6000:54f:b0:45e:8547:f21e with SMTP id ffacd0b85a97d-4603063c06amr7849205f8f.36.1780698856430;
        Fri, 05 Jun 2026 15:34:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/25] go.bbclass: disable workspaces
Date: Sat,  6 Jun 2026 00:33:51 +0200
Message-ID: <9538bcefab6881805d60d9f362e0b70996b5e2f9.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238193

From: Peter Bergin <peter@berginkonsult.se>

go has a feature of workspaces [1]. If there is a file called go.work
in your working directory on any of its parent directories that will
be read and used during build. For OE where the builds shall
be sandboxed this is bad as a workspace file outside of the build
environment can be picked up. This commit wil disable that feature
according to the instruction in [1].

This was found and introduced build failures when a file go.work was
in the parent directory outside of OE build directory.

[1] https://go.dev/ref/mod#workspaces

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c52c5e88626968b08510818f09829f2e1c9f94ae)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index 61b08a082f7..36103e8eb0f 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -22,6 +22,7 @@ export GOARCH = "${TARGET_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOHOSTARCH="${BUILD_GOARCH}"
 export GOHOSTOS="${BUILD_GOOS}"
+export GOWORK = "off"
 
 GOARM[export] = "0"
 GOARM:arm:class-target = "${TARGET_GOARM}"

