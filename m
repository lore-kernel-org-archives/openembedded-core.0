Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1554C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 12:57:00 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web10.30002.1655470613540530057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 05:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=lifBx1eF;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=lC7Jq1iwVpJ5LmfUhjrhfknWNW9mYLaz5Zcgjt+m08U=;
	b=lifBx1eF4AbRIIEJnDZQ9DYjgC9PyzX0eP7nQQU9vJ2p87uYjpzPzaUmgc6BaZkC+xVME4PPDpGlA
	 rjEkrTFutdcMwdbqQxV0BN1jZTL7J/H0buHz8TaWdVPiYXU+6PP2al5JmobC5FFVFaGQc/k3uXdVFP
	 rHM7jK4YKJ4tMAZ1zsUHWX3xVRwuQrqX15xXAkeDGBMpc2xgZaA+djAQv7m030V6+yOuLf46qED8pC
	 T5PBKAqcLrgrSK6VloXQE4o1S0gaUWQzIftKpiIo8+HU5l/ZQrRguRcagS5yUM9qRUDXtkszb4PRUD
	 +YYiSGFtoJsdC24p/0ox8tOoc6yNtjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=lC7Jq1iwVpJ5LmfUhjrhfknWNW9mYLaz5Zcgjt+m08U=;
	b=pq1kgLt1iaMoJlLTnAQ/ZlA04KuKHS02sqDBYgQQsapjFYdu6SupIWT6S+HsUJeQX6gGypjC3HmJd
	 VkxnNU/Dg==
X-HalOne-Cookie: 41c1f7d7c60ee30374fa9150483b086b84eb1adc
X-HalOne-ID: e8f5f0ed-ee3c-11ec-a6c1-d0431ea8a283
Received: from pbergin-7420.localdomain (unknown [83.218.73.98])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id e8f5f0ed-ee3c-11ec-a6c1-d0431ea8a283;
	Fri, 17 Jun 2022 12:56:50 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] systemd: add packageconfig for sysext
Date: Fri, 17 Jun 2022 14:56:19 +0200
Message-Id: <20220617125619.143219-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 12:57:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167024

Currently the sysext binary is packaged in systemd-utils and
the service systemd-sysext.service in systemd package. Add a
PACKAGECONFIG for sysext to actively choose if it is going to
be installed or not, default off. If installed it will be added
to systemd package.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-core/systemd/systemd_251.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index 8370bec0ca..5a21e7b513 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -186,6 +186,7 @@ PACKAGECONFIG[rfkill] = "-Drfkill=true,-Drfkill=false"
 PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
+PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
 PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
 # When enabled use reproducble build timestamp if set as time epoch,
@@ -522,7 +523,6 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
                         ${bindir}/systemd-stdio-bridge \
-                        ${bindir}/systemd-sysext \
                         ${base_bindir}/systemd-ask-password \
                         ${base_bindir}/systemd-tty-ask-password-agent \
                         ${systemd_system_unitdir}/systemd-ask-password-console.path \
-- 
2.34.1


