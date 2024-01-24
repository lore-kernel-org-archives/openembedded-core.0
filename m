Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B02C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:38 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.23131.1706104890342909051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1ztWAPLi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ca1b4809b5so2560252a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104889; x=1706709689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOw6sH02rSnx9hDS5MZatQfaRQXVtle0zvLJp4El+zI=;
        b=1ztWAPLiA0+gh+QhCvvGOfCnuDBPrN7PoVf0BTPUI5b4Cz69ZUpq7h9K5JT5a7MyKB
         TCWL99g/bmy4K6CfwBZS4YAZsZk1FQM6ULrsUtD4SOCa36TfW6BF4EyeIerISMDbaEi2
         nflcgo158h+cWScANF4nJ1ZLZzZRO4Y/qNrmUdtrcxoIUZs6SPItNxD67shaHfjWxKPM
         DggWICpwbPuzibpHTvprC3IEyuUVM+qJAKKcF4lX5couEtsSW7Qh+MDrRAK8YWdeht17
         HIvmMXuHgwuyamYPVP8kmDvA6kkiHaBRybwNT4JWLcUkXX2ArAswFqUfr6KfXz68PWTv
         anZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104889; x=1706709689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOw6sH02rSnx9hDS5MZatQfaRQXVtle0zvLJp4El+zI=;
        b=bl5pqbribr8DjFr84vIAR/m/wEOdPnW0qMtKUoqRlARgP+dEq19wD3w3ago26pwXQv
         HakjIdT4eiRWJdmtZbywKIDNZ1lF8WEMxBF6v7bs/r/625Z3dnMnYkKLQJzxKUEBY9Vk
         Z1PN4dz5Zf75B1GbZt98Yo5Ml1pK6lk3FEZcXWKr/2stGJHt07Kmv6Z9qkyFq2n+0sDD
         dgq9eU6sumOrQwF2KIS3C6ig+sCWHq+q+5TN7sZ5f12VqYdYUN+BdGbgy727u/a4hrqr
         xBH6Qc32KyQaERd7lQtAYP0Rnaz4571ncdQTlf0rjQ2w/ICyntk0DOHUX/yXnpn859iy
         WybA==
X-Gm-Message-State: AOJu0YxJnl6Smw5+oozh7YLvr3/awRp9xgZ8wDob9dLs12m8ih/BtJnH
	9SXbQHGkqL70u9jXGSFggL573itknpVdP7ffYi6ZZb6TYAwfoEXJqx49Kzdfa2rpqYOmGxHwk12
	yJqk=
X-Google-Smtp-Source: AGHT+IEYt5+q/y8Jt4UUhbNJgKom+caVdBjE1nzkNo+fdSMkXcaAJJmohfOfY25zMoTs181VKkMu3Q==
X-Received: by 2002:a05:6a20:6a22:b0:19c:6ddf:cd90 with SMTP id p34-20020a056a206a2200b0019c6ddfcd90mr363204pzk.86.1706104888868;
        Wed, 24 Jan 2024 06:01:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/12] xwayland: upgrade 23.2.2 -> 23.2.3
Date: Wed, 24 Jan 2024 04:01:06 -1000
Message-Id: <3882f403a756563a90c9e517211adebabfb0499d.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194279

From: Wang Mingyu <wangmy@fujitsu.com>

upgrade include fix for CVE-2023-6377 CVE-2023-6478

(Cherry-pick from OE-Core rev: bf0bb7b94ed4930145af5f1fb3836157daceb6bb)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_23.2.2.bb => xwayland_23.2.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.2.bb => xwayland_23.2.3.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
index 9feac147db..9aa7b4dfcd 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8"
+SRC_URI[sha256sum] = "eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


