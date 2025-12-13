Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B706FD5AE44
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:55:58 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2826.1765619750426488873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIWZBolh;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-349bb6f9c86so2593518a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619749; x=1766224549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGmhegpzpbdH3hIoXu2If5xt8OVFCGggYiJfoxePapg=;
        b=TIWZBolhVu8p+JPygo2FSbUVF15S6X2myHw8wUcX76qFDQSaw1qgpcbJDi3lh5cdIB
         /iFrujHMqp6HUCxoUw4H6UWQLnw4OxOAT7FzZNhk+CXD7SL4X30K3oub1kJJp0jt8OVP
         4pFkT+iEmph0tlyj00HMHDBsxP9tYJLqx3/l6gD8CeR8aCDev/LVfz8vkvhkQDvxO+Yh
         IRLn56fAAlnxFTSEJTQzdiNjJLqGFgh9n1JO/1Kb1Cu4hltxE08Ep4zkBq87+JTYjxCE
         TXLj1bFSMAstmepLEMyMkB9vff5grH5o9vFJCXLOQDfFBSvDqp+9RkPnFifJEbCKb4ig
         aWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619749; x=1766224549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGmhegpzpbdH3hIoXu2If5xt8OVFCGggYiJfoxePapg=;
        b=wa2ESmQoDBWRsh9NGSwSxe8oMHLF912H1t/mkzBrpKUNR0ku18fWICrW9sP6sdmb6o
         E35gwFxFFpYEZEfD38GjmLYLwPHUxADocYADKKGPKWJIAtrq8L507+V1dF7a70+22gOD
         fJ0/2gsjv065Yw9NRAKr0NhpzNMegSa5VKVyLPMkDEfxNLEsHjbs0Tzy0x9Ko9IaMPYL
         ELuKimEGkZBzj5wpszWJ36LO13s8U7ejwhFSS8oDEltwupvxcTg71+ZF0aj92GPL+8Im
         XsTxjSeeKOm5MJK17xNjJJJ7HcWX6HhGa5M9zaFfce8Gs22GndAtUqbPA0dqUOmxGwQu
         wDBA==
X-Gm-Message-State: AOJu0Yya4ZwVfFDbqBJLwNiV55YfwBZUS9AMGevx6OPYvtvm7yhsFr5b
	R4CEQ6a7PS2qGcqITQ1+ih8feDAXqAjH3O2dIdjxHsxJpCx0i/wJjOYOyn4JCNTQ
X-Gm-Gg: AY/fxX4by0Ja789cm+2d0q2c5aXyoAxkZKZeaF4SgH4PPvbuVAfLgazuKI/8rjx70j+
	5WRdbc4JFO8+1pqZchiCAhVjOUI+dK0KA5ZvMZlNNJ7OZH7wNqCB/0YfDerL7sgT9q9hhrPaW2+
	rMV6+hLm9486NFlWlB67dZLmEqbT/uwMbUaw+DJMQ88B18lJ0R4xw6KTV3p/cJR3q3Xi6KpqsDW
	U/pjxWqOyzC0D5UailpjQL1wxurFYodH2pArYqfBF/fYagnoYQiiiUDvh0DmxmXtBhtV/uSGgoC
	dYQV1lBUrbVeNAGg1wpLe9FdbbjV2opeCbeDfJUz8Ps8h33WGPUIOHWSnTNMIV6t+9tMo18MbAE
	5UyXlvgqZx5pMkmS/MS2B+m6Q8BhBx6YV0yrHR8BV0dcnBsWJhjkKZqI5Fhjaj9JuN3MZoo0KJu
	R/l6S2rVbfjtvCzwU1zJeJmC0emTv1n7gCCtGkjjQvdmGvz8fopg8MyYsDVt1shKhzMti9Adn0b
	GUV5j84jAT84EeQcYZq59XJaGFPMYSW
X-Google-Smtp-Source: AGHT+IG+Om/gUBf3j5zOTR3JdERTLQLBNE2TUeXk6OrRxUirFPY0Rqh4U2JGrzC30YrhUTqeOEsnlg==
X-Received: by 2002:a05:7022:f00e:b0:11d:f462:78ac with SMTP id a92af1059eb24-11f34c25f9cmr3376270c88.28.1765619749514;
        Sat, 13 Dec 2025 01:55:49 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm8298468c88.7.2025.12.13.01.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:55:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] default-providers.inc: Let libva-native provide libva-dev-native
Date: Sat, 13 Dec 2025 01:55:47 -0800
Message-ID: <20251213095547.1028402-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227618

This fixes parsing errors e.g.
NOTE: Multiple providers are available for runtime libva-dev-native (libva-initial-native, libva-native)
Consider defining a PREFERRED_RPROVIDER entry to match libva-dev-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-providers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 3f113543cd..60739aae6b 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -52,6 +52,9 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
+# libva-initial is a bootstrap version to break circular dependency with mesa
+# Use the full libva for -dev packages
+PREFERRED_RPROVIDER_libva-dev-native ?= "libva-native"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
 PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"

