Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C34FC4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 08:30:24 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.92726.1671870615392952224
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 00:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RbkXPSEA;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id tz12so16649216ejc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 00:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWwOrzFQv1tJ/IFRx1xgmuLqkqcL2SRDAGGQbG4pE/8=;
        b=RbkXPSEAt7FsSUGkY4672FAqLniIfqjL7afN/7kazsLtcKX7sSWjsWZgUf2jcEGqpN
         Wf+UO62K37P1CTDuWu6HvRQVINSAyzBkWecupRaZNuqICcJ1TbxUNUPnMBNLXJPy6jvI
         HxkPl6OpbTJy2fqPgQsZkstCr168ymHnUFZtw+1NwXLYkX2Y/qIeVCPThDBcGmhzgHg2
         048VpF4g3t70PT9tNKyCSSdP0mAr2QDGjYTtwi3DxNpB+d77c9yQDTof1ZRIKmXKDTIj
         rDyuuEGwtNCyD8IJ72wk4s1jJqHiXY1NLK+TTY1siexUxV8fn1bX30bGF9CvSJ4WTUAe
         hR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWwOrzFQv1tJ/IFRx1xgmuLqkqcL2SRDAGGQbG4pE/8=;
        b=DO+I1eQHjXbKpBuHMHMATtNzmwEm1mcGW1UdDn1IZnXip33pvkBCfV3Qn9jhIu5gaz
         Ri7+jOl82P9Nz/PpLRhkvg7vD+62Ts2ZYF9Xcs45biHF1NuYpBMHPy4KNzPUQ/OllGDo
         cJ7VRM6QraEwh3mylU35FkLhKcoUM9hdvd6EijbhLw4/dCpOqyEw+vgVytuYX5Xulhef
         dSdYAP5gZ6dKwcSUPhBrvrjKBhIjnzpSdFvYx0r0mU5Uh0KVhIdhww3wDMCy+dIKoQX/
         YJMQ9CX37uaPr3vMZoqpWTz1RAeFHs/vL3HOdrcLbNffCdgcas2a635xtlHgzNsg0+VA
         cmrQ==
X-Gm-Message-State: AFqh2kov4BoGsOll81O5knmFORbm3zeQuh7omibNYbgCVTle34UrCfBz
	7y+WvKh7mgcEzYcA1yM30NZB8cs8jqo=
X-Google-Smtp-Source: AMrXdXvbuPJ5IAioTAjfCFn135c9m4eOJInmA8fVxvg5bI1eH2w3VIsLsKhObpMGlO78WAOyk6EoxQ==
X-Received: by 2002:a17:907:8b85:b0:7c4:f4b8:f1c6 with SMTP id tb5-20020a1709078b8500b007c4f4b8f1c6mr10847649ejc.4.1671870613869;
        Sat, 24 Dec 2022 00:30:13 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l12-20020a17090615cc00b007c0cd272a06sm2263660ejd.225.2022.12.24.00.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 00:30:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] libxml2: upgrade test data from 20080827 to 20130923
Date: Sat, 24 Dec 2022 09:30:05 +0100
Message-Id: <20221224083005.1078738-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 08:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174981

* and switch from tar.gz to tar, because the tar.gz archives upstream are regular tar as well now
  https://www.w3.org/XML/Test/ still has 3 separate URLs for .zip, .tar
  and .tar.gz, but both tar links return the same file:

  xmlts20130923.tar:      POSIX tar archive (GNU)
  xmlts20130923.tar.gz:   POSIX tar archive (GNU)
  xmlts20130923.zip:      Zip archive data, at least v1.0 to extract, compression method=store

  -rw-r--r--  1 martin martin 5.7M Sep 23  2013 xmlts20130923.tar
  -rw-r--r--  1 martin martin 5.7M Sep 23  2013 xmlts20130923.tar.gz
  -rw-r--r--  1 martin martin 1.6M Sep 23  2013 xmlts20130923.zip

  c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273  xmlts20130923.tar
  c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273  xmlts20130923.tar.gz
  f9510b3532926e1b4c2e54855b021e4b8a66ec98a5337dcf4ff07e8a41968deb  xmlts20130923.zip

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/libxml/libxml2_2.10.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.10.3.bb b/meta/recipes-core/libxml/libxml2_2.10.3.bb
index 645d102e78..6b3dd3ec42 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.3.bb
@@ -13,7 +13,7 @@ DEPENDS = "zlib virtual/libiconv"
 
 inherit gnomebase
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
            file://libxml-64bit.patch \
            file://fix-tests.patch \
@@ -22,7 +22,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            "
 
 SRC_URI[archive.sha256sum] = "5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c"
-SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
+SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
 
-- 
2.39.0


