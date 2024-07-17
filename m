Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E6EC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 13:36:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15314.1721223365404012379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 06:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nanl9T5c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4279ca8af51so43703065e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721223363; x=1721828163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/4carcqG4vVkXpkpV25+llqOa3OBm7IcQgBejLYlqY=;
        b=Nanl9T5cpckTl+tHI0qbw/1yQsx2rE2nZjx2xYvHzRhE36tv4vB27cVzxqSygEx8zV
         buzjICAaElqWKBfofHbuLe9l1b5zgNoBu6WnxqchHWNoUfQH24phoCcm5DSiOh4MHYM8
         0j48UKJoqWNL17gkn8gS1pZb7lMqT5zbV1yGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721223363; x=1721828163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/4carcqG4vVkXpkpV25+llqOa3OBm7IcQgBejLYlqY=;
        b=fU3rXAJ4e6pmPzsdn0S5ufYk/SSayT6axodR7QSuNllA3p9VIDWbxrIrTziOJQlbPz
         AakoUowlNGnrsRfHmTYFyF0XNhWGCoa0TCoS+Kal3eI7IP+X1zjSRaB+dR2bl4hU/oKx
         jQL/5zaclMhYOEzfRwM2SoAdm8bl/Zb25nXtCxSDBrtg1P+Yse+WGdkWWy5e/Rm2xIwu
         5XJ341L1N/n0ueGZ3owFnUBqdyNkbXysX90Y8Tb+ymbMixwkyDIBQS1VsTCNH+d+KkV6
         TDeFa7jS6yFumQrOy6/+TyBf+DU25UyaiWYIaeSbj5q8JDSjeMjfn1OCNI4IXL4vaIMt
         9A9g==
X-Gm-Message-State: AOJu0YyhWWsGpRGbDYEIAMROrR+53L+9SgqvhBOiZVYr9J2ueSQJObBx
	peiowWlmqEesT1U9MV0hR8V8GPpTe+Plj2pY6xyLWba57vP9XALSkFlSYOCb7UdgTe6tDCFgr6m
	W
X-Google-Smtp-Source: AGHT+IFfAP3Uk70CYhaHqKsKAG0HL2Q4AzXTdbKcrHELkV28SUjSSjC9bH+wz5lba/YILzZrxymGSA==
X-Received: by 2002:a05:600c:1f89:b0:426:6c7a:3a61 with SMTP id 5b1f17b1804b1-427c2cc993bmr10893355e9.3.1721223363117;
        Wed, 17 Jul 2024 06:36:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a16:3e6:efff:89c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2d7c9csm206878725e9.48.2024.07.17.06.36.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:36:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] testimage: Fix TESTIMAGE_FAILED_QA_ARTIFACTS setting
Date: Wed, 17 Jul 2024 14:36:02 +0100
Message-ID: <20240717133602.3601318-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 13:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202164

MCNAME isn't defined outside our mcextend ptest images so use a wildcard in
TESTIMAGE_FAILED_QA_ARTIFACTS instead. This unbreaks the value in other images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 72282ac3624..531330f3848 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -28,7 +28,7 @@ TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${sysconfdir}/os-release"
 
 # If some ptests are run and fail, retrieve corresponding directories
-TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"
+TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/*/ptest', '', d)}"
 
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.

