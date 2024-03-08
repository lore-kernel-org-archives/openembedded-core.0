Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171CDC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 04:57:15 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.14034.1709873826203817417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 20:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZeWhRinj;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: nikhilar2410@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso562162276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 20:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709873824; x=1710478624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0YJzpSKQ64f/qB3CyjJU/eUEY/Gl4j+ab9hXSdbObg=;
        b=ZeWhRinjGNe1yi2RTOMZqxVecFGibmMVoazkOJmwG/dD2MYsTWphDEM8ht++Kgu0rQ
         mQB5p75ClOpUsTj8Ef2zJYNo7kJfThHmDrLYMebVZjhzcjPQuo/ibHRHIaUvSdSTlLHc
         alie80JGsRsa/O5nV53IYYt88fRHAvtMZdWGaBlACf8iXR/Yd7IKfEpzl/JB+Ji/8Av/
         MQu8oZ0X12wlpaomoBWNfkVvPN2fLWgzNEcB7h1/L9teNPzXYJvz1G8J6iHwKf66/nuh
         4+PJ1dT4RvqYxmq3eBuT/4hapgNfXNtwQO2lh57QI3q342HkGv9wtwIRw734qpP028cZ
         0Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709873824; x=1710478624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0YJzpSKQ64f/qB3CyjJU/eUEY/Gl4j+ab9hXSdbObg=;
        b=O9TbpaSoyXBa6jM0na2DQiu6mpwKqSPys4FXdP4yE3EmiYb6yDcbAkxWMVmLa4Ozhr
         9fni/2FqAEQ4yMTPvwCaHe+exrBcQSsLFqTW8axUHD3OHBokkf+c3SdJxAqjBDAScT12
         Dll0+0Wy9zBRJFZi4KIj/AQlrMqZC8oezzDVgT9/J7LAfv76kmu8VIKn1DYG34dPyz/1
         1ACH1JwwfBFDi8cu5cFo7BQmKPskpKpur1cqxhigh9kFf7icR1n9F9AVpxT8ZJ76VCyn
         usE6XcbUMlrX7rrFmv0jdTdWPdpcyBxxjOlnYhAZDs4ibJ9AkBTpCEghidY3jeNMQhku
         M7LA==
X-Gm-Message-State: AOJu0YxR14mQfzgJ20nk/tzHDpGxLke8h1D7z9tA6NBlIBnFXH5a9Loi
	uXVQYr23G+oHW301kS8zWB7AKju5bHfZZf97k3/+FG9GzcBBIIM3SYwuhGgQiA==
X-Google-Smtp-Source: AGHT+IHzlI/Vxr3+BKn4DNWgJwu+sPufAkxjkG759VK8g451dD0l8BY4Eox3XBYIDdyGo6I89bT2pQ==
X-Received: by 2002:a25:d697:0:b0:dc2:398b:fa08 with SMTP id n145-20020a25d697000000b00dc2398bfa08mr19015520ybg.31.1709873824462;
        Thu, 07 Mar 2024 20:57:04 -0800 (PST)
Received: from localhost.localdomain ([103.146.224.223])
        by smtp.gmail.com with ESMTPSA id d4-20020a056a00198400b006e4fc1b1881sm8311468pfl.24.2024.03.07.20.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 20:57:04 -0800 (PST)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>
Subject: [OE-core][kirkstone][PATCH] librsvg: Fix do_package_qa error for librsvg
Date: Fri,  8 Mar 2024 10:26:58 +0530
Message-Id: <20240308045658.32580-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 04:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196844

When using meta-rust layer for rust below
do_package_qa error in librsvg is observed

Fix the below error:
ERROR: librsvg-2.52.10-r0 do_package_qa: QA Issue: File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags] ERROR: librsvg-2.52.10-r0 do_package_qa: Fatal QA errors were found, failing task.

Upstream-Status: Pending

gitlint-ignore: B1, CCL1

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.52.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
index b79e95a04f..21f502444b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
@@ -73,3 +73,5 @@ FILES:librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so \
 RRECOMMENDS:librsvg-gtk = "gdk-pixbuf-bin"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.25.1


