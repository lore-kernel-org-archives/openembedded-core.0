Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D0D6E2CC
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 17:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2579.1766079773940705287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 09:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 558CFFEC
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14A843F73F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] scripts/makefile-getvar: be more resilient
Date: Thu, 18 Dec 2025 17:42:43 +0000
Message-ID: <20251218174248.2580279-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 17:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228128

Check that we've been passed enough arguments (at least the Makefile and
one variable), and that the Makefile specified is actually a file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/makefile-getvar | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/makefile-getvar b/scripts/makefile-getvar
index 4a07055e687..e8a98327667 100755
--- a/scripts/makefile-getvar
+++ b/scripts/makefile-getvar
@@ -11,9 +11,20 @@
=20
 set -eu
=20
+if [ $# -lt 2 ]; then
+	echo "Get a variable's value from a Makefile:"
+	echo "$ makefile-getvar Makefile VARIABLE VARIABLE ..."
+	exit 0
+fi
+
 MAKEFILE=3D$1
 shift
=20
+if [ ! -f $MAKEFILE ]; then
+	echo $MAKEFILE is not a file
+	exit 1
+fi
+
 for VARIABLE in $*; do
 	make -f - $VARIABLE.var <<EOF
 include $MAKEFILE
--=20
2.43.0


