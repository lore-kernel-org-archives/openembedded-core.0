Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C083BC44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:30 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14780.1783866564913045043
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=bPcpa4td;
 spf=pass (domain: underview.tech, ip: 209.85.128.178, mailfrom: vince@underview.tech)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81e8fa1b8d6so13570417b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866564; x=1784471364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rn5fcWkz4Ldfu8mZhBGw4ruoIyqaxJOURu8JOGY4WA0=;
        b=bPcpa4tdxCkNZ9GSdCRz0Yczz5lqnbOTBhsipCvlyJ5OeKXzm6VKkD8p/tEyWpQn3n
         YalGusoUmjL+d+kd0lLnMUrBjU6axBAqrpkbiQAVl/dk1SwKvREEpRxXCIW4TDJV1SRW
         K6FCKrYYgspYUNF5Fb/ylRdAYXsv/MSFoLDPNzF5cas4u/eCUUHRsEGWLi8e4NYbB4vm
         +U8gH8X0DtYEx38hl7bdoxJtF2SRqizr3Kj0En8Twz9XBCEvV6/Itan7esr6+NGQOr0r
         rd7tllaLeWCilm3+DSVsgw+5G+N39sPhVbsqnwLOfM7v1S2V3S2TxG3lBohp/N6QwWN+
         Jt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866564; x=1784471364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn5fcWkz4Ldfu8mZhBGw4ruoIyqaxJOURu8JOGY4WA0=;
        b=r4F3/adFODFT+cjsPKdvfRy97J0gUbLn3QTMTpggw1cwsOCjKW/8KSrc7s44ZYJ0aG
         T1/NCX80PQpoM6VUyfp5UTQmxPp418ACwlt1hlsKy0D+84B+g2bWiLLSfkZ4evvckKML
         GWA4lihx859wAChTFUSEadk3O6/8diVcX4vz8Y8yK+pBeq45D6euhRTAkO+8HBKbtppX
         J6g+QKT4wk0M39M4fhvZDEX/ZyRJPtRnwtWAbMaFGUrciILbfEKqkrkH6bQID9olGfxH
         KIuShjrZy9ijAl8XGHa26mj8bFQuWSb6n4BGEZDVb8+sAAJMNKsOt01Q62BgvUMSI8BW
         RIkw==
X-Gm-Message-State: AOJu0Yx6szGLDHzBlZrqYXS6iMEYQ0PhNS/dlQIQvGL4fjWc6Cru/30t
	k++YqF1fSOq0WH0b9etWjRzV6Y1FRXrlfwULCZ+ZAd5xwomASP4kw/sRwDOTTodcrnQlg1t/ZG4
	Va/z2/JQ=
X-Gm-Gg: AfdE7cnKt+U8xaMf64CbcYoYIdeP//KfcCbzYyLGIMN+AiaKI5ceuoWJ3C4NIt0ZGXA
	MS/evfKbgGLa/08zEu7slPHRTyeiRiNTUMq6voYHqurEtY6K4KHJOkjhY9B43ScNP3GmC6a7Bol
	dgY9x3hFb05qAO6DVRTed60JkqRHtEnufRTAlATplZUhQ8RbhI0EvYqkaSZpwTlejOMC3whaiH2
	bZxzVKnRsQ6B+RwFCZOzXEVyljw1iwvnSyWCSQWFHMEQ5OUyfN33LpZzG3aBew3zzun0gvxleyA
	itV2j14HQ7O/EFr1FVp9xZOjHt/RS700YLvDacq6hzL2N8Y2F9OsEsjJRqYYDfNZRQgBXDHY0jK
	0s4LA285ANcbhPZShcMtENfUqk6X8OQRUKEIrDpyjtDzi3dlXvNZs89MB9SygfSvU/S9lUjewrE
	nsGDcRzUX9gYEKFQ==
X-Received: by 2002:a05:690c:6d0c:b0:80c:85b6:75bd with SMTP id 00721157ae682-81e902d730emr40699917b3.70.1783866563717;
        Sun, 12 Jul 2026 07:29:23 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:23 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 01/24] bitbake: globally define KERNEL_PACKAGE_NAME
Date: Sun, 12 Jul 2026 10:28:53 -0400
Message-ID: <20260712142916.2573370-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240767

A number of recipes rely on hard coded
kernel prefix set by KERNEL_PACKAGE_NAME
when including modules. This leads to build
time failures such as.

ERROR: Nothing RPROVIDES 'kernel-module-*'

Commit globally defines variable so that
recipes aren't reliant on hardcoded 'kernel'
prefix.

Commit also updates variables

STAGING_KERNEL_DIR
STAGING_KERNEL_BUILDDIR

STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get
changed from default defined in bitbake.conf in
the kernel.bbclass. The reason was to set these
variables to directories under WORKDIR in alternate
kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel)
so that they may build in parallel with the default
kernel without clobbering. The issue is that the variables
only get changed in kernel recipes. So, other recipes
such as perf and make-mod-scripts don't know the
location of virtual/kernel WORKDIR.

Solution is to include KERNEL_PACKAGE_NAME in
STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
so recipes like perf and make-mod-scripts can
find virtual/kernel source and solve the
clobbering of build artifacts issue.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/bitbake.conf | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..569b83a138 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -479,6 +479,9 @@ SDKPATHINSTALL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 # Kernel info.
 ##################################################################
 
+# Globally define base string for kernel packages
+KERNEL_PACKAGE_NAME ??= "kernel"
+
 OLDEST_KERNEL = "5.15"
 
 # SDK_OLDEST_KERNEL can't be set using overrides since there are
@@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL = "3.2.0"
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
 
-STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
-STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
+STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-source"
+STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-build-artifacts"
 
 ##################################################################
 # Specific image creation and rootfs population info.
-- 
2.43.0


