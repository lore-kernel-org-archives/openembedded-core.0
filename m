Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.5950.1601328217245779051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 14:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: saul.wold@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08SLNZV0002034
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 14:23:36 -0700 (PDT)
Received: from soho-swold-l2.corp.ad.wrs.com (147.11.14.244) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 14:23:34 -0700
From: "Saul Wold" <Saul.Wold@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC v3 2/2] target/ssh.py: Add dump_target support
Date: Mon, 28 Sep 2020 14:23:13 -0700
Message-ID: <20200928212313.1217398-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928212313.1217398-1-saul.wold@windriver.com>
References: <20200928212313.1217398-1-saul.wold@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This adds the dump_target support when the ssh command fails with
a 'No route to host'. This is will provide additional data when a
Qemu target fails to respond during autobuilder testing. This does
not fix 14002 [0], but may help track down why qemu looses networking

[0] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14002

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
V3 Changes
- Check for the ssh status failure of 255 
- Get the string check the right way around!

 meta/lib/oeqa/core/target/ssh.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index aefb576805..461448dbc5 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -88,6 +88,8 @@ class OESSHTarget(OETarget):
 
         status, output = self._run(sshCmd, processTimeout, True)
         self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output))
+        if (status == 255) and (('No route to host') in output):
+            self.target_dumper.dump_target()
         return (status, output)
 
     def copyTo(self, localSrc, remoteDst):
-- 
2.25.1

