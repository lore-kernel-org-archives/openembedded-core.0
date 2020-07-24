Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.264.1595610349812044882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 10:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06OH5l8O008236
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 10:05:48 -0700 (PDT)
Received: from mt-manjaro (128.224.73.182) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 24 Jul
 2020 10:05:47 -0700
User-agent: mu4e 1.4.10; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Randy MacLeod <randy.macleod@windriver.com>
Subject: ltp.py: compare dmesg before and after test
Message-ID: <87tuxzl6ww.fsf@windriver.com>
Date: Fri, 24 Jul 2020 13:05:45 -0400
MIME-Version: 1.0
X-Originating-IP: [128.224.73.182]
Content-Type: text/plain

Hi,

I'm working on bugzilla 13802 by removing OOM killer test execution.

Randy was suggesting before running ltp, we should clear the dmesg ring buffer, run the test, and then collect dmesg ring buffer again afterwards.

Initially we would only print out the log, we could decide that a non-empty string indicating an error. Does this make sense for ltp and does it make sense to do it for each oeqa test?

This is entirely a proof-of-concept draft patch, any tips on where to insert dmesg clear and collect code would be greatly appreciated.

FYI: we've also considered adding a configure option (ie. --without-oom) to ltp that prevents the OOM tests (ltp/testcases/kernel/mem/oom) from compiling entirely. I talked with the upstream, and they suggested just skipping these tests using:
    runltp -S SKIPFILE     Skip tests specified in SKIPFILE

Signed-off-by: Mingde (Matthew) Zeng <matthewzmd@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 6dc5ef22ad..1e90df2086 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -65,11 +65,22 @@ class LtpTest(LtpTestBase):
     ltp_groups += ltp_fs

     def runltp(self, ltp_group):
+            (status, dmesg_c_output) = self.target.run("dmesg -c")
+            print("dmesg -c output:")
+            print(dmesg_c_output)
+
             cmd = '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
             starttime = time.time()
             (status, output) = self.target.run(cmd)
             endtime = time.time()

+            (status, output) = self.target.run("stat /proc/sysrq-trigger && echo f > /proc/sysrq-trigger || echo '/proc/sysrq-trigger does not exist'")
+            if output != '/proc/sysrq-trigger does not exist':
+                (status, dmesg_output) = self.target.run("dmesg")
+                print("dmesg output:")
+                print(dmesg_output)
+                self.assertEqual(dmesg_c_output, dmesg_output)
+
             with open(os.path.join(self.ltptest_log_dir, "%s-raw.log" % ltp_group), 'w') as f:
                 f.write(output)

--
2.27.0
