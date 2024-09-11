Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45D8EE57F6
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:07 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.35244.1726097046300615096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IxYQr/xB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7c3e1081804so233815a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097045; x=1726701845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AA28XAOuv+r/HD/4UKKW5bRroA6WfyG197WLAv+kUM=;
        b=IxYQr/xBtxR6cViJjdxumOuqLKlYA+cWZWNU8pms8OTlcQIbpeP+yLTqWqiLaBuQpc
         Z4+7v9fx4TvA1egSXd/bpjr16QCQTCcog0BkQO42NdM1xVkQb0Gp97+jTdTBZHldsQFc
         fBQ/MJJ7CMgtr0oVYT7Hp6NjmKoRu/8ki/hhLuDCXDj1dpAV88520xa9hZo4VCXhrl1P
         f4SDLfwngRcdodcfhNRpGQMH1BMmSJe3RHPC9oOO0aDNghGHUEhQbctAAS1LnDtphPR0
         14M4MKwG+pbVHmac2w9bOu9gckVJs/uV4bNYDaKuM4q83XgnD62lqSnltwKzopJrULWU
         4T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097045; x=1726701845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AA28XAOuv+r/HD/4UKKW5bRroA6WfyG197WLAv+kUM=;
        b=CSo34o/0cw9OR2kdQdReCSD/fBOTrn1OerUzN70WuFAIMyl26r5dZQRPPyLEFC/o1t
         kex6KEAUs8CvCHNNrQRA3PBxYt1Nkykcg7K21QvA1U3twPh18vnRWnfzoVyQOfmhrWCm
         PLnOefZ9cXrP0e8EufaMWq96bN929W7Ly8tLfwEzj/zgvZLHre7AnfyIAllUMfBlyjHX
         JE09t1EJuxIXDEZPvnbcvObLQ6kUwk51J9GlZJ51p6a8mNF466bLW6JNKvgMdvKMC9tb
         U/on0ljFii6KRYJACyCcn3TtqydWy4fDKGDgRBXHRdhlIOFOLYO2CC6oir0ulz8ZKvOW
         g9lQ==
X-Gm-Message-State: AOJu0YxI9CQ/BsyuRbyC1iiluApMZIo1jDkNbP03eoI2bxzyiEz6FSVy
	pvP083jLn8N2hH98IwFgS1N1MVz1Zz9oB4OPliqILUKWVyBD6YUZUswANKJMdLxY24EKsK4nuP2
	I
X-Google-Smtp-Source: AGHT+IFQeICXEmpaXCWjh5sUnGgiOqlAGOrHq7kGgG1p3avkaSS/ik5c8pQlsLzb2etzftGFqwlqlA==
X-Received: by 2002:a05:6a21:390:b0:1cf:24f8:e20e with SMTP id adf61e73a8af0-1cf75eefc07mr1060662637.17.1726097045562;
        Wed, 11 Sep 2024 16:24:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.24.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:24:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/22] ruby: Make docs generation deterministic
Date: Wed, 11 Sep 2024 16:23:18 -0700
Message-Id: <dd857d2519fd4f38c67a6fa0087f72798166467a.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204415

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The presence or lack of nroff on the host was changing the doc type. Set it
explicitly to be deterministic and reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5053abb8957acf358b518ee3c76146dc5f4eb6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/ruby_3.1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 7a927d2041..a00df5d191 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -76,6 +76,7 @@ EXTRA_OECONF = "\
     --enable-load-relative \
     --with-pkg-config=pkg-config \
     --with-static-linked-ext \
+    --with-mantype=man \
 "
 
 EXTRA_OECONF:append:libc-musl = "\
-- 
2.34.1


