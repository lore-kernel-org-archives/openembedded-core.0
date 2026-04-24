Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D23FF8842
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:01 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31985.1777064221111642803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gPXLIoZY;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso82759575e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064219; x=1777669019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KEGucQrC+D+Ec2u9MEHdXh5qJyAQ2btdwMUY0kh59w=;
        b=gPXLIoZYlpZ/BoLHXZqAaawGqXT2906dshEEq7kyHSpmZ6AmyDJcvFuBWY1zC9txtr
         ggZYGLtHmZvXpMsO9XYFNleqmLj6H6tEN8DOXq/PDlyc/ZBXHGRRODfSwo8v2d8bwW2s
         347Yf3HPL4kZSSqtcIfNbfPfpe8b7QVq26urY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064219; x=1777669019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8KEGucQrC+D+Ec2u9MEHdXh5qJyAQ2btdwMUY0kh59w=;
        b=RpCo13zrGeJhV52aqGJQH8Lr1ph5yyQvgpAaqi/0ABsXXOeCyp/yHEOMmb+UubCLMq
         rGQf2mfbxNHHZaFoh22itBZiPxjqmDCki+6ayyruRJNlurPsv25OS5IolJG/LGLD8+VG
         r6NcD3py2ruouhTzrk0XjoHlReT26Xi+vtbCMOYJFIu2wHH+h0cT9MyirDe7+3gWhsEQ
         QG+rB/DhZY83/viY2auu+Ozm2CRmy9/zyXOLa1cx4pYmPIY1JpMMsL1z8QP/ikbRQsXn
         T3VAVeghvk+8ZQtEcat9FUuVkPRjvje6maTRPsjN0D/RnMkFr2kFVS1P8rXb/ZL72762
         l+qw==
X-Gm-Message-State: AOJu0YyqEbtxDaxZZrabgEsbkcXe6vtLjGhWmOzYoauaEeyHcJEUX0Er
	HJEsUVGgOulgPpWXBtQy/ZqvHY6x63Vj1nLxRiw4af8ioU9JaTttIhz4TxGcI8KyWqqX4YoTLi7
	p4qI3KzbNVga4
X-Gm-Gg: AeBDietKUVqwBHQBGdUU9z0Bk5w70GonfEUeGxCfATpXGloNnh/GDEBWyKDFSZhLa+G
	+TkqNZRoyK0mBWFa+DsmUsvO1EJlz8NtAUrY9sbT4Q1XDE23B+w38LEbcrpCTWBF0uLLbPvzkEA
	e0PVriXAzQcfcjqTR11JnczJDssPP44lf+RjmiEGpAqpwiTIJz+Z3oQ+A7gcHg/Y1eplr45GG9j
	DaMGrJNxWowVAXe1UokFpMqIZAu4Svjs2/6F1OQCKEF8ot805Lp2wtw/r9cVzFm9BWpcTxtoNAY
	wxDfvQSqY6WcFJfE8pVkHeB/a0C5oGKLAd28lXELW2Tfqa7t5Eyektrol5ejS3Ph2+nsdKauQ7L
	W4wu7dYaEvnpe5NM9zLyh99FhSom6O2jenKQDKbLgHRFJlBCi9QHn5gKB+/9dUsfqBqzz6YcOJ7
	7Xb9HPVWRiRKuTkT49lqKXSaajG6oiYhFmbZuR+qXBXYFv6V32jg5gzdqUv2C9dTPwk1iZbLaS6
	RC4f3BjmcljEQWaghU2Nva+bNTqdKVttygEjQ==
X-Received: by 2002:a05:600c:4e0c:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-4891d7a463emr322520575e9.3.1777064219254;
        Fri, 24 Apr 2026 13:56:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 40/66] dbus: use ${PN} in pkg_postinst instead of 'dbus'
Date: Fri, 24 Apr 2026 22:55:39 +0200
Message-ID: <41a581f420eb69e86e30bbb7dfd1d1ec39d55334.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235913

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
(cherry picked from commit efec0447c8e8a6003f00642b33a71ed94fc4ec82)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/dbus/dbus_1.14.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
index 4fe7af7512b..ffbf0780ed1 100644
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

