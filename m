Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45003E83079
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:07:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13189.1770113239069166919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dUMGRf2N;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260203100716a9bc5d530f000207c3-dwg2bg@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260203100716a9bc5d530f000207c3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 11:07:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+tqBvEjRjA/PgKzpIicDs9++nBSx/o8nqybkyYRKE2w=;
 b=dUMGRf2NBzOPs40vkt2jjO/1by1yrRov1AwCIiGsaoDoWT1OC/POU1FYKhbLdpDpOsvOf1
 hOwgttNxdZKB3KlmoCQJLxlKr3qxEt5nBK9Cb39y4dx3afK9cqorbxRqDiyWfL6qDYudgZ46
 ZoRuBQv9yWUaE9TJE+mV+s6YcZ50TopA0A/kT+iSGwYTzxW2OSxrsK5/+/NeAei47PP8AE18
 Xx/JdWWmoDkSYgjnnt2rpBH4GRuv6wUOksaAIUjKtnW+RE+BQRD4NaoHWwskSxj/zRrIIpxE
 dG7qMTxvkG1j2Zzv92jcFd2Dg+EsX2GoYMl8eQ1n0BacUxhymMRU6PVQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] systemd: properly package new container files
Date: Tue,  3 Feb 2026 11:07:13 +0100
Message-Id: <20260203100713.2779105-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230426

From: Peter Marko <peter.marko@siemens.com>

Since last systemd upgrade these files are packaged in systemd package
and thus systemd-container is unconditionally installed in all images as
dependency of systemd package.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_258.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core/systemd/systemd_258.1.bb
index 410396f308..da0c07d2fa 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -526,7 +526,9 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/busnames.target.wants/org.freedesktop.machine1.busname \
                          ${systemd_system_unitdir}/local-fs.target.wants/var-lib-machines.mount \
                          ${systemd_system_unitdir}/machines.target.wants/var-lib-machines.mount \
+                         ${systemd_system_unitdir}/sockets.target.wants/systemd-machined.socket \
                          ${systemd_system_unitdir}/remote-fs.target.wants/var-lib-machines.mount \
+                         ${systemd_system_unitdir}/container-getty@.service \
                          ${systemd_system_unitdir}/machine.slice \
                          ${systemd_system_unitdir}/machines.target \
                          ${systemd_system_unitdir}/org.freedesktop.import1.busname \
@@ -536,6 +538,9 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/systemd-machined.socket \
                          ${systemd_system_unitdir}/dbus-org.freedesktop.machine1.service \
                          ${systemd_system_unitdir}/var-lib-machines.mount \
+                         ${systemd_user_unitdir}/machine.slice \
+                         ${systemd_user_unitdir}/machines.target \
+                         ${systemd_user_unitdir}/systemd-nspawn@.service \
                          ${nonarch_libdir}/systemd/systemd-import \
                          ${nonarch_libdir}/systemd/systemd-importd \
                          ${nonarch_libdir}/systemd/systemd-machined \

