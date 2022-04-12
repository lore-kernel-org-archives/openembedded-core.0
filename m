Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D273C55187
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.10333.1649768614223227351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I9sJ0Qg5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so1577353wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+e+e+c6giU8+/CveI638i2Svykrf/1O9VOpaoZmyWqo=;
        b=I9sJ0Qg5R5OSjSUJj1fTTOsJ2KaU2kP9IJ5GQKqfILpAzvtFAfxTwIxjYRzYo1cC8F
         DvQSU/2xaBHP4kBjTZRo+wJeHMWDGaqK3YtRtRraEZkDEiZUCU5mIAKiL/LZ/5SAyRKN
         /50PZnaItuSvU9p/D6EvzeNmYYf+Ck3xQVgoz3jqTCbvRjaKVqDopMMvdRAHxOXgDipe
         SUjM8RMjs68ij7+v+mYtevkjhPbqpxXIMINI+cuvIa+YMy21SK1XQjfTxwZUCZpU/NUK
         HrFYDOFc5FiJuqtdVr+V126vRhPs+Sn0JGZjlgNvui1CutnFhtSzZ/yvhK6NIY0yKjva
         p0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+e+e+c6giU8+/CveI638i2Svykrf/1O9VOpaoZmyWqo=;
        b=u4SSjmRqyJJKIFQp38XY2zbp7alMQsWr35KLZlEkZqJNooh9b6xOTru3nu34Vp04N7
         +GWqhFIPJ/7tHIalCCKn/t4fbhOsjSCDjPiF08WyYbRKsZ4Nil3mp+gn+KMSUEhHI3Pe
         dvb6YpPvTHlkNpEgVA1gHlew27+1W8UG5fzWPDkYyl3vDQ0dLO5gCzqA2M9jhPue3juK
         lvDPcN2e4VDrw9A+sEKoAeSD89mov4BgnjHiZUmqCTQ/AbAFqt5mObrrITJhtCNKN9iM
         EEQbLacC1O3g8t8T3jka47P8LQ7E+GO0B9CvTfjIWvG1YkchNJryCScAG4VaZt6+gfMA
         M9eQ==
X-Gm-Message-State: AOAM531YBJ4yHrptZouqnDxVE5L+4EJv1SFI4dbHba+YkdEZd4vq9xnd
	/GXbH2qh4svK5TXRIvXifVgbVC0hLGM=
X-Google-Smtp-Source: 
 ABdhPJywkY81MimHZ4LFGEqIlTyJlPtwt5BWiRgwjpmijZRpCRkAlITbivoCL/uf1QzfNBVLSCWk2w==
X-Received: by 2002:a05:600c:4f43:b0:38c:b270:f9af with SMTP id
 m3-20020a05600c4f4300b0038cb270f9afmr4093717wmq.36.1649768612358;
        Tue, 12 Apr 2022 06:03:32 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm2372953wmq.12.2022.04.12.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:03:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 8/8] wpa-supplicant: Package dynamic modules
Date: Tue, 12 Apr 2022 14:03:15 +0100
Message-Id: <20220412130315.25917-8-alexk@zuma.ai>
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
 https://lists.openembedded.org/g/openembedded-core/message/164272

If CONFIG_DYNAMIC_EAP_METHODS and some modules are set to `dyn` ensure
these are packaged as part of the build.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../wpa-supplicant/wpa-supplicant_2.10.bb     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 861855e4851b..e83aef70d554 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -98,14 +98,34 @@ pkg_postinst:${PN} () {
 }
 
 PACKAGE_BEFORE_PN += "${PN}-passphrase ${PN}-cli"
+PACKAGES += "${PN}-plugins"
+ALLOW_EMPTY:${PN}-plugins = "1"
+
+PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
+NOAUTOPACKAGEDEBUG = "1"
 
 FILES:${PN}-passphrase = "${bindir}/wpa_passphrase"
 FILES:${PN}-cli = "${sbindir}/wpa_cli"
 FILES:${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
+FILES:${PN}-dbg += "${sbindir}/.debug"
 
 CONFFILES:${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
-RRECOMMENDS:${PN} = "${PN}-passphrase ${PN}-cli"
+RRECOMMENDS:${PN} = "${PN}-passphrase ${PN}-cli ${PN}-plugins"
 
 SYSTEMD_SERVICE:${PN} = "wpa_supplicant.service"
 SYSTEMD_AUTO_ENABLE = "disable"
+
+python split_wpa_supplicant_libs () {
+    libdir = d.expand('${libdir}/wpa_supplicant')
+    dbglibdir = os.path.join(libdir, '.debug')
+
+    split_packages = do_split_packages(d, libdir, r'^(.*)\.so', '${PN}-plugin-%s', 'wpa_supplicant %s plugin', prepend=True)
+    split_dbg_packages = do_split_packages(d, dbglibdir, r'^(.*)\.so', '${PN}-plugin-%s-dbg', 'wpa_supplicant %s plugin - Debugging files', prepend=True, extra_depends='${PN}-dbg')
+
+    if split_packages:
+        pn = d.getVar('PN')
+        d.setVar('RRECOMMENDS:' + pn + '-plugins', ' '.join(split_packages))
+        d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
+}
+PACKAGESPLITFUNCS:prepend = "split_wpa_supplicant_libs "
-- 
2.35.1


