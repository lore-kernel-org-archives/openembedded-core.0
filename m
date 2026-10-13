Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901FBCA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:49:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4063.1791888597742348453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gA8S41pQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32174795e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888596; x=1792493396; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxvmEM7UOhdACm+/m/zyjMu+RKcGOpVLO3q3LpXOZaQ=;
        b=gA8S41pQ4r/DDSo/n5ruffIlKabPm0Vx9TO0EePwLe45wIUYSqlBZg7NvI0T7ubul5
         4nKYERlOoBinG7sgGkEJutT0H5HupNfNdNHjtR1igm1FWBTuguXYmZ1UEgLVEuFk5t37
         F9QVILXA33Akttpqn2/tLjJTdkaY5SXkBrvECc1asiZzYS+JS0xq5v71K1IqwtIHKxGY
         GmSfUDj4j2OsuiEPc4fxYlTn/9/kBk98YymgZzL13+3krKBcTxsFj9TrphycxZsHxLL7
         tkwxprvbAD267B9TL9Oqt+iDXPmZsSz7xa4OEfWJ6VZM7x3Fu/y1cgmSFFkUMGxWTfPX
         ZVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888596; x=1792493396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxvmEM7UOhdACm+/m/zyjMu+RKcGOpVLO3q3LpXOZaQ=;
        b=LYRO4V/m/G/nBBhT3TgWYY9cgLPk1du26O2moDKGM8f4Mhi5/UwaBzRjR7eRi6Ix5a
         roiRmqt7f+1DRnIbwV5xFKY3hwsWm+VkGhQc9ruube5kMcqFLBrmDEI4uFjoOQ52q2Ej
         COrH1mwI+EchIpKRzlyBP58gnvxRp9ES/uawataK/TnGfUkv9zJ977+RWx3xsHn/uhB9
         /P2Sr9576KRxrlmH1Dg8uV4GDzP8iWsN79elFNr2XM4DurUT8hW0/40Ml5qKlCF8cJx+
         sIh4A2LBIEISiKfL4nCVIRUxw1O8vEez2F6slb0JafiKl00SDWNVDeSL9qZuZvYhGMtu
         RVmw==
X-Gm-Message-State: AFq9FYIVnvGZnVVDhRhafs9EdFr+1MtvFbAMiEsWl5J7iME/8M880akT
	WlnLMNEAN4JHEv9l+Zwt4+Y52p73EbsTwNHClqL6QuDYYmR5bTU18A7A+WlFDA==
X-Gm-Gg: AYBFou0URfR1/meEGD64bKHc38iQ+CnBhG6/9FrtI4CVmFvBnnxsCjXZ0CNPMbQb+mT
	cFJzR5QSX7xBiAJ0j6l+2h8qvXCSjI+f//tPJvJWfQfCpb2JDg8uIOK1Vo6Ur6bw8Hu+FolfpfG
	fjybnXMX9NkAvclTny09VZ7FOE7eF+PKbS7tL51NbQw7FRa9YlKFOxdcBvBaOWlNjRyZuGfuPBU
	TZNKxLldAuT2OAII2gOKP18hm3yEhjQmkXS/Z6DI9O7OixhZocmh02G3SqTu7Yz+fw9DlnwuXsk
	gqkPCJ1N9T9OaXok4qDvxe3dQGix48jazflYQgf9iE+3O3V+Bx+nsZUvQ2yt+MHtH65YCkcqfVm
	AiEXH53qfkwYC6nnxAD/aLO3tJKdNFCbIUUI786L+h6WNwE7F/Xa2h4XjdUfLhDFSu96G33nbpr
	JmElfHlNAApUusSkhHCforY9bjXVAQgc05OVlGGjn+zLAUkNx6Aw4RFO58nAUAFkuHtc0lIgR7r
	JDQ9bSIc8oun17x94ZfJAT/ohI1yhrfm50ix8QBVQh90tH9dWj8v+bC9KoK
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id 5b1f17b1804b1-4a18e4a3f69mr234454985e9.14.1791888595639;
        Tue, 13 Oct 2026 03:49:55 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d4a9sm31623155e9.2.2026.10.13.03.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:49:54 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 13 Oct 2026 11:49:37 +0100
Subject: [PATCH 3/4] image_types: keep the rootfs mtimes in ext2/3/4 images
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fontcache-reproducible-mtime-v1-3-950f07b80f0f@gmail.com>
References: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
In-Reply-To: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247719

mke2fs reads SOURCE_DATE_EPOCH from the environment and clamps the time
of every inode it creates to it. bitbake exports the image's
SOURCE_DATE_EPOCH, which is older than the REPRODUCIBLE_TIMESTAMP_ROOTFS
that reproducible_final_image_task gives every file, so an ext image
carries different mtimes from a tar or squashfs image of the same rootfs,
and anything recorded against the rootfs mtimes, such as the fontconfig
caches, is wrong in it.

Give mke2fs the rootfs mtime instead, as oe_mksquashfs does for
mksquashfs. It is just as fixed, so the image stays reproducible.

This changes the times stamped into an ext image. Every inode's atime,
ctime, mtime and crtime, and the superblock's created, last write and
last checked times, move from the image's SOURCE_DATE_EPOCH to
REPRODUCIBLE_TIMESTAMP_ROOTFS. An image recipe has no source of its own,
so its SOURCE_DATE_EPOCH is SOURCE_DATE_EPOCH_FALLBACK; with the
bitbake.conf defaults for that and REPRODUCIBLE_TIMESTAMP_ROOTFS, the
times move from 1302044400 (2011-04-05) to 1520598896 (2018-03-09).

Where a distro sets REPRODUCIBLE_TIMESTAMP_ROOTFS earlier than
SOURCE_DATE_EPOCH the inode times were not clamped and only the
superblock times change. The directory hash seed is still derived from
SOURCE_DATE_EPOCH and does not change. An ext image therefore differs
from one built before this change.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index c0b3a780131e..a5637c2226c8 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -92,6 +92,12 @@ oe_mkext234fs () {
 		extra_imagecmd=$@
 	fi
 
+	# mke2fs reads SOURCE_DATE_EPOCH itself and clamps every inode time to it,
+	# so give it the time the rootfs files carry, as oe_mksquashfs does.
+	if [ -n "$SOURCE_DATE_EPOCH" ]; then
+		export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
+	fi
+
 	# For reproducible builds, make mke2fs/e2fsck deterministic: a fixed time and
 	# directory hash seed (the fsck "-D" pass reorders directories using it).
 	# This mirrors what wic does for its ext4 partitions.

-- 
2.43.0


