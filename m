Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2667EC4708D
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.14922.1671202699953939964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rBZAlPHM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id u5so2707589pjy.5
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mDEWgms70O7khCpRrOwjQcaEDRlKkzed40lNgULGHQ=;
        b=rBZAlPHMtzTwiDwr518qiO2mOGPAPTZcQL6Yq9/PbqEJxqQVT8TU6aUJN16AWjKqna
         GFZAapetZXLJt70fDFs+/jOUtjtpZL1U9omk0TjcK8qNhn/q2567U8SRdc5c3nBrWDk3
         8a7oPiE0pL524Itoleqrv+0Jzk2ETcJeUhWu7u9a5ZZodp117RBrRg/JmrJOjpOGOikE
         96Fl/x3vtrz1j5BdZ242s0z7srYNWcHXBYW9JN7r/KLNW2evh8NhplXb66gJ7k9jn4M2
         7WxvtfQ0fDVlM4EHPIzD0Xaz5bX4STrKRkztJkL5sOUXPZuVKbN3CAgATPa7jQ+NgshD
         VPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mDEWgms70O7khCpRrOwjQcaEDRlKkzed40lNgULGHQ=;
        b=2ugCqOBqmtYTmSE2aGvGjMtQp5KFiNRDU6P7rXFWxV55GjHsNKiampRwDr0mHNymSG
         z73YSEDK7+VMNoE/uKJeFa/HCFYCmmgf8yc4aDCDxjswMILqg2wORAEgIMe/FvzIyGUB
         87BWWcuI3eNPUo2Jv35zpUJUKCUQDJBZDTd9tm9ufA4fwsNIMH37lHeT5KFsbbSGsoHd
         gH82/cKqXhUb3QJs6o2aJCO3TqfVV+aUpp5afr/CKaw0aS08zwg/9hGBwMFHJJxqXJR7
         RnzKjGNlFKGvdbFzc4h9CWMpaJnLVwbT4GUrE93elWgsHW9Mhcze156IN3FXBUMCPQsA
         LMpw==
X-Gm-Message-State: ANoB5pnMqPOeV/7mwyejSEb0cITNmsRY7tQXTEmCJy6n24ajXBxOYyKG
	jgtB+YBH94IgnG+p1W3K4msj15A/yJlBxqv9SsM=
X-Google-Smtp-Source: AA0mqf6gdtNdAeqUUiD9CT8aDMKERdnjGZOZqfZpeiqSNamelqgoCtJzWjrQQ8g7hWFGFtJBjFafMA==
X-Received: by 2002:a17:90a:4681:b0:220:bc30:a19e with SMTP id z1-20020a17090a468100b00220bc30a19emr26935098pjf.32.1671202698865;
        Fri, 16 Dec 2022 06:58:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/13] opkg: Set correct info_dir and status_file in opkg.conf
Date: Fri, 16 Dec 2022 04:57:49 -1000
Message-Id: <38224b19bda2592705ef4274c28cb250d9e980dc.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174754

From: Harald Seiler <hws@denx.de>

Distros can customize the location of OPKG data using OPKGLIBDIR.  In
OE-Core commit 11f1956cf5d7 ("package_manager.py: define info_dir and
status_file when OPKGLIBDIR isn't the default"), a fix was applied to
correctly set the info_dir and status_file options relative to
OPKGLIBDIR.

However, as the commit message notes, the opkg.conf file deployed as
part of the opkg package must also be adjusted to correctly reflect the
changed location.  Otherwise, opkg running inside the image cannot find
its data.

Fix this by also setting the info_dir and status_file options in
opkg.conf to the correct location relative to OPKGLIBDIR.

Fixes: 11f1956cf5d7 ("package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default")
Signed-off-by: Harald Seiler <hws@denx.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit adb939ae3635de6e02208859fbf29cf0ed39f565)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.2.bb b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
index a813f7258b..55be6547c0 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
@@ -50,7 +50,9 @@ EXTRA_OECONF_class-native = "--localstatedir=/${@os.path.relpath('${localstatedi
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/opkg/opkg.conf
+	echo "option lists_dir   ${OPKGLIBDIR}/opkg/lists"  >>${D}${sysconfdir}/opkg/opkg.conf
+	echo "option info_dir    ${OPKGLIBDIR}/opkg/info"   >>${D}${sysconfdir}/opkg/opkg.conf
+	echo "option status_file ${OPKGLIBDIR}/opkg/status" >>${D}${sysconfdir}/opkg/opkg.conf
 
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
-- 
2.25.1


