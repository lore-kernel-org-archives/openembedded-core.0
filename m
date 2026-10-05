Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59984CA5FE2
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 06:54:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14290.1791183235954390028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 23:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o1TlWRUE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486e70f2457so539898f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 23:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183234; x=1791788034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UHRM2AUGTIS8ptPnW10/2NIvTgnc+FhcBnHwsCp4zQ=;
        b=o1TlWRUEX0q3foEFoeaBsbrjaDa1lexAgbSRgbhXnyjKaKbVDR80x8QVlubCuDDVrw
         zuZzFbtnKSCqHlkGLwuHKk9LkT1H6F9LWtKE35N5KXUbnhHWaK7vVMdtUarnQQ6sjQPF
         YP/DQw6t3MFmCml9qTRH0Dntk54JsgHWSANMokE2yWw+Pd1eyqBvipXQrPBhZhkLgQwZ
         pk52/3w5iRBiiUVbXr8fI5XQ+aD+HqERJgUhIIAGbWH9WMOm5zuwysIpIH9Y+9qJIpIM
         7VSuktbdB2w7dfOOo8lkWbL5wB9zYlLjAgIcgMLqaXgMfHA+X0Y1uYRGRR5baKk3yyos
         aI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183234; x=1791788034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UHRM2AUGTIS8ptPnW10/2NIvTgnc+FhcBnHwsCp4zQ=;
        b=irHfQH3vIL+0fDYPsvRSDN/G+uUOfAAC21f7gAnDQVHh+Dc+FYrJH2v4g4AaLsqp0v
         9M1rwqtl8f6UiE0BRNOrGpOX7jYcnqVloe0VKFF9ACe+ibJjDtEYgoBQxFYD38KlJmJw
         psyMCHvPHd1ibnP8fMLPIo2Lw5ZPML0yqbDtzpU2RRiLXy/wIwnd1c0j8Hr3Raqp0p9y
         cSu/KR8C/yydNIlDpTVA8t5s0cvw/sUVLgGXObmgoTBEmQ0ljpiWjILGGIlxnXSIqd+1
         7qL4M0F6aVKoqjrjqvxC5luhdmmayENhiKjJWo04d+ltFuw+57+TWG0vFnpr+RjuhCK+
         pisg==
X-Gm-Message-State: AFq9FYLtmkUC5PAqO5UIxoadyHRr3jjVCBgqvom86VllAi0JUcKRE6wp
	LbNQkQwfCz8NlMzd9qYEeCr031kdg/xXNZuwt3nTVZs6LUXrWesS+zCYxxD3Gw==
X-Gm-Gg: AYBFou3v3bhNI4lmKqjFM9e4TE3dpxPGsggriM0E5eskw9wWYQdekSSc5HGYKG4haJ8
	kdrLojdoM5Zo9t2uKJdMBQTXx9NJiu3NQRYQ7N34zh59DqxfJ6W21b6bs8xpSe/mIALqzWjr8pM
	mzn8sSzFoPPoQh8zMGfys5BoSyvb3Jna8YQNW06RQgr66qHA1Sw0n6W2EAmpRErp8yYTBG010nJ
	vGZ9yVlkto4dnjtL+KKixWIFmg7KViihaSmCwugpyDVCUsEx0mkk8ou1kcj5WAVh78Acz2GNb/5
	NFHpgeteog5ST20Kp8Ygssbi1IbBsSQucQeyR5YJe3xfvwInPxSbc0xmipglEwo5ktWMiIQrQbX
	z8YOkjuU0TBHdpakxCvmcmeF+4+YmjbizDnIthjvlpisbl+klC+IduPzLMftQN2S7bVzPWk2Edi
	BP5M6Pt4lANtq061fAKxD6AiXOpAyDI/hqxfJoLD9SPwqr8BN7nTC097Fr7P9g0GYIorHMMcNCo
	RAmHNVqGJp6TRZhckkI5vxLlNHNNMUavFU1a0y948SaELcesziofhGLpZJC
X-Received: by 2002:a05:6000:98f:b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48c47c66e18mr10015464f8f.1.1791183234028;
        Sun, 04 Oct 2026 23:53:54 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm1487592f8f.41.2026.10.04.23.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:53:53 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH 1/3] sstate-cache-management: find work-shared stamps too
Date: Mon,  5 Oct 2026 07:53:21 +0100
Message-ID: <20261005065322.30522-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 06:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247217

remove_by_stamps() collects the hashes still in use by globbing the stamps
directory at a fixed depth, "*/*/*.do_*", matching <arch>/<pn>/<file>; the
fixed depth is deliberate, so that the walk does not stat() the whole tree,
which over NFS costs a round trip per entry. But the shared-source recipes -
gcc-source, llvm-project-source and rust-source - set STAMP to
${STAMPS_DIR}/work-shared/<pn>-<pv>-<pr>, one level shallower, so their
hashes are never collected and --stamps-dir plans their sstate objects for
removal while a build still uses them. (externalsrc's work-shared/<pn>/ is
at the usual depth and was already found.)

Glob that layout too, at its own fixed depth, rather than recursively.

Against a cache shared by eight build directories, the stock script
planned 740 of 91486 files for removal; 43 of them, all gcc-source,
llvm-project-source and rust-source objects, had hashes in live
work-shared stamps. With this change it plans 697, the same list as a
recursive "**" glob produces. Filesystem calls during the run (strace):
353084 before, 353196 after, against 377568 for the recursive glob.

The shell script this replaced used "find $stamps -maxdepth 3", which did
include them.

Fixes: 2fa1b25d7485 ("sstate-cache-management: Rewrite in python")
AI-Generated: Claude Opus 5.5
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 scripts/sstate-cache-management.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
index f5737004c544..d088878a92df 100755
--- a/scripts/sstate-cache-management.py
+++ b/scripts/sstate-cache-management.py
@@ -142,6 +142,15 @@ def collect_sstate_paths(args):
     return paths
 
 
+# Where stamps live under STAMPS_DIR, each at a fixed depth: globbing those
+# depths exactly, rather than recursively, keeps the walk from stat()ing
+# everything in the tree, which over NFS is slow with a round trip per entry.
+STAMP_LAYOUTS = (
+    "*/*/",  # <arch>/<pn>/<pv>... (bitbake.conf); also externalsrc's work-shared/<pn>/
+    "work-shared/",  # work-shared/<pn>-<pv>-<pr>... (gcc-source, llvm-project-source, rust-source)
+)
+
+
 def remove_by_stamps(args, paths):
     all_sums = set()
     for stamps_dir in args.stamps_dir:
@@ -151,14 +160,16 @@ def remove_by_stamps(args, paths):
         all_sums |= set(
             [
                 re_sigdata.search(x.parts[-1]).group(1)
-                for x in stamps_path.glob("*/*/*.do_*.sigdata.*")
+                for layout in STAMP_LAYOUTS
+                for x in stamps_path.glob(layout + "*.do_*.sigdata.*")
             ]
         )
         re_setscene = re.compile(r"do_.*_setscene\.([^.]*)")
         all_sums |= set(
             [
                 re_setscene.search(x.parts[-1]).group(1)
-                for x in stamps_path.glob("*/*/*.do_*_setscene.*")
+                for layout in STAMP_LAYOUTS
+                for x in stamps_path.glob(layout + "*.do_*_setscene.*")
             ]
         )
     return [p for p in paths if p.bb_unihash not in all_sums]

