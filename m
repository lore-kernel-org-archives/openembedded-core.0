Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB87E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:12:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.23769.1736352740915884789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 08:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U5yEMO3a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436202dd730so121935225e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736352739; x=1736957539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xcpXxXXmdot8FnTtBYUwHS97qglu0+l30yQDA1XqAY=;
        b=U5yEMO3a0bxfX4uQ0mEsDGFuko5KVXjFbGgpfoRvk1seRuHhE3bSp1VNFvZ70wv01/
         W7RjTnWcixcoWF4xQm5C5c7+Jb+hRjA7F/WGtSTAMx2o+L70oigXTvlPKGJxrLZoFq7U
         1IX1VWiCdNcPf69cbSSk2UwjfKc81ltS7kApo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352739; x=1736957539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xcpXxXXmdot8FnTtBYUwHS97qglu0+l30yQDA1XqAY=;
        b=bOyb000IBfEhfDJnReKyyqk43e+iRhFIYud6tzKnXirFDxxCc9NWA4mkd97Zk99fuZ
         1rO9WKShPOJFpcYWVEFtW1Y+ctue0KKmlu0HRJ9vzwa2O2viSAVv9VkS/PANMGsuTwS0
         /OK5jooh5ewq9W8y3hzyTjDPIFPA48kNpo3xfjxLHFwuHO0nQbWnkPbscDs7WugzJqbd
         Hjqb7jAc/TVC3Q/18iCMpY2iS2zefH7/enzAcnbf7I+Fq4lVn0vxhIjpyINbPkdZky6M
         UdmoER9Y1Zk08iQNCiUY/mGolZlVle8vGqvWJU30fkWAnK20OrGyPe1FrqrBrhlYeIPb
         U5sg==
X-Gm-Message-State: AOJu0YyO7YmRJk1pNXML/SAZV7W4tJMcsDlvRGX7lZhLL0OzmfZo3gQQ
	qhpSDcDFRGqtmgblkYWfzkUEq8QCR2vkkgpWovhMhwSDTdIYiCz/xQfiy4PNGEfAOFrA9Z3dGyn
	fGp0=
X-Gm-Gg: ASbGnctgmkUp/JvmGzdgSrOt8Q4vE5E7NOA1PqpSeFffTCvxfKIzFSYffu6JymgfhOi
	P4PhRQ+oIcMUjapJJ7gSXUveIISsB3rZ+ZSViVXdt40M9H24bE3dXmkpYGFi0PuxuDOmlzlRva4
	C1GGPGW2wnMvZBWAmuoymbow/WF9flZG+/8LgmYEnTe1KiOUQYyXYZA7cgeaElHEXHqUOdf6Qes
	NBsjAlTQUVqsbhOfB/AdPj+qay8dP/73pa3ZfTkxQWbQKhM1NpBvnaJ7GVCAxTljssUb3ODjTM9
	F/NaWfDtcw==
X-Google-Smtp-Source: AGHT+IE9XPSXhMp51iIzrfDQBnEEcP8bdFQidEycKAI0vUHcoMwe7f/anUyWwlLP87xM+A3rZIRb/A==
X-Received: by 2002:a5d:47ae:0:b0:38a:88f8:aad7 with SMTP id ffacd0b85a97d-38a88f8ad45mr2260535f8f.54.1736352738642;
        Wed, 08 Jan 2025 08:12:18 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8289a0sm54731682f8f.7.2025.01.08.08.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:12:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] util-linux: Improve PACKAGES_DYNAMIC handling for util-linux-native
Date: Wed,  8 Jan 2025 16:12:17 +0000
Message-ID: <20250108161217.4142396-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209579

DEBUG: Assuming util-linux-swapon-native is a dynamic package, but it may not exist
DEBUG: Assuming util-linux-swapon-native is a dynamic package, but it may not exist
DEBUG: providers for util-linux-swapon-native are: ['util-linux', 'util-linux-native']
DEBUG: sorted runtime providers for util-linux-swapon-native are: ['recipes-core/util-linux/util-linux_2.40.2.bb', 'virtual:native:recipes-core/util-linux/util-linux_2.40.2.bb']
NOTE: Multiple providers are available for runtime util-linux-swapon-native (util-linux, util-linux-native)

The PACKAGES_DYANMIC line could match native and non-native packages so
tweak to improve -native handling and avoid the above warnings in world builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux_2.40.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
index 2c7dd154e19..81bd298dd9d 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -59,7 +59,8 @@ python util_linux_libpackages() {
 
 PACKAGESPLITFUNCS =+ "util_linux_libpackages"
 
-PACKAGES_DYNAMIC = "^${PN}-.*"
+PACKAGES_DYNAMIC = "^${PN}(?!.*-native)-.*"
+PACKAGES_DYNAMIC:class-native = "^${BPN}-.*-native"
 
 UTIL_LINUX_LIBDIR = "${libdir}"
 UTIL_LINUX_LIBDIR:class-target = "${base_libdir}"

