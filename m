Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2C97DAA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 01:29:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3C1TsOR003466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 18:29:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 11 Apr 2019 18:29:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2019 09:40:06 +0800
Message-ID: <c075d06f6ca4c085bdb27280a37c23e26d11026e.1555033053.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1555033053.git.Qi.Chen@windriver.com>
References: <cover.1555033053.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] runqemu: do not check return code of tput
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
X-List-Received-Date: Fri, 12 Apr 2019 01:29:53 -0000
Content-Type: text/plain

The subprocess.run was replaced by subprocess.check_call because
of compatibility support down to python 3.4. But we really don't
care about whether that command succeeds. Some user reports that
in some tmux environment, this command fails and gives some
unpleasant traceback output. So we use 'call' instead of 'check_call'
to avoid such problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c0e569c..a4fc606 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1329,7 +1329,8 @@ def main():
             logger.info("SIGTERM received")
             os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
-            subprocess.check_call(["tput", "smam"])
+            # Deliberately ignore the return code of 'tput smam'.
+            subprocess.call(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1351,7 +1352,8 @@ def main():
         return 1
     finally:
         config.cleanup()
-        subprocess.check_call(["tput", "smam"])
+        # Deliberately ignore the return code of 'tput smam'.
+        subprocess.call(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
1.9.1


