Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB57CD8C96
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6139.1780698866300708884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=afSY4ku2;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so19845665e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698865; x=1781303665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rl4Rx9j44OGxMBVWl2z1S/8m1/MNjd3KuYgtfWo6G3w=;
        b=afSY4ku28OEUwbU2uJiSGYKbSyU7QhXWI903HBIokdJQPB6PXqP4HSi/ST6hFdvPNs
         LGPzgBcezcgOxYW3YHSD/Ui0YyTKwdXwpDjtccms0iWP71D0bHO0JviiabtVK3CU8dZj
         v6JDaxFnGTU9S/Fjsjl79qMi/FW+Ofnfsh9kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698865; x=1781303665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rl4Rx9j44OGxMBVWl2z1S/8m1/MNjd3KuYgtfWo6G3w=;
        b=N/K8ILz2R3h1AQ0mmEpGYYzjXFj2AXgFxWHQKCOUaEiyTcfZ7ie+o0ReTfacMQ+Lwm
         gcPbMsKC9eatZxwPwluHRrIpi7fy+QnSaf6t8VeltxwmJ6jQLgU4LLoHXo+/DOJR8ZLU
         JAi8SY206iL73Gafer+cpyY6ERZDgfp/dUiANQfmck/LNTRqwbpcAHiN/0sqqBfMoREn
         FyPW5tho/7rqB2o7CXAKxwz6ke508jc9bCtYoVxnGgWZunV0cXjrKjOrC+YfG+bws71w
         JyU6aS6ZuJmFRlmWV6uVooKw59BbVCE6chaNcNWIsOlex9dyQLhwT57sVwYuAyGB1Mmi
         Bk5w==
X-Gm-Message-State: AOJu0Yy+r159UbVsYCgqXMs/f7JOjcU9VbGAat1b6pBHuFOqmpWxdwKY
	I5wkdWuTChj+PhpJi5hP09MKSXebo6PWzwnXk+f59VsOHnyUwsgPidhuZUZF9hutq7w+tS1pnsR
	dc3K9
X-Gm-Gg: Acq92OGJQwfxTB81vfL425npL+DMpbV1ZXeNtgIJc2ohGqEg/3pRayRr1YkyIIJioEr
	0jMieEco1OHrzM2Nl78G2ps+IFDqsDM7P1Sj6jZN0ZdHpugb3yOoxpKulggDRSaMiRey9UfjktT
	iRDi1QN9pc1CM0EtNEeDWhZlq3u94XxLlchUGe+GW1izV8/Ca9mGSPwg/I/iBMFccqBU8gLsi9o
	HWfDwnRLlisOrnHD2BReyAZsy6NY5ifGtO9C+XH5lBhC1OmQ3R0xQ8Ad71ikevqphRZvDLyX+KM
	+PSPiTvvHDnU1P0ACEDwfSuywGceHtT5jdaY9Cb7fV8Vw35qgQKt3JBu0UC9WbGkHAKwe92J2wQ
	tPTfrSKHV1W9KatR3LcKK22CAx2l2buugdvZj52LBniczWzg7PHr+38xI0HHHKVPSieJ8MPcX3A
	sO6jFXXjb8wFL9wOpYEcZaclpcy2zHqC+aYz6DOrsM55yjtH8m5vqfVShc6eZw6W08bDTUC5rxN
	voyY9rYiOouZSCtzpSjoqX4ZdX3gHD/08cmA30=
X-Received: by 2002:a05:600c:45d1:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-490c26053a6mr84257265e9.30.1780698864648;
        Fri, 05 Jun 2026 15:34:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/25] wic: filemap: use separate fd for SEEK_HOLE probes
Date: Sat,  6 Jun 2026 00:34:04 +0200
Message-ID: <37a45219dd204b07bad40576fefccb2cf85b255c.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238206

From: Trevor Woerner <twoerner@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 481969844385f2fa40a1230ca50253ec4ff516cd)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/wic/filemap.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 85b39d5d743..2554e8312cc 100644
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

