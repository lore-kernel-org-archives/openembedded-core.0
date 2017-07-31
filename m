Return-Path: <net147@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6417846C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:52:38 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id y129so136752517pgy.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3TBJx8V+GcFEbOXhrcmOgablnUnow0TM7phOj0QA4ro=;
	b=M4+6a1xcub2vh3J60BXn9+ObsQ3qLeWlvtt2SE6AxA9rRmuPgpT4iAPvd8FHyE9lKU
	MVG41kcOSvz3t8BW43IbEekm2l9RiRNzxl3shHW8VpR+pW3GwO5GsR5Aq/lr4t8M5NWZ
	ZuME4dCt8oFDd/OSSf4q35f0oqgHgJYT/wnGaNPGNm6x4nMHbn7nKASp69SmVXFsSYh9
	a8joVgNaK0oIlibURv+y8725k6W+YHPx7zpfyV/k99rH6+AIysCGUS5Pccx1BuQjhftn
	IhVVYIPzIJJ+61btEUbsnn4KLqPBc/Gw9LAP6z9mgLSnKKH/grpKKZSChljDtrJYmvih
	XNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3TBJx8V+GcFEbOXhrcmOgablnUnow0TM7phOj0QA4ro=;
	b=fn3Q5zNGlEjS6NBb7X69V5DaSuAJ87hyQW35OhJ4dnNRF6we9lOeKq0HdoZMEzrg3D
	uwtDcRr8oBhrMdtz4hJKq3vXM3x2OOv2u6X1I76ThWzWrQIu9L+C4SHjL50c8tAOPGV5
	xA3DEjGyk8a2zbxZEuzQFP6SIrL4b+Cwg4jBGLYpG6hwDaTQa6EzqVbtmZocyZpSf3ur
	SgjFLgRmxKZOVXXZOWB/iVHL5Vf3I5WKwjrQiKtpRZsD8YQyGsxnjhpwr1LSl8RkOGlZ
	+ginWQF3De0ET/AYDyN+p2yMydXBdevAqLJP5wZDsV7w4gM61zpFRAhUaunuAj/NXTdQ
	mNMA==
X-Gm-Message-State: AIVw112+RBUFg3THGpI/l3ajsQ0vABp1h/9c8Om8vDJQITsE8IARP4xu
	JgIp3M20lftiPg==
X-Received: by 10.98.1.20 with SMTP id 20mr14892411pfb.246.1501498359689;
	Mon, 31 Jul 2017 03:52:39 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	r13sm8030233pfg.14.2017.07.31.03.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 31 Jul 2017 03:52:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 20:53:39 +1000
Message-Id: <20170731105339.13446-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] wic: improve generating disk system identifier
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
X-List-Received-Date: Mon, 31 Jul 2017 10:52:38 -0000

This should reduce the chance of generating 0xffffffff as the disk
system identifier.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 51bdd3a984..5765bbb527 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -26,6 +26,7 @@
 
 import logging
 import os
+import random
 import shutil
 import tempfile
 import uuid
@@ -303,7 +304,7 @@ class PartitionedImage():
                           # all partitions (in bytes)
         self.ptable_format = ptable_format  # Partition table format
         # Disk system identifier
-        self.identifier = int.from_bytes(os.urandom(4), 'little') or 0xffffffff
+        self.identifier = random.SystemRandom().randint(1, 0xffffffff)
 
         self.partitions = partitions
         self.partimages = []
-- 
2.13.2


