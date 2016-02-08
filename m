Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0D560043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 20:36:44 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so33185910wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 12:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=x+I4i2Q4ZYHsYNDSTEoF8zFAhNG2yIMPNoV3sQvMjCY=;
	b=EDV0kN9UOXDq+CLlkITBp7J1rkrn1mtc8aQT+M7vppldqRJNQNxeV61dPy8Pv7vs9l
	qWCODOi4aWVIUj2wRwIjkWOZUcY3/V+PfDr/tC0n1XxjD9VRd5KAeAHuyfXI3U0ce3GP
	yv0HF4G5LD0/h613B5vYgo0y7KbvB2aXKFFItI/STuAGJcWaODhsLWtMA8sIpg12Ktrt
	EC1pnzmZU9MrTsxBkZGxe01WnhnSHAno6mghJLmt58py5jMoJ2XoLnw/XAnxs5mKvJ/W
	Eyu9sMYvEESQINhiswKrIIe1Db4EiXbTICNWtVDATZhjWBEm+OtxJLlPB32R71zzP+wf
	QnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=x+I4i2Q4ZYHsYNDSTEoF8zFAhNG2yIMPNoV3sQvMjCY=;
	b=YrKsbU5nBh4F9SKpubJEcDGMVg1mAKJYTgPxiGBu0wgtAa+zYvvTqXcgMCQZz2BJfZ
	2F/9Qq7UCxMQUomfA3IrJG/s4w3NUXSn1KTugJ0Na/O5fIY5HXDQau+2YtftVvwrj4kD
	p8nVJL1MSLyS13Cv68KTxkeTcqw+8pBkQni8jY7BekYfIzDy6fPsTUBeL8SjyTlnV6cB
	AkhdhwHJVsvRAtE4svyK0sSzsfN6st5sk9jmn4a/xDR8wvYevm9BJUK7YNEXMWPdDWug
	NLu1KfYkuEr81aYg2oLyF3r0pqZ38odN0CZM8+vPoK31jYp1sCaTEuMxVuZNPzbvvQmq
	Kvfg==
X-Gm-Message-State: AG10YORXEJg6zsBzaQ5nSdFZntxrDYceLDSLdEFD07jV/vl0+oVtEuS57UT2mwoyL83MRnY9
X-Received: by 10.194.112.41 with SMTP id in9mr29657688wjb.139.1454963805421; 
	Mon, 08 Feb 2016 12:36:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ka4sm31423049wjc.47.2016.02.08.12.36.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 12:36:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 20:36:43 +0000
Message-Id: <1454963803-23136-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] lib/oe/qa: check that a path is a file before opening it
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
X-List-Received-Date: Mon, 08 Feb 2016 20:36:45 -0000

Check that a filename points to a normal file before attempting to open it, as
if the file turns out to be something more exotic like a FIFO it could hang
forever.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/qa.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index d5cdaa0..4cb5b98 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -31,6 +31,10 @@ class ELFFile:
         self.objdump_output = {}
 
     def open(self):
+        import os.path
+        if not os.path.isfile(self.name):
+            raise Exception("File is not a normal file")
+
         self.file = file(self.name, "r")
         self.data = self.file.read(ELFFile.EI_NIDENT+4)
 
-- 
2.7.0


