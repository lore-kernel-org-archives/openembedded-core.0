Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF673D3E778
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 21:57:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.32460.1730843848746114678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=No9eCda8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so4103402f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730843847; x=1731448647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjBylmUx91FOV+4UxZaWshkRwNC29I0jmeeboHp8Q/Q=;
        b=No9eCda8vfQytTv6AeDfZzuVZb/YPIqo1POz+AVwTdzuvYxQI2lh8I6U53ddb8Bqq4
         BdB0Bp/oVETNsU+KtKVXnXIQF4kp9SBvgF200BXx9TDD57QPiI3/QahDeqPed2Dbw29J
         o38iob+xOzM5/bAFIpoVdg4rUMzX8gm1s1kTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730843847; x=1731448647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjBylmUx91FOV+4UxZaWshkRwNC29I0jmeeboHp8Q/Q=;
        b=L1G/KUJrjAeeEHGptS0gjjRV08tIMeL+gpR1+hyuBPcWdf1eSzYnWkOUDFE76LyM/W
         VB4nRT+hIiqr8Ec1eHIZto+UnAoeQ2J0pBl19lXVavSHpyOd0sIj/co8Zynaz5FHrNCM
         l0o5FyusJa0gaNYJBepypZXJpkOEt66soG4kZh1SO8y3K+laOqltNs6ptlJJEsNH/QeB
         4BuUaRYEkmjZxzUieXJH9Oz8e7M+BbMH9nDhYVoEfx0LQVpRVWvRlu+UCT1m+ddV4cjO
         NeYxDbrMxsIvRV6X+cYanio+OKtQsHpu4JRx6GW0kvlXl+0rJqdANvOw8eOJVRJjlT6o
         0UKw==
X-Gm-Message-State: AOJu0YzGnAfSHSxVwyvNDHtL53wdS2Dqu/DLNA2SHsZ3JQOcEoeSnn9u
	kJ13wUnWJtlpGdLzPi+iiDI6WBPTBC28M/Wz8tVcQr+sN+XsklkkhpNXWQamm+qvUEK/mK+aWp0
	qORk=
X-Google-Smtp-Source: AGHT+IEfbAyFf//1FnJ35riVV3lw0Sw0ThflFpQDqLsRRCiEC5KE6i6mfTOOPu0vf7uQmqJEa96Ctw==
X-Received: by 2002:a05:6000:383:b0:37c:c80e:d030 with SMTP id ffacd0b85a97d-381c7ac81dfmr15967842f8f.53.1730843846779;
        Tue, 05 Nov 2024 13:57:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bcf1:9af4:492:5ab9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4bc8sm17359032f8f.39.2024.11.05.13.57.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:57:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Enable ipv6/acl/xattr for nativesdk
Date: Tue,  5 Nov 2024 21:57:25 +0000
Message-ID: <20241105215725.2859144-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 21:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206758

I was surprised to realise our buildtools doesn't support IPv6 which breaks
usage in our own autobuilder, let alone anywhere else.

Enable ipv6 in our SDKs and enable acl/xattr as well before we have the same
kind of issues with those, these features are now common on most linux systems
and we should be defaulting to including them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 14e761e2e7e..977a2576772 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -916,7 +916,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
 DISTRO_FEATURES_NATIVE ?= "acl x11 ipv6 xattr"
-DISTRO_FEATURES_NATIVESDK ?= "x11"
+DISTRO_FEATURES_NATIVESDK ?= "acl x11 ipv6 xattr"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value

