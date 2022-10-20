Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CE1C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 23:04:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.4034.1666307045121148978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 16:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ih9VCaD5;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id b2so3099941eja.6
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 16:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j03To0T4T4xzI10RrbIgHhn9qJu45BqTIyqh1PwbBQ8=;
        b=ih9VCaD5fDn1f7cVaNlFeHaT0ML54kVPR3LodZUN5WD2FbqxS4cDG2g+JhuWQRNHo4
         QMFi9bBVCNMjHt2J36xotcauH+T6XM0BeCvCdTpzpUagEABRux4r3CaDCaHSX5Sfd/4X
         zHG2YwiKMZto8W3xLW+4zfggpNILx8C5rlar5bDnCxFVS0+b3rSyxU1/t6xTI1yw0ZeE
         H3oDbsGhAHxQq0Tgvr6yM531NF+eVKHWKESOExDte7aspa5WudGam3nEScg4Bxx3Xr8D
         WmO9+kfbK0PDeAurKOvmcZ7lPQjTowGrcJ7CFnsaVoYqGb8hRbySq6/7oltx+ZSawOZj
         5uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j03To0T4T4xzI10RrbIgHhn9qJu45BqTIyqh1PwbBQ8=;
        b=VcLRTkYddfvY7Qj2a37RjcrFvuIdbiOueIREXnI4qQkMQxaQNvMINb0lauZw1wBQ2F
         EhRPacJTuubOXJxA9FxvC/bDJhVCzoEp7OagMIMAoi9jDAwNGZW5JAIlV3LeXsCz9A5B
         IStfk9oZeulMAau1fhi2qr0XGt+DrTrWy+E3n7BawwXiat1xE/6zDlDC7gaoo+6phkqy
         C9hDgdGmB9tIULz7CrL1CikUNn5VxAIPJttHumHSB167vMtlrPlf82wazOqCvYPBAdB3
         8zAG7NS1dki7T70XcbCimvs0ufMfUMogqPKOrA8WPT6Mq019HrHFFnh8jGXzMxemcuqH
         QeDQ==
X-Gm-Message-State: ACrzQf1xHw0GhetE8v24f0y2u4ERafBVyz5KV/OCXgSr5GbVpZ72EiGP
	QyTa2e83uwOY/axxLLv10H0yvpLxXJYx4A==
X-Google-Smtp-Source: AMsMyM4QdLiDgpi8QQnnsoVGBwFdzjwNyPp8d5MkpzsNSs4uUWqy4vVlUdVz/HWzov5xSZavzdk+6Q==
X-Received: by 2002:a17:907:160e:b0:791:8ae7:4fb8 with SMTP id hb14-20020a170907160e00b007918ae74fb8mr13483743ejc.271.1666307043566;
        Thu, 20 Oct 2022 16:04:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b25-20020aa7dc19000000b00443d657d8a4sm12590360edu.61.2022.10.20.16.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 16:04:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: tomasz.dziendzielski@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] externalsrc.bbclass: fix git repo detection
Date: Fri, 21 Oct 2022 01:03:51 +0200
Message-Id: <20221020230351.2712106-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 23:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172007

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
---
 meta/classes-recipe/externalsrc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/externalsrc.bbclass b/meta/classes-recipe/externalsrc.bbclass
index 06a9548a20..5905342589 100644
--- a/meta/classes-recipe/externalsrc.bbclass
+++ b/meta/classes-recipe/externalsrc.bbclass
@@ -212,8 +212,8 @@ def srctree_hash_files(d, srcdir=None):
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
2.38.1


