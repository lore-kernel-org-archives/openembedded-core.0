Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6731.1793974454768821128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=LUyjU10b;
 dkim=pass header.i=@berginkonsult.se header.s=ed1 header.b=gVe8rw/6;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793974452; x=1794579252;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=8fccGkEZsVD9vNHbDl9sEDiVSZvwpFa7V6mHYiDH7WE=;
	b=LUyjU10bTB6LDoZinc9GFXL0rrAsHkyEEj2X1BhbnWi+1yvA0y6ww2YbANa4mzNWh2UniA2RKyZek
	 aNNfv6K3n88rnd5GmrvjfvMbRJ2c/yBebn1/5jBxTBPEjMHFTDDo4PgbtvsyOmiXuoyA3F46a7EoS4
	 3VLTqc3/VrW0NRGHFM/ILDi9g4Qc9Z/TsMQdkTNkIeqUlYqrI+J3bHDOlwJUR9td8DxUSq8c6nN7Qv
	 gBRuZgl+UpPudXvt7knP6MU+x+GFoqK9e+NrAKHSJeVK0ZmMniv9oK8ohYShu+y93ibyRJiLMArufL
	 0fj3eEl9UfP1PRa80e/9xE2rKjBic7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793974452; x=1794579252;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=8fccGkEZsVD9vNHbDl9sEDiVSZvwpFa7V6mHYiDH7WE=;
	b=gVe8rw/6sUHGAhvuJqJpw9Da76fV+qulUa0oqOJgm9y4QkXjxHXZ6mIGDxdk/ndzdqOcIk0tVCW6j
	 GwkgOg+AQ==
X-HalOne-ID: 553c9e1a-d9ec-11f1-9ed4-adacc84a9bfa
Received: from pbkserver2.metrum.local (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 553c9e1a-d9ec-11f1-9ed4-adacc84a9bfa;
	Fri, 06 Nov 2026 14:14:12 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] oe-selftest: rootfspostcommandstests: fix check for default sort command
Date: Fri,  6 Nov 2026 15:14:08 +0100
Message-ID: <20261106141408.2757659-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249654
Content-Type: text/plain; charset="utf-8"

Since commit [1] SORT_PASSWD_POSTPROCESS_COMMAND defaults to
"tidy_shadowutils_files" without the trailing ';', so the check never
matched and both tests in ShadowUtilsTidyFiles have been skipped ever
since. The yocto-4.3 regression report [2] shows both going from
PASSED to SKIPPED. Fix the check so the tests run again.

[1] https://git.openembedded.org/openembedded-core/commit/?id=c3365dfd9ddd7fbe70b62e0f11166e57a8ca6f73
[2] https://downloads.yoctoproject.org/releases/yocto/yocto-4.3/testresults/testresult-regressions-report.txt

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Fixes: c3365dfd9ddd ("classes: Drop ';' delimiter from ROOTFS/IMAGE*COMMAND variables")
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py b/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
index 44e2c09a6f..46940a2eb1 100644
--- a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
+++ b/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
@@ -34,7 +34,7 @@ class ShadowUtilsTidyFiles(OESelftestTestCase):
             test_image)
         passwd_postprocess_cmd = vars["SORT_PASSWD_POSTPROCESS_COMMAND"]
         self.assertIsNotNone(passwd_postprocess_cmd)
-        if (passwd_postprocess_cmd.strip() != 'tidy_shadowutils_files;'):
+        if (passwd_postprocess_cmd.strip() != 'tidy_shadowutils_files'):
             raise unittest.SkipTest("Testcase skipped as 'tidy_shadowutils_files' "
                 "rootfs post process command is not the set SORT_PASSWD_POSTPROCESS_COMMAND.")
 
