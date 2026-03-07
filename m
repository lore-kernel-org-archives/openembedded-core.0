Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1405F5511B
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19029.1772923988389235793
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NprwHOl3;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439af00d33cso7318071f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923986; x=1773528786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McpU87rYmefGYXPbiVv7nxTKixb1L15uX8Twb+Nzw7g=;
        b=NprwHOl3kH3hXqdOLIkSsf+toZaxW/pH3QmYvVotzW+2EKLmpoKk51eowT68HiIjz5
         feGpQLaaZiS7bTPsvYAffnh3C1KUoGBr4rKkrTRO+Dx9KIqNKt+E3pam8aeGQDvP/68C
         u/qjByX4UUA3lTI75ja4ERm9nCKyNREhfSjFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923986; x=1773528786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=McpU87rYmefGYXPbiVv7nxTKixb1L15uX8Twb+Nzw7g=;
        b=MX4uaGNfUYIzCpXcldXQxZJvbzIH/07hzkgW8QJWyExxbe0J2nme85/i4cvyaP9JgG
         Y4joNhhFSkJ/AhZdEcQYm2Duh/Ym36MvVifNKNBjGazPx/K/7QOzRjiQxezJBB25U0+7
         yNhpTuvdXC4zaAL9wD9nCkQzSixCVXV3+I1GW2jCe9k+AZj9gHffWZ24f/HOqRU/lO7G
         qxRhMFTcBfq6bUfeph17s5i4AoKWYMa7mUZzq9WTHwWvan1iW2rC6zgvobe77QGWSqPk
         oi1yu4OEgSU5wUgdESRLT720DCiu3mWLl24BkLX+N37SI8Tv/+KZaV/6QLqjBst8+tgk
         qqUA==
X-Gm-Message-State: AOJu0YzCLtIUgli5Md4YSnG6BeAtbvFgu3Ujyp+PnVFkyo5kP4pzeNXj
	Gzok/PH63CxmagMhKy5Nn1OWjN6rvSaYQZOlwPdV7QaTIer/5fRLfwFgcAijGzU/6Z9S0WKOSUL
	9T6pt
X-Gm-Gg: ATEYQzwz5zttAA3Fcf+HIMitt3dB8com2NnIwkOCF/qmtxws0fy5xiEP628ypmSIop0
	K5U8E5neiI+th+b4UWEQDwxW87o1aNe35lojJNX3sN7HU1edaLtpI0rUmil+iWUFhGVZQUvA9v2
	xMgBTA6UerC2cgaR0CtBnpgYW+sr7r6Wcjfti73WEacz2ebmACAc0S6QOV71PgOHDu8lkXvzRCE
	t+dM8jX3CuAPZBx2+xi97gw7stAaZ9sy5YKpAIqBXv4JvmhFZZUgu4juepufruMgwu4dGJUaiVJ
	ZIPopnFr9YHbbZvolyXqYiiZqP3mjAupCaNa9tVRMw+pSR4LAaC2uQrDcrQVW2MAkVk+5d02VTX
	necv4DnVqNBomP6UCFgYZ03loSh04HQga8EB2aiPJNgzgALH0KED6Kf7iqZ6sW3bhp08nf2Y03d
	brIS7Jv+E9NgmIq2H23K33YZ0RfgZVrpUhEsVY8VG56MOzTrKjgiKx5M5E3qfMpKr9x6BJJsBer
	JKvRPiCHpZfwQnnpEZIi/lCCJ4=
X-Received: by 2002:a05:600c:6385:b0:485:3471:cffb with SMTP id 5b1f17b1804b1-4853471d079mr18732485e9.15.1772923986256;
        Sat, 07 Mar 2026 14:53:06 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.53.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:53:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/11] scripts/install-buildtools: Update to 5.0.16
Date: Sat,  7 Mar 2026 23:52:24 +0100
Message-ID: <7ed3e45b5da52c6017b5e93175f14c2cd17e1070.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232632

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.0.16 release of the 5.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c874494f4ab..d95d5839c93 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.15'
-DEFAULT_INSTALLER_VERSION = '5.0.15'
+DEFAULT_RELEASE = 'yocto-5.0.16'
+DEFAULT_INSTALLER_VERSION = '5.0.16'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

