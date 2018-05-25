Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51CC974E31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:41:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P2emRe026247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:41:03 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:40:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:15 +0800
Message-ID: <4b9f3a9c9056fa8ec0993e2b6fde5eb9d5583633.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/24] dbus: update build options when enable ptest
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
X-List-Received-Date: Fri, 25 May 2018 02:41:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run some dbus-ptest cases that some symbols cannot be found:

| ./test/test-bus: relocation error: ./test/test-bus: symbol
| _dbus_threads_init_debug, version LIBDBUS_PRIVATE_1.10.10 not defined
| in file libdbus-1.so.3 with link time reference
| FAIL: test/test-bus

These missing symbols are controlled by some macros. Update configure
options and compile macro to make the symbols visible to ptest cases.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/dbus/dbus_1.12.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.8.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
index b3ddaaf..ff235f1 100644
--- a/meta/recipes-core/dbus/dbus_1.12.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
@@ -92,7 +92,7 @@ pkg_postinst_dbus() {
 	fi
 }
 
-EXTRA_OECONF = "--disable-tests \
+EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-embedded-tests --enable-asserts --enable-verbose-mode', '--disable-tests', d)} \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
@@ -102,6 +102,8 @@ EXTRA_OECONF = "--disable-tests \
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
+EXTRA_OEMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'CFLAG_VISIBILITY=-fvisibility=default', '', d)}"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
-- 
2.7.4


