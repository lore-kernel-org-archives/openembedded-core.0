Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD85BC3ABC7
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:20:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.128394.1726453203046266935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0GsqF7eX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20551eeba95so23364555ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453202; x=1727058002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nrdX+bpAHnbMqAGDeCRN+VoKUyaOy/BZ/GMqbsarv4=;
        b=0GsqF7eXOo27+hHfraWSqaOTsdmSwlEx4Co7Kd48As2Vd+ygJVxQt16n7jQrphyyw/
         IUy5jVzjGyQjuQaDoT1mypKFe/F3UX+jmgpcfLn4GPQ2NOjncyPkw9jzfQAn37lxhMMd
         1hCItoTj0NJwXsCPY+GoyFoJ8uH1X+iR4jN2UiMFrakhvLZ0j/XyuEcSlWF12ncZBFUq
         yNQiUMjcTjHg8mRdJ5YOA49m8OXPlmtlNfsIoT6g1CZzKGb1DQShsQJYU9WTxNdgitOR
         bozxeotNq22zoEEIi30pKQtKFv2vCB6wnasFGCpxlLaJtREF6mqruA55JmvbqrMNy7rp
         ZIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453202; x=1727058002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nrdX+bpAHnbMqAGDeCRN+VoKUyaOy/BZ/GMqbsarv4=;
        b=jNntVNVoLBbtqcJ5aqnnsbH4MTSpAKyTBPNAsgTTTl5QUEi1bJxnMqFq/V+2UEE2yF
         IoGsxY1h58svMkMnLQn/Eg+Jgufk0HQEYydiroYW7PbushQ4mW5/Z8u81kOXSBmL4pJq
         ME7zS1weabPhOWF9Vv6N1AJPFjmpOkZE8EJ2kYWp0zCcgNbgD9NhArPLOeIxgAQ7jGav
         1dVYHSjZEC06w5rTwBqQ4NldtQHg9guBH63Ny5vA4z/xHvDGd3l3pjGZfXdT4tfXicMJ
         J2t7a/lZf0lXmm5xfJ3JflPEEZeLVBmSYnnY6l8hlF7HVvXlyE+h/ccIiJ9U9I2Og6Lz
         SR2A==
X-Gm-Message-State: AOJu0Yyec6v1IVE4WroFa+K7R2hwRiCEFaAC1uUolf+XY+zP2uzoD5bF
	QBvHBkq2b1Ml+VnIvurojvGHKQE/Pz9QmT5+0opZTfAYaxj44w/pAeEbfZFNJ9Swy3tueQtXqnW
	XgTo=
X-Google-Smtp-Source: AGHT+IHNNbJJOBZNMaB4T6ciByAl+pxutO5UUQc7fgHs+I/nDD7zjzIrd3yJA+Bs7j4KSjcdwWNwEA==
X-Received: by 2002:a17:903:41d2:b0:1fb:1afb:b864 with SMTP id d9443c01a7336-20781b425e8mr155320385ad.5.1726453202297;
        Sun, 15 Sep 2024 19:20:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.20.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:20:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] ruby: Make docs generation deterministic
Date: Sun, 15 Sep 2024 19:19:36 -0700
Message-Id: <9ed723d1972b4e1bd1ae799661194ccbd4c6c759.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204600

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The presence or lack of nroff on the host was changing the doc type. Set it
explicitly to be deterministic and reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5053abb8957acf358b518ee3c76146dc5f4eb6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/ruby_3.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
index f1aff315b7..508154dad5 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -75,6 +75,7 @@ EXTRA_OECONF = "\
     --enable-load-relative \
     --with-pkg-config=pkg-config \
     --with-static-linked-ext \
+    --with-mantype=man \
 "
 
 EXTRA_OECONF:append:libc-musl = "\
-- 
2.34.1


