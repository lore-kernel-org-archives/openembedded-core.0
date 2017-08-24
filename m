Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D49E2782E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 06:19:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O6JvV9025241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 23:19:57 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 23:19:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Aug 2017 23:19:55 -0700
Message-ID: <f6d4e8bacf6f6586bf87ada3df07eaeac5296e57.1503555549.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503555549.git.liezhi.yang@windriver.com>
References: <cover.1503555549.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] core/target/ssh.py: use reader to handle partial data
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
X-List-Received-Date: Thu, 24 Aug 2017 06:19:57 -0000
Content-Type: text/plain

This can avoid UnicodeDecodeError error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/core/target/ssh.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index a2eafcd..927d659 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -6,6 +6,7 @@ import time
 import select
 import logging
 import subprocess
+import codecs
 
 from . import OETarget
 
@@ -206,12 +207,12 @@ def SSHCall(command, logger, timeout=None, **opts):
                 logger.debug('time: %s, endtime: %s' % (time.time(), endtime))
                 try:
                     if select.select([process.stdout], [], [], 5)[0] != []:
-                        data = os.read(process.stdout.fileno(), 1024)
+                        reader = codecs.getreader('utf-8')(process.stdout)
+                        data = reader.read(1024, 1024)
                         if not data:
                             process.stdout.close()
                             eof = True
                         else:
-                            data = data.decode("utf-8", errors='replace')
                             output += data
                             logger.debug('Partial data from SSH call: %s' % data)
                             endtime = time.time() + timeout
-- 
2.10.2


