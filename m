Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487CACDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32854.1782253622494451584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CWwHDkWV;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49249072f03so2150465e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253621; x=1782858421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGUGz12nZ0mMLDekPxUOI0sbehsmwysFzGylWX/PYcw=;
        b=CWwHDkWVBXHX22/Bol8IyjcJr7HTNZNEIzGL0NqvXG40D8cP3/ogjsUtnXMJ0CANS8
         5Nv7Jp30I3gXvo9AuBHnf0yM/dC/ncomsWh8iTy4xe+I76TNEmxwdvsxv8QUEb3ORohB
         8zuZAeeoN8KWXUZ9DdvpvO0vU10lrtsPBNxF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253621; x=1782858421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PGUGz12nZ0mMLDekPxUOI0sbehsmwysFzGylWX/PYcw=;
        b=seqo/rOgc8C6PAmY2s3ZfrRlFOQase+XWAed4F6M24naQf8ojeXBblnBXLK1zooCts
         nch8WEIaRXvsu99bJWgGuxlOjrgqgYP5x9fo8lWLoHxZHe2h30HNpEigvxsgPf5tDhO/
         75LQQKVEp1FJcxNkmeDY6nI4q+UBQk4cAtj2vUW/a194mamAVU7Z/LO0FnP90eSU2RjG
         hSWovWghAxT7aev2IC3x6rc0QOd60LjsOYrdrBdJ/W7aZBmlAw1v4pMj6eflzJbZE1nW
         rFWOmvWFewK/uJ8JEJKtApcZAVg808/tay/BeqyRMflRouncfNCQGB6Q55r68JEKZMNi
         4Zaw==
X-Gm-Message-State: AOJu0YyoE73qeUXxsSNtlzj3AoZwgMjFbNFXdA3MfLDaPdGa4OoA/A26
	+TqpIRA9IfoGOQ1/nmYDMv18zSEp1mVFXmVsnGjQyoA83stcYgCnwN09vIEitH/OGV7dfabe7lF
	lmYyL
X-Gm-Gg: AfdE7cn75IYwItfbApVaW3OjrRCnrNZRj0lv2ei4wg/7Jztrsa3dpylagzvWkB/AB34
	i3p7t1tpISFa6eziack0ELyszv22aDZWUwW4EZQlvHlhTnT1brE3PbUKhLiitQvnxgiWwWMLxqs
	4AgCfz4Y7FEjv/mjvhx9HZYKUF6KOinZ3etL671qfe/8NWgP88lfVu22cg+8l1DLMPefG/L+ki0
	BWndVnG2iv8v/ywkxRbUcnn3MHqUbe/e/lL7LaTYBdDsqqgPKUgXFB43QmorBoZzb9SXImfBrLH
	hA2Iz/xCiEb9EJ2Tn2fML8vT2zlCHpykLiHJWblNHRRbelFtn5LZzRRq4+93bCcMcs2RZCW7Nt+
	7QflRg0PNmEAsXaCwyRLpbiyz8/ef/O7glPXWFaFOSp8SY/M8gF9/zQ+zULqTEJlfTRyWBdtoX9
	zXaKeL8J2f0HxUXucVJS2o7W60OJxTI0Nas31ZZBo2UZO7Tjo3V42kz53xcHTVtpu1r3vhbxfkD
	5UtKx1MpDEcE4kz
X-Received: by 2002:a05:600c:348b:b0:492:46c2:f5b9 with SMTP id 5b1f17b1804b1-49260849710mr6507155e9.3.1782253620633;
        Tue, 23 Jun 2026 15:27:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:26:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 07/41] binutils: Fix CVE-2025-69644
Date: Wed, 24 Jun 2026 00:26:06 +0200
Message-ID: <267ff299a6fe6f65e0dd86f5e59bb013921526ce.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239429

From: Deepak Rathore <deeratho@cisco.com>

This patch updates the existing CVE-2025-69647 backport metadata for
CVE-2025-69644. NVD records for CVE-2025-69644 and CVE-2025-69647
reference the same upstream binutils fix commit [1], and the public
CVE advisories are referenced in [2] and [3].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69644
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc               | 2 +-
 ...VE-2025-69647.patch => CVE-2025-69644-CVE-2025-69647.patch} | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{CVE-2025-69647.patch => CVE-2025-69644-CVE-2025-69647.patch} (96%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 1a865c45f4f..7e83f72632f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -72,7 +72,7 @@ SRC_URI = "\
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
-     file://CVE-2025-69647.patch \
+     file://CVE-2025-69644-CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
similarity index 96%
rename from meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
rename to meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
index 8e3c1c79e7d..c6b3cefed2b 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
@@ -12,11 +12,12 @@ length too.
 	length too small to read header.  Limit length to section
 	size.  Limit offset count similarly.
 
-CVE: CVE-2025-69647
+CVE: CVE-2025-69644 CVE-2025-69647
 
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7]
 
 Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
 ---
  binutils/dwarf.c | 20 ++++++++++++++------
  1 file changed, 14 insertions(+), 6 deletions(-)

