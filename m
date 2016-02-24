Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id AFC047713A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:59:12 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g62so5500514wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 15:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QojreWSr7p0UQegLI3ZTaqH+EiBGYWpTIWPq+H6rdxA=;
	b=HKgBMsY9dpoLZ+4a+aRPzkUtgqNI7Ub23AZaX73oZaWl7XD3Jm4y7KjAQjHUSxFEl5
	LC6FcTi+LP3RkQyKLw+lZW/FghvsbM/t6DSbzt8oqqL/Akebu93Q7/pT3WJoz+ddmQqO
	kgrbjrLPZ9Zk0l6XbNHqGIiIYdqGtkTWmp83zoe0hPhrrKLrQyb5I+EI1jhATNzt4a/S
	dDpYYlhE+xOTz5HrUGdF6MLVf1a6B8rjksBV2gHQchA7WwqB/0EsTyjj894ba0PlLEF0
	Zb7dy1wrM11aDbjXeDm5wo67zE+TKDhl8vNL+U4BvXG2wpDe54/pWuX3Q284BHCAXZfH
	Psmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QojreWSr7p0UQegLI3ZTaqH+EiBGYWpTIWPq+H6rdxA=;
	b=LAXMipArpdD8KPu0hyypG7wUBuWVN37ioYmA0RLFrL+S1vfepQ29cEqy0svdJlx2Jj
	pwCVJE2SVDKs6lVo4xLBQsJfpcdjY7jXMmONJDD2wtsWdYZzSVVECV5Zxm+UyvwZWQNS
	oTiqtqGOWNs7j/W2yNyzBJ2Cw+zTHcrzPIo2JrmZTIneLULVcOC8DNTJNnc0MtXaEjpE
	bUsObLzF9+os8Rj4vRl/FqiepkHM85LR+i3T5x3UNTgCqEEAWQSOt2hApFH/cg2wW7OK
	7rmnITbzBlpRA60xvK6XUm6VqMbU/ylp159XAlMuWmxLPBaHfS02eRXkPEkB6u1pQYPn
	SANg==
X-Gm-Message-State: AG10YOQ9p1LPbuUgHhl5/aJHzv+tcDVGAKUNBgiZWisAi2uD2DhlW+ITh+M+g+HQtsxWInE/
X-Received: by 10.28.126.205 with SMTP id z196mr352784wmc.44.1456358352705;
	Wed, 24 Feb 2016 15:59:12 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q129sm498790wmd.14.2016.02.24.15.59.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 15:59:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 23:59:10 +0000
Message-Id: <1456358350-15120-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] lib/oe/qa: add explicit exception for 'file isn't an ELF'
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
X-List-Received-Date: Wed, 24 Feb 2016 23:59:14 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass    |  3 +--
 meta/classes/uninative.bbclass |  2 +-
 meta/lib/oe/qa.py              | 15 +++++++++------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8548961..ebf92ac 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -792,9 +792,8 @@ def package_qa_walk(warnfuncs, errorfuncs, skip, package, d):
             elf = oe.qa.ELFFile(path)
             try:
                 elf.open()
-            except (IOError, ValueError):
+            except (IOError, oe.qa.NotELFFileError):
                 # IOError can happen if the packaging control files disappear,
-                # ValueError means the file isn't an ELF.
                 elf = None
             for func in warnfuncs:
                 func(path, package, d, elf, warnings)
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index b14cec0..7e225e6 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -80,7 +80,7 @@ python uninative_changeinterp () {
             elf = oe.qa.ELFFile(f)
             try:
                 elf.open()
-            except ValueError:
+            except oe.qa.NotELFFileError:
                 continue
 
             #bb.warn("patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f))
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 2ad6c63..4efa21f 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -1,3 +1,6 @@
+class NotELFFileError(Exception):
+    pass
+
 class ELFFile:
     EI_NIDENT = 16
 
@@ -23,7 +26,7 @@ class ELFFile:
     def my_assert(self, expectation, result):
         if not expectation == result:
             #print "'%x','%x' %s" % (ord(expectation), ord(result), self.name)
-            raise ValueError("%s is not an ELF" % self.name)
+            raise NotELFFileError("%s is not an ELF" % self.name)
 
     def __init__(self, name, bits = 0):
         self.name = name
@@ -32,7 +35,7 @@ class ELFFile:
 
     def open(self):
         if not os.path.isfile(self.name):
-            raise ValueError("%s is not a normal file" % self.name)
+            raise NotELFFileError("%s is not a normal file" % self.name)
 
         self.file = file(self.name, "r")
         self.data = self.file.read(ELFFile.EI_NIDENT+4)
@@ -49,24 +52,24 @@ class ELFFile:
                 self.bits = 64
             else:
                 # Not 32-bit or 64.. lets assert
-                raise ValueError("ELF but not 32 or 64 bit.")
+                raise NotELFFileError("ELF but not 32 or 64 bit.")
         elif self.bits == 32:
             self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS32))
         elif self.bits == 64:
             self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS64))
         else:
-            raise ValueError("Must specify unknown, 32 or 64 bit size.")
+            raise NotELFFileError("Must specify unknown, 32 or 64 bit size.")
         self.my_assert(self.data[ELFFile.EI_VERSION], chr(ELFFile.EV_CURRENT) )
 
         self.sex = self.data[ELFFile.EI_DATA]
         if self.sex == chr(ELFFile.ELFDATANONE):
-            raise ValueError("self.sex == ELFDATANONE")
+            raise NotELFFileError("self.sex == ELFDATANONE")
         elif self.sex == chr(ELFFile.ELFDATA2LSB):
             self.sex = "<"
         elif self.sex == chr(ELFFile.ELFDATA2MSB):
             self.sex = ">"
         else:
-            raise ValueError("Unknown self.sex")
+            raise NotELFFileError("Unknown self.sex")
 
     def osAbi(self):
         return ord(self.data[ELFFile.EI_OSABI])
-- 
2.7.0


