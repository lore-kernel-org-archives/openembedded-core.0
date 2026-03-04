Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24E4EFCE53
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 23:11:56 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31756.1772665907306660749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 15:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=epdevl+p;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260304231144186a4a4b45000207ff-fdwwe_@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260304231144186a4a4b45000207ff
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 00:11:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rvhpUBs0P2Jr4oWNrnulTHQ6ptib4R7S5T6cVB/eYU8=;
 b=epdevl+pzzptyIMMiKhY7ai8cmcDq3vTp9kF4rYGW4NOOlwt8ALzbeod9xXNABlAonULP0
 VaUw0otPY2X0ZppcOWkC5Akk6nnsKjD/Q7awsJMOFWOoACe/CmmEFIoXInDsLXui0Nzaxd3U
 SX9UArkNtRMhjBq0DBV7k9QIfhoKNT8ctui0czEPFjbjcwJdnBVZmGCUU/1TbC3MLgF3eAom
 65YTGbLA60geeW6rnPWxASCvNTXnHiECssinlmsALMW0qPlVDRZHpTXmJMv85D/Cr17z27X6
 0bPQHvEMacmFof0s/cEohKObPqISMNXEURKBPOkCgBk+i2d7SRGGw3Vw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] systemd: properly package new container files
Date: Thu,  5 Mar 2026 00:11:38 +0100
Message-Id: <20260304231139.451840-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 23:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232442

From: Peter Marko <peter.marko@siemens.com>

v259 added more container files which need to ba correctly packaged.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_259.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_259.1.bb b/meta/recipes-core/systemd/systemd_259.1.bb
index 91deadef4f..177b769116 100644
--- a/meta/recipes-core/systemd/systemd_259.1.bb
+++ b/meta/recipes-core/systemd/systemd_259.1.bb
@@ -515,8 +515,12 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/systemd-machined.socket \
                          ${systemd_system_unitdir}/dbus-org.freedesktop.machine1.service \
                          ${systemd_system_unitdir}/var-lib-machines.mount \
+                         ${systemd_user_unitdir}/sockets.target.wants/systemd-machined.socket \
+                         ${systemd_user_unitdir}/dbus-org.freedesktop.machine1.service \
                          ${systemd_user_unitdir}/machine.slice \
                          ${systemd_user_unitdir}/machines.target \
+                         ${systemd_user_unitdir}/systemd-machined.service \
+                         ${systemd_user_unitdir}/systemd-machined.socket \
                          ${systemd_user_unitdir}/systemd-nspawn@.service \
                          ${nonarch_libdir}/systemd/systemd-import \
                          ${nonarch_libdir}/systemd/systemd-importd \
@@ -525,6 +529,7 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
                          ${exec_prefix}/lib/tmpfiles.d/README \
                          ${systemd_system_unitdir}/systemd-nspawn@.service \
+                         ${datadir}/dbus-1/services/org.freedesktop.machine1.service \
                          ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
                          ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
                          ${datadir}/dbus-1/system.d/org.freedesktop.import1.conf \

