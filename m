Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBB67750D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2oQW011989; Wed, 1 Mar 2017 16:02:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EW3qP0anqeSL; Wed,  1 Mar 2017 16:02:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kt4011974
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004nl-M4; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:33 +0000
Message-Id: <1488384162-18397-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/12] devtool/sdk: Run build-sysroots after installing new things
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
X-List-Received-Date: Wed, 01 Mar 2017 16:02:51 -0000

After running sdk-install we need to ensure that the standalone sysroots are
updated as done when the eSDK is originally built. Add such a call so this
happens automatically and the envrionment scripts in the SDK work correctly
after updates.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/sdk.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index f629db1..e8bf0ad 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -306,6 +306,12 @@ def sdk_install(args, config, basepath, workspace):
         if failed:
             return 2
 
+        try:
+            exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots', watch=True)
+        except bb.process.ExecutionError as e:
+            raise DevtoolError('Failed to bitbake build-sysroots:\n%s' % (str(e)))
+
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from the sdk plugin"""
     if context.fixed_setup:
-- 
2.7.4


