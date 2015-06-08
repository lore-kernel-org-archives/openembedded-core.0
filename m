Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA38171144
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 22:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t58MdiSY016558 for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jun 2015 23:39:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W9WJsYs9e7zG
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 23:39:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t58MdSh2016551
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jun 2015 23:39:40 +0100
Message-ID: <1433803168.28975.114.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Jun 2015 23:39:28 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] sysvinit: Only enable recipe in builds where its applicable
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
X-List-Received-Date: Mon, 08 Jun 2015 22:40:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Similarly to systemd, only enable the recipe in builds where 
sysvinit is configured in DISTRO_FEATURES. This allows the new
cleanup mechanism to handle it correctly in existing builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 2c7e3ce..6709a9b 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -100,3 +100,8 @@ do_install () {
 	chown root.shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 }
+
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        raise bb.parse.SkipPackage("'sysvinit' not in DISTRO_FEATURES")
+}



