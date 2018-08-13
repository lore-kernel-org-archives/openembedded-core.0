Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A54DB78F4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 17:20:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t25-v6so9581623wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=KYofho2ZQUbFeJJuHI7t/vCnFmL2ROvPindU0czAs9I=;
	b=O+5+n98IXoWtUlkvdwF7akLPKqKWnOT90lRJUDM77QHm1FFEoWu9QuqjXmpsx2MCj6
	ZJvfOuLkQm96bbH93Kc9g7OTh/P8TMQ1lknrRoxKbRiW0Zr0nbCn6eVd/fq6X/NGzleW
	Z4wfi8ummzb3dweXWhIEbJPBIeBphg+raZ1XHH0v9T0epWI5nMMMzScbLBUiVfG0HvRm
	Hf8IHUgYZlASULFCeykeT39gRo3FQRRDqXmcNIiV9idzMaDYp9MLB/jgR6slPMotwGHV
	apF7CSpr52Ob/mzVsr+kk4d5nsi4aMIxV2lPinuhYBU5Y8lZT0iQNXaxpL6ZwidrDKqp
	chVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KYofho2ZQUbFeJJuHI7t/vCnFmL2ROvPindU0czAs9I=;
	b=RvCFC/XS0hXJlAYzMM328bDPLMxtIMSw6DJy3Af3ZvBlNByTLO8Vw+fD0ge34RX9PO
	2OM30uveiTpX2LrZ5L3M1Q4aieGe8gM9Kv7CRK1Z3ON8Y28f1GByG56K/O7c9Eo8jvlb
	OGyRcUmh3KRup/KwPgXks8pua9OhlFFtRPgMe4z7MlkT4nWZRk9pR++RLIZ6PjCdqiUn
	NJap85vW4VUma3JC4kZkbNJEeMlBHT1RuMBAoNVNlu76S/HKoRlU9e7FtN4Obb+vpEgz
	AKSnna/dKntSDPtLATY/DPmZJOos64VVhlhTCa5NziD29LiHm+hkHsC5ylvt9dTfLluq
	3i2g==
X-Gm-Message-State: AOUpUlGDVqOgFMccPnWMzntEtgCIeo1mW3G9ekzthVrbsSCVBywWAOEk
	nMaB5/yx/Qd30EFWTF0aQ/zs79Q3qPM=
X-Google-Smtp-Source: AA+uWPxuWCNAn8i98Ff2gT3DFsllvmO/ezbPbRC40pOD6A3Kd+UwkZ0Fwr6SHzAF6llrplDRbyiAqw==
X-Received: by 2002:a1c:f306:: with SMTP id
	q6-v6mr8488236wmq.111.1534180859940; 
	Mon, 13 Aug 2018 10:20:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm16598921wmd.32.2018.08.13.10.20.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 10:20:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 18:20:52 +0100
Message-Id: <20180813172054.17767-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] utils/md5_file: don't iterate line-by-line
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
X-List-Received-Date: Mon, 13 Aug 2018 17:21:00 -0000

Opening a file in binary mode and iterating it seems like the simple solution
but will still break on newlines, which for binary files isn't really useful as
the size of the chunks could be huge or tiny.

Instead, let's be a bit more clever: we'll be MD5ing lots of files, but we don't
want to fill up memory: use mmap() to open the file and read the file in 8k
blocks.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/utils.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 9903183213b..b20cdabcf01 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -524,12 +524,17 @@ def md5_file(filename):
     """
     Return the hex string representation of the MD5 checksum of filename.
     """
-    import hashlib
-    m = hashlib.md5()
+    import hashlib, mmap
 
     with open(filename, "rb") as f:
-        for line in f:
-            m.update(line)
+        m = hashlib.md5()
+        try:
+            with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as mm:
+                for chunk in iter(lambda: mm.read(8192), b''):
+                    m.update(chunk)
+        except ValueError:
+            # You can't mmap() an empty file so silence this exception
+            pass
     return m.hexdigest()
 
 def sha256_file(filename):
-- 
2.11.0


