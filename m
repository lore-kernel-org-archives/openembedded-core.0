Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A576C74D9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:41:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P2fBq4008173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:41:11 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:41:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:18 +0800
Message-ID: <c862af8e549c89f50ee1fe5574582acde7cb9f65.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/24] dbus-test: sync x11 configure options with dbus
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
X-List-Received-Date: Fri, 25 May 2018 02:41:09 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Sync x11 related configure options with dbus and replace EXTRA_OECONF_X
with PACKAGECONFIG for dbus-test.

Remove configure for native as well that no such native package.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.8.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.8.bb b/meta/recipes-core/dbus/dbus-test_1.12.8.bb
index f33fbaf..020a340 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.8.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.8.bb
@@ -25,8 +25,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
 
 inherit autotools pkgconfig gettext ptest upstream-version-is-even
 
-EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_class-native = "--without-x"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 
 EXTRA_OECONF = "--enable-tests \
                 --enable-modular-tests \
@@ -39,7 +39,7 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-dbus-test-dir=${PTEST_PATH} \
-                ${EXTRA_OECONF_X}"
+                "
 
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
-- 
2.7.4


