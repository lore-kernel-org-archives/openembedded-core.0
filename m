Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C5DC3F2D4
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.64394.1656877003457662009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zu4Ow74D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id 5so960567plk.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LnnBk7L6z45t8aTRRBnqzXg2OPzv3ec56uaT/1D2DpE=;
        b=zu4Ow74DWT2WIUnxREvAe2LoaK9zt/87wK7aElpOKGEJd1ku3fAu95Wka/CP96oriX
         fiHemwrVKH/xSnTGRBDOfOeOPCNUOkLOaf5Nl16uC31JeDOm1fX+LyAHB+N6/B2EQzTt
         bQCyZQErdGmK7kS1wZBNfVcnRmHL/nbRN0DO6DzBJIe8ozjHAqgm49wR9QIPHVADqPGw
         3BfyhUlRv6N7mDgbxC52V8vEvXV/P/SjCpRWs50PXPquqiLhM1yYWKAL8ngCkReNl6YT
         0lUno81IsrID0OvdVGrVlHamBinA+zh3VaZij90bifP8hAC9cPS7g2FnWNO08s7Mex/X
         oB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LnnBk7L6z45t8aTRRBnqzXg2OPzv3ec56uaT/1D2DpE=;
        b=NlokZW7CagjDapk5VuL7Yjlx5y78i9Tjp2/W7QihxL6Bbaqav0BZCHFGe3cEQKNvSO
         cwStBjxMBUAlTbi3pVvHmqBaZ2eu3teJ2KQefWyxT2K4LFqN7fSUtEfdnWPCy/nbK/j6
         4JrT/aRXBLnWMtAbjvlgLgAU2QRL5EFxNLDyV14pA7HHVXV/Ywehfv5pp6wLz6HSDZop
         YdADlu7aoBl7oe/l8c4xobKJN5xzvYb3xbajUbeM0oCM4un5wbE/CRmM/6ED2p02E+Cn
         /NwWjvcZpJcq2q9DI0y/f8OMMrXyut8SJ2lSIpr8r8cSwEXrqECyvD06Q3CyuFWkxI8w
         Fpqg==
X-Gm-Message-State: AJIora+UlSVwHm+nSpd4RU+bMojY0i/IY21HSsmABqEj8TjnI4HHWw7X
	Pw6yX+I4BhhWTP9kAGgCi7WMAq0HlXWYXFi/
X-Google-Smtp-Source: 
 AGRyM1sfmPDI9tZoGs1PkYgZ51wFwOMmOMpORNxg5vTBT7fUp3CgjTTyOg23oaylx5O3oINEYO6qqw==
X-Received: by 2002:a17:903:185:b0:16a:6113:c01 with SMTP id
 z5-20020a170903018500b0016a61130c01mr33767306plg.113.1656877002429;
        Sun, 03 Jul 2022 12:36:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/30] cve-extra-exclusions: Clean up and ignore
 three CVEs (2xqemu and nasm)
Date: Sun,  3 Jul 2022 09:35:41 -1000
Message-Id: 
 <94fad58c6f10d0dfc42be816b0a7f6b108bd03e6.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167566

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Remove obsolete comments/data from the file. Add in three CVEs to ignore.
Two are qemu CVEs which upstream aren't particularly intersted in and aren't
serious issues. Also ignore the nasm CVE found from fuzzing as this isn't
a issue we'd expose from OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68291026aab2fa6ee1260ca95198dd1d568521e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 993ee2811a..8b5f8d49b8 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -90,24 +90,24 @@ CVE_CHECK_IGNORE += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE
                      CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE-2022-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
                      CVE-2022-29582 CVE-2022-29968"
 
-#### CPE update pending ####
-
-# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
-# Appears it was fixed in https://git.savannah.gnu.org/cgit/groff.git/commit/?id=07f95f1674217275ed4612f1dcaa95a88435c6a7
-# so from 1.17 onwards. Reported to the database for update by RP 2021/5/9. Update accepted 2021/5/10.
-#CVE_CHECK_IGNORE += "CVE-2000-0803"
-
-
-
-#### Upstream still working on ####
 
 # qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255
 # There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
-# however qemu maintainers are sure the patch is incorrect and should not be applied.
-
-# wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879
-# https://mail.gnu.org/archive/html/bug-wget/2021-02/msg00002.html
-# No response upstream as of 2021/5/12
+# qemu maintainers say the patch is incorrect and should not be applied
+# Ignore from OE's perspectivee as the issue is of low impact, at worst sitting in an infinite loop rather than exploitable
+CVE_CHECK_IGNORE += "CVE-2021-20255"
+
+# qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067
+# There was a proposed patch but rejected by upstream qemu. It is unclear if the issue can
+# still be reproduced or where exactly any bug is.
+# Ignore from OE's perspective as we'll pick up any fix when upstream accepts one.
+CVE_CHECK_IGNORE += "CVE-2019-12067"
+
+# nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974
+# It is a fuzzing related buffer overflow. It is of low impact since most devices
+# wouldn't expose an assembler. The upstream is inactive and there is little to be
+# done about the bug, ignore from an OE perspective.
+CVE_CHECK_IGNORE += "CVE-2020-18974"
 
 
 
-- 
2.25.1


