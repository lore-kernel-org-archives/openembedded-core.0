Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F78DC54F46
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.10408.1649768609286446090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eeaYAnHc;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id c7so27713419wrd.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfRV40C6KG/+tMl0pxC9PQpj8XX/lNSSi8+XiGwqlS4=;
        b=eeaYAnHc9pAy8Huxq94XkwsQBWsYWVjH0PVPCoL05jPFOsF0RQj6eC2MUyh7HOmIwk
         fpHmW8LZsGBHFpboAz9xTSJmmVKPl5i8LJENjPtF3J+5hFS2xjE5hVEKqEkDJsWOlV/4
         7ShH7QuhBdPZw5z7WnRcwLt6u4RmCoNcvyuXvF0K2md1Tg7IhmDQWN6OqfKW/afSxjMS
         mAka1TJ1qfYFaXbe10uzOUAhcRdra6Yv6eAkpQdackPZ8DZ3opN8isgohvbHnoE0EGxb
         Y6vQtinOkxCHxqCC+74XSa3iyIhY2JsQwptZINJTeNsY0C7hH5OJx3BaFVzZmENNnzN8
         lWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfRV40C6KG/+tMl0pxC9PQpj8XX/lNSSi8+XiGwqlS4=;
        b=U4GvBNT3F/i+FT3yDQHFUNpMIKF9a72zw35pAbYRWjMJ5Edyb3e5N5K8o3IWKdfGxr
         EuTv7pMEL0P79H8eiLfBCGY3nRR8DTGMPlbRfvCs40KsvOybW53UAn5x0YEuTd6MX3/H
         6eiNcb7op/iFH4NUyAfOyt7dFCC5W0IbE8wlquw5g4pNko1VY2ESwGrHbknGGzlq75AS
         BzQ5ZHMqndPUiN7MF8k7k93pL9ugWsEg5AG1IzbI74pdF5AKCq8PeuzbiTOYjVcqGsva
         OTimCqcRjCDw7pgAcnLRruiP09ik/wILP4+6iU1oblVdhtfHmPID49FJqa7QlYYHn1in
         fwEQ==
X-Gm-Message-State: AOAM530gTHuoNPu3mf+5gjctMAMuiSBdXny9+41hSxbpRREKonHPwJ3w
	FVuEu4qS3BIwwNGlo0vV3/Sn9erlMYM=
X-Google-Smtp-Source: 
 ABdhPJzPCf9nOTP4uMc2PGV2kKfD/+IK2tLiK+AXF4wsIQEYI6uc1sZ0Q+Iini8yN3BAY+dAF5kyxg==
X-Received: by 2002:a5d:6981:0:b0:205:e04a:e20f with SMTP id
 g1-20020a5d6981000000b00205e04ae20fmr28813120wru.6.1649768607277;
        Tue, 12 Apr 2022 06:03:27 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm2372953wmq.12.2022.04.12.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:03:26 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 3/8] wpa-supplicant: Use PACKAGE_BEFORE_PN/${PN}
Date: Tue, 12 Apr 2022 14:03:10 +0100
Message-Id: <20220412130315.25917-3-alexk@zuma.ai>
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
 https://lists.openembedded.org/g/openembedded-core/message/164267

Use PACKAGE_BEFORE_PN for packages which need to capture files early,
switch to idiomatic ${PN} for additional packages.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../wpa-supplicant/wpa-supplicant_2.10.bb                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 6c378d532d39..dabb3ccbefd1 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -96,15 +96,15 @@ pkg_postinst:${PN} () {
 	fi
 }
 
-PACKAGES:prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
+PACKAGE_BEFORE_PN += "${PN}-passphrase ${PN}-cli"
 
-FILES:wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
-FILES:wpa-supplicant-cli = "${sbindir}/wpa_cli"
+FILES:${PN}-passphrase = "${bindir}/wpa_passphrase"
+FILES:${PN}-cli = "${sbindir}/wpa_cli"
 FILES:${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
 
 CONFFILES:${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
-RRECOMMENDS:${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
+RRECOMMENDS:${PN} = "${PN}-passphrase ${PN}-cli"
 
 SYSTEMD_SERVICE:${PN} = "wpa_supplicant.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.35.1


