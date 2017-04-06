Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7820C77CE1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 12:10:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u18so2802112wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+N+rt0kv3qG4kwrovQ3TJO3wAUCHGOOa3pBCPrUnuFA=;
	b=eveXPCDpGBeOUup7L2UvhLz/S4cxSL7WxULvmQhaGV/u2FV3TP/D3tiHP0tJuV1E0V
	neVOReYTUaL7JEgjqEJvSb4qJhcU+L8yHb5jwUhIHU1EHb8Q4rzfzENb4Lkc9hc8Oy17
	5M+3J93opj2t0YMm4SB2ONr9QJgd4GzAn2sPUfYqmIjCQa2CpC8g/VnGjBgAOG4nH8ZY
	P2MWaklGuZGoLmT6IFYMObl/k7/uRVQdqwqJwCmQxRg+lcpFl7VDABKeQwHtMq6XU3Gs
	LVHipel/jxreTanZB2ZmIwqt51MuHd8Ps1D1dv+7Zd6pBGxXySgqstFt4ZnTmFd+kHLu
	mnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+N+rt0kv3qG4kwrovQ3TJO3wAUCHGOOa3pBCPrUnuFA=;
	b=rCI8UiTfzGOxb3K1j9gvZVJDx/fpEoF+N8kH3WnBlD6n6kzBow4e+2LG5z8YBY0Vhx
	Mi+T+e/f+wDYOzhp7uPPVN+CdWXkOVZrAMMX26sViRFLPMjyVhvl7eZgLJqXKa/a9Wwv
	QSxOSCDCd7yMqNWKrcnwor1WLemYwCqxdK5c/mQPbDD3jmJNT9sBk6A8uoo3b6ncyHt8
	rGeh3H0eEhZSXOl4tttKOOcXbMK11FNfDjWzhoxelgQ/UcN67GkGryvTnZq8/P/OFmAr
	4NANpTZSrdal6SBKwyWi1KyvJVpDkWQhducn5XKg/v1r7QztQ+SvWuzNHkqVeCWb/hu+
	d1Cw==
X-Gm-Message-State: AFeK/H2aFFg4Sg/NuRbFvhi/F+FHyeVLi6MCBu8YMaBlOa6Cz0/a52vCd9b92QLjnTWkIg==
X-Received: by 10.28.142.2 with SMTP id q2mr13004714wmd.31.1491480604689;
	Thu, 06 Apr 2017 05:10:04 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	m7sm26221884wmi.34.2017.04.06.05.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 05:10:04 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:09:43 +0200
Message-Id: <1491480584-9725-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
References: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 3/4] nativesdk.bbclass: override TARGET_* flags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Apr 2017 12:10:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some TARGET_* flags are being exported in bitbake.conf currently, so
they are impacting all the tasks of a nativesdk recipe even they are
not in use at all.

This can lead a lot of churn when the nativesdk sysroot are shared by
machines while they have defined different TARGET_* flags.

Fix it by overriding with BUILDSDK_* flags.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/nativesdk.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index a97f5a7..ebcfb2d 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -43,6 +43,10 @@ TARGET_PREFIX = "${SDK_PREFIX}"
 TARGET_CC_ARCH = "${SDK_CC_ARCH}"
 TARGET_LD_ARCH = "${SDK_LD_ARCH}"
 TARGET_AS_ARCH = "${SDK_AS_ARCH}"
+TARGET_CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
+TARGET_CFLAGS = "${BUILDSDK_CFLAGS}"
+TARGET_CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
+TARGET_LDFLAGS = "${BUILDSDK_LDFLAGS}"
 TARGET_FPU = ""
 EXTRA_OECONF_GCC_FLOAT = ""
 
-- 
2.7.4


