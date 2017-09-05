Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E80CE77EAC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 03:25:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v853PI8M027795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Sep 2017 20:25:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Sep 2017 20:25:17 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 5 Sep 2017 11:13:00 +0800
Message-ID: <04226f9cba6136805e2bbe98f1c8a91aa55acf08.1504580538.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1504580538.git.kai.kang@windriver.com>
References: <cover.1504580538.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] dbus: fix ptest runtime failures
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
X-List-Received-Date: Tue, 05 Sep 2017 03:25:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When run dbus ptest cases, there are some failures:

| ./test/test-dbus-daemon: relocation error: ./test/test-dbus-daemon: symbol
| _dbus_real_assert, version LIBDBUS_PRIVATE_1.10.20 not defined in file
| libdbus-1.so.3 with link time reference
| FAIL: test/test-dbus-daemon
| [   24.943454] test-dbus-daemo[251]: segfault at 0 ip           (null) sp
| 00007ffddabe6818 error 14 in test-dbus-daemon-eavesdrop[ 400000+a000]

It disables tests in dbus recipe which cases symbols missing and segment
fault. When 'ptest' in DISTRO_FEATURES, it should enable some configure
options to make the symbols visible to ptest cases.

It also need to correct paths in ptest configure files.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.10.20.bb | 3 +++
 meta/recipes-core/dbus/dbus_1.10.20.bb      | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.20.bb b/meta/recipes-core/dbus/dbus-test_1.10.20.bb
index eeadb7d35b..d50bbc8fd6 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.20.bb
@@ -54,5 +54,8 @@ do_install_ptest() {
 	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
 	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+
+	# fix host contamination
+	find ${D} -type f -not -executable -exec sed -i 's:${B}:${PTEST_PATH}:' {} \;
 }
 RDEPENDS_${PN}-ptest += "bash"
diff --git a/meta/recipes-core/dbus/dbus_1.10.20.bb b/meta/recipes-core/dbus/dbus_1.10.20.bb
index 9ddedc15fe..010fc51946 100644
--- a/meta/recipes-core/dbus/dbus_1.10.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.20.bb
@@ -91,8 +91,7 @@ pkg_postinst_dbus() {
 	fi
 }
 
-EXTRA_OECONF = "--disable-tests \
-                --disable-xml-docs \
+EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --enable-largefile \
@@ -101,10 +100,11 @@ EXTRA_OECONF = "--disable-tests \
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ptest systemd x11', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
+PACKAGECONFIG[ptest] = "--enable-embedded-tests --enable-asserts --enable-verbose-mode,--disable-embedded-tests --disable-asserts --disable-verbose-mode"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
-- 
2.14.1


