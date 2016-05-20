Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id CA2A760248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 09:01:12 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id n11so33180085lbh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=PZzp0wPlPRZ6ResiYcK/JHKd+dj8L4TUpkFgXjXuTgk=;
	b=ECTSJZ+/Jae55geGqMc2BswN3zHuR960Ugx+6ZNBP+s7K6tD03KXKz1Ba+UPtx+62W
	ZDD6xtNHePKFvl8w4VrZVyKCIHSiyPwGxGseOCockJ3krGDFB1YfKb5qS4nFLgy5/I+h
	4fNRZfraMlZaZAbPQurALhEElBjAWHxTxtB3TvrRQVS3Mt5mOw2cRe3759IWDVMzs4bP
	kcbNkCbEA4k9dERQSv70a9QNlqAcI5DXQxur9NmIO3E3rQR7xbAt3l8h4dAEE2Ngqv1n
	nCDpY2nttKHosVhy4oEXer06UMGq/RrqPqtInTv/fawZ1NYBLR71iyRcitwsnQA8WLhL
	Anag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PZzp0wPlPRZ6ResiYcK/JHKd+dj8L4TUpkFgXjXuTgk=;
	b=CgunI3JQwUNStQOXJdVq57sRoUgJ2jWoxas1nvxqOEeKrPXvkhOoHsM3nANENVHWzj
	mZbCy7qmasj2SMNgYOIekpEle+33wSjFyfi/MgYND0oc/+YAWyrPMT/OJRFC98qMh3hC
	QtyJ7Q7lb6ZzmVL7ZQChuQltwu0PjIEOw/2q46+KhG6IOIQr3Xxk76qDiA0LnTSugn1m
	8y9cGqa+pXNG6Q7wtIoA5/xUDz+Yap6/M9fNZNUJfKQMiaiHRNvq+BxiKXPyV77E3uyy
	CJ02TmkGQMOxuH2vZwqd4yqd+pYYkRd/vNizqohJWL4SEXxzcFL9bwCEl+mA5QfanOOF
	Ov2Q==
X-Gm-Message-State: AOPr4FXuuhVcLe6zOEtKVO3+u8Z8Cjg4WeyrboqLC9XBwJcGs+BH547mYR4FITOIaWXytg==
X-Received: by 10.112.209.99 with SMTP id ml3mr643630lbc.26.1463734872094;
	Fri, 20 May 2016 02:01:12 -0700 (PDT)
Received: from localhost (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	jc7sm3038227lbc.22.2016.05.20.02.01.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 May 2016 02:01:11 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 11:01:01 +0200
Message-Id: <1463734861-23862-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 2.8.1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
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
X-List-Received-Date: Fri, 20 May 2016 09:01:13 -0000

In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
for images using opkg, which included openssl was fixed.

However, that broke the generation of the opkg-based images, that lacks
openssl. The error is a python stack trace, showing that shutil.copytree
tries to copy a non-existing directory.

This relates to [YOCTO #9040].

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/lib/oe/rootfs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f5c465f..7087b12 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -116,6 +116,8 @@ class Rootfs(object):
 
         bb.note("  Copying back package database...")
         for dir in dirs:
+            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
+                continue
             bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
             shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
 
-- 
2.8.1


