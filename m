Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F5FC10F1B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.22437.1672418716089303306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4hMRks4r;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 79so14492532pgf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65aBECe4JOkAy/ByaKjw4cTcAKO9EVydTCfYR1P3+Po=;
        b=4hMRks4rIuxBSWA4FuKFg9POtqvF5U0k/iynUdSZe2Dt9k+WhXkYmPS8CU9AyrmTww
         FmTMD3Sb1gbHpTAcYtwSGCMg/EaRvIw1usoLso3sH+xv89ZZlCWDfcaZtefJnxmP+yeV
         vNg8HvJuV3xKPq2zCd/W/Lp33xyRClQRxSMkXaot9ppDbT94wM0qoowh1QOByUuUWDao
         I8Z4zYH0Y3O8RLAx6NYdbuJqnTDygNpa6hQzQN2dzhiqplYEh8VSwfOYIOSkUOuI+kX8
         zFodASx8hotL1ahEJqktN5Sn1TA65PTSucXJl9b28llwopHvLLhtsb31UjD+BtJUPGpq
         l1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65aBECe4JOkAy/ByaKjw4cTcAKO9EVydTCfYR1P3+Po=;
        b=YGs+9oVVtH4wKW8J0vI0+hUWXuR/QovZ3nSDHHEQBjskzFV6AD7Uz9dlENPEhIyrUx
         I5hbrTPqxu9KiklKN9XCPrRHvntCuBnkKwtmLcIfVO73fPTztaRURJbASLhGQAkXFEYO
         dJeQOgQo9ERpB8dz9sT+bvK7JGBr7VYnKO9K5X/0v29igEwfXIRhg9/i42vrlzNft0YL
         qi7ymbMloluho2Jo+caUbyQ32ei2qWfJ85zU+czyb4L/JQvZz44dGUQFdhgI/1jZQyNe
         Kt5WV8G3to+5Ybwhy7y0QiHMNbnZG1OxL33ZWvulqmICcppv/Qan+8MV47ZEN4gKFlIk
         pyjA==
X-Gm-Message-State: AFqh2kq/j3fYcvfEDV6o0JyLwPLpbFKsoEIE1z+cUXFmCFc+B0ZTkQ7C
	qkcMiYljP2B4vLHe/9vDVVUF2aLZJ23lx1cxLsQ=
X-Google-Smtp-Source: AMrXdXuAzwm09vsp3XvngNUT8SMDMXvjoYjGcBMDfVzhKLNQwnXb7hG77ELD3qlYnwHQltLOBz+WGw==
X-Received: by 2002:a05:6a00:99d:b0:581:38bc:b5bc with SMTP id u29-20020a056a00099d00b0058138bcb5bcmr23175333pfg.1.1672418720339;
        Fri, 30 Dec 2022 08:45:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/22] libxml2: fix test data checksums
Date: Fri, 30 Dec 2022 06:44:09 -1000
Message-Id: <fb9c4d7b78f4f6b785cad5f7596a7392ae6fc568.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175160

From: Martin Jansa <martin.jansa@gmail.com>

* switch from tar.gz to tar, because the tar.gz archives upstream are regular tar as well now
  https://www.w3.org/XML/Test/ still has 3 separate URLs for .zip, .tar
  and .tar.gz, but both tar links return the same file:

  xmlts20080827.tar:      POSIX tar archive (GNU)
  xmlts20080827.tar.gz:   POSIX tar archive (GNU)

  -rw-r--r--  1 martin martin 5.7M Sep  1  2008 xmlts20080827.tar
  -rw-r--r--  1 martin martin 5.7M Sep  1  2008 xmlts20080827.tar.gz

  9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d  xmlts20080827.tar
  9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d  xmlts20080827.tar.gz
  96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7  /OE/build/downloads/xmlts20080827.tar.gz

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index a2ed8d71bc..5d236e70fa 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -13,7 +13,7 @@ DEPENDS = "zlib virtual/libiconv"
 
 inherit gnomebase
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testtar \
            file://libxml-64bit.patch \
            file://runtest.patch \
            file://run-ptest \
@@ -26,7 +26,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
+SRC_URI[testtar.sha256sum] = "9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d"
 
 BINCONFIG = "${bindir}/xml2-config"
 
-- 
2.25.1


