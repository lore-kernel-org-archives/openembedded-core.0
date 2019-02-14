Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E23017BFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 06:18:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1E6Ie60004364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 22:18:50 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Wed, 13 Feb 2019 22:18:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Feb 2019 14:37:19 +0800
Message-ID: <5729c139f7de24d4285e2d05fe5469dae5883560.1550126097.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550126097.git.liezhi.yang@windriver.com>
References: <cover.1550126097.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 V2] base.bbclass: Check BuildStarted for HOSTTOOLS
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
X-List-Received-Date: Thu, 14 Feb 2019 06:19:00 -0000
Content-Type: text/plain

There might be no bb.event.ConfigParsed event if bitbake server is running, so
check bb.event.BuildStarted too to make sure HOSTTOOLS_DIR exists.

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
 meta/classes/base.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f1a3c0e..8ece51f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -228,6 +228,12 @@ python base_eventhandler() {
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
         d.setVar('BB_VERSION', bb.__version__)
+
+    # There might be no bb.event.ConfigParsed event if bitbake server is
+    # running, so check bb.event.BuildStarted too to make sure ${HOSTTOOLS_DIR}
+    # exists.
+    if isinstance(e, bb.event.ConfigParsed) or \
+            (isinstance(e, bb.event.BuildStarted) and not os.path.exists(d.getVar('HOSTTOOLS_DIR'))):
         # Works with the line in layer.conf which changes PATH to point here
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
-- 
2.7.4


