Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3846871B27
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 20:00:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w02K0ohL032255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jan 2018 12:00:50 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 2 Jan 2018 12:00:49 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jan 2018 12:00:49 -0800
Message-ID: <20180102200049.44793-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] allarch: do not set baselib
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
X-List-Received-Date: Tue, 02 Jan 2018 20:00:49 -0000
Content-Type: text/plain

postinstall scripts may run target binaries and need to know
where shared libraries are.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/allarch.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 51ba509..3749328 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -11,9 +11,8 @@ python () {
         # No need for virtual/libc or a cross compiler
         d.setVar("INHIBIT_DEFAULT_DEPS","1")
 
-        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
-        # naming anyway
-        d.setVar("baselib", "lib")
+        # Set these to a common set of values, we shouldn't be using them other than for WORKDIR directory
+        # naming anyway.  Do not set baselib because postinstall may need to know where shared libraries are.
         d.setVar("TARGET_ARCH", "allarch")
         d.setVar("TARGET_OS", "linux")
         d.setVar("TARGET_CC_ARCH", "none")
-- 
2.7.4


