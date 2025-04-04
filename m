Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1863C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:29:54 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.1439.1743784192825428587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TXuDIQk5;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so2671215e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784191; x=1744388991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15SmjIPRbXq6D1yL96ViOWCE00A39+FYKQ5Y9tFpvvM=;
        b=TXuDIQk51FM2JRFQ8cnlDfgshmIsWtnVs2uJq9DHcZCPMwA/GY7ZyYeqJKj2noV2ol
         ac9yRGSonrO8JbLj/n9dSoF1nEN5k+jYp74rUW/m9Foxi/Vds2tNdEZkv+eQbQMtQSN3
         kY7KSezsIr7pXx+XVDOEz1rZK3eDieW1c/C3WaCuce67nhKEoDLAK/gN+xpFl/IJ1NU3
         sxCsoefwsV92LWB9aYBt+M5mHK/+r+g6Oq4b2JXqGMbhxrqCC8SIjAKxeWDT1O8vu2MM
         8K4vQd2y9aRu2zR4N29RkT+AP2G3/zERS9g8xNSxGNybNKLy7rhw3nPwKD4lyBwu5PYd
         zr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784191; x=1744388991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15SmjIPRbXq6D1yL96ViOWCE00A39+FYKQ5Y9tFpvvM=;
        b=wtCW9Hk8TvLppOUEnUMoScpEQFTZ/NYVgU37yLvGhp+tFraFC6LHzoSSXj9/yEqMHR
         ohJPO6H0eZYeqIVUu7si+o5xs7vvt1rJwo2JGo22BaR8umOQEfskUk2dWPFjg/3mw1RY
         FTxsKDDrVgqdznSkCfjY6pPRLSs/4yGzmGRkHXdwiJYWw+3C/b1cNH6BrJihUhsrOcxc
         iLh6iJTJUe517OEZzklYq9i2nt2tUKnRjkXroiwUZsOhg5BykeEH4QXKExAt9eV1OC5z
         woo1CA1Hm7AXnz+my0L9pcZyBjFSZPxs/qml4cyNjYjU9Yo0/mrCUXK75BHVZu3jK44F
         eBNw==
X-Gm-Message-State: AOJu0YzgzLQZ9+ZwGB0TbKvVeqF3n9hZNJ6g8gHUcaJvqJ078UJCvmQV
	Aa6G6C/YgAUCy9nj9NSXDWKLiZDeCthMSH5OJDuEzs3nx/4Iwjd1djKV4l102zMIYvlGk0HuB5T
	ObAc=
X-Gm-Gg: ASbGnctdOkTSpg5vuyDMZJQHUd0lp20Oprync8ML2xKUQzdusD10gytz1NVQPYTn4si
	v6n3DAI/w80n6kYR1XP30dIZInMpG8CVYFeIGn/2w65+7+Kp50SWbprc1i5n95emQ0fj5uPXyM/
	M2fqke45gQdbfu3IDR7gVo9X1mr3u4WbOfZ4TLNVLkwoAY4AGDJFz3gQ0m2qKnPI/RbnTJqum2Q
	u+3REGqoHmCtIBivTcl7iRp3UhhmXwblboAtZPWMvQZXGhpDPeSaveEIC+9870Nuut1YQJ9DzIy
	sSr9CxJjzi7+kv4B3q5GKVJLnaFrRi6sWcv6jlUXM2/7RYPwsORbP14sgAZVg0JmX7jpPWtRcdI
	4WnBnu/ZH7L7sqw3Xx66lSA==
X-Google-Smtp-Source: AGHT+IHowXdjZ5hQ06dywvpXJCebIDamIVTa3RCWpgWwpU53wF8xfLmnnZ4lb1hG99fPI+nicyHO8A==
X-Received: by 2002:a05:6512:3c82:b0:54a:f7a7:6800 with SMTP id 2adb3069b0e04-54c23375434mr961576e87.41.1743784191002;
        Fri, 04 Apr 2025 09:29:51 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:50 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 01/11] systemd: enable efi support by default
Date: Fri,  4 Apr 2025 19:29:22 +0300
Message-ID: <20250404162932.447699-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214352

For example genericarm64 enables "efi" in MACHINE_FEATURES
and in u-boot. Boot without "efi" in systemd works with
EFI protocols but for example efivars is not mounted at
all so various checks fail in userspace. Fix these by
enabling "efi" support by default to avoid making
it machine specific. Fixes efivars mount to
/sys/firmware/efi/efivars etc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.4.bb
index 64fb8fe69a..06e5621398 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -68,13 +68,14 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor ldconfig pam pni-names selinux smack polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', 'link-udev-shared', d)} \
     backlight \
     binfmt \
+    efi \
     gshadow \
     hibernate \
     hostnamed \
-- 
2.43.0


