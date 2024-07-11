Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFDDC3DA49
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 16:54:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.1322.1720716875312830714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 09:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J+SI2+k7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367a23462e6so705699f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720716873; x=1721321673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCbOhNRVcmZ+8ePMwnU6CO3IAnQVRwJQlUOmtxHMysk=;
        b=J+SI2+k72KhNUkqnz1tklsNjT8vJNMVK88QTCQw16NSQYNq9GjGXDLD4Jdw7Zxv+6l
         2I/+O3dlU7qsj+UkExKrY6hdiPnsfdC5mSAD9WVwMDcGNLU0W46JqqocDXCVgJZDSHlY
         dqUE0ov75D0MP3AJnSI8pPBm4wF6+8rflmlS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716873; x=1721321673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCbOhNRVcmZ+8ePMwnU6CO3IAnQVRwJQlUOmtxHMysk=;
        b=QI70KiISnISPCeLFd7a9lrNpvN5WAqWfJjrdUrYQdtv8Jl1U9060+QpRuG2Q7l/qCC
         r4L5//Drcsos3G8jYC3zFFQfdzjcv7/lcQLFSlAgKGd7GF6pH6ouQe1wKxXfSeEjySdf
         3tgeY/NOIbuNxmEpuOwv8hrB7PEqAg1FQY5VZnvq6QXDaO5WwDfFaE3DfRBiKuf9FaDk
         FbtNvtKDcntPQfP5WtJpERD+gxuj6e1+zRZi2bwMalyblNvlmttEWReomV/mHxUD73Ux
         gmJpDLSazAfsO1Jjg7yuVzJwD76YObrcrw6CntyN+BzTzVaTfZ9ytqfOwLzhKFVBtNd/
         oZEA==
X-Gm-Message-State: AOJu0YxvseIDX6K4PDPuFWC4tami6at9SiwpsUJgqXP9wQYK01gj//dO
	VNYmeIAu5QJPfb312JgTbU2TIxbnvsCq1OMAp/fnFlKWkb1LZNhV8Y1ZVwhtI26HRwcECbq9VeT
	v
X-Google-Smtp-Source: AGHT+IE8uifV7sRVmj+UdpPk5/OisY1tGpKAWXdGr3mpVwXFNuLEDalMgPIYm5x3ilyrVDaxVXTHDw==
X-Received: by 2002:a05:6000:1445:b0:367:9bc3:cded with SMTP id ffacd0b85a97d-367ceadd35dmr6697204f8f.60.1720716873294;
        Thu, 11 Jul 2024 09:54:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367df88b1c5sm6168438f8f.4.2024.07.11.09.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:54:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf/webkitgtk: Split debug flag from DEBUG_FLAGS
Date: Thu, 11 Jul 2024 17:54:32 +0100
Message-ID: <20240711165432.1340223-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 16:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201786

Allow the "-g" option in DEBUG_FLAGS to be controlled separately to the rest of
the flags with a new DEBUG_FLAGLEVEL variable. We can then use this in the
webkitgtk recipe for finer grained flag control and it allows the flag to be
unset easily.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                       | 3 ++-
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ef2deb088b..8d01b5d5327 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -663,7 +663,8 @@ DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
-DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
+DEBUG_LEVELFLAG ?= "-g"
+DEBUG_FLAGS ?= "${DEBUG_LEVELFLAG} -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 29e12bb8c5a..a6c1056a23f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -93,7 +93,7 @@ EXTRA_OECMAKE = " \
 
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
-DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
+DEBUG_LEVELFLAG = "${@oe.utils.vartrue('DEBUG_BUILD', '-g', '-g1', d)}"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "

