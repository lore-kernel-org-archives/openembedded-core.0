Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 965077D937
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h4so2877014wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PujP3+FiicRftPPezkQbQ9hC6txJV2+RFOhiE2CwdI4=;
	b=twZwtmJQIU+Shx5Ezgu4tJL/G2ftS+Mo78naUG/gpnoISoLYcNhOCVZA5TnJ2tvblE
	bHhrDIzNMZm27ahZgCQKxsSTT9+50tHBg7upnmHFKS6UtPG3vbnFJ661RdM+kswn4UtS
	GXlVmYuyAKIi8eChRUxiB+2yAtnrwEO1f2DbCsqdo+TWnm0ktcfKzgqzFIC0yBM3MyKx
	Rkkc6VlodLlmfg7OEflkLQg2D3iQqiGvAuorzKqmCVXkNIyahDa9TJ/AdqC3CMRkN4H+
	9LoE8cJJx1hb5gEeGFC6NWjQTv4AXjX/eMTc+x68RJxvrMMIMthhAwNyLs6+wz7nPGuu
	i9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PujP3+FiicRftPPezkQbQ9hC6txJV2+RFOhiE2CwdI4=;
	b=U+xBUw78WJ+PhRSQ31QqLnWvTU5zys7TIZZsPU2hsmkIAJ9Gu+DvYiYyi7xjiptAC7
	USr6EiR+hzuck92ddimKP6b87/OT9sEK2C4cfBewucmOzoKT8mAfWUX5MYs/kFE3QAOi
	SX3spmJusKvMTHy0cAL+8zOm56HTn+BdYMRGzCViMhMrtVtgEHiHJDbw92WDap322lQ5
	dRrFZ/akVWi3GrkZz9j3SEaealZ6kBwrkisLsIqAjajoPZ0GgSgrE+aqQxyOnKKbp26+
	eSI12w6V/b9WDXIu52qO4WDBCuWEtPjHZXFst/Q8kinbU1K/qr8dBVKFdbxz4qRc3YzP
	wr/g==
X-Gm-Message-State: APjAAAWcYuCUwFPzlOt9ZYgQOoinekZEZpHRD4tJExIaox1KlpENPCt+
	+PJYVDXqaZlJUlxJLEDljCprrDYdFQI=
X-Google-Smtp-Source: APXvYqy9zf7UOHZLAWq616F4olSmwjQ5AEyn6mRs5DHQVpeWJiejRH6IKWKYGcqgPKEd3ksX5bacBw==
X-Received: by 2002:adf:fc51:: with SMTP id e17mr27966287wrs.243.1554901953282;
	Wed, 10 Apr 2019 06:12:33 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:46 +0530
Message-Id: <68f56a4967d3121940669ca9116e759081b0b73b.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 27/33] wic/engine: Fix missing parted autobuilder failures
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:33 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

OE-Core rev: a88bcbae850a2e6d182291d3f8e167aabdbe4842 broke the ability
to find parted as it may be in sbin which is not in PATH for some users
on some distros.

Iterate on the original patch to fix this and also fix the original problem.

(From OE-Core rev: af3803e5189d7814f9dbd238fb6dab200f351e1a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index c127045..7e6519e 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -244,15 +244,17 @@ class Disk:
         self._psector_size = None
         self._ptable_format = None
 
+        # find parted
         # read paths from $PATH environment variable
         # if it fails, use hardcoded paths
+        pathlist = "/bin:/usr/bin:/usr/sbin:/sbin/"
         try:
-            self.paths = os.environ['PATH']
+            self.paths = os.environ['PATH'] + ":" + pathlist
         except KeyError:
-            self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
+            self.paths = pathlist
 
         if native_sysroot:
-            for path in self.paths.split(':'):
+            for path in pathlist.split(':'):
                 self.paths = "%s%s:%s" % (native_sysroot, path, self.paths)
 
         self.parted = find_executable("parted", self.paths)
-- 
2.7.4


