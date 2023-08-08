Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099B3C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 16:29:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.66433.1691512170895539897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 09:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZYqmX8Fe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 183211BF207;
	Tue,  8 Aug 2023 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691512168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNBCYj8yV5MFc57wDRFvV/MUlNIMzQPRmc1+e8guAaw=;
	b=ZYqmX8FekBAtWJIwrKU0m0OE6jFEK1sClYqhhTXPBw+Fxn4E0ragXu+m3cUM8kTAFhodIe
	HYlhYL+T6pH5jxX9R8OeuOIxAMrtlyrLH+5na2nASukNyx70bK7GjxH8XacNh/I9HlVw6J
	bwAYQh/Au9NaNjWZgc55Tv8xOMgk+dEqqwwDvIc/mZ3ffIiKHQ7YKR75p5Sjuxzt0Qr8k+
	RaHG16Bhroty7F/N5P0l0208eW3kBIkjlMjyuDOLLHVgOyF/PrquCtWrXdvBSpNXbPmRe6
	z3Op0CegGuT0VoghL70Ntu/AA0Zo1Z0foQMaq6emjbTNFPNqijiMwOoXaTpmHQ==
Date: Tue, 8 Aug 2023 18:29:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [OE-core][PATCH 2/2] systemd: fix efi stubs
Message-ID: <2023080816292732f22513@mail.local>
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
 <20230808160828.3045524-2-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808160828.3045524-2-jose.quaresma@foundries.io>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185670

On 08/08/2023 16:08:28+0000, Jose Quaresma wrote:
> Before the patch:
> 
> | $ objdump -h deploy/images/intel-corei7-64/linuxx64.efi.stub
> | objdump: deploy/images/intel-corei7-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> | objdump: deploy/images/intel-corei7-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> | objdump: deploy/images/intel-corei7-64/linuxx64.efi.stub: file format not recognized
> 
> After the patch:
> 
> | $objdump -h deploy/images/intel-corei7-64/linuxx64.efi.stub
> |
> | deploy/images/intel-corei7-64/linuxx64.efi.stub:     file format pei-x86-64
> |
> | Sections:
> | Idx Name          Size      VMA               LMA               File off  Algn
> |   0 .text         0000f99f  000000014df91000  000000014df91000  00000400  2**4
> |                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> |   1 .rodata       00002c40  000000014dfa1000  000000014dfa1000  0000fe00  2**2
> |                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> |   2 .data         000002d8  000000014dfa4000  000000014dfa4000  00012c00  2**4
> |                   CONTENTS, ALLOC, LOAD, DATA
> |   3 .sdmagic      00000032  000000014dfa5000  000000014dfa5000  00013000  2**2
> |                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> |   4 .reloc        00000080  000000014dfa6000  000000014dfa6000  00013200  2**2
> |                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-core/systemd/systemd.inc         |  1 +
>  ...-elf2efi-Fix-header-size-calculation.patch | 70 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index b00a49884b..e5686fbe44 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>  SRCREV = "994c7978608a0bd9b317f4f74ff266dd50a3e74e"
>  SRCBRANCH = "v254-stable"
>  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
> +           file://0001-elf2efi-Fix-header-size-calculation.patch \

Yes, this is exactly what Ross pointed to me and I had locally, I've put
this through the autobuilders now.

>             "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch b/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
> new file mode 100644
> index 0000000000..0e8924d27d
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
> @@ -0,0 +1,70 @@
> +From d082d6502fa86e08dda858933838dde0406b824f Mon Sep 17 00:00:00 2001
> +From: Jan Janssen <medhefgo@web.de>
> +Date: Sun, 30 Jul 2023 20:59:04 +0200
> +Subject: [PATCH] elf2efi: Fix header size calculation
> +
> +The PE header size calculation failed to take the PE magic and coff
> +header size into account, which will lead to header truncation if we are
> +writing only 5 sections.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ee91e06a5841c30bc7306260528ef407e0ebbab3]
> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +---
> + tools/elf2efi.py | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/tools/elf2efi.py b/tools/elf2efi.py
> +index e233c8e3ab..2e478940f5 100755
> +--- a/tools/elf2efi.py
> ++++ b/tools/elf2efi.py
> +@@ -210,6 +210,7 @@ FILE_ALIGNMENT = 512
> + 
> + # Nobody cares about DOS headers, so put the PE header right after.
> + PE_OFFSET = 64
> ++PE_MAGIC = b"PE\0\0"
> + 
> + 
> + def align_to(x: int, align: int) -> int:
> +@@ -304,7 +305,10 @@ def copy_sections(elf: ELFFile, opt: PeOptionalHeader) -> typing.List[PeSection]
> + 
> + 
> + def apply_elf_relative_relocation(
> +-    reloc: ElfRelocation, image_base: int, sections: typing.List[PeSection], addend_size: int
> ++    reloc: ElfRelocation,
> ++    image_base: int,
> ++    sections: typing.List[PeSection],
> ++    addend_size: int,
> + ):
> +     # fmt: off
> +     [target] = [
> +@@ -439,7 +443,7 @@ def write_pe(
> +     file.seek(0x3C, io.SEEK_SET)
> +     file.write(PE_OFFSET.to_bytes(2, byteorder="little"))
> +     file.seek(PE_OFFSET, io.SEEK_SET)
> +-    file.write(b"PE\0\0")
> ++    file.write(PE_MAGIC)
> +     file.write(coff)
> +     file.write(opt)
> + 
> +@@ -453,6 +457,8 @@ def write_pe(
> +         file.write(pe_s)
> +         offset = align_to(offset + len(pe_s.data), FILE_ALIGNMENT)
> + 
> ++    assert file.tell() <= opt.SizeOfHeaders
> ++
> +     for pe_s in sections:
> +         file.seek(pe_s.PointerToRawData, io.SEEK_SET)
> +         file.write(pe_s.data)
> +@@ -515,6 +521,8 @@ def elf2efi(args: argparse.Namespace):
> + 
> +     opt.SizeOfHeaders = align_to(
> +         PE_OFFSET
> ++        + len(PE_MAGIC)
> ++        + sizeof(PeCoffHeader)
> +         + coff.SizeOfOptionalHeader
> +         + sizeof(PeSection) * max(coff.NumberOfSections, args.minimum_sections),
> +         FILE_ALIGNMENT,
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185666): https://lists.openembedded.org/g/openembedded-core/message/185666
> Mute This Topic: https://lists.openembedded.org/mt/100625046/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

