Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA118C44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:26 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.929.1783881800332054911
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=DmccMPnW;
 spf=pass (domain: underview.tech, ip: 74.125.224.54, mailfrom: vince@underview.tech)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66628618509so3111131d50.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881799; x=1784486599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rn5fcWkz4Ldfu8mZhBGw4ruoIyqaxJOURu8JOGY4WA0=;
        b=DmccMPnWkFH6P3jyfkkiiqQtZKbJggITGK3z6+0sHwTuQ6LFMJpHXbACsxZE/oXIjJ
         J5ZOkmnOrmzVlVVI+KW2x4ijbn7zdLJuvsyScwVMdwvGX2lYbwgRYOULgqOQwoKR2yjD
         tTm1z/iRxJMd1yuNM1yTQmLDS2ePSE1BwFAKdLxm1tdSYX4srfPk1jF/AeGIBxW3G4A2
         uukP9aysuIkIEnAvPpzxEd+HF2I3NbawYQlxyAI1Euw/QauQke9Is7CM9Gn1ARoKusZD
         9FgTAtNQt2tsVVmTFW4oBXPLbu8ij3B9DT7BvZcGVBJN+aAmSod2WSDJj0wKqzce+X4S
         sqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881799; x=1784486599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn5fcWkz4Ldfu8mZhBGw4ruoIyqaxJOURu8JOGY4WA0=;
        b=GFew0fQgNwUhGg6vlqnMM47H35PfPCGEETNHQ6T+cQi5aIrZO/NEp4Jk7JoskIc/ke
         41D5zYsCVFCFs6vsl1/+tDl/t7wIgM+fmLBFeoawua07vrF8YrQYGNp5o7twWo7RnFmn
         d1X7US3Dvu9AL70HNYHjwE+R+WDeqoiAxqIMvl0vZ4sSkRRiynixi7Y6d9lkIXQ0c3Km
         w6nOqk/gmORwzQnSnJAjt/G4JkNpKY/gKgAmKkiTD92BQbYSjGCEHUA0ZTef2podi7kT
         bkCIZhr86gaml84W0yj50E86lIPEDIxNNhKe1km9UATlHAoOdYdp+knjTcMMw7wQ2d6y
         18eg==
X-Gm-Message-State: AOJu0YwyXLko5z2w/rcMpNpA3RYFf3FcXJamosrNaPqCrACxTkSsaJvP
	85LBxqB2KI7YP3S0ovASykW+nFBkSTS4g729l3aT673p+PXlHi+N8o+9nE1DTuXVc2O7iOXzfon
	CsrspEnw=
X-Gm-Gg: AfdE7cnPTBLbslnk/eP/r6xX5HgGjzfsa+C894+670MdLDZULcpHtOSeSwXBMqnLOqc
	3cuc/bDN6wt7UvZR8IlOa8QSo3Qn9sAy98xHNOqThNL2KBdZfkNWe+ORqVCYbSkW4waij5iK+BI
	wgk4ExiCoaQtzjnsU/N4ZCg5mqmuO6NVLKoH75/04xVzPsRrGaAcs+OJinpocmAKD+5I02pbnl5
	oKiFixiT135Q4dPh91YPORUfUxKP+796P3eb764Mp5GP1BEe0nzvgffykBK2JN9FHtwrQ+QGIx/
	G56hushGOVbFsfbqP5GKd/QrcPK/vV6JDNTCHxuRw7GTyGSe+bOaJ9F1y8mKhQQEYUrJgiCmStT
	Enur0ZTExsaHb1YoO4JeecZJ3gY17eUtkRjZ7tQBBnK4Mr/ekFHOoy2qqjdlUkohEebN8ocjGoq
	8WRgVPKCawfwYssIpR+eeWhtPQ
X-Received: by 2002:a05:690e:418b:b0:667:bbca:5112 with SMTP id 956f58d0204a3-667d7c925bbmr3903817d50.78.1783881799138;
        Sun, 12 Jul 2026 11:43:19 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:18 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
Date: Sun, 12 Jul 2026 14:42:41 -0400
Message-ID: <20260712184307.3259642-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240791

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


