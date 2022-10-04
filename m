Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8B6C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:38 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.12239.1664898697858459006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0rD7j+O5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id y136so13476054pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=+mWL0esawdekxqsHuAzbUUCZidPXzxvamro4YeBzCsQ=;
        b=0rD7j+O55lVs5mPwy7PnKWAlp/WYpvTLiqVc3PcE48uGSJEpdfEza3bAcYHOMZAKva
         9rnZNRFqvxgJklcL1+sltNzOjiCKyPhsGiQuAoNcLJ/P0X4H8oGGLbrOj2a8uGfTPsJq
         +7qxCLxJ4GUCXg8rrp8MU77OgTcO8VDKiTOIUng0CnniprbGXtZPOBl+D27oGp77OQh2
         /G6jYi4eh4XjFMBg4n4yzeUty2YVkbcekt5MVDRZgFZxqUCq44Sv+FQ0NqRLSHDyuz/7
         XGv4cDcMKk7bIau91+hdCRQcKzPPUoCQq/TfajHRsDb4tCapEFC8Mdeefr62Cf/+laHq
         LvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+mWL0esawdekxqsHuAzbUUCZidPXzxvamro4YeBzCsQ=;
        b=B/Ju7euYjZ2PRycXEgJVBymsXoEWRkkpMrRGU3hhxn0CGGkYJo75pPmOJ3j1/naVPy
         dXjRXpgQBRM+mhGYVIKoWPyfiic1t8zkuIDYAv0RsPC/HPpQqVa/iqQsNRDOLb7vGhgV
         G7dQk2eK3rU6Sqs9czjusmYR55NmGdudgE4Db79CkCxe5oz70tZNP4OonOE45pmUkNz+
         MsLK5B+hwhx4YGfisYjbY6SwftP/U8h9hFW1ao5moHJ6spy8rpEegg7gwEzaO7jUMLOu
         Uv7duXdDYAnV3TT+cnMviwD4IxiL95BhlUyxJj8SEvCvy3heVTH4tvPLkA6HMQCxMdii
         Neqw==
X-Gm-Message-State: ACrzQf2FufXrO5qDICgbTqBwdwDXCCQOW2oyyd0gMiAFJFLvMaEXfQmh
	yQhR2aaCqNPDXh1uG6kwzSCLQlc2KH9CMDT3
X-Google-Smtp-Source: 
 AMsMyM5S1H4xcyf6/CtCxX3f2xrd9P0hFl55zG+qqPqoA0XZ/kDRpHAdWKHaVuJcRLNCw8eJhT10xg==
X-Received: by 2002:a62:585:0:b0:55f:203a:1903 with SMTP id
 127-20020a620585000000b0055f203a1903mr18236548pff.11.1664898696644;
        Tue, 04 Oct 2022 08:51:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/18] stress-cpu: disable float128 math on
 powerpc64 to avoid SIGILL
Date: Tue,  4 Oct 2022 05:50:43 -1000
Message-Id: 
 <a3d6742ac066c6dd323c5efd95bed36c30f69127.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171421

From: He Zhe <zhe.he@windriver.com>

float128 requires instructions of xsmaddqp and xsmsubqp which are added to
qemu since v7.0 by the following commit.
https://github.com/qemu/qemu/commit/3bb1aed246d7b59ceee625a82628f7369d492a8f

While kirkstone is still at v6.2 and thus experiences SIGILL as follow
root@qemuppc64:~# stress-ng --cpu 2 --timeout 30s
stress-ng: info: [972] setting to a 30 second run per stressor
stress-ng: info: [972] dispatching hogs: 2 cpu
stress-ng: info: [973] stressor terminated with unexpected signal signal 4 'SIGILL'
<snip>

This is specific to kirkstone since qemu on master branch has upgraded to v7.1.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...le-float128-math-on-powerpc64-to-avo.patch | 43 +++++++++++++++++++
 .../stress-ng/stress-ng_0.13.12.bb            |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch
new file mode 100644
index 0000000000..bb35b3030a
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch
@@ -0,0 +1,43 @@
+From ea9ee4dd64ee88e03a959b2c694aa8feb53c7e78 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 28 Sep 2022 16:47:24 +0800
+Subject: [PATCH] stress-cpu: disable float128 math on powerpc64 to avoid
+ SIGILL
+
+float128 requires instructions of xsmaddqp and xsmsubqp which are added to
+qemu since v7.0 by the following commit.
+https://github.com/qemu/qemu/commit/3bb1aed246d7b59ceee625a82628f7369d492a8f
+
+While kirkstone is still at v6.2 and thus experiences SIGILL as follow
+root@qemuppc64:~# stress-ng --cpu 2 --timeout 30s
+stress-ng: info: [972] setting to a 30 second run per stressor
+stress-ng: info: [972] dispatching hogs: 2 cpu
+stress-ng: info: [973] stressor terminated with unexpected signal signal 4 'SIGILL'
+<snip>
+
+Upstream-Status: Inappropriate [This is specific to kirkstone since qemu on
+master branch has upgraded to v7.1.]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ stress-cpu.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/stress-cpu.c b/stress-cpu.c
+index 0a08f1d1..2849e715 100644
+--- a/stress-cpu.c
++++ b/stress-cpu.c
+@@ -41,6 +41,10 @@
+ #undef HAVE_FLOAT_DECIMAL128
+ #endif
+ 
++#if defined(STRESS_ARCH_PPC64)
++#undef HAVE_FLOAT128
++#endif
++
+ #define GAMMA 		(0.57721566490153286060651209008240243104215933593992L)
+ #define OMEGA		(0.56714329040978387299996866221035554975381578718651L)
+ #define PSI		(3.35988566624317755317201130291892717968890513373197L)
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
index fe177a4de0..807ecd3466 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+           file://0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch \
+          "
 SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


