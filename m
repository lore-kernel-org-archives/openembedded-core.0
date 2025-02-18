Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6C7C021B1
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:15:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.7518.1739913342038984663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u3vS+HLE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220e989edb6so120440135ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913341; x=1740518141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/m+Jpqy8QO23CyizkqcNSr7y2U8znZ1f4hH9+RQm9k=;
        b=u3vS+HLEwKKDK3EzMcbpf09Go7VfABIJz4VxQnAIauhZAmCBX2pBW8ubY+ZRfeeeSd
         m+h31NeqP2pYd/9Tqwo0a0vLw9JRu90yhPGNu/S3bv566aAoGJX+yJTRN9d4trtPM6FH
         LbuluVxaiwXJfcZCbUYsMfuEqWuqf2OEvgEZ0ClAtNiPrJysxQ1Yoxm2tG9Sh4TjZFsB
         dOsxqrbuPO7WIOAdFYR0D5Q9Eg4ImgcOc8zRy72VMsL7CJjku5FO29RwxncrzrT3Pdoi
         O5VLBmcr4kSFi7dg2rfzfcwvlHCGNrtQ8hujpInV8ZLxeKngWUHyvStRAiQZWqEoQqRO
         gNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913341; x=1740518141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/m+Jpqy8QO23CyizkqcNSr7y2U8znZ1f4hH9+RQm9k=;
        b=cW76DsBsr8bQwEwhFsadkyEgRPeRE2x7HBuONiwxBlhs3xHkvFZpU6x3//diba1LAn
         bF5DbMpHFd6XtTB3Zcir/th8XzgO+gi9rzHqCTgbUF9SL4qdhmf9e8kwZDquxWlwJQG6
         pyDeqKnVwW4tQRDIhf/f686A4DIBwgu3Jtnd7QQPJpfxQqbWtFIe+MGReBsNP24BU8Lr
         4y1pdFuXFIe+Z2a/1/vIPTiXaPH0WWZy6mF7liae8URtV8AuDJyhrGvONHapep/Wg5cr
         jDxt4F+gzg0ApLDMdGXwp7sv6fh5qlbea37CMbJb4swr8De6KgUJqaJml2sQCJhh6HRZ
         J9Zw==
X-Gm-Message-State: AOJu0YzxqKSAYZmB31prnwLWOj31xux08yIfixdsrX87vEvhyY/jAGe8
	uorgk3zNqjFEb3uaKlxj+EIDkToG9r4xju4rJmBsUckMi7z3cbHX93LSWdev5GWw75rnzD28itT
	+
X-Gm-Gg: ASbGncuyGHZupEBGp5O9IQEwLmVp2VtQD1Bj9NGMOAs3vxmpyj8A5flzxOTUgXTne+f
	Yyq8hNkvMtuxP5VdKLYWUeuy3xqjm0SBOOJdDSdNseK1XxhRgSCp2emxp5ki+2li2kjWyJx0ncP
	IKkbwP3JJtjWPCZpcDL70L/2VnQsiMcHXjN76rRjX7/XNLOJ/+CfKQY/zx1Zjw6lwl31jfZHy5c
	N/m0N+0gNL4pDQ/hjSBkpOIfjDyOAwBAT6xkNQ9p6Wpo6dxHccWqTlcxrplIaJasFs5MuC1vBtI
	PrG6U8U=
X-Google-Smtp-Source: AGHT+IE1eVnB8qFBxhiFHgzxLBxRrv8mwHrFqEKTcXllyUYBpv3z9MQAatHqEILd0Dfs1KVmO7YS6w==
X-Received: by 2002:a17:902:e88a:b0:221:133:fcfb with SMTP id d9443c01a7336-22104042259mr219450385ad.20.1739913341362;
        Tue, 18 Feb 2025 13:15:41 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349056sm93720055ad.22.2025.02.18.13.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:15:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/7] scripts/install-buildtools: Update to 5.0.7
Date: Tue, 18 Feb 2025 13:15:23 -0800
Message-ID: <46afde73632d0ee8bfeb06c0ae478fc0a3d12147.1739913090.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739913090.git.steve@sakoman.com>
References: <cover.1739913090.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211657

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.7 release of the 5.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 972671d50f..e4d472023d 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.6'
-DEFAULT_INSTALLER_VERSION = '5.0.6'
+DEFAULT_RELEASE = 'yocto-5.0.7'
+DEFAULT_INSTALLER_VERSION = '5.0.7'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


