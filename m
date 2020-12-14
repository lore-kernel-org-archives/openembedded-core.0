Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29836.1607916926312113884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +5JVDTfIX7uP59l07ok0VCJcsm0ZjiD7Ls9mmTjLs3o8r+qELuW2YgfxbUAMYGMR5rxos90VSB
 zKryq68kv7rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752354"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752354"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:25 -0800
IronPort-SDR: viNUmcPhc5RvFhim0DbD9QyMl/um5NcJUY2bABRB7R779RXSi1kjLV1bkMJcAHjTYb0JUR+isI
 EygnncpVHCng==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670745"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/19] sudo: fix multilib conflict
Date: Mon, 14 Dec 2020 11:35:00 +0800
Message-Id: <9d67dd5a6363b9fae10784e8056e469ba2ef5735.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It fails to install sudo and lib32-sudo at same time:

| Error: Transaction test error:
|  file /usr/libexec/sudo/audit_json.so conflicts between attempted
     installs of lib32-sudo-1.9.3p1-r0.core2_32 and sudo-1.9.3p1-r0.core2_64
|  file /usr/libexec/sudo/group_file.so conflicts between attempted
     installs of lib32-sudo-1.9.3p1-r0.core2_32 and sudo-1.9.3p1-r0.core2_64

Pass ${libdir} to configure option --libexecdir of sudo that it installs
plugin libraries to /usr/lib{,64} rather than /usr/libexec/. Then add a
patch to fix multilib conflict of sudo.conf.

[RP: Add missing Upstream-Status]
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9b6974cfcac370c6848d28400e0546ac85512e9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...o.conf.in-fix-conflict-with-multilib.patch | 52 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.3.bb      |  6 ++-
 2 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
new file mode 100644
index 0000000000..f7ccfdd623
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -0,0 +1,52 @@
+sudo.conf.in: fix conflict with multilib
+
+When pass ${libdir} to --libexecdir of sudo, it fails to install sudo
+and lib32-sudo at same time:
+
+| Error: Transaction test error:
+|  file /etc/sudo.conf conflicts between attempted installs of
+     sudo-1.9.3p1-r0.core2_64 and lib32-sudo-1.9.3p1-r0.core2_32
+
+Update the comments in sudo.conf.in to avoid the conflict.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Upstream-Status: Inappropriate [OE configuration specific]
+---
+ examples/sudo.conf.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
+index 19e33ff..af78235 100644
+--- a/examples/sudo.conf.in
++++ b/examples/sudo.conf.in
+@@ -4,7 +4,7 @@
+ # Sudo plugins:
+ #   Plugin plugin_name plugin_path plugin_options ...
+ #
+-# The plugin_path is relative to @plugindir@ unless
++# The plugin_path is relative to $plugindir such as /usr/lib/sudo unless
+ #   fully qualified.
+ # The plugin_name corresponds to a global symbol in the plugin
+ #   that contains the plugin interface structure.
+@@ -50,7 +50,7 @@ Plugin sudoers_audit sudoers.so
+ # The compiled-in value is usually sufficient and should only be changed
+ # if you rename or move the sudo_noexec.so file.
+ #
+-#Path noexec @plugindir@/sudo_noexec.so
++#Path noexec $plugindir/sudo_noexec.so
+ 
+ #
+ # Sudo plugin directory:
+@@ -59,7 +59,7 @@ Plugin sudoers_audit sudoers.so
+ # The default directory to use when searching for plugins that are
+ # specified without a fully qualified path name.
+ #
+-#Path plugin_dir @plugindir@
++#Path plugin_dir $plugindir
+ 
+ #
+ # Sudo developer mode:
+--
+2.17.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.3.bb b/meta/recipes-extended/sudo/sudo_1.9.3.bb
index 270625ebe8..0d0be9ab8b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3.bb
@@ -2,6 +2,7 @@ require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
@@ -24,6 +25,7 @@ EXTRA_OECONF += " \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${nonarch_libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
              --with-rundir=/run/sudo \
              --with-vardir=/var/lib/sudo \
+             --libexecdir=${libdir} \
              "
 
 do_install_append () {
@@ -43,5 +45,5 @@ do_install_append () {
 }
 
 FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
-FILES_${PN}-dev += "${libexecdir}/${BPN}/lib*${SOLIBSDEV} ${libexecdir}/${BPN}/*.la \
-                    ${libexecdir}/lib*${SOLIBSDEV} ${libexecdir}/*.la"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
+                    ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
-- 
2.29.2

