Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32DAC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 17:13:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25103.1750180421179772360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 10:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB5DD150C
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:13:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 584413F673
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:13:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oeqa/selftest/esdk: remove postconfig argument
Date: Tue, 17 Jun 2025 18:13:31 +0100
Message-ID: <20250617171332.3162295-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617171332.3162295-1-ross.burton@arm.com>
References: <20250617171332.3162295-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 17:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218912

Discovered when looking for users of get_bb_var()'s postconfig argument,
this wrapper around runCmd() has a postconfig argument that has odd
behaviour: it _appends_ the new configuration to local.conf instead of
having them used for this specific run (unlike the other functions in
commands.py)

None of the eSDK tests use this functionality, so remove it. Future test
cases that need to write further configuration should do so directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/esdk.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/esdk.py b/meta/lib/oeqa/selftes=
t/cases/esdk.py
index 9f5de2cde7f..7a5fe00a082 100644
--- a/meta/lib/oeqa/selftest/cases/esdk.py
+++ b/meta/lib/oeqa/selftest/cases/esdk.py
@@ -27,11 +27,7 @@ class oeSDKExtSelfTest(OESelftestTestCase):
         return glob.glob(pattern)[0]
=20
     @staticmethod
-    def run_esdk_cmd(env_eSDK, tmpdir_eSDKQA, cmd, postconfig=3DNone, **=
options):
-        if postconfig:
-            esdk_conf_file =3D os.path.join(tmpdir_eSDKQA, 'conf', 'loca=
l.conf')
-            with open(esdk_conf_file, 'a+') as f:
-                f.write(postconfig)
+    def run_esdk_cmd(env_eSDK, tmpdir_eSDKQA, cmd, **options):
         if not options:
             options =3D {}
         if not 'shell' in options:
--=20
2.43.0


