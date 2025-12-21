Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA15CE66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68631.1766353048466349924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0hruv5tt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4067638b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353048; x=1766957848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfDmjkTful/5WihFhqOkkqnKFLXU4s2XQJ3SFcJbuAU=;
        b=0hruv5ttUoxVN2h1j/6a4vVLU/yOxCP8MZtSjET9WzHxhGpa+UNNtmpHSKxqik8nkD
         px2PYZzHDJSbWBIBM5JXN3gGvykJWojv/NZ4YuD3htbT958KN/O6cvktSiqa0qhyr8LN
         kse87POjX03KvhO1IN/+1M9wulniL7bk3vXw2PWQNw9Xj6Uz5vHF+gwfoEtQGY+/RR4d
         Jned0EXP/VJE4zqaUJtxzhCEYPR0JfjopmB+KnRFunZy+EtEZcBtaRzLb1bAJXbr/WZK
         z9oeg6ZbOKB8ssJllLxgek264KievUR33+XDY3PLjI+AcICj/+ztpCCaCKWz3sP2u6Bc
         iO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353048; x=1766957848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dfDmjkTful/5WihFhqOkkqnKFLXU4s2XQJ3SFcJbuAU=;
        b=moVXsjsCCeR9fXx97i5rtpNBgZUiOkJqryapGkYAImdN9jKI6TtyAPI/+QpfFjjIoX
         kzpMOB9NNYf56zaGwb3Pq5QtEmSGQ0dE9X019Kr8MLk46yfQg/kHv6jh/nFJkS3R7NW1
         ooaSQFsOSnHOP0rP2psCN+Ov2d8LU10IvFBVU/FT4Af/78GyASNPJh0QehTMN+19qnFF
         PaOwcOX8Mhd6BOUD4XYiKhO4z5p+E3HSYWMkQ50eX27MjgzSuPRxKVbA4NK3aAyTCe2N
         /9oSvCi8JlTu+wTuA17gg8apwGFapLgWf/ykARiMOpejvklQ0TqC/89zud/cI9fghoVk
         OLwQ==
X-Gm-Message-State: AOJu0Yxvj+/4MCEHLBloyiMGB31DJvP347jILQM8UtYbGJ9HVm7mIZD6
	gsK3c4wFaMB/nfjA5bMQ2lyg8PDZs/HsJBHcGPq6bw/7my9M0Qy5AxtF+KBB6ch7pqAO95edizR
	n9qcBK/0=
X-Gm-Gg: AY/fxX5by1cCGnWCKd+5PhgF+y+sIgmZEbl7cKrZtuaP2yK3Zx5Md2MiG78Q8T9dysq
	rYYXe9cV5Yk2VyPEiAig/SbhS5T3vVQlemSPn6eXzzelBTFKo4wsVaqiSY0XdMBsd4Zp4zMOn+7
	C1qZ5WqlJ3uyPYW4ZE9cXJXSYLWDM9Ql2FSm0lF1VQaqEVU7H0F1irQweaKvXsqXHrD7lhchyWr
	mfR3Yr/kqlf0DHSABVaVYVcR0kOm9OF0GZVyMrzxq+ZM4Erg9FbUTqEJFHGAIaB6duEqab7aGr/
	BDc1IAyX6lTgPFHj99Kg6mEYOzP4lDCjc/g8xnMLA9QBXPEv5ruvooHlB+vw1tKa1ovX8VuVfFh
	I2ywgFZDNRhgDEpixLiLzFoPJJqf0Hsrlf02qerbeEVPhEgkOaWbA1gpEp3NLnLGtg70W8ljewl
	BM
X-Google-Smtp-Source: AGHT+IGXMZO61twnTXcBP2nDSTG3tRefvIz49b9sWJS3QfdjYhQ53QMa4/DIDHx+J1dMxnMbvyN90Q==
X-Received: by 2002:a05:6a00:8d8c:b0:7e8:43f5:bd1f with SMTP id d2e1a72fcca58-7ff6735eceemr7792559b3a.52.1766353047610;
        Sun, 21 Dec 2025 13:37:27 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/18] linux-yocto/6.12: update CVE exclusions (6.12.58)
Date: Sun, 21 Dec 2025 13:36:58 -0800
Message-ID: <4651dfb126a659f196696677b1735e8a186dc291.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228263

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (0 new | 4 updated): - 0 new CVEs: - 4 updated CVEs: CVE-2025-60674, CVE-2025-60676, CVE-2025-7195, CVE-2025-8870
        Date: Fri, 14 Nov 2025 16:39:11 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4cdc1636ff992d052287cc6e3fc22470695ba420)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 204 +++++++++++++++++-
 1 file changed, 201 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index b35fb07d31..b66f36a202 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-11-03 18:50:12.770797+00:00 for kernel version 6.12.57
-# From linux_kernel_cves cve_2025-11-03_1800Z-3-g832f00439f0
+# Generated at 2025-11-14 16:49:37.841595+00:00 for kernel version 6.12.58
+# From linux_kernel_cves cve_2025-11-14_1600Z-2-g7d42ca6d8de
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.57"
+    this_version = "6.12.58"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17692,8 +17692,206 @@ CVE_STATUS[CVE-2025-40106] = "cpe-stable-backport: Backported in 6.12.56"
 
 CVE_STATUS[CVE-2025-40107] = "cpe-stable-backport: Backported in 6.12.52"
 
+CVE_STATUS[CVE-2025-40108] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40109] = "cpe-stable-backport: Backported in 6.12.52"
+
+CVE_STATUS[CVE-2025-40110] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40111] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40112] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40113 needs backporting (fixed from 6.18rc1)
+
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-40115] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40116] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40117] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40118] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40119] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40120] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40121] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40122] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40123] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40124] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40125] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40126] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40127] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40129] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40130 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40131] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40132] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40133] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40135 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40136 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40137] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40138] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2025-40139 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40140] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40141] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40142] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40143] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40144] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40145] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2025-40146 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40147 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40148] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-40149 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40150 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40151] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40152] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40153] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40154] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40155] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40156] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40157] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40158 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40159] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40160] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40161] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40162] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40163] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2025-40164 needs backporting (fixed from 6.18rc2)
+
+CVE_STATUS[CVE-2025-40165] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40166] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.12.55"
+
+# CVE-2025-40168 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40170 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40171] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40172] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40173] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40174] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40175] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40176] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40177] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40178] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40179] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40180] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40181] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40182] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40183] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40184] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40185] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40186] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40187] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40188] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40189] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40190] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40191] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40192] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40193] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40194] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40195] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40196] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40197] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40198] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40199] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40200] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40201] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40202] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40203] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40204] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40205] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40206] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40207] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40208] = "fixed-version: only affects 6.15 onwards"
+
 CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.12.47"
 
 # CVE-2025-40325 needs backporting (fixed from 6.15)
-- 
2.43.0


