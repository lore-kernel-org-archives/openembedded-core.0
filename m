Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE797C43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.16631.1667744297183628825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iJDa2ll7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so10766029pjh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJAFPyrPhpFj6TRt2jCJI+1yNcRaAj8R5kZyOm5IVfQ=;
        b=iJDa2ll7cSeT0WYOgerem9igEUN6ey+N+Y+KEnsT0DZgadOqePMaQE5ze5hhmdOpec
         nebOFC4YoE/ZiuEsa5AjqPoBkbgd2lOGEkxzMcH0O1y3sl/TtlP3WKqD0z9MDdSMiv6h
         UQJV1GFrmjBnzXz0bbZCb5LijHJ8z4RU2tNGYoTeGVT6T7vLyUX2+al5CCt57aPtYe2o
         QQOoINGkZjdVEo68YMw7GT30vHpFwhuhAMXCESgQ5GjMx4RYIXKP5ZltTxVGKF8Le/AB
         TlbKoAyRx3VZocVxLDgd8M1RNr7QrKtvKEXGhjZb4XYWKzFvlyDpUHPfICc/WQiDaSaA
         h5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJAFPyrPhpFj6TRt2jCJI+1yNcRaAj8R5kZyOm5IVfQ=;
        b=oP8NpGFKVs/nrkDU+qNq/juEd79o/5K8T3hq6/voWGbCpQwNlc/K/4nZkkP+FCzRuU
         QFskm2rpOhwO3mwhlUxVPG0OYtpOLFAaCAoIMzU3hQuXkI3BIdYvOB24zyORtRYWPXG4
         Cz3t/O5ctvbjYzQdV4OKv3VSSq2U+om8BasUGnWr9+ph6MjO2SWxaDKHehkicYAE1S/U
         xohNS7WxqZYaS40emwnYZHvDulkrdxDsF/JwEqpvtwc+3Zhmj4zalUVEyg2zuyJWMej2
         M2DbK2TZ53MdsqyZUX1fuoFhPh3D/HXw4g3n2e596V73zobipLJ2g4hkE/60tFTf5pTj
         2FVQ==
X-Gm-Message-State: ACrzQf3krCwfOGx3tqdK36GXMg+IOHfW38EBpVsYyM0BznkK5+RQRVZ9
	zVZWs4FK2HbkNZcqAiOp6MdoIpJAahbEhaOA
X-Google-Smtp-Source: AMsMyM45qUTYZjLDhHJcajjK2C1373NDRq7J4tYe+WrY5e0/9qhjPMY0MmuYwZoCi4RB8S5Pz2g4dg==
X-Received: by 2002:a17:90a:de8e:b0:214:1066:9229 with SMTP id n14-20020a17090ade8e00b0021410669229mr28440224pjv.223.1667744296240;
        Sun, 06 Nov 2022 06:18:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/34] systemd: add systemd-creds and systemd-cryptenroll to systemd-extra-utils
Date: Sun,  6 Nov 2022 04:17:06 -1000
Message-Id: <34cdacb072644f4bd610c48a789e4001d374e190.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172791

From: Luca Boccassi <luca.boccassi@microsoft.com>

ERROR: systemd-1_251.4-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any package:
  /usr/bin/systemd-creds
  /usr/bin/systemd-cryptenroll

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b3763dd26d324a7ce575586f306b8aec4b1103b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
index 910ea71bf6..87668cadc7 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -518,6 +518,8 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-path \
                         ${bindir}/systemd-run \
                         ${bindir}/systemd-cat \
+                        ${bindir}/systemd-creds \
+                        ${bindir}/systemd-cryptenroll \
                         ${bindir}/systemd-delta \
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
-- 
2.25.1


