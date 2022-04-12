Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9744DC54F65
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.10370.1649768613107088727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bzgPaG5M;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 r133-20020a1c448b000000b0038ccb70e239so1724998wma.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a8FBMcbYrkEmYmnXOb3e7WhbZQacIOtHVl9bqRrP4R0=;
        b=bzgPaG5MFLEo1Vovb6Tk8+4BtyW+72vQ0PpY7pCMeLTQ1Bjc4WBLQsqPd9D9ES7fYc
         8okTRJqigEpKFYWm1gjaqza1lWs9Q5UPt2E82pxWIMV9GVYq30mtzczYLgweprwuugtS
         0WNKG5mW/kHpMWnLSzBAJEqeIpgKsS8tCrvID7eyQNjhgnYAmCacXv4+ohGL5wS7+WoO
         Y3dU9863U33MADNeToi2i2oj8e/CbR7Zzh57pW2z5yzHO0VJId5x0L5m9TikP5uRvf4d
         oZxDP+PPQAXgIgQq/hjMzhXHV3FTbbLTOOyHasxozfaUzr1ltZNE2IOsjerYKCnSv9rS
         8MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a8FBMcbYrkEmYmnXOb3e7WhbZQacIOtHVl9bqRrP4R0=;
        b=J6qBthgnH7VmXNXBJzrgtfV2sqmDZHmOLIoIuIL1g0CBwkOTvTXUvavHsqkxsBXMfm
         icair/UY86ZL0JVNcM6O5MahxgePqjAYN2n6zKnTO/nYtyylgL0fvn5M5qgSkeVc4gK1
         X8NyNj74nHI2F+nYlAxBISkt4nL4wji5i0YArTTk09oYD222cgpA9PshEqjeTmIOGu0f
         DJtEGCAAUZcZEXvHcxR3mK4ksV6mSdtUiHoBDg5Xp33BqcMvnMC18Cm9ImB1tjdQSa7A
         usKlPOPfBrCe94BghUqHXTrywve1clqtuqMFRwPGDjePxxXYMhKERpTN5qOv/DdSw5oP
         n2tQ==
X-Gm-Message-State: AOAM531ga+rXzjAOI/1+Z34xcCbdsEK1XxgXZ56pYMYpvPvErRObUEY+
	Z7YP4ordyTixrSoNl4XQykVKxu/DU7U=
X-Google-Smtp-Source: 
 ABdhPJxNcZyeUNX/sbh0q03nor2ZxjDgA2Jm1vOPgmw+zizNqRbXIjvtCrJuZuhCDopaMSW0OPOeNQ==
X-Received: by 2002:a05:600c:4e52:b0:38c:f41f:3718 with SMTP id
 e18-20020a05600c4e5200b0038cf41f3718mr4171087wmq.101.1649768611472;
        Tue, 12 Apr 2022 06:03:31 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm2372953wmq.12.2022.04.12.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:03:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 7/8] wpa-supplicant: Simplify build/install flow
Date: Tue, 12 Apr 2022 14:03:14 +0100
Message-Id: <20220412130315.25917-7-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412130315.25917-1-alexk@zuma.ai>
References: <20220412130315.25917-1-alexk@zuma.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164271

The build/install steps for wpa-supplicant support CFLAGS and an install
target, so use these rather than attempting to do it manually (which was
broken by upstream splitting into build.rules and lib.rules).

Note that this installs wpa_passphrase into sbindir rather than bindir.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../wpa-supplicant/wpa-supplicant_2.10.bb          | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 51ec5004852b..861855e4851b 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -30,6 +30,8 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 CVE_PRODUCT = "wpa_supplicant"
 
+EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
+
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
 	sed -e '/CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
@@ -44,12 +46,7 @@ do_configure () {
 	rm -f wpa_supplicant/*.d wpa_supplicant/dbus/*.d
 }
 
-export EXTRA_CFLAGS = "${CFLAGS}"
-export BINDIR = "${sbindir}"
-
 do_compile () {
-	unset CFLAGS CPPFLAGS CXXFLAGS
-	sed -e "s:CFLAGS\ =.*:& \$(EXTRA_CFLAGS):g" -i ${S}/src/lib.rules
 	oe_runmake -C wpa_supplicant
 	if [ -z "${DISABLE_STATIC}" ]; then
 		oe_runmake -C wpa_supplicant libwpa_client.a
@@ -57,12 +54,7 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}${sbindir}
-	install -m 755 wpa_supplicant/wpa_supplicant ${D}${sbindir}
-	install -m 755 wpa_supplicant/wpa_cli        ${D}${sbindir}
-
-	install -d ${D}${bindir}
-	install -m 755 wpa_supplicant/wpa_passphrase ${D}${bindir}
+	oe_runmake -C wpa_supplicant DESTDIR="${D}" install
 
 	install -d ${D}${docdir}/wpa_supplicant
 	install -m 644 wpa_supplicant/README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
-- 
2.35.1


