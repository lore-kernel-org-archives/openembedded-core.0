Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55058C64EC3
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.16702.1675547345593533211
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=akRtGUdF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id 203so6030307pfx.6
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJVC/GF+vy9GWaCC4w8njGm4F5Am8FNsIHrHhnKtzcE=;
        b=akRtGUdFCrUr58IwdcMb1AICO6sAj+0KVmfExq4DLLBitjQrOjyfwjcMObSp4WYI/D
         uzyxpoDqnFdn5CA5W58hD3bljL+pSrj1lUzLhHNbPt2zEo3jf39VMiVBqyXzBprvEQ2V
         grS4bkJywAwTaXxWvaCe8Z/uhi88E7CTHaZh7qRnfQJa7tDBJSRHquWpeZk4Dcxp8ozn
         wVlyqTBbNQafmVY5uWC20WboPsY0W9xUWmSh+sUz27XincxJokrhNYQt5YzI+AD9WU4o
         M0u3Cgc/znIngek/gGqHDFTFQOWmJy6VUfcf+Izg6HGpSQT9B+XkTWSlb4pSC8W/SDwP
         thXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJVC/GF+vy9GWaCC4w8njGm4F5Am8FNsIHrHhnKtzcE=;
        b=saA+n+Rmrh77MK+V3918tghw0Txb6RmNWAEPmx+A24P4WfmLVkw2Ed47OkV0OBdPt/
         o5ZM/jlpTwo1MzUhkQNNsHWPgnK04f4QUHvoOlKn6f4yoN4UVrcGzv5PllADrhumyyH1
         7xduYj4/FBbnyqfCu0XcMqLPHGeYbtl4FVviJkaXiUGTOQMLcoWRj3f/C3H8MDOul3kt
         a1PoV04mHhqXloMhciGP3X00pHPzxBOUf+iS/lOVRTtlIwR5Scbhy8w3I2sn+DJMdUhJ
         63BNMZKc54t83fqBf5IZGaAWISgXwOFWcNUBXOYQZnOBMlYe6ygZP9LqgbSPHEa/3OZ4
         SPRQ==
X-Gm-Message-State: AO0yUKWPn2a/YGSLW1z9Bz130Zhok+ipHYuZU0Ti3H8TIFZq8IZNxHQW
	IjJZxnaMI1XwsoLdJqLxYBlZAlmTKRh3hw7adD4=
X-Google-Smtp-Source: AK7set8ShciQCy4fqx0vYBGSOXPYpImliL/uOyK0wGOeINgEszySW2SDRPWdhXHgYfktynXnJDo9YQ==
X-Received: by 2002:a05:6a00:320b:b0:592:5ded:9d4d with SMTP id bm11-20020a056a00320b00b005925ded9d4dmr12097818pfb.3.1675547344642;
        Sat, 04 Feb 2023 13:49:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.49.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:49:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] devtool: Fix _copy_file() TypeError
Date: Sat,  4 Feb 2023 11:48:35 -1000
Message-Id: <a434079b7e8e23e9cf0b45f5fb56e8be7b8d885e.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176777

From: Xiaobing Luo <luoxiaobing0926@gmail.com>

when devtool finish, the _copy_file() failed.
--------------------------------------------
TypeError: _copy_file() got an unexpected keyword argument
'base_outdir'
--------------------------------------------

Fixes: 05f2d5d2ce00 ("devtool: finish: add dry-run option")

Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a45d9dc089fb2719ca69b92870917f8c0925f632)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f364a45283..cfa88616af 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -357,7 +357,7 @@ def _move_file(src, dst, dry_run_outdir=None, base_outdir=None):
             bb.utils.mkdirhier(dst_d)
         shutil.move(src, dst)
 
-def _copy_file(src, dst, dry_run_outdir=None):
+def _copy_file(src, dst, dry_run_outdir=None, base_outdir=None):
     """Copy a file. Creates all the directory components of destination path."""
     dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
     logger.debug('Copying %s to %s%s' % (src, dst, dry_run_suffix))
-- 
2.25.1


