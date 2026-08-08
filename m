Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C10C5AD56
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 21:10:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13787.1786223398218443409
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 14:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QfmOw1Tc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso9825555e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 14:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786223396; x=1786828196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FhrP/Jpt0T8PNXK+OxvTliwMMUngYMGpxS4Vhf6N47M=;
        b=QfmOw1TcGFxhyNfwJt6upJw5MClJKgSUM6aF+z+EPMTAW3ZYfQ2m5H+m5xCOaiwSc+
         Dv199G46gpF/VMcFP6FvpsJsm8+UypHWyCcQQ+qhe3Tp5fx3yBLwcuAOw7T7de0fuAeq
         av5F2t/8+8GlUlQ8ZQ1BZ1YwMAgOze1OBcAl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786223396; x=1786828196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FhrP/Jpt0T8PNXK+OxvTliwMMUngYMGpxS4Vhf6N47M=;
        b=LX+KRTeEvJvzKyuXC2zdJ5bBOYXMRj0z2+snhWnOx4WRvkbmn3BKvbllnLQViSBoIu
         7xW1CwjLmAECXxWEdRR+CP8rRoUP7mZ2yrkzxmN4/gSUOA/127LlvV22EYV8Mtxqza+X
         Vkr0+8e/VbV5dz5Tfv6XMbWcbNKousvBq8imfjAPSRPg2/u+5MclZa3huz/KlfGoOiNU
         4eHBRL5mHcNeOs63yX9GedjJxDkVyboLsozVRIVm2y2rFXI7PNNhfxqtLIsBIztDAvSf
         /2k7HI/09XTDIyhynd2Lbfh45DsA0On4cW5Dt6uC5qbx+kI9jZ9f/Vt8y3zO1a0ijGUZ
         RBHg==
X-Gm-Message-State: AOJu0YwRrMopZYu45Dil+GR9FODs0KsxKpl71Ehe7oJRJIHfoe4gSxQK
	7K3PCbSCrM0kG5ZF6JkM4nbwkh0nX4XyBcOPXP2BwBQQ3dzh/IymoVqTU+qFID2duOzBhftMQ8T
	1Xv+uEmE=
X-Gm-Gg: AR+sD12pzkavSyAJkKbsx0eLgmBe7IdXAwCzzNa1nKTRaEjnU9J6Z6szmOnKEYO+JIx
	pfQqMa3muXiOOKBwZSkGl0IZCwb2V2fWcW5EwHJtgvhOZ5FjT4f7O9/nVevsUqQmPyGorCPI3Qf
	1HPKw4scPm3b8jGrtK2UdK95fGFW2iNY7Yel0H7U+5Kkt/HyUhAHenKYylhrkkUcTLcw41XkW7J
	bij9GMaWB2wv3NtFFKgFWjuZpTxVqWX9DE/JWUT4cA8PIlmoDoBW407L1+LG9ZpsTHIIt7ciaQH
	p5C6Q9SM+vsjquyKmVg2XLqo9rF8QybeyryYjoiCzVGcOX43ZHzXcBVegQjrXl6Zf7jvx72Xzuq
	T97mZakuIa2HvR1EYhKN+qCkwSFIcjK8oapRl0a1qpIVIQSJmD/shshTX5Ug1Fs6Fbwbn/TZqlM
	ZtYrt+lU4hUBQQxqAo8JaG9y+a6uxIKopUHt2eUHDJNzPRtB4j5b+LSg3IcDjF2OBC8c6RIYy9S
	H5vNWa6o23/1LWzDw==
X-Received: by 2002:a05:600c:4f4a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49959e0179bmr219187215e9.1.1786223396307;
        Sat, 08 Aug 2026 14:09:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a306:3637:68aa:bc01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145679sm17050471f8f.3.2026.08.08.14.09.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 14:09:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] diffoscope: upgrade 326 -> 327
Date: Sat,  8 Aug 2026 22:09:51 +0100
Message-ID: <20260808210954.994064-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 21:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243051

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_326.bb => diffoscope_327.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_326.bb => diffoscope_327.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_326.bb b/meta/recipes-support/diffoscope/diffoscope_327.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_326.bb
rename to meta/recipes-support/diffoscope/diffoscope_327.bb
index 3ab679f34f6..30d33732f6e 100644
--- a/meta/recipes-support/diffoscope/diffoscope_326.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_327.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "21aaa977a9fbdf6e2b70b675a700ad1f80e878ac1dac59cf6fb0ba5f319616c7"
+SRC_URI[sha256sum] = "b5a398de17b180637cf091ba5c3c9fecde9dc8f5c2c80204ff8dd78e1b9d5358"
 
 RDEPENDS:${PN} += "\
         binutils \

