Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04E5C44532
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2884.1784568210238721983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=veMeGcj0;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so11201865e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568208; x=1785173008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+KpHUrZddeP3xTR1+NXLyDohs/Yl4q62Ouiixjfg78=;
        b=veMeGcj0YV6Q/UcxG69/sw6TyjfC0LPIi8o5zQ09reCzFbWTliwqIFl1LIyuq8ohJX
         uF65ncTCvJTMvn4pZzWoV/+jR0l2qCJ7let+8v7SFCJhQ6Q+9qjagNdxyhEtETmr/DZa
         q8RgvuMxE3XxDxT0+tmfjjfnE9iHU61A6EXC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568208; x=1785173008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U+KpHUrZddeP3xTR1+NXLyDohs/Yl4q62Ouiixjfg78=;
        b=sGdsa6R1rgTYpQXoTUm7A1XkPhFRxTTiAtd4Mq8+bg72DjFUrlEh86CW9DNJLaqRmX
         Ls+ZZfm5NW4TXTcl4dPYnus3pchloXF8EHKYskGNKdiwAnH3SJU667oDO6Px3BE0NJWs
         HGpsPmxFAJfLtnbCkmpJW6CMGu/+Wkg7MeO1ByKo+r/f9pS6hQ06/qnwjDDfzlxXocYC
         L0XFXdjd4NhU1BXpsGdsBwkDIg2GDWn4KSc8zin8JhgmtolGQadBepxcgTj7p2trNcoo
         rnzIbd+MelUoCT2lw5uR8tvI0YY5ebdCLHkO9LK5HgvjHJvq6vYOeGkh7I6BHvRsOhJT
         2mSA==
X-Gm-Message-State: AOJu0YyDk5TcM/ren8ycMhld5BeNVRJcAVBKz9zbcZvpdf/kEZ7BHdYp
	17DqlYeKtRSZwfqLHQOOzhsFW97YpQfGucyLNdybouCdO5F15dzVuGjtE4Iqf+1zslNkDebFUpB
	8980oZsE=
X-Gm-Gg: AfdE7clTccMVg8+yEXpktIYwM1//3muQCHMBJ2DSr0qU8cUfYRI3zBwXUbZ3c9EOfcV
	oCAu/YpM1FSJDl9Lj0bTNyvkZm+Xsc3KUT5kv8YEl2uXI2eb9a81Qk8ReCR3IN/uBqTVxIXxP6L
	USavXbHqAZmU9godaN2KFW/H3vYeoUeJQDcxf5knhQICNpHrch5oSAdNwovmKkyv/kppTZpew+2
	+q2Mr8qmm9L0CTrjqwuZ5taS4Iyb/Y3IYA2OnlL/HidC13G6AfU/TzBz8TwPu54aA4OWrVqxzAv
	UkXBmiD5fgHi3jEd41x3D/+CjkWjntEtmv1ZXxSp/KhSNWA6aULTFp8OePeBbADIhS0cI0QHDKx
	fY0kssI77Z6thrC2mnLK/nq0g1WUnC+IO/kGgBi9abDDgMa139jkDMlbdGTNH7Y5ulMOrZrgyiC
	axlExtjX0LbzwN4ByPgx25HflgVq4dwvcigO0eCpIPDhXHdxrtIkR8ejrpxrZ89rdw+kwPJLvjN
	mz6d0P2
X-Received: by 2002:a7b:cb95:0:b0:493:eccb:8cb2 with SMTP id 5b1f17b1804b1-4954a514021mr125227855e9.30.1784568208351;
        Mon, 20 Jul 2026 10:23:28 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/33] bind: Upgrade 9.18.44 -> 9.18.49
Date: Mon, 20 Jul 2026 19:22:36 +0200
Message-ID: <dee1f392d5294bc5a228ff185bd0c105243a26d4.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241437

From: Ashishkumar Parmar <asparmar@cisco.com>

This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-2026-5946 and CVE-2026-5950.

Changelog
=========
https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html

The 9.18.45 changelog includes a Python 3.10 requirement change for ISC's
upstream system test suite, but OE-Core's bind recipe does not enable or package
that test suite and does not inherit ptest. This change is therefore not part of
the target build, installed packages, runtime dependencies, or runtime behavior.

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bind/{bind_9.18.44.bb => bind_9.18.49.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.44.bb => bind_9.18.49.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.44.bb
rename to meta/recipes-connectivity/bind/bind_9.18.49.bb
index d424edcb4e2..723a09e7395 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
+SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

