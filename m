Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f172.google.com (mail-wj0-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1251871A1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 17:35:08 +0000 (UTC)
Received: by mail-wj0-f172.google.com with SMTP id qp4so64461080wjc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 09:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=S0wo0OcGHtPekDED0MSNMTB1Jz2R3j+LOg9VNXcip4c=;
	b=y4lFZuhK/dgd14lNwsa8QfwfeJEo2I/w+b10HqX72SJHc7jRPa39ZZQzvuK1DaixxV
	p4VmNFaQfv6KWF1nxlfc8PhOOZQU6QwoWMpU2RQRK8lPq/k5yEkDPLHlLPkIHTFLuRNh
	jlXu+tnIo+GWJKOCeKG0IMFEnGAbTURDPmtNW6nKZichGuWV0Ov6zGYoSeuf+96lBG20
	MynNNcevUU2TQhjjWNFx/3GeIZee+4lsOuodkSFKB17fXAb1p55MQFpqCm5ERYhGMWYR
	o0PMViruimPR331uQtA1EMp2GyJ6LO2l3HCFdvGeJ4doOrqzaCOQVWBnyaeNkTzoCjC4
	l5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S0wo0OcGHtPekDED0MSNMTB1Jz2R3j+LOg9VNXcip4c=;
	b=WmdZ9buxRy2+atxpfuGXqsH3GbolPZIJslMAszB2W2mkxLbr1qCkz37JQ7LCuvLHtz
	lyGEaul4Zz5/gzKoWLGBNHoR+SfidKPdeJdRd/EA63yTOOppYjB9O0ckycxw8TEAhEcU
	HP/GGrkzrPQUn6maIKZEXi6Op/ALsjtP1iYFnw88ybvoOMAfwZCJ+LRlBOmrHKQOINRk
	plnK7b1F4niGdC0d8+CrUSHlHcSjivz2yjEdgPzDQ2MoyM6c3nQtNLmZqW1OOJKYnmlw
	aAxRnORJtU9p+tE8Ev35v3oBd3ldqQrpXyGCmHGJ3bcCVV3VT6nN/LkkpgWkJTICt+G5
	MOsA==
X-Gm-Message-State: AKaTC01LozwgOMLzMhaD3YRmYxqE3S3maGUOQEVP3Cpl9T1Vflp8/cXGuwIKx0mLw7SOhQJM
X-Received: by 10.194.59.71 with SMTP id x7mr9796253wjq.74.1480095308464;
	Fri, 25 Nov 2016 09:35:08 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c133sm14529381wme.12.2016.11.25.09.35.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Nov 2016 09:35:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Nov 2016 17:35:03 +0000
Message-Id: <1480095303-15753-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][morty] lib/oe/qa: handle binaries with segments outside the first 4kb
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
X-List-Received-Date: Fri, 25 Nov 2016 17:35:09 -0000

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


