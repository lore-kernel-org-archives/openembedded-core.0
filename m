Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B355C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 19:51:42 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.517.1664999496236129838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 12:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DVeJsQ9Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id y22so5925325ljc.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=44/Uydsi1DdLC+foihtdusd41KIyiPeouiQeIlIqPYw=;
        b=DVeJsQ9ZUTpbOBvH1ry7E/TkB0MIFn+DYGFA2zpUTX3HP1CsEp647GAXoXv+OPCNVb
         M6p48yFX7uBv/lt30d/LIG5tZJ7T21oyiCTYtKiY26kKc9lYBZtE9eTQVKsa0cCrRY6M
         Mx/3AGboO4XkcRNrZu6ipX9uNMPiYQzgQ20nNWFBawEP77OClfYJV/9MbV7oj8uMD0FO
         fH6aYXrNe3xJcmEK+P2X9xerrwmvKyrXLLtqBxNoImqjU6PPJUwE1cILvYYhq81DHvHk
         5MTwVVoqHfUqTJRuN6uU4G3X4RnPRGF0EAU0L3uuiV3knx46yqoUdiUAfiq2VHgJzk8q
         JSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=44/Uydsi1DdLC+foihtdusd41KIyiPeouiQeIlIqPYw=;
        b=wNlCA3m6kS2P5XQkRh2cNaDhxrG0oJsHDrBUZYD/MVjERC2gZyrNzXz7206Xl2sbzF
         F2Pf2F32jrMcZ8AUum3dT+/A8uJmEjhV9l2M08DJV+krBSTtKOmag6lqhTkTZC7+yu3v
         vnE+3/7UoGJIb9KCzjJmdHmuDfano08D6PVrMoj2j63xHCatumnPoexzAvVDbQFi2w0O
         UWiJZNMn5Dy+oNfdPeb70fhR5wfxaLyXyN1djY07GUN9CYESJPgXafa1nDW9AophpwZB
         psPpKgPfTnfg0kjwc3UN5BnOsYaxWTOBMZP6kz0IZVUjuVfeD5rFAPXVo/9rPaXWasZE
         GTJw==
X-Gm-Message-State: ACrzQf0HGU70aDBGflAHV9ug98bIHpuwefDD5ROovXGC7ZfsnKB0JggV
	edEHQBpwT89RMYsDDVkwXIXircjMB6o=
X-Google-Smtp-Source: 
 AMsMyM4YLUZDgmS/QafquRpzXt3e2yGIK1eDEV9/3DLXfIS6aCmXxYxuFE34wh0NCYSsb+Nl+xYgZQ==
X-Received: by 2002:a2e:8054:0:b0:26d:dba9:89f5 with SMTP id
 p20-20020a2e8054000000b0026ddba989f5mr481305ljg.2.1664999492760;
        Wed, 05 Oct 2022 12:51:32 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 q3-20020a0565123a8300b00498fe38ea0fsm2450785lfu.174.2022.10.05.12.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 12:51:31 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3] bluez5: change configuration directory mode
Date: Wed,  5 Oct 2022 21:51:28 +0200
Message-Id: <20221005195128.9978-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 19:51:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171477

From: Ming Liu <liu.ming50@gmail.com>

Change configuration directory mode from 0755 to 0555, this fixes a
following warning when bluetoothd starts:
| ConfigurationDirectory 'bluetooth' already exists but the mode is different.
| (File system: 755 ConfigurationDirectoryMode: 555)

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..9f5c78b81e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -82,7 +82,7 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
-	install -d ${D}${sysconfdir}/bluetooth/
+	install -m 0555 -d ${D}${sysconfdir}/bluetooth/
 	if [ -f ${S}/profiles/network/network.conf ]; then
 		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
 	fi
-- 
2.25.1


