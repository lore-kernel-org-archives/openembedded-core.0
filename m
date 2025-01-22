Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E88C0218D
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:47 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.34202.1737515025118801111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VLKkFwAC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so11509812a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515024; x=1738119824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiDnBiVxRjB3o9JiwCTABntZmPSPWqgS7vT+Ry00mOo=;
        b=VLKkFwACDkyekLqkDupvy/w3x8ksyCTemDxOwB6dDP9KSeO4CVL3rrM6DCW/ilghTu
         /WbqLdrzZ5EFbrp9cBAG7jxzV/u0q6i8/9JldRMNcT+2RvbJA5TF8QPhI6ZSTyleECqh
         KIp5BLU+Y5omC/GXCO2G5OfO1M+jw/KKbR2uZVsKOQmPeDHfgnklzQ9R2d+4HE/kt6Cd
         Lsp3iXsjsTuMovOQtzWPRkWICa4DLllvB2fknoVN0adRbw4th6rZmIGcQ2r2tlNnu9xQ
         cPe+cQYEuCEO2Blz3wTdKW7M0/DVl7jATVOvr/6FZu9g0CqLFi1W4hN53/zfrL4egmco
         nyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515024; x=1738119824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiDnBiVxRjB3o9JiwCTABntZmPSPWqgS7vT+Ry00mOo=;
        b=TMptIp2rFpP0dxNm5zaM9JtcvoGZigGJ5VQOhcFFcc4NKmnYNNjvlt6fGu364Le4Ed
         34SmGW+QMoxYmfscRnzK9HbDggFfrH8IrrrtnTLitcmnJmVzb1FNmljfCY12U3jvXCtt
         SHGfuSqk/++aSY8q8o+zxrBK4JLyTx4PmyP+qkqUocv/Ag0C1a+DuuOGvyu/pZXXESWp
         nqM/Lij3dVyoy8Km6xw9rYdbUUEN1ssrosEc4gjIG2bRzq+RqHGBhyMgxNRBlRv/aj6x
         t+CebqCDNhLvD6fVqW18JFyvRtR5ReD6RhguwVreqv/kNO/gghCiRwmPtXX3xtw6hnYh
         C7+g==
X-Gm-Message-State: AOJu0YyNVC2fvUMwp7KYGRpN2MAGxm0fMk2pDhmMMR+b398LQWPJ0fdk
	0IiMA7Ttzk1VzIGl8G/fobUyWALR+VfJCuhP5ppMWD0Sfug8fMg+ZSNbzqjUJcQ9s4L72kL4Bbo
	oeYk=
X-Gm-Gg: ASbGnctgQfoYlN7MJHeMpGp2agWkZO2jOtxzn/w8cVMPWwN0ZCX15utTtQlzB1jJnfL
	GaFY84LkngMer1akQ9vd3M2Vuc68++NzQ5lmHDRB2qVIwP0lgchCS5pD2UbFuZJXTPiLpUIuXPh
	XIzuYs1S3Xsm71sffu/YyPfY+Xvxo9hUvB/KqZ+7Jva8k14RcJwpaFlDI9+qmvdHFIfxxUGXuiy
	yFgvwjtTtDcbWjjC0TLfD8gDREyHnU725SymhrepNE7l1JIDkf40vp6mYo=
X-Google-Smtp-Source: AGHT+IFTrRfNZSpLLCfVl2X9hMZoAeqiGQL3aAB+tZ7I3D2L10SOAkrNuqKRoSZBeyJrTz+xESLkrQ==
X-Received: by 2002:a05:6a00:14d1:b0:725:9d70:6ace with SMTP id d2e1a72fcca58-72dafa0165cmr26745697b3a.6.1737515024385;
        Tue, 21 Jan 2025 19:03:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/14] Revert "bluez5: remove configuration files from install task"
Date: Tue, 21 Jan 2025 19:03:06 -0800
Message-ID: <54a7014a801ddbda2a7dfe1ab560a154064ad47e.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210124

From: Catalin Popescu <catalin.popescu@leica-geosystems.com>

This reverts commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388 which
introduced a bluetooth regression on systems with read-only rootfs.

When configuration files are missing, bluez tries to generate them which
fails on a read-only rootfs. As a result bluetooth service fails to
start and bluetooth is broken. Hence, configuration files need to be
installed in the rootfs in a way or another.

Bluez commit be0e79629 (build: ship all config files with --enable-datafiles,
2024-02-12) introduced configuration files installation in bluez version
5.73. However, scarthgap pulls in version 5.72, so it is responsible of the
installation of configuration files until bluez is upgraded. Scarthgap
commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388 removed installation of
configuration files too early, hence the revert.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 9cbeb5e99f..39e1bf389c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -87,6 +87,14 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
+	install -d ${D}${sysconfdir}/bluetooth/
+	if [ -f ${S}/profiles/network/network.conf ]; then
+		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
+	fi
+	if [ -f ${S}/profiles/input/input.conf ]; then
+		install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	fi
+
 	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
 		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
 	fi
-- 
2.43.0


