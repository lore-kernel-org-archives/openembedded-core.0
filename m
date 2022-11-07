Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194C1C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:38:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.115.1667835456907454451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2VHFL/bF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso14960480pjg.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEUqDzuLoXr5AyaS/RjATwRj/Do/jAjUgeQZWnbjzZU=;
        b=2VHFL/bFOEaMez/5SG4SUWjq3bncKyi4J2jmz4dD2I/EYNSa7dVJscBEpcj0DdRh9w
         qnJvx7KF62vkhW3jX+2xrGatVF4jYUCFX/Zqxp6QlcNzIIBqqLy1g60hA3yFF4xDTgDD
         9h4qrHb9ZeFW5BCer+mwhCqvrl8IhKxpcp2C9aeVVueHO3wi9YK3WTCRFe/Nj0xoWkuV
         viwGeuztI0u4FWmGYfj/ND49tE/2r25RTJ5Q4VRjO0sXxtcQ51l05eJBMUSOAc2em20N
         y9BF2FWu9Oexg568T5b9vruCbkQ4RcaOI8H45qk7hbDVvhYIQt+t8WbW46H1iUZJVOb1
         ywZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEUqDzuLoXr5AyaS/RjATwRj/Do/jAjUgeQZWnbjzZU=;
        b=qMdbSFUgBqK6+v1zkcqA5dkw93Z5Gi5kmyo1ODw6LBujHIFQAoqjXpp3oiHIOGN7Ln
         I0BqL7UN6OSnvJsreKtARYlD9m4S+YNpJBsHIoDtx6CFtXn+YTU1YXQJX5YOxxjs9t55
         SKccoVsZ+AMU1JrcWk3C6RcZMDWABQ64FsdyJFUVQiEtxoN7/3bxJDx/uss7KMDgGcc+
         Yy2IDkk34czQG7SfCF39bpJZCIsZA5iwQ27lVeD4142EmRGhA9AgKD3a5AC9D7mGytTn
         AiBO9mDx20OFJaxLhCn9KtH8EHKPzZuPHpZBSOT7tIiDJID47vxGFXk+nawDP+KbGR+Z
         YmXA==
X-Gm-Message-State: ACrzQf3oi4UN1PDMPWIol7z2VvVB74sYuCRkSw3VhvlcfOz74iFInKnl
	gDAhCfpkwJ/iXVm/PSAQV6F2GAygFM9UU8ZX
X-Google-Smtp-Source: AMsMyM5/x6O8K0b1+ZFRXISou1XzZYdvzCQBieio0tkCA6d06N6ucZI41fYOnJCxu56p3Bh/cNalAQ==
X-Received: by 2002:a17:903:cd:b0:186:878e:3b08 with SMTP id x13-20020a17090300cd00b00186878e3b08mr50420954plc.93.1667835455900;
        Mon, 07 Nov 2022 07:37:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/25] externalsrc.bbclass: fix git repo detection
Date: Mon,  7 Nov 2022 05:36:39 -1000
Message-Id: <1b1b9756c5e50a9b195f774b902881a9b0052f69.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172919

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
index 8136d25cb1..880556b834 100644
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
-- 
2.25.1


