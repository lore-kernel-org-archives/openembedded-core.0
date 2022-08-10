Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C5EC25B07
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 19:59:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.3017.1660161590110957477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NkcBHY9w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v3so19022423wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=k89AaF86jSB4TFqBzTmnd1PUUFA4U5WGIDKdUbt9LX4=;
        b=NkcBHY9wZxmS1ZrIRM/RzJpd6bg/vZdjYJSImR1Jmn7VoijwfI4KEPEuwK3yNTETNH
         627CNHEFP5DmbaxarupTStgEiRpkDrwGrkQaeSPRnqZ0AdaOoSUkdFdKq7bF+MDjb5bQ
         rPCP+GrFfIwQqsCYe/PMVb1BKHABCIxvgR2Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=k89AaF86jSB4TFqBzTmnd1PUUFA4U5WGIDKdUbt9LX4=;
        b=eHn0gnxe1Th/OtOn1pfvJUe5ijpZEWjhRgJeXGR2TucJYJ9LAZPJE9A9+7steRVM6m
         wBOdbDB1Neai/P2yWcFFdG+aZKXQZLgJX8Gyq7qw46vRmfh9UG6io7U3YWwa5ZUKODHf
         V4EGRJ/naRr7o12P32AdF+KuenaxUd7SD8GEnNvgpwVPgtds3I5BGTqjqWoWvfuHiCWn
         6LARunofqDtPcB2BARi7QmpyGQcWtVFdnZQ16lTgZiaMxbiMJ+tqhWXozEINFxA5DlYI
         rrA7zLZYSN2en6SaFByu8IfH6S3IanaANIhE6rr8Mf6PhwvLbAF6R2EbG5evcSbFIFtD
         8JPQ==
X-Gm-Message-State: ACgBeo2aNxxKHC6FguSzm+yrspV7znvp75lmQEZwf05WXEB0uPvV8gAm
	3UZxEGwhII2LfDGoLkH7iAq6+j/sHK9pRg==
X-Google-Smtp-Source: 
 AA6agR67LSlyOpMxlX3YNtawsreukoe39qzA/WbwlVqP7KxbqfOTd1TmUxgFwTMC0PaJrUXpJgd3zA==
X-Received: by 2002:adf:ee4d:0:b0:220:5a4e:da73 with SMTP id
 w13-20020adfee4d000000b002205a4eda73mr17610057wro.386.1660161587933;
        Wed, 10 Aug 2022 12:59:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991])
        by smtp.gmail.com with ESMTPSA id
 t9-20020a05600001c900b0021eaf4138aesm20264562wrx.108.2022.08.10.12.59.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:59:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] buildhistory: Only use image-artifact-names as an image
 class
Date: Wed, 10 Aug 2022 20:59:42 +0100
Message-Id: <20220810195946.486773-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 19:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169207

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4ba9ec8f25d..35db2b11927 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -7,7 +7,7 @@
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
-inherit image-artifact-names
+IMAGE_CLASSES += "image-artifact-names"
 
 BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
-- 
2.34.1


