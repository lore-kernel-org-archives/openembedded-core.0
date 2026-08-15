Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AA2C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 12:46:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8152.1786797986124993878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 05:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CMpgBQ+Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fde295992so1403572f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786797984; x=1787402784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMdGAgcaOZzhxoGotffmFSRon37SnX6BVi9L7Nk2+oc=;
        b=CMpgBQ+QTzx9NekJmsFKf2wUn6AfRIgDgIS3BHcIuI76yW0hFkTiVrB1UHAjYkqN1T
         07iXCX3oZZIs6nl5XAaBodpjvzOUmK83NV4iEo2ZfMlLrACva8Yg9HLfe1GTUsUDVhJZ
         Ogv7NjYE/GomSnYxLLJgvjo2FMOAbByw9DsrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786797984; x=1787402784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iMdGAgcaOZzhxoGotffmFSRon37SnX6BVi9L7Nk2+oc=;
        b=IQ6MNIbCRnuG5FQS90gl0PzjfDixjX9S0qt6fcFYUoWdw5struRrmaleNeB1Mf+oOZ
         NLtlbHJJmo1017UVLufERf0ZQx0qNpILbBLKzdBa5gWQUqvQ+czXlR+290yi48ZySNLE
         AqBFSItS9/MQx4utXxdTZpmOFWJxTJF8sjlbKM0Wwf7fb9DQMS57Ay4t9OeHzjkxNtSw
         ZRC5TrgwGjHKiSIDjcKBEDPnjepiR7Hp1SS+CJ0aYuqBxQn9xVzNcGZ/29ByCydnyt1R
         iLY07EhwD3/5OPIw5LSjv/dJTK+FEUkSWrTLo7qVVJ9too3xKNExlBnVWrNyTkPTzNCE
         R9Gg==
X-Gm-Message-State: AOJu0Yy9E2eYoIvcyppIiJuEUZGhCuv7nR3p7zWR+7G7NpvOqoUpBG7L
	HUeG8JCwVNFDmhar+YjvQGdwu0ewEjtjdKIQrmNMT1IG2IOPzb+ayeIlx+f6aUVe7fgM5vHpori
	jRyo7Mq8=
X-Gm-Gg: AR+sD134P5dUIEmBqMKBAoLPl1SR66tR0TKldiEFDacJ5eMbkMdVCt0rmsNIjsKSFJD
	75lyyRFChd73/6VZhKh+cvLK8+Ck2ElZJujvj47iAhGAIhVu+jAQGp46IKlDYHknts3Pw37YR3a
	ahv6l7zzDutTEzO4WeBXBnvhR011XSd7NBSYB8ne4bwIAKqBYVuEo2VbQUAur1bJijif79RxxQQ
	traleS/GiRWQtkN3FGhBJ0Dce/hUkOOGeqKOgv+6H1qngliUH1jd05Rg++1U4SENyfqVFCB7C9k
	c2o4pf4qeRY4NS+tCf+ScZE9viaaOHLU+pC8LXjMPWhKmT7MEw/pJtdnONyfkwghpRXqzL6afcC
	2Q3fCAc/jD75of4SskPHG0BiMq8PNJ4asDy7Vev/vO96AHgYi7aHdSMLdnQ7oLY4hGBNOgPl24r
	x6LkeBbSb6HJDsUtJqyHSHrxCdorMxCqzWVrYsqenBdObE7tq4HFwC2QVHOzlCyo6T4pLULNtdR
	Y4XSRHa0MPenzQE
X-Received: by 2002:a05:6000:1865:b0:47f:71a0:c060 with SMTP id ffacd0b85a97d-4815a4de806mr31147618f8f.2.1786797984151;
        Sat, 15 Aug 2026 05:46:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:76a9:d146:8f01:f2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm17245267f8f.1.2026.08.15.05.46.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:46:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libpsl: upgrade 0.23.1 -> 0.23.3
Date: Sat, 15 Aug 2026 13:46:19 +0100
Message-ID: <20260815124622.3666801-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 12:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243482

Source: NEWS

14.08.2026 Release V0.23.3
  * meson: make copyright_prog work for cross builds

10.08.2026 Release V0.23.2
  * meson: Use compatible C code instead of 'date'
  * configure.ac: Fix typo that broke SOURCE_DATE_EPOCH for COPYRIGHT_YEAR

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpsl/{libpsl_0.23.1.bb => libpsl_0.23.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpsl/{libpsl_0.23.1.bb => libpsl_0.23.3.bb} (91%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.23.1.bb b/meta/recipes-support/libpsl/libpsl_0.23.3.bb
similarity index 91%
rename from meta/recipes-support/libpsl/libpsl_0.23.1.bb
rename to meta/recipes-support/libpsl/libpsl_0.23.3.bb
index 3baeb9d77aa..1bba67ad960 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.1.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8fbb03054556498ba9c4cc48fcaa36a4483748c6504a65bdb9ba348f555b0e56"
+SRC_URI[sha256sum] = "93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 

