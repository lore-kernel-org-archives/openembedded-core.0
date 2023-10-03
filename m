Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ED6E75454
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 12:25:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.106570.1696335946453501128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 05:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12C891FB;
	Tue,  3 Oct 2023 05:26:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15AFB3F59C;
	Tue,  3 Oct 2023 05:25:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/runtime/parselogs: ignore jitterentropy health failure
Date: Tue,  3 Oct 2023 13:25:42 +0100
Message-Id: <20231003122542.764073-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188634

From: Ross Burton <ross.burton@arm.com>

Sometimes the jitterentropy RNG fails to initialise on boot.  My hunch
is that this is due to the hardware timer not being high resolution
enough combined with running inside a virtualised machine on a loaded
host, and whilst the message looks bad it basically says "driver not
suitable for hardware".

I've contacted the author of the jitterentropy code to confirm or deny
this hunch, but until then we can easily ignore the failure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index a805edd79dd..a1ffb93b8e4 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -65,6 +65,7 @@ common_errors =3D [
     "Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Opera=
tion not supported",
     "Failed to read LoaderEntryOneShot variable, ignoring: Operation not=
 supported",
     "invalid BAR (can't size)",
+    "jitterentropy: Initialization failed with host not compliant with r=
equirements: 9"
     ]
=20
 x86_common =3D [
--=20
2.34.1


