Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D162CC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 15:43:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7208.1667662988552932470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 08:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FtQ1Vg0+;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667662990;
  x=1699198990;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jJ0iTEXgSfw4UfShldmMw1xUNHJn1pATmQ/HyMK43VI=;
  b=FtQ1Vg0+gu6ZPnPs1J5uTTzQ2qzUjbf2/1SU3apcEKC4r/WAZRU5rg9+
   16amWTZE3uSwvLhqqB2s14gO5NOy95JOv4xQtRefqUpeQev9y8tIQVwlM
   21D6QIUAk9Z3NMwwLY9kO2TaJog0/1OCUkzTUN6HrnjjqfAOj5J4+qvT9
   CD4XnnkX/v3muaH1Rs4MNX7crWSsL79Kv3puc8NrG4wReD7djaq+H5G6y
   b8Tp81M/HAuG7n6j9GuhuRuVInqvOXZutYksL+V/cJMdNZoqzwe12HvG/
   YCc6FC0EkOwv2QGoqKDEoTlUc7nPgQSdfXQ3R5LEBCZjkbMz7kBroaWYR
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [langdale][PATCH 2/3] externalsrc.bbclass: fix git repo detection
Date: Sat, 5 Nov 2022 16:43:02 +0100
Message-ID: <20221105154303.274085-2-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221105154303.274085-1-pkj@axis.com>
References: <20221105154303.274085-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 15:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172751

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/externalsrc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 766c4979c5..686553f900 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -211,8 +211,8 @@ def srctree_hash_files(d, srcdir=None):
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

