Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4B92F78FCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:21:37 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w7EALcGw010983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 12:21:38 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w7EALcfZ012373;
	Tue, 14 Aug 2018 12:21:38 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id CC14598F56A;
	Tue, 14 Aug 2018 12:21:37 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 12:21:19 +0200
Message-Id: <20180814102119.11718-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Simon Ausserlechner <simon.ausserlechner@siemens.com>
Subject: [PATCH] systemd: fixes for the compatibility interface
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
X-List-Received-Date: Tue, 14 Aug 2018 10:21:38 -0000

Use a heap allocated string to set arg_ifname, since a stack allocated
one would be lost after the function returns. (This last one broke the
case where an interface name was suffixed with a dot, such as in
`resolvconf -a tap0.dhcp`.)

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Simon Ausserlechner <simon.ausserlechner@siemens.com>
---
 ...onf-fixes-for-the-compatibility-interface.patch | 58 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch b/meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch
new file mode 100644
index 0000000000..2f3e776aa0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-resolvconf-fixes-for-the-compatibility-interface.patch
@@ -0,0 +1,58 @@
+systemd-239: fixes for the compatibility interface
+
+[No upstream tracking] -- https://github.com/systemd/systemd/issues/9423
+
+resolvconf-compat: use compat_main() when called as `resolvconf`,
+since the interface is closer to that of `systemd-resolve`.
+
+Use a heap allocated string to set arg_ifname, since a stack allocated
+one would be lost after the function returns. (This last one broke the
+case where an interface name was suffixed with a dot, such as in
+`resolvconf -a tap0.dhcp`.)
+
+Tested:
+  $ build/resolvconf -a nonexistent.abc </etc/resolv.conf
+  Unknown interface 'nonexistent': No such device
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/5a01b3f35d7b6182c78b6973db8d99bdabd4f9c3]
+bug: 9423
+Signed-off-by: Simon Ausserlechner <simon.ausserlechner@siemens.com>
+
+diff --git a/src/resolve/resolvconf-compat.c b/src/resolve/resolvconf-compat.c
+index d7e68003e..072345894 100644
+--- a/src/resolve/resolvconf-compat.c
++++ b/src/resolve/resolvconf-compat.c
+@@ -53,6 +53,8 @@ static int parse_nameserver(const char *string) {
+ 
+                 if (strv_push(&arg_set_dns, word) < 0)
+                         return log_oom();
++
++                word = NULL;
+         }
+ 
+         return 0;
+@@ -202,7 +204,7 @@ int resolvconf_parse_argv(int argc, char *argv[]) {
+ 
+         dot = strchr(argv[optind], '.');
+         if (dot) {
+-                iface = strndupa(argv[optind], dot - argv[optind]);
++                iface = strndup(argv[optind], dot - argv[optind]);
+                 log_debug("Ignoring protocol specifier '%s'.", dot + 1);
+         } else
+                 iface = argv[optind];
+diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
+index e96c13fea..e9e395e3e 100644
+--- a/src/resolve/resolvectl.c
++++ b/src/resolve/resolvectl.c
+@@ -3092,7 +3092,7 @@ int main(int argc, char **argv) {
+                 goto finish;
+         }
+ 
+-        if (streq(program_invocation_short_name, "systemd-resolve"))
++        if (STR_IN_SET(program_invocation_short_name, "systemd-resolve", "resolvconf"))
+                 r = compat_main(argc, argv, bus);
+         else
+                 r = native_main(argc, argv, bus);
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 67f6117a2a..84906f97b7 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch \
            file://0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch \
            file://0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch \
+           file://0023-resolvconf-fixes-for-the-compatibility-interface.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


