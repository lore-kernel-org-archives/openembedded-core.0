Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CD2CA0EC5
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 21:41:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.32935.1724967706524452921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 14:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=rzeXZ5GW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6bf953cb5d3so6315136d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 14:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724967705; x=1725572505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Iq6GkmO4IbKz/fb4WrIooMXI4wWk+8V/s6wXaNaywg=;
        b=rzeXZ5GWdWjtCKbA1OhfnN0R437grzDgGwhmMP/2kk2z8lFVHoxehSG3zzaIYA3VJR
         KGR7R5MBMk6SX5u949Z+cKCCP//Ep94ZQsm59kOVMgP9L9I+lOTc66z3BYEezu4zoXwS
         DrByU4Aa6FfCQECp39PnK9fhd3kje2JcefcEBNXVdKF9lbe/LA8IM81V0QHSNeK7ghpt
         LZeQexNueT0DhsZGrX+RP/SizVJ1yyLnnGxrvBXyrix8hjfSEJq5eovPXUpQ9OZ+xAg8
         hs6UetoT6HYgoMxhsuioe8ABuPl6b3Rv5zX+GbUM+8OemBh+72RphYPZ1itzkzTLclQ5
         ciiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724967705; x=1725572505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Iq6GkmO4IbKz/fb4WrIooMXI4wWk+8V/s6wXaNaywg=;
        b=YX6ObvzjhFCzrfTcngpJ3wWzMsJ3pRkQ1NwKpwvTDXicWDOeImTqQGhw5P/hniTm2L
         MAROWAlZwpZd3zCIeAJUdocxbSbBadf3BBcJqFFP5EXl9IltvLjx+czbPHzYxXXG7Uue
         IWd/3NIuKi1LbHxsf8udDSJF7ITN1wtQ/0AJtHkL/fhkkt2pSop+I53aHhNeY+MD9Bfl
         ygcxhxB7izLxZUDy2mCiEnZ8oVdtK+euYfXFWWNDibc3yMboETpVUNRfgayIAVCh2uS6
         2ujhNSuttkSSb6HJxvYQGsofgEwzZoUgaKH5NBXT7nqYZ4wLSLqm5V8dqo/NRbPONNBd
         js+g==
X-Gm-Message-State: AOJu0YzCcQs1NimD8bIrAjsl2naHmDkY9OW4uzlSB1d4WgwmgYxA6WmE
	a1VAK0ugh4Fyc8jGCb8qax7e8ZiIfNWBbFeJMnVxhRQ9d6aYqNnU7SZKa3moyGQO3z1CstXSggA
	=
X-Google-Smtp-Source: AGHT+IEC7/Ai0bTjzPuh4WWTCL4wNzp4WHN7tyFavBIsTwTDu11nyUMdIAhKYeELiiNnvaBqLb/uwg==
X-Received: by 2002:a05:6214:2c13:b0:6b7:b277:dd12 with SMTP id 6a1803df08f44-6c33e6962e7mr53852056d6.49.1724967705166;
        Thu, 29 Aug 2024 14:41:45 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c96804sm8912966d6.93.2024.08.29.14.41.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 14:41:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] default-distrovars: Have KERNEL_CONSOLE reference SERIAL_CONSOLES
Date: Thu, 29 Aug 2024 17:41:44 -0400
Message-Id: <20240829214144.2947418-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 21:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203948

Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
(or something else).  These are usually defined by the machine config
file as SERIAL_CONSOLES, which has one or more entries.  Take the first
one of those instead of ttyS0, but default back to ttyS0 if nothing is
set.

Also, use this variable in the efi wic file instead of "ttyS0".

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/distro/include/default-distrovars.inc | 3 ++-
 scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 7554081e8b1a..976ff4adc526 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -1,7 +1,8 @@
 QA_LOGFILE = "${TMPDIR}/qa.log"
 
 OEINCLUDELOGS ?= "yes"
-KERNEL_CONSOLE ?= "ttyS0"
+# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
+KERNEL_CONSOLE ?= "${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[1]},${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[0] or 'ttyS0'}"
 KEEPUIMAGE ??= "yes"
 
 DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 9f534fe18471..5fa6682a9e10 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
+bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE} console=tty0"
-- 
2.39.2


