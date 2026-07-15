Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A50C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:17:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6904.1784125052359736619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EyTqbPJE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BD511477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:17:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E8FE3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125051; bh=0ecR/9z2GfPLYyUESyWUBPgP89spvDkAxK3Npfb5dnI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EyTqbPJEYPsUkIrpGBLsycBHisfEWvfMmGElF61BtHSezMSPu4fQL76oTdKiamfEA
	 anBbH2xBB4Jm9LHJSkIlr+zqCBvwOUB2cY6Fx0PMlkmka2jtEcjuYoOTWr1aSCcJsZ
	 +sCabTqzFmbRDsjY0rai7XK6HzZmAuI2LqBUrYF8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/utils/postactions: invoke coredumpctl on test failures
Date: Wed, 15 Jul 2026 15:17:27 +0100
Message-ID: <20260715141728.2384771-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715141728.2384771-1-ross.burton@arm.com>
References: <20260715141728.2384771-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240973

On a test failure, try running coredumpctl to dump a summary of the core
dumps that were captured by systemd into /var/log/coredumps.txt.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/postactions.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/pos=
tactions.py
index 7b967edaad0..2792c16bccf 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -76,6 +76,18 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artif=
acts_list, outputdir):
         bb.warn(f"Can not retrieve artifacts from test target: {e}")
=20
=20
+#
+# coredumpctl
+#
+def run_coredumpctl_info(d, tc, artifacts_list, outputdir):
+    # "info" shows the last coredump unless you specify a filter. This i=
s the
+    # message ID for coredumps, so it shows all of the coredumps that ar=
e in the
+    # journal.
+    output_file =3D d.expand("${localstatedir}/log/coredumps.txt")
+    cmd =3D f"coredumpctl info MESSAGE_ID=3Dfc2e22bc6ee647b6b90729ab34a2=
50b1 | tee {output_file}"
+    tc.target.run(cmd, ignore_ssh_fails=3DTrue)
+
+
 ##################################################################
 # General post actions runner
 ##################################################################
@@ -93,6 +105,7 @@ def run_failed_tests_post_actions(d, tc):
     os.chmod(outputdir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | sta=
t.S_IROTH | stat.S_IXOTH)
=20
     post_actions=3D[
+        run_coredumpctl_info,
         list_and_fetch_failed_tests_artifacts,
         get_target_disk_usage,
         get_host_disk_usage
--=20
2.43.0


