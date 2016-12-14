Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F14F3738AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 07:24:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBE7OfnJ025419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:24:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 23:24:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 23:24:33 -0800
Message-ID: <3b1e2869c4215512d924b5c639de758e5315a87f.1481700149.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481700149.git.liezhi.yang@windriver.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/8] oe-publish-sdk: add pyshtables.py to .gitignore
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
X-List-Received-Date: Wed, 14 Dec 2016 07:24:40 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal -cpopulate_sdk_ext
[snip]
ERROR: Failed to update metadata as there have been changes made to it. Aborting.\nERROR: Changed files:\nb' M poky/bitbake/lib/bb/pysh/pyshtables.py\\n'\n"
[snip]

This is because the test case will run twice
(environment-setup-core2-64-poky-linux and
environment-setup-x86-pokymllib32-linux), it would fail in the second
run since pyshtables.py is regenerated in the first run. This file is
generated automatically, publish it doesn't make any sense, so add it to
.gitignore.

[YOCTO #10796]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-publish-sdk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index d95c623..e2b1b95 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -116,7 +116,7 @@ def publish(args):
     cmd_common = "if [ ! -e .git ]; then"
     cmd_common += "    git init .;"
     cmd_common += "    mv .git/hooks/post-update.sample .git/hooks/post-update;"
-    cmd_common += "    echo '*.pyc\n*.pyo' > .gitignore;"
+    cmd_common += "    echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore;"
     cmd_common += "fi;"
     cmd_common += "git add -A .;"
     cmd_common += "git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m 'init repo' || true;"
-- 
2.10.2


