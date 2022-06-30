Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DED8CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 12:32:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.24599.1656592332957349705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ckEicy38;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso1603895wma.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oqmI1XAct+sH2C/x+CvfG+ys4SzoIPqSSIvTyyaBPUo=;
        b=ckEicy38cW5XOGN0zQSvWP6QoLOFdY69seDskxu8UxVwst98u62+oIOWr6bMXeENkF
         Wd25IwLMBO1q5d/JKnCy/sCQfYZP+Ya5w++c3naIPiF7qo8U/KHPLI1VfXrbv6XQd/7r
         CN5Vj+pEdzJsIoR2LXnnr36SXzksd2C4WiHK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oqmI1XAct+sH2C/x+CvfG+ys4SzoIPqSSIvTyyaBPUo=;
        b=PP5eDS+FsfSP56H6zV1LssZHFTIH+5baM/l1Ei8VKC76Lrmd0MySBLTp2cLsCtZvxa
         l0Td+L2Fy3tBDTFvPA17rxgF0O4XwNjbWfySGeZuCdQuRwi9wpgUIerO2Q1bYCec8dxF
         PAtFXaIfSTq3SBRGQMJWknVuo3n8TbobRF0XvkR6093lP1xXf8ee6xKQtc7Mo9YEcv/Y
         PVYR6sx6nV8xzXUpL7EA7AFP7qeSxxcB/xdIzpBdb33wZl/oxMrD8FZJWa9TvSoFqvAC
         vpv53JQwJOYcID7f+vxAEjCnnN8zE9zEISYhmn4T33MohH92Af/9DIl8/u+gzxPrMjOU
         28Ug==
X-Gm-Message-State: AJIora8kqKN0lynYfgHL+KjnWpQ6jYJFes/HbECEciroDEHpvj3EqEk6
	1JymEdWAwKz1D/9bfQv4IV56m47szbpIeQ==
X-Google-Smtp-Source: 
 AGRyM1vWoCnRE8kTIAmZ+QadbVz638QX1BuVyt6oQE26zCL/Y1aUHgXQp7px9TXUrxzqUa/NuFNN0A==
X-Received: by 2002:a1c:4d10:0:b0:3a0:4697:4f5c with SMTP id
 o16-20020a1c4d10000000b003a046974f5cmr12052157wmh.22.1656592330834;
        Thu, 30 Jun 2022 05:32:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f06b:8b84:2b52:384a])
        by smtp.gmail.com with ESMTPSA id
 q3-20020a1c4303000000b003a03185231bsm6436622wma.31.2022.06.30.05.32.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:32:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-extra-exclusions: Clean up and ignore three CVEs (2xqemu
 and nasm)
Date: Thu, 30 Jun 2022 13:32:09 +0100
Message-Id: <20220630123209.650284-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 12:32:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167411

Remove obsolete comments/data from the file. Add in three CVEs to ignore.
Two are qemu CVEs which upstream aren't particularly intersted in and aren't
serious issues. Also ignore the nasm CVE found from fuzzing as this isn't
a issue we'd expose from OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../distro/include/cve-extra-exclusions.inc   | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 993ee2811a3..8b5f8d49b80 100644
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
2.34.1


