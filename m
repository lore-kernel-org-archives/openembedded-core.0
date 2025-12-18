Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB67D711AF
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:03 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2021.1766089373260327578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YAWEQfVr;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8bb6a27d3edso95557285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089372; x=1766694172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTee3B3uGKSh4tZVg4Pxyyic66t6yryyikJX7GBhVVc=;
        b=YAWEQfVrau75a3zsMetXmD5wBWT/OoWGicp7T7xVFWLhxQNySVD8ED7nNLjFHjT3qt
         efrLzf5UZ9Ac66/7tXbFtSCLQjAGUEVJCZiq2ssihgdNW8K4VT7jcLydjWVGdUxvSTpo
         frwZnaAtEXkmKpnGgERStzF7ycfOtmHCb+RaFi1WKWPpZ0bt/kO6zXAnjgDpnrV8k4W7
         I6lV+U47e9pMNO1zruv7NX4G7wmrLmLon715nY8IgBMfpAVOcRAn1+zxxCbP1eHQkGMq
         IcsLAhd4wIshrYEYPQqmiQ0AXyzI48rrSPklKJj3BOlQ2k6MYmKVxld2V37CVkrV6CYv
         EE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089372; x=1766694172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tTee3B3uGKSh4tZVg4Pxyyic66t6yryyikJX7GBhVVc=;
        b=bbO7ARf+M+K3H/MqeIRJHo9rSAC4JX9DHDK5RheuOr5cmKaVArVuNTLD++LfveE8vo
         hfr/UH+5MRbTN02g/Xy03YUE3XbUh0SoGzok2Rj/9QdlxB4MEjExBBDMlRMTR/RYGvqD
         JE49AICMRs+9KndLEHNGD4xMk/Goy3H1b83w/Kk8lOkGglttJnuhABKtbfK8aMkEvECL
         NHi1CcKTwVn+FwgXcb7phekNyShfAIYfJnl2RnYIgS5u60YBK/E8TY9yQwhJbgMlWnF3
         QyXUIOzVr56I+xbnWUsXz4Qqvn5eDQly+FbL++H/yTbdXQwi9DwwBbqKtVOsqzRBb6n6
         q2SQ==
X-Gm-Message-State: AOJu0Yxq7wc7IJOqsZgk7iFJC7Unxn4H7Ub3UZ/HqzHo3S7/O7aZNo1+
	Dw3D9KuZo5sqa1hNs1KTlagE09PXLb63PC6jG4HB/Ez+uykqnle6+Oz1F5Y4RUSaZ/0=
X-Gm-Gg: AY/fxX6aQBx4yj2QUnChk4TPKtE6payFx9i4tAat+JA6uv1LQZM+epxMBL8leTJ0f2b
	YmwNDt0J7mfDW7ATek8S3Hvrh1rp+8k3PNXYws8mJ42Ot1j84I7qGCQBnrChC33eaNAif8KKARI
	Jxowr1Uqyx9SpZ1NZ2RmREsL+qo90YlNGJP5hMn7ld9CXB+P0+rtKcGJHItbR9em+V9K2KQOvD2
	IiBKXAXFhLTIv9iOM2tnRstT4GgrFMTihHzpRD1+Fi4VJzvdqdoWn/Ett7cUHoVJXJGu0R9FtsZ
	+Cc2RWYfb/BzBhvNvf/u09up7KxYJVsy+6yBohZAdaNgXSljvg9KEe/LHJBV6Ed57X2FSWbdFfE
	kpvHhwdFGUlRNJZ/62KThrDQWTAGmR6AOMNDUYLWkrG7SRcQowIXKIVi2/JVIwkTkpHE0ROPHls
	TQjEHHvy25KEgeXIA4Y2fq/zhw/p6nvb00qvN28Qhz79DaEt4YB/O8GmAhxgTWjv8jjrsQpooWI
	k77eX1OqzZ/KD4=
X-Google-Smtp-Source: AGHT+IGh4abJbe5stR+TPQXIv9BXg3eLxZoJeebywba5HNn8aQBP2LMGhlU+IheCd/X7fVs0syRWww==
X-Received: by 2002:a05:6214:54c3:b0:880:85cd:6d98 with SMTP id 6a1803df08f44-88d81278efbmr16230196d6.4.1766089371928;
        Thu, 18 Dec 2025 12:22:51 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [03/15][openembedded-core] linux-yocto/6.12: update CVE exclusions (6.12.61)
Date: Thu, 18 Dec 2025 15:22:28 -0500
Message-Id: <20251218202248.70476-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228146

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 11 changes (2 new | 9 updated): - 2 new CVEs: CVE-2025-66533, CVE-2025-67467 - 9 updated CVEs: CVE-2025-10655, CVE-2025-2296, CVE-2025-67504, CVE-2025-67574, CVE-2025-67575, CVE-2025-67576, CVE-2025-67577, CVE-2025-67578, CVE-2025-67579
        Date: Tue, 9 Dec 2025 15:12:34 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 630 +++++++++++++++++-
 1 file changed, 627 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 5ca6f53fde..d272b74737 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-02 23:35:41.082808+00:00 for kernel version 6.12.60
-# From linux_kernel_cves cve_2025-12-02_2300Z-2-g67370d1b4b8
+# Generated at 2025-12-09 15:18:04.005747+00:00 for kernel version 6.12.61
+# From linux_kernel_cves cve_2025-12-09_1500Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.60"
+    this_version = "6.12.61"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5326,6 +5326,140 @@ CVE_STATUS[CVE-2022-50581] = "fixed-version: Fixed from version 6.2"
 
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
@@ -7672,6 +7806,238 @@ CVE_STATUS[CVE-2023-53732] = "fixed-version: Fixed from version 6.4"
 
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
@@ -17898,9 +18264,267 @@ CVE_STATUS[CVE-2025-40212] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-40213] = "fixed-version: only affects 6.17 onwards"
 
+CVE_STATUS[CVE-2025-40214] = "cpe-stable-backport: Backported in 6.12.59"
+
+# CVE-2025-40215 needs backporting (fixed from 6.16)
+
+CVE_STATUS[CVE-2025-40216] = "cpe-stable-backport: Backported in 6.12.36"
+
+# CVE-2025-40217 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-40218] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40219] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40220] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40221] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40222] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40223] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40224] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40225] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40226] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40227] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40228] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40229] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40230] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40231] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40232] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40233] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40234] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40235] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40236] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40237] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40238] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40239] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40240] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40241] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40242] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40243] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40244] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40245] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40246] = "cpe-stable-backport: Backported in 6.12.60"
+
+# CVE-2025-40247 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-40248] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40249] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-40250] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40251] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40252] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40253] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40254] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40255] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40256] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40257] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40258] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40259] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40260] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40261] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40262] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40263] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40264] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40265] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40266] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-40267] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40268] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40269] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40270] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40271] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40272] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40273] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40274] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40275] = "cpe-stable-backport: Backported in 6.12.59"
+
+# CVE-2025-40276 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-40277] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40278] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40279] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40280] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40281] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40282] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40283] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40284] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40285] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40286] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40287] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40288] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40289] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40290] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40291] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40292] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40293] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40294] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40295] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40296] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40297] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40298] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40299] = "fixed-version: only affects 6.17 onwards"
+
 CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.12.47"
 
+CVE_STATUS[CVE-2025-40301] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40302] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40303] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40304] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40305] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40306] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40307] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40308] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40309] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40310] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40311] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40312] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40313] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40314] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40315] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40316] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40317] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40318] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40319] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40320] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40321] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40322] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40323] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40324] = "cpe-stable-backport: Backported in 6.12.58"
+
 # CVE-2025-40325 needs backporting (fixed from 6.15)
 
+CVE_STATUS[CVE-2025-40326] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40327] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40328] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40329] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40330] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-40331] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40332] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40333] = "cpe-stable-backport: Backported in 6.12.58"
+
+# CVE-2025-40334 needs backporting (fixed from 6.18)
+
+# CVE-2025-40335 needs backporting (fixed from 6.18)
+
+# CVE-2025-40336 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-40337] = "cpe-stable-backport: Backported in 6.12.58"
+
+# CVE-2025-40338 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-40339] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40340] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40341] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40342] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40343] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40344] = "cpe-stable-backport: Backported in 6.12.58"
+
 CVE_STATUS[CVE-2025-40364] = "cpe-stable-backport: Backported in 6.12.14"
 
-- 
2.39.2


