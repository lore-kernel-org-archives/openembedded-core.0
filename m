Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZWdp-0007wy-JF
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 01:15:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MNBouW018360
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:11:50 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 16:11:49 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 18:23:24 -0500
Message-ID: <84f49b245555160be354421c4ec252971f5351da.1308784531.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308784531.git.mark.hatle@windriver.com>
References: <cover.1308784531.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/4] classes/base.bbclass: Add umask
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

In order for the build system to consistently create directories and files
with reasonable default permissions, we need to set the umask to a known
value, 022.

Prior to this patch we used the users umask and just verified it was
"compatible" with 022...

Note, this patch sets the umask -once- in the main bb thread.

Also remove the sanity check, as it's no longer needed.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass   |   10 ++++++++++
 meta/classes/sanity.bbclass |    5 -----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 119b052..11ff0e0 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -13,6 +13,16 @@ inherit logging
 OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup"
 OE_IMPORTS[type] = "list"
 
+# There are a few key items we need to setup in the environment
+# in order to get consistent builds.  Do them here.
+python oe_setup_env () {
+    if isinstance(e, bb.event.ConfigParsed) and bb.data.getVar("BB_WORKERCONTEXT", e.data, True) != "1":
+	import os
+	os.umask(0022)
+}
+
+addhandler oe_setup_env
+
 def oe_import(d):
     import os, sys
 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index fc005aa..cd883be 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -224,11 +224,6 @@ def check_sanity(e):
     if os.path.basename(os.readlink('/bin/sh')) == 'dash':
         messages = messages + "Using dash as /bin/sh causes various subtle build problems, please use bash instead (e.g. 'dpkg-reconfigure dash' on an Ubuntu system.\n"
 
-    omask = os.umask(022)
-    if omask & 0755:
-        messages = messages + "Please use a umask which allows a+rx and u+rwx\n"
-    os.umask(omask)
-
     oes_bb_conf = data.getVar( 'OES_BITBAKE_CONF', e.data, True )
     if not oes_bb_conf:
         messages = messages + 'You do not include OpenEmbeddeds version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
-- 
1.7.3.4



