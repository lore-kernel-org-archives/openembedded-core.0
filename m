Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8AE7BF55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 06:46:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI6k5kb016526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 22:46:06 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 22:46:05 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 14:53:43 +0800
Message-ID: <25926fe98408cb797023c223e483b3645f972b29.1545115967.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1545115967.git.Qi.Chen@windriver.com>
References: <cover.1545115967.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: fix python unclosed file ResourceWarning
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
X-List-Received-Date: Tue, 18 Dec 2018 06:46:05 -0000
Content-Type: text/plain

Fix the following warning.

  ResourceWarning: unclosed file <_io.TextIOWrapper name='/.../systemd/1_239-r0/debugsources.list' mode='a' encoding='UTF-8'>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d1e9138..0fe9576 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -368,7 +368,8 @@ def append_source_info(file, sourcefile, d, fatal=True):
     # is still assuming that.
     debuglistoutput = '\0'.join(debugsources) + '\0'
     lf = bb.utils.lockfile(sourcefile + ".lock")
-    open(sourcefile, 'a').write(debuglistoutput)
+    with open(sourcefile, 'a') as sf:
+        sf.write(debuglistoutput)
     bb.utils.unlockfile(lf)
 
 
-- 
1.9.1


