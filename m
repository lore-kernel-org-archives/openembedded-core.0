Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9731EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 11:00:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14009.1688554840578834999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 04:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 926A91756;
	Wed,  5 Jul 2023 04:01:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B342C3F762;
	Wed,  5 Jul 2023 04:00:39 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case
Date: Wed,  5 Jul 2023 12:00:38 +0100
Message-Id: <20230705110038.3699483-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183886

From: Ross Burton <ross.burton@arm.com>

str.format() doesn't use % notation, update the formatting to work.

assertTrue() is a member of self not a global, and assertTrue(True) will
always pass. Change this to just self.fail() as this is the failure case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/c=
ases/rpm.py
index fa86eb05373..a4ba4e67698 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -59,8 +59,8 @@ class RpmBasicTest(OERuntimeTestCase):
                     return
                 time.sleep(1)
             user_pss =3D [ps for ps in output.split("\n") if u + ' ' in =
ps]
-            msg =3D "There're %s 's process(es) still running: %s".forma=
t(u, "\n".join(user_pss))
-            assertTrue(True, msg=3Dmsg)
+            msg =3D "User %s has processes still running: %s" % (u, "\n"=
.join(user_pss))
+            self.fail(msg=3Dmsg)
=20
         def unset_up_test_user(u):
             # ensure no test1 process in running
--=20
2.34.1


