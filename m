Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A914577473
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5Kw3001150; Wed, 21 Dec 2016 17:05:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ikx7rgVmb83Q; Wed, 21 Dec 2016 17:05:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5q3I001237
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Dec 2016 17:05:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cJkKu-0006sx-3A; Wed, 21 Dec 2016 17:05:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:05:44 +0000
Message-Id: <1482339945-26418-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482339945-26418-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1482339945-26418-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] libgcc-common: Don't apply symlinks for nativesdk
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
X-List-Received-Date: Wed, 21 Dec 2016 17:06:00 -0000

nativesdk-libgcc doesn't need a symlink into the target space and if we do this
sstate installation of the recipe can fail depending on whether it races with
the cross-canadian toolchains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 74e9faa..7a3b410 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -144,6 +144,9 @@ BASETARGET_SYS = "${@get_original_os(d)}"
 
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
 fakeroot python do_extra_symlinks() {
+    if bb.data.inherits_class('nativesdk', d):
+        return
+
     targetsys = d.getVar('BASETARGET_SYS')
 
     if targetsys != d.getVar('TARGET_SYS'):
-- 
2.7.4


