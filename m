Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A97C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 22:22:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7876.1673389359302560899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 14:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AjWewqW9;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id ja17so9836292wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 14:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFsPrAejYTbs+VCpBAf1Nh5NLwLI136R6XTRZ6NdKg8=;
        b=AjWewqW99s9FRabKsk2kxpXoGLIrAcckQgzf0UbZAjkrE/7YOiy7STxmPmxrz8cIsf
         qDtOUdGh8V4a59uxxA0cOsGmobI1OACrY4G7dyA6znE7WT1LSDnE0MUY/NJDSAlgvkOC
         q4dEVW+iKP2CL4e40Yq4f+znseXgMzo8dpVKmXlvk3DwEj5+9Bzk2dB8HM9zxgqeTLJp
         Zx3kmWF7nkGDvJBpaGrLQ8+0zGAbQbxbMAtFZpeC3jLnuwWUJRmfdDhqaXVwtjm+urA9
         ikE+1Oe+MWo3XaDwx8In2whJSR5meFx0CcwlC8amSzLeor2EKs8GUGb5Pxf6aUQF2vh8
         hfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFsPrAejYTbs+VCpBAf1Nh5NLwLI136R6XTRZ6NdKg8=;
        b=QB47vOGBUvlcyBaV2r1Pta9zCtbG/nrNrUSWfCRUmPH+I3as8sj5c02nprN5zHC41O
         vCGNcq+mYV3yBTTlH6VhJVa1b+3GpWuLfPs/J4vfdluXE+CBAGxVOuXn59PpHodc+HJu
         vgMH/AE9F878QGU/hacAcFXMci78L5NIDFr9+qhpO67QF/i1BBwbA7EJEijKNOp2IwwY
         mMkS4RL6l2R2lbw9Of3x7rQlT8/ohhMVKdN+myu2FwqFewC/G81xS93Hj10ptvQXEekW
         60hf18PyXPtFBN8Y6m/LCuRfzHRcTlCaDgxQoWefaJ26+vdUQgfyBssEQFR8JWKErSI+
         l43A==
X-Gm-Message-State: AFqh2kpEudgHJ17Sr2x/dYBR9YbISuin293VxUNedxKTAElhSsTfah5c
	xxJbLnyHYjBBJCSETjdYI95YU6hl2A0=
X-Google-Smtp-Source: AMrXdXuz9iomLTVijZsoQRW1WSn5goR9mL1ogoKBWfuhAZIZM9392OvrYjmnaL1aXvX/bCFsrp59sQ==
X-Received: by 2002:a05:600c:3d95:b0:3d9:78c3:5cb0 with SMTP id bi21-20020a05600c3d9500b003d978c35cb0mr40794562wmb.36.1673389357506;
        Tue, 10 Jan 2023 14:22:37 -0800 (PST)
Received: from localhost ([2a01:4b00:d307:1000:f1d3:eb5e:11f4:a7d9])
        by smtp.gmail.com with ESMTPSA id bi6-20020a05600c3d8600b003d9df9e59c4sm14048882wmb.37.2023.01.10.14.22.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 14:22:37 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] systemd: ship pcrphase/measure tools and units in systemd-extra-utils
Date: Tue, 10 Jan 2023 22:22:27 +0000
Message-Id: <20230110222227.314983-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110222227.314983-1-luca.boccassi@gmail.com>
References: <20230110222227.314983-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 22:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175725

From: Luca Boccassi <luca.boccassi@microsoft.com>

New tooling related to signed TPM policies introduced in v252

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_252.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
index d745d60fe6..fa9c709293 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -527,12 +527,15 @@ FILES_${PN}-extra-utils = "\
                         ${bindir}/systemd-stdio-bridge \
                         ${base_bindir}/systemd-ask-password \
                         ${base_bindir}/systemd-tty-ask-password-agent \
+                        ${systemd_unitdir}/system/initrd.target.wants/systemd-pcrphase-initrd.path \
                         ${systemd_unitdir}/system/systemd-ask-password-console.path \
                         ${systemd_unitdir}/system/systemd-ask-password-console.service \
                         ${systemd_unitdir}/system/systemd-ask-password-wall.path \
                         ${systemd_unitdir}/system/systemd-ask-password-wall.service \
                         ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
                         ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-pcrphase.path \
+                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-pcrphase-sysinit.path \
                         ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
@@ -540,12 +543,17 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-bus-proxyd \
                         ${systemd_unitdir}/system/systemd-bus-proxyd.service \
                         ${systemd_unitdir}/system/systemd-bus-proxyd.socket \
+                        ${rootlibexecdir}/systemd/systemd-measure \
+                        ${rootlibexecdir}/systemd/systemd-pcrphase \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
                         ${rootlibexecdir}/systemd/systemd-reply-password \
                         ${rootlibexecdir}/systemd/systemd-sleep \
                         ${rootlibexecdir}/systemd/system-sleep \
                         ${systemd_unitdir}/system/systemd-hibernate.service \
                         ${systemd_unitdir}/system/systemd-hybrid-sleep.service \
+                        ${systemd_unitdir}/system/systemd-pcrphase-initrd.service \
+                        ${systemd_unitdir}/system/systemd-pcrphase.service \
+                        ${systemd_unitdir}/system/systemd-pcrphase-sysinit.service \
                         ${systemd_unitdir}/system/systemd-suspend.service \
                         ${systemd_unitdir}/system/sleep.target \
                         ${rootlibexecdir}/systemd/systemd-initctl \
-- 
2.34.1


