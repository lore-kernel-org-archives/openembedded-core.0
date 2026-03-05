Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF65EEF302
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 05:35:19 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37902.1772688915220365721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 21:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SfS5CgOv;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: alistair23@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso2594472a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 21:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772688914; x=1773293714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6flBz5SfvSdL2kg3ua2MOs6kx0chsYTXvhf8P/ZCe9M=;
        b=SfS5CgOvXeSBdLiw1uu36ufuNXvRU3WZ6CGc5XDNxoFLwUcne+9tn/ZygbheUDGE3T
         iGRziNGp/Pn86Q/uCvMrtQ/2i3kXITrM/Mm7xXAK0iieSBL5w5maiO35f0xZ+vE70oE/
         9WeQOR6RLFkW8CcPrMkGNqHXfN6adgXTt8k6w9VAYXpVjx9jkHjxpvm9YXRNmlWzxA8Z
         N1uQ4uWtLgIxg4B723zL0iFUaEG2ktcafTLUQArqqlKbFBOe8MRO14BBhqVhMNcnEgUi
         toimZsPJuER/q20BMmSH4OY7EqOzmITkWjjHdr9wh0kqMvZE166EK36EIINR/mYM/4dR
         oe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772688914; x=1773293714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6flBz5SfvSdL2kg3ua2MOs6kx0chsYTXvhf8P/ZCe9M=;
        b=jd4MIM/7GXjhLsigyTeGzTeqKmJnxV7otAAYCWreVwld5SbqOuJMMX+VimNylvy0Fp
         qZPS2M/dxvNT0fI9lnOSlHkjdXIBVz3dXLjVPthRBPyUwVJSJplucWekiTBPejJOtYL0
         hFusiDJsmeu2QYpKvvX6JKCpuMOZ0EQVYpeJSqH5zzueBNVqyI6jhWpgj5aRApkQ6d7k
         eyQY8a04rYwlj7evaQzZ3gNbUR2oCG1ZprI+2qpFp/61L3Vyh48xrfQYRM0U6vBAmTiQ
         MXwGqcKBUp63P0RTj1GGpqZgEQTbKcC41pFu55lVdnD81Z91HqMShLbd6yc9oi3WRMpm
         YofQ==
X-Gm-Message-State: AOJu0Yzl9GMA/25INyhFJXvHkOCS34OwFBAvboN3ql8cNi+AMEOFQ2+u
	DikRgFZ34HeIm6nE3iw45j3cPZxToalb66FH/m8/8RzLKA1Sch0PbTriorBbMA==
X-Gm-Gg: ATEYQzxrRV5JhBmnuDQfTJSh/kUhley62eYcDWPsAR2koCRfhSHjuyBMllXoaumwtb8
	t6b1s9ehPNqM2c8BXvaY1cIsVaYbpG1zGvC4qCQa8CDsQwcXam2opQsYZ4/4+SE5qFRfNV1B0PJ
	g6kfgZTfHrx6fiQ5l1zEk9Uhm1ZQpGPEAg3gA82WuUBoqDSbV3JR8NLIXp1ybz4g2/lSL59e73U
	wS+NMAyzfWUY4VBy6jl26xr8cCyPZb2QIilAtwDA07yYdQ7dk5NAbYGsOKzYV186e5i1GaUgi0I
	wbjZ5KaYBJlxUGX0V+vbFUZ0K+YMKWYmFLE33NkBDq4/d4Yermvu2lNeRVSsQbPrN92qeis3y/a
	D9csLSLLBuN5B/E3t8B7pWhqJbBKpg3CcHO+cpD/YQBIqDcjK3Pv0gm0YRs4E007BWPE/QtJ2Jg
	Jv3wqipzcVPCIhxciqsNURGftN1VhWdzpTrq1Bj+W10Q==
X-Received: by 2002:a17:90b:2792:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-359a6a7ca47mr3586767a91.31.1772688913976;
        Wed, 04 Mar 2026 21:35:13 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d4096asm713951a91.6.2026.03.04.21.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:35:13 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] machine/qemux86-64: Recommend extra kernel modules
Date: Thu,  5 Mar 2026 15:35:05 +1000
Message-ID: <20260305053505.1632077-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 05:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232445

From: Alistair Francis <alistair.francis@wdc.com>

When bulding Linux with kernel modules by default they aren't included
in the qemux86-64 machine. Let's ensure that they are included by
setting the MACHINE_EXTRA_RRECOMMENDS to include " ernel-modules".

This is already done for the qemuppc64, qemuloongarch and qemuriscv
machines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/qemux86-64.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 8aac7634b7..245fbd94da 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -31,7 +31,8 @@ MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += " kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.53.0


