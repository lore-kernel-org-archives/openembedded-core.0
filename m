Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F22F075462
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Apr 2018 10:43:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w37AhrwC011334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 7 Apr 2018 11:43:54 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f4lK5-00087l-09; Sat, 07 Apr 2018 11:43:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Apr 2018 11:43:50 +0100
Message-Id: <1523097831-31184-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523097831-31184-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1523097831-31184-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/3] devtool/oeqa: Ensure added layers set LAYERSERIES_COMPAT
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
X-List-Received-Date: Sat, 07 Apr 2018 10:43:55 -0000

Now that we see warnings if LAYERSERIES_COMPAT is unset, the auto generated
code from devtool/oeqa needs to set this to avoid warnings which break
various tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 scripts/devtool                 | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index cad0bea..0d9cf23 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -285,7 +285,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
         f.write('BBFILE_PATTERN_%s = "^${LAYERDIR}/"\n' % templayername)
         f.write('BBFILE_PRIORITY_%s = "%d"\n' % (templayername, priority))
         f.write('BBFILE_PATTERN_IGNORE_EMPTY_%s = "1"\n' % templayername)
-
+        f.write('LAYERSERIES_COMPAT_%s = "${LAYERSERIES_COMPAT_core}"\n' % templayername)
 
 @contextlib.contextmanager
 def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
diff --git a/scripts/devtool b/scripts/devtool
index b4bfbb8..d681a19 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -165,6 +165,7 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('BBFILE_PATTERN_workspacelayer = "^$' + '{LAYERDIR}/"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_workspacelayer = "1"\n')
             f.write('BBFILE_PRIORITY_workspacelayer = "99"\n')
+            f.write('LAYERSERIES_COMPAT_workspacelayer = "${LAYERSERIES_COMPAT_core}"\n')
         # Add a README file
         with open(os.path.join(workspacedir, 'README'), 'w') as f:
             f.write('This layer was created by the OpenEmbedded devtool utility in order to\n')
-- 
2.7.4


