Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF7FCA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 09:01:48 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11342.1791450107878294429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 02:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GGm6PiLH;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso5670535eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791450107; x=1792054907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVy7sa5CQUsBZn5GfR8ZMoXVcyzWflW6bnojRYmbXmw=;
        b=GGm6PiLHYoz2qradb16T8hZf2MBGPunsDEAUM0jRMj+YjOMyD8ykM+vKp8/5K3E9iK
         Hmvk9F7VBF0Xz6OsBSJ9pvfGrwmfogkAVa4TLRRakp0ngPSZ7czXdbp8vnXqz2EqU8U5
         7r5PtqIN2wUJzKyBVIKdmz43uMpjTy0Pw3Uqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450107; x=1792054907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVy7sa5CQUsBZn5GfR8ZMoXVcyzWflW6bnojRYmbXmw=;
        b=C7ZLGQRLAnTPML++/5mpY9ww4kjnXG5uk8mHbimjCObhX2RkLSEcxBbeUYTGMSrlha
         e/AXDCpCyc/aUuOa8bR6kz6nJ6FFXiKSDxd+n9mHwI4x0ryt1c0sQz7rPOXsBMXGHkfN
         OAIv0Prz8ypVLvE2OsXybxuaTY0ObRNp0wuvs88qaOsOCzLIaZeEgKSwfN4nZ5w5LhnG
         r2RG1mO2rZBZOh+hBzeRlFQztzCELdkXww0pH4HBRX/oqNnS6L9sFHhMeJ/RV+wNVInl
         iwqJPrJOXn758vTdZAZOhdTuJ2PIN6tr75wuBBNKIYtn33JF8nuUJjaP5ARzLqaVYIm/
         zMCA==
X-Gm-Message-State: AFuF++mTNbwLRgqQWZEp2a+hf8IjJtMRnvsVRbZYI9bndSClo079Sr5b
	PS6UD75upAqUMxrk47MsymbpAEJBLFac78yN3zUNZtWJQOi9S2mdgiH6poE27Z4CEbPWHyBNbCn
	WHJwWKP8=
X-Gm-Gg: AYBFou2gqSlbonO3V1ds38ljh6pJj42UUstoN14hBaRIndmgL+6+45In+2ZoxyQZ7sO
	bsErWovXhamJg2hyV9tFiGrwPO0eHdyo//IRqfeBdtJqYyyP214mN3LyaaN3RizRYpIJdobR5Wt
	fH+YsgMEVmK3E7yW673XTGTHSIIzB+cELx3bfdBrUuew3r92Rwu5pDFoBJJaYZ5GYQp1P8fyVHk
	ZhasA/H+2GFxxxBm9C/3RoEOjXfE3VphaiH0nCt8cFohdq1bOGnXkG9wIoeUnrp5viQtR7qwtNh
	LNmr8sCm8qC3sAXbVm24i6SnrtRZu0XOzP2d7cJBoIR/UvTvDwwE+Q+T/p49zZzLVSSDrhSob9x
	ygQW9KqIZ0nGCjkC2rz2s/8/1x9ACL5OxUYSgeCtZ1m9ZaeAC6Z3nNpKT7Q9yB+rgkLYkz/aAZ+
	2ubsyMWLQIGxmPRdYV1txBhUj0jCjyHH4b3zmwVGTsSOu3BgSiHWo6qbsb2y2lZ5PxxGlpbvueX
	iRGJzPA
X-Received: by 2002:a05:693c:8817:10b0:346:d790:9e10 with SMTP id 5a478bee46e88-3515de8b4b8mr5597001eec.39.1791450106856;
        Thu, 08 Oct 2026 02:01:46 -0700 (PDT)
Received: from MVIN00352.mvista.com ([106.200.27.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm6448518eec.17.2026.10.08.02.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:01:46 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
Date: Thu,  8 Oct 2026 14:31:35 +0530
Message-ID: <20261008090135.1485765-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 09:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247421

Release information:
* https://www.python.org/downloads/release/python-3148/
* Python 3.14.8 is an expedited security release and the eighth maintenance release of 3.14, containing around 354 bugfixes, build improvements and documentation changes from 142 contributors since 3.14.7.

Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
CVE-2026-15806 CVE-2026-17084

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-8-final

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/{python3_3.14.7.bb => python3_3.14.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.8.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.8.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.8.bb
index f917edebd8..4663ee85cd 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.8.bb
@@ -30,7 +30,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
+SRC_URI[sha256sum] = "c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


