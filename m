Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D9ECA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:10:26 +0000 (UTC)
Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25338.1791220223861507357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=ShPSZyc7;
 spf=pass (domain: ossystems.com.br, ip: 74.125.229.169, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148b5c829e8so1904744c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791220223; x=1791825023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pnzg5lTjWXlAjxRpEooYWpaExtznjtqhI3cmE/B5iw=;
        b=ShPSZyc72GP2XBDfz72N00Fu4U/fUP3ACtEgKBspnjrI/PskBU8LZud+z4pYSXH+G1
         H4WlqVskKRN3+zEpqa4BmjYktlFFo/9dPRkSJNSuIIAfu7es/zYVCQuw1IEsY53gN/rr
         IdCBGJ37/zOcg5jdv/khj3cxjLiKNjGGItIAuBSYxFmPp3avOaikhyUYry5piyONpKTQ
         uFOazb9ooIZ429VEbCPFzyd7vcZ7fG2ZGHlEpWvPn5Eu/wb0rS5kO0MSMUs2Mp799RcP
         bYW+Y7hEHMdBL/uoQc+NNqeD/CIfaGSwArSU3+QU8N0eKlFC6rduOFb7gWv/E4CJNuyQ
         dIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220223; x=1791825023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pnzg5lTjWXlAjxRpEooYWpaExtznjtqhI3cmE/B5iw=;
        b=n/jgrrDQIkqCyhS6XKviVOEGNuMCyD1bkB8gTqJtKzSzgXzmg2UohGoV6LOhgs5m5t
         u0zfikPCNPslUVpHte+D46hz4a1En5OGQTwlgnAUMHq1GZjLjc1tJ7Wh0uQENTLbMLRz
         ygNlqLaYDSVojEDU3cVemxCkrZVsVZjDzIYLwMps6VEszlTRWu36jyXoPeXtP7b6MDZg
         E4up41sxTVY6WhUpNwPCbaQUaJ88WnLx0ZqxiH36ExpeBXZYMezQLnCM2eMF77oKf9vS
         GRZD/OfzNtyoN8svR9B9HVm/I2my0LrvwF8dV5BwDNYmBSmRltCr+0/7g51+c69HHKjn
         8lqQ==
X-Gm-Message-State: AFuF++kbsH0yuDRWkRvItElCEL1XeIEbGhWZRlM18uOvUSKWTfaXcBpv
	hsFDRgxzW8cVjjDdHwaPIzesRnjSUnebXO6CkFlgaQKjh7a++qOesX7J8oLzY0ax8/8bnuYWUaO
	m9Crr
X-Gm-Gg: AYBFou1QClsp9najOfsWWa+vwYdMJWsOyEFd25NDFgW3ZdSjoGxsQljZ/09/e7cl3cm
	F6Rt+Vv1y3JLUcN+mNx4nd2SIoYWidWCqpviMkIs0IosiToLxpbvgZoR/TFz1x1p4eX5ErjDXqW
	02Rb/8wODC4EAhF4BXwd97PSsAtYb5nWZmMZHnWiSu0bFjZ5TkrJJO8dvGPpEjIX56eqt8qt22U
	XftNYGQwZ3F8jU5zCdem1bywMlnI6fAdQlQJ3lYDTBPLWS+INhurDQnOaZaEBo9E2bw49Rw0LI2
	K/N00vs4o+kji4iSRCNXzq4AbIwx45Zkkob68jpDSPwj4RcVwPSsqA+A8mPtsygYgYy6q3gR3mT
	Y46nmzHDoDdvsvnz8wgQjwTIsSn3g5gOumygFnWjYsFpgRva0qZfvoqqMTOT9e3fjh8r84lx2zn
	SsVl6QuWEJ5JTlCa+QZzfxy/QxvEmwrCvR2x1nsR3dkNgnCWtVaBNHE0WDsjmNIdJEFE1iSa5BK
	Qt0GDHVyfa2rW5Bv10Rmcpth8sEdw==
X-Received: by 2002:a05:7022:107:b0:14e:9480:e5a4 with SMTP id a92af1059eb24-14f5c4ef00dmr22223397c88.23.1791220222981;
        Mon, 05 Oct 2026 10:10:22 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm25189110c88.15.2026.10.05.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:10:21 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 1/2] blueprint-compiler: Skip on target when GI data is not available
Date: Mon,  5 Oct 2026 13:54:11 -0300
Message-ID: <20261005165412.1120027-2-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261005165412.1120027-1-luciano.dittgen@ossystems.com.br>
References: <20261005165412.1120027-1-luciano.dittgen@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247254

The compiler needs python3-pygobject, which skips itself on target unless
GI_DATA_ENABLED, which also needs qemu-usermode in MACHINE_FEATURES, so on
e5500/e6500 machines world has no provider for it. Skip on the same
condition; blueprint-compiler-native is unaffected. Checked with
bitbake -S none world for p5040ds, t4240rdb and t2080rdb-64b.

Signed-off-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
---
 .../blueprint-compiler/blueprint-compiler_0.20.4.bb      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
index 5bd3a5439c..199a9b0f55 100644
--- a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
@@ -6,7 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=blueprint-0-20;tag=v${PV}"
 SRCREV = "31b62c24a72c1670d2d93dcdf2d130f1ae12778e"
 
-inherit meson pkgconfig python3-dir
+inherit meson pkgconfig python3-dir gobject-introspection-data
+
+# The compiler needs python3-pygobject on target, which is skipped without
+# GI data (which also depends on qemu-usermode), so skip along with it.
+python() {
+    if d.getVar('CLASSOVERRIDE') == "class-target" and not bb.utils.to_boolean(d.getVar("GI_DATA_ENABLED")):
+        raise bb.parse.SkipRecipe("GI not available")
+}
 
 PACKAGES += "${PN}-python"
 
-- 
2.54.0


