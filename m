Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43F9971A00
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 07:46:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA17k7mn023763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2016 00:46:08 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 1 Nov 2016 00:46:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2016 15:39:43 +0800
Message-ID: <c4a0a672c739f3d3a4da497884d3c979a6594ccc.1477985510.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1477985510.git.kai.kang@windriver.com>
References: <cover.1477985510.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] dbus: update build options when enable ptest
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
X-List-Received-Date: Tue, 01 Nov 2016 07:46:09 -0000
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
 meta/recipes-core/dbus/dbus_1.10.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.10.bb b/meta/recipes-core/dbus/dbus_1.10.10.bb
index 4db0b9b..214cc13 100644
--- a/meta/recipes-core/dbus/dbus_1.10.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.10.bb
@@ -90,7 +90,7 @@ pkg_postinst_dbus() {
 	fi
 }
 
-EXTRA_OECONF = "--disable-tests \
+EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-embedded-tests --enable-asserts --enable-verbose-mode', '--disable-tests', d)} \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
@@ -98,6 +98,8 @@ EXTRA_OECONF = "--disable-tests \
 
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
+EXTRA_OEMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'CFLAG_VISIBILITY=-fvisibility=default', '', d)}"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
2.10.1


