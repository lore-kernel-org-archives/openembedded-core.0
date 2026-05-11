Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299A8CD484E
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:35 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60228.1778531126467933460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=od2c6Wd0;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50e63771d91so49253001cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531125; x=1779135925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnXwfQvOxw5nc2fC/pJRpRBz8Aqu1O0Pp9M7m8uIo2E=;
        b=od2c6Wd0vwUxN7Lm/AF8hgspDGhqb43UvJ4rPG+4O0wCm32kNaUft3XyWtq7dUjl02
         eg92JGjb51WBCb/7rrEQzfPZGB9eovOCImxqNADjru7w6lDLuGXdmAmanm220+h6aR5r
         LVT00Dp2MKTYBgnDmKswDKmO9Nzu7OdJaOsS/ZachgEi+Bi6UQxmpN+xNJSzNBl88LYM
         jZZFVTDJ5i//ciopjCz4i24bXdulteawdRqJwx7MDup4BhFG4Ad8b3iHNTDsu5i58pLD
         Uzj3DMkqwISme2gXcZM0x1RH+geAoI+7GzHc16xFaPjQOfq6NRCDlCE5jSyZ9HKHsobr
         FHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531125; x=1779135925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnXwfQvOxw5nc2fC/pJRpRBz8Aqu1O0Pp9M7m8uIo2E=;
        b=UD7EwFXSkqcO8M3a0RfOn/esIwVsUdhFxMSYCaWzdC3uy14wF0lGcTZQi15SdHn0JO
         uvTrSj7jTk33rTsNf1IpZOZ0c208ovgtBLIjuso0s6g1KCNQRbG7uGhjWJQARsxV6b0M
         JkCzYFgi1Mr3FtN85i4pa7PhXNtPCw7m8RsL6hOpTJp/uQsaeDtzWW/xg5eudgY7g+Gr
         Mnt7jfWXVJEiuc3ggAjSjVBgHSkjo0fI071RTieMiJQkRG/Q8HPOch6LelwPiahdkv7q
         ND6DPN1PcGIHVx0juZNTr9MNBw8ZdysilNqnphLzyo4VxdukLc2+VXTojZxHMD83wqKa
         bShw==
X-Gm-Message-State: AOJu0YwiMkRmZyg2450IL2OsLzolrWKKxMyFPiotOnZYUDM5sEazcZhz
	Jb2ASqa9RLIVmNFeBcXaZTW/Zg33da/Qx0bn/KNuJ8iSy6/Zo5TtGCTs12m/G2a1ecMquw==
X-Gm-Gg: Acq92OEjMhnK0JYn5M9R9KVzHMkwt4KxHswhGPGLBSkvfCJjtlaGcvl47l7ot7wVlj+
	uL0ahe/5UZYY8FKOJooDetLTnNLN2WaO+2oVe3VKkQRvVlLf9Vrc0NQCSYe/QoBGVNfPyIoW91i
	4R0iXSj7INfId2EPZ5t01vYb/ArhKqJ26jLyVGJMaIzb69AitUeqS9Ub/iT65pdMsw9dPlBmDGA
	1fEhoKrahhCgk31kfD9TqqlOZpcCK6ydcxSR0rjhXjtBte1FO8ueVjMx9AmYEnaBpc/flOc86wY
	zlttYWIq+g1u8oRH9XF6a8+u3BKCJCEiSFboRsY9wVecEppRvZMzuUPhi9kZaO+Qpmmftc/1T5m
	SRgRrZi+W4D1mRqwy6PaBaAmWktKJH1tAZBk3FVv3WeaadIDjHZaUEDNMd2X4ycpma76z66Jsw1
	9JDN8m9Ju7dCr4uzUcdiqt+K7VzdT0Y3TpCFSmuyGSOCTfg1ASBZpiiq/h7g5NNn2LjcV7US5PK
	QM0lNbWk49pLD0j43deQoMzLoD3yb1+kYgPHUXia9x4o79NpzbtHGEeE7A=
X-Received: by 2002:a05:622a:130e:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-514a0a60df0mr172559451cf.18.1778531124972;
        Mon, 11 May 2026 13:25:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/09] linux-yocto/6.18: update CVE exclusions (6.18.26)
Date: Mon, 11 May 2026 16:25:11 -0400
Message-ID: <20260511202517.1648910-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
References: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236829

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (3 new | 1 updated): - 3 new CVEs: CVE-2026-7718, CVE-2026-7719, CVE-2026-7720 - 1 updated CVEs: CVE-2026-4878
        Date: Mon, 4 May 2026 01:53:11 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 312 +++++++++++++++++-
 1 file changed, 305 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 8e6357700d..8be1bf7726 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-04-28 14:31:45.750135+00:00 for kernel version 6.18.25
-# From linux_kernel_cves cve_2026-04-28_1300Z-1-g3f42726e029
+# Generated at 2026-05-04 02:25:37.499875+00:00 for kernel version 6.18.26
+# From linux_kernel_cves cve_2026-05-04_0100Z-1-g159125fbf77
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.25"
+    this_version = "6.18.26"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20300,8 +20300,6 @@ CVE_STATUS[CVE-2025-71147] = "cpe-stable-backport: Backported in 6.18.3"
 
 CVE_STATUS[CVE-2025-71148] = "cpe-stable-backport: Backported in 6.18.3"
 
-CVE_STATUS[CVE-2025-71149] = "cpe-stable-backport: Backported in 6.18.3"
-
 CVE_STATUS[CVE-2025-71150] = "cpe-stable-backport: Backported in 6.18.3"
 
 CVE_STATUS[CVE-2025-71151] = "cpe-stable-backport: Backported in 6.18.3"
@@ -21416,8 +21414,6 @@ CVE_STATUS[CVE-2026-23470] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23472] = "cpe-stable-backport: Backported in 6.18.20"
 
-CVE_STATUS[CVE-2026-23473] = "cpe-stable-backport: Backported in 6.18.20"
-
 CVE_STATUS[CVE-2026-23474] = "cpe-stable-backport: Backported in 6.18.20"
 
 CVE_STATUS[CVE-2026-23475] = "cpe-stable-backport: Backported in 6.18.20"
@@ -22026,5 +22022,307 @@ CVE_STATUS[CVE-2026-31690] = "cpe-stable-backport: Backported in 6.18.23"
 
 CVE_STATUS[CVE-2026-31691] = "cpe-stable-backport: Backported in 6.18.23"
 
+CVE_STATUS[CVE-2026-31692] = "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31693] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2026-31694] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31695] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31696] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31697] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31698] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31699] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31700] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31701] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31702] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31703] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31704] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31705] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31706] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31707] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31708] = "cpe-stable-backport: Backported in 6.18.25"
+
+# CVE-2026-31709 needs backporting (fixed from 7.1rc1)
+
+CVE_STATUS[CVE-2026-31710] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-31711] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31712] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31713] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31714] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31715] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31716] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31717] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31718] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31719] = "cpe-stable-backport: Backported in 6.18.25"
+
+CVE_STATUS[CVE-2026-31720] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31721] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31722] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31723] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31724] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31725] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31726] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31727] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31728] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31729] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31730] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31731] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31732] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31733] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31734] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31735] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31736] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31737] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31738] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31739] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31740] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31741] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31742] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31743] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31744] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31745] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31746] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31747] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31748] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31749] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31750] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31751] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31752] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31753] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31754] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31755] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31756] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31757] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31758] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31759] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31760] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31761] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31762] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31763] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31764] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31765] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31766] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31767] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31768] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31769] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31770] = "cpe-stable-backport: Backported in 6.18.22"
+
+# CVE-2026-31771 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-31772] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31773] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31774] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31775] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31776] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-31777 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-31778] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31779] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31780] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31781] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31782] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31783] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31784] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31785] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-31786 has no known resolution
+
+# CVE-2026-31787 has no known resolution
+
 CVE_STATUS[CVE-2026-31788] = "cpe-stable-backport: Backported in 6.18.20"
 
+CVE_STATUS[CVE-2026-43004] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43005] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43006] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43007] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43008] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-43009 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-43010] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43011] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43012] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43013] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43014] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43015] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43016] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43017] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43018] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43019] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43020] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43021] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-43022 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-43023] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43024] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43025] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43026] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43027] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43028] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43029] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43030] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43031] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43032] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43033] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43034] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43035] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43036] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43037] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43038] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43039] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-43040] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43041] = "cpe-stable-backport: Backported in 6.18.22"
+
+# CVE-2026-43042 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-43043] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43044] = "cpe-stable-backport: Backported in 6.18.22"
+
+# CVE-2026-43045 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-43046] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43047] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43048] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43049] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43050] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43051] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43052] = "cpe-stable-backport: Backported in 6.18.22"
+
+# CVE-2026-43053 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-43054] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43055] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43056] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43057] = "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-43058] = "cpe-stable-backport: Backported in 6.18.24"
+
-- 
2.43.0


