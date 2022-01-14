Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9869CC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 02:47:40 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.2381.1642128460060687301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 18:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g8Yq8KOc;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id i30so1589067pgl.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 18:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0J9SEur8dKloy8OYIUPmL8kQTr/Zs7DFwk1R4bZpoYw=;
        b=g8Yq8KOcbRcZys752D+hA6zcS86MR1nOyHhu7eG3z6/TdqOY/cEKMaPiva4AoRGcX9
         DDSqL9CKvrn6Xu7v+V/zmcIU51qIqQDi+CYGYZCm/lJw3tMNd18EvnPUFrJyuBKrvlwa
         ZURTIx0fxXZ9Zd6FredCjoWQALmwZ4Aot/jU0rCUlsEr662TUqxD7aUXrFyh5USz1mGV
         gQhP8nfytlgeiuWmI6T9eVZtx+UneMajsfv2Skw3Fi3bZ32pLJbfEwditZ+38lQxk5kz
         xMyTapP/lkysX33UfMHGZIQW4eT9Q7JASRb/vfw+G0ZG3JTR1/5mzk20I7gX9xssC5if
         44LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0J9SEur8dKloy8OYIUPmL8kQTr/Zs7DFwk1R4bZpoYw=;
        b=CCHa9PFc5S7p72MwwkT1Fm5v0f5lU8WidvkrDKusCLzo1zWB5I/yDBoFtMX3+fjgib
         BtZOKhwhDMWO2wBTT96Qp4emHHt5DrPB/wKCe6CIxxZfa1xh+Ap3YkUhAgKRowCpBeu0
         FTYgSjehgZwIBhixOH1uNqDTnjkEGcvJEGiXQlx9n9N7JFSgHDAiQOY0Vn+Gr5Y+O/qL
         llCL6+ItqPeTzvtfKwFv5h83IcKdsFOfM1e258B34+eiTSItz8+0yyQx3+MYOQUhGc06
         eeiXIXs8KLuQdqfAxzQZdUGhRVtci2xA9FhNsxP+l9AjvIPaujbvvUgCFnCgFyMAUb6t
         sL7A==
X-Gm-Message-State: AOAM533KNDgytgTrV2jFCSPP4FF9WrnJe+SgPUNwIyxS+cW4PHvTnrKf
	RlPQpq4EpUarh5Zp1M6AToR/XYyhy0uStQ==
X-Google-Smtp-Source: 
 ABdhPJwcnUKjs/LiFKT/S+nP6UdrT7/M5joKrWLAFZiaTML85pbluCCmpbXmIexsSsC9c9V1qnbjwA==
X-Received: by 2002:a63:90c8:: with SMTP id
 a191mr6497845pge.622.1642128459150;
        Thu, 13 Jan 2022 18:47:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 em22sm3935211pjb.23.2022.01.13.18.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 18:47:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] valgrind: Avoid accessing network in ptest task
Date: Thu, 13 Jan 2022 18:47:36 -0800
Message-Id: <20220114024736.504971-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 02:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160554

Avoid calling docs validation and manpages validation to avoid it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Patchout offending code accessing network

 .../0001-docs-Disable-manual-validation.patch | 36 +++++++++++++++++++
 .../valgrind/valgrind_3.18.1.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
new file mode 100644
index 00000000000..256ddb0c343
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -0,0 +1,36 @@
+From 99fc6fe9b66becac3c94068129e84217330a71a6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jan 2022 18:26:02 -0800
+Subject: [PATCH] docs: Disable manual validation
+
+validating manual and manpages, this task involves calling xmllint which
+accesses network and --nonet option also does not disable this,
+therefore disable it.
+
+Fixes
+| error : Resource temporarily unavailable
+| ../callgrind/docs/cl-manual.xml:4: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
+|  <!ENTITY % vg-entities SYSTEM "../../docs/xml/vg-entities.xml"> %vg-entities; ]
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ docs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index d4250e8..c500306 100644
+--- a/docs/Makefile.am
++++ b/docs/Makefile.am
+@@ -192,7 +192,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+ 	  touch $@; \
+ 	fi
+ 
+-check-local: valid-manual valid-manpages
++check-local:
+ 
+ # The text version of the FAQ.
+ FAQ.txt:
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
index 7837034f92e..2305889ab4e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-Implement-linux-rseq-syscall-as-ENOSYS.patch \
+           file://0001-docs-Disable-manual-validation.patch \
            "
 SRC_URI[sha256sum] = "00859aa13a772eddf7822225f4b46ee0d39afbe071d32778da4d99984081f7f5"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.34.1


