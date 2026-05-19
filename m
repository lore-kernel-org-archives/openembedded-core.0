Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C484CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.967.1779233442688386934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wKuhtgIt;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d75312379so3514073f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233441; x=1779838241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAqmdYoD2V9fx5+lSC9pNNKABSsBgz6M2WYY9oXERm0=;
        b=wKuhtgItnqblpuoWhEmiGnLb2/SxV7MIVB6Vwc+7C+JLpVfgFrGZGQ7iBG9Y5PeUEP
         c0BWyifpc/ekZycJ3kZ4Xoc+xiQI7/oJZMMDfcu6KbbsuHMvJi53gb/ZBR+BlKrwx1Bq
         wAtISjIqlsrRxNsxIwFeZPa0Wj7ajUMRwOLD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233441; x=1779838241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lAqmdYoD2V9fx5+lSC9pNNKABSsBgz6M2WYY9oXERm0=;
        b=Kvfr5vsbkKeZZUVYxScSIoHwmjJbAcHh28ascqDT1GVVieW42xDF0NK5pOZqF1+c38
         xhU2Ps2gOJayUajUXOnhGi/C6t8u6AFOqi+qHRv5Oaa1XxN8eGLk0PvWzBTKgXwRWzuI
         UXEmm3aawlPwyCFYs0RVwG90RN9B25xzV+SsvsIE17I/1InsIDNjuHDAP0/Abh2dIvXj
         HGJtW3ssZ2LEmag3U1fCJ+DU0ZUKhudnf6cfuAjOecZsWGoACCDqeVy6O+EmazzFOFUq
         tKzTo+pWVtxTBwASOS2IzVj8Rk0DCXjuf7AXg54CrJTG97100ndq8qo3MSCB7NfcV1O1
         IHJw==
X-Gm-Message-State: AOJu0YzSHLHVeDx3ZvoGRWokBSPFTE/m6D/fskq/3adNBURk1UScvfiD
	4mYSzzwOdkWYt2gwTx2J0tPkC5/UBTVi8FX1YSfgRETrehidjCZEVgZHE1oxuagq6eViQtkgEfG
	oZXlr
X-Gm-Gg: Acq92OFahNG6MvfBy3e6Ej62rkO7ksppphcOxazebC24VygR8yIWYuUdlRO+N7UmesL
	1XKgQJptAItnsp2NUuW66r2zNXS7/Wp2Fv9itG2vafHheoT6gI8YSWv9UFtIErzbzsLzswTJmT2
	RNxVYrtLLteBAVc/sPfl4PHvwgsxvfl6iqc/hnKSBUfOLayMppHgY6JxWGGIeO0sLB1zpxicH/v
	kxZ2u6O9wOFKu8Xa0pqwPAsRTiiKqyV8vRKA2D8YdXqPwl78CdZg4ESWo7O59AUOtU1UovsFqgP
	YaKWP5qYFSsXgd6ynJJcovLVt92crjCM5VuFuAEj+c6F+NB8XSbMSNCDu9+J0FpRn6kVRZAttIS
	KfcBPePNNxDccddTu9iv7S5nn5NT3Tg88BPCPUtC+VBACJRsPgSUU0hdbf/Y6j4985P6KvPcoDc
	qdEt0rqd25lfjgVOAArym1f/cO+vsDnOCkaXIfwX2rdSrEqRCfiG34IAnZLZRBe9ciLUYHCVQjX
	xI9k96s8mzaFGEphlETqQ/P/X8=
X-Received: by 2002:a05:600d:8:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-48fe537fa84mr277596695e9.10.1779233440809;
        Tue, 19 May 2026 16:30:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/28] sbom-cve-check: set PV from upstream tags and ensure version checks are correct
Date: Wed, 20 May 2026 01:30:01 +0200
Message-ID: <bf12dc5ca920cb97bb282f4ae18103f261f9cdc5.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237371

From: Alexander Kanavin <alex@linutronix.de>

These recipes didn't set PV, which by default is 1.0. This isn't correct:
upstream does provide date-based tags that can be used to perform version upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8d4dee746e86d746295c5b7ab1b880bb427e0a4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ve.bb => sbom-cve-check-update-cvelist-native_2026-05-07.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native.bb => sbom-cve-check-update-cvelist-native_2026-05-07.bb} (88%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native.bb => sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} (90%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
similarity index 88%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
index 3763e7f21f7..7670172c40b 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# cve_2026-05-07_1300Z
 SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
similarity index 90%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
index 26a14e6eb16..02446e30cee 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.05.07-000006
 SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

