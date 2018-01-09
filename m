Return-Path: <dogukan.ergun@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0D0787DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 12:40:52 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p6so13966668wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 04:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eEyeGOWyc2dX2ptB7lxoPPoKO36k/0568ZYV0vYE5u4=;
	b=VNmvVhzF3qCbRf6eecuMrQGYdpWkDGBygVt/I6ornCd37NEP0tbjXpe98C2dMKh0x9
	7cff44IWb5VRJXRHzyiP4GxKva8C3/FrguXIY/YA/4nIV51LhYehATQPq1P/bqFW2x9u
	+rJzM23EXfLW5Y8B+neUHYsidh/GzCjD7U8jzpFV5qRo1Eno2vsWnnh+A3jctRBgRIM9
	Wexy4u2gnRjmzl91g2mzuek8FbfOdh6rvS9iRjjjVJrKVONrgvmAaKDi0808/wRzhtyX
	nFJWWIpc7fIiy9fs/y0qmKin7ANoO5k0WyaGOLLRJhkgkl+UJpiZDPMw+x/u9iACmvm0
	aUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eEyeGOWyc2dX2ptB7lxoPPoKO36k/0568ZYV0vYE5u4=;
	b=dDiqjtWIZWzYbItIThX6C8BExOWmJpLH2J0pj5cot1vAseQnmlLjSCvGpjP6lscw5t
	ookvno1tf8CApDbO0H/Gy55yEZSsBSwUf7Ih2Fdf80lZMN9XqIC80jF5Tz6ony5xzdP0
	to0wbKv76V0UWvmGloZ5h3kVKKZalO9aPSPnxzBkvT9/ccNVhGmzvKbU11G8/OiDQhmw
	wmFTPvHEpiWoTBhDRmp2EDQWUss9Nu/ie5XtBLQuFkYJPdJ45c9/+bd6AU+pdN0bS72Q
	xmJrm/o2BJymztqkwmSBroMz9MgLl7Xun0+8bO4KqCqTqkmzedzQK8kEV/hSU6c2VqcX
	y/iQ==
X-Gm-Message-State: AKGB3mIF9Spxeuz0nQgXji9ZpZWrz9/m0RD/hA89OPnbxiJ0sCOqIO6C
	oGIN3ZjjfkqIM4AZ+7SrPxyC3wZS
X-Google-Smtp-Source: ACJfBov5qzTgtnXSWDiJby0zWE2hUZteZuKrRQeEQQfqpTIqBlz5m+ITzO5ADfBDn6RJexteNfvK9g==
X-Received: by 10.223.198.1 with SMTP id n1mr11961178wrg.153.1515501653519;
	Tue, 09 Jan 2018 04:40:53 -0800 (PST)
Received: from localhost.localdomain ([81.214.38.25])
	by smtp.gmail.com with ESMTPSA id
	q13sm9366314wrg.68.2018.01.09.04.40.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 04:40:52 -0800 (PST)
From: Dogukan Ergun <dogukan.ergun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jan 2018 15:40:21 +0300
Message-Id: <1515501621-13380-1-git-send-email-dogukan.ergun@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: if we can't get from ioctl, try from os.stat()
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
X-List-Received-Date: Tue, 09 Jan 2018 12:40:53 -0000

Under some conditions, ioctl FIGETBSZ can't return real value.
We can try to use fallback via os.stat() to get block size.

Source of the patch: https://github.com/intel/bmap-tools/commit/17365f4fe9089df7ee9800a2a0ced177ec4798a4#diff-7c3551da8e9821c1b4ea133c74968c0f

Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
---
 scripts/lib/wic/filemap.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 1f1aacc..46ced79 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -41,7 +41,15 @@ def get_block_size(file_obj):
     # Get the block size of the host file-system for the image file by calling
     # the FIGETBSZ ioctl (number 2).
     binary_data = ioctl(file_obj, 2, struct.pack('I', 0))
-    return struct.unpack('I', binary_data)[0]
+    bsize = struct.unpack('I', binary_data)[0]
+    if not bsize:
+        import os
+        stat = os.fstat(file_obj.fileno())
+        if hasattr(stat, 'st_blksize'):
+            bsize = stat.st_blksize
+        else:
+            raise IOError("Unable to determine block size")
+    return bsize
 
 class ErrorNotSupp(Exception):
     """
-- 
2.7.4


