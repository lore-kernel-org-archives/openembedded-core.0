Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08442712B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 06:32:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s836WJdn022753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 23:32:19 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 23:32:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 14:32:14 +0800
Message-ID: <30d04c9e34cd40ba2bb236823d3bc977d22346ca.1409725792.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409725792.git.hongxu.jia@windriver.com>
References: <cover.1409725792.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] targetcontrol.py: test sudo available while invoking runqemu
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
X-List-Received-Date: Wed, 03 Sep 2014 06:32:22 -0000
Content-Type: text/plain

While TEST_TARGET is qemu, the QemuRunner class invokes runqemu
to start qemu, and runqemu needs sudo to set up tap interface.

While sudo is not available, the exit of QemuRunner will cost 60
seconds and the exit message is not clear, so we add sudo available
test for QemuRunner before invoking runqemu. Here is the example:
...
ERROR: We need setting up tap interface under sudo
sudo: a password is required

ERROR: Function failed: do_testimage
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oeqa/targetcontrol.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index cc582dd..f6af5be 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -15,10 +15,22 @@ from oeqa.utils.qemurunner import QemuRunner
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
+def test_sudo_available(d):
+    res = subprocess.call('sudo -n ls', shell=True)
+    p = subprocess.Popen('sudo -n ls',
+                         shell=True,
+                         stdout=subprocess.PIPE,
+                         stderr=subprocess.PIPE)
+    if p.wait() != 0:
+        msg = "We need setting up tap interface under sudo\n"
+        msg += p.communicate()[1]
+        bb.fatal(msg)
+
 def get_target_controller(d):
     testtarget = d.getVar("TEST_TARGET", True)
     # old, simple names
     if testtarget == "qemu":
+        test_sudo_available(d)
         return QemuTarget(d)
     elif testtarget == "simpleremote":
         return SimpleRemoteTarget(d)
-- 
1.9.1


