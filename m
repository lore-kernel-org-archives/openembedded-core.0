Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15306CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:02:10 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.118975.1697457729244829068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 05:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NbD/sE0F;
 spf=pass (domain: linaro.org, ip: 209.85.221.47, mailfrom: erik.schilling@linaro.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so4294762f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697457728; x=1698062528; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvf4k5/AEtagVk5zcP89V3XZH8f9JpCfheztedQBsrc=;
        b=NbD/sE0F1Gc1QHJRhuZXXtem72IuiKG/gI18nHt21xAw/oyyR/AXKT/zK3hLOypZO/
         a3B9DGMrYFIxECYq7Ui6XDx+Kct96O6p0u+dE6RWoMbMh2WJmJYzic4/bbkTej54+rjk
         03E7Nw/3ZrVTp2WYw19PCmZ3dG6MQrkEUl2JT3wD4TcqDuflGi3fwgysrMBUIQSab6F+
         9SFoeYfIbD2bupLpkR68cvYSp7ZfYzkwictE6UgUwgG+HEXjVj7yHBCHz6MR4MIlofjM
         ZfhZrdMgU59gEmk8mZZwCD1WuHVn+aBiaKSu6ckXRbfSL/wVqkdQSdHcfgGHRQzSSle5
         yuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697457728; x=1698062528;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gvf4k5/AEtagVk5zcP89V3XZH8f9JpCfheztedQBsrc=;
        b=H4+B5sB+FxYKROVmNh8uLJ+iquf+P6lYMkoJFGRLcT1eJvcsoCu6KUBdoTZVKbKvTE
         h0dK7YiXlVSUvnz4Au974b3iMDcyvYPv3AhwpsM4L0gq/VAQpanvXmrTL6TbqF3v3rYL
         r2SMy/S6E522sZIJh0ClJZD9C0igYQZawyr8Op9BMXyRBBg98jyQLf/BnzRcvTxwHk3X
         Y5Xot/gfIRua0PfwgCDqEeAAqrBt9ZfiHL4Oh5yhyTz2XVQY8aa/AcCrTMaM/0ONycm/
         TBBJFD/RY7jC94VrMAuB1qpUX0RDwoCmCHkQYmHUta4+ulNTmtYVBcYT7AXpLNS7gzRf
         RpTg==
X-Gm-Message-State: AOJu0Yy7rI0NuU5WDIVAo5d+QbU1+n7dV42ssJ35SJoJBXgWHOjm95ZN
	qXYOi8RkI5UiNDVYcQU0fpS4lw==
X-Google-Smtp-Source: AGHT+IHNpo2PO+Y8ApQ4Nm+6dC8MPjyiHjduDx+VWe5r2PSMnWPDX7izaMbaUbmzy7AAX7+vY2EEEA==
X-Received: by 2002:adf:f34f:0:b0:323:2d01:f043 with SMTP id e15-20020adff34f000000b003232d01f043mr29483604wrp.3.1697457727013;
        Mon, 16 Oct 2023 05:02:07 -0700 (PDT)
Received: from [192.168.1.149] (i538788F1.versanet.de. [83.135.136.241])
        by smtp.gmail.com with ESMTPSA id t12-20020a5d460c000000b0031984b370f2sm5207655wrq.47.2023.10.16.05.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:02:06 -0700 (PDT)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Mon, 16 Oct 2023 14:01:40 +0200
Subject: [PATCH] systemd: fix packaging tpm2 plugin for cryptsetup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org>
X-B4-Tracking: v=1; b=H4sIACMmLWUC/x3MQQqDMBAAwK/InruQxJiKXyk9aNzaBY0hm4oi/
 t3Q41zmBKHEJNBVJyTaWHgNBfpRgf/2YSLksRiMMrVW2uFgUQ7JtIyY42LQpyNmjPNv4oCNctb
 bpqWncVCKmOjD+79/va/rBtY4gA9uAAAA
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>, Javier Tia <javier.tia@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697457726; l=1280;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=8/7jaNSXuX3dCTHXhu3q1W6W7g22f/f54QIs3T0llvA=;
 b=sZvOvkfcJT2dD9m7KeYgeagGIq3PS2PVfrbzj0RUCY5oLTvyhsJlowVdx0savB8QyRloEfTyi
 Dgh1cBuWoT6BRPgtdB6LkqSgWkMb/5YU9qvzHtJvv6PwWjHQxh6oqeK
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189288

When building with `cryptsetup` and `tpm2` in the
PACKAGECONFIG, this plugin will be emitted.

Cc: Kristian Klausen <kristian@klausen.dk>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Javier Tia <javier.tia@linaro.org>
Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 77724eb822..6ecfbaf293 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -645,6 +645,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/X11/xinit/xinitrc.d/* \
                 ${rootlibexecdir}/systemd/* \
                 ${rootlibdir}/systemd/libsystemd-core* \
+                ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
                 ${libdir}/pam.d \
                 ${nonarch_libdir}/pam.d \
                 ${systemd_unitdir}/* \

---
base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


