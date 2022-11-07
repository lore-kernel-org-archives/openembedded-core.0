Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7447DC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 22:09:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1040.1667858956109071211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 14:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4882023A;
	Mon,  7 Nov 2022 14:09:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABAAB3F703;
	Mon,  7 Nov 2022 14:09:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] stress-ng: improve makefile use
Date: Mon,  7 Nov 2022 22:09:10 +0000
Message-Id: <20221107220910.193855-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107220910.193855-1-ross.burton@arm.com>
References: <20221107220910.193855-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 22:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172936

Set VERBOSE=3D1 so the compile logs are useful, perform the configure in
do_configure, and set bindir correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb b/meta/=
recipes-extended/stress-ng/stress-ng_0.14.06.bb
index 359560b9e24..b4068b0598b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb
@@ -18,12 +18,15 @@ RCONFLICTS:${PN} =3D "stress"
=20
 inherit bash-completion
=20
-do_compile:prepend() {
+EXTRA_OEMAKE =3D "VERBOSE=3D1"
+
+do_configure() {
     mkdir -p configs
     touch configs/HAVE_APPARMOR
+    oe_runmake makeconfig
 }
=20
 do_install() {
-    oe_runmake DESTDIR=3D${D} install
+    oe_runmake DESTDIR=3D${D} BINDIR=3D${bindir} install
     ln -s stress-ng ${D}${bindir}/stress
 }
--=20
2.34.1


