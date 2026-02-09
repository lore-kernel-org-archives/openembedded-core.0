Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA65E7E0A1
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44000.1770629382322329500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HEObnEbH;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso35475925e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629380; x=1771234180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyUWkdtgqD4WZiN3KrF5ETnACH9YSeggFOopw8foAfo=;
        b=HEObnEbHwmFK6U4sar2bLzhPr9+DTLP7XZyGUC0jYseFAMv8jqXRl7ldJ1jFa27pdW
         3Ifk9Q+h8OgiM+XFeaIFEYR1w/xWopvVdYfiwt9uydM6F6EwkyWL34xi4mmNmjVgoBr/
         8oMmXo7oraN/TZOdo+X9rfsaYRfFxKGqmF6GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629380; x=1771234180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EyUWkdtgqD4WZiN3KrF5ETnACH9YSeggFOopw8foAfo=;
        b=Org1mdaIIHurEMWN+j/68IQprhhDwU2RrpBH00rN4mqq2yyY/+5K5D6oyLobN/nxxR
         KYDjkyE6DSHo8tMMv41e+JDL8ttkxwiUNW5I0A+lJqW0tatWEUKH4vlyKz8+NibRpSSo
         EoERNQoDZ1dsIXknrBGJiL29lZv/X12b5Zul/jW58miZcb47K31gl9CJ+dYzn3aQbXtl
         O+380ci3cZ3lNmYR80voQmDYxBOeUbTHwPGYETaO3Pga4SldCTLrjNTYd9Fm7+X/m/cv
         OtsleoZrTQwUyI0s7HhbyjAVc0WkT6osmJhx3TpNxwUvWhnhh/GscYSVDX2abNxYPUAj
         62lg==
X-Gm-Message-State: AOJu0YzZe8XFPCVdaZPiu2C7hWv8041zzvDJf6U9pvciti1nis2BBEQu
	8r5zTB5rwF8l2eorSJJ4BnZwGVUe+/I5/IgrqGAvFJo2vdUoPIcTHsTHmvHOXIf20b+PcFvYuTN
	VrEcML1U=
X-Gm-Gg: AZuq6aIi8KyNAn22zDQQimOSkElt/dc58hFn/0l8WSu2P6od2FKLX+gV/EcvDB63wGU
	WYebMthwPt/SdiI1qx47280NYttHmxiy0dLYa1j9P5HZb41KoHAfusca46Zh4SC5SjqZwWJOck7
	ImS4kq2DadqZG1P8cKgtWafWlIElhemkJ/1a7H+fmUWgLaVsn6P5XtMXEW8tWLAqiOp2GJxGOXY
	sPYokkH5I5dAERqyC6gZUbt6hfoeoKGBZp2T2erTRV4iNYiw91zyapp5yy1Z/jp5gb5JElwnhta
	sLnPUK4s7EXDWYYLl/evPT7/lu0Ifir+Acul9FEa4Zgdha8HOegV9h5BvZ/wJhs2tMc9EhTdJ/U
	55B3c0BiAGgKIocY4XO8/QHYyKFXSoxqINN1NUm/nTP5MGTkbdyisuxijukU5M2exr7h6RBcPFm
	r3iSFx90IOkIhOE1+OFsRuiWm56MPE9csIO7XOMpr8vxjZJmrsT9P0gmcIOQDtRZsfRmyAOA8gF
	V/Lf/3GyMSy3CE=
X-Received: by 2002:a05:600c:4e48:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-483201e408dmr134244025e9.11.1770629380321;
        Mon, 09 Feb 2026 01:29:40 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/25] libtheora: set CVE_PRODUCT
Date: Mon,  9 Feb 2026 10:29:08 +0100
Message-ID: <6334c612dbc96e1e6593c8b02f073e5170e82e31.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230776

From: Ken Kurematsu <k.kurematsu@nskint.co.jp>

In the NVD database, the product name of libtheora is theora.
This was set to ensure that cve-check works correctly.

Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8ddda60332e2a3219e905c1545b5da917f855c6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 11674af379f..5e94bc29751 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d
 
 UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
 
+CVE_PRODUCT = "theora"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"

