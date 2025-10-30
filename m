Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EDBCCFA06
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:49 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.3354.1761844365485051593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7ynX4yc;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-891667bcd82so176720685a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844364; x=1762449164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vSMhivLFhNA/21OTal5pPHRD19RVuAUFgBG1dfS5gU=;
        b=b7ynX4ycDd5yfThWjPhJpCp32RBbVuxVpiDmHf+WhbJhndOTrgZqbg56vEIs5WXRYX
         /tvFfo/iXRrmihC+fg1b2ofHskByK0d0aYSuwmGz0SMxXxYy67CAiTN0CoFVpF+xBgVg
         HGpThi4G85RTnboxvu7DleB8Ic+6II66szqagi2BD3NtA4EN4ltWYiESYA+lXNi+LvdD
         f/B1AIbXL6xp81DsON+se8eGK+LU468lKJsKImSXbRaaugliQfjcdzjsaRHbBOgJIhUf
         RrY7YZvcx4YZpPFrqSaW/nIpkkbcG4Do/K8faPemHsan5/0bUXWNhrRl9z//qbLDbvnz
         4fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844364; x=1762449164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vSMhivLFhNA/21OTal5pPHRD19RVuAUFgBG1dfS5gU=;
        b=mD1VSWvUaN9zJUwKb+OnvTFHHdoxlA9qluAvpOO7c35nWQXOxR//qArP2itUaOf6xf
         zOqaMmrPTUU11SG8WIuuQzIB2IVtsBmCS/zZnmbBVUPhD1mUNbkxnMaPAgfYqppgzrm8
         5PUJ2YPcH35bGzpCfzyXNb7R96ntdE0LIiYVmnxhAM9jtEqubBEFdGNLLmaEcYi+AOvl
         D9kL9ikx4DPuQ38zNIXfqEwgbg8LK2r3GF12icfSL6sk9NXnkx9Cxoc5G3zml1EAA4He
         xobwyKBfEYGOfsLwgOZNSQlzNa9rJKDISNDEYTfV+JQdfS8u7XT8ojNVCXvyFK2db7Lc
         rRIA==
X-Gm-Message-State: AOJu0YyKXwAR2Sp8ZnEBe6HmFVRSwJOJFJOkKb7nuJMhsAZxBAN1hZID
	I+W8aJ/F74WZGQsJwboWCDIGGfrKAsIMdy+nVgD/ysvAFtAdwvaU9ga/1w/nmN590rs=
X-Gm-Gg: ASbGncsqEKk/240tyoiyuyXnu/CSLQCdZM5PwL2F0RU4OGTXMIvU5rnlX70VG2bdVUD
	JPfvf3zfCk8GxlGya/6iZIBq+ifbPcPSmBoYn+Pz64LvYyf1KNeHYFWZWRx5ntwQs9TIUHc6TYW
	ZyioilZEZMfrC+TpMAbjK7mk/0L4bJ+T5R1c4y1+SJqgm5rhJudg6cCW9RzJH4kyPRzQYZxZK+y
	Riup/ZMvnbAsnWLUoseJPE4ctKrL6lZHnUzn9drUY66gvl8+6BnIRPDUXHdaBbb1zuTAKDDZcH2
	h1kVHOpBfM/7APAO1GAG+QKdiZ9VQJsyE48AKlLAdqcBtL87j0SynOiObcLumd34UvuWZUhkEKe
	sf5keh69HCID/WfGIB6TcPnD9aPW0oolmhoYz3SsOikQcoTGIQd84V1/N16gMEGSDivzBWcMdhU
	d/2GgU9j6s9JjuU96biEfElgcQqn80fXL5wUtYPBO13AHTTSpJtVJ6y8P73l8jsxcpRp/doUxhs
	Lfj+fBxD7lVA3I=
X-Google-Smtp-Source: AGHT+IG35UFBZLaYTzxA4AlCC2tp5QXlZ+7aTQnIsgSTpgZgeCzqwPSwYK3yS0/n8yTlNhkKPGtmhA==
X-Received: by 2002:a05:620a:3706:b0:88f:ee0a:4a64 with SMTP id af79cd13be357-8aa2c280fd1mr572678785a.35.1761844364244;
        Thu, 30 Oct 2025 10:12:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/14] linux-yocto/6.12: update CVE exclusions (6.12.55)
Date: Thu, 30 Oct 2025 13:12:24 -0400
Message-Id: <2661f4c65898fb034a8176b24fc08573dfd55af1.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225513

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2025-10939 - 0 updated CVEs:
        Date: Tue, 28 Oct 2025 03:16:46 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 190 +++++++++++++++++-
 1 file changed, 185 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 48a7d59689..1e596c11b7 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-10-16 13:21:03.993902+00:00 for kernel version 6.12.53
-# From linux_kernel_cves cve_2025-10-16_1200Z-2-g676292fb5cd
+# Generated at 2025-10-28 03:21:45.408892+00:00 for kernel version 6.12.55
+# From linux_kernel_cves cve_2025-10-28_0200Z-1-g573c9628fcf
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.53"
+    this_version = "6.12.55"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5274,6 +5274,60 @@ CVE_STATUS[CVE-2022-50554] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50555] = "fixed-version: Fixed from version 6.1"
 
+CVE_STATUS[CVE-2022-50556] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50557] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50558] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50559] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50560] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50561] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50562] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50563] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50564] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50565] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50566] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50567] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50568] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50569] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50570] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50571] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50572] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50573] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50574] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50575] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50576] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50577] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50578] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50579] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50580] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50581] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50582] = "fixed-version: Fixed from version 6.1"
+
 CVE_STATUS[CVE-2023-32246] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-32249] = "fixed-version: Fixed from version 6.4"
@@ -7540,6 +7594,88 @@ CVE_STATUS[CVE-2023-53686] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-53687] = "fixed-version: Fixed from version 6.5"
 
+CVE_STATUS[CVE-2023-53692] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53693] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53694] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53695] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53696] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53697] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53698] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53699] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53700] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53702] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53703] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53704] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53705] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53706] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53707] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53708] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53709] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53710] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53711] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53712] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53713] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53714] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53715] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53716] = "fixed-version: Fixed from version 6.3.5"
+
+CVE_STATUS[CVE-2023-53717] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53718] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53719] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53720] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53721] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53722] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53723] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53724] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53725] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53726] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53727] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53728] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53729] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53730] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53731] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53732] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53733] = "fixed-version: Fixed from version 6.5"
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
@@ -17138,8 +17274,6 @@ CVE_STATUS[CVE-2025-39896] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-39897] = "cpe-stable-backport: Backported in 6.12.46"
 
-CVE_STATUS[CVE-2025-39898] = "cpe-stable-backport: Backported in 6.12.46"
-
 CVE_STATUS[CVE-2025-39899] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-39900] = "cpe-stable-backport: Backported in 6.12.46"
@@ -17344,8 +17478,54 @@ CVE_STATUS[CVE-2025-39999] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40000] = "cpe-stable-backport: Backported in 6.12.52"
 
+CVE_STATUS[CVE-2025-40001] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40002] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40003] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40004] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40005 needs backporting (fixed from 6.17)
+
+CVE_STATUS[CVE-2025-40006] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40007] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40008] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40009] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40010] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40011] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40012] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40013] = "cpe-stable-backport: Backported in 6.12.51"
+
 # CVE-2025-40014 needs backporting (fixed from 6.15)
 
+CVE_STATUS[CVE-2025-40015] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40016] = "cpe-stable-backport: Backported in 6.12.51"
+
+CVE_STATUS[CVE-2025-40017] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40018] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40019] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40020] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40021] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40022] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-40023] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40024] = "cpe-stable-backport: Backported in 6.12.50"
+
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.12.47"
-- 
2.39.2


