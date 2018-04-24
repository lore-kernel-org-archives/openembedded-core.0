Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 15EA771C42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 18:48:31 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f1-v6so6348926qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 11:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=xcDy7PRfaVc0lPqKMdfQRp/9WUPy/Txdz4sVoxwibGo=;
	b=bajdIsXfWZu6G01BMJFOyJady1kiHwXCm+qRdcdfB1YEWP/XTE7uMY9FBes7Um96zm
	ILMk92xTVSQ6tbZxYa6ui+bYfLVt29LiBaK3ZjHWMyFVFybnYSxkSETUNsTogl4TqEGk
	dblSGR7E+yMTxh6ifxnOQ8D3og4Bq4oAJ9z/3Yb3Ni3fDkTV7JtKzY+PsnbD2V64mFLq
	71wMSXwOR7tx4y6UWXCxSt4/r6w1GyJ4Rs1ABMtdKLM0XouoNSsU03770ZJglatZbZ5g
	RohPkuuRcq/aQUakB0/0nPUwqySyGKH099OjPe9cMzG18slq/KK7WbHB4ZCaW5CERUQZ
	Om/w==
X-Gm-Message-State: ALQs6tAXsjOyZLsS5WufQgQGf3rV6cYXoQqpVhoOLhYLg7rP5sGcTwqq
	YbxK+hCgRtj39Y7xzdg4k2FUxQ==
X-Google-Smtp-Source: AIpwx49Xd11UsTRrPEJqEU0slYbcANFCHqG8GlkFwWFF3aFvUxzny5t/vq6UQ14mZ8hqlblX4RYkhw==
X-Received: by 2002:aed:3f17:: with SMTP id
	p23-v6mr28793785qtf.57.1524595712173; 
	Tue, 24 Apr 2018 11:48:32 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	s67sm12769961qki.58.2018.04.24.11.48.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 24 Apr 2018 11:48:31 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 24 Apr 2018 15:48:25 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2018 15:48:16 -0300
Message-Id: <20180424184816.6763-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180424184816.6763-1-otavio@ossystems.com.br>
References: <20180424184816.6763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] wic: add ontrack DM6 aux3 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2018 18:48:32 -0000

Add ontrack DM6 aux3 partition support to enable creating
partitions required to boot i.MX MXS based platforms.

This has been removed by OE-Core:21af89a6 (wic: allow only supported
fstypes). It was unnoticed as most users were still using the
meta-freecale image generation class instead of wic but we are now
in process of dropping the class and this is the remaining use-case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 scripts/lib/wic/ksparser.py              | 3 ++-
 scripts/lib/wic/plugins/imager/direct.py | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index e590b2fe3c0..02b267380f6 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -138,7 +138,8 @@ class KickStart():
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
-                                   'squashfs', 'vfat', 'msdos', 'swap'))
+                                   'squashfs', 'vfat', 'msdos', 'swap',
+                                   'ontrackdm6aux3'))
         part.add_argument('--mkfs-extraopts', default='')
         part.add_argument('--label')
         part.add_argument('--no-table', action='store_true')
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 1fa6b917e66..594481e6a94 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -528,6 +528,8 @@ class PartitionedImage():
                 parted_fs_type = "fat16"
                 if not part.system_id:
                     part.system_id = '0x6' # FAT16
+            elif part.fstype == "ontrackdm6aux3":
+                parted_fs_type = "ontrackdm6aux3"
             else:
                 # Type for ext2/ext3/ext4/btrfs
                 parted_fs_type = "ext2"
-- 
2.17.0


