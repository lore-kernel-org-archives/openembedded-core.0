Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDFDE75444
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 10:24:38 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.104768.1696328672128010275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 03:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXsbDV9l;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-533edb5ac54so1145811a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696328670; x=1696933470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5a6C57xKbJ9k3h8B28bqFlUDwD95O4vUnS7e3SggLk=;
        b=aXsbDV9liHkM7Uo00Qh/dM25r4kYwhqZDFwOWGD96FKM5ghnq4YSk5QBtx0pdmZESy
         c3qrPZfDXah2ER0v0E4FtvXFMnnGff+x2cHk/mvHu1sfDKN7iEQhbkeqVwvfBQ0+g2Zu
         BJUG7yMvetAoJzMj2MGSex5s+Hij0R6oFW76oDmC2XWqd1G2vAwqpeJQvDlOGvfObnYo
         d+D1CRBu94xA/HTkXYV1Wfv1bMa0DLVw8BoEK+hnMCNOn6s/YD+0ns/k50lLD8tOMYGd
         5b8JWPvgOprBqwOYThKzI/u06OsZ/zUreXY9RV94ksPFiuNwzgZkZAi3k9mvP3HgqYjF
         p6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696328670; x=1696933470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5a6C57xKbJ9k3h8B28bqFlUDwD95O4vUnS7e3SggLk=;
        b=jB6dWgxFbCakh/nWe4/ogdGbKwxT6z4Xqwz91ZG7ucTaojyOUeQNikkVL/WrHoTg0j
         CuIzcMylom7Kwr+sixYxgW/zpHJh1BQ9/fcNM6EY0HFJ7ZphcNxS/OHSiHmC9qr++/uq
         pjT0JB4Q+BAneUMcr10krSFl2dGJGRdCEQwt+NRbuYn0cnaIIQHdxOgWHLabnZIP7vSD
         XWf3GUEOk/bh3qtOvtD51Qjd4iBB9pjrUKRB9YMPyoGNKXOBkgxPGzggXZYsCB8hN9N2
         IUoX3bdnmfMJTa+gd7NhEig8igD4IVi/9tCkTo/Em9ZI9pv3WDuLyKs2hnOZQCqhvEH6
         NCZA==
X-Gm-Message-State: AOJu0Yx2NQK5dpydM0vyEyFpr3Sc1B1ncXyzLndSHN/k55sF4OeOTlbs
	+zAau3r347HJRkkjk6VFnxIEm5y0phzw7Q==
X-Google-Smtp-Source: AGHT+IEuYUkGnnMQYKLXmJlEnEKyEeW3fVT1UGQ19+8BcxODxRvoF9je+VJTlUJNhcxbEVp6IFuFZw==
X-Received: by 2002:aa7:d910:0:b0:530:bea1:9e9c with SMTP id a16-20020aa7d910000000b00530bea19e9cmr10191270edr.41.1696328670126;
        Tue, 03 Oct 2023 03:24:30 -0700 (PDT)
Received: from nova.ambu.lan ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7ce0a000000b005288f0e547esm635943edv.55.2023.10.03.03.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:24:29 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [PATCH] cups: fix error in patch for CVE-2023-32360
Date: Tue,  3 Oct 2023 12:24:19 +0200
Message-ID: <20231003102419.3230481-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 10:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188628

A spelling error was missed when backporting fix for CVE-2023-32360

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/recipes-extended/cups/cups/CVE-2023-32360.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
index f1b0f9f918..c3db722f1f 100644
--- a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
@@ -27,7 +27,7 @@ index b258849..08f5070 100644
 +  </Limit>
 +
 +  <Limit CUPS-Get-Document>
-+    AuthType Defaul
++    AuthType Default
      Require user @OWNER @SYSTEM
      Order deny,allow
    </Limit>
-- 
2.41.0


