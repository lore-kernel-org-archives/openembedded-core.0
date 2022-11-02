Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2090AC43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:18:52 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.2235.1667359125598366018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aUjcAavY;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id o7so11816360pjj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUu9sZJEATeSzilH61Fm4LARBv/Bp1WMmBbMY1nNyDE=;
        b=aUjcAavYQ3j2Z3rOLS51k7NtB4lNOckwa9RqdZvnHPEqwoWV9GtZm+tSVIVLmI6sdO
         mksldNOt08Dq/Qh5V4MXcuMM82BsFRJnEAMK/8DM2chEFpWuCqA7ysufZoorXGhHa+U9
         Rd7I9Sy7d+ChPg6JgEogUh9HO0LyU8+mKzQ34wRFtF0VeNipSJ5j/sxXK6phFCtB8GH8
         sehY6r1+0I4e4RwN6ynogDS2Ile1ujCJG0epPmM+qfnzPqmGfvwLTkbVLe6lidD9HueF
         di8EoVEhyvl6w5PgKwqmFYUciMsvbHDAZjTGElv+i/gLerL2cDlgmHSU0WFiagDpXQ9i
         VPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUu9sZJEATeSzilH61Fm4LARBv/Bp1WMmBbMY1nNyDE=;
        b=Hja4k/MTPIUu5ozmTRO9CzQPX6e44ECRzD9+GQ+MsNd0j5UYtSbNKx9RC7FSAVbJif
         5pP4pw4ooMDGDD4qZ5krpdBigaTHsSk3mmY1qGMr0FdOOgZBAULrz3Ssrm5a6sBuA5Fk
         4WcjFDrq4DbrFmwjQC0ie0KZ10ogSZ3uz1lbuDW+12KzIH0/Ke3yGXHwT7GCECiPf6QN
         SxcHV4TmvD+N0c/FZTXJEVpsY7C9DKej1VLO95Ix//wCKjGli1+uKebZg6wk8w6ESqNp
         1csJGMhx9Puo7VfqIKin2D9whnTg7pHfEhgClf/QexN95xQakMvZZubvSsKy5h0iuast
         UKsg==
X-Gm-Message-State: ACrzQf0r56S7MdqHPSTOx/A6zRf6CabCLIF/sRKjmHd3po9pT9jIKf3s
	sFYu0Rj5gtZZBPVyRBqS+cmSdBOm0SVqMw==
X-Google-Smtp-Source: AMsMyM4GCsA7z6uBC1FRKXBhcCHPPlZCLaapM6N85DgG57VMiOenV18xz2CDGNqn+947tUr2MGT0lg==
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id d20-20020a170902729400b00187146c316fmr16931447pll.149.1667359124586;
        Tue, 01 Nov 2022 20:18:44 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:44 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 03/11] python3-psutil: upgrade 5.9.2 -> 5.9.3
Date: Tue,  1 Nov 2022 20:18:22 -0700
Message-Id: <20221102031830.3606777-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172565

https://github.com/giampaolo/psutil/blob/master/HISTORY.rst#593

2022-10-18

Enhancements

* 2040, [macOS]: provide wheels for arm64 architecture. (patch by
  Matthieu Darbois)

Bug fixes

* 2116, [macOS], [critical]: `psutil.net_connections`_ fails with
  RuntimeError.
* 2135, [macOS]: Process.environ() may contain garbage data. Fix
  out-of-bounds read around sysctl_procargs. (patch by Bernhard
  Urban-Forster)
* 2138, [Linux], [critical]: can't compile psutil on Android due to
  undefined ethtool_cmd_speed symbol.
* 2142, [POSIX]: net_if_stats() 's flags on Python 2 returned unicode
  instead of str. (patch by Matthieu Darbois)
* 2147, [macOS] Fix disk usage report on macOS 12+. (patch by Matthieu
  Darbois)
* 2150, [Linux] Process.threads() may raise NoSuchProcess. Fix race
  condition. (patch by Daniel Li)
* 2153, [macOS] Fix race condition in
  test_posix.TestProcess.test_cmdline. (patch by Matthieu Darbois)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-psutil_5.9.2.bb => python3-psutil_5.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.2.bb => python3-psutil_5.9.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb b/meta/recipes-devtools/python/python3-psutil_5.9.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-psutil_5.9.2.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.3.bb
index 5b31014657e..f0998031503 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.3.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "feb861a10b6c3bb00701063b37e4afc754f8217f0f09c42280586bd6ac712b5c"
+SRC_URI[sha256sum] = "7ccfcdfea4fc4b0a02ca2c31de7fcd186beb9cff8207800e14ab66f79c773af6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


