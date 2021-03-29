Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.16348.1616987282935730156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 20:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MxT0HlL3;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id s2so8407136qtx.10
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 20:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bewA6xy+3RLZ80j+ZIed2dlaigXJj/GFAHVfZmcpKE0=;
        b=MxT0HlL340Lcp2itZ6/nfP3sgnGcwP4L6XlEOuRMnrFs3bXi7yBau0o7jLYbPJzRyg
         Y7wo9zLXEgVLwv0AASaCg8WaLlmCOXGaJLs9YI1CLqVG+fmvgqkgRRrmzK1dxmTd4sSt
         O4XC+dux0mAr5DGxkHoNSfPdaKtr+CUnMQKY/wiGfCxpa3onUFtFJu9ek44QwFJpzuTC
         SmK+R5PaSCvy2TWJgXhhkdbFAJBP249fdNI90nxNRqtMCuo5bMXVMgbO/sVAWR/YHdIv
         QTDG1X5WCOZcw7lNIYOERvrZsFdru7hFxkUIeExwxy8zmWeKo3CQ9YpFtEqrItHN4OPq
         L/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bewA6xy+3RLZ80j+ZIed2dlaigXJj/GFAHVfZmcpKE0=;
        b=QxRP08ELI0Shv5kfDpTZvNNCJixEHSIifTi/IlmjUIO+cQ7Uf0YFbqleuq6bVKYM+3
         uGGitfInXsDvFZklTW9XHs77jE0td9vtQ84Cx5XiWuC3LtgrO/fD+79Ho91f/ktrr2V0
         j1gJNOq4+KUlnqk//iaS/ocnvtMepR1aZX5QrUs+WHrY0fuZnM7AOqYlvOzrnjGGkVA5
         b9m4xJcyt/HFwut8TYRFn1wBQUV7/EIIvnlnaIK+0XXuydG4p84/eD0p6aD9dUiMny9q
         VXk2qcCMWN5iA4zqXl+DcOFlnRZbiOw3TMmAzzekMt5apRsDb32NT9rw5PGFUbh2FR7i
         vzAw==
X-Gm-Message-State: AOAM532K08TXYIOUPlZpsipn0ipKH4pGdLRISorPFFJ4LjyVzoypwsFM
	F1dA0VFMp6d88hY/GPCoelk=
X-Google-Smtp-Source: ABdhPJx6+IEdgnOjfW2qkSBl4ambQW+v6EC7Bg9jIxi770fS+cPglULOcrBxJWwyogTtO/04yNpeLQ==
X-Received: by 2002:ac8:1302:: with SMTP id e2mr21416948qtj.151.1616987281988;
        Sun, 28 Mar 2021 20:08:01 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id h75sm12295696qke.80.2021.03.28.20.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 20:08:01 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf-tests: add bash into RDEPENDS (v5.12-rc5+)
Date: Sun, 28 Mar 2021 23:07:59 -0400
Message-Id: <20210329030759.13790-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream commit:

   commit 1dc481c0b0cf18d3952d93a73c4ece90dec277f0
   Author: Leo Yan <leo.yan@linaro.org>
   Date:   Sat Mar 20 18:45:54 2021 +0800

       perf test: Change to use bash for daemon test

       When executing the daemon test on Arm64 and x86 with Debian (Buster)
       distro, both skip the test case with the log:

Changes tools/perf/tests/shell/daemon.sh to be explicitly bash
(it was already required, but was just skipped on various
distros).

We add it into our RDEPENDS for perf-tests to fixup 5.12+
builds.

We already have relatively heavy RDPENDS for perf tests (python3), so
adding bash into the RDEPENDSn isn't signifcant even for older perf
builds that use the same recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index edb1335154..e5e5a0d267 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -324,7 +324,7 @@ RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-RDEPENDS_${PN}-tests =+ "python3"
+RDEPENDS_${PN}-tests =+ "python3 bash"
 
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
-- 
2.19.1

