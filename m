Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762C5C32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.4431.1661294173792572924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TBX/0Lxh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id y4so14084220plb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=j5uZ4Yy4LHKH69RQ54YYoQ0uh/3HMdUwJ2v4JIm+h1Y=;
        b=TBX/0LxhwmGHgTqf8PkR9Q0SDPJf7tJvWKC0NNVnyYvhDR+S2Arh+08yPv5DaxrR2I
         ocv0QYiaiRAjKZ4WsMlFAE6vUdJb3ihEpzLU6S0W6uT1OA2retLNU8ETXO0kJgB8ZBgA
         0HNPBbhHlp355H8Zai+4o2UxMJ8Rc0QHCQXG/Vk0UaFidULax8fGoF08nmKmqGgZzL2P
         6xKGt4rFhKwXf6kDiOKB71y5FP+9RXWW8VygTnPAzYNJkgx2HQvBH6Ys5mSMlk8isEUq
         1xiH2CTOFTHXlKhXZMopNoIsb7E2i5rwDF3WvRNYkr4oI7iWrQuxEvdAgWO/3Nq2a93d
         kYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=j5uZ4Yy4LHKH69RQ54YYoQ0uh/3HMdUwJ2v4JIm+h1Y=;
        b=R1yeBjXSHFyWAAVWHOwpaZCXyeUrgaZAFmFwdvDLMtp9VIQD3+7aDcShFSDZaUwkUI
         ydY5/3KmKVTWNm7G+GTU9xsjsDE4QJLHBJbfKfdpO2N1cbRQjb2DbRG4MPhZXw6vGZi8
         85jCnvnXQHhtIR7ZWOVXk+OlkdPhVYXrpF7K/Yt9aZaTzrVGZ/aaIRbqrpS5tK53JIsb
         C9AFI5Z3xVrV7yDyiIPkcdteONtvp64hP5VwdO7mNDBW3t2lcfrVjczDtdwvIn8wmiXe
         RQ1fiXw4iMx5dV+mRvvOHsgcMX+9EEHcHpqzFJMIecaBSoV9w/LC351gCBR+uv5sEfxk
         4vhg==
X-Gm-Message-State: ACgBeo3rn82XvT+bMiT/qYiUAEIw9PLWHnGSYgYcuLiYBL6Q5J/6N6Vx
	BL71+VadpLM6TY1BjL9EBa5xmsqUOWqG8tMI
X-Google-Smtp-Source: 
 AA6agR6pBXRBznOI3KprdVjAUoyy4owfGijYEJJ/7iAWtAJWvoma2c9JJraT8GBX5aA4A601uBkelg==
X-Received: by 2002:a17:902:7404:b0:172:951f:bf with SMTP id
 g4-20020a170902740400b00172951f00bfmr25931774pll.33.1661294172888;
        Tue, 23 Aug 2022 15:36:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/28] ell: upgrade 0.49 -> 0.50
Date: Tue, 23 Aug 2022 12:35:23 -1000
Message-Id: 
 <56b8dbfa7a0d70306d61c7f21125232bc6a2e34c.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169743

From: Alexander Kanavin <alex.kanavin@gmail.com>

ver 0.50:
	Fix issue with D-Bus use-after-free crash when removing objects.
	Fix issue with DHCP lease expiry based on frame reception times.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a9c78fb94d04c1b38d8d0f2cb283e19ed513a12)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.49.bb => ell_0.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.49.bb => ell_0.50.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.49.bb b/meta/recipes-core/ell/ell_0.50.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.49.bb
rename to meta/recipes-core/ell/ell_0.50.bb
index 9edd6fc92a..243ac01530 100644
--- a/meta/recipes-core/ell/ell_0.49.bb
+++ b/meta/recipes-core/ell/ell_0.50.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f"
+SRC_URI[sha256sum] = "0fe51d51c6eddc2a2784092f1dfdd1143a5ef27f15c274ecfbadd680d3a72fd9"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


