Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D03F506D9
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 14:18:03 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51348.1773670682876023692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 07:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQMyM9t4;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3647033e0c.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773670681; x=1774275481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tth0TOWSoZCiusHG/YIN0PF54yFlYHbpVGHm9Oq7dQY=;
        b=SQMyM9t4HjZSAXWEQ36q6Wg2MdxJRHF75jQmD92HLweKSWJ4GrjrpENlxGC5aHal0w
         0q4SNXBxMRlxec/NNiMk4Q/BrjzYX5gp0t12AJOwqTdEBMLYB5ynTJW8Eimrqd234ZUJ
         UD4G+wG99BHEN+nbU7wvrKBsqyL3bR8ZTHN9IwmvC3Uk5hpdIX9UY7VGhPBVcKyNrBra
         2PArNeDfEsMWHxW8R3IoiMjDoETEI2BbzPrA9il50yh4NhQoIuh7a/UxlXDNhndB9udQ
         fvv1j+YJmRji6QZ8USchue7NbxSXboItfWBj7QSYle3BIjlCHayXvHPHkNKBzXLxghJO
         6Otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670681; x=1774275481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tth0TOWSoZCiusHG/YIN0PF54yFlYHbpVGHm9Oq7dQY=;
        b=DQdqDWDBHZrljMIDMAGQRpZvQObPeubaAMf9Jq1bvLueSf3GTE9387qKLd5EItVVc2
         iabGdAdfj2xfSlV5VXZW0NUYHw+Rv5YeMnPDYDdMUtFz+TrxCNwkj/4huKRU+76aAOV3
         xlPRzsd8W4OdUGUVnij+P5eudpo78D92We+kvu3BNhIf6BVqiDj/UpPIwqoASTga2EWD
         DdQ0MYlXGJvfJ4LmUw/PwMu/FqPjzFRswxCPqJYRxAnA2pQiS0WeQ64hMuCR2NUvmjIF
         BJs/Shie69EGf0xfhdHem+sQVDDHjNuiDgpXyzY+qe+qLQ9e5Ry4rC6MRy7y/tFrzfL2
         B+8Q==
X-Gm-Message-State: AOJu0Yxyyv05yR1uaAETtq4G6X0CqYKO3T27EjCl0bEjHdBU95nbj7Dd
	9dfPz+nePd+tTuP6hRiAr1nghohWG/qOZoyBNaxJgB5veVs4wT7WpWHWRCf4/w==
X-Gm-Gg: ATEYQzwbX+UBjTw77N83JZdGrwYkzz4NNsHo/dsQieKym0Zq+nuAVrujS1O3AvC5T7A
	K48P62ro3RSw3Mn1m8VXNeKSOQjtmmV9QnMsxraHGhIxw23wTev/cUQJ0dpUDC6mGE9C5yzCl5D
	cVvMHNFZdW2z4oFNJUgZWvVQDOZOr77QHqPgEATTWY9JraIsobJPEHvxeiE89CCOSA67iyXNT5n
	bIqyhwdJi58RaQdj6GIXNxrTJlHq2+hr6Rk/2MdQBHNutpN8/lwlBCjcvHSSaVpdAv4KhBscQof
	NrGSCZR+0QwzTUafbPdJU6qPshtw/f3YPD/uJxr8AVoJKBOiX9KOAoTGi/COjSjmN7DvajqWcdH
	WxBmbhH+L/cY8vnZcuxQ4PmIufgH4rU8zvuU0Fwo3jbVvEEPNXBqbN+20x8dCqw/JQu5gwq45J/
	l5M2CBdyNY12RFHfv+Ru7UdFVRoQcTtCorKn6EYNz4ucOL13oPkij7StKJMcQ+H5LusA==
X-Received: by 2002:a05:6122:2989:b0:55b:7494:177b with SMTP id 71dfb90a1353d-56b628dfb7fmr5528325e0c.10.1773670681169;
        Mon, 16 Mar 2026 07:18:01 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b7e7623e3sm2468636e0c.7.2026.03.16.07.17.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:17:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] wic: filemap: use separate fd for SEEK_HOLE probes
Date: Mon, 16 Mar 2026 10:17:50 -0400
Message-ID: <20260316141750.205474-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 14:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233254

While working on splitting-out wic from oe-core, on my openSUSE Leap
16.0 machine, the moment I split wic out, 2 oe-selftests always failed
with 100% reproducibility:
	- wic.ModifyTests.test_wic_cp_ext
	- wic.Wic2.test_expand_mbr_image

In both cases the symptom is the same: the filesystem has inode tables
that are completely zeroed out. Both issues are linked together to the
same underlying fault.

FilemapSeek._get_ranges() is a generator. Due to the nature of finding
each hole/data extent one at a time using the lseek() system call,
it calls os.lseek() on a raw file descriptor, then yields, then the
caller, sparse_copy(), calls file.seek() + file.read() on a Python
BufferedReader wrapping that same fd — then the generator resumes and
calls os.lseek() again. This interleaving of raw os.lseek() and buffered
I/O on the same fd is undefined behaviour from Python's perspective.
The BufferedReader tracks its own idea of the fd's position and buffer
contents; os.lseek() changes the position behind its back. This can
corrupt its internal state and cause read() to return stale/zero data.

This code, however, has existed in wic since it was written, so why
was it not noticed before? It turns out this bug was being masked by a
number of implementation details that changed, especially when wic was
split out for oe-core. These changes conspired together to cause the bug
to be triggered.

One of the root causes of this bug is that Python 3.14 increased the
default buffer size from 8KB to 128KB[1]. With 8 KB buffers, read()s
either go through the direct-read path leaving the buffer empty, or
if it fills in 8KB chunks the buffer is fully drained. Either way,
with a small buffer, read()s do a real raw seek. No fast path. No
corruption. With a 128KB buffer, however, a much larger window exists
where BufferedReader.seek() can take the fast-path after the raw file
descriptor has already been repositioned by os.lseek() in the generator.
With the smaller buffer, this window was too narrow to hit in practice.

This is fixed by opening a second file object in FilemapSeek.__init__()
dedicated to SEEK_DATA/SEEK_HOLE probes, leaving the data-reading handle
(self._f_image) untouched.

This explains why the corruption is deterministic and tied to specific
block boundaries, why it only manifests with the split-out version using
Python 3.14 (on systems that are using Python versions less than 3.14 on
the host), and why using a separate file descriptor for reading bypasses
the issue entirely.

This is not an intermittent bug. For a more detailed explanation
including log files, in-depth analysis, and a standalone Python
reproducer, please see the linked bugzilla entry.

Fixes: [YOCTO #16197]

[1] https://github.com/python/cpython/commit/b1b4f9625c5f2a6b2c32bc5ee91c9fef3894b5e6
b1b4f9625c5f ("gh-117151: IO performance improvement, increase io.DEFAULT_BUFFER_SIZE to 128k (GH-118144)")

AI-Generated: codex/claude-opus-4.6 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- updated the in-code comment to remove references to this being
  kernel-related (it is not, but at one point i thought it was)
- updated the in-code comment to remove the suggestion that this bug is
  intermittent -- the conditions might be intermittent but the bug is not
  and will always show up under the right conditions
---
 scripts/lib/wic/filemap.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 85b39d5d743e..2554e8312ccc 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -201,6 +201,13 @@ class FilemapSeek(_FilemapBase):
         _FilemapBase.__init__(self, image, log)
         self._log.debug("FilemapSeek: initializing")
 
+        # Open a separate file handle for SEEK_DATA/SEEK_HOLE probes so
+        # that the lseek() calls do not disturb the BufferedReader state
+        # of self._f_image, which sparse_copy() uses for data reading.
+        # Sharing a single fd between os.lseek() and buffered read()
+        # has the potential to cause data corruption.
+        self._f_seek = open(self._image_path, 'rb')
+
         self._probe_seek_hole()
 
     def _probe_seek_hole(self):
@@ -244,7 +251,7 @@ class FilemapSeek(_FilemapBase):
 
     def block_is_mapped(self, block):
         """Refer the '_FilemapBase' class for the documentation."""
-        offs = _lseek(self._f_image, block * self.block_size, _SEEK_DATA)
+        offs = _lseek(self._f_seek, block * self.block_size, _SEEK_DATA)
         if offs == -1:
             result = False
         else:
@@ -265,11 +272,11 @@ class FilemapSeek(_FilemapBase):
         limit = end + count * self.block_size
 
         while True:
-            start = _lseek(self._f_image, end, whence1)
+            start = _lseek(self._f_seek, end, whence1)
             if start == -1 or start >= limit or start == self.image_size:
                 break
 
-            end = _lseek(self._f_image, start, whence2)
+            end = _lseek(self._f_seek, start, whence2)
             if end == -1 or end == self.image_size:
                 end = self.blocks_cnt * self.block_size
             if end > limit:
-- 
2.51.0


