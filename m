Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7068CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 14:15:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.14885.1757340932629452440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 07:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KkiAtBh0;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dec268f2aso1419315e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757340931; x=1757945731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0BFrTW2wzC5S/fTn2mpLL4zlcIkr0yLVDlezRo+NdY=;
        b=KkiAtBh0TIzReX40GxNyj7Pq+R3rtMsyHKoKluTGogO63XrgaIaDpg3GvCKf5WBVa1
         5DAlEzSR8591fhR0LBbHE02PewRf6fpr4Mnj6h2Yak4qCp6mFZA1grJZcDgadBkTs1h7
         lAPQmWkVA25UPxDeHn/eIpsKLAneUBjbIYWB1imSNP0cxYaCicoyOQETuJ3LdXpJWbUz
         aowx0jx/iqthbsAQJUhNVw+W6ivLtlPUV1McrtGQvYNQQEm0RD94dEGIYqEh1FKNDtcU
         FX+NcpH+ifhyd85/JVS17jRSG4bgTCxK0Sygn7pGVcum5ibz/IRMr1qQo4sEFTTRkOTo
         PYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340931; x=1757945731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0BFrTW2wzC5S/fTn2mpLL4zlcIkr0yLVDlezRo+NdY=;
        b=Tvt5Y3EifNagGQOSkiBcAtbgcP61U08xd6WG6Nv1ynWC1qCl9TCwyLl3ZGdTj4xSn5
         2NVBMK71hNi4j36NZ3yZfWoRKU5QT5yxzVkP4L/eh6urbRIEamZKySFpDC4N70gXlHBO
         Fs09qulTMD3SKmUuARWSWK1MkMCzvU9davkZJ48ut4nzVtwk8f0/E8quLub7nHwxn0Ph
         wVFkVIhcZT3CKtPv4kK3kid7mIUNYHYc5vRGz9GooN9jlBShOH+TIjoFnBSKydYuTfqV
         u01PnOeq7ObSR/GMytUqOTIWmb2S9CyrW6EwEJduQWfiAtIGbwWZ0gcnaAyK+64BPFCq
         pZJA==
X-Gm-Message-State: AOJu0YxmALCPqKvUAApiTzvnpQ6JJgb7Og1SnCY926FyawUzhlJq9DnG
	MfmVrxsWZ2QAhttvN+EPqFIjT6/qFJVsXDJrDnCclPedVlemVngOVQ0Axg2xZtGlPgo=
X-Gm-Gg: ASbGncsrITmNb7Re6bLJo9TExPsXE/w66QgN9Z+bW5dWl5/vWDY9NYZm1NhQbPPzaFd
	MIbr2BVUVn6UhFw8kLrP2L1mPgn9rETROV88S/7aaiNaKx3MauphDvcBvgCfdUI0WUIX6NzURlu
	QbAr03qd3LpPTrr9zRn9q/54k0n6sOUxBCB9y/bvtZnXf3eStciiJ9ys0WfH1JPAXBN6BTubUTR
	iYtShw2Gin3u+GXkx8hKNB8YE2t8elXb3ppF99W4rHXHkOukKfWI6Wb4tuIapHXshn5qfZglz02
	94oVozaYYhn36KUnKh10BB9c3UaxN9ra4RQODvIDBSSmehaic1bp/Ae2rq0D3NwotkXja4jgoGx
	xky/j31XgCCznpbDAW9UDeg==
X-Google-Smtp-Source: AGHT+IHELxHjZxDI3VVr8jaimBDmG206F0pcueM8sM4PI9CGWRbKpsrFTRgSX/oPxqXx5tYPLXvcaA==
X-Received: by 2002:a05:600c:4708:b0:45d:d287:d339 with SMTP id 5b1f17b1804b1-45ddded243amr67487515e9.25.1757340930434;
        Mon, 08 Sep 2025 07:15:30 -0700 (PDT)
Received: from fio ([185.228.162.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9fbsm41777108f8f.50.2025.09.08.07.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:15:29 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] yocto-check-layer: show the distro used
Date: Mon,  8 Sep 2025 15:15:05 +0100
Message-ID: <20250908141505.20114-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 14:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223068

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

It is good to know which distribution is being used, because it is not the same
whether we are using the poky or openembedded-core+bitbake repository.

The default distribution of bitbake is the nodistro while the other is poky.
The nodistro and poky produce different results when used to check the compatibility
of a layer so it is important to inform about the distro in use.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 scripts/yocto-check-layer | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 67cc71950f..8c8b4dbcad 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -35,6 +35,7 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 def test_layer(td, layer, test_software_layer_signatures):
     from checklayer.context import CheckLayerTestContext
     logger.info("Starting to analyze: %s" % layer['name'])
+    logger.info('Distro: %s' % td['bbvars']["DISTRO"])
     logger.info("----------------------------------------------------------------------")
 
     tc = CheckLayerTestContext(td=td, logger=logger, layer=layer, test_software_layer_signatures=test_software_layer_signatures)
-- 
2.51.0


