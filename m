Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3C5C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:41:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.47989.1702500060600364946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMborFCg;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28abca51775so1571079a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702500060; x=1703104860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzSw2YCtEJSX0/0Kkq5JYtv8OPieCzN3LS8ySre2KnM=;
        b=JMborFCgjV+I5LwOjIgxWvz18X3JNRz0LlENOtYXDsvKIysrdmNUHHlk1PspOGn+Aa
         3EDLSX/CuQom4ekUC/Wfd5mM627hKQ2k9vMZOaJzQzlsIULH2aC4XDb24pV49PR6wl9g
         NJsvQlUxNLI8eshJN8AtpaK/IGVYPPt23Y7x5l3G6owXPmzoQpQISzvMt0F1ubRpnikv
         yUBs7D2D8D+qtmsjYiZfRRbXlZknAsKD7tr5xbI350cX8ICyrO8/zJ5BPqa32TfNQkCO
         7LtIeZng7m3OdbiwaLbOB1wBKVJD1/jD26Fita8smYuf3+XR9650BuG00LQgsKz1ptmE
         YIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500060; x=1703104860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzSw2YCtEJSX0/0Kkq5JYtv8OPieCzN3LS8ySre2KnM=;
        b=WMv+CVU7WPVa3IWeTXHSTI5QDYYsHfB1bCXquQWK3yMJdOn7fITZ5gG3cc6mdliPfN
         BW+aJbZ37+03SFSaaqe2mWhSdvUEJCIvtBQE5fP6dg0nIiroRabqQ3ncC6ErF2B2b+qd
         4lOsSGnGA/Nleo1uK6AQGHPVKp3GhDuJbNHrKnmJKsuzmwrjTIWm9wyAo70uwIZZgo6Z
         DaFSeWeANFXNUij/pmVFWHGjs3wRwbCHU2+te5BlmMLdGnkjbOnpDLRwJe6KccG1gsKW
         W8cXFSOzIw5ntT/Ktj5xsSt2+6OmASVMJsklK5A12rlPujvWZ423SNWyHogBz2hD84Pt
         PekQ==
X-Gm-Message-State: AOJu0YynK4X4wPBXe/qHfgQpjq0utJWclDLZ8yR5KPkhuruHlnJbr23h
	oE0TBmKYIRD8KBGZDT2Uk9acaXAiGJk=
X-Google-Smtp-Source: AGHT+IEkptvTVBXzTOULzS8Hw66OAbLBcMYA4039CWeOzNFNB7EgvmtIKMe+BYxIEHQxDH/iHovvwA==
X-Received: by 2002:a17:90b:f8c:b0:28a:c38b:5b03 with SMTP id ft12-20020a17090b0f8c00b0028ac38b5b03mr1527425pjb.43.1702500059755;
        Wed, 13 Dec 2023 12:40:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a018500b0028658657e9csm12497570pjc.46.2023.12.13.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:40:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] qemu: Add packageconfig knob to enable pipewire support
Date: Wed, 13 Dec 2023 12:40:55 -0800
Message-ID: <20231213204055.4183701-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213204055.4183701-1-raj.khem@gmail.com>
References: <20231213204055.4183701-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192319

This gets into a quessing mode if not specified and it it probelamactic
for native version since it maybe built on a machine having pipewire
  installed and used on another where pipewire is not installed (
  minimal CI builder ) it ends up with

runqemu - ERROR - Failed to run qemu: /mnt/b/yoe/master/build/tmp/work/x86_64-linux/qemu-helper-native/1.0/recipe-sysroot-native/usr/bin/qemu-system-x86_64: error while loading shared libraries: libpipewire-0.3.so.0: cannot open shared object file: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cc508d961dd..58284ef9937 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -233,6 +233,7 @@ PACKAGECONFIG[slirp] = "--enable-slirp,--disable-slirp,libslirp"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
+PACKAGECONFIG[pipewire] = "--enable-pipewire,--disable-pipewire,pipewire"
 
 INSANE_SKIP:${PN}-common = "arch"
 
-- 
2.43.0


