Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3928FD711BE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:53:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2982.1766091204385204739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD3DD106F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:53:16 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D4143F73F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:53:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kea: remove more host paths
Date: Thu, 18 Dec 2025 20:53:18 +0000
Message-ID: <20251218205318.1605573-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218205318.1605573-1-ross.burton@arm.com>
References: <20251218205318.1605573-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228166

If ccache is in use then the full path to ccache is resolved, and ends
up in both config.report and then config_report.cc.  This results in
build paths in libkea-cfgrpt.so.3.0.0, so we should also remove
HOSTTOOLS_DIR from these files to ensure both reproducibility and no
host contamination.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_3.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.1.bb
index 8729b1162ea..a4950e3bc16 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -57,7 +57,9 @@ do_configure:prepend() {
=20
 # patch out build host paths for reproducibility
 do_compile:prepend:class-target() {
-    sed -i -e "s,${WORKDIR},,g" ${B}/config.report
+    sed -i -e "s,${WORKDIR},,g" -e "s,${HOSTTOOLS_DIR}/,,g" \
+        ${B}/config.report \
+        ${B}/src/lib/process/cfgrpt/config_report.cc
 }
=20
 do_install:append() {
--=20
2.43.0


