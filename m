Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C21DD711B5
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:03 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2026.1766089379755992454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F3oTYZX5;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ba4197fbd4so115725685a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089379; x=1766694179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEP27RjPnQXgdlW/0wJUv+B78+EqEQbpv0BdZU2M20o=;
        b=F3oTYZX5kI8TKkuuOBVVwfxefhlqG6LauKgF4ciQJwfbekg4P9cYx49mk0JVA+kB86
         TlEZsSiWvKocwQfohwuwMiyqWha70LFZ/ixIPQjx42lZWWJxtNYxVWFoEfPIJf9RlI+/
         NZOdMzH0xTp5PL7o1pKjQh+Hrmrz3gI4NcTdaBT86kt3kXAYuTxBGJHoP5vcadneoTPU
         ZcrwECVwZdpShVLeF5v+b3rWncPLPXpsz6Nhrly+7LLO8WWPaPV+FDF7nk9QRgyFsFL0
         b0gV7kEMqtyYpW2bVigiVG/bA/EQIk68j18+tPnBizWCYCGTb/GXJqzTxjr0QWQHxPLk
         whtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089379; x=1766694179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WEP27RjPnQXgdlW/0wJUv+B78+EqEQbpv0BdZU2M20o=;
        b=NGYBteRIn+QfrJKT1d+Z1f1+fRmJcaz2Pyi04usu1CAYEcg5IidF5oBucZAuNhcN+R
         Sdx2rUohRNGsl3WRnA3gkqhcB95nCjpSNfPnyn6XVcZ7xEAaGdMHyPU5shk0AFrIRbD7
         07mY3seThkxVD8+mN8+KKM9NjnyFlkIbHxzE9ONE/ozGXfarc/pbfych93CpfIc0+/Km
         uSGN7m7y47DmQRDRcD0g7QN1gwD2kXnr5RPBNXsKsOcKxLdOfv+YWL0oVOFT99zzbXBB
         5RSRLAxPRfiHulUqJuw+F7O4Ti1VFE2zd37+9yWaUTGYhlTdVUP/MdsvOU+7m8JwTzSy
         5WGQ==
X-Gm-Message-State: AOJu0Yy/ZLa2z6NOG/mHxmIx9YM/df2mK1q6Gy1IbV8P8bfO4+NGdMAJ
	gxEIR70Rnw9lCwLnTxyj0/P2OM3uKIaAz2/7WiH9u5CoLaSBcouz+umv6MbPOSSmQsI=
X-Gm-Gg: AY/fxX6IWYciC/HOLeSDiN+otV089e6opdkZ4OC6kiuKJC4LrpcGTw/PRR/kipBOr9m
	oLbPn3PaJRQmwzZJ2ecODatgzGdNwLMvG4nfu36Ti8GXPkbVmkaIlV38mJ1Tln2aGZkrKnOsctz
	isEVaijSjMBeAXgJoqIPoxvobDCDr2+34+p5pMnDZOqdAFz7XENGykpCGBs7HyE4fRg7LsCoGw1
	uU5FnOz6KznwZ8kWvDY/7gvcKD3s2loco8pqGCjjrCIbLfmn4WFedkJskwMRoMZjVMGTpon3opr
	fWMulhLwQf+YClHI37fC2tkiIGKY7c2ldohnCcqpS98Ldr8+LhTJnr6FtTbEOvqOWRiKGwco3Bz
	V9gGkrDLoWw79vna6bzOxDKYrlUr/tpARP6xlYPlJJVYfnuJhaBOviDMH4rzdIwpD+Q6c4th5+6
	m5bp2e0RkJIIqoY6OxIsGegdEYLLMqeHjwbtGRaSvDALIn2+VwGO1f4kp8+lw7lDbS17AtKcF7i
	E1F9bn/+mB+1WCeecuincevSw==
X-Google-Smtp-Source: AGHT+IFgzsktNb4dDCuJ1t41dAHoakMYUMbte2pcnynlC+uXQQf9bvak42Z4Re5lc8D4uuhY9Dr33w==
X-Received: by 2002:a05:620a:4509:b0:892:8439:2efa with SMTP id af79cd13be357-8c08f66d4a0mr142582685a.23.1766089378443;
        Thu, 18 Dec 2025 12:22:58 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [08/15][openembedded-core] linux-yocto/6.17: update CVE exclusions (6.17.11)
Date: Thu, 18 Dec 2025 15:22:33 -0500
Message-Id: <20251218202248.70476-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228151

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 15 changes (3 new | 12 updated): - 3 new CVEs: CVE-2025-13642, CVE-2025-61074, CVE-2025-61075 - 12 updated CVEs: CVE-2024-38798, CVE-2025-14328, CVE-2025-14329, CVE-2025-14345, CVE-2025-40940, CVE-2025-40941, CVE-2025-63074, CVE-2025-63075, CVE-2025-63076, CVE-2025-63077, CVE-2025-66627, CVE-2025-66631
        Date: Tue, 9 Dec 2025 15:24:29 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.17.inc              | 632 +++++++++++++++++-
 1 file changed, 627 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
index 0dfce88303..0f9e499d90 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-01 16:25:15.356251+00:00 for kernel version 6.17.10
-# From linux_kernel_cves cve_2025-12-01_1600Z-1-g77d6c1b8483
+# Generated at 2025-12-09 15:30:33.713956+00:00 for kernel version 6.17.11
+# From linux_kernel_cves cve_2025-12-09_1500Z-1-g085e057e2ea
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.17.10"
+    this_version = "6.17.11"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4028,8 +4028,6 @@ CVE_STATUS[CVE-2022-49907] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49908] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-49909] = "fixed-version: Fixed from version 6.1"
-
 CVE_STATUS[CVE-2022-49910] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49911] = "fixed-version: Fixed from version 6.1"
@@ -5328,6 +5326,140 @@ CVE_STATUS[CVE-2022-50581] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50582] = "fixed-version: Fixed from version 6.1"
 
+CVE_STATUS[CVE-2022-50583] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50614] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50615] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50616] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50617] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50618] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50619] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50620] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50621] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50622] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50623] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50624] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50625] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50626] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50627] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50628] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50629] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50630] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50631] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50632] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50633] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50634] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50635] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50636] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50637] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50638] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50639] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50640] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50641] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50642] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50643] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50644] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50645] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50646] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50647] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50648] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50649] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50650] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50651] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50652] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50653] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50654] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50655] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50656] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50657] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50658] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50659] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50660] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50661] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50662] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50663] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50664] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50665] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50666] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50667] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50668] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50669] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50670] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50671] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50672] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50673] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50674] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50675] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50676] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50677] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50678] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50679] = "fixed-version: Fixed from version 6.1"
+
 CVE_STATUS[CVE-2023-32246] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-32249] = "fixed-version: Fixed from version 6.4"
@@ -7674,6 +7806,238 @@ CVE_STATUS[CVE-2023-53732] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-53733] = "fixed-version: Fixed from version 6.5"
 
+CVE_STATUS[CVE-2023-53742] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53743] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53744] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53745] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53746] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53747] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53748] = "fixed-version: Fixed from version 6.4"
+
+# CVE-2023-53749 has no known resolution
+
+CVE_STATUS[CVE-2023-53750] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53751] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53752] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53753] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53754] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53755] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53756] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53757] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53758] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53759] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53760] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53761] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53762] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53763] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53764] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53765] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53766] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53767] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53768] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53769] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53777] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53778] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53779] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53780] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53781] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53782] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53783] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53784] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53785] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53786] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53787] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53788] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53789] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53790] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53791] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53792] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53793] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53794] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53795] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53796] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53797] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53798] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53799] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53800] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53801] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53802] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53803] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53804] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53806] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53807] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53808] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53809] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53810] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53811] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53812] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53813] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53814] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53815] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53816] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53817] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53818] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53819] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53820] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53821] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53822] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53823] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53824] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53825] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53826] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53827] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53828] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53829] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53830] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53831] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53832] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53833] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53834] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53836] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53837] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53838] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53839] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53840] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53841] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53842] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53843] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53844] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53845] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53846] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53847] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53848] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53849] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53850] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53851] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53852] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53853] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53854] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53855] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53856] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53857] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53858] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53859] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53860] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53861] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53862] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53863] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53864] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53865] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53866] = "fixed-version: Fixed from version 6.3"
+
 CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
@@ -17900,9 +18264,267 @@ CVE_STATUS[CVE-2025-40212] = "cpe-stable-backport: Backported in 6.17.9"
 
 CVE_STATUS[CVE-2025-40213] = "cpe-stable-backport: Backported in 6.17.8"
 
+CVE_STATUS[CVE-2025-40214] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40215] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-40216] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-40217] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40218] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40219] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40220] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40221] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40222] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40223] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40224] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40225] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40226] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40227] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40228] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40229] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40230] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40231] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40232] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40233] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40234] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40235] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40236] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40237] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40238] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40239] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40240] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40241] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40242] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40243] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40244] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40245] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40246] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40247] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40248] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40249] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40250] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40251] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40252] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40253] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40254] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40255] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40256] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40257] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40258] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40259] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40260] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40261] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40262] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40263] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40264] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40265] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40266] = "cpe-stable-backport: Backported in 6.17.10"
+
+CVE_STATUS[CVE-2025-40267] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40268] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40269] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40270] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40271] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40272] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40273] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40274] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40275] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40276] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40277] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40278] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40279] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40280] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40281] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40282] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40283] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40284] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40285] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40286] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40287] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40288] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40289] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40290] = "cpe-stable-backport: Backported in 6.17.11"
+
+CVE_STATUS[CVE-2025-40291] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40292] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40293] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40294] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40295] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40296] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40297] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40298] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40299] = "cpe-stable-backport: Backported in 6.17.8"
+
 CVE_STATUS[CVE-2025-40300] = "fixed-version: Fixed from version 6.17"
 
+CVE_STATUS[CVE-2025-40301] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40302] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40303] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40304] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40305] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40306] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40307] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40308] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40309] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40310] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40311] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40312] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40313] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40314] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40315] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40316] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40317] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40318] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40319] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40320] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40321] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40322] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40323] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40324] = "cpe-stable-backport: Backported in 6.17.8"
+
 CVE_STATUS[CVE-2025-40325] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-40326] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40327] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40328] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40329] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40330] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40331] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40332] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40333] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40334] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40335] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40336] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40337] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40338] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40339] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40340] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40341] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40342] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40343] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40344] = "cpe-stable-backport: Backported in 6.17.8"
+
 CVE_STATUS[CVE-2025-40364] = "fixed-version: Fixed from version 6.14"
 
-- 
2.39.2


