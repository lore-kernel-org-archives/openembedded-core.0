Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 608EF7267D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 02:11:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t042BGel022826
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 18:11:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 3 Jan 2015 18:11:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 10:11:26 +0800
Message-ID: <24dbafa66cc993d1b626ae27ea3e462c0af54718.1420337434.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420337434.git.Qi.Chen@windriver.com>
References: <cover.1420337434.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libsm: remove dependency on e2fsprogs
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
X-List-Received-Date: Sun, 04 Jan 2015 02:11:15 -0000
Content-Type: text/plain

This patch is to solve the following circular dependency problem.

     systemd -> dbus -> libsm -> e2fsprogs -> util-linux -> systemd

libsm doesn't have any dependency on e2fsprogs. It might be some dependency
on util-linux's libuuid, controlled by configure options. So e2fsprogs should
be removed from the DEPENDS variable.

Ideally, we should add a PACKAGECONFIG for 'libuuid' for libsm. However, if
libsm depends on util-linux, we would have the circular dependency described
above. That's why this patch explicitly set '--without-libuuid' in EXTRA_OECONF.
libsm would still be working well because it would fall back to an internal
algorithm to do the uuid stuff.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
index 180acfa..1925136 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
@@ -11,7 +11,12 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0fb37f44e02bdbde80546024400728d"
 
-DEPENDS += "libice xproto xtrans e2fsprogs"
+DEPENDS += "libice xproto xtrans"
+
+# libSM can work without libuuid, we explicitly disable it to break the following circular dependency
+# when DISTRO_FEATURES contains 'systemd' and 'x11'.
+# systemd -> dbus -> libsm -> util-linux -> systemd
+EXTRA_OECONF += "--without-libuuid"
 
 PE = "1"
 
-- 
1.9.1


