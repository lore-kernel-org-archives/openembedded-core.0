Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9666DD6A224
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 17:43:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.288.1731606221687087691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 09:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0026E1474
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 09:44:10 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8C673F6A8
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 09:43:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ping: don't bother trying to ping localhost
Date: Thu, 14 Nov 2024 17:43:36 +0000
Message-Id: <20241114174336.3793581-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 17:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207176

If SLIRP is being used instead of TAP for networking to the guest then
the target IP will be localhost.  There's no point in pinging localhost
to see if the target is up but whilst you'd think it is harmless, in
some containers ping doesn't actually have enough rights to work:

  ping: socktype: SOCK_RAW
  ping: socket: Operation not permitted
  ping: =3D> missing cap_net_raw+p capability or setuid?

Look at the target address and if it's localhost or 127.0.0.* return
immediately.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/ping.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/=
cases/ping.py
index f72460e7f3f..bc543f6c41e 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -18,6 +18,13 @@ class PingTest(OERuntimeTestCase):
         output =3D ''
         count =3D 0
         self.assertNotEqual(len(self.target.ip), 0, msg=3D"No target IP =
address set")
+
+        # If the target IP is localhost (because user-space networking i=
s being used),
+        # then there's no point in pinging it.
+        if self.target.ip.startswith("127.0.0.") or self.target.ip in ("=
localhost", "::1"):
+            print("runtime/ping: localhost detected, not pinging")
+            return
+
         try:
             while count < 5:
                 cmd =3D 'ping -c 1 %s' % self.target.ip
--=20
2.34.1


