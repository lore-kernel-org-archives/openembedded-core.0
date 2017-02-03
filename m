Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBD871DD9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 10:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13AfQRh025273; Fri, 3 Feb 2017 10:41:26 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OqwbdEdBHnxp; Fri,  3 Feb 2017 10:41:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13AfOQR025264
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Feb 2017 10:41:25 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cZbIy-00060m-GW; Fri, 03 Feb 2017 10:41:24 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 10:41:20 +0000
Message-Id: <1486118480-23064-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486118480-23064-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486118480-23064-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] oeqa/buildproject: Run gnu-configize by default
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
X-List-Received-Date: Fri, 03 Feb 2017 10:41:29 -0000

The runtime oeqa tests were failing in the on-target case, only for
aarch64. This was because an old config.sub was being used.

Similar to the SDK testing, call gnu-configize in the on-target
case too to resolve the failing tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py | 2 +-
 meta/lib/oeqa/utils/buildproject.py        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 4e4e507..4e25114 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -29,7 +29,7 @@ class SDKBuildProject(BuildProject):
         #Change targetdir to project folder
         self.targetdir = os.path.join(self.targetdir, self.fname)
 
-    def run_configure(self, configure_args='', extra_cmds=' gnu-configize; '):
+    def run_configure(self, configure_args='', extra_cmds=''):
         return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
 
     def run_install(self, install_args=''):
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index b3c487b..fc8879c 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -39,7 +39,7 @@ class BuildProject(metaclass=ABCMeta):
     # The timeout parameter of target.run is set to 0 to make the ssh command
     # run with no timeout.
     def run_configure(self, configure_args='', extra_cmds=''):
-        return self._run('cd %s; %s ./configure %s' % (self.targetdir, extra_cmds, configure_args))
+        return self._run('cd %s; gnu-configize; %s ./configure %s' % (self.targetdir, extra_cmds, configure_args))
 
     def run_make(self, make_args=''):
         return self._run('cd %s; make %s' % (self.targetdir, make_args))
-- 
2.7.4


