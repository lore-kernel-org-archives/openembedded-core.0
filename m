Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1683C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:21 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.16790.1667744299256948638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YlbBl3BJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id j12so8921198plj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ft6HUyaqo+7ND67X2uQ2Qn2LXuh9UNLbGI+GXq73Wyo=;
        b=YlbBl3BJbIC5aN+b6/9qEFtcWTavj4llZ/WvCPWhGQ9ck/GuL06XEJzhIE94Vrh2ef
         wH6y92tHlf+phCTEzxFDTy/D39awsALuOpeBayc0+MZ0xS1v9kP+yQLNpAgkfwHaTMaU
         cpl8yuuRa5DiWCLQuDUan6sC3YhbC2xkRxZVuprhfVr+G60jWvoFyIZdamn9OKi2I+Sd
         K72ppT+ZC4HSKmo987vB36wDU18iKrSahcflBYHoYVKpWhYZ0J+P57x6BG5p1wrUlChE
         KivYEAE3wu2hlnpzvxoABboteQ4nBDGtjDd4vsV/wTuxpCwpq3nfzYi7RPgCuLTNabxQ
         SOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft6HUyaqo+7ND67X2uQ2Qn2LXuh9UNLbGI+GXq73Wyo=;
        b=dIGV8DqH04gAuGPnTr4tDNmtZU+seTxVnp3875bZRLvgU9/3LHihrVqHemhE2Uwn6C
         zdEy3ElZzWMVKHWcByPuAOOPJlDUR2ec3v3aneusAdUSNoudpA/G+8xy/ilEhpWQnzwV
         quWfWDu1fx+EV15nRu1oUwx8I4Xvm/Ein7ilVZ0vTWkQhWULv9P/1RO2H0yVNm9IUiiS
         1H4L7yem0+bk/xoPSi5/G+b2X21F+4yjcwZsgJaTkc8udAL392FpWglT7gGNjf9RYy/a
         eUp7bG/mGemHdNKCAfW91N7A3lG/Z8J4JBUO4UrN8OAniQTp9vie3TqR8hnNy9TMalW0
         4OKw==
X-Gm-Message-State: ACrzQf1ajBL1mRM8ROe2LxC0WqEkLbAAkYBYFfPw43bY/xuap97HFBXU
	dC6uWQcgWH6bBA7e0US33Mko5O9iWHSW3JEx
X-Google-Smtp-Source: AMsMyM61PdEL/MNjHsLzd14UW3F6yEJhrHTrFExdF84Ufm+VjIuwvHo/NH81WJLN2nKa4SqMeOjg2Q==
X-Received: by 2002:a17:902:f60b:b0:178:6a49:d4e3 with SMTP id n11-20020a170902f60b00b001786a49d4e3mr46069603plg.75.1667744298324;
        Sun, 06 Nov 2022 06:18:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/34] externalsrc.bbclass: fix git repo detection
Date: Sun,  6 Nov 2022 04:17:07 -1000
Message-Id: <43d3a1a314cf4cab1b384ebf81e10610f18ed12c.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172792

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
index 06a9548a20..5905342589 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
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
2.25.1


