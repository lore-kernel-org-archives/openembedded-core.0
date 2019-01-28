Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5590B6D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:01:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0S913O9014042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 01:01:13 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Mon, 28 Jan 2019 01:00:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2019 17:19:23 +0800
Message-ID: <8b20fa4c993e073ec37b0fd6c309a52c4939959c.1548667130.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1548667130.git.liezhi.yang@windriver.com>
References: <cover.1548667130.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base.bbclass: Use bb.event.ParseStarted for HOSTTOOLS
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
X-List-Received-Date: Mon, 28 Jan 2019 09:01:22 -0000
Content-Type: text/plain

Fixed:
$ export BB_SERVER_TIMEOUT=-1
$ bitbake quilt-native
$ rm -fr tmp
$ bitbake quilt-native
ERROR: Error running gcc  --version: /bin/sh: gcc: command not found

This is because bb.event.ParseStarted fires only once when server is running,
but bb.event.ParseStarted fires every time when build configs are changed, so
use bb.event.ParseStarted to fix the problem.

[YOCTO #13022]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f1a3c0e..c273a29 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -220,11 +220,18 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete bb.event.RecipeParsed"
+base_eventhandler[eventmask] = "\
+	bb.event.ParseStarted \
+	bb.event.MultiConfigParsed \
+	bb.event.BuildStarted \
+	bb.event.RecipePreFinalise \
+	bb.runqueue.sceneQueueComplete \
+	bb.event.RecipeParsed \
+"
 python base_eventhandler() {
     import bb.runqueue
 
-    if isinstance(e, bb.event.ConfigParsed):
+    if isinstance(e, bb.event.ParseStarted):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
         d.setVar('BB_VERSION', bb.__version__)
-- 
2.7.4


