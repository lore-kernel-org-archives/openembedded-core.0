Return-Path: <net147@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0304784B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:18:54 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 125so10301104pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1G/Yax9XGFy74fpLwNll7o4FaHGoQ1wdEYspnXi8724=;
	b=bJuU/TL7oR6WwVozZj6ivBeqRcQinHtjnX6jqwhohwqBoLfvEQ35x/plWMUHcPqOHK
	R7x8lmcWj21flB4n3TYxdzGy1wzPfIlMHyL/gPWJy4cW63JEnP6IPRSkF58Ymu12nT6t
	bo0hCl6y0O1G2jJ1Hfe6fKji/MNLkWPwVsErDaP6qIIW1D8SwXiQrZadtwvcdP/vM/6J
	dAAVaYDlHDOb93zvCbkW2PIcwaiO1MU78TaRoWKOhXWrer1CnXaH2YsmbaL8hrfl07Vi
	rTt1h31rPB7cki++tK+soQbzHQxcCUMJNaUXo/ImPnrWlALFedOZK4bVZFVbRQtoCDtG
	DzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1G/Yax9XGFy74fpLwNll7o4FaHGoQ1wdEYspnXi8724=;
	b=dKyh51YA1ACmrk6lhONILR74svCPUnWMn57AoyQmgCVd7WlcG5OCKIGJng/OElkr43
	q1jEYMFpDfmKR8hGadAPjeZkpc8Ca9cU8PmIeCdlWezJF+QejbuI8U3VqIJEyXBGu8om
	DK60HP72E7nZw+LEviiB03HxE1eCk84zdMC1f+bla3dNLQzR8d6hnUXRgi1XGW9hEHP2
	lDP/Eeiptcxj3J/9KNjJOmYq1eJFSbEOj/KmEfnkOoUDK9xFAdCaQYPU+T0522WQv4HH
	LfhDPNC9sOHryZ1z8aq/O0UwuRMfkLxwjaqWkR4kO5ERpb3NmwprTi1xNspu/h/xHYNz
	qNYQ==
X-Gm-Message-State: AIVw110YG9o67XWYvKnI9mpWjuEJelqGpH6tmKlzEBj6hW/U8UgcjDWz
	a2U7fArj2wwOfw==
X-Received: by 10.84.132.110 with SMTP id 101mr8416254ple.203.1501251536262;
	Fri, 28 Jul 2017 07:18:56 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	p123sm39603183pfb.177.2017.07.28.07.18.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 07:18:55 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 00:20:01 +1000
Message-Id: <20170728142001.23590-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH v2] wic: ensure generated disk system identifier is non-zero
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
X-List-Received-Date: Fri, 28 Jul 2017 14:18:54 -0000

Zero may be interpreted as no FAT serial number or no MBR signature.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f20d8433f1..fe9b688ab0 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -297,7 +297,7 @@ class PartitionedImage():
                           # all partitions (in bytes)
         self.ptable_format = ptable_format  # Partition table format
         # Disk system identifier
-        self.identifier = int.from_bytes(os.urandom(4), 'little')
+        self.identifier = int.from_bytes(os.urandom(4), 'little') or 0xffffffff
 
         self.partitions = partitions
         self.partimages = []
-- 
2.13.2


