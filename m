Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A36FC619D
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 13:43:30 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.82126.1727790204373545452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 06:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=chTa0RES;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6db20e22c85so48370137b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727790203; x=1728395003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNwRqAm5aIVw1B8F7hEk9Qy9FRqbHJgIY43L+pClkX0=;
        b=chTa0RESn9bWOQuIaGQYFIc7RKMHS5ioHvtJh9Txe05ZNmXrgCTQ/8PihSr5Da075l
         tFa4+TuQnybo5NaobCVxLho7k2jcPHzH7fsA7oGuchj1uGUT11jmxKED9jIfIRuGjVAs
         fVWVzmjaDm12SyDD6ezxtndWv/9ktqm+gMQ1msNEuIQNUpVyswlL9JKy1QO4k6EP+lSt
         VyZ5fybnqlFDsQZpziv9Fg/e5JUeNfwnqIjHiLlfZHIpZLOBmrBVHc41nN5p0qHdv4ak
         egjIBofcYPlbW7yXXnBRIDrbc/NeF7bxleYXS+a/NoRRhhMWlMZMGKfgsYEy8MKBPRi/
         rMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727790203; x=1728395003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNwRqAm5aIVw1B8F7hEk9Qy9FRqbHJgIY43L+pClkX0=;
        b=CdgpkT7z3T8TNM7cJelZjRVaI+I8Sot2J+ZetYQm0ZMC+xkpE8eR3Ongc4Z4Pfa8yK
         6iSVXLj6jL9yRHXYajY3aYzAfFPjLt0edZ4mlpJ/Lq8LhxTV68T5oeZ7VkPcJKv7dwCf
         Xs8YZ1glLywttcbTKu9acFsVbSgrRe75Xge6pp7+G3iYB3TGxiJ7/r/Q85n91Ngt/jFZ
         m5giR34Zk+QwixESWdNp+NGPE3K2v6W8/KZRNSFn4OQt+pfS8pCTbmU+6MnTGKA4VWhO
         DdZoZEt2Ak2gSTKMgk7WuO/SZ12N38gQAiz1B1oF3tjJy8tX2f/Q2jHM43oa/yY60ngd
         K1QA==
X-Gm-Message-State: AOJu0YwIA4nxTOW8cX9JeMyApJyobHrtM4Hv8yJZqsdN0I/A57eo4gbI
	DuEALQW6ZNs6DY7JYFtxPUuuCEK9gvYPhugfkaS45FTubwt8MOWk86QyGeyPNdK4rKoXIu+A93o
	=
X-Google-Smtp-Source: AGHT+IEh3is9yF9A6Kv34lxnAnYu/nG4POZxi9aZPPGWVSWLWPtfbgFYQwZey629v/A7E/sJQWz6uw==
X-Received: by 2002:a05:690c:2b03:b0:6e2:19dc:2ee0 with SMTP id 00721157ae682-6e24759abb1mr95123097b3.21.1727790203133;
        Tue, 01 Oct 2024 06:43:23 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2452f7c57sm19324787b3.2.2024.10.01.06.43.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:43:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] default-distrovars: Have KERNEL_CONSOLE reference SERIAL_CONSOLES
Date: Tue,  1 Oct 2024 09:43:22 -0400
Message-Id: <20241001134322.1166436-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 13:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205167

Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
(or something else).  These are usually defined by the machine config
file as SERIAL_CONSOLES, which has one or more entries.  Take the first
one of those instead of ttyS0, but default back to ttyS0 if nothing is
set.

Also, use this variable in the efi wic file instead of "ttyS0".
Of note, this changes the default speed of the default kernel console
from undefined (9600) to 115200.  This allows for users of the
mkefidisk.wks to work as before but any users of this variable could see
changed behavior and would now need to define this as:
KERNEL_CONSOLE ?= "ttyS0,9600"

This includes revisions suggested by Quentin Schulz and Ross Burton.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/classes-recipe/image_types_wic.bbclass     | 1 +
 meta/conf/distro/include/default-distrovars.inc | 3 ++-
 scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 86f40633ebcb..db598e874ad7 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -26,6 +26,7 @@ WICVARS ?= "\
 	INITRD \
 	INITRD_LIVE \
 	ISODIR \
+        KERNEL_CONSOLE \
 	KERNEL_IMAGETYPE \
 	MACHINE \
 	PSEUDO_IGNORE_PATHS \
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 7554081e8b1a..85835c4c6179 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -1,7 +1,8 @@
 QA_LOGFILE = "${TMPDIR}/qa.log"
 
 OEINCLUDELOGS ?= "yes"
-KERNEL_CONSOLE ?= "ttyS0"
+# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
+KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0,115200'}"
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
2.39.5


