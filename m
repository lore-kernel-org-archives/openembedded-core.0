Return-Path: <openembedded-devel@urbanec.net>
Received: from mail13.tpgi.com.au (mail13.tpgi.com.au [203.12.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9C93C60DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 22:27:43 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Thu, 16 Oct 2014 09:27:43 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail13.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9FMRedr027210
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:27:43 +1100
Received: from gw.urbanec.net ([192.168.42.254] helo=www.urbanec.net)
	by gw.urbanec.net with esmtp (Exim 4.80.1)
	(envelope-from <openembedded-devel@urbanec.net>) id 1XeX2g-0005Nr-Re
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Oct 2014 09:27:38 +1100
MIME-Version: 1.0
Date: Thu, 16 Oct 2014 09:27:38 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
To: openembedded-core@lists.openembedded.org
Message-ID: mid:1
X-Sender: openembedded-devel@urbanec.net
User-Agent: Roundcube Webmail/1.0.2
Subject: [PATCH V3] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Wed, 15 Oct 2014 22:27:45 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

opkg upgrade will now call prerm and postrm scripts from the old package
with "upgrade new-version" arguments, similar to what dpkg does.

Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
---
  .../opkg/opkg/prerm-and-postrm-scripts.patch       | 81 
++++++++++++++++++++++
  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
  2 files changed, 82 insertions(+)
  create mode 100644 
meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch

diff --git 
a/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch 
b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
new file mode 100644
index 0000000..98a447a
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
@@ -0,0 +1,81 @@
+From 476965fdb2d6eec559242e6205cbb07d539b80e1 Mon Sep 17 00:00:00 2001
+From: Peter Urbanec <openembedded-devel@urbanec.net>
+Date: Wed, 15 Oct 2014 14:32:22 +1100
+Subject: [PATCH] opkg_install: Call prerm and postrm scripts on package 
upgrade.
+To: opkg-devel@googlegroups.com
+Cc: paul@paulbarker.me.uk
+
+When upgrading a package from v1 to v2, run "v1-prerm upgrade v2" and
+"v1-postrm upgrade v2", similarly to what dpkg does.
+
+Fixes opkg issue 104: Support prerm scripts for the old package
+See https://code.google.com/p/opkg/issues/detail?id=104
+
+Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
+Upstream-Status: Submitted [opkg-devel@googlegroups.com]
+
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
+
+ static int
+@@ -1001,7 +1019,25 @@ postrm_upgrade_old_pkg(pkg_t *pkg, pkg_t 
*old_pkg)
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
+
+ static int
+--
+2.1.2
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb 
b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
index 3dd7489..c5b6561 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
@@ -4,6 +4,7 @@ SRC_URI = 
"http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
             file://no-install-recommends.patch \
             file://add-exclude.patch \
             file://opkg-configure.service \
+           file://prerm-and-postrm-scripts.patch \
  "

  S = "${WORKDIR}/${BPN}-${PV}"
-- 
2.1.2



