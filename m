Return-Path: <dogukan.ergun@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D50360670
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 13:36:05 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p17so14139821wre.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=D3IoWP0C7hJ891A8CmRKekMZYs+FqmgkVzLyEh5By2Y=;
	b=pIWMORxsT4ji4VfXVwhYRXLTEk3iHiGR97xbGBWsxZfZSkqpNQ9cEwBXzZ7EBxNUbM
	iW97DNRPO9EKcNNsm0mcSxwIVOHFP5kgVr47JXaqX+zgnwElH/d9wDJv+zlxSh+nrJbc
	QSCkbNWlJkMyu9gLk6fXKuf90o86csZrIjd8hIlH1A01KLbzJP3AvuRUqheuJvgX7dmj
	SePYIYC7eZ+8eA8fh98pIqO5vZQ3RxP9EIbCylqJJ9sFxFthRW2BHNohe5+TFhT73ulh
	ljWE8fCwPFpzwxkNi3b3fJSwT0M4/sXFXMYm7NICXMCa7/CWSNE4bR0S3DNxgwDUCyVd
	JRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D3IoWP0C7hJ891A8CmRKekMZYs+FqmgkVzLyEh5By2Y=;
	b=M+R+jg3p0Y05zeaHtkfDxpB2cJfm9Xjn4Gzqp9sP4UTdcejyo9QTQ7CV/4v1ruuLEp
	pkvreize0OKZ9k7tVtM5KS+Zs80bxKIYML78TtFSrMiL0OVan5TDR7j8y0U8Y8vV6zuz
	uP/LmKQOcuJyu4D2no3i2LHDlDYL0VgEsxN67MaETqGT0kDfJZpmJSXlfLEjv6BIIc5q
	e1VQ+UAJND6gHNJwfkesh20CPo+n5DcRT3bRu1y/NnH2zIfQtXAAfjGxNWF/W8VHkE5z
	QZBMgZtBJOnH4CAt2N4OqdRbMfAfpPtje46HcYNqCkiT4vOo6dX94ZjmO+wFiS2cFwzc
	nMBQ==
X-Gm-Message-State: AKGB3mLUG1PsWDuHF91HUuXgvlXiKXjD2b9paSbkN3vPN8GWzVP0UeJU
	2x7f38xL08JocoApJ5IiwMd3ac1C
X-Google-Smtp-Source: ACJfBoukHH0KUK8iztEy5pv7R6D74JFgYz8HzFa66GslSlgDDhdWQPjgF0qTyxkZLj6UUX/lvHoG3Q==
X-Received: by 10.223.129.66 with SMTP id 60mr14585108wrm.88.1515504965768;
	Tue, 09 Jan 2018 05:36:05 -0800 (PST)
Received: from localhost.localdomain ([81.214.38.25])
	by smtp.gmail.com with ESMTPSA id
	c53sm28569690wrg.10.2018.01.09.05.36.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 05:36:05 -0800 (PST)
From: Dogukan Ergun <dogukan.ergun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jan 2018 16:35:24 +0300
Message-Id: <1515504924-28160-1-git-send-email-dogukan.ergun@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] wic: if we can't get from ioctl, try from os.stat()
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
X-List-Received-Date: Tue, 09 Jan 2018 13:36:05 -0000

Under some conditions, ioctl FIGETBSZ can't return real value.
We can try to use fallback via os.stat() to get block size.

Source of patch:
https://github.com/intel/bmap-tools/commit/17365f4fe9089df7ee9800a2a0ced177ec4798a4

Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
---
 scripts/lib/wic/filemap.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 77e32b9..a72fa09 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -37,7 +37,15 @@ def get_block_size(file_obj):
     # Get the block size of the host file-system for the image file by calling
     # the FIGETBSZ ioctl (number 2).
     binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
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


