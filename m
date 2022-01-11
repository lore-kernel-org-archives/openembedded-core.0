Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FC1C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.12435.1641927735915393235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KoWpCzg9;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ie23-20020a17090b401700b001b38a5318easo560940pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MzurwDmkjrCnUOddo0bLWtVYnfG2bYL9HCHaQTZ3aeg=;
        b=KoWpCzg9oPGaFnXrbBCLvgTKUU9nGbIUP9snVkr9bZOCXVzA+N4v5Dye/1eXaXZKzK
         MXfyNJYYQa649RDpHASLr9gCIIwSuYYXoX9Z6PE0XIzjbt5S72U2GT8G0BpjDTIDJQU+
         +hzWMrVRiB/AufciN7m65lSCWQOXPGNVlKD7nX7rqHHvbE/nEzgdkfYvucz8OkKWHMmg
         nV9QoaCCGA4K0wMpyCtJTY1f1SyaQl/n63yte9WS6W2SBUGHsyYeh5inWAFysiuQYjLy
         /klu+XQ3Ht1czr+4FGuF2XOHDlYaHWOFSPNKWIdSOFmh9JwFwP5SXMap/8g+gAEvWCAH
         fE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MzurwDmkjrCnUOddo0bLWtVYnfG2bYL9HCHaQTZ3aeg=;
        b=PThxKKIDSmFwb9XxL4155paeHfso5/jcQsR5l58EqDQDnTqZB17J0XPzi5CEQTL/tm
         MaVSGwkrC3uRirwCJDAICzSNzRVEEbgvE0zBPaN0H7NTUrd9JZhxu3o4G4wwmqAqSzYa
         dcoPdRKs085USjE8LMyxbyb6tjkdKcXgeSKggi9fpc97Ek2SoWdkwYdOXNMGMvVHxPbe
         C91am65YRjYDCM8UKmXtVCicwUKXKYr0kZm/BLkQjVD5cYygnyZlTGPp3/JzUN/agmmW
         qpAbeh4lE+RPqkqrauvq9b90XB7NNSHavnnjNaBPYTpNh376ks9k4fiVk2yBSI6IHLmC
         3/TQ==
X-Gm-Message-State: AOAM530e3z1hMHKwuH6vyYlZ7F7VpYx+yEjpol0OmVkXTLx2MOuxmX1w
	/VkusnZzjTSMJk0Kupq+bjgzAASOS0U=
X-Google-Smtp-Source: 
 ABdhPJySqVdrw6juAc74dh5jwO2I8ULbquXnsk2tebJSwuPpdndJ9dD1/rDjW+QaGAwWVZvyj7/4fA==
X-Received: by 2002:a17:902:c404:b0:14a:1594:2e69 with SMTP id
 k4-20020a170902c40400b0014a15942e69mr5719894plk.167.1641927735113;
        Tue, 11 Jan 2022 11:02:15 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 06/22] python3-dbus: inherit setuptools3-base not distuils
Date: Tue, 11 Jan 2022 11:01:15 -0800
Message-Id: 
 <d19215acd84e18e3908c352559cc0d78f6402483.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160442

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-dbus_1.2.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.18.bb b/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
index 9592fbf7169..c4687de13c2 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120a
 
 S = "${WORKDIR}/dbus-python-${PV}"
 
-inherit distutils3-base autotools pkgconfig
+inherit setuptools3-base autotools pkgconfig
 
 # documentation needs python3-sphinx, which is not in oe-core or meta-python for now
 # change to use PACKAGECONFIG when python3-sphinx is added to oe-core
-- 
2.30.2


