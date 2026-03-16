Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAECFF30299
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 02:39:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42470.1773628767186100145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 19:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U2Hrxr9d;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb5c9ba82bso495657485a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 19:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773628765; x=1774233565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fgyCu53nXB+MgVAfgfWH2H5aRwWctewbrW40u4Nzy9w=;
        b=U2Hrxr9d7QXjVfZE1sMeegrTRIP5EaGSvB9HFcyDc/cRZ6J+iaA/vDweQ2kwax9fHH
         2PFOHg9VBrXVtb4FO3+pxnuJC7C/SvZnubbdbKlWMfT/ZEFnKZSXfUGGavOqEa/kkMtm
         lkzdh99WXATDKEYZyWYon6Mt4nouQJAvWgwBYIkF2F/l01bKuE4uOj1DAwLV8QZ7i6uq
         AqAs9rtg+5DqqrL1I8X1SgVc06YtehJ3VxjRQ8s4DvVNLFCnlfPIVuIh4GQhbJdyWb8D
         pU/C5HJQNQ980eMzTP2gzLW3xTwC92enE6zvUi62CVr+38zyNPbo4honuNdGgpi03HJT
         dGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628765; x=1774233565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgyCu53nXB+MgVAfgfWH2H5aRwWctewbrW40u4Nzy9w=;
        b=hZEw8NMaJN66rziT5l7cMRZk0RRGFGOFrstsYhRcux0+4WMYGIMCsps8yTFQb+55tv
         k9uy/FmnIqnM4ev3iLqTZdIY5INHazE22xLd+nkzlBQrIxnvkjYJDizF/KxlceIHUbMD
         Gtk7kQsA2FMXd/ER8p4CYxOKQq5h1ufxb6eDNyreBNSdVdObdeF2eerdJcnlPWps57j7
         PB8PgaCxk7ekhfHZxihZJF7ulPjxEpaOWBv18bIQEFCkBc7mF1fc3AO36Cqk8M0uStpe
         lHDxoznLgq9RlY/4YPelBbITkuYF1FuuCUTVkMNlQKASlNm6A4sYDTVhhqXAjBfOdF8h
         o+tg==
X-Gm-Message-State: AOJu0YzTJVzZtfyLPkiKTHhxsPoSeYom7yzLVRvVYNEoVTn9hwmhFbHz
	VdqnnX4f6DoWKjrspi7zj/gcP0sPuLg0WzSd9EQ4I9d8scGNvXQv9LrP6zxkIw==
X-Gm-Gg: ATEYQzzTbWrx6Yx/g1/KUE6pYa4LfXRevH+OR2advoYIiPlEmOouOYVdrzPnVoSxMDZ
	uaVSsltQjCBzc6D2Uamh0hKb9uv4jZfI57aMKJXbqUCcXbJC4kh306lbg2igCtg3V8FLz3YeOsA
	T6DqPpAnvAUjpCqoJRIMh5Ym9i67ndnYzNDSfIXbufPxGwXTJf6xKWBJEDdQ9dWNUCAzYrnHf2X
	ltBdZGSzJBz9TXrHPJjUr3AjNct1gasXrOebzfpIOF+5HaouchDmk0cdWu9rrGH4sQHVb1en2Ot
	xWHBvkldprXC//6xpxyGK7QH0PuAb9nFDkcDP5upimZa1o+9c2V/xtwRtmViWCnje7YpuNou/wx
	JYs8IuhEin1ncj8DzPTHm5DHisNxgpQ2Z0XvPXGLNOKG/4vyuHMGyguYnZLeuz6ID6Wl6Nz0h1M
	2PI4BdSD4wlup6nU1ky0dW6NYMCCxF+KJnmU8qKbaNLiRVayusTCSAGtnGT5c9XYahOg==
X-Received: by 2002:a05:620a:1999:b0:8cd:80f1:f465 with SMTP id af79cd13be357-8cdb5a7ecd9mr1578061485a.21.1773628765513;
        Sun, 15 Mar 2026 19:39:25 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21348e2sm1114028185a.35.2026.03.15.19.39.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:39:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: filemap: use separate fd for SEEK_HOLE probes
Date: Sun, 15 Mar 2026 22:39:15 -0400
Message-ID: <20260316023915.87329-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233202

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
 scripts/lib/wic/filemap.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 85b39d5d743e..3f6c77633c5d 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -201,6 +201,13 @@ class FilemapSeek(_FilemapBase):
         _FilemapBase.__init__(self, image, log)
         self._log.debug("FilemapSeek: initializing")
 
+        # Open a separate file handle for SEEK_DATA/SEEK_HOLE probes so
+        # that the lseek() calls do not disturb the BufferedReader state
+        # of self._f_image, which sparse_copy() uses for data reading.
+        # Sharing a single fd between os.lseek() and buffered read()
+        # causes intermittent data corruption on some kernels.
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


