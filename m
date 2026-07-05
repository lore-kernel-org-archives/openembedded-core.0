Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC5EC43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 16:33:59 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.134078.1783269231639752824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 09:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VItiJdjX;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso760573a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783269231; x=1783874031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzImpcI0curI8O6NC1bHE2v1S4NmZb9uwlLVczIr2PQ=;
        b=VItiJdjX8n7lyUgI8Sc+6TgP/pzQyRM+ODe75tugZeC7G+kLEPVI2Mi76NickAum1U
         6RZP5YSqlDRPOo8sW2XKC4dX+juAY7RrqwBdcQRotBWO4R/7Nx4hqtqGe06kPjgbnEnL
         xD88C2wsYg/A8KEav05OeQ01km6O2wBwKx+ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783269231; x=1783874031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzImpcI0curI8O6NC1bHE2v1S4NmZb9uwlLVczIr2PQ=;
        b=UkLnKn5LHk84eo4U+OVxNUp9s9Op+ff3wvJJI1X10Yxr22OWQDWLgpmeO90wZL/7ln
         d4TweyHPehqGYqIh6n0/VYW/OHDuxDy8aZoNwiOoVzNdvHPN9VRopz95zFZTR1sF48MB
         Oq/uik/Ltlw1OaHlqZ1jkGZIUfEdHmCBFIb2bVc+F8Zj3Gx2sVg8AP+oRlX66o4xB22o
         ih/WHEbS46lavP2qE7JksFZk5yocmfgma6gVgUgq7qpLttqnIEXVgd6KCOQOduStlEbi
         Xb0SNXFgA3cqwlwO56lJB2PYthcdUm46ttYKFJ3bcJm3WkfBEivMYk8WHqbPc3bW+zOc
         ER7A==
X-Gm-Message-State: AOJu0Yyk53vWRe5Jwcy3VA35zqhtKjWN0uhsEqD7Vn9Z884AIBom3Szj
	8Jy88gmzhnpYCcSc+pgld5oGyDvkhYh8Icai0IQE7jvwAzYnNxQ1bTUWue1L/serfReW9SJhWPD
	hNoxPv+0=
X-Gm-Gg: AfdE7cliNPQt403wCt9DyuMm5rXpmzXR6QR2+rnscgVrATrXQgRhqCk+55UBvyW8b3I
	96M0gLFEbEGNHFZ0f7w43rcOQenXgNnwf6M+wcZRhFTdiyl1JVfWSEMJ0GjztBKCqJNrmg4oppS
	l+Nq1J3epA3U9yimPUoy42Y/EXT1ceUwKISrtvzj6v/+yHDQN1QX5hHPjc5kiYg3c8JEVp9ysIA
	O+0RWK44yu46r9ho+tjvB1sEKvsHyQyaZNWYJPcMSI2mtwgMAHdDW6hda3FyojRci/KcbGHMyBS
	s+iAF324cgO5LikuDXwEEgDfs3YAOqq/Lo3ohCe35SLt3Mh+jWs455PcLEgJe57ih4sk99HFhLn
	S3GIelWwmW+NK6/ueGycI1IClnerLiAEzmipQAfWm7hgU8+Dx5Xl3pY5Hko++xA9ADUSOo2y+Ol
	J6cAliEeRfi1Nmsi1s/nqaYWg=
X-Received: by 2002:a17:90a:ec8d:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-3829f7e92d6mr6851531a91.27.1783269230873;
        Sun, 05 Jul 2026 09:33:50 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.217])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc2e119sm43659009eec.28.2026.07.05.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 09:33:50 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] vim: upgrade 9.2.0569 -> 9.2.0782
Date: Sun,  5 Jul 2026 22:01:40 +0530
Message-Id: <20260705163140.319658-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 16:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240151

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed:
CVE-2026-57456
CVE-2026-57455
CVE-2026-57454
CVE-2026-57453
CVE-2026-57452
CVE-2026-57451
CVE-2026-55895
CVE-2026-55892
CVE-2026-55693
CVE-2026-52860

For full comparison of changes, see the link below:
https://github.com/vim/vim/compare/v9.2.0569...v9.2.0782

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b00b2602ed..ce22d957d6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".0569"
-SRCREV = "54ffef7eb83f2592833f422b89bf5f30de6b4bb0"
+PV .= ".0782"
+SRCREV = "834b8d218f1db92e587ecd449e5ce88b41fbe256"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


