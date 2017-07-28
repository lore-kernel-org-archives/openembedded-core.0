Return-Path: <net147@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A04278430
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:18:16 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v190so23765188pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1G/Yax9XGFy74fpLwNll7o4FaHGoQ1wdEYspnXi8724=;
	b=I7KfpJzxy1xna5ZIjMm/aoZWOp4S4VaPGqZ0yYuStWaH0DSaQ3rsLF22JT/ZjNrz0d
	GcYdCDCIUISLB0Tk2Nlgm/C1Fi+2SSoYtolgMiTDXJSMnaUAzcZOCDd+4HWhfoYy1HwC
	gexkp6R/WaI/zxi/CAaJ00HMEHt/8LH4G6zGftvbPFdjhmw3JPc0HzfHwEbAPR6lySiv
	VbHcIKAgPTTOr3gvEJmSAr30cv381OWppPbPdbZFdJKVdY0gfvKmX/6A/i6neXi4M6rr
	Lp+Itt8c3GkxeKM0ddHYwZ8QWmT23LRnQ0qRE3xBNsQz0QSR0wcJqJ356EZs30G7eW6v
	p4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1G/Yax9XGFy74fpLwNll7o4FaHGoQ1wdEYspnXi8724=;
	b=dyNoP6RSuWawqa2pFjGM8qvkrc3q97XShrOp4qNy8fZy6l/0WEzQZjWqodMSQIrShZ
	GcQhxkL/uEttRJv0xUw0FdsJk88x76oPOoOfklY8CvtfBEdKJg7TQmW7aI66lSOAnMlR
	L6RYSszaVfN9/gu8qYlJIObkyblVo0yJ7lNpgF+IdNjC82zfdHkgYyTdEHGRfBiuS1ax
	uDxPlARxIb/zAtAXv0TSNzFwKrhrS2+Y43rX+jXli/Wcw+RC010HozU40f9+5bobn50Y
	U0qggdxpZIITapjlpw35SyoIl4XER0lqgPTRxLwK2EpcFZIpv7JNatw+c7Kf4G6dta6X
	h1lg==
X-Gm-Message-State: AIVw110G8+oJkdOImuMmdNxLlzfzYxeMYlGwyj4ANvuujH2uYUnwXrTc
	msWDlpv/ytxhBg==
X-Received: by 10.98.60.220 with SMTP id b89mr7724996pfk.170.1501251498239;
	Fri, 28 Jul 2017 07:18:18 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	d24sm42849925pfk.43.2017.07.28.07.18.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 07:18:17 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 00:18:58 +1000
Message-Id: <20170728141858.23506-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] wic: ensure genearted disk system identifier is non-zero
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
X-List-Received-Date: Fri, 28 Jul 2017 14:18:17 -0000

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


