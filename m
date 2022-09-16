Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07190C6FA8B
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.880.1663362530450466846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L4G/l0/k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so552507wms.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=uybh9Sjm2lIPeygV5IvrzRMWwOnGgjpO9SFdLsRb9C8=;
        b=L4G/l0/kBOLjJSc8n5DfR3FCla2Bm9VNvNiWBb30Qp5gJA+nmyH/uMWQhpBX/sob9i
         hw32psfS5e4Smy3B/7Nzn3IRFzGWkrwrmwBCujGSEqAiY3rmryHCDFT/r44E4Cdd7rCo
         4QOYSe6FvUVV37wB9+GeAPZ1+zGegFbE3/9OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uybh9Sjm2lIPeygV5IvrzRMWwOnGgjpO9SFdLsRb9C8=;
        b=Tw6bZlFuoIUqGKWBbada7JkAetNldY+9ll5PPlTweN0WS4AzzBqtIFBrGb8/e8uU1q
         gkr9lrJ7hJRdg68QN5UeMvNwHAuKa4mxlxfQQZu/gKPluX9DOa+59vSB0Qb9E9dmHGwy
         MAhCSAYIcC/jHoi1JIEOj9PzmiZR9WyD2cdkGrj9UA2hqljzeM2cEgMMQK9eikNVaiWT
         PtfGuSZxHpOtbJg3cw5zeVAS5bNh5/ivMMo7yNNvkfV77HMu9M9BY2xpVoKkxMCmPUeK
         8bX4YZc/6UM7Uodvi3EiZZvSRiFvrBlRFwfMORm5EJ3IUAjIL+Nto9bCBOBKOpul2Xl4
         lSyg==
X-Gm-Message-State: ACrzQf1+HZVyFXRUHtq2jKe3pPON8qLDuK+xQkmmBAriTH9FV6kpLe+T
	CMQnCehSwnhJA6Zs6qGB8LMXtdsxmLXMWA==
X-Google-Smtp-Source: 
 AMsMyM66IS6e4zb30hCXk9lfabJnycT+TsqvdVY7a9tTQ/aty826/ZGrf/x0KEUU/Aepd0jqf2s6Mg==
X-Received: by 2002:a05:600c:3591:b0:3b4:bf48:9f10 with SMTP id
 p17-20020a05600c359100b003b4bf489f10mr2780236wmq.76.1663362528514;
        Fri, 16 Sep 2022 14:08:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/24] sqlite3: upgrade 3.39.2 -> 3.39.3
Date: Fri, 16 Sep 2022 22:08:17 +0100
Message-Id: <20220916210818.1228761-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170821

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sqlite/{sqlite3_3.39.2.bb => sqlite3_3.39.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.39.2.bb => sqlite3_3.39.3.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.39.2.bb b/meta/recipes-support/sqlite/sqlite3_3.39.3.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.39.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.39.3.bb
index dfef4808952..fce497e0e17 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.39.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.39.3.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "852be8a6183a17ba47cee0bbff7400b7aa5affd283bf3beefc34fcd088a239de"
+SRC_URI[sha256sum] = "7868fb3082be3f2cf4491c6fba6de2bddcbc293a35fefb0624ee3c13f01422b9"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.34.1


