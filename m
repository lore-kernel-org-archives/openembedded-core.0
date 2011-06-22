Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZWdq-0007x0-Fd
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 01:15:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MNBpMt018363
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:11:51 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 16:11:50 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 18:23:25 -0500
Message-ID: <ca4faeb0b1584c3fffb6275354dc2ac07f0cd737.1308784531.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308784531.git.mark.hatle@windriver.com>
References: <cover.1308784531.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/4] Revert "classes/base.bbclass: Add umask"
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
X-List-Received-Date: Wed, 22 Jun 2011 23:15:26 -0000
Content-Type: text/plain

This reverts commit d8470b6a8efdbba04cef5d4dc1ce12720fe83621.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass   |   10 ----------
 meta/classes/sanity.bbclass |    5 +++++
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 11ff0e0..119b052 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -13,16 +13,6 @@ inherit logging
 OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup"
 OE_IMPORTS[type] = "list"
 
-# There are a few key items we need to setup in the environment
-# in order to get consistent builds.  Do them here.
-python oe_setup_env () {
-    if isinstance(e, bb.event.ConfigParsed) and bb.data.getVar("BB_WORKERCONTEXT", e.data, True) != "1":
-	import os
-	os.umask(0022)
-}
-
-addhandler oe_setup_env
-
 def oe_import(d):
     import os, sys
 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cd883be..fc005aa 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -224,6 +224,11 @@ def check_sanity(e):
     if os.path.basename(os.readlink('/bin/sh')) == 'dash':
         messages = messages + "Using dash as /bin/sh causes various subtle build problems, please use bash instead (e.g. 'dpkg-reconfigure dash' on an Ubuntu system.\n"
 
+    omask = os.umask(022)
+    if omask & 0755:
+        messages = messages + "Please use a umask which allows a+rx and u+rwx\n"
+    os.umask(omask)
+
     oes_bb_conf = data.getVar( 'OES_BITBAKE_CONF', e.data, True )
     if not oes_bb_conf:
         messages = messages + 'You do not include OpenEmbeddeds version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
-- 
1.7.3.4



