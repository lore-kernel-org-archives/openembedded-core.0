Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id AFD7B71A24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 16:45:11 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t79so188739660wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=S0wo0OcGHtPekDED0MSNMTB1Jz2R3j+LOg9VNXcip4c=;
	b=CYCR86ZenTccslO3GT+BFA2bMunBOX4BycLxZsl2bUH4Y0P3WImwMz00FUqLCK2aF4
	gXFIljB1gxWqDg0yTP8Vu+m6ev1SGdCD8M9X8/1wDTXyBch/IWuv/Id4FYXlCb/8u6rV
	lngwR4VOxqYB/zxU9B1fGeRv+btOZNGXPwfjFibCgXKLoVbnoj7c0DwbVP3UF5GJMaU6
	gb16zsSmscax5Ok7QT1bVDXmd5zUCx4/9DvTpVU8Ir8rf35fP9Bav+YdhIdq3vNioOPV
	R82cSAOJB4/skAkeqXWIhtnlt3EnU+jfLkyklk75qeXofJJPLVXrgde88uoQZTmMSOCS
	ipdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S0wo0OcGHtPekDED0MSNMTB1Jz2R3j+LOg9VNXcip4c=;
	b=JYIUR2aV9OTQQ64vxGWQzYJkeDgI1252VcQdZGQNnEejRX8P2cTPkWv3Pw3hUF4DbE
	bjd3ZPUH3Y/ewcYRLqSh90uXpzs5m+A+TKDf6t0FzaYek3j76PyVTK4BYlZM67xvZbnS
	nXA0vExMN5zhVb0fOPHOp2Csl+JsDUaqEDooeY1YQLPuA/jXKcgBQLUYn+56pvOu0wbB
	jR9LggNdPSLKuqkO/VoD/hj4BFWvFnAIVX3r+pegqy9Z7msB1k5eb7no+9QlVU3i5Oy5
	bHiMTl4LNcKZlPjK+zs9hbXDHGpIzfXuPSSOcb4iWI2gplFtbE3a379IvO9ooPke0Ntm
	tOtA==
X-Gm-Message-State: ABUngvdM2tXrRcFEzWZXr9JxIZBy7v3xbkwi8UkEevu4lNovC61gsfKZrTEnui0MY/4D0ap5
X-Received: by 10.28.224.5 with SMTP id x5mr5131326wmg.70.1478537112274;
	Mon, 07 Nov 2016 08:45:12 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	n72sm14505898wmd.11.2016.11.07.08.45.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Nov 2016 08:45:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2016 16:45:08 +0000
Message-Id: <1478537108-18958-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][V2] lib/oe/qa: handle binaries with segments outside the first 4kb
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
X-List-Received-Date: Mon, 07 Nov 2016 16:45:14 -0000

The ELF parser was assuming that the segment tables are in the first 4kb of the
binary.  Whilst this generally appears to be the case, there have been instances
where the segment table is elsewhere (offset 2MB, in this sample I have).  Solve
this problem by mmap()ing the file instead.

Also clean up the code a little whilst chasing the problem.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/qa.py | 82 +++++++++++++++++++++++++++----------------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index fbe719d..22d76dc 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -1,4 +1,4 @@
-import os, struct
+import os, struct, mmap
 
 class NotELFFileError(Exception):
     pass
@@ -23,9 +23,9 @@ class ELFFile:
     EV_CURRENT   = 1
 
     # possible values for EI_DATA
-    ELFDATANONE  = 0
-    ELFDATA2LSB  = 1
-    ELFDATA2MSB  = 2
+    EI_DATA_NONE  = 0
+    EI_DATA_LSB  = 1
+    EI_DATA_MSB  = 2
 
     PT_INTERP = 3
 
@@ -34,51 +34,46 @@ class ELFFile:
             #print "'%x','%x' %s" % (ord(expectation), ord(result), self.name)
             raise NotELFFileError("%s is not an ELF" % self.name)
 
-    def __init__(self, name, bits = 0):
+    def __init__(self, name):
         self.name = name
-        self.bits = bits
         self.objdump_output = {}
 
-    def open(self):
-        if not os.path.isfile(self.name):
-            raise NotELFFileError("%s is not a normal file" % self.name)
+    # Context Manager functions to close the mmap explicitly
+    def __enter__(self):
+        return self
+
+    def __exit__(self, exc_type, exc_value, traceback):
+        self.data.close()
 
+    def open(self):
         with open(self.name, "rb") as f:
-            # Read 4k which should cover most of the headers we're after
-            self.data = f.read(4096)
+            try:
+                self.data = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
+            except ValueError:
+                # This means the file is empty
+                raise NotELFFileError("%s is empty" % self.name)
 
+        # Check the file has the minimum number of ELF table entries
         if len(self.data) < ELFFile.EI_NIDENT + 4:
             raise NotELFFileError("%s is not an ELF" % self.name)
 
+        # ELF header
         self.my_assert(self.data[0], 0x7f)
         self.my_assert(self.data[1], ord('E'))
         self.my_assert(self.data[2], ord('L'))
         self.my_assert(self.data[3], ord('F'))
-        if self.bits == 0:
-            if self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS32:
-                self.bits = 32
-            elif self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS64:
-                self.bits = 64
-            else:
-                # Not 32-bit or 64.. lets assert
-                raise NotELFFileError("ELF but not 32 or 64 bit.")
-        elif self.bits == 32:
-            self.my_assert(self.data[ELFFile.EI_CLASS], ELFFile.ELFCLASS32)
-        elif self.bits == 64:
-            self.my_assert(self.data[ELFFile.EI_CLASS], ELFFile.ELFCLASS64)
+        if self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS32:
+            self.bits = 32
+        elif self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS64:
+            self.bits = 64
         else:
-            raise NotELFFileError("Must specify unknown, 32 or 64 bit size.")
+            # Not 32-bit or 64.. lets assert
+            raise NotELFFileError("ELF but not 32 or 64 bit.")
         self.my_assert(self.data[ELFFile.EI_VERSION], ELFFile.EV_CURRENT)
 
-        self.sex = self.data[ELFFile.EI_DATA]
-        if self.sex == ELFFile.ELFDATANONE:
-            raise NotELFFileError("self.sex == ELFDATANONE")
-        elif self.sex == ELFFile.ELFDATA2LSB:
-            self.sex = "<"
-        elif self.sex == ELFFile.ELFDATA2MSB:
-            self.sex = ">"
-        else:
-            raise NotELFFileError("Unknown self.sex")
+        self.endian = self.data[ELFFile.EI_DATA]
+        if self.endian not in (ELFFile.EI_DATA_LSB, ELFFile.EI_DATA_MSB):
+            raise NotELFFileError("Unexpected EI_DATA %x" % self.endian)
 
     def osAbi(self):
         return self.data[ELFFile.EI_OSABI]
@@ -90,16 +85,20 @@ class ELFFile:
         return self.bits
 
     def isLittleEndian(self):
-        return self.sex == "<"
+        return self.endian == ELFFile.EI_DATA_LSB
 
     def isBigEndian(self):
-        return self.sex == ">"
+        return self.endian == ELFFile.EI_DATA_MSB
+
+    def getStructEndian(self):
+        return {ELFFile.EI_DATA_LSB: "<",
+                ELFFile.EI_DATA_MSB: ">"}[self.endian]
 
     def getShort(self, offset):
-        return struct.unpack_from(self.sex+"H", self.data, offset)[0]
+        return struct.unpack_from(self.getStructEndian() + "H", self.data, offset)[0]
 
     def getWord(self, offset):
-        return struct.unpack_from(self.sex+"i", self.data, offset)[0]
+        return struct.unpack_from(self.getStructEndian() + "i", self.data, offset)[0]
 
     def isDynamic(self):
         """
@@ -118,7 +117,7 @@ class ELFFile:
 
     def machine(self):
         """
-        We know the sex stored in self.sex and we
+        We know the endian stored in self.endian and we
         know the position
         """
         return self.getShort(ELFFile.E_MACHINE)
@@ -166,6 +165,7 @@ def elf_machine_to_string(machine):
 
 if __name__ == "__main__":
     import sys
-    elf = ELFFile(sys.argv[1])
-    elf.open()
-    print(elf.isDynamic())
+
+    with ELFFile(sys.argv[1]) as elf:
+        elf.open()
+        print(elf.isDynamic())
-- 
2.8.1


