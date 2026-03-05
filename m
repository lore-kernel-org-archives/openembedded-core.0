Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61667F33A76
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:33:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45377.1772721200203052580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E524339
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 06:33:13 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3BC183F694
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 06:33:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: add back warning for use with musl
Date: Thu,  5 Mar 2026 14:33:10 +0000
Message-ID: <20260305143310.1697365-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 14:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232495

Add back a warning linking to the release notes to alert users that
systemd with musl is still experimental and has limitations compared to
glibc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_259.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_259.1.bb b/meta/recipes-co=
re/systemd/systemd_259.1.bb
index 91deadef4f..34dd37ffff 100644
--- a/meta/recipes-core/systemd/systemd_259.1.bb
+++ b/meta/recipes-core/systemd/systemd_259.1.bb
@@ -904,3 +904,9 @@ pkg_prerm:udev-hwdb () {
 }
=20
 require dlopen-deps.inc
+
+python do_warn_musl() {
+    if d.getVar('TCLIBC') =3D=3D "musl":
+        bb.warn("Using systemd with musl is experimental, see https://gi=
thub.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
+}
+addtask warn_musl before do_configure
--=20
2.43.0


