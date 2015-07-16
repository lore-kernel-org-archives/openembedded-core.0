Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 98C32607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 22:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMrGUh022180 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:53:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uQOY6eGjtEP7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:53:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMr1qk022172
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:53:12 +0100
Message-ID: <1437087181.22526.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 23:53:01 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/package_manager: Use log-level warning instead of quiet
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
X-List-Received-Date: Thu, 16 Jul 2015 22:53:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

quiet means that no warnings are shown on the console and really is too
quiet for our needs. This is more verbose but that is better than too
little and does aid debugging things when they go wrong.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 98abcdb..55b8ab0 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -616,7 +616,7 @@ class RpmPM(PackageManager):
         self.install_dir_path = os.path.join(self.target_rootfs, self.install_dir_name)
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
         self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
-        self.smart_opt = "--quiet --data-dir=" + os.path.join(target_rootfs,
+        self.smart_opt = "--log-level=warning --data-dir=" + os.path.join(target_rootfs,
                                                       'var/lib/smart')
         self.scriptlet_wrapper = self.d.expand('${WORKDIR}/scriptlet_wrapper')
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %



