Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 34EE8788C0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 22:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB24320AB9;
	Tue,  9 Jan 2018 22:24:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L51QVI2InQRW; Tue,  9 Jan 2018 22:24:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA32C2087C;
	Tue,  9 Jan 2018 22:24:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 363CA16325D;
	Tue,  9 Jan 2018 17:24:22 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jan 2018 17:24:21 -0500
Message-Id: <1515536661-51529-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] at: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 09 Jan 2018 22:24:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Usually bison-native gets into sysroot through indirect dependencies,
even with RSS. But when bison-native is not in sysroot, due to different
system config, it falls back to using "yacc" instead and fails like this:

| yacc -d parsetime.y
| make: yacc: Command not found
| Makefile:82: recipe for target 'y.tab.c' failed
| make: *** [y.tab.c] Error 127

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/at/at_3.1.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/at/at_3.1.20.bb b/meta/recipes-extended/at/at_3.1.20.bb
index 9b537ee..8fe3b43 100644
--- a/meta/recipes-extended/at/at_3.1.20.bb
+++ b/meta/recipes-extended/at/at_3.1.20.bb
@@ -5,7 +5,7 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex flex-native \
+DEPENDS = "flex flex-native bison-native \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
-- 
2.7.4


