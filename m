Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id 728F865D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 11:49:44 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Wed, 15 Oct 2014 22:49:44 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9FBngCF007677
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 22:49:44 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XeN5I-0006HB-Bl for openembedded-core@lists.openembedded.org;
	Wed, 15 Oct 2014 22:49:40 +1100
Message-ID: <543E5F54.9090907@urbanec.net>
Date: Wed, 15 Oct 2014 22:49:40 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Wed, 15 Oct 2014 11:49:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

opkg upgrade will now call prerm and postrm scripts from the old package
with the "upgrade new-version" arguments, similar to what dpkg does.

Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
Upstream-Status: Submitted [opkg-devel@googlegroups.com]
---
 .../opkg/opkg/prerm-and-postrm-scripts.patch       | 79 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch

diff --git a/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
new file mode 100644
index 0000000..c393807
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
@@ -0,0 +1,79 @@
+From 476965fdb2d6eec559242e6205cbb07d539b80e1 Mon Sep 17 00:00:00 2001
+From: Peter Urbanec <openembedded-devel@urbanec.net>
+Date: Wed, 15 Oct 2014 14:32:22 +1100
+Subject: [PATCH] opkg_install: Call prerm and postrm scripts on package
+ upgrade.
+To: opkg-devel@googlegroups.com
+Cc: paul@paulbarker.me.uk
+
+When upgrading a package from v1 to v2, run "v1-prerm upgrade v2" and
+"v1-postrm upgrade v2", similarly to what dpkg does.
+
+This patch fixes issue 104.
+
+Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
+---
+ libopkg/opkg_install.c | 40 ++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 38 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_install.c b/libopkg/opkg_install.c
+index 4f6fe65..ec0f34a 100644
+--- a/libopkg/opkg_install.c
++++ b/libopkg/opkg_install.c
+@@ -601,7 +601,25 @@ prerm_upgrade_old_pkg(pkg_t *pkg, pkg_t *old_pkg)
+ 	   Error unwind, for both the above cases:
+ 	   old-postinst abort-upgrade new-version
+      */
+-     return 0;
++    int err;
++    char *script_args;
++    char *new_version;
++
++    if (!old_pkg || !pkg)
++        return 0;
++
++    new_version = pkg_version_str_alloc(pkg);
++
++    sprintf_alloc(&script_args, "upgrade %s", new_version);
++    free(new_version);
++    err = pkg_run_script(old_pkg, "prerm", script_args);
++    free(script_args);
++    if (err != 0) {
++        opkg_msg(ERROR, "prerm script for package \"%s\" failed\n",
++                 old_pkg->name);
++        return -1;
++    }
++    return 0;
+ }
+ + static int
+@@ -1001,7 +1019,25 @@ postrm_upgrade_old_pkg(pkg_t *pkg, pkg_t *old_pkg)
+ 	   new-postrm failed-upgrade old-version
+ 	Error unwind, for both cases:
+ 	   old-preinst abort-upgrade new-version    */
+-     return 0;
++    int err;
++    char *script_args;
++    char *new_version;
++
++    if (!old_pkg || !pkg)
++        return 0;
++
++    new_version = pkg_version_str_alloc(pkg);
++
++    sprintf_alloc(&script_args, "upgrade %s", new_version);
++    free(new_version);
++    err = pkg_run_script(old_pkg, "postrm", script_args);
++    free(script_args);
++    if (err != 0) {
++        opkg_msg(ERROR, "postrm script for package \"%s\" failed\n",
++                 old_pkg->name);
++        return -1;
++    }
++    return 0;
+ }
+ + static int
+-- +2.1.2
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
index 3dd7489..c5b6561 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
@@ -4,6 +4,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://no-install-recommends.patch \
            file://add-exclude.patch \
            file://opkg-configure.service \
+           file://prerm-and-postrm-scripts.patch \
 "
  S = "${WORKDIR}/${BPN}-${PV}"
-- 
2.1.2



