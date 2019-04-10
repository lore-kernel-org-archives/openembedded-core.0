Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B9DC37D925
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h4so2877074wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=936Vz3zbrcn0BnOLj4I6dW5O+qt8/8XPllhLqAxdpNA=;
	b=t1zehSc56AHHDQOv18Alf/m+i28wnn5X9nCsTIrvQBcdCp2f5X0EOqOxI+yRWJiMXE
	jWYn0iyMuVpTPCNbGvrr0RiTa/+boCBaZuonb9DCrr0M9x1pT6xaLy1+5mZADylft61k
	Uqgiu/tpFZnZ9vxd0ZU1FPpjfmsqE3vxiA33kiiLyGXWuZC6WYcJth2ieus6p5GfVN1Z
	2Wd24n2WCR1rNsgejrFWTaEy0FIhU/wt1WbPl6TRQvAzfIkPhYyGp97X5oGTamR+VPg7
	+SJaAhI5BBQ3T+47EFvkMt5OZNrSwWEAtGls42wuD437+9kLIbimEwdQZ78OOWTmZdFm
	KeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=936Vz3zbrcn0BnOLj4I6dW5O+qt8/8XPllhLqAxdpNA=;
	b=CSaBLaIejYA5gX1gpWubZ6ocL9MUgVwRB237g7UcZlBQiUtseKp+hw0KdF+t5Jts0C
	6g1A0MX4IIZCIcwprz18sV/5buGyav+gs/N4xRy468l+oQRCVCE7D8W5x94XbkNjcvDD
	k9IvZgMIjVFxZ50uhL2FyllHDU350itLm2YM/XYRGjFQm5UJMnPdHV46g71i7g2t2ml2
	ZloAh2YjfaiYekisft4bGspcOlw2IueZrlarKQyf67Ox63x2g9EdPRXg+mC8c6kwqg5U
	5VtaGBj8Dw931/kzfI2Mea03p+iCvCClOpL1LI+8HuHSkcVaJxCLVpE/uN8kdYS9l221
	BwZg==
X-Gm-Message-State: APjAAAV5/Pskx87LKnkTLS37NPDgb+L6ng0Ey1KPXpjPC0EK5iaOwnWa
	9VYBiV/HkAr5iYn39rAwczaMPDhv45U=
X-Google-Smtp-Source: APXvYqxYbBs+DMkr/Lx6GieRDS9DLOqDVnBu0SowPKRvyG06i17mIaPBUCQDI547aesaST8GbkTThQ==
X-Received: by 2002:a5d:6101:: with SMTP id v1mr5963597wrt.222.1554901954193; 
	Wed, 10 Apr 2019 06:12:34 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:47 +0530
Message-Id: <7b1dba1a464862e35295756ecf52b24d0962528b.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 28/33] wic: use explicit errno import
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:34 -0000

From: Ross Burton <ross.burton@intel.com>

os.errno doesn't work in Python 3.7 and shouldn't have ever worked, so use
import errno explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 scripts/lib/wic/filemap.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index a72fa09..abbf958 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -22,6 +22,7 @@ and returns an instance of the class.
 #   * Too many instance attributes (R0902)
 # pylint: disable=R0902
 
+import errno
 import os
 import struct
 import array
@@ -189,9 +190,9 @@ def _lseek(file_obj, offset, whence):
     except OSError as err:
         # The 'lseek' system call returns the ENXIO if there is no data or
         # hole starting from the specified offset.
-        if err.errno == os.errno.ENXIO:
+        if err.errno == errno.ENXIO:
             return -1
-        elif err.errno == os.errno.EINVAL:
+        elif err.errno == errno.EINVAL:
             raise ErrorNotSupp("the kernel or file-system does not support "
                                "\"SEEK_HOLE\" and \"SEEK_DATA\"")
         else:
@@ -394,12 +395,12 @@ class FilemapFiemap(_FilemapBase):
         except IOError as err:
             # Note, the FIEMAP ioctl is supported by the Linux kernel starting
             # from version 2.6.28 (year 2008).
-            if err.errno == os.errno.EOPNOTSUPP:
+            if err.errno == errno.EOPNOTSUPP:
                 errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
                          "by the file-system"
                 self._log.debug(errstr)
                 raise ErrorNotSupp(errstr)
-            if err.errno == os.errno.ENOTTY:
+            if err.errno == errno.ENOTTY:
                 errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
                          "by the kernel"
                 self._log.debug(errstr)
-- 
2.7.4


