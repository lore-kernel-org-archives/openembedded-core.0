Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857FFC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:33:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2928.1748550838533589467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D3A92454
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE02D3F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] lib/oeqa/subprocesstweak: clean up __str__()
Date: Thu, 29 May 2025 21:28:00 +0100
Message-ID: <20250529202802.1198179-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529202802.1198179-1-ross.burton@arm.com>
References: <20250529202802.1198179-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217446

Call super().__str__ to get the bulk of the string representation, and
we don't need to guard on output/strerr existing as they always set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/subprocesstweak.py | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/utils/subprocesstweak.py b/meta/lib/oeqa/utils=
/subprocesstweak.py
index 3e43ed547bd..1774513023b 100644
--- a/meta/lib/oeqa/utils/subprocesstweak.py
+++ b/meta/lib/oeqa/utils/subprocesstweak.py
@@ -8,16 +8,11 @@ import subprocess
 class OETestCalledProcessError(subprocess.CalledProcessError):
     def __str__(self):
         def strify(o):
-            if isinstance(o, bytes):
-                return o.decode("utf-8", errors=3D"replace")
-            else:
-                return o
+            return o.decode("utf-8", errors=3D"replace") if isinstance(o=
, bytes) else o
=20
-        s =3D "Command '%s' returned non-zero exit status %d" % (self.cm=
d, self.returncode)
-        if hasattr(self, "output") and self.output:
-            s =3D s + "\nStandard Output: " + strify(self.output)
-        if hasattr(self, "stderr") and self.stderr:
-            s =3D s + "\nStandard Error: " + strify(self.stderr)
+        s =3D super().__str__()
+        s =3D s + "\nStandard Output: " + strify(self.output)
+        s =3D s + "\nStandard Error: " + strify(self.stderr)
         return s
=20
 def errors_have_output():
--=20
2.43.0


