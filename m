Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87DEC7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:34 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.30241.1683300031625016040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=JatR4SEl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-52c30fbccd4so1625673a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300031; x=1685892031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV7BCnIMUscY/Ip888SiMu3LLERb5a7QnRNhw0B5SJM=;
        b=JatR4SElM9stX+3IVgk9AZrMLeoNv4fqASPEkH/ji+G/KJwuLvwcxW+74U6gHnhcIt
         5etM2UednLscOIYz3aMCZFDaVyHXpjB8npdHIEKwdUGPkncOrb3BTO8l3FdgxX4IARuq
         4IvPuQm+JDR01ZZrFgcv2KdLHEsJoaPAMhq7PEJJXNVnOWiQaObJUfQSB1ZbflmsMAg7
         sMYCu4GdfRybDMel9t40fJ+fBI9F9f5lh+5iwx8KLwrwrEgNbiHLI9TqvkGxbRmPRCF6
         XULxJEsz/50kXWG48REha9ps5wqZ49RxhFv80aD00OyiqQG7/POExdxk+pqXSwwsXdFr
         NerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300031; x=1685892031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV7BCnIMUscY/Ip888SiMu3LLERb5a7QnRNhw0B5SJM=;
        b=SKQfDKXEDhp+lD7YeoA1ojL2tAm74zZ/FqVtdgLfkmOSrrhcLE1WJYqalXwcFfORD5
         rMkUxBtHkr+MgGt3QcFDvas4SrPYBMplXyHmkW+m+VBBY+IHVfBzyvIW0xoGF13cv3e6
         0TtozLxFYVIdvjXC2n3Gx8/F1goha7W2UoXYC7hWPTdmBAZhktNxzhzHPvZkF+eMuyV1
         lZkPFOI8DnmJYMEVRDNtBRVVOV4P9F1yKuW0hFlVNbzRVA1kAQC9btk4i+Ny5ZTKKt5s
         O7SOz0LCAXxjuNgdeYDxgba3dsTMacajDQagwvufpU6ZVHaODnohbgWVw9dPxBddoOSj
         oH4Q==
X-Gm-Message-State: AC+VfDycykiO0DK1rxQz1iOqTA720X8EDpdPebOTY2YrVIsd07Y+bzbb
	REc2DLTQecia3eii8MaEaHdY+yASC7ykA5ul8Co=
X-Google-Smtp-Source: ACHHUZ6LaY1/IoPfMgBS4FNwf5cFnyehS4qH/4s/Ve5+7Cp9hq6qNL3ZgdKTaqzpWy8bdeHxcHWemQ==
X-Received: by 2002:a05:6a20:1608:b0:f2:c2a3:3a1 with SMTP id l8-20020a056a20160800b000f2c2a303a1mr2287774pzj.43.1683300030717;
        Fri, 05 May 2023 08:20:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/35] ruby: upgrade 3.2.1 -> 3.2.2
Date: Fri,  5 May 2023 05:19:27 -1000
Message-Id: <f1741f1b2fe10d62331a11df6bbd312ae71bffa5.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180936

From: Wang Mingyu <wangmy@fujitsu.com>

Ruby 3.1.2

CVE-2022-28738: Double free in Regexp compilation..
CVE-2022-28739: Buffer overrun in String-to-Float conversion..

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b261bc704839b12769118f6f1c4207f3d19fe4fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/{ruby_3.2.1.bb => ruby_3.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.2.1.bb => ruby_3.2.2.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.2.1.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.2.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.2.2.bb
index 3f1bbc262b..481fe7c23d 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -51,7 +51,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "13d67901660ee3217dbd9dd56059346bd4212ce64a69c306ef52df64935f8dbd"
+SRC_URI[sha256sum] = "96c57558871a6748de5bc9f274e93f4b5aad06cd8f37befa0e8d94e7b8a423bc"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


