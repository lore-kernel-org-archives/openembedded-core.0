Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086ADC35274
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:27:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.2826.1702391268841369449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GWRcEB6T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so3526836b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391268; x=1702996068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhU9DgGvHvaXF45BD6sqE7nkxVLC8Uyf/OIfugrvsU4=;
        b=GWRcEB6T8KUqw32Xo1PX68gFBH9Y1JcJU/rZei0RpET7zE1lPDbLuZb6PnCxcCa4zF
         6gkubw9xz61EQnJlT4q5MirsUi4EzGb07SvhVc2Id+mpAEDRzCUlv1P0plENq6HWGQjg
         kZhweidOh6PAmctcSlW2JhJnUJbfM3yIAaYetSbl8W967hBRiKh/r1bKCec8ynZqrgVr
         4iLugUqvOm2LgrBv+JEAGb7YJWlSSy3rSJZee+uinUaeTHe76RErSlpHUuZWhICmWg40
         MsbkkMZtIu71WIQE1UT77vU7hIfx0S4k1jhES0QmBcXdGZVfki/SOWMgALMUvXNguJ9w
         dqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391268; x=1702996068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhU9DgGvHvaXF45BD6sqE7nkxVLC8Uyf/OIfugrvsU4=;
        b=TmB9IvUykXeRNSi6Odo92YUD3PqsJfjjNgmOLWKMBqz0fcLIAnoPMgEvYBncQEZkAa
         Q6/QJFz4qeAWs8SkCuDSrNkw3xkP/MNBtXXFeigtfD+0Y8u082DenrzeyaV7+4dp13QZ
         vH90a/qdBEINZoJHucBc6t3lKbG6Fcbx8Vcpa/7dqWrmH6TiZV39LTrlUCoHzPx87AJt
         /wSpudaPUHJQm70uIPR5t7XVpk97/migBxli3g31RFQyhbDoeJHmt6XMwHCMvhs65XoV
         +lm/k9ayzCM6Qj6vkcWtCPnjpy+M86I9dpzB1FzPNzZtJLmdg46fKPT2K6PH1rptZVof
         S28w==
X-Gm-Message-State: AOJu0Yx5aX3Q1BOOWg4KQ7J5uTh1vHDb+eTbbTxPkbsog8VXDNIjfXlq
	IHKLvdUr8E6obChrqNGFuH0rOpvwjPJcNq8M2oU=
X-Google-Smtp-Source: AGHT+IFCKt5CN12R2bPoXg0N6YQiMm0rCslrMF1cW4u9s5oICgrKzVIHrNRFZl0+a65yKhwepnWH+A==
X-Received: by 2002:a05:6a20:8e0e:b0:18d:1321:c28a with SMTP id y14-20020a056a208e0e00b0018d1321c28amr3396426pzj.10.1702391267987;
        Tue, 12 Dec 2023 06:27:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/29] libnsl2: upgrade 2.0.0 -> 2.0.1
Date: Tue, 12 Dec 2023 04:27:09 -1000
Message-Id: <32a6640fb99cdccb4a74e3ea8baa03272f827fb6.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192207

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Remove unused internal symbols from libnsl.map
* Remove NIS+ from documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1c85811d3a31cd290c7cbc939663cd68d69d9146)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 7919ef9b24..8cc1f7cec3 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
 
-PV = "2.0.0"
+PV = "2.0.1"
 
-SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
+SRCREV = "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
 
 SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
-- 
2.34.1


