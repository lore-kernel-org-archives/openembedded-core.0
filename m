Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4385E99056
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 08:27:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151391.1775809620695989120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 01:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s0c+rW/u;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so19001005e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775809619; x=1776414419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHrjfE3WXY9/SJeYV5jnsc5viuRM24WZ1evOKjXYy+w=;
        b=s0c+rW/u8AAWj20BWSrv4qYGmL43Nwa2N9CbAqCamimfGIOFQAMvZcFQ8jswZAczar
         YknknJW6wo1U4JWshV5M+UT/LcjQdQeFt7JEu7yJaHi424+xUWgE13gDtaX1Geth2QEu
         hGNWid5BW5jBbTaLD3e3xcSQIfK0UpnR7s20eA5mOBlDJ+1eOumOH2RcwpVjXhsbpzRH
         vYztfW00MvfWkucgiB29Ut8myW3gdZLowopM0Ea4hORyw6QXUlQQOnd9DCIx85GBFQhP
         r/urmQKbtoCnHvxaI4NmZSurmdCMJuwR2jRiPVSO9iB7XWBQaA5+dZ6TIPdfawYlHUnC
         eAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809619; x=1776414419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHrjfE3WXY9/SJeYV5jnsc5viuRM24WZ1evOKjXYy+w=;
        b=Ulcv4/Y7295RkFBmnH3zLfPtBnFWcyPmV67KbdbJPEaFBjbInTOHi7q4ZYDS1GxrpB
         oHKxkeHt+AUEC8kEJMNJNH6/SVay1UvBgdGT9L/zXigJDRuEDZf4IYOKuDhzboqNicak
         vGbzKc5rJO17u017chJ5fSLpa8ntSEID3oyqgcvWgKoTp2QLup82XhkCzD1MVMZrxA2t
         kdn2viwgF0ifLHogR5UePagVT+eMVz9wdv8EJGAewBKmZ32Wb1o5cbHzMzZHqgsfnWyZ
         dIDB11+fjofQDyS9ylyW9o9pUEVU1tmNUJEs2GlHef9Wu59hiNjKpI6rIgPfG1I73OV4
         paQg==
X-Gm-Message-State: AOJu0YxB32K2Me+Z0Gf5pONLc6MY3aEi7AcvaCGCybCcMTYq0vwFiSOg
	Cdxjm9T+ic22Ra3EBiG5EeAOYAQoB66SY8vyFxjomCM0v+QP5QsjXsgN/ntKew==
X-Gm-Gg: AeBDiesu8U7RVh8Y4asWoDIAgh2IplkP9bhtiYLeZXqktfGA8rIko0lv2bivZhsb+gU
	iL7SBGzO93+PjEQfD8TiJoJD71wVVsCHCAaeNGUsYD1nOryyiB6g80NCeBiqfxUClhqEg8usafY
	Q4XpeG29+AGKKauYl0VqzYFF5SHNvvsyw4yhT6u8Jo/1ISN9CtV0JMManTsNBUrurDsKsbRZmyS
	tvmKwQPtHqUmCT5zN52M5ijH1b1Pid8PNb6h/CYM5lGceaKa6mGfdcLNIc0NR36XA/YV7YA5TK5
	/Y2J0Gzud99aZqA0aR4k9gOvZ7RW4IekAh/I7JQbP/Pws5/bQVB79TogrZd3trs5oCpN+6Rht7Y
	qAXB945MNUUkWyoh+avYkgpeB2RfjIBOVKJfy4eEeN3cq7y9rXH3elL68dQu+ouQD4tDlnM/0Id
	Plbv2Z/v2lcCl5jdxBJuFUc6JE6FZN/By8Rp7pewgAu3ZR5xst1Mz35I9LuUWFIkBwmSeP4DIJ+
	S2DjOZ3Qw==
X-Received: by 2002:a05:600c:3149:b0:488:ae4e:519c with SMTP id 5b1f17b1804b1-488d683d505mr24113485e9.18.1775809618805;
        Fri, 10 Apr 2026 01:26:58 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d97c65sm16540615e9.6.2026.04.10.01.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:26:58 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] dbus: use ${PN} in pkg_postinst instead of 'dbus'
Date: Fri, 10 Apr 2026 10:26:54 +0200
Message-ID: <20260410082654.1963002-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 08:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234996

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

