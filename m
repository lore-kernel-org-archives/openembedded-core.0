Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DBBE77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 16:09:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.63409.1736179791736437224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 08:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R0RrZY1/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43626213fffso90460435e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736179790; x=1736784590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfpFgtslRmoUpn2AvI9sHwjX+HNJVpVxD2DEO8TjmOQ=;
        b=R0RrZY1/osAbUD7RX7xkggHamCVG+EKh0d1yG9O4Puq9u1P6BZveRFT8n+nscW663L
         8T3po2NKm7jx+SatrJg5j9riugIVz8iLj+zT2Fjz+mLAyOxH7XnvnM4lCjpFx8KyHRQ2
         0Vj6E4Lm6zeqWo3j3Ha0x2PKRsvaF0tR6Fngk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179790; x=1736784590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfpFgtslRmoUpn2AvI9sHwjX+HNJVpVxD2DEO8TjmOQ=;
        b=UKvuqRq2RvYOIxO2vAMu1ERVRN2X0L2KH1IgesHbcWbiZdahiGiyyZm9F0F3IiQw6z
         UB6z1fTCagn9ylXVnvUUCQ64qbM2UX9BH8c5ZXrIQm0kDR61FvbMsOUER+4SXqRk+9y8
         pAibFQ787X64aZpdrGEQhloWGkMB757h3P37VdUlzdmBdRTsZq9oUcupU53v++GbDabA
         8xfw/pW86Lhce0YT7LYfBL1kPNPR89OipVP42irCmWzkXtUTRVzu2a6zJhMY533O++0E
         o7DkmKZGjijmc4jMHxZSwUe9AivzqhqOAo71j8WUGJr5ge3r19BZE1xHpRy70UrEfekE
         lseg==
X-Gm-Message-State: AOJu0YyiTc+gpYKe3nrRYG3jv88kErrnHNWioeMtmtj8KSwYxOHcnFJH
	s81ToSlg+uWGjOcqoim9orsB3Yr2gm7MEtcBpg6OndHHARBdYsht/tZPzel5SlSurP5UyHEEnXc
	BV44=
X-Gm-Gg: ASbGncvWhIACouSBZIybVjU53n42479Y01c1OFaPuOLhUHIGhCPynL7OhOpNBBwiyJA
	AMfaNmY5hACYYjQYxGi/Jhl8MKsGbK0iBlKJI9X8ioGfeEt3921mwomW5XYXqm28itJt2naBqEz
	2LyZMOji0msyP117dk3dDJSV4Mzr90zxJcyugJSHyNSvmAUuYJAy/rDHzDNY2gh0Z3J8EdAzIOD
	upkh5HXQMY/+9Tn5dbWGwEc9HeIime1JsktzkuSDcIsohgph/RtfFbsrECjmueEtzCB7L6AG4Re
	MHGndCaMLg==
X-Google-Smtp-Source: AGHT+IFiJaGULicQM6x6kowsI1MftNZn8Bpgi9woj2PMRF7FX0ANBiY5tYTuC5lduOfeOGK3lw8/EQ==
X-Received: by 2002:a05:600c:6d3:b0:436:199e:8458 with SMTP id 5b1f17b1804b1-4365c79ad57mr511560625e9.14.1736179789607;
        Mon, 06 Jan 2025 08:09:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3607:7267:e27a:36e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm600024525e9.12.2025.01.06.08.09.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:09:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] util-linux: Improve PACKAGES_DYNAMIC handling for util-linux-native
Date: Mon,  6 Jan 2025 16:09:45 +0000
Message-ID: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 16:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209428

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
index 2c7dd154e19..5be35eabf82 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -59,7 +59,8 @@ python util_linux_libpackages() {
 
 PACKAGESPLITFUNCS =+ "util_linux_libpackages"
 
-PACKAGES_DYNAMIC = "^${PN}-.*"
+PACKAGES_DYNAMIC = "^${MLPREFIX}${BPN}-.*"
+PACKAGES_DYNAMIC:class-native = "^${PN}-.*-native"
 
 UTIL_LINUX_LIBDIR = "${libdir}"
 UTIL_LINUX_LIBDIR:class-target = "${base_libdir}"

