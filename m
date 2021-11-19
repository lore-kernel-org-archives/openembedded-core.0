Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283CAC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:34:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.7724.1637321682982766217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BJMUMwqb;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id t5so41774109edd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=23RheNtdYK2GQkgZaZ5sF1czfBV2KkJStON1hK0TiiQ=;
        b=BJMUMwqbSso+4cAm8Kde8uexIhMcwRiMOFhA5Fsi68K5fVu0aXeJMFuS2eNMg9xgNz
         d5yJ9+vpKXLrOIGbdeiGpYLt2MyptBeCIABT4LsNNBkapTTCVDNLxSqwnSKBREfKLgT7
         PnpVCs0hmZvxd69Q70stvoWB92BaRYVj8Nq3TAfjGOqyWw5kuf6Te4l74l67CEYor2RQ
         warMiuJH10+Quz93w7viK7xyjsctEEcLcXmn/YyAqTPR4z0QJMKkfpIwlaPQo5l9LRDo
         WzCSiWt3mf3dGlP7O7y1iJL8+en71yKM2wBhEVejdxmsP++I3/IKvY74py8upENqKw0L
         N/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=23RheNtdYK2GQkgZaZ5sF1czfBV2KkJStON1hK0TiiQ=;
        b=4518bR8wth+OSOOX+FR+4nt+GS/6iRdo7B8kMBhXqGByZrIV++7cmEFCblqKlWZda/
         BRpEhqz5k6td53jjdTBad5MO/BT0YMiRg6lyfavDCZAIqltd7EWr+VEHDQX3X5y3a4Ko
         9tbyBdAqCUzuc9t+f3xJq/8pCd6DXNOW7jiR/SGlsItvz68Lc9P8w+PxNoo8Wvm/1sY3
         oenZVmEgyIamjisxBYADTt1ztisa7TaC8h0b/X5mjMYzlzGwkukmQYHEQEbUJwefbSJO
         vhm5qGpCIeWzuCcYGvejWGqsUp9uKcDdifqo8JbtcPMPgJ2jz8LoIWQKBY8eKC5JT9jN
         P2Cg==
X-Gm-Message-State: AOAM531ty8iAWzR2RHYDaYGI0uecXkmFzLg1RpB/HwZjEzB5eFw85xbc
	CdKPIr89iIPD8ufFCAyezI4azoGRcxV95g==
X-Google-Smtp-Source: 
 ABdhPJz4Z8U2jtvxYZW/DZ8vmuVh9XmiHu3MkXAlR7UNLlCJj+Mc3rM9XqLVIb1ee2w0EgOM0OyDhQ==
X-Received: by 2002:a17:906:b2d0:: with SMTP id
 cf16mr6925419ejb.52.1637321681038;
        Fri, 19 Nov 2021 03:34:41 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 p13sm1314205eds.38.2021.11.19.03.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:34:40 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH v2 1/7] systemd: skip chown when building for nativesdk
Date: Fri, 19 Nov 2021 11:34:23 +0000
Message-Id: <20211119113429.502652-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158507

From: Luca Boccassi <luca.boccassi@microsoft.com>

The useradd class is a no-op in the nativesdk case, so chown will fail.
Skip them.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: use "${PN}" = "${BPN}" as suggested by reviewers

 meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 8bdc0ca028..2df2de0cf3 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -275,7 +275,10 @@ do_install() {
 		# which is expected to be empty.
 		rm -rf ${D}${localstatedir}/log
 	else
-		chown root:systemd-journal ${D}${localstatedir}/log/journal
+		# The useradd class is a no-op in the nativesdk case, so chown will fail
+		if [ "${PN}" = "${BPN}" ]; then
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
+			if [ "${PN}" = "${BPN}" ]; then
+				chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+			fi
 		fi
 	fi
 
-- 
2.30.2


