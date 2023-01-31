Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33296C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 16:30:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17172.1675182627027351791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 08:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 587FE2F4;
	Tue, 31 Jan 2023 08:31:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC2143F64C;
	Tue, 31 Jan 2023 08:30:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] httpserver: add error handler that write to the logger
Date: Tue, 31 Jan 2023 16:30:22 +0000
Message-Id: <20230131163022.3521258-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 16:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176524

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/httpserver.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/http=
server.py
index 2aa172bf799..80752c13770 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -44,6 +44,12 @@ class HTTPService:
             self.port =3D self.server.server_port
         self.process =3D multiprocessing.Process(target=3Dself.server.se=
rver_start, args=3D[self.root_dir, self.logger])
=20
+        def handle_error(self, request, client_address):
+            import traceback
+            exception =3D traceback.format_exc()
+            self.logger.warn("Exception when handling %s: %s" % (request=
, exception))
+        self.server.handle_error =3D handle_error
+
         # The signal handler from testimage.bbclass can cause deadlocks =
here
         # if the HTTPServer is terminated before it can restore the stan=
dard=20
         #signal behaviour
--=20
2.34.1


