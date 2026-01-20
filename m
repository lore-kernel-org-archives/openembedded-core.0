Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00C6D2ED15
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5025.1768910962377198813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0TcoUeXx;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4308232f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910960; x=1769515760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDaDJElRNALhzi2Lb96qpr3ceKBgWFxHCDkLwtSKZh8=;
        b=0TcoUeXxzzqZJxaSEInGyITJ7NF5/aWeDtoREALVUgSqYhmGuQi5QoYgBluhepDQne
         obMDLsX58+KYOOh+SkABmmon7GJlH6VHyUrF3Ima2mfi5k6ixSH++bjpqoNn+J+AaINH
         yHoXLQbH1PmHWxtZ7s3UBYUJghh2WDICY0lcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910960; x=1769515760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDaDJElRNALhzi2Lb96qpr3ceKBgWFxHCDkLwtSKZh8=;
        b=EL/mcmkNgb5NNhvePBCdRj7ChuHZE1sn35jfXQSH8ZFzQtVCjLYb0AmvfS/dCEoOIS
         kARl6spMCXVR0H0DVbinjRX01GX1/AmKc/mvObZpXjgJ91SsuNmTlhwGYL/mS3poll30
         wZvQoimCR9JcMOjDjFOV8NmVw5RLizmCTnHMEk40uulJZx/68Yml5KiCiie6X8ARRMoy
         G92PjD3m7OTDGeTJJiVMo2zM+2YrP/sLTTA0FIpW6gjFq0D86USfxVpicNXfHup9RWaL
         Tizb1mLiy9U1aGsjOilv502jAwlWqoazREqOCVuyBBustlHcDEHkxhmySDkk1FnGj2OW
         FzWQ==
X-Gm-Message-State: AOJu0YzTLWoCqiYsWtX4ij5ffpCdfx2oqgFE4U/54rpLgyj4yyVzpYiv
	xcUIoAoINbvH2DPgHgTpDDVCAnagV5sITSwD6WCKsIFURMLPPHCzQBjfeQqPuKDssRxt92+FjDG
	riCso
X-Gm-Gg: AZuq6aIabK4w7Uc6M3HPxPDL7bGvJtm/TQS9yFneqK8SXGLgdJzLskJAIffExFTVqrg
	jd2iLzyO9OX3RX2j4Khe4oU2VJSkWWYZyZB2kVu8TZ97syoQnHbx2MWEN94+ZjLJYoJixCbnEVh
	eufaIFEs54q6QUSnvrjiDPj2lFVaCWcu8ZL63Bh/sktrC+V/WS14rkauHFmD86qw2DJcb+Q3ImF
	etXtmkmLNipEX+Y1xsQbfIBv7+HWMSmj4i26oX2QWINVfU/PCyMxl8AJSJnUW8KAnddigkUCmvy
	1xOwmBy1EY9xjlwAd+Xubl9miQDUbs2stnt7lUkIrD/n3nA007JcEYCJMtTSBpLosnwboyGKrzu
	KTzfXEps+jk4xsvk9gs6rcDRfuza43IR/0kaF8Yvfixno6i3Wb7A+ydFxT9WI7D77Ym9I7aRsBF
	s9e06OBs4+P1Dczt6D52mBkJjEof+m9YOKDx659jzR/COgDogUnsD+TC5AJ2F2337MufBijjX7Z
	3eze78Zw5bQtZ97PAgBbw==
X-Received: by 2002:a05:6000:26ce:b0:430:fd69:9920 with SMTP id ffacd0b85a97d-4358ff2af6fmr2410660f8f.16.1768910960474;
        Tue, 20 Jan 2026 04:09:20 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/22] libarchive: fix CVE-2025-60753 regression
Date: Tue, 20 Jan 2026 13:08:26 +0100
Message-ID: <ecf7f9e5233c41e12e0a21ad2d7f395011cd6bee.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229690

From: Peter Marko <peter.marko@siemens.com>

Pick patch from PR mentioned in v3.8.5 release notes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...25-60753.patch => CVE-2025-60753-01.patch} |  0
 .../libarchive/CVE-2025-60753-02.patch        | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  3 +-
 3 files changed, 48 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-60753.patch => CVE-2025-60753-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-01.patch
similarity index 100%
rename from meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
rename to meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-01.patch
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
new file mode 100644
index 0000000000..637162b894
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
@@ -0,0 +1,46 @@
+From cfb02de558d843dc5355c4aa2aeb4af49f88bdb9 Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.de>
+Date: Mon, 8 Dec 2025 21:40:46 +0100
+Subject: [PATCH] tar: fix off-bounds read resulting from #2787 (3150539ed)
+
+CVE: CVE-2025-60753
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/cfb02de558d843dc5355c4aa2aeb4af49f88bdb9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tar/subst.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/tar/subst.c b/tar/subst.c
+index a466f653..53497ad0 100644
+--- a/tar/subst.c
++++ b/tar/subst.c
+@@ -237,7 +237,7 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 
+ 		char isEnd = 0;
+ 		do {
+-            isEnd = *name == '\0';
++			isEnd = *name == '\0';
+ 			if (regexec(&rule->re, name, 10, matches, 0))
+ 				break;
+ 
+@@ -293,13 +293,13 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 
+ 			realloc_strcat(result, rule->result + j);
+ 			if (matches[0].rm_eo > 0) {
+-                name += matches[0].rm_eo;
+-            } else {
+-                // We skip a character because the match is 0-length
+-                // so we need to add it to the output
+-                realloc_strncat(result, name, 1);
+-                name += 1;
+-            }
++				name += matches[0].rm_eo;
++			} else if (!isEnd) {
++				// We skip a character because the match is 0-length
++				// so we need to add it to the output
++				realloc_strncat(result, name, 1);
++				name += 1;
++			}
+ 		} while (rule->global && !isEnd); // Testing one step after because sed et al. run 0-length patterns a last time on the empty string at the end
+ 	}
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 86ba53aaf2..b62c3d69b9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -42,7 +42,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
-           file://CVE-2025-60753.patch \
+           file://CVE-2025-60753-01.patch \
+           file://CVE-2025-60753-02.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

