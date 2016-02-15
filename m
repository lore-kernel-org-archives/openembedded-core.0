Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D261C60017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 17:50:35 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b205so77466470wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 09:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=t09UE26G76GC2cLUBKYKpYoCJYBuNPtXw3bLVwO4hpg=;
	b=yr5wj1kiBwdadvHx4OIiAHvIi6vhDYMFnhYMGYAkXHwMUIk36S79hKn24dl7Jv8CcT
	LjIFSJBn1M4xU/FYlRQPTgVsd119IGnauuZTSMcN13bc19QZYwA9jNO/fVczZHduemsg
	sjjA0vmJA/8SZPxWAWn3moFlayl6TrkDIjS3WfNgJFLqscO+FPSUJ6NG6ChpIC8Pv/H5
	IyCOVbtD9ELwEhqO6oUeVOHcOMRF7qn3QMdCMCJ5IjVQyKDuZ2OheRycQAylvsaSmow5
	rlHktByN7cPdynGLnH8uaE9gdwPwv40v2WT+/tkcCyG7bd830KPnHapGeBzaIY/4kem/
	zjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t09UE26G76GC2cLUBKYKpYoCJYBuNPtXw3bLVwO4hpg=;
	b=bth0nB+emhTENzBQM7DtFQRZa40IuENb2foQCjxGg2Lwmvko3wivIZ7aVSMnRsSCQB
	b7KhHFTkgrF3qaNQE8WWClTET8clkjmy9PEa+0W1A98lNaNOQC9yFdo3R2NcDv13XPMm
	bLQRhxBUzw1Gc+gEi+WJfEvVEFItnq9vLBDirhKaejCTbDzVm4XzeXz/V2ivwxvbgPvx
	wLIg+qupFw9q3vkbiHvy38ztVDbIbM1nKwX9/76ngOnqL3XoPRC9MMY1k8kvMS/Iksd1
	8Ai4Wd6DsXfvTMnrSzDSloHDc/4c1NVAHoI9dLzg3S39rzmedN2X+8Yjh9qfd3KfTs7D
	/FWQ==
X-Gm-Message-State: AG10YORljufqbLYaeQCuyUMYkakPISAUIe0TJAf3v3fGME9eTZsbRbfCZJfII7u/Vk0UtHsV
X-Received: by 10.28.23.75 with SMTP id 72mr14674387wmx.50.1455558635287;
	Mon, 15 Feb 2016 09:50:35 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	xx3sm26403941wjc.32.2016.02.15.09.50.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 09:50:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 17:50:32 +0000
Message-Id: <1455558632-1397-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] lib/qa.py: raise ValueError if file isn't an ELF
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
X-List-Received-Date: Mon, 15 Feb 2016 17:50:36 -0000

Instead of raising a generic Exception that can't be handled specifically, raise
a ValueError.  Also update the callers so any unexpected exceptions are not
ignored.

Also, rename isBigEngian() to isBigEndian().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass    |  2 +-
 meta/classes/uninative.bbclass |  2 +-
 meta/lib/oe/qa.py              | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 530e711..a76f8dd 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -792,7 +792,7 @@ def package_qa_walk(warnfuncs, errorfuncs, skip, package, d):
             elf = oe.qa.ELFFile(path)
             try:
                 elf.open()
-            except:
+            except ValueError:
                 elf = None
             for func in warnfuncs:
                 func(path, package, d, elf, warnings)
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 0448cf6..b14cec0 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -80,7 +80,7 @@ python uninative_changeinterp () {
             elf = oe.qa.ELFFile(f)
             try:
                 elf.open()
-            except:
+            except ValueError:
                 continue
 
             #bb.warn("patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f))
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 21fb997..2ad6c63 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -23,7 +23,7 @@ class ELFFile:
     def my_assert(self, expectation, result):
         if not expectation == result:
             #print "'%x','%x' %s" % (ord(expectation), ord(result), self.name)
-            raise Exception("This does not work as expected")
+            raise ValueError("%s is not an ELF" % self.name)
 
     def __init__(self, name, bits = 0):
         self.name = name
@@ -32,7 +32,7 @@ class ELFFile:
 
     def open(self):
         if not os.path.isfile(self.name):
-            raise Exception("File is not a normal file")
+            raise ValueError("%s is not a normal file" % self.name)
 
         self.file = file(self.name, "r")
         self.data = self.file.read(ELFFile.EI_NIDENT+4)
@@ -49,24 +49,24 @@ class ELFFile:
                 self.bits = 64
             else:
                 # Not 32-bit or 64.. lets assert
-                raise Exception("ELF but not 32 or 64 bit.")
+                raise ValueError("ELF but not 32 or 64 bit.")
         elif self.bits == 32:
             self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS32))
         elif self.bits == 64:
             self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS64))
         else:
-            raise Exception("Must specify unknown, 32 or 64 bit size.")
+            raise ValueError("Must specify unknown, 32 or 64 bit size.")
         self.my_assert(self.data[ELFFile.EI_VERSION], chr(ELFFile.EV_CURRENT) )
 
         self.sex = self.data[ELFFile.EI_DATA]
         if self.sex == chr(ELFFile.ELFDATANONE):
-            raise Exception("self.sex == ELFDATANONE")
+            raise ValueError("self.sex == ELFDATANONE")
         elif self.sex == chr(ELFFile.ELFDATA2LSB):
             self.sex = "<"
         elif self.sex == chr(ELFFile.ELFDATA2MSB):
             self.sex = ">"
         else:
-            raise Exception("Unknown self.sex")
+            raise ValueError("Unknown self.sex")
 
     def osAbi(self):
         return ord(self.data[ELFFile.EI_OSABI])
@@ -80,7 +80,7 @@ class ELFFile:
     def isLittleEndian(self):
         return self.sex == "<"
 
-    def isBigEngian(self):
+    def isBigEndian(self):
         return self.sex == ">"
 
     def machine(self):
-- 
2.7.0


