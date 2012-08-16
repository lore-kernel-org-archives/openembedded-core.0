Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1T21k1-0003XO-1P
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 17:12:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7GBHcuw000793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 04:17:38 -0700 (PDT)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Thu, 16 Aug 2012 04:17:38 -0700
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2012 14:17:19 +0300
Message-ID: <1345115839-26492-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] bitbake: build.py: Add stampdir argument to cached_mtime_noerror
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 15:12:09 -0000
Content-Type: text/plain

After commit 2718537b4b04eb3d80ab4d74171b58e7b8dd68b8 (bitbake:
build.py: Only execute mkdirhier if stampdir doesn't exist) build
failes as cached_mtime_noerror needs an argument - stamp dir. This
argument was forgotten.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 bitbake/lib/bb/build.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index d64077e..b484d19 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -465,7 +465,7 @@ def stamp_internal(taskname, d, file_name):
     stamp = bb.parse.siggen.stampfile(stamp, file_name, taskname, extrainfo)
 
     stampdir = os.path.dirname(stamp)
-    if bb.parse.cached_mtime_noerror == 0:
+    if bb.parse.cached_mtime_noerror(stampdir) == 0:
         bb.utils.mkdirhier(stampdir)
 
     return stamp
-- 
1.7.5.4



