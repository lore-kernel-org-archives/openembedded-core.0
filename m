Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D847C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 12:55:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53193.1704372948046486319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 04:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DD261007
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 04:56:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6206F3F64C
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 04:55:47 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/parselogs-ignores-qemuarm64: ignore jitterentropy warnings
Date: Thu,  4 Jan 2024 12:55:45 +0000
Message-Id: <20240104125545.2022935-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104125545.2022935-1-ross.burton@arm.com>
References: <20240104125545.2022935-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 12:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193322

From: Ross Burton <ross.burton@arm.com>

Upgrading to kernel 6.6 has bought back the occasional jitterentropy
failures.  Error 9 is "health test failed during initialization": it is
currently unclear if this is specific to the host or is a regression in
the kernel. For now ignore the warning, upstream has been contacted for
further advice.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt =
b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
index 260cdde6207..d58f0ce0f8e 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
@@ -1,3 +1,8 @@
+# With kernel 6.6 on at least ubuntu1804-arm-1 with KVM we get JENT_EHEA=
LTH
+# (Health test failed during initialization) failures. Disable whilst th=
is is
+# investigated.
+jitterentropy: Initialization failed with host not compliant with requir=
ements: 9
+
 # These should be reviewed to see if they are still needed
 Fatal server error:
 (EE) Server terminated with error (1). Closing log file.
--=20
2.34.1


