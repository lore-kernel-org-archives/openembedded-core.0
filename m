Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A81F16B50A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 02:40:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1E2e4QM005043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 18:40:04 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Wed, 13 Feb 2019 18:40:03 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Feb 2019 10:58:52 +0800
Message-ID: <b897d0a2643af36791269bf303b0d0dd74a47411.1550113052.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550113052.git.liezhi.yang@windriver.com>
References: <cover.1550113052.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base.bbclass: Check BuildStarted for HOSTTOOLS
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
X-List-Received-Date: Thu, 14 Feb 2019 02:40:03 -0000
Content-Type: text/plain

There might be no bb.event.ConfigParsed event bitbake server is running,
so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR existed when
BuildStarted.

Fixed:
$ export BB_SERVER_TIMEOUT=-1
$ bitbake quilt-native
$ rm -fr tmp
$ bitbake quilt-native
ERROR: Error running gcc  --version: /bin/sh: gcc: command not found

This error is caused by enable_uninative(), it runs twice (ConfigParsed and
BuildStarted), the error would happen when there is no ConfigParsed event
(no hosttools is created), but BuildStarted. This patch can fix the problem.

[YOCTO #13022]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f1a3c0e..283cb0f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -224,7 +224,11 @@ base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed
 python base_eventhandler() {
     import bb.runqueue
 
-    if isinstance(e, bb.event.ConfigParsed):
+    # There might be no bb.event.ConfigParsed event bitbake server is running,
+    # so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR existed when
+    # BuildStarted.
+    if isinstance(e, bb.event.ConfigParsed) or \
+            (isinstance(e, bb.event.BuildStarted) and not os.path.exists(d.getVar('HOSTTOOLS_DIR'))):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
         d.setVar('BB_VERSION', bb.__version__)
-- 
2.7.4


