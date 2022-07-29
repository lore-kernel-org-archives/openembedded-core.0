Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87280C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:18 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.60.1659106098117922605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pTluJ9NI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id x7so4799024pll.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Urno8takPBDmutpxXWKFrUMUwc4zhREL9F1zbcZuqAw=;
        b=pTluJ9NIui8nsHwL3Gan26t9NWgs0do5SNcWwAUgxeAtB6sA9FYGnbpe9q7p9XqYB8
         7aAJTKgCSJOCiae+Su9bcWAMDUZoOMIja2v4jlwPHMMho8H71mmcWi2MuFw/c0ZQpesl
         Pg3JJHa/gZfFH3LDm+XcotIDsMoib2Wsa8oxZLjMJMVMlvGHgEbw2kBkbmaQYjOYa3HJ
         cbVB+2UlK0HG53qpOG/d3hdPXTtDKAJXvoFMoHRoOb1BwXeUbxbjtBjMKNHU6AjBX0zc
         5NHyUopE+Q8vbYefpvyRu3BmAsOj5AF356NhqXgHrSju9h7P9gcXvt8Lg5jS2Ye5tJxY
         7UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Urno8takPBDmutpxXWKFrUMUwc4zhREL9F1zbcZuqAw=;
        b=fHrlhPIqz8h7bf0ysg9hic/MjFZY3u/35eUWCnze9DiakQewVam6KcyU/s5R/1Gcrl
         8/TBwQUmrw+jgKagmIbgfkr7SSoukkMlp7mSjXVMHq28xUFST9DUbFmttt9/8ZkSRwXE
         Ug6E5Nb4+vxJf8AgjVWMkywRR5Ex58mbVi/OqyCylQrqz7zWcpVdHiAIjcu43er/vPCf
         6ktgDRsjHO8HW8J3u+/VhN8dR2NI4Py7lNYskcfviji/lfJ2zd0JkJ2/mZ0p5X6qSWDF
         1X5jPiIrccyxiubyeY49jmh5EoQC3zA08gsx2xF/YtItdK4kB9T1sjvRCkqXrkklOkUU
         MYYg==
X-Gm-Message-State: ACgBeo38utaNzA1GCMF3UH8QkTDhjARKRTz8WBd2gw2kpNgc5mDYYHib
	9Kc6cK3OY8qcSvKkHAH438gyptX20MvCiE9R
X-Google-Smtp-Source: 
 AA6agR4nq01W+Dh/sWO0qWQKx4XA8uWLFChw116QKLqvClaN3y1mAJD/J9w2mq/92lOqeBXj0wBTvA==
X-Received: by 2002:a17:90a:17e1:b0:1f2:2ff2:6cae with SMTP id
 q88-20020a17090a17e100b001f22ff26caemr5232107pja.196.1659106097043;
        Fri, 29 Jul 2022 07:48:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/29] systemd: Added base_bindir into
 pkg_postinst:udev-hwdb.
Date: Fri, 29 Jul 2022 04:46:39 -1000
Message-Id: 
 <abff988d33dd6ac03eedb34c1f48c83b4502ee1b.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168658

From: leimaohui <leimaohui@fujitsu.com>

Otherwise in sdk environment, the base_bindir is empty and the path of UDEVADM="${base_bindir}/udevadm" is not correct.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 235b6fccd2a9ce4eb9bfb3be8ac271cff0ea5fea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 006b2f86ea..9923312830 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -779,7 +779,7 @@ pkg_prerm:${PN}:libc-glibc () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}"
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
 	else
 		udevadm hwdb --update
 	fi
-- 
2.25.1


