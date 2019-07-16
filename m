Return-Path: <adrian.ratiu@collabora.com>
X-Greylist: delayed 311 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Jul 2019 22:01:06 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 3891E7CE21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 22:01:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aratiu) with ESMTPSA id 0F6C528B36C
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 00:55:58 +0300
Message-Id: <20190716215558.23327-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] opkg/package/rootfs_ipk: allow overwriting OPKGLIBDIR
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
X-List-Received-Date: Tue, 16 Jul 2019 22:01:07 -0000
Content-Transfer-Encoding: 8bit

Some distributions for various reasons (like for example mounting a
tmpfs over /var at runtime) can't use /var/lib to store the opkg
metadata, so a different path is required to have a functioning
package manager.

${localstatedir} can't be modified to something other than the
hardcoded value in bitbake.conf because other recipes depending on it
will fail to install.

So the only recourse, which is also the least invasive, is to allow
distros to overwrite the OPKGLIBDIR variable just like they are also
allowed to overwrite OPKGBUILDCMD.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 meta/classes/package_ipk.bbclass         | 2 +-
 meta/classes/rootfs_ipk.bbclass          | 2 +-
 meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d1b317b42b..9f9da2f91d 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -14,7 +14,7 @@ OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
 OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() != ""]}"
 
-OPKGLIBDIR = "${localstatedir}/lib"
+OPKGLIBDIR ??= "${localstatedir}/lib"
 
 python do_package_ipk () {
     workdir = d.getVar('WORKDIR')
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index aabc370cfc..e73d2bfdae 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -21,7 +21,7 @@ OPKG_PREPROCESS_COMMANDS = ""
 
 OPKG_POSTPROCESS_COMMANDS = ""
 
-OPKGLIBDIR = "${localstatedir}/lib"
+OPKGLIBDIR ??= "${localstatedir}/lib"
 
 MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
 
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 8c48d3097c..c663eff13b 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -28,7 +28,7 @@ PACKAGES =+ "libopkg"
 inherit autotools pkgconfig systemd ptest
 
 target_localstatedir := "${localstatedir}"
-OPKGLIBDIR = "${target_localstatedir}/lib"
+OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
 PACKAGECONFIG ??= "libsolv"
 
-- 
2.22.0


