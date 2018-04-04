Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 109F4744C7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 10:45:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w34Aj1gm030661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Apr 2018 03:45:01 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 4 Apr 2018 03:45:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Apr 2018 18:45:59 +0800
Message-ID: <2e27990d1f27a0de84fc204caf77c28e5015173e.1522837858.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1522837858.git.Qi.Chen@windriver.com>
References: <cover.1522837858.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: remove dbus dependency for rpm-native
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
X-List-Received-Date: Wed, 04 Apr 2018 10:45:01 -0000
Content-Type: text/plain

Previously, the rpm recipe tries to prevent rpm-native from attempting
to inhibit shutdown via session dbus by appending '--disable-plugins'
to EXTRA_OECONF in case of native.

However, some layer may need some functionality via plugin support. And
when it enables it, we would meet the following warning at rootfs time.

  Unable to get systemd shutdown inhibition lock: Socket name too long

As plugins/systemd_inhibit.c is the only place that's related to this
dependency, we can be sure that this dependency is really not needed in
case of native. So we explictly remove the dbus dependency for rpm-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index 7b8ea46..88f9535 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -50,6 +50,10 @@ S = "${WORKDIR}/git"
 DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
+# dbus dependency is deliberately omitted for rpm-native to prevent it from attempting to
+# inhibit shutdown via session dbus, even when some layer enables plugins support for rpm-native.
+DEPENDS_remove_class-native = "dbus"
+
 inherit autotools gettext pkgconfig python3native
 export PYTHON_ABI
 
@@ -63,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
 #
 # --localstatedir prevents rpm from writing its database to native sysroot when building images
 #
-# Also disable plugins, so that rpm doesn't attempt to inhibit shutdown via session dbus
+# Disable plugins for rpm-native.
 EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


