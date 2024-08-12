Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3689C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 11:01:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.43652.1723460488868205954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 04:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OhCxrb6X;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a975fb47eso471675566b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723460487; x=1724065287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvjnzH5hAR3T17HQGn31B8e0ed1EDyRXJI1HFS9R7s8=;
        b=OhCxrb6XVbk/jjCyFYYOXnh96S1qpi8wOUdkNqD3jlrq6mGd/8L6+hXBVRoD4hD0Ds
         9O/6WWKg7eiuuBpT+TP6JMFP8GGdUrHqam/IS05hLnsDyisBxJ0sOEzJVjrWXpdMTVG9
         SxLcSHUivqw5nm1Hl2EHd3Xxat05aM5XcuURQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723460487; x=1724065287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvjnzH5hAR3T17HQGn31B8e0ed1EDyRXJI1HFS9R7s8=;
        b=OqdAC/tOn7nsuAVzkxUIABqYHHRJeIkmEkH072IrMHrtX81MErZR2wtFz/rNar3TL/
         O+cKBqcvbWJFdjc8b2Gr1ABt/TvPHYqdizFRx9xdvYJI/yKXtZ+h4q1/iq7KLvMTsSbj
         9BWUBiPdUDzYGXeDI9YeghQIYxJjn9SCKejtsPS+4g3p1Lqul480rDAOYZ+2a0YJHtvD
         HFYqsE/gyort4gUeaQYvzeMqUKO35y5MtUtOM4/ElJd96xNFdiSAINpNnADSn7UcYBSJ
         cNJDXaMk4oVTll0OBw11g4PnMh6wrkhb+RNTBpMlePmWK53v42v4av6oXxhFVendxhDG
         6xYw==
X-Gm-Message-State: AOJu0YwmO0F8hk8c3ZH20KOTANs5gwHcEUaZMzKDtT7b6srKGmY2GEAx
	VkEQ0/Z8J4oSlgndxKULhUdm4q7ZyJqTnVUSTctq6zwW/OLBqi83fOngvAweCfBg57YpbNyGk1B
	D
X-Google-Smtp-Source: AGHT+IE18O0ltPvoHlZvxl0lAKxg4FhkTa+VSCXZB7iaQj2GP9gT6E5UbqHKw0IT4JdNjd5Ll3EvlQ==
X-Received: by 2002:a17:907:f741:b0:a7a:b18a:66 with SMTP id a640c23a62f3a-a80aa598502mr697005466b.16.1723460486608;
        Mon, 12 Aug 2024 04:01:26 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb212bd2sm223310366b.176.2024.08.12.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 04:01:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Leon Anavi <leon.anavi@konsulko.com>
Subject: [kirkstone][PATCH] python3: add PACKAGECONFIG[editline]
Date: Mon, 12 Aug 2024 14:01:22 +0300
Message-Id: <20240812110122.1216788-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 11:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203221

Backport PACKAGECONFIG[editline] from Scarthgap to Kirkstone
because libedit has feature parity with readline but is more
permissively licensed (BSD verses GPLv3). This patch provides
means of enabling editline in a distribution without GPLv3 and
in this case improves Python REPL keyboard support.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-devtools/python/python3_3.10.14.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
index 31c458c09a..b5bc80ab88 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -106,7 +106,8 @@ CACHED_CONFIGUREVARS = " \
 PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
 PACKAGECONFIG:class-native ??= "readline gdbm"
 PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
-PACKAGECONFIG[readline] = ",,readline"
+PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
+PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
@@ -118,7 +119,7 @@ do_configure:prepend () {
     cat > ${B}/Modules/Setup.local << EOF
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
-${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
+${@bb.utils.contains_any('PACKAGECONFIG', 'readline editline', '', 'readline', d)}
 EOF
 }
 
-- 
2.39.2


