Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30079C77B73
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:36 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.162533.1680796948448294563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mjQhd7pt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id bt19so26095616pfb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796947; x=1683388947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwwYX6Ou/Mn7OOk9YoZGwYlGFXwIC2yaFnpJkLXbetw=;
        b=mjQhd7ptvwe+ixKeQbOXrAHwMfvIKqGOXzLz/S7QRO8WuteSIqsNXUyckje2a8MO1K
         o1b4C36+xPwtM7nhsmsEjz6QDh44vYcf6JIlAYnaT+DYI/XkzY7VXtsnuHBH1l9wIrLd
         GZiI7N+4QUlP2nYcnxO2xlNZtV9NoEo27cc6uZLCPPPeX0+WBXWD09xUMzh7EyNy+t/H
         6f9YglioFpYyOnZ+SVAHL9KoTKyuvG0vsZ6PopP44x5t/CZy8jGPkFjB9hM+zvMmqPrX
         P1p59lYlQ+kKoXpRGOZWIRCPQOdTx+j/TySm8BHzhvkVPEJ1OgH6cLZoNUbsvIIkqadM
         2xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796947; x=1683388947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwwYX6Ou/Mn7OOk9YoZGwYlGFXwIC2yaFnpJkLXbetw=;
        b=UFVdyzhzZQFq4pilYqnJNsSJE2tL4q6CG8tmOokJf8ih5qeJVEaWUO4tZjaYkhl/dK
         ZRHzIoDEYcTSKsczTdAM1A6nTQiAoT0CpZ/7d7fvTiJxmmMmGmJVPUYfWtQ0wb+T9xMk
         oxDhRTldPbJ/5XLHBCme1WVtZs6giJlrfM9pZaY0EExXxN3DLBZ71F/NFsMn1mB4/4XR
         G8svgKbt768ceQGyWdQaxj/K5PLX0/XiwDgq71wzzsbt+i8tg+JuwfJ/V007ZedoDXXZ
         TLknaQC/UWd4TzYrJ1zWSkfHtiIVgAlHRbB6dlad+iWBcDsJy2wXAHU1udv2EM2cZzIU
         poIw==
X-Gm-Message-State: AAQBX9fvM/2fBB06LKBC6sIvtlowdMIOfO4aSMZvJsYqY68QslIGyCC4
	JNSigqOqC3S4cKPjBEqvKi7/0G6Brctk9fxkFoI=
X-Google-Smtp-Source: AKy350bVSyWH7SnDpAJyHcu2aRMf+sqpWDDGkSxxwTYQR/JQBvXBmKy/2iUZqto32L0wtulPXNUvYg==
X-Received: by 2002:a05:6a00:2d83:b0:627:f1ac:f46e with SMTP id fb3-20020a056a002d8300b00627f1acf46emr8309801pfb.1.1680796947461;
        Thu, 06 Apr 2023 09:02:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/26] filemap.py: enforce maximum of 4kb block size
Date: Thu,  6 Apr 2023 06:01:32 -1000
Message-Id: <303cc9ce3a9d7ca85542f12ebfda27eeb449e73b.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179783

From: Andrew Geissler <geissonator@gmail.com>

The logic in this script validates that the length of data sections are
evenly divisible by the block size. On most systems the block size is
4KB and all is good. Some systems though, such as ppc64le, have a block
size larger then 4KB. For example on a POWER9 based ppc64le system, the
block size is 64KB.

This results in this script failing with errors like this when building
wic images:
|440, in _do_get_mapped_ranges
|     assert extent_len % self.block_size == 0
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| AssertionError

In this case the data section size was 268KB and the block size was
64KB, resulting in the above assert failure.

Resolves https://bugzilla.yoctoproject.org/show_bug.cgi?id=15075

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e23b803af6991fc20e4a4e88a0ef0541399e722)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/filemap.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 4d9da28172..85b39d5d74 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -46,6 +46,13 @@ def get_block_size(file_obj):
             bsize = stat.st_blksize
         else:
             raise IOError("Unable to determine block size")
+
+    # The logic in this script only supports a maximum of a 4KB
+    # block size
+    max_block_size = 4 * 1024
+    if bsize > max_block_size:
+        bsize = max_block_size
+
     return bsize
 
 class ErrorNotSupp(Exception):
-- 
2.34.1


