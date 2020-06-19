Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1419.1592550176874236350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 00:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05J72tit017797
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 00:02:56 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 19 Jun 2020
 00:02:55 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] systemd-serialgetty: do not use BindsTo
Date: Fri, 19 Jun 2020 00:02:55 -0700
Message-ID: <20200619070255.99872-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This unit was changed from 'BindsTo' in the following commit.
"""
commit f0f359ec9210759f6b4dbfb35d3fba8af208c43a
Author: Jason Wessel <jason.wessel@windriver.com>
Date:   Thu Aug 29 07:00:31 2019 -0700

    serial-getty@.service: Allow device to fast fail if it does not exist
"""

It was changed back to 'BindTo' in the following commit.
"""
commit 63bbff61b78c651339c4b18d8376187379ec3b3c
Author: Otavio Salvador <otavio.salvador@gmail.com>
Date:   Fri Jun 12 14:30:44 2020 -0300

    systemd: Sync systemd-serialgetty@.service with upstream
"""

This is now causing runtime problem for qemuarm64. The default.target
is not reached until a timeout. Output is like below.

"""
root@qemuarm64:~# systemd-analyze
Bootup is not yet finished (org.freedesktop.systemd1.Manager.FinishTimestampMonotonic=0).
Please try again later.
Hint: Use 'systemctl list-jobs' to see active jobs
root@qemuarm64:~# systemctl list-jobs
JOB UNIT TYPE STATE
102 getty.target start waiting
1 multi-user.target start waiting
95 systemd-update-utmp-runlevel.service start waiting
110 serial-getty@hvc0.service start waiting
111 dev-hvc0.device start running
"""

We can see that we are waiting for /dev/hvc0, while in fact there's no /dev/hvc0.
Jason's commit actually solves such problem.

So restore to use Jason's method. Do not use 'BindsTo'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../systemd/systemd-serialgetty/serial-getty@.service          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 542b905795..549d566009 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -11,7 +11,8 @@
 Description=Serial Getty on %I
 Documentation=man:agetty(8) man:systemd-getty-generator(8)
 Documentation=http://0pointer.de/blog/projects/serial-console.html
-BindsTo=dev-%i.device
+PartOf=dev-%i.device
+ConditionPathExists=/dev/%i
 After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service getty-pre.target
 After=rc-local.service
 
-- 
2.21.0

