Return-Path: <jpmv27@yahoo.com>
Received: from nm4.bullet.mail.bf1.yahoo.com (nm4.bullet.mail.bf1.yahoo.com
	[98.139.212.163])
	by mail.openembedded.org (Postfix) with ESMTP id D84CC719C0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2016 20:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1480276974; bh=OOysRX15Ne90arQBrZihNsPyFPFykraXCwR17jRHMtQ=;
	h=From:To:Cc:Subject:Date:From:Subject;
	b=sBzcd/lbOAWtRkGD3k6IdCzV0dyhNpm+E/l0BC01SX4Uxc8eK1hI3+mLnY0cfe97Cse5e8l6td1YUUzyd2msU7C8iGtcOlXBY+R9PQvnnz/FxtbNEClGvq5FJSnovOqKKjzmN7SlgmaH/5c3Y8XvvDNxhBtkYkLecFWLJTR59GogL5GAWya6BDK/Uvi9xZh0fNQ+0HxpyPy2aCD0dZ3GoSwysrBN8bJiWeKA1iRWDoEeJvd4GNERd4LjXoE/vqCYiJ7EkYR+aEd/L5vy+oY3goJn4r1LmXJm/d7S/9G876+vVL6TJvvDZ44sMxu/wcIjJzw97c8bhqOMZDfE8okIVA==
Received: from [98.139.170.181] by nm4.bullet.mail.bf1.yahoo.com with NNFMP;
	27 Nov 2016 20:02:54 -0000
Received: from [68.142.230.76] by tm24.bullet.mail.bf1.yahoo.com with NNFMP;
	27 Nov 2016 20:02:54 -0000
Received: from [127.0.0.1] by smtp233.mail.bf1.yahoo.com with NNFMP;
	27 Nov 2016 20:02:54 -0000
X-Yahoo-Newman-Id: 339520.77450.bm@smtp233.mail.bf1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: 6FDZtiwVM1lOLTPSDEx784tQjIOyTpq5YLoManXmBZug4uB
	Fo4k27rGcrgvs0EPXiZdb5vk3BxNRjN3SLEOF.IU_uKH9hbejVVK9NWNPScH
	Zkv9s3jefwzZo4HECpDJKO9ItzJQiAj5QzyrPxwJ0sgmXiFN2m_YqZTstl9t
	QToWI3z1WhILA71DLTkneRVt8qRwJMmKjbmL88MdeMgWpiijmeXDrDZsvmkU
	OhUev2QhX4ZL85ulHg79H1aDPeKpMyPqMq9KMBH0L3W8a19x1eCN2h6D9aF2
	mCqImURiU4uZT8N8F4ALCh3w6DLI6Siy4wZcbU7M3_7buufEwHnql24BHARZ
	vpPc6crwIV386HDpfnq.gPvLrsfDACbJ5lSmCSkDqWGtU9ENoEAxoky7AnY8
	JVk11zpbZGn2_jXA9ADCA0MLbPdOshEWS3LsA5uHr2egS3oM5Yzd5gHNCWzr
	3vke.S1q1W9l.iDqFNzytDfwJiMZNCVshwPN94tTRwIIoZlgZ7vzc2nbpB4y
	PtkE._7UYaDBcmY3dFAfbPZGFUa3Nk6mDr.Ww6qyJM8nLhGTd7t4-
X-Yahoo-SMTP: LI_RXwKswBDIzsPLAjkHtEgURQ--
From: Martin Vuille <jpmv27@yahoo.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Nov 2016 15:02:37 -0500
Message-Id: <1480276957-22652-1-git-send-email-jpmv27@yahoo.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] terminal.py: Pass string instead of bytes to ExecutionError to avoid exception
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
X-List-Received-Date: Sun, 27 Nov 2016 20:02:54 -0000

Based on run() in bitbake/lib/bb/process.py, ExecutionError() expects strings
not bytes. Passing bytes results in a "TypeError: Can't convert 'bytes' object
to str implicitly" exception.

Fixes Bug 10729

Signed-off-by: Martin Vuille <jpmv27@yahoo.com>
---
 meta/lib/oe/terminal.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3901ad3..3c8ef59 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -227,6 +227,8 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
 
     pipe = terminal(sh_cmd, title, env, d)
     output = pipe.communicate()[0]
+    if output:
+        output = output.decode("utf-8")
     if pipe.returncode != 0:
         raise ExecutionError(sh_cmd, pipe.returncode, output)
 
-- 
2.7.4


