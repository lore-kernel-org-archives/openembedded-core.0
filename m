Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384F4C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:46 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.33171.1635699525046142760
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MonJu4ZX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r28so15136648pga.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pGfTrv+KyUaNXM4hCNxRA5kOkPqcOoFmxO/9FPe612Q=;
        b=MonJu4ZX7RKBbYuooCtJnXmSTqSqXBiDMKp5WHETeX9h0ZPQ7ezoMNikcg5d457dDX
         3X4k4zWinoWvU9XihKXCrM0y19QpLman8R9cyBk4yMpK+EAoaU4LHhvx8H0HDdFEZJP3
         6bf1zPOOhXvU/xGT0FnKT2gH8puEq4VxooekPSJLSikYrwmppqKgXiE6aX/mIEumh2ci
         FiLleS8KVPuDAVJFhfp/EIYWeVyF/WFRmZI4tyzO4ZpLb+XbeVggxPVMqyKXzSoSBcR1
         w3t1lScBvM6cB/OZeBTMdACb1czqmv2Nn6NmSexD63n+T0DYmFcoRPjTJW5m6czhr0BP
         QLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pGfTrv+KyUaNXM4hCNxRA5kOkPqcOoFmxO/9FPe612Q=;
        b=D0qR5VHR7VcJQ0SAa1zJ+zFseEG2LwHTnVlx373pr7+5raH2OOCyzjbmPlIQUXxzDZ
         XU+QczzVx8Wkd6bBJ1bKi8FbtIUxam3L1J2SQTkZBq6YjRYpEejskN5ZbSElSEfhBn24
         kRtIOhGiFVhwTwRME39ZMYL0IONfUs+4dkcZXbo2wyFiQhVlinLDSASnk9SHxRILs7Ap
         3LwyvkKLXzRSxN0Jkly74ivZQtuZHgvEGmbQ/c0wNy29XykMh80One2VuZum9CBe76qH
         UynZM0WUSF/ckvXX87wJu/sfaAkimLMHN2ywuS5LLBkTdp9shZDuQLshHykWjJcJq8oM
         bp7A==
X-Gm-Message-State: AOAM532Y8l/8VP+oRLZezH9vYYN1b7u1H01Q5k2r6kodtcYHktfFOLL3
	XsuR6n9ZQDJfkxN7VCG8qtl/Y68QhP4En2bnSyQ=
X-Google-Smtp-Source: 
 ABdhPJxi8Il6IouaaVZr0KuQEY+dx2BNtNYxAvmSFfnCk/L57Wf7uiemdNRxPC7sLjr9gb812GES0A==
X-Received: by 2002:a62:3842:0:b0:480:fae5:267a with SMTP id
 f63-20020a623842000000b00480fae5267amr5703516pfa.17.1635699524053;
        Sun, 31 Oct 2021 09:58:44 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/29] stress-ng: improve reproducibility
Date: Sun, 31 Oct 2021 06:57:40 -1000
Message-Id: 
 <41db4f315c0b4a95232c3380918fb944477c2f3f.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157679

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...write-the-timestamp-into-compressed-.patch | 26 +++++++++++++++++++
 .../stress-ng/stress-ng_0.11.17.bb            |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
new file mode 100644
index 0000000000..9dfca0441b
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
@@ -0,0 +1,26 @@
+From 2386cd8f907b379ae5cc1ce2888abef7d30e709a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sat, 23 Oct 2021 20:20:59 +0200
+Subject: [PATCH] Makefile: do not write the timestamp into compressed manpage.
+
+This helps reproducibility.
+
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/156]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 886018f9..f4290f9c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -412,7 +412,7 @@ git-commit-id.h:
+ $(OBJS): stress-ng.h Makefile
+ 
+ stress-ng.1.gz: stress-ng.1
+-	gzip -c $< > $@
++	gzip -n -c $< > $@
+ 
+ .PHONY: dist
+ dist:
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
index af8e77ece2..0533a0e19b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
+           file://0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch \
            "
 SRCREV = "e045bcd711178c11b7e797ef6b4c524658468596"
 S = "${WORKDIR}/git"
-- 
2.25.1


