Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64116C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.178672.1692240622718312595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=L+NGGKEm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso35694025ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240622; x=1692845422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj/6B5frgtvZWhCe/vEf6XI2gmm+OWKJtU5Y+27Cngs=;
        b=L+NGGKEmYu0g2I3WWOXiLKI/KS2dA/ODvJ5PCRcZqh5cSd65NTQSR3kH0DgJj8hefV
         3+cLI7d9W8wVJtP64GhgpdQV4OJi5ngHMyz+mbvtUhzzLJzmCJxqPnEwAX+UnOX6zZIR
         PcKYtWC8tgYJbHnxDMtRKHtzEFbV3UajbxNNdhTW90W/pydmb0tQrFAYd75HkCKCM6NV
         nCAHxdCh4bnyaAczlHQJcTzC2qWftv+gcLtN2TbW2e7dFhBz4NQk7wAwtlYsCc80LJjy
         IYm5A2JPTEfigj0ej4LM00rSDo+q40FrgYVMLCVEcQj0KrinJxJrxo7Sn0sIJ4ZLJtcw
         0gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240622; x=1692845422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yj/6B5frgtvZWhCe/vEf6XI2gmm+OWKJtU5Y+27Cngs=;
        b=Z51FTVnQNHqOfPmRIBeSg8ksaNc3f/1f7haMma83ieQ4HRZqKdwWWOOFFv7BIpBlFO
         /CDq+fek06JscZ3xRDZx6+04icNccs0BBhofS4Wi4P3UWgXX0NNbQF2FBvKHCl5MF/e2
         2wPeFyRK0KWNoZckwGrCr/mq0wJR8X3Wm/yScnZl2UBK0pZ9B90c/tdAzII5hwaMht9g
         sSMl6CcPRZ+LALGAT8wH+l0jhiKQ9L7Ws2eJzHEmO62jBf1wWSow8GFYIc4eM2xpaYl1
         CwdJoBZiMK3poBZBz6xAmmU8MJluTdnFfkhXQV8qOig3PAfPezo9XjFPljKctLZPjDVK
         KkCQ==
X-Gm-Message-State: AOJu0Yz8C4f/KXjNZSEbU5ikikddTeRtLx3MTD57+yFbzu9ZkYiDPG17
	hZRFX64qlrF7Fhbg5UYRewOVbs/wBqgoGOxtnGs=
X-Google-Smtp-Source: AGHT+IErQXqOxBXAg4F8WaBAYAm+WyNEosOzoXx/8XtI98wXJ3xf+b6yPQ6CMVRRxnEnoOThSiRDKg==
X-Received: by 2002:a17:902:c94d:b0:1b3:d4ae:7e21 with SMTP id i13-20020a170902c94d00b001b3d4ae7e21mr3729422pla.63.1692240621889;
        Wed, 16 Aug 2023 19:50:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] scripts/rpm2cpio.sh: Use bzip2 instead of bunzip2
Date: Wed, 16 Aug 2023 16:49:46 -1000
Message-Id: <ed4e4290a73b3fa0df9530a511f992e236e8ae9f.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186279

From: Pavel Zhukov <pavel@zhukoff.net>

bzip2 is in HOSTTOOLS already and used in few other places already.
This fixes bin_package class for RPM packages without adding bunzip2 to
HOSTTOOLS.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit eb3ec7469fff857c819332371ad1d586f43c79c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/rpm2cpio.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index 7cd771bbe7..2034373fe4 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -47,7 +47,7 @@ calcsize $(($offset + (8 - ($sigsize % 8)) % 8))
 hdrsize=$rsize
 
 case "$(_dd $offset bs=3 count=1)" in
-	"$(printf '\102\132')"*) _dd $offset | bunzip2 ;; # '\x42\x5a'
+	"$(printf '\102\132')"*) _dd $offset | bzip2 -d ;; # '\x42\x5a'
 	"$(printf '\037\213')"*) _dd $offset | gunzip  ;; # '\x1f\x8b'
 	"$(printf '\375\067')"*) _dd $offset | xzcat   ;; # '\xfd\x37'
 	"$(printf '\135\000')"*) _dd $offset | unlzma  ;; # '\x5d\x00'
-- 
2.34.1


