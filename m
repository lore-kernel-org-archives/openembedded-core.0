Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77641E77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.116736.1733788625205018428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AGER6lLb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788625; x=1765324625;
  h=from:to:cc:subject:date:message-id;
  bh=WRNVYCf0MC7ywOOELBey1LG18DJm3W4qW05Rqpvnz70=;
  b=AGER6lLbVU/NlnwYVGdPnxLdc3SHScXA1md7MMnVzoj+My0SI8XNcLLs
   uMcB6MJ+PEXKSvTOxK9pC1yhgGOJucW1Vwkln/s7HoufLEp5+pBlSRD4z
   yj+huYu38AiliPTIz4W9XUBIJA8/JZvsLCPxE6DjVVJO9Ailza5Kl8qb6
   9aKLy/X1t9gngC7SQzpYTQs8R9WkjUfLt9LoW+0ODzI7KaxXKlCexJWzs
   pZ6yvbMb5KbLxrKeFI+fMk9rCrWFyF6VAPQiVg0OhPZGnesMozUXnFFfR
   LVzqKkfCc+/gLY3vVreooqADur/LSVJFyMCO4tmnkvhb/AYaoQH/ZnS+Z
   g==;
X-CSE-ConnectionGUID: 4R6A9UysTC2MScw1ZyywPw==
X-CSE-MsgGUID: fbeYtBHLQ4CD3fmKpnvPFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="171497087"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="171497087"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57491A80F4
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F8B5F740
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A531120076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:56:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1D56F1A000B;
	Tue, 10 Dec 2024 07:56:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 01/20] barebox-tools: upgrade 2024.10.0 -> 2024.12.0
Date: Tue, 10 Dec 2024 07:56:33 +0800
Message-Id: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--6.009700-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQz+YRR7FZLieLS
	dVP2tZn5oJlL8aD3eJtVdMFscFLE5fXNEkgZOg/OiV0ptmwZhq1a4WbtOovh4XyJtPra8aSnkhK
	b/AZdenHNYKh71zRGtwp5JDTXNukWcAx/ckuwlsx/OBWacv+iVWo8zUxTJUAjPcFkClcmQNu8PU
	5Z3VnNydu3SbSrXQPYUuVO/aRDb8vfOWhH4ba/NsOC5QFrchIlGBULflUTtXT5V4X/65DwbwjrO
	X3xwpMpHokQHe1nImaMO9cHfks3t6XYVfEVIGs3CbqZbMjTXcdK0YCCYqpa5Xd17Y6gGqDC7v0M
	lFSLfmlNDQmQ8bbzv+affHI8kAmiHY/bzRmIaZHcgUVP3Cp+vRCE2NlBjIjcdmicEPU684PnAw8
	yp081LG0C585xWIZ4gDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/sMoUmjEB/+Oo5aIcizwwTcXERj8
	aUn42aoo3Vh5eBlc3rtIiePafwdQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208497

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* ARM: omap: fix NS16550 UART setup in omap_debug_ll_init
* Documentation: imd: update information on barebox_update
* partitions: efi: Check GPT header size against minimum limit
* checkpatch: fix detection of barebox root directory
* ARM: omap: add two smaller MLO defconfigs for AM335x
* crc: crc-itu-t: generate lookup table on first use
* of: fdt: fix possible overflow during parsing of fdt
* remoteproc: use I/O memory variants of memcpy/memset
* dlmalloc: Fix integer overflow in request2size()
* remoteproc: imx: add support for loading ELF data sections into DRAM
* remoteproc: elf_loader: skip segment with memsz as zero
* of: fdt: fix overflow caused by fdt_prop extending beyond fdt
* usb: typec: fix freeing uninitialized memory	Ahmad Fatoum
* startup: do not bring up networking if console input disabled
* sandbox: noshell_defconfig: set CONFIG_CONSOLE_DISABLE_INPUT=y
* ARM: dts: i.MX8MP: disable NPU node if hardware is missing
* clk: clk-composite: fix callback guard in clk_composite_round_rate
* partitions: efi: fix overflow issues while allocating gpt entries
* lib: lz4: use lz4 instead of lz4c
* clk: rockchip: make it compile again
* ARM: i.MX: ele: fix forward_lifecycle
* ARM: i.MX9: tqma93xx: workaround warning in variant detection
* partitions: efi: fix GPT header size exceeding allocation size
* video: Rockchip: add missing dma_alloc_coherent a device parameter
* dma: give dma_alloc_coherent a device parameter
* common: buffer access out-of-bounds
* include: Include <linux/math.h> to resolve implicit declaration of do_div()
* i2c: lpi2c: fix potential read of uninitialized variable

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 5dcdb70757..fce3b825ae 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2024.10.0"
+PV = "2024.12.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
+SRC_URI[sha256sum] = "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f47cd6967b9c4dcab"
-- 
2.34.1


