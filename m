Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE2CC001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 16:14:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.1479.1689783281188872994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 09:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=aRA3hXHu;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76595a7b111so559597285a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689783280; x=1690388080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz43sWAf1ED1DpnRvrGsEi6UUJcfNYSWMXpc1dny9qg=;
        b=aRA3hXHugP0eaXVcGji4klbEJW1mxjnlRm0Lf7IQuVawbcm/Un6E6L7eoDPzumn6ms
         xP0J7NMQaTdOVfbNw7+AAx2CETJjzTLobdLYmJWISzmfKQuWNXogx1mo6JobcDVL8CDU
         eTFMv2FoCZz8fH5y0at3ahnCwDY0aMGL6DGxSLaMo7vUl7avfFrrTFQy8sIdfyiU0aND
         wo0qDrSttE+HcCILGoSomV92C0MJV6J8AKQEZ+FCTE2wY8Beqi9fs1PzKZrAPhnnVKF7
         15TY4BTeb5fmuplhp5X/7KBkrthP0pGy7UAuwj4a6HG12kQvtFtzlYNjFvUqSIITq5GK
         cKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689783280; x=1690388080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz43sWAf1ED1DpnRvrGsEi6UUJcfNYSWMXpc1dny9qg=;
        b=C+DNYADOG1lhg9Uds/DjsqUc12iSnhU6OB866HK0H6xWOtsk0twi1UcwlCGylkBFq2
         RM9Z7kdPUkiwXsr5cFuKxRy5w0R/hPOpWvNQa7eQFpKD0r70eAe52hqSj1Ntn1JRZGzg
         E3E+m+SDS1snPesB3tu3/JBUIfIBopAyYIBltuda1GJE0F3mykrTbTHzw3h6V/4QdS+7
         hHfS3qeIMtikxPOYKCWmtwhDSSOhnVrzedILmhb8hq9gXv5z5XNOcwzYfSBEUrBybAe0
         afGURihwkqi/MYq8g9qDR8J+7KepSJC8ZDFTfDNbFM+SsQGx84i791ZAjjygrbiGpFYv
         p4vQ==
X-Gm-Message-State: ABy/qLYz3AmFa1NT31ie555Tfw3hZfCSS6+29wvLIKh7XUEBUT+8vHTT
	krGIX07tVaH+gUcG1hhLjpYmeKF9NsxQqLwOGZQ=
X-Google-Smtp-Source: APBJJlGXxwmy9FH8aQYYXBy54HMiT0o1Mmc24YfiQf1+Sw/qOBUzT2k1XyKVakzGi5VmdFbDlnk5Gg==
X-Received: by 2002:a05:6214:14f2:b0:63c:639c:4184 with SMTP id k18-20020a05621414f200b0063c639c4184mr4587908qvw.21.1689783279876;
        Wed, 19 Jul 2023 09:14:39 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id x21-20020ae9f815000000b007677347e20asm1348955qkh.129.2023.07.19.09.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:14:39 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] xeyes: upgrade 1.2.0 -> 1.3.0
Date: Wed, 19 Jul 2023 12:14:38 -0400
Message-ID: <20230719161438.291928-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 16:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184588

Use the sha256sum for the .xz archive instead of .bz2 because of
upstream commit bdd57f3. Add SRC_URI_EXT to match.

Changelog:

637b948 (HEAD -> master, tag: xeyes-1.3.0, origin/master, origin/HEAD) xeyes 1.3.0
6f6c975 Implement multi-ocular support, add biblical example
f30ef4e Print which argument was unknown before giving usage message
e7a54da Add -help & -version options
e38962e gitlab CI: stop requiring Signed-off-by in commits
c060e6d man page: remove out-of-date reference to X(7)
ebbd57a Fix spelling/wording issues
bdd57f3 Build xz tarballs instead of bzip2
700a551 gitlab CI: add a basic build test

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../xorg-app/{xeyes_1.2.0.bb => xeyes_1.3.0.bb}                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.2.0.bb => xeyes_1.3.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.2.0.bb b/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xeyes_1.2.0.bb
rename to meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
index 73d09f058d..3d1a7063ea 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
@@ -8,6 +8,7 @@ PE = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 
-SRC_URI[sha256sum] = "f8a17e23146bef1ab345a1e303c6749e42aaa7bcf4f25428afad41770721b6db"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "0950c600bf33447e169a539ee6655ef9f36d6cebf2c1be67f7ab55dacb753023"
 
 DEPENDS += "libxau libxt libxext libxmu libxrender libxi"
-- 
2.41.0


