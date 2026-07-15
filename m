Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12D7C4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 22:13:18 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.531.1784153591731608540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 15:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KN+tThNO;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8eeb4508f29so60990216d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784153591; x=1784758391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4KqfHRkEdsSYR04nrc35sDThN0NPbY1cAjRHVsvXoXU=;
        b=KN+tThNO8vfMG+vX+F+uuF1Bx3KeigEsprcr7WfMy0H/enxh0mzkg5ozI8ENP5FkeU
         CFAGg3AM+R5Ptz40WUryNf3SeKxJJj2eMxIstdpNaro+80L/J22z3kzxx4/qNTK0SgGn
         SA8e9j0DpDRJ76UNi9XYxdHxHudxJlfGO+FwGQ3LNarPn+0rasOu9O/O9mEUlMZZ5C4N
         v6hIXP/Zj/2hHfXLOkPqFY14ksvkqTqrGYpjI6yaTSkG+2EbXE6wWNPU9CX32SoqyWQV
         EqcYFHUp5WOds4g0xO8Wgjh/YOiicCITHFuCNsz4jSsx7vqrt4DcRWmF2D+jc/R5r0d1
         MAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153591; x=1784758391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4KqfHRkEdsSYR04nrc35sDThN0NPbY1cAjRHVsvXoXU=;
        b=A1E6YZR0J5ZKlJ2xkgJ7IxBn9KJnkX+YD4W8kCyjhbQDcbUrOls9Z2S/T8PoEf/lRy
         dyThSIa3n8RSg8/3d0OTDAAXMOb/icQ3IzZX4lIPseZGXuBTMbEdpPlb82N1vdrIvT+5
         YGf7nv99QLoG7XofD64JJmZ5Hop9ii8wI2y9UQJzdKIgY3ys9/YLWfKw+kV3M8MvbG1A
         xEOh+BUY7B8P09782VyuWHjgvRZ3iDzli49AUIWSeOSvGQCAY+E+52ylVwRUXx+NGlXi
         SDba4az3i4Zcf2XtaUm6pZjUiLT64BUpQq8JlikIL6IzkoxARKizVST5gHkYCikOEnVc
         gLhw==
X-Gm-Message-State: AOJu0Yx6iPOEEVkpvma8kOaCy1eeRvJk49I+m9KPTcgj2R40BUJE+hXd
	RxyWBSRquliZiqXrlrpz80TXXcWXO2hestfoHBiaGI84vZbIXZCXqXiQBdH9hw==
X-Gm-Gg: AfdE7cmZmlCAkisHmsWPWDXGoQql7J92hL7KE49a5LnK0EolC1Viszk6r5wGIdyXpfG
	Pm2Mku+ORIV+z4kJ65yXbUeI1r+Vfh/Nei07bf7tNL4pogr7zIGb1IFbFfulBqCgtan/Hg3uEEc
	oC8sq/M5mh074Ofg50MY6ALpl4vBlwTahNEA7DwQEi63NIyP1LaZFT/lEFMbhB1Sa4yuJ6giAvo
	zgvvRUL1SidhZ2zwIOUcm+8EW6PvLsM1PYPcg97sfhkbrOe7fUIseJLPrD/k4navNGh/evhCLES
	N4IPZNvmsddpqq0WiMNC1oNtgxoa5qpM2GKqzpRnu0z9MEy5nDSA7tgsWjfDiPMboYlZDX5BN2a
	VPXg8s69tGIz0hs5abZG/57+HuoEMetHnSvhFv+XaMBlZ30gravkCkDYA5YD9rCuOUbUqwmUpyr
	S8GQth5aL6btypGWmO2M3JmY+GMe5Zb0zHb96OPh1RgZZ2
X-Received: by 2002:a05:6214:2025:b0:907:31a6:c24f with SMTP id 6a1803df08f44-90758de66e0mr63425836d6.41.1784153590389;
        Wed, 15 Jul 2026 15:13:10 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm204822086d6.9.2026.07.15.15.13.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:13:08 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] oe/path: don't glob-expand the destination in symlink(force=True)
Date: Wed, 15 Jul 2026 18:12:50 -0400
Message-ID: <20260715221252.3369108-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715221252.3369108-1-twoerner@gmail.com>
References: <20260715221252.3369108-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 22:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241045

symlink(source, destination, force=True) cleared an existing destination
by calling remove(destination). remove() treats its argument as a glob
pattern (it iterates glob.glob(path)), so a destination whose name
contains glob metacharacters is mishandled: a name such as "foo[bar]"
may fail to match itself and be left in place, or a pattern could match
and delete unrelated files.

Remove the literal destination instead: unlink it directly, and fall
back to rmtree() for a directory, ignoring ENOENT. This keeps the
force=True semantics without passing the path through glob.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oe/path.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index f0462d276196..44a9ff9d0757 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -169,7 +169,18 @@ def symlink(source, destination, force=False):
     """Create a symbolic link"""
     try:
         if force:
-            remove(destination)
+            # Remove the exact destination path. Do not route this through
+            # remove(), which treats its argument as a glob pattern: a
+            # destination containing glob metacharacters (for example a
+            # '[' in the name) could fail to match, or match and delete
+            # unrelated files.
+            try:
+                os.unlink(destination)
+            except OSError as exc:
+                if exc.errno == errno.EISDIR:
+                    shutil.rmtree(destination)
+                elif exc.errno != errno.ENOENT:
+                    raise
         os.symlink(source, destination)
     except OSError as e:
         if e.errno != errno.EEXIST or os.readlink(destination) != source:
-- 
2.50.0.173.g8b6f19ccfc3a


