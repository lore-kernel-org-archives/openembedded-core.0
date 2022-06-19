Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AECC3F2D4
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:17 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.22092.1655667076258179197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ai6Q74N+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id bo5so8469122pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XnbfbcLRkjwx7eHchV2H313AxRrqYjvHK9z17b02mMM=;
        b=ai6Q74N+pNJd7ylTRc/vWU5a4rT146Lh9KjVnAkZo1dC/w2P0c0fE4DEZYG0dy9tQ3
         I6yJWIggBpG1Nv9nFqlN9ocNRytnS8qHYdW+RZ419jWqQ1GaaNUxCJb14p5w3OCyPXTE
         fp8VwKCNXecCV8bB1Q48ONtK+o934wlODNCQYxw6ZTyAWdhJh+cF7D7AeQvR/lLY9bSw
         pbc9pT4vV4od5VOEnzlLq+MV7xbMCOnXcO/kfatnO/O0sRF9D6auHC2HbDIaGYE9iDcr
         w8M/slXa+wEpQlsYw79rL1Q266OJtYHzLb4hShjMKxpxzdCjQQ/Lxnq43bItsQmRAAi0
         +vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XnbfbcLRkjwx7eHchV2H313AxRrqYjvHK9z17b02mMM=;
        b=qFxgYdtVHuW6wpkAlAtoRbMOL7rq6byMxnOMOHYEpBQI3Ho4E/rJ4Dy6OIepd5HGYZ
         nn1sLjoHlr0FUwsGEcGzaP4LtkSUqn+Oco1G5GrLQBTEuvf8bZi8DjA7Ej1LyBldunq8
         X1NLi5MdFionjR1vBGeFOqeb90y8aUs+ZkAKP0TjJGSbNHCV4mXpegPmvRu1WuhoQggU
         hgrtHhhUtMYLjfpB/FVg5xdaUfjvPqDkepS0h5YGM6iX8iO3bWJbEvWVzCN9n3roKMPU
         lHWUI2fHHA1nO2K/slgWqSfB29pFvKYrUOIGyrNox+kLPTBnGhEwWdwro4WRqPN0go0i
         qSCw==
X-Gm-Message-State: AJIora/TIIPPwtvQCty/oG8Sr7JHVaQ1CZdWjwRQ+JvRhooX7bqghsIP
	anHJMFXOAMNJrjA0Gx4sLjAzhinxrBPis4/v
X-Google-Smtp-Source: 
 AGRyM1tPADdbh3bACrR7XA6Yyp6zCYfumykGspXWzI0jIGfhwBdmSaQ/N/yJKkPbCvRUC4IXJ6p/PQ==
X-Received: by 2002:a63:3c0f:0:b0:40c:8a83:fc4 with SMTP id
 j15-20020a633c0f000000b0040c8a830fc4mr6642344pga.397.1655667075283;
        Sun, 19 Jun 2022 12:31:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] archiver: use bb.note instead of echo
Date: Sun, 19 Jun 2022 09:30:41 -1000
Message-Id: 
 <d8cb65b2aee311cad4d174e0770bcb6ef51bedf5.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167052

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6420c8a6a8143f53ccad7ab2d56b2ba06db83099)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index c19c770d11..8d026067f4 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -579,7 +579,7 @@ python do_dumpdata () {
 
 SSTATETASKS += "do_deploy_archives"
 do_deploy_archives () {
-    echo "Deploying source archive files from ${ARCHIVER_TOPDIR} to ${DEPLOY_DIR_SRC}."
+    bbnote "Deploying source archive files from ${ARCHIVER_TOPDIR} to ${DEPLOY_DIR_SRC}."
 }
 python do_deploy_archives_setscene () {
     sstate_setscene(d)
-- 
2.25.1


