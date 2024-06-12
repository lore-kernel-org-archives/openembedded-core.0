Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBBBC27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 11:07:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8475.1718190421269031869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 04:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65C711595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:07:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F6DB3F73B
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:07:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/makefile-getvar: add script to get values from Makefiles
Date: Wed, 12 Jun 2024 11:06:58 +0000
Message-Id: <20240612110659.2750133-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 11:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200570

There is often a need to extract a value from a Makefile, and standard
GNU Make doesn't provide a way to do this.  This script lets you access
values from Makefiles directly:

$ makefile-getvar curl/tests/server/Makefile noinst_PROGRAMS
getpart resolve rtspd sockfilt sws tftpd fake_ntlm socksd disabled mqttd

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/makefile-getvar | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 scripts/makefile-getvar

diff --git a/scripts/makefile-getvar b/scripts/makefile-getvar
new file mode 100755
index 00000000000..4a07055e687
--- /dev/null
+++ b/scripts/makefile-getvar
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+# Get a variable's value from a makefile:
+#
+# $ makefile-getvar Makefile VARIABLE VARIABLE ...
+#
+# If multiple variables are specified, they will be printed one per line=
.
+#
+# SPDX-FileCopyrightText: Copyright 2024 Arm Limited and/or its affiliat=
es <open-source-office@arm.com>
+# SPDX-License-Identifier: GPL-2.0-only
+
+set -eu
+
+MAKEFILE=3D$1
+shift
+
+for VARIABLE in $*; do
+	make -f - $VARIABLE.var <<EOF
+include $MAKEFILE
+
+%.var:
+	@echo \$(\$*)
+EOF
+done
--=20
2.34.1


