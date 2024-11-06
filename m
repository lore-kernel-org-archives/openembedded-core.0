Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4A5D44D42
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 10:10:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.42436.1730887801168002755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 02:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O7It0ZtI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so76042015e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 02:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730887799; x=1731492599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEFIICQaPuSr0eAes7BFBftfm6NaSygK6QvzmSJTujA=;
        b=O7It0ZtI3JN0YeqHPg0hEFapd9/kYpZArMn7iIdnsBy3XlGB+DIZIQvjUbCxjQ7LhQ
         uEP1UkDUony/VVbXogE6WNRib5pvWuX0Pub3u/OEVlkM9TJT7sVDWZldR8Rb7UUmHOp8
         6gjbnoVn8SE1hNnnjcQmr8o0S2j70WcANw2Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730887799; x=1731492599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEFIICQaPuSr0eAes7BFBftfm6NaSygK6QvzmSJTujA=;
        b=CFlF0tn4cenD4jwrTov3K3vhLl8nbuPTumMXDCvdqPEUJjpW45/xc5gm/0YcXgZ9tl
         VQQmwvy9uyqvjWsFm+lfT1vM1F+3EVbcTQ2AHIHsySk6XjFQlNxc6pDicK0mVbF1EjZ3
         s8iDh5ZaTMuuZF5AA1ss1NhVZ8s4deJksU0VlByBAUCq7uT+8YndJTJYnHuOAL5OZksD
         QtkjtJgTz/htecKA41W3URrbaLv+ZHWZWsU+7cR0mFlJGZNS8wkJz5AvJp45Wu3QS+Hd
         YCtMG3jvAxmzz3HFt/sPp3GgSslEBiUS+jdIG2OOdEOIwstfIswtBERuOzmR19k8xk4V
         +Rag==
X-Gm-Message-State: AOJu0YymU6LQC++8aqSJpDwhlIZYW0/SbybRVEbu+haZdmvUb8rajYeN
	FtR61B0lIzeYKAlQBXy+qkuL6OdUtu6E2eHMjlPVAksSw4Tdp8ywp87JOEwm/Ud4E3xoaMGJAak
	5rFA=
X-Google-Smtp-Source: AGHT+IFkuo4WRKXiXxU0N9Buf+gs11A1cyiGKee3SkykZvCNHicxcKDf+Qj2MD2kzGetq15hQa51+g==
X-Received: by 2002:a05:600c:4683:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-432942dd802mr138195215e9.3.1730887798884;
        Wed, 06 Nov 2024 02:09:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:de00:615d:c4fc:749b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa74bab3sm16624675e9.43.2024.11.06.02.09.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:09:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] bitbake.conf: Enable ipv6/acl/xattr for nativesdk
Date: Wed,  6 Nov 2024 10:09:57 +0000
Message-ID: <20241106100957.2905277-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 10:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206762

I was surprised to realise our buildtools doesn't support IPv6 which breaks
usage in our own autobuilder, let alone anywhere else.

Enable ipv6 in our SDKs and enable acl/xattr as well before we have the same
kind of issues with those, these features are now common on most linux systems
and we should be defaulting to including them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2 - Handle mingw which doesn't support acl/attr

 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 14e761e2e7e..02bbf0e7a52 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -916,7 +916,8 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
 DISTRO_FEATURES_NATIVE ?= "acl x11 ipv6 xattr"
-DISTRO_FEATURES_NATIVESDK ?= "x11"
+DISTRO_FEATURES_NATIVESDK ?= "acl x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value

