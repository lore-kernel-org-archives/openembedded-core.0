Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA59C4167B
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.4573.1670539395794626342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1ZeR0oQ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id k7so2974426pll.6
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VjUrLWHjDOn+FSgBCOhNF0LGLCsaTyqOjzlSYi3zo8=;
        b=1ZeR0oQ6DksMn0WF0DcdjGa7ZLTAYNCayG7Z4mjvedrHWppNFU40llp9CxDCt0Y/4z
         JiVyH5a2xaJcokC9rXwI2OLSoriM95hKHcs1lmv4vey7VaX38Kp+T6AausD6yWgI5bk7
         MnYFMYYd7RN0XKSlpPNjKX6jR0m8u0jvvP7Sp+mDPRN6iKVstl3t9aSth7cmGyHEkqKG
         Om/Zikf4OS2CJy4J5b7Wz+Of7UDnmNCLzelVldHlZ36oNtyMS2FbYx+V6+vPW5lisgbg
         QG2cuLUs+yml7/4mxP0w4vpmQVViMg75cfX7I0QrOjphTMJr8Qskh9B1bd4Yf7UMXur7
         D80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VjUrLWHjDOn+FSgBCOhNF0LGLCsaTyqOjzlSYi3zo8=;
        b=Bv/ec2ZK4wKXgKSOyNidZT6U/F7w1XLE4ZZUoWAwgqsTVUN9ip+vctfSLXp41lcgT3
         NDRORyaqtWyDz7NNRQQ+p2yXDmlxHpor6OWggMqlBh6CRBkFIO2v6EVXzc5wKALlmXPo
         Gs/fkc9EvwLpOhE7vEgyfjmJryCc6/Rkt+kUi8CLg8odO4xjSwZcTFrApVd5TINs/hIk
         aTLLQlmvJ+EdkFXKyP6pG4O10wcKrPaP4Opk9sB63fnbV0bY7I8mTr3nKBXMLFGeJbkP
         OvdKuvG6enoGQ2LyZwETJO2eK/cjhmX7Gaw6yies3UKlKEkO10XbhyqKsQelO6WNS/j6
         DJpw==
X-Gm-Message-State: ANoB5pn2Ib0Bkccwxp+99VOC1qXXBOJZxSXI2CLQ5sXlVptxjAekIaNh
	s+3nOY7MqF2NCOkBFOe7MJse/GcbDmzGlZQ1bkHl6A==
X-Google-Smtp-Source: AA0mqf4fjPP/W6w1IM1p0/BXwqspR2syV8eWTm5iq6cZ+ND0OIMY9rSSKbcz3mkiRCOl9NCraGLGjg==
X-Received: by 2002:a17:902:f646:b0:185:441e:224a with SMTP id m6-20020a170902f64600b00185441e224amr3529422plg.69.1670539394857;
        Thu, 08 Dec 2022 14:43:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/12] opkg: Set correct info_dir and status_file in opkg.conf
Date: Thu,  8 Dec 2022 12:42:48 -1000
Message-Id: <a6cfcaae94ab5dad9624c145961bb2596cab9f70.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174420

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
 meta/recipes-devtools/opkg/opkg_0.5.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
index e91d7250bc..7bddaa3016 100644
--- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
@@ -46,7 +46,9 @@ EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedi
 do_install:append () {
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


