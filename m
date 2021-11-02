Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF9CC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.6553.1635842594612106560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PBvhnjle;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id d3so31987610wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J0kyxS5rXuo2nSctVcRvOR7SkyFjHDQjbUnnMwi+a+4=;
        b=PBvhnjleJ/9zpepC6jrHSQaTls/nS/Dbgy2xv6UVPk69PAGpW4vYfoVQdFpPDSrgin
         e3Eu8djMtsnP1aQ3klKMGiN16fnEznU+uIwQMc/t+U0hnLQ/WKUj9jDy6ATpYwUUWLAa
         hE44d0jeHweLdqnnx6Hd7elDJVnWljmF6reaZqvgvEsrCB1exnpI1hZbacHhbSO7wr3q
         xles0WpatLK9RhRAPqJYnyt3Df4XqzhDsQp3+HXP6c4Re+VUiyn+VrhFcMNF4QrtZqj4
         Wbtl7RLDA+V7hDJn+QIf9l8+lgOqq6HfqE87pKkjFY0UcTmiL50cN+YVcga8axH/GX2f
         YQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J0kyxS5rXuo2nSctVcRvOR7SkyFjHDQjbUnnMwi+a+4=;
        b=EVt4b0ZCBZsJGQoQ4oDFv9IGcgLwU+9sJxmTkqY7PCZCXyMXHYbjc+VVdV9fRftTma
         hLlSX2R2mQ0/aUn0q3/HHyeITUQh2OJFEMX+N/uGulapk1bHGOoHrbev11m9BzXWDDiu
         F5BAdzaHyNHHT0G4yUHrtGartEcq76hKKQEYdYOqS9I+6YqW+hLaPVbkrOpBmkzdVT93
         XiCWKS0WPW0+tRyYqyiiOAa348MPPk0S98L9oeK9SYgxUlwCYv1JxJHoItQq5alq/R1r
         CWe8M8ufhvgB27iKEI2HP4c85i/wj483wskGBBOSOpvv5ze/vgj2JqzVkHsMdqRm6zPP
         jmvA==
X-Gm-Message-State: AOAM530OVep0+hqNsCbBLZoxYq1hQMoVtjcNdOC/rhChCrEEqs/zymE2
	Xn15IB4CXa39acYQX4r3LQlYJgX3+RQ=
X-Google-Smtp-Source: 
 ABdhPJyicJRqDlJZEy0SK//NxWuYM3/osf3qxpQuBosgFNigyzYwQwpcZ1gPOKq2rVKJPlKizHWUXg==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr46378931wrd.33.1635842593269;
        Tue, 02 Nov 2021 01:43:13 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/33] stress-ng: upgrade 0.13.00 -> 0.13.06
Date: Tue,  2 Nov 2021 09:42:43 +0100
Message-Id: <20211102084303.2974802-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157751

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...write-the-timestamp-into-compressed-.patch | 26 -------------------
 ...ess-ng_0.13.00.bb => stress-ng_0.13.06.bb} |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.00.bb => stress-ng_0.13.06.bb} (85%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
deleted file mode 100644
index 21a410f605..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2386cd8f907b379ae5cc1ce2888abef7d30e709a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sat, 23 Oct 2021 20:20:59 +0200
-Subject: [PATCH] Makefile: do not write the timestamp into compressed manpage.
-
-This helps reproducibility.
-
-Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/156]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 886018f9..f4290f9c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -468,7 +468,7 @@ git-commit-id.h:
- $(OBJS): stress-ng.h Makefile
- 
- stress-ng.1.gz: stress-ng.1
--	$(V)gzip -c $< > $@
-+	$(V)gzip -n -c $< > $@
- 
- .PHONY: dist
- dist:
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.06.bb
similarity index 85%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.06.bb
index f01e7b2433..4c4d8a9c57 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.06.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
-           file://0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch \
            "
-SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
+SRCREV = "97fc3d7795bd36a516b5ec80a9ef85d682d234ca"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.20.1


