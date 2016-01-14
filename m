Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8585A731EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:08:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0E78fWw007103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jan 2016 23:08:41 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 13 Jan 2016 23:08:40 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 15:08:37 +0800
Message-ID: <1452755317-30802-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [PATCH v2] oeqa/runtime/parselogs: use -F to search fixed strings for grep
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
X-List-Received-Date: Thu, 14 Jan 2016 07:08:41 -0000
Content-Type: text/plain

The grep output is not correct if the log message contains special
characters. Use -F which tells grep to search for fixed strings, not
expressions and pass lists instead of strings to subprocess.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/runtime/parselogs.py |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index fc2bc38..5a2d50f 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -221,9 +221,8 @@ class ParseLogsTest(oeRuntimeTest):
                 results[log.replace('target_logs/','')] = {}
                 rez = result.splitlines()
                 for xrez in rez:
-                    command = "grep \"\\"+str(xrez)+"\" -B "+str(lines_before)+" -A "+str(lines_after)+" "+str(log)
                     try:
-                        grep_output = subprocess.check_output(command, shell=True)
+                        grep_output = subprocess.check_output(['grep', '-F', xrez, '-B', str(lines_before), '-A', str(lines_after), log])
                     except:
                         pass
                     results[log.replace('target_logs/','')][xrez]=grep_output
-- 
1.7.9.5


