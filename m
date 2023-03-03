Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F97EC7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:57 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.27606.1677860268373605161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nwOtnfn2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id y2so3026575pjg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3V1XsZ8M0WjetKTJHxDXfXPaG2lYb+vKxPpjZx6VUAA=;
        b=nwOtnfn2bNcK9+olGrgfE6fGtYpI/rn8uU2q3PZLzOBxSiNdsLWBX7jWLfdkXHnqA1
         sz2KbVIJZBGGEf7CNAp+Bpo1l6r7iJdPZv7LIPocFRmwB7AodeIO0t4fl5utwWmBnKVH
         HpKHzRfL+ddfH6o59uEsQWKCY7m8EN5di3ZQvYQMsu3cHx2OqpvWwgR7j5p3K4RQlRqs
         hj4rfYJavgEwmdnu+0rpQzug3S6WOAxqtg9Ye5Q/yN+vmUaVh4ur4u1HP++yHSiCa1sd
         1YhoTwQTdJUeTdOgXQGDj8TRV9f+JdtX8aWloSOatv7EV5Uke5QWhGDKWwgtMXNGj88M
         JhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3V1XsZ8M0WjetKTJHxDXfXPaG2lYb+vKxPpjZx6VUAA=;
        b=EpWhvrjPW6RGR6FaeH5j65QcM+fL/oXyqeZNO1l4Xr4UUMxXaqqSW1kII9muefW8Yu
         j87He3zrx/yIiFJLGFrB4d/lIlvBRtf87o9jIg1Z8hXhUPJmRXRkC52rX3xBWLq+2llS
         uz7ti3eyw6Fi2PC2xY1dK3PIecTSZaveEO/51mNov6PkEHRhdsR0BRcGGv/8CJcQGlLU
         NG73U+/NIDD1W9MDzY4uWPefv0PJT0pbXr+PD8uLG9xUNl3tXrseIMVNMhn8ehtqVir/
         L8IaCCd/oAzja3hQJTOgUCKH94pP0f79sIK3Ks17SPj6wG03AvB6oINrJQPDtXld+294
         EAyA==
X-Gm-Message-State: AO0yUKXlqViJuwk34tA3UJS+THoJUtzolRLtBiAW3n9EQakQVhrJ8NCZ
	wKnML2gGNMxiokHdMNaHZkdEeQKI4h5n0ezRz5U=
X-Google-Smtp-Source: AK7set/8W5N/gguQbqCwoyOwqaB4zNzWnXoxAvTfnmd4688OlavGUHBpcWbfxqTBe3IqzTH6rmICZQ==
X-Received: by 2002:a17:902:ce91:b0:19d:1dfe:eac8 with SMTP id f17-20020a170902ce9100b0019d1dfeeac8mr6711260plg.26.1677860267452;
        Fri, 03 Mar 2023 08:17:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/29] xwayland: upgrade 22.1.7 -> 22.1.8
Date: Fri,  3 Mar 2023 06:17:07 -1000
Message-Id: <5dd1721731dec2a322bdd305d8410179580ab4dc.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177998

From: Wang Mingyu <wangmy@fujitsu.com>

xwayland 22.1.8 - Security fix for CVE-2023-0494

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0ca374267cce807d12d706564989900fe61bd97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 964ca02debe1e85cb91789dee1d08344f4fcf33a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.7.bb => xwayland_22.1.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.7.bb => xwayland_22.1.8.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index dd32bd0111..6919ba421b 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d53afac6c71953f5cf66d03d289dacd8961da5bd309c1dff125d5955d9db5f76"
+SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


