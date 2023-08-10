Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBFFC41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:04:57 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.21364.1691683495617316149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iPEtfGJQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686ba97e4feso964840b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683495; x=1692288295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtQUvF4Ug8iIAJPndPw57gBkxFQGIwcgEp9r3WaBGt0=;
        b=iPEtfGJQ8aGPFL1+Hh2U6wJrzL0Oj8g3fgzaFZBW20dh7pX+S0VmjoBBZ8HxVvObU7
         uVoDlXbh9rLJimFzTEnsOZsIUsLsuQ/FWAGeklFg6o39gotFz7UqRJ8ncgw1GNFiFvHY
         VPRIKBUdwxFR9m7DAek5UL6PAfI2nxKx1WjZGZIqyxoLqoAZzpVhlDNihJ7xIiKUFQDr
         ab/XXPG5zdalR2fPM/UuM18xSiw+VW1e7LasEeg07MEM0YARygp8h4dUAFSAg94sAR27
         H38rKveMkqItsqidcGU0ETB+l2V9ljzt9L0j8BhRUloQPMoy6ksFeEZfoZAtaYa9ZdQ5
         QSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683495; x=1692288295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtQUvF4Ug8iIAJPndPw57gBkxFQGIwcgEp9r3WaBGt0=;
        b=COeVCLbE2wHGSosT7fCw55lc7MNpwdSuUd0q998xVF8YpvoflBFm85rVZvQEcOOzNQ
         14wgyCh16FmqKBTJhGh2JIi6qyhDDSX/sdwOcMHyM+7Cf78zCewKYAuuM+GjE8WSrT5Z
         4xooyCXMSxbP3i60NsuWd0nQg4mbcMLfYLAZzNvua//51WCGT4Fll7ny+ju8KlOSDx7h
         VHZregx7QoZE+CDjc4kZAIM6tBLGwCwnLBHqHEBU8qWaOScTzvZp+Lu8vaJiqrQ8iBZA
         hanOQ7jQLRFiTkm/5evzBFZoUg1Nd7830UikkMfD3DbEUU+/bEZFY9eVqmndd1rnHIsX
         g2/A==
X-Gm-Message-State: AOJu0YwPceegMC1BASw0I2Wt8+JjV8uevRlDqDp3BVS1eU80YzL/2L92
	+EDBKR7VcFxTD0qC/L3YCuy5oKCZfvaaBlr1hk8=
X-Google-Smtp-Source: AGHT+IFeJVh3gUu/8ppakQjIK6dUDWcHI2Fma2PFH0vrkjRtXpOPBaN6QpGqvy2RuXjZrmfwzPRuRA==
X-Received: by 2002:a05:6a20:6a25:b0:136:e26b:6401 with SMTP id p37-20020a056a206a2500b00136e26b6401mr3803112pzk.16.1691683494542;
        Thu, 10 Aug 2023 09:04:54 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/37] libnss-nis: upgrade 3.1 -> 3.2
Date: Thu, 10 Aug 2023 06:04:04 -1000
Message-Id: <cabadc004bd6ee6501166aac086ea8faa85da502.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185767

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Do not call malloc_usable_size

This is a namespace violation, and interposed malloc implementations
are not required to interpose malloc_usable_size [bsc#1207551].

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cd967503c0574f45b814572da9503182556b431)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libnss-nis/libnss-nis.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index d0afb3ca0a..f0e687c330 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.1+git${SRCPV}"
+PV = "3.2"
 
-SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
+SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
-- 
2.34.1


