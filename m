Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ABDC83F2C
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 14:11:35 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.17153.1724940686302896336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 07:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=l2/4J8i/;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a35eff1d06so48210685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724940685; x=1725545485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYeobrP39czqas9AOhmg/sHj+69M9aLAws4kkXMMHF4=;
        b=l2/4J8i/g1QRLm3YbscO7sK3VVVK+gPU6ElNxnosN4V/WyF/qZ6eA/mxtkePIIiM0g
         fkINHTJfrvDdHDQnEF4Zes9iGsuRMbvhLXpJ/5GSDzFMeJEYEylQSEVRCnCZBdj1Vfgb
         ak79Ww/PsDdDcjmRVzkENtlxlsEVt2PPDA32p9T/AeSdZfFW/2nIKnkwfbkGASaGeT1Q
         KaBBd0Az81MI3GxKgY7N4mOSPB9vEt7NI8Teyd94Bncc6DUmtBbmhYNRmeuHNlyLxqmf
         pXpRJQX/hW9XxYcC4FgqaXeNhSZ4XBnudKfLS8N7nqScD+PZeomzAUYMVUSs+E/C7Tqm
         iadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940685; x=1725545485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYeobrP39czqas9AOhmg/sHj+69M9aLAws4kkXMMHF4=;
        b=ggs4okytVjfOxjjRs2qK1fOrJEm4N8tXO4d34iA09iK8KEUsFaRM0hEU9SRy0NupaM
         hnBtYrsSA/nHmV2JFvhnPPsMOCoj2XOYzIvyh32K2/uoN3ZwIZVO6kR8OYConxXKOSzW
         47BWgP+SCSbToIJ7+qMAn3eavXAwiUahWDd6hvNtiJY6ZzrJEkUtEUiiOx7xm56ZD1Hj
         32wFrg9Ii5YHoMFkCZ8TLv49gJwumN0U6bz6k8VPFRKAdoOY354AMxqVKErE4fluJK/3
         0wXkepyx4W6+leWK6u9uJG9ZFprpvLrq9Jwm8hcOwMxNYjDNI+pV6CPxfmCxrXNkCTgU
         R/Yw==
X-Gm-Message-State: AOJu0YyhcX43cqZxXIRZsElx72K9AwrFxF4Mw9ypNnrPYA3QgytLfiZu
	Bl1oaayg400vAteZcxn/QFJrJbi08xtnhCjaXQGTq6KHkfOzHSpKzhAETk7+SHUogIo4BJrHCmb
	P++Y=
X-Google-Smtp-Source: AGHT+IGKZfJLgsgBcaX/ALa6/vPjypMgvBiAHgWU79FYaN0L2zPQu+1J33plMA0WibaI7HZf7UpI1w==
X-Received: by 2002:a05:620a:3197:b0:7a7:dd0f:649d with SMTP id af79cd13be357-7a804282438mr306233285a.57.1724940684822;
        Thu, 29 Aug 2024 07:11:24 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806bf6d7asm53930485a.13.2024.08.29.07.11.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 07:11:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-hypothesis: upgrade 6.111.1 -> 6.111.2
Date: Thu, 29 Aug 2024 10:11:21 -0400
Message-Id: <20240829141122.3558638-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 14:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203934

Changelog (https://hypothesis.readthedocs.io/en/latest/changes.html)

6.111.2 - 2024-08-24
- This patch contains some internal code cleanup. There is no user-visible change.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-hypothesis_6.111.1.bb => python3-hypothesis_6.111.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.111.1.bb => python3-hypothesis_6.111.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.111.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.111.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb
index 04c8d537fdd..3da0ce8c045 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.111.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "6ab6185a858fa692bf125c0d0a936134edc318bee01c05e407c71c9ead0b61c5"
+SRC_URI[sha256sum] = "0496ad28c7240ee9ba89fcc7fb1dc74e89f3e40fbcbbb5f73c0091558dec8e6e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


