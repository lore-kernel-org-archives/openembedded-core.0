Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3BFC4167D
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:29 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.2953.1668262213238848055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v8nOG7QF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e129so6546122pgc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqxTKAtQDFUCkwjMz+dGTj0DFbS5BqoW14jS9hBY9o0=;
        b=v8nOG7QFvKSfS9m1zh3PAQSK4dci08jLNylu1uIcxlBv/G1edKG9N9sc+pIjgwKHTd
         y9cZayOkWNfxS/7XQ5HYkOvXRF0OawKWdHgVbKKURX1/48rLilnwuKIEG6UMbx9qmL9W
         wRE+NWya84fdiUDzvCQQqWPLJARQJRgfXgeZWL8wVaBM7QB6fdMWhbNm0CmrEoNlwfJE
         xUxPh3vscCon3XcyJ1H1aAOYM69KEmSkwTz53mY+g0ef7sNC1pVEWcnaFRQsv50dj37f
         mlr6fgFvjHtL6L3z3zYco/pmpo8wNDiAcXKUoEbcgvvSFbn3DYpP/d0kqm4v/thlnudk
         vzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqxTKAtQDFUCkwjMz+dGTj0DFbS5BqoW14jS9hBY9o0=;
        b=DzOMwLf+HwoXNFEV31+2xi+ux+ErMMNTBhpc+UBR4DX26jEU0qnPosqQhwvVzHtJQf
         UTIyJVUu2TQoXjOSHFG1heMqbn3LDgfYZYm+KJNp93FYfcMj/SxlIzrUFSOoQ5qETffc
         kG23VKznakxmyZaaoH+pN9fTD32Wie/fLMhsWL5LZxfoGcMb1LR05lXC+K3iicW9Bl2i
         vjkVMJ6F15ipm0FPI/lYv9PS+1m59ePX3EQCA+xdb559mOxKTLC9ybCR48+OWaH2j1xs
         DT3zIb0/PFIP261Rb4QIuqojiH+fa9KfXV7zDcX35kWXoNeUGMIuPjhXfOzfy9zyB6DZ
         muJA==
X-Gm-Message-State: ANoB5plZU3O4cX889IHP/9sdXXoTjMB8eM0IJFLNLiwj1yTgE5Q/TnYh
	348q1wpsBd8I+Y3xXiqfydqpCXIYhTCW6ypU
X-Google-Smtp-Source: AA0mqf73TAQsyTGBKJ9Uh/w4kXGxhxk+blZH7UySNIZYMHG5NH1lNEjXgfyHS8LOdBLhaZPUUUNzWg==
X-Received: by 2002:a63:481c:0:b0:470:514e:1f15 with SMTP id v28-20020a63481c000000b00470514e1f15mr5580374pga.358.1668262222128;
        Sat, 12 Nov 2022 06:10:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] externalsrc.bbclass: fix git repo detection
Date: Sat, 12 Nov 2022 04:09:56 -1000
Message-Id: <1f0e4de8d92edd7438d462c779d917ac0ccd5499.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173157

From: Martin Jansa <Martin.Jansa@gmail.com>

* fix issue introduced in:
  https://git.openembedded.org/openembedded-core/commit/?id=95fbac8dcad6c93f4c9737e9fe13e92ab6befa09

* it added check for s_dir + git-dir (typically '.git') isn't
  the same as ${TOPDIR} + git-dir, but due to copy-paste issue
  it was just comparing it with s_dir + git-dir again, resulting
  in most external repos (where git-dir is '.git') to be processed
  as regular directory (not taking advantage of git write-tree).

* normally this wouldn't be an issue, but for big repo with a lot of
  files this added a lot of checksums in:
  d.setVarFlag('do_compile', 'file-checksums', '${@srctree_hash_files(d)}')

  and I mean *a lot, e.g. in chromium build it was 380227 paths
  which still wouldn't that bad, but the checksum processing in
  siggen.py isn't trivial and just looping through all these
  checksums takes very long time (over 1000sec on fast NVME drive
  with warm cache) and then
  https://git.openembedded.org/bitbake/commit/?id=b4975d2ecf615ac4c240808fbc5a3f879a93846b
  made the processing a bit more complicated and the loop in
  get_taskhash() function took 6448sec and to make things worse
  there was no output from bitbake during that time, so even with -DDD
  it looks like this:

  DEBUG: virtual/libgles2 resolved to: mesa (langdale/oe-core/meta/recipes-graphics/mesa/mesa_22.2.0.bb)
  Bitbake still alive (no events for 600s). Active tasks:
  Bitbake still alive (no events for 1200s). Active tasks:
  Bitbake still alive (no events for 1800s). Active tasks:
  Bitbake still alive (no events for 2400s). Active tasks:
  Bitbake still alive (no events for 3000s). Active tasks:
  Bitbake still alive (no events for 3600s). Active tasks:
  Bitbake still alive (no events for 4200s). Active tasks:
  Bitbake still alive (no events for 4800s). Active tasks:
  Bitbake still alive (no events for 5400s). Active tasks:
  Bitbake still alive (no events for 6000s). Active tasks:
  DEBUG: Starting bitbake-worker

  without -DDD it will get stuck for almost 2 hours in:
  "Initialising tasks..."
  before it finally writes sstate summary like:
  "Sstate summary: Wanted 3102 Local 0 Mirrors 0 Missed 3102 Current 1483 (0% match, 32% complete)"

* fix the copy&paste typo to use git work-tree in most cases, but
  be aware that this issue still exists for huge local source
  trees not in git

[YOCTO #14942]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9102e5a94b8146cb1da27afbe41d3db999a914ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 291fcf5653..fc20eedf4d 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -207,8 +207,8 @@ def srctree_hash_files(d, srcdir=None):
     try:
         git_dir = os.path.join(s_dir,
             subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
-        top_git_dir = os.path.join(s_dir, subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'],
-            stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        top_git_dir = os.path.join(d.getVar("TOPDIR"),
+            subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
         if git_dir == top_git_dir:
             git_dir = None
     except subprocess.CalledProcessError:
-- 
2.25.1


