Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F93BC87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 13:46:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.18165.1754315189741776665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 06:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZVmRaWky;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-458b2d9dba5so16626835e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754315187; x=1754919987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syVz5lZi2/wdmfi/XFa0DpbB3DMbTTmgglqDwXYAcYU=;
        b=ZVmRaWkyDy2RbVwjDZURTfKRwZjjs82qJMO0VCfgIRf+jTjAqwBKWCzc0G9Cy8Jeid
         bcXPThZO04hw7sMzJ5UrNVu04AaL5PwgIEGBrNY7ebYbMd43JDXTBXVzQy3xtx4AKbvy
         iREr5W6/bxrA1wKmTpeZuoYheWr4P02nW03rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315187; x=1754919987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syVz5lZi2/wdmfi/XFa0DpbB3DMbTTmgglqDwXYAcYU=;
        b=liujeRiFRn0i9tVZ4oteEPN3TXVgi4lnVLlIqi4CwnUUvMwtr4A5VsHeHLmzzP0J6h
         9iiYHu9yYpljF/7ekJaFunVX3JnUHa2cT5Z0LB1NNQoGZOfkBwCz728u0tTAF6ZlH9ro
         LtLlUFDkRAOjrVM7fqx5+KOnSKCTaONmSPu7Sr8MLZ2SJo46D9U1RjBzM8DmbcJ9mvEx
         BYNLyGdSH1WPWLTj2mv1jOe0fpfuh7aWj9qGxsdGtFXjsvFtf7HBpIEe9vqt3p4MTbi4
         9pwSSVl2+i9NtnkvPAx2r+OQYpSY1go/5suyqpTy/b2UELEpvQIr18PwLLr1hZldkju4
         wQDQ==
X-Gm-Message-State: AOJu0YzOkV68ZwRCYvYXgEPhaADr2e7qdXAroH2rf8ajZ/TOE/oyLJy2
	+wocdck2DXy2HRu84o2lUd0bTk1JWoER9hbft8Ac/2sa1DZREx0eiy/Cgve6jy3Td1VDrm9vSU7
	r7sei
X-Gm-Gg: ASbGnctiYF+oZsqTIJM0liXbTyuI/Cd+g/u6JPRAxOMbZ//By6pbcmH5ZoFXyp4HTl8
	dp+7sZpPT9k7KPZlc1g9McLx9CdnT7V9I44vH18rGp7emX0kfTPoBt0IYnBmp9f/j4GAxEJYjmr
	k2vfOhh9O09u2n0Oyok7y5kBmTF7g5I2Ofi1Imrj+E6VfBO8k5KrM/bfUrlDTKSrFfirfmmIoku
	nFAhDyfDTGPkrrxqajRoIM0TOqO3pioz5CQkvG2BCuw7ZElygTLlgWP0953NTKWXn5zzPhPoP2y
	ssX9YxcFHhOeKoPR9/+t6J1eoU8Uhm9JxnZpzBOATR/C6g6ju70OwQjr7pGlxP4TV+9XN7Bpk67
	vrZQCvAxmVSyZKOnuN3vr1lvBHDnCIXwAJqRZBtmZftIy6KCFxgRauMKSmzzGCg==
X-Google-Smtp-Source: AGHT+IFjG+es/XYlbCMTp47KIGKBYarpPAuA7jN8uKzNtBdOo6G5GoURZbJSXitV3GWj+DDIIqM0iQ==
X-Received: by 2002:a05:600c:1394:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-458b6b551b3mr64094855e9.33.1754315187125;
        Mon, 04 Aug 2025 06:46:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2c76:58bb:66fc:3164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b4f9e952sm104869005e9.9.2025.08.04.06.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:46:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] scripts/runqemu: Update the fstypes list with newly supported compressed images types
Date: Mon,  4 Aug 2025 14:46:22 +0100
Message-ID: <20250804134624.1412716-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250804134624.1412716-1-richard.purdie@linuxfoundation.org>
References: <20250804134624.1412716-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 13:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221429

Update the interal list of types within runqemu with the newly added
compression formats it supports.

This fixes autodetection of qemuboot file locations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a57fe794dc8..827300080a2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -198,8 +198,9 @@ class BaseConfig(object):
         self.bitbake_e = ''
         self.snapshot = False
         self.wictypes = ('wic.zst', 'wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
-        self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
-                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz',
+        self.fstypes = ('ext2', 'ext3', 'ext4', 'ext2.zst', 'ext3.zst', 'ext4.zst',
+                        'jffs2', 'nfs', 'btrfs', 'cpio.gz', 'cpio', 'ramfs',
+                        'tar.bz2', 'tar.gz', 'tar.zst',
                         'squashfs', 'squashfs-xz', 'squashfs-lzo',
                         'squashfs-lz4', 'squashfs-zst')
         self.vmtypes = ('hddimg', 'iso')

