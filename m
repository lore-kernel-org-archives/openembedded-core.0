Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B68C04FE0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 16:09:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.65844.1691510933103280163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 09:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cQznVNbe;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so49732765e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691510931; x=1692115731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOf5gyAVpQ+DDn1FMTW6qcyNgfo5gq9nzFrgDxmPftg=;
        b=cQznVNbew5fuH7xiiOO+8ZIZwv8vedPRhJYttRdRHpMlqwpoiKam0tJrW2g6hPxCUj
         uEs85IeCF3/59BG6aFkCJVV9Wyg2f2pRxGhy6Id1H3o7keSM+6ef3p1lcHalRiBMQ9PP
         MU7jPv2IQI9496D45AW0ujyBpvkxABQ1pDyIDp89DWZYDZpcG2M6YpkItKyzTIK49AAg
         fjDhJkS+Ah854ZfBAcZwp4hc5jIkIgMJRilMJy/0jfzUPL7MXsgME7qibCjhyITD0vHq
         DPlyltrVKIfKjji14yHtujrZgbqpZ7+ya+/qXvpLm0SVmISTgx4uV/XYr/mDSrWAcakF
         3I5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510931; x=1692115731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOf5gyAVpQ+DDn1FMTW6qcyNgfo5gq9nzFrgDxmPftg=;
        b=EBpHPlW3mWY8/EXPPTLqrAyjUZWAPAAfzqzv+7a2qEDJP/omlBEYux1IXTZxD99sGL
         xdYRJuVYkxhsyRtETJPXe2/pHrKLVyRqtS5Go0zBfmad6YxoiyVzX+DKB5DWDMwEo2TM
         u1PFskVqE5Q6fY5+9cH+nRR0vpapqLWH/fV07AFwSecq7KrhxGccuM381bPF9fD9LlhE
         arZXBFnlIqjpv+cMoffa9oUZc51GoFeH57gbizxKCdCvcJW4NQytLtCvGTcm75IXFo2G
         waeN7kGVKts6WChd6iMahblFEVSbnk8Iak5KjclgUSiTTbWasevzP9L0vhiV6cS6gVGy
         vKRw==
X-Gm-Message-State: AOJu0Yzfs55qH9oC4Y0n9H6LdX3uBliesA9HXFuvQpeSNjpy1FlRAaRa
	+56Xx5wfAJMCIinosVzGqZjwrnLLgjeQ7w==
X-Google-Smtp-Source: AGHT+IGM4kZxzIvX7ak9dpK8qLadg8I9EmTyxxQfXk2qtp1x6fI/zqcleE7fokf/PLIuQd/YEJQnWg==
X-Received: by 2002:a7b:c5d4:0:b0:3fe:ad3:b072 with SMTP id n20-20020a7bc5d4000000b003fe0ad3b072mr232484wmk.17.1691510931098;
        Tue, 08 Aug 2023 09:08:51 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id r1-20020a05600c298100b003fbe791a0e8sm14234925wmd.0.2023.08.08.09.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 09:08:50 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] systemd: fix efi stubs
Date: Tue,  8 Aug 2023 16:08:28 +0000
Message-Id: <20230808160828.3045524-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808160828.3045524-1-jose.quaresma@foundries.io>
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185666

Before the patch:

| $ objdump -h deploy/images/intel-corei7-64/linuxx64.efi.stub
| objdump: deploy/images/intel-corei7-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
| objdump: deploy/images/intel-corei7-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
| objdump: deploy/images/intel-corei7-64/linuxx64.efi.stub: file format not recognized

After the patch:

| $objdump -h deploy/images/intel-corei7-64/linuxx64.efi.stub
|
| deploy/images/intel-corei7-64/linuxx64.efi.stub:     file format pei-x86-64
|
| Sections:
| Idx Name          Size      VMA               LMA               File off  Algn
|   0 .text         0000f99f  000000014df91000  000000014df91000  00000400  2**4
|                   CONTENTS, ALLOC, LOAD, READONLY, CODE
|   1 .rodata       00002c40  000000014dfa1000  000000014dfa1000  0000fe00  2**2
|                   CONTENTS, ALLOC, LOAD, READONLY, DATA
|   2 .data         000002d8  000000014dfa4000  000000014dfa4000  00012c00  2**4
|                   CONTENTS, ALLOC, LOAD, DATA
|   3 .sdmagic      00000032  000000014dfa5000  000000014dfa5000  00013000  2**2
|                   CONTENTS, ALLOC, LOAD, READONLY, DATA
|   4 .reloc        00000080  000000014dfa6000  000000014dfa6000  00013200  2**2
|                   CONTENTS, ALLOC, LOAD, READONLY, DATA

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd.inc         |  1 +
 ...-elf2efi-Fix-header-size-calculation.patch | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b00a49884b..e5686fbe44 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 SRCREV = "994c7978608a0bd9b317f4f74ff266dd50a3e74e"
 SRCBRANCH = "v254-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
+           file://0001-elf2efi-Fix-header-size-calculation.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch b/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
new file mode 100644
index 0000000000..0e8924d27d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
@@ -0,0 +1,70 @@
+From d082d6502fa86e08dda858933838dde0406b824f Mon Sep 17 00:00:00 2001
+From: Jan Janssen <medhefgo@web.de>
+Date: Sun, 30 Jul 2023 20:59:04 +0200
+Subject: [PATCH] elf2efi: Fix header size calculation
+
+The PE header size calculation failed to take the PE magic and coff
+header size into account, which will lead to header truncation if we are
+writing only 5 sections.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ee91e06a5841c30bc7306260528ef407e0ebbab3]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ tools/elf2efi.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/tools/elf2efi.py b/tools/elf2efi.py
+index e233c8e3ab..2e478940f5 100755
+--- a/tools/elf2efi.py
++++ b/tools/elf2efi.py
+@@ -210,6 +210,7 @@ FILE_ALIGNMENT = 512
+ 
+ # Nobody cares about DOS headers, so put the PE header right after.
+ PE_OFFSET = 64
++PE_MAGIC = b"PE\0\0"
+ 
+ 
+ def align_to(x: int, align: int) -> int:
+@@ -304,7 +305,10 @@ def copy_sections(elf: ELFFile, opt: PeOptionalHeader) -> typing.List[PeSection]
+ 
+ 
+ def apply_elf_relative_relocation(
+-    reloc: ElfRelocation, image_base: int, sections: typing.List[PeSection], addend_size: int
++    reloc: ElfRelocation,
++    image_base: int,
++    sections: typing.List[PeSection],
++    addend_size: int,
+ ):
+     # fmt: off
+     [target] = [
+@@ -439,7 +443,7 @@ def write_pe(
+     file.seek(0x3C, io.SEEK_SET)
+     file.write(PE_OFFSET.to_bytes(2, byteorder="little"))
+     file.seek(PE_OFFSET, io.SEEK_SET)
+-    file.write(b"PE\0\0")
++    file.write(PE_MAGIC)
+     file.write(coff)
+     file.write(opt)
+ 
+@@ -453,6 +457,8 @@ def write_pe(
+         file.write(pe_s)
+         offset = align_to(offset + len(pe_s.data), FILE_ALIGNMENT)
+ 
++    assert file.tell() <= opt.SizeOfHeaders
++
+     for pe_s in sections:
+         file.seek(pe_s.PointerToRawData, io.SEEK_SET)
+         file.write(pe_s.data)
+@@ -515,6 +521,8 @@ def elf2efi(args: argparse.Namespace):
+ 
+     opt.SizeOfHeaders = align_to(
+         PE_OFFSET
++        + len(PE_MAGIC)
++        + sizeof(PeCoffHeader)
+         + coff.SizeOfOptionalHeader
+         + sizeof(PeSection) * max(coff.NumberOfSections, args.minimum_sections),
+         FILE_ALIGNMENT,
+-- 
+2.34.1
+
-- 
2.34.1


