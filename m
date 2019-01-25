Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6A5F601F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:09:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0P39mKK005978
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 19:09:48 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 24 Jan 2019 19:09:48 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jan 2019 11:18:08 +0800
Message-ID: <2e971d062525b21d52a68d1926927f1a60af08d8.1548386264.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1548386264.git.Qi.Chen@windriver.com>
References: <cover.1548386264.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: do not check return code of tput
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
X-List-Received-Date: Fri, 25 Jan 2019 03:09:48 -0000
Content-Type: text/plain

The subprocess.run was replaced by subprocess.check_call because
of compatibility support down to python 3.4. But we really don't
care about whether that command succeeds. Some user reports that
in some tmux environment, this command fails and gives some
unpleasant traceback output. So we use 'call' instead of 'check_call'
to avoid such problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca8..d3239ee 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1318,7 +1318,7 @@ def main():
             logger.info("SIGTERM received")
             os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
-            subprocess.check_call(["tput", "smam"])
+            subprocess.call(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1340,7 +1340,7 @@ def main():
         return 1
     finally:
         config.cleanup()
-        subprocess.check_call(["tput", "smam"])
+        subprocess.call(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
1.9.1


