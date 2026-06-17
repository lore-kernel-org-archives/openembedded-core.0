Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E27CD98FD
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10386.1781682329162746362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XQQl+leT;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b613a17bso49478485e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682327; x=1782287127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsVfrHPPiTXCri+EzJuoU3AvQailLnfh3c1f+Ha/5+0=;
        b=XQQl+leTP+EFf6usFHRNmkkJ4yiVSZlXD/8ZLN7S7SmB1F58Erxk2UCu/bocR0we5B
         Oukid/efCkmkuifXSsELA6NQjOpTliIvvAr1IoUsCasRF96dftHP3Qt2YlprLr8dH90G
         sWqden4okFlN+i04KI4VrNTB0xk6li5aw1r6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682327; x=1782287127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsVfrHPPiTXCri+EzJuoU3AvQailLnfh3c1f+Ha/5+0=;
        b=c7E62gM2p6cfUg2o0YVSiwfckZYaicOYgIFxvo6KtvZTXIzTUwoaA8mPiJ0uN1sTeN
         YxEPBMi9hEHT9KSJwz1BLPIwntFiwCmAsxPKcbcXX2Hqb50n59CBJrSSzDYuRU7tJHJH
         mSljgIWGOguSZbdsFwVeB5e9U/QjprZOsBfXh3C1+s/79dQ2PGF/dSfQqF2UexGbxMaG
         IuNzvPdSCxlTY+n1HewfKpfElswbAjQO4Dyi7eCPxyjJN4ETEd4f0x8StAIPSzES34m3
         0KxHSLw6BJg1F1+dvBcHamUDnNmmeaImaLCyvug2rp4+lPl24+KTbbXKKRaYaySXI98X
         947g==
X-Gm-Message-State: AOJu0Yx5kspo9BmXQ90Ggo6cLCy6PH551pZDx9Hka/IP92G5tlonR4Yt
	LAm0IjB+oHPiMsNjgItt5qGSma9bo9pOPqwb4rBDDuaiLXBhcAnIJN8NgzMspH/Jz02H6vn4I/f
	4kYnG
X-Gm-Gg: Acq92OGtIedUT95L02tjI35fvoniwXlcxjwi0eOh8nZgH3R83CllQMltftmHaqcIZbB
	U7OekP9suzlS8bZIMiKE6tHd/QxWtcia1ryRXlE+dpWqT9CBHGWO18G9+cn1oVm5cl3MUDW6jo5
	fACCrkfSPqO0NFm+f56K/E7TTJoX2RYtpCnOlh271oTu/v36SDb+0ME+SOyhjLcrd3jWEndkw4C
	vJWew8qvcwyYu4Wuh6nhtaJYS1D9BKWVgCDjte3bxvAJHob3hZj8JVbRkqZQA4cb+DXro5MdhYz
	hk+cEHxHNVReyO2Ve2sS/3FPVfIixVVH45A5xSIvh3mPti7P0PcFnHg85/RLtCBGt+usAP5zvOS
	xgp9RZOOwrf8LV2Yb6dcJage/H2MkRb/2M2OuYszKbChAwALuu9TjG2A/mfHObMM+BLqKxm8QLT
	cujluCupQRTdCO08d2Qfnir5WDXprMjb9izL07Mruszqi/83d+vzQlJgpIRn6iPS5sb1HpRac6A
	r6goyMIdyZr53NQ+Q==
X-Received: by 2002:a05:600c:4e8a:b0:490:ea8a:32d0 with SMTP id 5b1f17b1804b1-492333cfb16mr40732675e9.20.1781682327215;
        Wed, 17 Jun 2026 00:45:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/30] go 1.22.12: fix CVE-2026-27140
Date: Wed, 17 Jun 2026 09:44:37 +0200
Message-ID: <b0048d8bc8134c445a3352bfb631d41319a75331.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238984

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/golang/go/commit/abaa0cbb259e059ee60c33a7507eddc1fe7d20fa
[2] https://security-tracker.debian.org/tracker/CVE-2026-27140
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-27140

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-27140.patch                | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27140.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index f67da3e0788..46d75d13b21 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -41,6 +41,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p1.patch \
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
+    file://CVE-2026-27140.patch \
     file://CVE-2026-27142.patch \
     file://CVE-2026-32280.patch \
     file://CVE-2026-32283.patch \
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27140.patch b/meta/recipes-devtools/go/go/CVE-2026-27140.patch
new file mode 100644
index 00000000000..5c9fb31c23d
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27140.patch
@@ -0,0 +1,58 @@
+From abaa0cbb259e059ee60c33a7507eddc1fe7d20fa Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Tue, 24 Feb 2026 23:05:34 +0000
+Subject: [PATCH] [release-branch.go1.25] cmd/go: disallow cgo trust boundary
+ bypass
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The cgo compiler implicitly trusts generated files
+with 'cgo' prefixes; thus, SWIG files containing 'cgo'
+in their names will cause bypass of the trust boundary,
+leading to code smuggling or arbitrary code execution.
+
+The cgo compiler will now produce an error if it
+encounters any SWIG files containing this prefix.
+
+Thanks to Juho Forsén of Mattermost for reporting this issue.
+
+Fixes #78335
+Fixes CVE-2026-27140
+
+Change-Id: I44185a84e07739b3b347efdb86be7d8fa560b030
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3520
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3989
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763556
+Reviewed-by: David Chase <drchase@google.com>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+Auto-Submit: Gopher Robot <gobot@golang.org>
+
+CVE: CVE-2026-27140
+Upstream-Status: Backport [https://github.com/golang/go/commit/abaa0cbb259e059ee60c33a7507eddc1fe7d20fa]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/go/internal/work/exec.go | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 815942a..520c478 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -3347,6 +3347,10 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+ 
+ // Run SWIG on one SWIG input file.
+ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
++	if strings.HasPrefix(file, "cgo") {
++		return "", "", errors.New("SWIG file must not use prefix 'cgo'")
++	}
++
+ 	p := a.Package
+ 	sh := b.Shell(a)
+ 
+-- 
+2.50.1
+

