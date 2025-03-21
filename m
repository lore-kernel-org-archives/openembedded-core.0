Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97012C3600B
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:50 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.21061.1742563543920922320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OCH2w3hO;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2116517e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563542; x=1743168342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zErSyHtBL8AwOjSCoV00LTljZ6I+SBCKPcOgxhNOXUc=;
        b=OCH2w3hOsrHwDM39iWrxLURVU9f6Xj6c5gwiW4o1riFPX2k6EEZgCzAnYvS3NZcQyC
         M9S86g2ZI9ca4yT4vhe7mVn70L8/wWp+2QyB4cwFIS8hbCVCIkKPrYjGMmjXnDAUAC4q
         6GdhcS0+xRdcqZvxqaeZs1MnYM6JxL6k3yBekD1IyFt8VlInWVvSSSi+WhtsA+4lcXBS
         5Io/TNQfCqNm6mMZgbaYMzmga35t+EP8IGjt0DNaGYP3ysYsnZbzNU2CtFt2EP3VegRC
         EvBt83c7rnsxtKJ5Y1eWdjXxwH54w4SLOHCN+ho/1nj4yN6SyfD/11JvgTOG2MGG1gDF
         e62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563542; x=1743168342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zErSyHtBL8AwOjSCoV00LTljZ6I+SBCKPcOgxhNOXUc=;
        b=vMQYbrrtK7FSbvI0JLW1tLOLiYC/3V4g0C00Pls8aomd4+Bn450BrYUw2qTwAIXmoZ
         T3p35qJfTcFkT2YMBE2nNlt1uiw29cRnVPqyEPCXJgKzJTL2NJbPhCKo9Mv2sw1EIIr7
         nKBXeUL7H60bPoKCAeeRoEmo5kGICSa4ymjcNzNw0fCzTBHNIHQrZWwtLKwiA/hLrqtb
         XDtPvRofHS8FRfLtiZp7YixtQE0UEcYNN0SOgwwrD8j2McuoJnACf2m1k2DktDpsycPz
         QxpTzv1n+crYDpkXzrS0vhRNEgYdRD5VFqDp0FORLLv0HON/PWoFFA/atFrpqOnJQtmv
         YfQg==
X-Gm-Message-State: AOJu0YwPDfx2B6EziqVqK8zoFUKP5aljNWtrm32BsZiCOociEm/TJUx8
	vKYO2qX0iNI1rLqNxo5iEFpl3HjMrSDnJG0soUByaQJDQ4WEqjmhFl3A5zqPBcXxqjTtzXk2UO2
	F7Ws=
X-Gm-Gg: ASbGnctnb++/FfJdy/loH8izdPw2b+1mi7VyzuyNz85uNW49QvK5rOXcQVCVvpbZ2us
	Q4OVdN/AS5TqeZTYpQ2f+YnNOoWc5SnGPrUHnYBU67AiS5uTZrSOseKm1wDE8A1FOfr71o5actB
	ozkzFtau7F0PgYsmDCT3eeW3h81HwRQCWcDm7XkHOCuDO/TzpGQZ0suq6mBxDfhZPYiqGSBYKPR
	WP+QM9Xv8oaqy3kTz3YOcE6j5RrhrXUJkkIXWybX930+RSpiyf4ls5ys9qNs0DsAbqUT05BXKc4
	PN4pJ3Ju5AUMlL/XKnCAzW1SHV3ScurCTPFf2+w/wCU7uHLoXbNmNeIOW5kSZraVyLhtaIW7htk
	5jFgKtKeSQipq5ZyVJe6ckoevoFRuc/py
X-Google-Smtp-Source: AGHT+IFVbXQvy3FgN4a8TCUp9qJWmOMMpJprC1ai8GOeEOt6WixCc3pZ/qGuc4E9HqGUe5p8ru6qlA==
X-Received: by 2002:a05:6512:10cd:b0:549:91d3:8e66 with SMTP id 2adb3069b0e04-54ad647b522mr935086e87.8.1742563541941;
        Fri, 21 Mar 2025 06:25:41 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:40 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 01/11] systemd: enable efi support if in MACHINE_FEATURES too
Date: Fri, 21 Mar 2025 15:25:07 +0200
Message-ID: <20250321132517.670372-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213457

For example genericarm64 enables "efi" in MACHINE_FEATURES
and in u-boot. Boot without "efi" in systemd works with
EFI protocols but for example efivars is not mounted at
all so various checks fail in userspace. Fix these by
enabling "efi" support if it's in MACHINE_FEATURES.
Fixes efivars mount to /sys/firmware/efi/efivars etc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_257.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
index 64fb8fe69a..9bc4532021 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -69,6 +69,7 @@ PAM_PLUGINS = " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
+    ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-- 
2.43.0


