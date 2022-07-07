Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34764C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:01 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.743.1657231193066277454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 14:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gOjZpkYW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id e132so20792056pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 14:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TIHMy5xh4RTXZiyynxqXD68u99jt1/KIR0Tqy8Wdsh0=;
        b=gOjZpkYWQBHVJnCw4MLhLthjsLunwUv0FnagGDucqPstrcQzIOQWl00laDFtF/MBlQ
         Lxllsm25teojFafMspL/bRB6Czv1ClnVF9cFoU7kd9sPrXmBk0aT5B0s0IZXfmcxTRU2
         KEP1lTrKBH3FAQwls479S1yKchFOb22iFONm242k2tjeEfn+/XdpRI+7LLCWqZrSF1OD
         0QUE+FxHDqn6GVmCXpPs8zz2iAOu/aVMWHBgMYKB+dkGg8eFdBxDMYRy3mSf8vL9jwfj
         APa3UFw+e2/JY/kwLTYPDPVmBxRS1vwKVTTxWQ4ho24/B0UytshmsjpT92HuSiL2Ydx4
         lbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TIHMy5xh4RTXZiyynxqXD68u99jt1/KIR0Tqy8Wdsh0=;
        b=yZ7ECimePy4g3IMKwq546dPc6jb4H5mmZlVwHqS+gczafusIhOZmoXxzgdLSVL8C//
         GuN4Wbw6IzzDEI+vebPZ8r3vX25MB+VhMEWWppWp3IQpCmWIHIPcZiJJAG2c554S1MsF
         UvEdI5WfLwSkb1Rfjda0EUGuFK0vOsEfrEIjMlE5pGJ93bbiGcExs7ogn/GQ8aoqs9Fn
         pSylqozCEslmuhjFo3xPD5a2kx4vo7xJqhlHH7FdABP8546F9W9AEl4XH0aI8PW12oFv
         wYkEPx53rCnViCRDvMXzArVwbDfXW5EwgZ3vg1kAO33312ceCtLEpDOt5IL1yniWVb3M
         gakg==
X-Gm-Message-State: AJIora+hAIEr/AlSH9lfRpv6RH+d1C4gtKGCV9ByBE0CfDTsEXUfwRwZ
	dIrH03H75uLPt6ChMYHRCyOWe0uTZ11U1/Cz
X-Google-Smtp-Source: 
 AGRyM1tzIaY8HTIAlxbOZtb+AryR52iDWhDj0VNoBEILgaHT2s2AVnm7jae2QLUWbqC4rEoYQcGAIw==
X-Received: by 2002:a63:5c5e:0:b0:412:a2f1:d0dd with SMTP id
 n30-20020a635c5e000000b00412a2f1d0ddmr205606pgm.251.1657231191698;
        Thu, 07 Jul 2022 14:59:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.14.59.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:59:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] cve-extra-exclusions: Clean up and ignore
 three CVEs (2xqemu and nasm)
Date: Thu,  7 Jul 2022 11:59:23 -1000
Message-Id: 
 <b82c95720488eea8ea4b5684c9f89e4931085fa5.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167799

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Remove obsolete comments/data from the file. Add in three CVEs to ignore.
Two are qemu CVEs which upstream aren't particularly intersted in and aren't
serious issues. Also ignore the nasm CVE found from fuzzing as this isn't
a issue we'd expose from OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68291026aab2fa6ee1260ca95198dd1d568521e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index e02a4d1fde..70442df991 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -53,24 +53,23 @@ CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 
-#### CPE update pending ####
-
-# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
-# Appears it was fixed in https://git.savannah.gnu.org/cgit/groff.git/commit/?id=07f95f1674217275ed4612f1dcaa95a88435c6a7
-# so from 1.17 onwards. Reported to the database for update by RP 2021/5/9. Update accepted 2021/5/10.
-#CVE_CHECK_WHITELIST += "CVE-2000-0803"
-
-
-
-#### Upstream still working on ####
-
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


