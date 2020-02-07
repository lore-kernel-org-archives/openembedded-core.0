Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31F7960EB3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 13:46:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 017DkrxR014935
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 7 Feb 2020 05:46:53 -0800 (PST)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 7 Feb 2020 05:46:53 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Feb 2020 08:46:52 -0500
Message-ID: <20200207134652.2093308-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] qemurunner.py: add try/except for pid handling race
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
X-List-Received-Date: Fri, 07 Feb 2020 13:46:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In some instances, attempts to remove the qemu pidfile within the
stop() method fail despite the os.path.exists() call immediately
before implying that the file is present. Add a try/except block
to log a warning if this occurs, rather than failing outright,
since the process simply appears to be exiting at an inconvenient
time.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 2cada35d48..4704422211 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -406,7 +406,10 @@ class QemuRunner:
         self.qemupid = None
         self.ip = None
         if os.path.exists(self.qemu_pidfile):
-            os.remove(self.qemu_pidfile)
+            try:
+                os.remove(self.qemu_pidfile)
+            except FileNotFoundError as e:
+                self.logger.warning('qemu pidfile is no longer present')
         if self.monitorpipe:
             self.monitorpipe.close()
 
-- 
2.24.1


