Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGqcJ-0007cj-L9
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:21:27 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGqJv-0006OW-EN
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:02:27 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 13:02:26 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348660947.31293.105.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] kernel.bbclass, module.bbclass: Make update-modules optional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 12:21:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The update-modules mechanism is something of a historical relic and it isn't
entirely clear that it has a great deal of value nowadays.  Also, it causes a
problem when building a read-only rootfs since update-modules itself refuses
to configure offline.

Allow DISTROs to circumvent this whole thing by declaring (via DISTRO_FEATURES)
that they don't wish to use update-modules.  This is backfilled for existing
distributions and will have to be marked as CONSIDERED by those who actually
don't want it.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/kernel.bbclass |   24 ++++++++++++++++--------
 meta/classes/module.bbclass |    2 +-
 meta/conf/bitbake.conf      |    2 +-
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fdef1be..d3af67c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -398,10 +398,12 @@ python populate_packages_prepend () {
 
         dvar = d.getVar('PKGD', True)
 
+        use_update_modules = oe.utils.contains('DISTRO_FEATURES', 'update-modules', True, False, d)
+
         # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
         # appropriate modprobe commands to the postinst
         autoload = d.getVar('module_autoload_%s' % basename, True)
-        if autoload:
+        if autoload and use_update_modules:
             name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
             for m in autoload.split():
@@ -415,15 +417,16 @@ python populate_packages_prepend () {
 
         # Write out any modconf fragment
         modconf = d.getVar('module_conf_%s' % basename, True)
-        if modconf:
+        if modconf and use_update_modules:
             name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
             f.write("%s\n" % modconf)
             f.close()
 
-        files = d.getVar('FILES_%s' % pkg, True)
-        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
-        d.setVar('FILES_%s' % pkg, files)
+        if use_update_modules:
+            files = d.getVar('FILES_%s' % pkg, True)
+            files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
+            d.setVar('FILES_%s' % pkg, files)
 
         if vals.has_key("description"):
             old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
@@ -441,12 +444,17 @@ python populate_packages_prepend () {
     module_regex = '^(.*)\.k?o$'
     module_pattern = 'kernel-module-%s'
 
-    postinst = d.getVar('pkg_postinst_modules', True)
-    postrm = d.getVar('pkg_postrm_modules', True)
+    use_update_modules = oe.utils.contains('DISTRO_FEATURES', 'update-modules', True, False, d)
+    if use_update_modules:
+        postinst = d.getVar('pkg_postinst_modules', True)
+        postrm = d.getVar('pkg_postrm_modules', True)
+    else:
+        postinst = None
+        postrm = None
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-    do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
+    do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%skernel-%s' % (['', 'update-modules '][use_update_modules], d.getVar("KERNEL_VERSION", True)))
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
     # avoid warnings. removedirs only raises an OSError if an empty
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index c721202..e8d32eb 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,4 +1,4 @@
-RDEPENDS += "kernel-image update-modules"
+RDEPENDS_${PN} += "kernel-image ${@oe.utils.contains('DISTRO_FEATURES', 'update-modules', 'update-modules', '', d)}"
 DEPENDS += "virtual/kernel"
 
 inherit module-base
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3496d2b..5196018 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -724,7 +724,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio"
+DISTRO_FEATURES_BACKFILL = "pulseaudio update-modules"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
 MACHINE_FEATURES_BACKFILL = "rtc"
-- 
1.7.10.4





