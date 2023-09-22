Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E37E7D0DC
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.15993.1695367476618387565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mRDgXjnv;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so28524471fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367475; x=1695972275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCI1ygr1F3eD+T50tF1ad4nR2ObVK4NiY8OWqSc4khg=;
        b=mRDgXjnv2bVodF7ERBxRVYFLWKyZqYkhrAzr7f+js1RA+cf1qDBSjT0CZC6H8U692A
         O16OEDHiwDayBERm2gaGP81KfHMRy4yQlcEi/xsd26sn4UNvTaOE/KLVehXDeYIUllx5
         sYeEHes9jues0wnF6aQhE4tsfEZEn7EBBw3KU2hoJTQ683c2HpTOUgDij1XTFF7M2wzz
         pKiML/YZl3TCDg14w1gnwYKC5JtwSoiufqthHH5kVOFRFBziNlxsMoWuaE053ZlegCUi
         +2Uj7E2njqrGIi7JDmqR+4P2kH3jjAsOnp3dKww+d9A1tO9qZv8nqzcUCi9e4Rqo1KWM
         uo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367475; x=1695972275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCI1ygr1F3eD+T50tF1ad4nR2ObVK4NiY8OWqSc4khg=;
        b=lq6NODoWfehgB4ABkisfJKEY2cxzsZqloUdmF7pcUqJjAh7RcpS2WFTH1Aj9LL7mg1
         349I5zHBdHBay52sZNPtHAUhgNPk7U3VC7T3OntDzbcIeGBnbIsAZjEzu4qYak6eaetP
         30iksyv77Mavl3kAQPshH+WlBNahWbf03jX8QcxREPdAf32BZ6/lcRNmSWPvL+eyIKIo
         5VkO7lQd/O3SLgjnOL2IDRv9iZkwCNmT8A+yk0h+faVf4fERRa//LnFdIZfW7dkYTjLx
         uk6KH0QQ12tdqT8anrhLqctsWBXAA2rzq59tgKS9hVOmIxzEsZh3u8OW/aTeSgmH6lQi
         wKEw==
X-Gm-Message-State: AOJu0YxR/6udhtwpYsaPwq7Nlwb+KlT/7csa1saTXv2zBsFAy50oItWp
	yAvvfZfmeNR6tUWZ9fb1fFm1qbTK5sY=
X-Google-Smtp-Source: AGHT+IGhJQEWhSK1A9/fBJ6bPtmb5LhhA8hZdgfxBarpZqoFtRTuf2VfpA6fKO5M5EDRhK37YZRo6A==
X-Received: by 2002:a2e:8544:0:b0:2bc:e470:1405 with SMTP id u4-20020a2e8544000000b002bce4701405mr6045293ljj.46.1695367474644;
        Fri, 22 Sep 2023 00:24:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/40] systemd: upgrade 254 -> 254.4
Date: Fri, 22 Sep 2023 09:23:52 +0200
Message-Id: <20230922072431.1481743-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188045

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...temd-boot_254.bb => systemd-boot_254.4.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  6 +-
 ...-elf2efi-Fix-header-size-calculation.patch | 70 -------------------
 .../{systemd_254.bb => systemd_254.4.bb}      |  0
 4 files changed, 2 insertions(+), 74 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.bb => systemd-boot_254.4.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
 rename meta/recipes-core/systemd/{systemd_254.bb => systemd_254.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_254.bb
rename to meta/recipes-core/systemd/systemd-boot_254.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index e5686fbe445..3ba0b5ffc58 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "994c7978608a0bd9b317f4f74ff266dd50a3e74e"
+SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
 SRCBRANCH = "v254-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
-           file://0001-elf2efi-Fix-header-size-calculation.patch \
-           "
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch b/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
deleted file mode 100644
index 0e8924d27d4..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d082d6502fa86e08dda858933838dde0406b824f Mon Sep 17 00:00:00 2001
-From: Jan Janssen <medhefgo@web.de>
-Date: Sun, 30 Jul 2023 20:59:04 +0200
-Subject: [PATCH] elf2efi: Fix header size calculation
-
-The PE header size calculation failed to take the PE magic and coff
-header size into account, which will lead to header truncation if we are
-writing only 5 sections.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ee91e06a5841c30bc7306260528ef407e0ebbab3]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- tools/elf2efi.py | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/tools/elf2efi.py b/tools/elf2efi.py
-index e233c8e3ab..2e478940f5 100755
---- a/tools/elf2efi.py
-+++ b/tools/elf2efi.py
-@@ -210,6 +210,7 @@ FILE_ALIGNMENT = 512
- 
- # Nobody cares about DOS headers, so put the PE header right after.
- PE_OFFSET = 64
-+PE_MAGIC = b"PE\0\0"
- 
- 
- def align_to(x: int, align: int) -> int:
-@@ -304,7 +305,10 @@ def copy_sections(elf: ELFFile, opt: PeOptionalHeader) -> typing.List[PeSection]
- 
- 
- def apply_elf_relative_relocation(
--    reloc: ElfRelocation, image_base: int, sections: typing.List[PeSection], addend_size: int
-+    reloc: ElfRelocation,
-+    image_base: int,
-+    sections: typing.List[PeSection],
-+    addend_size: int,
- ):
-     # fmt: off
-     [target] = [
-@@ -439,7 +443,7 @@ def write_pe(
-     file.seek(0x3C, io.SEEK_SET)
-     file.write(PE_OFFSET.to_bytes(2, byteorder="little"))
-     file.seek(PE_OFFSET, io.SEEK_SET)
--    file.write(b"PE\0\0")
-+    file.write(PE_MAGIC)
-     file.write(coff)
-     file.write(opt)
- 
-@@ -453,6 +457,8 @@ def write_pe(
-         file.write(pe_s)
-         offset = align_to(offset + len(pe_s.data), FILE_ALIGNMENT)
- 
-+    assert file.tell() <= opt.SizeOfHeaders
-+
-     for pe_s in sections:
-         file.seek(pe_s.PointerToRawData, io.SEEK_SET)
-         file.write(pe_s.data)
-@@ -515,6 +521,8 @@ def elf2efi(args: argparse.Namespace):
- 
-     opt.SizeOfHeaders = align_to(
-         PE_OFFSET
-+        + len(PE_MAGIC)
-+        + sizeof(PeCoffHeader)
-         + coff.SizeOfOptionalHeader
-         + sizeof(PeSection) * max(coff.NumberOfSections, args.minimum_sections),
-         FILE_ALIGNMENT,
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_254.bb
rename to meta/recipes-core/systemd/systemd_254.4.bb
-- 
2.30.2


