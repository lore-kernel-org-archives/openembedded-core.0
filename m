Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C053778F37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:50:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D8oKCq027972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:50:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 01:50:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 16:54:37 +0800
Message-ID: <847525f642a8c8c987e285ae3b896c1df71f1cfe.1534150439.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1534150439.git.Qi.Chen@windriver.com>
References: <cover.1534150439.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] parselogs.py: output correct log location
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
X-List-Received-Date: Mon, 13 Aug 2018 08:50:19 -0000
Content-Type: text/plain

The log entry in results is altered to remove 'target_logs'. This
causes wrong log location in output.

e.g.
   AssertionError: 1 != 0 : Log: /path/to/image/1.0-r0/postinstall.log

But when user wants to check the log, the user will find the log is
not present. The actual log file is /path/to/image/1.0-r0/target_logs/postinstall.log.

So fix to use the correct log location.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 017b550..f6e9820 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -313,7 +313,7 @@ class ParseLogsTest(OERuntimeTestCase):
                 pass
 
             if result is not None:
-                results[log.replace('target_logs/','')] = {}
+                results[log] = {}
                 rez = result.splitlines()
 
                 for xrez in rez:
@@ -323,7 +323,7 @@ class ParseLogsTest(OERuntimeTestCase):
                         grep_output = check_output(cmd).decode('utf-8')
                     except:
                         pass
-                    results[log.replace('target_logs/','')][xrez]=grep_output
+                    results[log][xrez]=grep_output
 
         return results
 
-- 
1.9.1


