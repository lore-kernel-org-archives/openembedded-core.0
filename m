Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0529A71984
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 16:31:07 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id a202so7061614qkg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 09:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=f+gIxLtoCcd+HUiwaH+7XOJPXyHAEIqAEQuZxHBe+6w=;
	b=OtuKltrB81SCleQpDI1cGEI/xnR1SYl70YdRV6VF6aqxVL9PFKUkkW2iD2P21xj3ve
	l9aBTawirAX+m32xzIIUTg2wEEEgyc6jxAjpa73xVMGlAfqow84ZGjabqsq3YQW4tdjt
	aLojqLwMcFmuwcwdCNLRWDkLtqjIm6cWDx2SzhZXOTUp56T5+gOiE7hHQZEwcBDFqJh5
	8clisxQ1GpV9vDg++ng6339wImKi8QNAtQOYF4cT3jDarBC3iPAnjclO6Kk6sS1kOpwr
	UctoK/eLyyuMxh+/LyXZrdgqT4JK9Iau4t54+FbQXublLCEVUbNJ7eenwWS3hp1ZEx6J
	dgDw==
X-Gm-Message-State: ALQs6tDgLYTIIk1QBoMXCw+FAQ7L7dVxmMRILIWan7AZkQHqx/uDLdt5
	LfhoDlTAtTYfyYZ9Li4DiyJgAg==
X-Google-Smtp-Source: AB8JxZpiDZ1n5zhTwZZLeB3JNBgYACpvVZvbLYG6MuRK/ORxJP4abJqFXQJ/f1FhkdqiGr6ew0Ufmw==
X-Received: by 10.55.24.220 with SMTP id 89mr10404732qky.49.1525105868069;
	Mon, 30 Apr 2018 09:31:08 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	v57-v6sm6752552qtj.47.2018.04.30.09.31.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Apr 2018 09:31:07 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 30 Apr 2018 13:31:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2018 13:30:53 -0300
Message-Id: <20180430163053.7143-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180430163053.7143-1-otavio@ossystems.com.br>
References: <20180430163053.7143-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 30 Apr 2018 16:31:08 -0000

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


