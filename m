Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2710C001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:24 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.3844.1688092160715766536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TnNIR1dP;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.178, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76595a7b111so121540485a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092159; x=1690684159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx5I/4bFz1pBh7rNmdkc4l4pyaiBoCIN2dv5fMZkJAY=;
        b=TnNIR1dP7/DFwkJBmWpuqWADtiN+1qUxuvpGJPJaMwby2fBWry/HO+t5WzrzlsjOKB
         RTgKyd1fXoZhPwf3dFMo75/Mb6dH4mYq9ZgG5nB/TL7xVfAFZcH1QTMAGS2xsOnfCwCQ
         BiUWdBTZyBWeUz1xuFUr6Ey4jdmdXhXJZz17PBOr0ftoaI9MhEmsGz3U0wXqZFjvB2ho
         jQsnGooqGfjcHE/dgwtYf0ee/+umTQ/KxJHYL5e9Q7+2WEU/uJdp2o7HLm5CmSHGVEnF
         rpgW4oswFVJxPKfUmpzV9OwNr4EnV6dRaKYvgdHWbQJgqTSbyjRyGcJn7fTY2gW75NE+
         61jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092159; x=1690684159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lx5I/4bFz1pBh7rNmdkc4l4pyaiBoCIN2dv5fMZkJAY=;
        b=I9vsmUWfmLQEbap1o0KNACxARqI6P20iJ27f2Fn+sB+EVV2OWtsL5nQW35WuAb2xQk
         EakMJlppbPstjiEUrrvTvka4ZOfoTlViJFW7kIO2kohjVcpl1JV2b8mCo8pVQAwXet/G
         X3QsBgpbBkcWbQFtIYlbr3ARThoXTrpIBianehIuWw5guXv20a53A7q2fYXrDcGy+YwV
         o6IC1pGnbvn3A/dVK34UILlQWFqNiv+QmHj1uRdgD4IYETIiDqrShKN7PHfASHnaslE1
         kFQOWK07xZidxEjWcHvBLb4h8e8JmrJKSRIOwEApD51D1q/jNyu5Nl5ioMAT7VJYHUE3
         2tEQ==
X-Gm-Message-State: AC+VfDx3/gyDPrRU17HD/eRsLrLY1dgoLIKSE4Os5oXi3obqERqNYVNF
	5DRh3mg502y9o16G+eCzhlh8GNrghK2vbYe+glglBw==
X-Google-Smtp-Source: ACHHUZ5516yQvvJh5s2oBO6dZ+FfHKuVZUw3+yAh33bD9lxIY8lzfVWj4EhWQ1m1CDS1j/BNK/pBKw==
X-Received: by 2002:a05:620a:2042:b0:765:abeb:a14a with SMTP id d2-20020a05620a204200b00765abeba14amr1045428qka.45.1688092159482;
        Thu, 29 Jun 2023 19:29:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/30] apr: upgrade 1.7.3 -> 1.7.4
Date: Thu, 29 Jun 2023 16:28:40 -1000
Message-Id: <b308bf9936a9897a9d8ec07b60d811ee223b500f.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183644

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes for APR 1.7.4

  *) Fix a regression where writing to a file opened with both APR_FOPEN_APPEND
     and APR_FOPEN_BUFFERED did not properly append the data on Windows.
     (This regression was introduced in APR 1.7.3)  [Evgeny Kotkov]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3db1d7fc97415f1d2af3f694723222ad81de13af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/apr/{apr_1.7.3.bb => apr_1.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/apr/{apr_1.7.3.bb => apr_1.7.4.bb} (98%)

diff --git a/meta/recipes-support/apr/apr_1.7.3.bb b/meta/recipes-support/apr/apr_1.7.4.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.3.bb
rename to meta/recipes-support/apr/apr_1.7.4.bb
index 9a93fe0967..e571469341 100644
--- a/meta/recipes-support/apr/apr_1.7.3.bb
+++ b/meta/recipes-support/apr/apr_1.7.4.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            "
 
-SRC_URI[sha256sum] = "455e218c060c474f2c834816873f6ed69c0cf0e4cfee54282cc93e8e989ee59e"
+SRC_URI[sha256sum] = "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.34.1


