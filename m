Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA081C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 14:16:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7061.1641305788011669373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g4Cq4iug;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id q16so76489403wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHxESW34wfGdpW/EFQ5Roe60Pu/g4G65T1X86gIt/8E=;
        b=g4Cq4iug1bT8Qs4uOpfBz0YAD+9oheXElV/vGG1ZZ8dX7FKW37CYBKKPOviwOshcvz
         9CIjCZ7gDgzG2Vtvuw0TSkt+d3t+XAXde34btjG92gCgeR4Yx1c7Tl9ESM1EIEZV7RjL
         AGhumMYGD4P1Y9cGgSzHTt/tbmRIrr0jU0oMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHxESW34wfGdpW/EFQ5Roe60Pu/g4G65T1X86gIt/8E=;
        b=6OXxaXDgbBo3NwI+S1FtriHEjhzijSrNWBgweaPFytpmO5tIfF1h2Y160WE79waJ19
         WCwQu8N7IP/EpD63SQ7g5ETSIof/syFWI3dxPaWNMTga00Wkxh9J8jfkDUUZa+aSGpui
         DOtCsRXTbh0srkPICqV0AztkWmVVFN9vXCW48bMTVL2cgZMmehco5/ZHM3AbTSmAg4uy
         pk1HowdUL+QjS0Vde0+1NZnBE8BbAF/7EntNoaYBV8KVNnv1iXRJjU8W8isr47umwaq0
         Ler/WUPXbPpfVRvVX657nhEqjLY+e14P9BCxp2Fn7/l7/3d2dtsrXkcpvxjOA6mi2kpM
         FhVQ==
X-Gm-Message-State: AOAM533APuN1hnNbzoZx7PthpBlhmC3P4ggDHbs3tjBPGkqLRsPgV10e
	niBGgof1YVuM52KJHSCALX+qffdflnxTAg==
X-Google-Smtp-Source: 
 ABdhPJxtuWcUPTd4x3TV0GS/PAzNS3K/k4KnayTz3cLTmN6XvEsTqCLHEPiAIs2g9LJB48mRxKU78Q==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr42677718wrw.486.1641305786217;
        Tue, 04 Jan 2022 06:16:26 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 h204sm38270838wmh.33.2022.01.04.06.16.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:16:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] package_deb/ipk/rpm: Add more minimal do_build
 dependencies back
Date: Tue,  4 Jan 2022 14:16:22 +0000
Message-Id: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 14:16:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160162

The dependencies for do_build became a little too minimal after the
removal of recrdeptask since "bitbake go" would not package go-runtime
despite it being in DEPENDS and the resulting package having a dependency
on it.

A reasonable compromise is probably rdeptask instead of recrdeptask
which is a lot lower overhead but makes the build target more useful
and importantly, lets world builds do what you'd expect them to.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 1 +
 meta/classes/package_ipk.bbclass | 1 +
 meta/classes/package_rpm.bbclass | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 1ae6393d37d..2e75e222bcb 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -316,6 +316,7 @@ do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_deb after do_packagedata do_package do_deploy_source_date_epoch before do_build
+do_build[rdeptask] += "do_package_write_deb"
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 902b7f94c84..f67cb0e5c90 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -275,6 +275,7 @@ do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_ipk after do_packagedata do_package do_deploy_source_date_epoch before do_build
+do_build[rdeptask] += "do_package_write_ipk"
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b0754421a33..e9ff1f7e65c 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -749,6 +749,7 @@ do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_rpm after do_packagedata do_package do_deploy_source_date_epoch before do_build
+do_build[rdeptask] += "do_package_write_rpm"
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
-- 
2.32.0


