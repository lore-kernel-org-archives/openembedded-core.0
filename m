Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA86BEB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:34 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.3841.1688092171709831120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=35JDPQ4h;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.178, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76714d3c3a7so129242785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092170; x=1690684170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=292khqxXs7AiGzOzqLp4IJaDkAdsGs4KNNCxDj4g/w8=;
        b=35JDPQ4hB8/FKBDwe3CuvPA1cHtcdKkC7A/zUDJgqMm1r1KBfEJBU82fO4KxNvsi3r
         nIF2DgguAVfqiofWOwGycTj2Xl2U5Z10lzmkqOJ6jJfgzXXQgY2N4gw8495gLJI9f6Sl
         SELsT/vTQpOHjAOcMbMTmLgWCTD5sTJ91QQ4DQ0EJ1JN2V8hYhXihjzLW2Kc3gaF6hL1
         /Z7dU7Gym27nf0V+FrWiE7ODvWgjvme2qohmejqRLCR+RuHaUSDqtIcutALzrbhcC6rw
         shcBfMF0mpoxDhc+iZoUThcETk8aF8U6rh5FApWosyDCZZ/WC3wTdPZn7QpyRQFcUfy4
         0SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092170; x=1690684170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=292khqxXs7AiGzOzqLp4IJaDkAdsGs4KNNCxDj4g/w8=;
        b=WN6AXXvOXegrYqHJvOgRD2elV1zxTE6+Jm3ZjBKLhk0HxBJdrTqatm/1woyaOhpUOa
         Gu9AqWLGO6Veu2r9cmtuIME+xDAyOUOA/ESDvPdmjQLA1ACSg14qZk0rJMufpApVEayL
         9V+Hbn2ZlRF4LJ6SG5G8JWen8pjRlVgBz3L9wuy9K1VjkGM9Vsr2opjRTISi3asA/IR5
         4KnPs2KoQCwEMKVJityROLVCFUCw9NK6j/481oW+1XXddSFy12xjVjHZr1ZC/YgUZY8W
         +/xPSXczRCsdBib+cE4v6Zf8tP6TKiwd2PgscHwNeHHQUsZAe4p+AC0NACCCDlhRUwVV
         ek6w==
X-Gm-Message-State: AC+VfDz99qJAwytkPO5IpGwAUob+FZr/jBftiC+xv8TVcT9nh8/D9iL9
	C+vjvxQShTnpoJly3QUyXE1sj/e5f+MPlz10JCSNWA==
X-Google-Smtp-Source: ACHHUZ6Ua+5hB+v3tXl/RP2T4bcmyaXdgjpXs2dB+ShQWC/88cSJ3lNfZLn66EeOeQiSxPsw4KlDZA==
X-Received: by 2002:a05:620a:298a:b0:765:4e18:927 with SMTP id r10-20020a05620a298a00b007654e180927mr1296615qkp.39.1688092170441;
        Thu, 29 Jun 2023 19:29:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/30] weston-init: fix the mixed indentation
Date: Thu, 29 Jun 2023 16:28:47 -1000
Message-Id: <24fd8549273c08693078afe17a539e461a898deb.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183651

From: Randolph Sapp <rs@ti.com>

I know my text editor is going to get angry at me if this continues.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da6e01517336694911f5aea53d637e9c0ad72c9b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 73a20a7194..6d1bf7a698 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -25,19 +25,19 @@ DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
-        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
-        fi
+	fi
 	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
 	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
 	# Install Weston systemd service and accompanying udev rule
 	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
-        if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
-        fi
+	fi
 	sed -i -e s:/etc:${sysconfdir}:g \
 		-e s:/usr/bin:${bindir}:g \
 		-e s:/var:${localstatedir}:g \
@@ -46,7 +46,7 @@ do_install() {
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
 	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
-        if [ -n "${DEFAULTBACKEND}" ]; then
+	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
-- 
2.34.1


