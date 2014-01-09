Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id D9B616C745
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 16:01:56 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id t60so2973249wes.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 08:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+bVsESPJwHTqe+FLohC8Sd1giSSg3eNpx/YtM5taBjg=;
	b=O4eSgj5TB23gs1S5RH06ppPiobhTG5W2ForzG6HZkQrhC4lwrKm0KCK202lE1vQCG6
	QLp5INfTB+GNb+VN3ywFBBXa9Tj4VqUGn13ZLQ95gbmKZia4aXddFfJsVaJOKrdvpScG
	iC0rYD5o+twZD/PTXcMPxBzPj6yatBTIkR2OTR72hJaMvZ/dPYsovSJtGKcG19lNPM92
	ZE+PKsEvbsQlY7ff99Ri2RxfX5UDQcWmFRqeoPae8h2dGM8NMGlC893En/QqH71dW7D1
	2KFuffCEEkL4G0W9zUBrb4hUQraWnVSNhzref/uG0R49MBvB3brwx+oqbNDNl8c3paos
	hQFQ==
X-Gm-Message-State: ALoCoQl8wswwB4ovyow0jryO+G3gp5WMChxPQGVkLhaJ3TLnpfhpk/8UjommAjJOjhjShMRVZUM3
X-Received: by 10.194.186.140 with SMTP id fk12mr3602505wjc.77.1389283316527; 
	Thu, 09 Jan 2014 08:01:56 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ay6sm567742wjb.23.2014.01.09.08.01.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 08:01:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2014 16:01:51 +0000
Message-Id: <1389283311-676-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oeqa/runtime/systemd: wait for services to start/fail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2014 16:01:57 -0000

When checking that no services have failed to start, actually wait for services
to finish starting by waiting for there not be no units in the "activating"
state.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/systemd.py |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index eed29d3..6414dd6 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -32,8 +32,36 @@ class SystemdBasicTests(SystemdTest):
     def test_systemd_list(self):
         self.systemctl('list-unit-files')
 
+    def settle(self):
+        """
+        Block until systemd has finished activating any units being activated,
+        or until two minutes has elapsed.
+
+        Returns a tuple, either (True, None) if all units have finished
+        acitvating, or (False, message string) if there are still units
+        activating (generally, failing units that restart).
+        """
+        import time
+        settled = False
+        endtime = time.time() + (60 * 2)
+        while time.time() < endtime:
+            status = self.target.run('systemctl --state=activating | grep -q "0 loaded units listed"')
+            if status == 0:
+                settled = True
+                break
+            time.sleep(10)
+
+        if settled:
+            return (True, None)
+        else:
+            status, output = self.target.run('systemctl --state=activating')
+        return (settled, output)
+
     @skipUnlessPassed('test_systemd_basic')
     def test_systemd_failed(self):
+        settled, output = self.settle()
+        self.assertTrue(settled, msg="Timed out waiting for systemd to settle:\n" + output)
+
         output = self.systemctl('list-units', '--failed')
         match = re.search("0 loaded units listed", output)
         if not match:
-- 
1.7.10.4


