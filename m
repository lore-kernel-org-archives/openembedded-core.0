Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9H9-0002ta-Jx
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:25:01 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so4165597pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=D/Cnhw1xtiBNu1A6hfjmmey1iNSNI6DikUk+dBOeJ8M=;
	b=UkoZeifTNuoaMqe42KZJHWlVyi6JMFAVpaxpQl5OMoQKp9QRZVlpq6xD7hvScK2CjQ
	wkOj5zV6Ckw86UlO20deDzozXMjsuInNIEHPV9Y068RcDVw2SMbOvGlfDhniUq1+ddkp
	6ErNk+Xcxf4L+Wp8vYuqbfmxTDwnv5UcReEzmruXT9h85TNfJDew/cxT9vTTsxAImlyS
	h+ZEvlPLneHFXc0Q1ohpf89Zl4q6BDs9i6biPYmHjv5N6RbjPHa68OI0xOQGcxM2KXdI
	PX4uIBDWsDe3EKh4He2qAQPDl+Pc0fyjB3wFyPyce5w0sz8xlfXfqSczex6SH+Fue/Nt
	GcYA==
X-Received: by 10.68.91.66 with SMTP id cc2mr31504501pbb.51.1363032492243;
	Mon, 11 Mar 2013 13:08:12 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.08.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:35 -0700
Message-Id: <f7ba9c2b1c0d7d520300c6c3b38f5d5e0172ad51.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnGWpOXMiIGlJuFF+E0Cn+NHJ3sXNPswDTxP7CpHX4YHmJ29BWmzCheDXMjq3Se3bZgJBI7
Subject: [PATCH 5/9] update-rcd.bbclass: handle both sysvinit and systemd features being present
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
X-List-Received-Date: Mon, 11 Mar 2013 20:25:33 -0000

Run the helper if the sysvinit feature is present, or if the systemd feature is
present but the systemd class hasn't been inherited.  We want to run in the
latter case as systemd has sysvinit compatibility, but we don't want to always
so that pure systemd images don't have redundent sysvinit files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass                          |    9 ++++++---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 65bf022..06b91c1 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -75,9 +75,12 @@ python populate_packages_updatercd () {
         postrm += d.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-    # If the systemd class has also been inherited, then don't do anything as
-    # the systemd units will override anything created by update-rc.d.
-    if not d.getVar("SYSTEMD_BBCLASS_ENABLED", True):
+    # Run if the sysvinit feature is present, or if the systemd feature is present
+    # but the systemd class hasn't been inherited.  We want to run in the latter case
+    # as systemd has sysvinit compatibility, but we don't want to always so that
+    # pure systemd images don't have redundent sysvinit files.
+    if "sysvinit" in d.getVar("DISTRO_FEATURES").split() or \
+       ("systemd" in d.getVar("DISTRO_FEATURES").split() and not d.getVar("SYSTEMD_BBCLASS_ENABLED", True)):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
             pkgs = d.getVar('UPDATERCPN', True)
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index b9183a8..e73b46e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -27,7 +27,7 @@ RCONFLICTS_${PN} = "task-core-boot"
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
 VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
-VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'initscripts', '',d)}"
+VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES_INITMAN', 'sysvinit', 'initscripts', '',d)}"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 RDEPENDS_${PN} = "\
@@ -42,7 +42,7 @@ RDEPENDS_${PN} = "\
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_initscripts} \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-compat-units', '',d)} \
+    ${@base_contains('DISTRO_FEATURES_INITMAN', 'systemd', 'systemd-compat-units', '',d)} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-- 
1.7.10.4



