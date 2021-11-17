Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F46C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:11 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.6374.1637152330679148388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YDNIwn0g;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id b15so10388974edd.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JMfe8MSNh/6kvAjA51HiyixM/N60vJ5p3nXIe4NjFWM=;
        b=YDNIwn0gZgoOyF9d626JLLrlyiWYgqMtehHxbHTgUCTSYk5P5ID/UAZOq1KhL2mTRl
         q0m3ziKrpuH7FJ6dvQ+QT7BCL1UufkSJjG7rTilP7S4IPsK5mmPPxYfHhaZygyL49sSB
         91ffQvci/0ZEcLtO86pYr7AqTWPXSXgqNwCZ/WhM7dCDCslQz748SV98rbt0byzcc86f
         KodmsF9np0BqyfyLbI91luulkICkEEMi9Ps1c/KyQfsW9t61kHauBdzl43/rFV/aGJnd
         rBM7xwudCI/Ze4GONyKpkBFfUDx5JuNH7FQi6wv/wTyckHlixxvFsfhPc1hBOssUiPhV
         1j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JMfe8MSNh/6kvAjA51HiyixM/N60vJ5p3nXIe4NjFWM=;
        b=oT+YaR9aSuIjvYgd7KudOYUp4Cn0UV0xXZObkfgxEzoO4fQqMsvmd9c0S14dMu292t
         x8R1YTKFv5N5l5YGbJfxNLlXQUn0XyGhlQtiqOBz7pY7X3N7lSCA2kcRv+5sZyOZHiw9
         s+ZRUmn1Og+RvB8XT4Ftmhd/w2AS720L7C+BeiIst6RaIxEXPkeBWgfjeDcHyvrAHHcB
         KIu7gxjbnOBfRf96i346rFyJ3iAU7xiF6jTAooGpDZnhfRPDcyS7pj3H9liAp3FLqSrv
         ieiIU1UJjPWFyDlRTgcMge1tDYW6JYnM6tAYuGqWgrmVM8vsPUJKwj5ppwqUJgblYbMc
         Vucw==
X-Gm-Message-State: AOAM533I/yAm8T/+SyUUYKNvLhl4uJKJfcZkcdSfGLRtzQavaKjO70DS
	+90p4umrB/z4t0po78IJWnYW6LVoaD6nQA==
X-Google-Smtp-Source: 
 ABdhPJxuY8n/WKobSSDr6rRkGr/OEHw+813Gghovh96Qm2Fs5Y+jnoIi7qDTOubRbu2noplfq63T3w==
X-Received: by 2002:a05:6402:4248:: with SMTP id
 g8mr16739398edb.182.1637152328951;
        Wed, 17 Nov 2021 04:32:08 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 y6sm11079188edc.17.2021.11.17.04.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:08 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 1/8] systemd: skip chown when building for nativesdk
Date: Wed, 17 Nov 2021 12:31:54 +0000
Message-Id: <20211117123201.111905-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158385

From: Luca Boccassi <luca.boccassi@microsoft.com>

The useradd class is a no-op in the nativesdk case, so chown will fail.
Skip them.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 8bdc0ca028..2f019a4b1f 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -275,7 +275,10 @@ do_install() {
 		# which is expected to be empty.
 		rm -rf ${D}${localstatedir}/log
 	else
-		chown root:systemd-journal ${D}${localstatedir}/log/journal
+		# The useradd class is a no-op in the nativesdk case, so chown will fail
+		if [ "${PN}" != "nativesdk-systemd" ]; then
+			chown root:systemd-journal ${D}${localstatedir}/log/journal
+		fi
 
 		# journal-remote creates this at start
 		rm -rf ${D}${localstatedir}/log/journal/remote
@@ -319,7 +322,10 @@ do_install() {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
 		if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
 			chmod 700 ${D}${datadir}/polkit-1/rules.d
-			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+			# The useradd class is a no-op in the nativesdk case, so chown will fail
+			if [ "${PN}" != "nativesdk-systemd" ]; then
+				chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+			fi
 		fi
 	fi
 
-- 
2.30.2


