Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52880C636D7
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.19505.1676150676880207867
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xftxMiyy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id b5so10041083plz.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wpbth4vT+/U6N3nIc/ggwPLwOoAu2R28pixeDov9mlM=;
        b=xftxMiyyexIadY7t1TovZnPZrsyXaAjXgbmGpQJr+7AG9QpwxAfnMGsqJi/hq12yaR
         wytnBd3s9xIVV+wUD58FpmdGBL/YfYyROglIiORPK6edMQnANxalg4mgUN/gBYYT60Sh
         ZRoJvX8F94ouNKcZiEpAfBNHBJ5MOsLPfsJMj0EBdHLNp6nOMo5OyUg+6Wnll+N+7s7K
         PAquRL/h4QTDrIWNVIXw5sLXXnez0OYZM5+kbvfgeSJwhTXrlLpxZ31Yp/gAzttDbRM4
         8x2tEEgDOshc2l7e3BJUzwlKqGvUHl/Z9L7Xd9ZjXU1iohztBHlVXdthrFmWelehsRRm
         W8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpbth4vT+/U6N3nIc/ggwPLwOoAu2R28pixeDov9mlM=;
        b=pTI1BtBuuQ1Ra659AeAr6h/wnnzxNSP51LTAno6rhIad9hdkrv4nQ+8MBRalt+iLPa
         NONrNwuUBq/iTNkhZj0t3e5ndlkHj02MtW+rg5gpFIUCsRIkTxZVuLKO6zr7Goil5OA3
         qBGxag0PQqFSCJPyycPQutIUMV2mvCv7lSH7NjwckmrDFUEZeMbtHEYIdPbJyMglNOVT
         5aGjIy6PUA2KFlmipodYENOzrpF0hm8rhbiQ09oy5dATtWcYlSWTO780u491+dfEkKut
         r6KBXoc7WKTxGzUHPJlymDOmdXsEOT9tPRENB+w3Yasl7nDoS+VO1GFdchUkpZkVPVLW
         YY5Q==
X-Gm-Message-State: AO0yUKXZ7B7t1yyEIbg78BN/Ik72/l6at9SKD+8VgLQ0UVzo2LXcYijr
	ICB7E8iAVUPcb7OeTobEvtW3WNH8MazNIUtHqKE=
X-Google-Smtp-Source: AK7set88VsFNlYur8HMT5p1JMML1MylqfBY5emkuQynYUFSy3Cf9HoYoRK9D/1aMf5uYoQa5c4nm3g==
X-Received: by 2002:a05:6a20:8428:b0:be:8d91:cb92 with SMTP id c40-20020a056a20842800b000be8d91cb92mr28060552pzd.24.1676150675976;
        Sat, 11 Feb 2023 13:24:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/28] testimage: Fix error message to reflect new syntax
Date: Sat, 11 Feb 2023 11:23:45 -1000
Message-Id: <7b37e52d95cea7759e7302afce99165b127b4abb.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177032

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec73d19d78e8f30ff9b817490c23bcdf8ea47c86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 5cc408b0c4..df22bb2344 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -236,7 +236,7 @@ def testimage_main(d):
         with open(tdname, "r") as f:
             td = json.load(f)
     except FileNotFoundError as err:
-        bb.fatal('File %s not found (%s).\nHave you built the image with INHERIT += "testimage" in the conf/local.conf?' % (tdname, err))
+        bb.fatal('File %s not found (%s).\nHave you built the image with IMAGE_CLASSES += "testimage" in the conf/local.conf?' % (tdname, err))
 
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
-- 
2.34.1


