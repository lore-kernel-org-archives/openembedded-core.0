Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6EEC54F4D
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43763.1785192997223966042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yTdND8Qv;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so34967485e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192995; x=1785797795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/TLKPNuTjlQqfuEtfQuFvKgecLuvF0qdtT9CMyAashg=;
        b=yTdND8QvpRi6G8Ry7rBTn42B/8PUrqetuSSZUEpACaiu0WPSWzB1tF/tmFf/VJRGSk
         1DIlrryTPvLF9EMs1vEUDp2zWBPN1WOUckWzbcxU+KB2kvAkY49c17fuS9bUgqRqrd7m
         kxkmTb3qs4sY7MGQxZEc7A836WwyyThju63FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192995; x=1785797795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/TLKPNuTjlQqfuEtfQuFvKgecLuvF0qdtT9CMyAashg=;
        b=iDqfos2tPIhm+pZMCH+QtkQ+3Q3/fiNqE8Q+g7h8/BR5bhMVPST64JLRKlnCGDsgQA
         ZSBX1sxZ3Z/ydLnCKIEoOWO6+hE0q71oJ5vHSeu4cdrCo1xec5s7CsO6WTgnQc5AGpqp
         R9IQtLcq6aDVpRt5RNLjER9O/tM4u+SnjvjXTn7rNEb00uQHzojz7G50T7MsR8bK92XX
         tnu1IgNUZSr2X2O1ZtEcv+PX7sFHLc/jFS5FaYg9sQFl3+V9BfZGHlIiP1ndUUiuWLm/
         6EgCAqeIHohQkHCbzaOA1WKVDUypFVu/4dE8UwGZoOycbbNf13BosfuTEj4ZHyRYiTBf
         kWJw==
X-Gm-Message-State: AOJu0YyNtMWF63a2kPosVEs1PVmMCS+0nQskboTloeJ9vr65oN0pFpQD
	9sL8x5iyKqOr7065PdPexjrpvoU3QJdg1gQTtuR7Ywk6KV76GuRBfZFbF9CbR2jL4OqZIOFr80r
	7Jk37GSs=
X-Gm-Gg: AR+sD13z7yYnhj2CKIRCXX59ZYgSQp7BLHgX6+akVHPsy5safSXW29Rkz+3Uj3f0D5U
	PPCbLdyly7cNCjxndkg12U9pXdVWVYTf2S2xv1U+3hClhqwGQHglRz65RTtWKWAdC9DEGNGfXYC
	kcaIcBmVo63aoznzr4XWHtuHlE0F1UROKblXOrpM88K2PI6fk9AmWDozOkJSNKXB14WNw3TDFL5
	3rwJQQPvm8qC3wGrJ0aRJtv1oqKDQZKgu8hqJR8/e6Z5/UFtpT3WtU1nnAF3AC2MORjhTWgyEv5
	rYJQtuyBMztN9z307LD7MCpmX0NHdIkFyUH1ErZCMjxNNKeUH8zHgAkj1vEpCgDT4FMQmxF7Pew
	xpRrjG8JUI30xB7dimXOd28MSgc4KsiWYAklYTArF3kisHjIwLCgluxHEIsdl55Ocp67FJYR6kl
	MFMccmZsyXFi4/GedRMgR7UvTdlV/wB+QNrWHlUh2G7TX/YGhVmpWHChSsYUkQL84WOtEq8G5N0
	aRGJA==
X-Received: by 2002:a05:600c:3e19:b0:493:a570:df7d with SMTP id 5b1f17b1804b1-496b5717da1mr115235185e9.20.1785192995469;
        Mon, 27 Jul 2026 15:56:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/36] systemd-systemctl-native: disable libpam meson option
Date: Tue, 28 Jul 2026 00:55:38 +0200
Message-ID: <a2e55ed1868d3ee0ea31d99b6140b78ded1e5e4e.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242141

From: Daniel Turull <daniel.turull@ericsson.com>

When building on rhel8.10 we got the following crash during do_compile

systemctl-259.5/src/shared/pam-util.c
| ../sources/systemd-systemctl-259.5/src/shared/pam-util.c:3:10: fatal error: security/pam_ext.h: No such file or directory
|     3 | #include <security/pam_ext.h>
|       |          ^~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja

libpam is not needed for systemctl task done by bitbake, therfore
disable MESON option.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
[YC: On master, this is done in "systemd: upgrade to 261.1"]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
index 3d01d60e9c1..3c0dcd35a32 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
@@ -12,6 +12,7 @@ MESON_TARGET = "systemctl:executable"
 MESON_INSTALL_TAGS = "systemctl"
 EXTRA_OEMESON += "-Dlink-systemctl-shared=false"
 EXTRA_OEMESON += "-Dsysvinit-path= -Dsysvrcnd-path="
+EXTRA_OEMESON += "-Dpam=disabled"
 
 # Systemctl is supposed to operate on target, but the target sysroot is not
 # determined at run-time, but rather set during configure

