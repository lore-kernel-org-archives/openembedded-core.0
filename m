Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AA1E77182
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 13:25:19 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.10293.1733837116103420020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 05:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm2 header.b=K6MPk4LF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-456497-2024121013251039017a0fa7d4ea2472-yo_tag@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024121013251039017a0fa7d4ea2472
        for <openembedded-core@lists.openembedded.org>;
        Tue, 10 Dec 2024 14:25:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nSctxGKd5WU86WAdryZSSuhsfFqjJCCrBdUSoam5TWY=;
 b=K6MPk4LFVzBN3rO6kt9Qc5Em6JQRWp1Yww0vwxs+65sG6s+6jRhfez5OXMKdyB4oXCF87t
 Nv/ZI1Z0CKNbvgUUGt54Jrz0dqeaR3Degw4lLCV8di4OEoXs4Z60Y0/VQ7qcdHW/RXxUjmpF
 1atfSOvXrS3mZ/rP2U2P3lGNCoWwMVoHse46gJNcYqlBQJUlR0KF2LKqoyALRsO2cz7yMfhw
 YY0e1FHY1jn7vw3Z2a0tb5MB3chfgkRnduwRWA79MxD4i6m8DByOam8senEBKhX12S2kMS5+
 H2A6tMKRP5vus6PgTOoLlAZ2N5MI/EjsHW2l7GpXoQ0PQJTsqNrU5xeQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Joe Slater <joe.slater@windriver.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] systemd: actively disable Predictable Network Interface Names if !pni-names
Date: Tue, 10 Dec 2024 14:25:03 +0100
Message-ID: <20241210132507.2240753-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208536

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Currently pni-names PACKAGECONFIG option adds "mac" names policy if
selected, but nothing otherwise. In systemd Predictable Network Interface
Names are applied by default which leads to inconsistend behaviour.

One could think that pni-names in DISTRO_FEATURES would enable or disable
Predictable Network Interface Names, but currently if not present it's
only actively disabled for QEMU via kernel command line
(commit 9e9c33d51e40
("qemuboot/runqemu: Fix 6.2 and later kernel network device naming")).
It has no effect on the real HW. If the option is present, it merely adds
"mac" into default NamePolicy, which may or may not have observable
effects.

Make pni-names semantics more consistent by actively suppressing
Predictable Network Interface Names if the feature is not present.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta/recipes-core/systemd/systemd_256.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index c1915d7e941..2b5a90aacbc 100644
--- a/meta/recipes-core/systemd/systemd_256.8.bb
+++ b/meta/recipes-core/systemd/systemd_256.8.bb
@@ -390,6 +390,9 @@ do_install() {
 		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
 			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
 		fi
+	else
+		# Actively disable Predictable Network Interface Names
+		sed -i 's/^NamePolicy=.*/NamePolicy=/;s/^AlternativeNamesPolicy=.*/AlternativeNamesPolicy=/' ${D}${nonarch_libdir}/systemd/network/99-default.link
 	fi
 }
 
-- 
2.47.1


