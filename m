Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F355CAC581
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:09:39 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.589.1757088577338526441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXEJjKkX;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70ddadde2e9so17480906d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088576; x=1757693376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dswa++EOyOpwSKmbQyBbqDXNyqvsqIn/vuaToi2CCdQ=;
        b=UXEJjKkXj6ybyvRjQdqANuJYDWsxxzritQXUTdrHgCctS8OPjhOu53usvGMZJbN1s2
         +L1yzL0SXDXheSxlheDblc25q6QSiW0BKq0o8fnJRWde3lGNIh24KkZrT16IUjaYD6Pj
         fL6+gCGhPSmS0VJAUl1fxuKEqvFTXY2MtacQt1EtaYGHl/ApZtwL0OiGXDedOgit685m
         sKfz3xmR4/jeSVhJrZaWN8trjt6GiTtNaBR+e6HGE8YBp5P/RFJa4PlSUyCysuxpQuxS
         gd2QecZWMUmnmaYn03Fp7OhLfjlFSBlgKSzeLNXiote0SZf6n2peMcRGM+2qPt3CBUhU
         sNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088576; x=1757693376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dswa++EOyOpwSKmbQyBbqDXNyqvsqIn/vuaToi2CCdQ=;
        b=Pm1Kt/uE39P19NY0fFV5T7RbS5edMyyLakVRhx8lFcB/8lnAeFTUxotbaDCqT3o6ue
         55QuQ8Ey4YYVomYBoEnz+T1kX+pAdzHxhY2ng3HSwP59mGjQMkCdVRMCiMdAYMTR/PJc
         AbouxGaRObCV9kX36YmCqFk6YE5LGum7asAM9eXOwyuBAlZwIqoBFaw8O9MK6ExrS7Dx
         ut8l8cJtTjE6481TLUIV4ZiqoXOg96oVWZXRLOEmL0gGpt1Bxwkokm6vnfQs6tyD+IXO
         TEBZotwr+gSc5K+IjouTsiO3NDOkJf2oIl3Q2kWHrYI5JYV1T27+Iys3P39O6TfrU3GE
         qhUA==
X-Gm-Message-State: AOJu0YwJssDYwaEqGrWYHqdMF7lwK3CvqIU2M+Yb8wOis/uz7ZVr09Bc
	5TdMGiflzXJgMBBuGuhCy0B3fK0kcoXKbf4BJftiPZxak71RVE+OhZkx86l5NriV
X-Gm-Gg: ASbGncsS3I8hzy2WTbfP4RppynPx4rjCvrcPGsciTbJU665zG1nI2Ljg2FluOBPMLRS
	3Ja3mQ5JMr6jlodGkG1Uf5Q7Eg+Y6kTNsK6WhF11XqvcSKMyzZV5H/7atKP+d5h1cTZRLwrw0sz
	rc/sC5o0G4QfrUruvqHjmClkaxB32P8DrvzaserF/I8t/OqpZTk9bhfUgK+YdycshKD7AEuCSIV
	kMDStzCQC6giR4sXom1FYadIhZyFKLvo3GkfKoQGYYozHOKMl6b3djOoBhpvXt7vVasfuQwo80U
	F+NcIVNSetqBqgCuoYr1E+qjDHVskmQrTMTX77+aijYGAHrMnYc1Cz+BFZxv47rq2++jgGm475m
	kwegoIQYVrpKQBp5xE9+TNRA2zgxcY4plJyLfqqUBdlg54VC9+95YNqCXQRvetIsFIJNYKS7+nQ
	IymCQc2YB8prswQilNMTuNmKvrd3qpUfj3ZCrHKaABmMezm/d27ktCdmqcNydT491noZOVZDrcR
	Wf3
X-Google-Smtp-Source: AGHT+IG6NJZn8a6ODdqak+lho0fFjM78CqXRbP5/BdwUTt9/3b5EdLmGVo2+9VGMQ+gHZo4C+55b3Q==
X-Received: by 2002:a05:6214:c42:b0:71c:53c0:568b with SMTP id 6a1803df08f44-71c53c05b42mr194193906d6.44.1757088576039;
        Fri, 05 Sep 2025 09:09:36 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de30sm69127446d6.7.2025.09.05.09.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:09:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/6.12: update CVE exclusions (6.12.44)
Date: Fri,  5 Sep 2025 12:09:27 -0400
Message-Id: <d621c8b17ffd9fa06464da676bb2d96471555c4d.1757088383.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1757088383.git.bruce.ashfield@gmail.com>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223015

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 3 changes (0 new | 3 updated): - 0 new CVEs: - 3 updated CVEs: CVE-2025-32100, CVE-2025-55852, CVE-2025-55944
        Date: Wed, 3 Sep 2025 20:01:09 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 140 +++++++++++++++++-
 1 file changed, 134 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index cc26368560..57b735ed34 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-08-21 13:18:00.380174+00:00 for kernel version 6.12.42
-# From linux_kernel_cves cve_2025-08-21_1200Z-2-g608fd2b01c2
+# Generated at 2025-09-03 20:06:37.780942+00:00 for kernel version 6.12.44
+# From linux_kernel_cves cve_2025-09-03_1900Z-6-ga45e93ffde5
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.42"
+    this_version = "6.12.44"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -12000,6 +12000,10 @@ CVE_STATUS[CVE-2024-58237] = "cpe-stable-backport: Backported in 6.12.9"
 
 CVE_STATUS[CVE-2024-58238] = "fixed-version: Fixed from version 6.9"
 
+CVE_STATUS[CVE-2024-58239] = "fixed-version: Fixed from version 6.8"
+
+CVE_STATUS[CVE-2024-58240] = "fixed-version: Fixed from version 6.8"
+
 CVE_STATUS[CVE-2025-21629] = "cpe-stable-backport: Backported in 6.12.9"
 
 CVE_STATUS[CVE-2025-21631] = "cpe-stable-backport: Backported in 6.12.10"
@@ -12492,7 +12496,7 @@ CVE_STATUS[CVE-2025-21882] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-21883] = "cpe-stable-backport: Backported in 6.12.18"
 
-# CVE-2025-21884 may need backporting (fixed from 6.12.43)
+CVE_STATUS[CVE-2025-21884] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-21885] = "cpe-stable-backport: Backported in 6.12.18"
 
@@ -13060,7 +13064,7 @@ CVE_STATUS[CVE-2025-37742] = "cpe-stable-backport: Backported in 6.12.24"
 
 # CVE-2025-37743 needs backporting (fixed from 6.15)
 
-CVE_STATUS[CVE-2025-37744] = "cpe-stable-backport: Backported in 6.12.24"
+CVE_STATUS[CVE-2025-37744] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-37745] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -14774,12 +14778,136 @@ CVE_STATUS[CVE-2025-38612] = "cpe-stable-backport: Backported in 6.12.42"
 
 CVE_STATUS[CVE-2025-38613] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-38614 may need backporting (fixed from 6.12.43)
+CVE_STATUS[CVE-2025-38614] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-38615] = "cpe-stable-backport: Backported in 6.12.42"
 
+CVE_STATUS[CVE-2025-38616] = "cpe-stable-backport: Backported in 6.12.43"
+
+CVE_STATUS[CVE-2025-38617] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38618] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38619] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38620] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-38621 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38622] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38623] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38624] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38625] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38626] = "cpe-stable-backport: Backported in 6.12.42"
+
+# CVE-2025-38627 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38628] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38629] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38630] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38631] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38632] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38633] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38634] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38635] = "cpe-stable-backport: Backported in 6.12.42"
+
+# CVE-2025-38636 needs backporting (fixed from 6.17rc1)
+
 CVE_STATUS[CVE-2025-38637] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-38638] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38639] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38640] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38641] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38642] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-38643 needs backporting (fixed from 6.17rc1)
+
+CVE_STATUS[CVE-2025-38644] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38645] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38646] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38647] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38648] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38649] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38650] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38651] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38652] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38653] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38654] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38655] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-38656 has no known resolution
+
+CVE_STATUS[CVE-2025-38657] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-38658] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38659] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38660] = "cpe-stable-backport: Backported in 6.12.42"
+
+CVE_STATUS[CVE-2025-38661] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38662] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38663] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38664] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38665] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38666] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38667] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38668] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38669] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38670] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38671] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38672] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38673] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38674] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38675] = "cpe-stable-backport: Backported in 6.12.41"
+
+CVE_STATUS[CVE-2025-38676] = "cpe-stable-backport: Backported in 6.12.44"
+
+CVE_STATUS[CVE-2025-38677] = "cpe-stable-backport: Backported in 6.12.44"
+
+# CVE-2025-38678 needs backporting (fixed from 6.17rc2)
+
 CVE_STATUS[CVE-2025-39688] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-39728] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.39.2


