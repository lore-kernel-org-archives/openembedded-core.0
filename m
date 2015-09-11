Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1907A73243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 12:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BCQm8P027365 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:26:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YEWMhLZ1oKn8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:26:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BCQZcr027348
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:26:46 +0100
Message-ID: <1441974395.24871.384.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Sep 2015 13:26:35 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/targetbuild: Ensure we run gnu-configize so config files are up to date
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
X-List-Received-Date: Fri, 11 Sep 2015 12:26:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On aarch64 we need to do this as the versions in the upstream source don't
recognise the target triplet causing SDK test failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 9d532e7..f850d78 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -55,8 +55,8 @@ class BuildProject():
 
     # The timeout parameter of target.run is set to 0 to make the ssh command
     # run with no timeout.
-    def run_configure(self, configure_args=''):
-        return self._run('cd %s; ./configure %s' % (self.targetdir, configure_args))
+    def run_configure(self, configure_args='', extra_cmds=''):
+        return self._run('cd %s; %s ./configure %s' % (self.targetdir, extra_cmds, configure_args))
 
     def run_make(self, make_args=''):
         return self._run('cd %s; make %s' % (self.targetdir, make_args))
@@ -121,7 +121,7 @@ class SDKBuildProject(BuildProject):
         self.targetdir = self.targetdir + self.fname
 
     def run_configure(self, configure_args=''):
-        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'))
+        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=' gnu-configize; ')
 
     def run_install(self, install_args=''):
         return super(SDKBuildProject, self).run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))



