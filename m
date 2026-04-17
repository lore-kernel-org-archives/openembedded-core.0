Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BBCF8DFD0
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:24:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40047.1776414287521679181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sjkUE9ph;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso14486605e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776414286; x=1777019086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHrjfE3WXY9/SJeYV5jnsc5viuRM24WZ1evOKjXYy+w=;
        b=sjkUE9phCSml+IH1jeCzYsqXrb2VAOA6qZ3NzMP3DI0o/k95dCpPrGozM2KOzyByJZ
         UhHo8HP/D0lIZ1dK3IAGPHhGsAdOX06FGRbxaR8ZIg3MdoMaZSRbOYqVGwalg5l75GRz
         zoxy6n8VjB3wjNjyMwkdCsN395R9aHpEfyKrFwqXE4I3JZDNGEyxykpbL9Z4n55EjAwJ
         /SB/AWXggLrD0ilXFu69yOAQsl4s3cdRQoulnZ8BNMiVINsRYl0qXWs87SlQcfPcobvA
         ozhHBB7/zFouViYrKGaOoAlHfMhvotKHgyQLOxspxwYZpXSuYglVKx+BMqTKNHhig4AV
         veNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776414286; x=1777019086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHrjfE3WXY9/SJeYV5jnsc5viuRM24WZ1evOKjXYy+w=;
        b=owtpWM9lWvUVCHkdlSYYs7P3W5303PRU+oGHoSa0ul89oc3M1ZiFBOUgCDxXHEcxdu
         hwvGXZOoFJq389dqqAv4QZCIVRWRHoJzlQMHxhJU7l2TCP1Rgs84wh7+d3aRGdLvtE0x
         pAwvcsujQd7xgFI9EGvgbggTq7hLn9kVvHPgA5hAhYqwcJ35FTFszKH47J6Ue+jjGwN6
         ZBYtiKwUE2/wUxrVfRImNWUce11gFnvZPWZZQzrxnvs8loNRT6DvYHg5KOWFkl8wTNnh
         UUISmEZ9kr4Nd+E8pp6rXqyxgkhRzEIkODXMP97l47AX0XvXog6S62R15DmiCyP5Hp7A
         bD8g==
X-Gm-Message-State: AOJu0YyJ1vxNqg9mUhm+229Bvz87xRFZIaDlc0/QBsHqgqprsst5S+NI
	pajm01jPDSWqp1bNi8w+YCuCb1p1SkqvmyDV2OZGmjopA5rdWvs+dByGkFImkQ==
X-Gm-Gg: AeBDieuLUJDEs1N5AZJAmcWcZP35vk7ztugh8l+etbz4ogMB+lYRhi1ufL82pyUzm5H
	royITgRYYiTvGjdF2REv0EexTvqVkDb3aQzcCSkZAMbo2v83yr6ePZijgajrw18oIVqbuMVbkOW
	KBcO6if4uS8SOvFdh2nsQJo+T6ZcJjuiP7TKUS7hUFZHyzd610jM4bEPMy7oQevSHlUKtw+VON8
	A4OwZ38M/9DUY2kuxFypNuSO7l5lToIzQF+cKDKYV5ziDgTbHX6Q67RMGbsdLZprpeHdvde9C1f
	/3rSNb/lM8eb6izvSI4ImjyRfiwikogsASMjhxAotz8YFL11FZZSAqagamVeShSnpqYeKIFXmJM
	UMdS3R8hS6D1dOuGPf0mqHI/01Em831fFUZfrplbVZF6EpvznHRpN0zpNqLzsJ0KKWUtyz4u3K7
	Gzp2spnNaZzT80nm2cIc0mSqBiHXrfVkJx/+ka9uA2oLc/DapFJ9JaLZrYNU0WRWUKVzvMg85v6
	sXG2L96a7AtcQ4WJTA7
X-Received: by 2002:a05:600c:628b:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-488fb8afffcmr22730395e9.9.1776414285477;
        Fri, 17 Apr 2026 01:24:45 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc181c6dsm25036035e9.6.2026.04.17.01.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:24:44 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] dbus: use ${PN} in pkg_postinst instead of 'dbus'
Date: Fri, 17 Apr 2026 10:24:42 +0200
Message-ID: <20260417082442.1919508-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235487

From: Martin Jansa <martin.jansa@gmail.com>

All pkg_postinst in oe-core where the package name matches the recipe
name use ${PN} already.

We have a bbclass used by some recipes which does:
pkg_postinst:${PN}:append()
which works reasonably well for most of the recipes, except for dbus
where it causes:

WARNING: meta/recipes-core/dbus/dbus_1.16.2.bb:
  Variable key pkg_postinst:${PN} (...)
  replaces original key pkg_postinst:dbus (...)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/dbus/dbus_1.14.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
index 4fe7af7512..ffbf0780ed 100644
--- a/meta/recipes-core/dbus/dbus_1.14.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.10.bb
@@ -109,7 +109,7 @@ FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadi
 RDEPENDS:${PN}-ptest += "bash make dbus"
 
 PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
-pkg_postinst:dbus() {
+pkg_postinst:${PN}() {
 	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
         if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
 		if [ -n "$D" ]; then

