Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1BB176710
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:04:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8AA4YZe017648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 03:04:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Sep 2015 03:04:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Sep 2015 03:04:33 -0700
Message-ID: <aea6c94983ec5f8a52aeb9696ead8637286c681d.1441878476.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1441878476.git.liezhi.yang@windriver.com>
References: <cover.1441878476.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: fixes for SSTATE_SIG_KEY when use SSTATE_MIRRORS
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
X-List-Received-Date: Thu, 10 Sep 2015 10:04:35 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL file://Ubuntu-12.04/39/sstate:m4-native:x86_64-linux:1.4.17:r0:x86_64:3:39ecb836d5fc7802ce6f45f33f1cae36_populate_sysroot.tgz.sig, attempting MIRRORS if available
ERROR: Fetcher failure: Unable to find file file://Ubuntu-12.04/39/sstate:m4-native:x86_64-linux:1.4.17:r0:x86_64:3:39ecb836d5fc7802ce6f45f33f1cae36_populate_sysroot.tgz.sig anywhere. The paths that were searched were:

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 77313bc..7e682fe 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -615,9 +615,10 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
-    for srcuri in ['file://{0}'.format(sstatefetch),
-                   'file://{0}.siginfo'.format(sstatefetch),
-                   'file://{0}.sig'.format(sstatefetch)]:
+    srcuris = ['file://{0}'.format(sstatefetch), 'file://{0}.siginfo'.format(sstatefetch)]
+    if d.getVar("SSTATE_SIG_KEY", True):
+        srcuris.append('file://{0}.sig'.format(sstatefetch))
+    for srcuri in srcuris:
         localdata.setVar('SRC_URI', srcuri)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
-- 
1.7.9.5


