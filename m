Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A69AC77B60
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:12 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.85699.1679605504716075067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0jJBmxSL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so3350047pjl.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bEk92H6auiqXJpyyA+uCbQSPDtuFJLHGs5F7jQer9o=;
        b=0jJBmxSLpgUNwyFdGKWVXq5Gdp6pW7M+9dKzTNDsryaKtmgmHMTj4NcVoXrQg4ggBk
         ciDVBAGpWBfgH+l6/zmLkPxYO6M8m3K99No2jUdyeEMPzoUEA6GjA44SanNpBGtTP7lQ
         JHangKR7w72SgSmN4ESW08omfhI0XjLHaIl7k/p13qMgE46RBp3f94Kb7KiTZawS3wjC
         RYm3eg1FattCHkS9ccggjEVw6/shf6KvDAi6aUwtclIaBNIHbn+0Tgx0lQYmw3ZS4tUH
         S2Ki0Jzb+hbumLGVkiMZuADFW4xPPZ8z5lWpfzFPlAZO2V/KkoKOobqpYzz/y1SVus4N
         57WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bEk92H6auiqXJpyyA+uCbQSPDtuFJLHGs5F7jQer9o=;
        b=vFaveNqL5KNky/51wwRmM5vG06zYCiMR7r0+JV3m6zHhKNe0KFc2iii1TGBRnR1hPc
         ReJOFo5NAfRlSFJ24hlV8JVNElLC2V92EqbJVtl0C5AWgoq7+s6HoFGaCwrG8M9aLoD9
         w7mKbMOcDeqg75qUkYAqWHet4D/3QXSDOaUCQHU05c5zWUTcZh6iV4vtcVt99zdDR/Ee
         lvS2HSb9/KK1kIuZGWxurbWS9sPv3cHVR5x26ZIkRHBPygn9zzD0u/Q3ug8Y5qpF+E6u
         9SELXkqqp7s7SIGv+Gy5cK0K8iRWgzCukJxaq/P+wmnhojxVE8pQNwe38wNcymnHcB1j
         Q9iw==
X-Gm-Message-State: AAQBX9ely++6tVkxkTkfWUOyifcDAl0HEMKVosm5TZKpSb/KgXAYiOb5
	A+SYBtNxlAipNPv5wp0TTIRjg9buYsmXYhn6gtU=
X-Google-Smtp-Source: AKy350bZmW2N9uywksnFs6HN8un8xTrs7JLLzzy57P8kxWuJf9ZV5MQxM4ZUtV1yRQrkKMGLbR8iNQ==
X-Received: by 2002:a17:902:e84e:b0:1a0:41eb:fdb3 with SMTP id t14-20020a170902e84e00b001a041ebfdb3mr336200plg.10.1679605503745;
        Thu, 23 Mar 2023 14:05:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/14] image_types: fix multiubi var init
Date: Thu, 23 Mar 2023 11:04:34 -1000
Message-Id: <0fce158e59918172b9e42558fc63342384edf657.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179000

From: Romuald Jeanne <romuald.jeanne@st.com>

Make sure to expand all MKUBIFS_ARGS_<label> and UBINIZE_ARGS_<label> vars
in 'do_image_multiubi' task to use them to init the local 'mkubifs_args'
and 'ubinize_args' vars.

See [YOCTO #15065]

Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09d05215cf61981c7bc828cc0ff64c2fd5edc43c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 960dab1a60..79081d9f98 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -187,7 +187,10 @@ multiubi_mkfs() {
 	fi
 }
 
+MULTIUBI_ARGS = "MKUBIFS_ARGS UBINIZE_ARGS"
+
 IMAGE_CMD:multiubi () {
+	${@' '.join(['%s_%s="%s";' % (arg, name, d.getVar('%s_%s' % (arg, name))) for arg in d.getVar('MULTIUBI_ARGS').split() for name in d.getVar('MULTIUBI_BUILD').split()])}
 	# Split MKUBIFS_ARGS_<name> and UBINIZE_ARGS_<name>
 	for name in ${MULTIUBI_BUILD}; do
 		eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
-- 
2.34.1


