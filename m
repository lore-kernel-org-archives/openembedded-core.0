Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.37316.1628865177147914441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KtTY0Vx/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so2570863pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6GRsxG/9T2lslFkol1usbJ3gJr/CTfFzXRwq2MCsL7c=;
        b=KtTY0Vx/4NXlZc+T6Scpkz/VspvXpVZirHMRc+fF3MUr/YBzc24d6CWp3e/gNAM7Yj
         882p+kFH3p6nytiS+wq+DyHwMwrDVKkwt0QsfRNHeuKzjHp+QQo9PZFkAIMp3//NPu/R
         WMT4QadYUi8damogSyibvasl3tM/uLPyDb2A3qdD8/9OZpkJQSq/QDHPdpjZ66uoqK7d
         bY/ABrlaqytB43V/A5N702GamXIrFEfzAWz/8GHXFqY1B53DZjOeNU+cKvgQe0qY85Rg
         NZ/WDMqu8mQD2W1znQ6dmrsnBUjyecDIs2b84sbDGcAOIb+nANHg6bcEyyH+NeuFpkKa
         4vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GRsxG/9T2lslFkol1usbJ3gJr/CTfFzXRwq2MCsL7c=;
        b=YSXbJj4vC82XO1GD2W+Qq9IMJMWrV+dJ1eBx24Z3XJsBhODx5oHjwqhZpWejvj4w+Z
         iRu6SHLBxtEbHCYbTZ85AiDCcybnEAOxxaQwZ9kq0Lbo/+X3+ftPAPm0uPUQbiBk4T7R
         re+DhMI0Ds5ykXCL98/9oY+196jSBNX5IOj9SKbEtwF/69Ypl61kpLCEc7khAvVqRRdG
         yGQJqXrD98RXOToPJgkTyFDBpH+mFepHmVN3V/oxpwcizpvbybGgHGuvu8LeiV6/53GM
         Exl2KpzSPl92p+TVfnERqALJ5voWxwtUU7EIl2SEWErkI55ixX224HWb2+sa8yCnq1i2
         KcdQ==
X-Gm-Message-State: AOAM532rZQdwXspUOHjUInD/DdnuaFI7//FQAKr5iKNKRfrV19IkBBD2
	SdDdDb43RZXcWS8ebV/L+s2yuj9O+sdJ/G2E
X-Google-Smtp-Source: ABdhPJzCFkErbWWzDRtzW7PyzWhmPFuJ05NJsaHsDg9y5qxRmVhH/mezi0ACq/6B6Rtz4YGuu8rkzg==
X-Received: by 2002:a65:5ccd:: with SMTP id b13mr2583697pgt.203.1628865176334;
        Fri, 13 Aug 2021 07:32:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/17] wic: don't forcibly pass -T default
Date: Fri, 13 Aug 2021 04:29:58 -1000
Message-Id: <906b65e2c2a140426f80796600e5ab5991be0979.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This reverts part of oe-core eecbe62555, which was a previous attempt
to solve the Y2038 problem.  This is now solved centrally in e2fsprogs,
so doesn't need to be dealt with in wic.

We don't revert the commit entirely, to retain the warning if a
filesystem has small inodes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e8017208bed98b6c90735cb641fc9d7aedf9140)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/canned-wks/common.wks.inc     | 2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks | 2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
index 4fd29fa8c1..89880b417b 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --use-uuid --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024
+part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-gpt.wks b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
index cf16c0c30b..8d7d8de6ea 100644
--- a/scripts/lib/wic/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
@@ -4,7 +4,7 @@
 
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
 bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
 
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index d1878e23e5..9f534fe184 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,7 +4,7 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default"  --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-- 
2.25.1

