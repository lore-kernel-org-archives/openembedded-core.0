Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: EdYVIlwONUxqycje2BXVHDWIzfYxpFYwmbuuJupuG1uZa3B8SMFbg/vWQOYitFyHF/OMaVBh9r
 es4opG0cBlhg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:15 -0700
IronPort-SDR: RZo1/rZgz9qcPccPI09aMLk3u/VWgSbDZ/ynGOfLNyhFKBrlYoRW7IH0uTydc1YN2edBU5PcOu
 1SZbLuzS2IBA==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866120"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 02/25] targetcontrol: Fix leaking log handler
Date: Fri, 29 May 2020 13:52:38 +0800
Message-Id: <6893eb741c4cd4849e2fde1f86d9911b6c89db5b.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We had a mystery failure on the autobuilder where runqemu appeared to
be failing as a logfile directory no longer existed. The key to
reproducing was running a runqemu where the image was deleted (as
devtool does), then running another runqemu test. E.g.:

'oe-selftest -r  devtool.DevtoolExtractTests.test_devtool_deploy_target wic.Wic2.test_qemu_efi'

This then tries to write to the logfile from the first test, the
image directory was deleted and we get strange failures.

The fix is to remove the logging handler when qemu is stopped.

(From OE-Core rev: 924b020eacf111b4fd4d731b363084e254a3422d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b335fa867805f612154ae92c5a1e727d3fb29ca)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1445e3ecfb..41557dc224 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -117,9 +117,9 @@ class QemuTarget(BaseTarget):
         import oe.path
         bb.utils.mkdirhier(self.testdir)
         self.qemurunnerlog = os.path.join(self.testdir, 'qemurunner_log.%s' % self.datetime)
-        loggerhandler = logging.FileHandler(self.qemurunnerlog)
-        loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
-        self.logger.addHandler(loggerhandler)
+        self.loggerhandler = logging.FileHandler(self.qemurunnerlog)
+        self.loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+        self.logger.addHandler(self.loggerhandler)
         oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.join(self.testdir, 'qemurunner_log'), force=True)
 
         if d.getVar("DISTRO") == "poky-tiny":
@@ -182,6 +182,7 @@ class QemuTarget(BaseTarget):
 
     def stop(self):
         self.runner.stop()
+        self.logger.removeHandler(self.loggerhandler)
         self.connection = None
         self.ip = None
         self.server_ip = None
-- 
2.25.4

