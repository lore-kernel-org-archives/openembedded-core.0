Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CD7D66BB9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.64881.1732680711787988505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oCQAZw7v;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so4730347b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680711; x=1733285511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3C8oXHISNc4NW+FKF73OocDKBB6e0du1oC+P5ML4r8=;
        b=oCQAZw7v/O3+ZKnUHZcgrhd8NkMOvGTPDkjClIwQJ3MGErR/BdrFb043nhSH+FxDab
         F3UKOhCYgSdY/CjX/O38uxJ+MIVyflaOH4FnAeAvgBpB2kIsutegEA+K/+t52EeB6XS/
         dA1nsfKTcp5wAheHDbuFYTtuoe8VS/HCGRphVTNli1ygNDzHe0fFdUrSulxMmL0gIIkd
         EY0unekX++ClAoT7P3ov3kwr3PURfXDQXIntwyp+xeeE+ntOKgvZ4SYcfj8FR+cWndZq
         8OSghgPrs2PdcFWn9zi8qHQQsrLmqqOYTqJcIINMGcJOboCm0BlZTAJbfcNIIfHhgXIe
         7AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680711; x=1733285511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3C8oXHISNc4NW+FKF73OocDKBB6e0du1oC+P5ML4r8=;
        b=MLEynqtXG2QoNRrt7DKf1DUG+XGL6sNo9GfmW+z3oynzuldJ/yJR66DEPjswQX4tVn
         baiE8PKnP4iQZ2VAcUIa8fO5ChXT3m5zj1zAjQGf5urwJwqJcQShDBLC05JrcR4XKGld
         rlxbujJ6WVZowpzwZj3xn9xIMeErcb+s7qEWKpHwPf8DIwAVWUhlhMDaiwzOsQcTxUg/
         IwUlOQv2vFlford+JiFVTbm/2z1vpj4nfr/pPRlGluTqZk9t/iOSshC0iFIdB0ZTJ+w3
         rXiwIU+OBBID+DfElAChjRnklMoaau+7IM1Oi9VR5P9tl2zR2GIRUW7RJMqmMh4oA7QZ
         DaDg==
X-Gm-Message-State: AOJu0Yy1Acz/l1zSj4DJQ8JdYfUW1cLrRb5GoEyewhTR+NTY4kgiAcus
	cz49VswJKB/aIIQ/hV5dz1Y8/xdaE/3nqU7SccGKaJEG5MViVrkJFraBxaEE+28EDcPNTF0EUBI
	S
X-Gm-Gg: ASbGnctyd7v2IMwTGufCkU4rNZSP2T6h3j8hse2XWMbhxXlavyVuanX+/rtpZhQ+3gd
	sdkE1AVvBiEkE87K0jn2wza5t0b7yWY7pOk5tiJpP+smuaew+jHXwG9sNQyiIv1OO7ONFI/sCgC
	Lxs/ROMv2Q9ED2W6Rj3j2IrRSVwWzuFEhle71/Cz9DjwbYAb/WOwDhlrmz+0nqTtX6KrJf2+xwJ
	3EpokjRv+iDWI3pFrsGk9uvImSfjal8T7pdkXI=
X-Google-Smtp-Source: AGHT+IGvkKsR6QoRjVu5DV1cPX28MM6SuCvSwPbXVtnw4sCVe9gbH20HmQgu6abP9E2wLF6ilqyI/w==
X-Received: by 2002:a05:6a00:1956:b0:71e:4930:162c with SMTP id d2e1a72fcca58-7252ffd6fb0mr2216747b3a.6.1732680710960;
        Tue, 26 Nov 2024 20:11:50 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/18] xwayland: upgrade 24.1.3 -> 24.1.4
Date: Tue, 26 Nov 2024 20:11:25 -0800
Message-Id: <95a4db564feff2c0dd21dad735b7a95a03c2a647.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207899

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix CVE-2024-9632

Ref: https://lists.x.org/archives/xorg/2024-October/061766.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3fdc716d1260b4a92a46cfd2059ce044447f9172)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_24.1.3.bb => xwayland_24.1.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.3.bb => xwayland_24.1.4.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
index 7e817a7241..6f8589ba5a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "dcdb57a66cc9b124c8f936760592628ac4e744a7d7b3179aa86189ad7ea4cb10"
+SRC_URI[sha256sum] = "d96a78dbab819f55750173444444995b5031ebdcc15b77afebbd8dbc02af34f4"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


