Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 2D53E76FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:07:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 8208F3C88748
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 12:07:10 +0200
Message-Id: <1442225233-18899-4-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
Subject: [PATCH v2 4/7] systemd: don't build against dbus unless required
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
X-List-Received-Date: Mon, 14 Sep 2015 10:07:47 -0000

Modern systemd doesn't need dbus libraries normally, as it
ships with its own dbus library. This is required to proceed
with systemd support in dbus, as otherwise dependency loops
occur.
---
 meta/recipes-core/systemd/systemd_225.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 6ac99cd..5751bea 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -18,7 +18,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline libcap libcgroup glib-2.0 qemu-native util-linux"
 
 SECTION = "base/shell"
 
@@ -87,6 +87,7 @@ PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
 PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
2.1.4


