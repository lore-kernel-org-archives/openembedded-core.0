Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D84677BDA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:36:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2U8aKRb015552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:36:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 30 Mar 2017 01:36:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 16:37:36 +0800
Message-ID: <ae8133ce6aa20fd7e0f6189ebad556a5716d5111.1490863008.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1490863008.git.Qi.Chen@windriver.com>
References: <cover.1490863008.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] wic: improve error message
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
X-List-Received-Date: Thu, 30 Mar 2017 08:36:19 -0000
Content-Type: text/plain

When using `wic create mkefidisk -e core-image-minimal', the following
error message appeared.

  Please bake it with 'bitbake parted-native' and try again.

However, following this command doesn't do any help. The same problem
still appeared.

The problem is that when we 'bitbake parted-native', it doesn't have
anything to do with core-image-minimal. And the required tool 'parted'
is not under core-image-minimal's recipe-sysroot-native directory.

Improve the error message so that following it could get things done.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/wic/utils/misc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index c941112..1b0ab3b 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -131,7 +131,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
               "was not found (see details above).\n\n" % prog
         recipe = NATIVE_RECIPES.get(prog)
         if recipe:
-            msg += "Please bake it with 'bitbake %s-native' "\
+            msg += "Please make sure wic-tools have %s-native in its DEPENDS, bake it with 'bitbake wic-tools' "\
                    "and try again.\n" % recipe
         else:
             msg += "Wic failed to find a recipe to build native %s. Please "\
-- 
1.9.1


