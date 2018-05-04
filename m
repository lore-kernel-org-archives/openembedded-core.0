Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 63B3B74D68
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 17:43:59 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f13-v6so18601414qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 10:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=e+yFEjmQcCUT7Eb3l1Jrh40iKZ1KGuYkc6DJElgpszI=;
	b=raThQtxNuinyuYyE6pAwTSSNe+E5E3WJc5WcG+iyMIzHeXnGUTtcgkcC31fno/LRGo
	aI/gZMcUgIqDXtDcCjBWZ6njQzzLhhTd3jaWGOx46I3TRk3Y1xSiSfnIWrAAd0/aZ0k+
	RZYdWDm6e7WFKtRULe7n3MN4hByEFJjcBIvEMmYy71cbHWWKvSLZOu/Re2sU+8G5wJNm
	i3xOD4wNdDp5cCNx7LiHwrwo4IEgkICHwUg04nrNTb8BSGbtpxR6bEJv9+YsxX6b84Ox
	gdK5ZCnX+TKhHUrj5RXmTZ7JakJCezdcZVhaO9H0BzCRF87VeA7tds3uhtGM0W1l51bk
	QGxg==
X-Gm-Message-State: ALQs6tB7BeltxjJdIllmPcI/bxNzEbrKQ42aeexFhHyPeXQ88Jmh+/Ns
	ZGYY3gKCq7hZllgKq8xdI5zonw==
X-Google-Smtp-Source: AB8JxZrZSlg1pjWiwMsjJ4S+sOZ54Dp9QOGNhkTk5Q4bJa6ShLts9MCaQFCqxNTuejVf6NHp6KONhQ==
X-Received: by 2002:a0c:a94c:: with SMTP id
	z12-v6mr8542538qva.57.1525455839882; 
	Fri, 04 May 2018 10:43:59 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	t13-v6sm14940817qte.77.2018.05.04.10.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 10:43:59 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 04 May 2018 14:43:54 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  4 May 2018 14:43:46 -0300
Message-Id: <20180504174346.1149-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180504174346.1149-1-otavio@ossystems.com.br>
References: <20180504174346.1149-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] wic: add ontrack DM6 aux3 support
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
X-List-Received-Date: Fri, 04 May 2018 17:43:59 -0000

Add ontrack DM6 aux3 partition support to enable creating
partitions required to boot i.MX MXS based platforms.

This has been removed by OE-Core:21af89a6 (wic: allow only supported
fstypes). It was unnoticed as most users were still using the
meta-freecale image generation class instead of wic but we are now
in process of dropping the class and this is the remaining use-case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 scripts/lib/wic/ksparser.py              | 3 ++-
 scripts/lib/wic/plugins/imager/direct.py | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index e590b2fe3c..02b267380f 100644
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
index 1fa6b917e6..594481e6a9 100644
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


