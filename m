Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279BEC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:34:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7726.1637321685497043651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lSDB0HI6;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id z5so41515763edd.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PxgXI4HvIdhBXkPogqU+q/zjPPOtrwy2CQsGM0KwWNw=;
        b=lSDB0HI6D4QuRfm7A1aiRwKvstxZpKGuH7ibzu8Z3GGMz3NbhSu8waFBEAB1yuupGS
         2+o6KgiXu7xt692zkWAjKkuqAGJdZ5U/D95SAgIsBJ0lL0ZVs5gdMtTjwurAT4bLK7BX
         dzkJLa76lR1/BnreuBcE+vUtDfZfB8T05CtHZdm2dqrE+Vz+hQxFnVFeDyu6G+7xKQzh
         xfN5eSQ3upF5kCU7sPqfJDRgHJgYYO+fRqA9gbHvJFE36QOKY+ZQYkGE0tznJBu0eTQL
         FYCYk1nwj+CpSCX1Iel5iY+4teDxAW6C4ct6oIa4F9QEuQ7o2NOyP3+q10LR/CJWq3CC
         I4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PxgXI4HvIdhBXkPogqU+q/zjPPOtrwy2CQsGM0KwWNw=;
        b=WX2GSvtMAwoS2FUMNIBYZsVYWVVgj1r1ON/RRIIKMLgrZCxwHL8hrUehMg1XR+vQw5
         kyuowIZaLvDYzuhe4OosqMQ2tZrYmLY+secq0az1X+5UMx6VLXtK604LvUgycFlBBw0j
         tL1uUO11oRys1d2X3T3NrGX5sBjWxy6cpwDoDozC40zw3WD8KbHGavGaQQ34XDT68Ixk
         rtsiEdIvcCdh4R5qihjw5Vm2jGuulAaME9W9QMpTS2SRWPaI1hLv6ndwOIYeYvkks5aK
         WxPXGvjOUfGf32XmCrx7Gq1eCj/NVz4hipvKEqKVBfDSCYW6rJVvjuB3bIPDQcFGqHkH
         R6WA==
X-Gm-Message-State: AOAM533CdS62xP7PXrg3h2hOszoTgM/wD2FtySbJjejlucjtM06FVVgD
	c7oKxDjnyxSU0xkTph68AXP5ErP0JPBl4Q==
X-Google-Smtp-Source: 
 ABdhPJwpiCPOJ+EwOgxOdIdidI0axFDbV/5STSApqXx74T+CLQ4hoUfrqapvjqKXTpHvl2zZBXy6Vw==
X-Received: by 2002:a50:f09b:: with SMTP id v27mr1007286edl.53.1637321683225;
        Fri, 19 Nov 2021 03:34:43 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 l18sm1101781ejo.114.2021.11.19.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:34:42 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH v2 3/7] systemd: remove /var in nativesdk builds
Date: Fri, 19 Nov 2021 11:34:25 +0000
Message-Id: <20211119113429.502652-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:34:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158509

From: Luca Boccassi <luca.boccassi@microsoft.com>

Nothing picks it up, so it fails QA checks

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_249.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index ec9c350297..9993036aac 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -772,6 +772,11 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+# Nothing picks up /var in the nativesdk case
+do_install_append_class-nativesdk () {
+	rm -rf ${D}/var
+}
+
 pkg_postinst:${PN}:libc-glibc () {
 	if [ "${PN}" != "${BPN}" ]; then
 		exit 0
-- 
2.30.2


