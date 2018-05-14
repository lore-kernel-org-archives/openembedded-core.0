Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A98B177AAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 08:34:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4E8XY5p014427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 01:33:51 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 14 May 2018 01:33:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2018 16:35:22 +0800
Message-ID: <e8e04fcfe497f733290c103a7abc429a6feb0180.1526286865.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526286865.git.Qi.Chen@windriver.com>
References: <cover.1526286865.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] devtool/sdk.py: error out in case of downloading file failure
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
X-List-Received-Date: Mon, 14 May 2018 08:34:00 -0000
Content-Type: text/plain

It's possible that downloading file from updateserver fails. In
this case, we should error out instead of continue.

We have users reporting unexpected behavior of 'devtool sdk-update'.
When an invalid url is supplied, e.g., `devtool sdk-update http://invalid',
the program reports 'Note: Already up-to-date'.

This is obviously not expected. We should error out in such case.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/sdk.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index f46577c..4616753 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -145,6 +145,9 @@ def sdk_update(args, config, basepath, workspace):
         # Fetch manifest from server
         tmpmanifest = os.path.join(tmpsdk_dir, 'conf', 'sdk-conf-manifest')
         ret = subprocess.call("wget -q -O %s %s/conf/sdk-conf-manifest" % (tmpmanifest, updateserver), shell=True)
+        if ret != 0:
+            logger.error("Cannot dowload files from %s" % updateserver)
+            return ret
         changedfiles = check_manifest(tmpmanifest, basepath)
         if not changedfiles:
             logger.info("Already up-to-date")
-- 
1.9.1


