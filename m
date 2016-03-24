Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CA7B073173
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:43:54 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l68so72076252wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vGxpxooMHlnfC3anibIUpTVtRhj4p45Ugpv5bNoNyEw=;
	b=M4XWeMNUlqIwg9S6hAs7Aibzp+SNFhGr48FOneCg0DJ8//WwqpHsKNwGDfC9Nsm+4I
	CXKbHmAfg1xdz9dU+b/Y8FEo0NrOMhk6boWJinKaqH2q6xYq0w1usq+ZojN2faIU1XZP
	Q39anPuHgrbACosPZvmfCnxFSfNnRIRihUo5r0SRiZBNZoaMrVK9CxV0+sb0+yCQf5cK
	3L35nl1Gv3Y8HMvs4orxCYvSMHyJnoYOjZqfS+CxxVmZzBwYn68CvthUdgSGvcjr8Jd8
	XRKg2q/y6r0Tlr/Onm44A2sTH7D0BzkneHG6lvPZoglvARJqtiTq3TUyB/OsIJ/Hf7O0
	894A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vGxpxooMHlnfC3anibIUpTVtRhj4p45Ugpv5bNoNyEw=;
	b=knyk7yUH4MwG82bPVI7/JdIHrSwrdDDVmNJWWKcElLkNtEoe12hItsVm9Wbtvi9X9I
	KyCz5VChkQH3DZYysgMaNBKM5+wyfsa/EYWpX7Lx3xzfuY3E7bUDQUXOyDv01BOKaejv
	JCDy8l1Ur7XctRdIaOwrp8cWsuHbP/g/pRG8BNsJt4Fw/EaMNJQnNOMQgHK6JmyzORwd
	z7r4UwAMl3Eomx1GP5yp7cerQEORGnqHwhzhceIh8Dv9kt0J/sHhmsUYX5tG30jBkr29
	yHBqDcLjAxrqq5hvRdse5/cmHO+eBLWNo5LKA04/MpOaxU/0Y0T921ZAQ9xUu4CH/o6M
	N6Sw==
X-Gm-Message-State: AD7BkJK5+zxafU300OGUhGP25vHPdEwRD8IHfVNph77+FzLdgNRuirwbbjL5r6zSsOpei5Xz
X-Received: by 10.28.72.138 with SMTP id v132mr1581214wma.37.1458834234314;
	Thu, 24 Mar 2016 08:43:54 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v2sm8300568wmd.24.2016.03.24.08.43.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:43:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 15:43:47 +0000
Message-Id: <1458834228-23233-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458834228-23233-1-git-send-email-ross.burton@intel.com>
References: <1458834228-23233-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] lib/oe/qa: add method to check if static or dynamic linked
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
X-List-Received-Date: Thu, 24 Mar 2016 15:43:56 -0000

It's useful to know if a binary is statically or dynamically linked, so add a
method to determine this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/qa.py | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 4efa21f..51925ba 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -1,3 +1,5 @@
+import os, struct
+
 class NotELFFileError(Exception):
     pass
 
@@ -10,6 +12,8 @@ class ELFFile:
     EI_OSABI      = 7
     EI_ABIVERSION = 8
 
+    E_MACHINE    = 0x12
+
     # possible values for EI_CLASS
     ELFCLASSNONE = 0
     ELFCLASS32   = 1
@@ -23,6 +27,8 @@ class ELFFile:
     ELFDATA2LSB  = 1
     ELFDATA2MSB  = 2
 
+    PT_INTERP = 3
+
     def my_assert(self, expectation, result):
         if not expectation == result:
             #print "'%x','%x' %s" % (ord(expectation), ord(result), self.name)
@@ -38,9 +44,9 @@ class ELFFile:
             raise NotELFFileError("%s is not a normal file" % self.name)
 
         self.file = file(self.name, "r")
-        self.data = self.file.read(ELFFile.EI_NIDENT+4)
+        # Read 4k which should cover most of the headers we're after
+        self.data = self.file.read(4096)
 
-        self.my_assert(len(self.data), ELFFile.EI_NIDENT+4)
         self.my_assert(self.data[0], chr(0x7f) )
         self.my_assert(self.data[1], 'E')
         self.my_assert(self.data[2], 'L')
@@ -86,14 +92,33 @@ class ELFFile:
     def isBigEndian(self):
         return self.sex == ">"
 
+    def getShort(self, offset):
+        return struct.unpack_from(self.sex+"H", self.data, offset)[0]
+
+    def getWord(self, offset):
+        return struct.unpack_from(self.sex+"i", self.data, offset)[0]
+
+    def isDynamic(self):
+        """
+        Return True if there is a .interp segment (therefore dynamically
+        linked), otherwise False (statically linked).
+        """
+        offset = self.getWord(self.bits == 32 and 0x1C or 0x20)
+        size = self.getShort(self.bits == 32 and 0x2A or 0x36)
+        count = self.getShort(self.bits == 32 and 0x2C or 0x38)
+
+        for i in range(0, count):
+            p_type = self.getWord(offset + i * size)
+            if p_type == self.PT_INTERP:
+                return True
+        return False
+
     def machine(self):
         """
         We know the sex stored in self.sex and we
         know the position
         """
-        import struct
-        (a,) = struct.unpack(self.sex+"H", self.data[18:20])
-        return a
+        return self.getShort(self.E_MACHINE)
 
     def run_objdump(self, cmd, d):
         import bb.process
@@ -115,3 +140,9 @@ class ELFFile:
         except Exception as e:
             bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
             return ""
+
+if __name__ == "__main__":
+    import sys
+    elf = ELFFile(sys.argv[1])
+    elf.open()
+    print elf.isDynamic()
-- 
2.7.0


