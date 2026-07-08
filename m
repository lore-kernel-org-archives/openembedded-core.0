Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0224AC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:14:57 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4482.1783502094982580908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JSLUIcMr;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso362009a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783502094; x=1784106894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sZX1842nUUIh1p8Z/3LfUliZKEUUB6h3pH7gGonlx38=;
        b=JSLUIcMr+C0qvkluBy+Zrr0NIawWCQgaJxU1SS198565IFkU3a84mfA9s+MPknyXL6
         0YwAj9Bvzl5Ssq/2Kd95fvNEn0/vqjE5TdAwVvoIhBPvWfL1wUB8Qop6hmAXS3A4zJhi
         rw4z2svnmmJG/eJI2XwdiklO8RPYXmcQZyBvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502094; x=1784106894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZX1842nUUIh1p8Z/3LfUliZKEUUB6h3pH7gGonlx38=;
        b=gC91gXy2YwxnxxObYJm9qMduseZzdexEhx4I9I/ACMQvb5utz31s76d9AS3LdQx1HC
         QK1+h22xqi2GjBfXa7xcvFnXf1FJbVKsJ2+JhONTpX10BY0LNAUaG/Tki7cpIkND6S6D
         6g9N+YxLXVHar3B4qnAr0AAenCHG33SS86ztA2dTKouqtY6TohBpZxKO0R56RfqpdY/U
         QEGAGSoeYQkftfNE9nbNQuxIQ2GVXVoBuvaN+8UUu7AkdB2uW/dz2EG40t5kX2M7bAdf
         Mg44MH02rk/N15HKKYUIK94jekh8xH86vMzHsCRknIHctzV4gv3raqsD2TdvwMttDB54
         oWhA==
X-Gm-Message-State: AOJu0Yw6VcJkcicT2pQ2Gl96wXG0HcMbuw3NpbgkanUVgBtFTIYaUVH3
	0aOFr0u6yX5MclcF1Dot3hFSD9V3MRH0kSWqamdE5fiz8g5dnIogO5I78XKAHPiGtSEy1VGu9R4
	LBW5/35g=
X-Gm-Gg: AfdE7cllwYDrbjuLq4cLHSQfI+JaNqbZ+rZxGftrp+Cl9gqKLg+es+m7YvJoX3JXDAJ
	0ujxIa92G42yQouRKAEM+615rrv/4siNvq9bqHl4kzo/yNE6Eq3raZwHF5TqwqhJAnmKNYsGLmC
	nF3QxXZ9aEsVz87SO1VVnEmljbM6YkbrLsOuJ/efPp1OrQosYO+G9G8DNxVchnoFMvz25Ov99r1
	qZVLabdQPioWs/Ro6wMxsvcJh1/KRj1f8UfAce9N94JwbhJP/+DdSWE4I01VCKZvKvdK+w8kGeV
	fHRxd1QIXuMFHrebDa2p5T/Hojs93x9L0Wl3a4zkkPLnrbDs7VZZAU61ChtbhdtjPQEqBGidPQ/
	vEFKb1SWvJx1Pt9cQ5ufHc33QQDynuZHkRIrB6WVjZpN1xTesZgvKsMOeqaRcl6wHNjGEsqYdr4
	0S0PjwpXSZGDNiksgd4/grA7k=
X-Received: by 2002:a17:90b:3bc7:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38941cc8620mr1872942a91.38.1783502094185;
        Wed, 08 Jul 2026 02:14:54 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm17410076eec.15.2026.07.08.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:14:53 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] log4cplus: upgrade 2.1.2 -> 2.2.0.1
Date: Wed,  8 Jul 2026 14:42:44 +0530
Message-Id: <20260708091244.150085-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240447

From: Siddharth Doshi <sdoshi@mvista.com>

Updated SRC_URI, Homepage, BugTracker, UPSTREAM_CHECK_URI to point to
github page of log4cplus instead of sourceforge as per:
[1] https://github.com/log4cplus/log4cplus/wiki#download

For detailed information, see the link below:
[1] https://github.com/log4cplus/log4cplus/compare/REL_2_1_2...REL_2_2_0_1
[2] https://github.com/log4cplus/log4cplus/blob/REL_2_2_0_1/ChangeLog

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../log4cplus/log4cplus_2.1.2.bb              | 19 -----------------
 .../log4cplus/log4cplus_2.2.0.1.bb            | 21 +++++++++++++++++++
 2 files changed, 21 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
 create mode 100644 meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
deleted file mode 100644
index 9a3c31e887..0000000000
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "log4cplus provides a simple C++ logging API for log management"
-SECTION = "libs"
-HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
-DESCRIPTION = "log4cplus is a simple to use C++ logging API providing thread-safe, flexible, and arbitrarily granular control over log management and configuration. It is modelled after the Java log4j API."
-BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
-
-LICENSE = "Apache-2.0 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
-          "
-SRC_URI[sha256sum] = "e2673815ea34886f29b2213fff19cc1a6707a7e65099927a19ea49b4eb018822"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
-UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
new file mode 100644
index 0000000000..9ba83d8d64
--- /dev/null
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "log4cplus provides a simple C++ logging API for log management"
+SECTION = "libs"
+HOMEPAGE = "https://github.com/log4cplus/log4cplus"
+DESCRIPTION = "log4cplus is a simple to use C++ logging API providing thread-safe, flexible, and arbitrarily granular control over log management and configuration. It is modelled after the Java log4j API."
+BUGTRACKER = "https://github.com/log4cplus/log4cplus/issues"
+
+LICENSE = "Apache-2.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
+
+# Replace dots with underscores to match GitHub's tag format (e.g., 2.2.0.1 -> REL_2_2_0_1)
+GITHUB_TAG = "REL_${@d.getVar('PV').replace('.', '_')}"
+
+SRC_URI = "https://github.com/log4cplus/log4cplus/releases/download/${GITHUB_TAG}/log4cplus-${PV}.tar.gz"
+SRC_URI[sha256sum] = "374175c22fabe752eb1c20138e732b69ae191e641f92d32c9432985cd860a2df"
+
+UPSTREAM_CHECK_URI = "https://github.com/log4cplus/log4cplus/releases"
+UPSTREAM_CHECK_REGEX = "log4cplus-(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


