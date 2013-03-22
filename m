Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ee-0007gv-QX
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:44 +0100
Received: by mail-wi0-f175.google.com with SMTP id c10so2796202wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=xuKsCGvMciHcVXwRyCf9C6f8rO4JxXqUu25hOgsMfwk=;
	b=ahsgOWKF9zhvxmUtzN8Op85JwvZDgITsHrpI0qOOoMR3WAJwiyhcXtJh93Nd+z+tSh
	mU4v1l1tZ8AD+LTSNpRlnfoyTtQmWMvrSz2gFeevR8A3E3GY5DeCfB4XJpQtEW8db2XE
	suMzY2hiYhDG69Vbs+kaZ5cx7Ez4PY5shC/V7aJIFhnIs0bpi6R5CrKCwCjuaxUy5j5J
	0LQ9QOxIOv+xjdBis5QR2UA/WxOKPNM0cwOpsp+mEzfqixTrn2Axh/75VNfISpLaznoc
	ELywUpFEpqPbdPHjxSu8qeW1/KHFBhSSjTcRpScdq1Pf4sSNI8V7SGQDgXFw7eFeMoxk
	Au8A==
X-Received: by 10.194.71.241 with SMTP id y17mr4752634wju.28.1363974102982;
	Fri, 22 Mar 2013 10:41:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.41
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:29 +0000
Message-Id: <876b70b30d4ed72bed465147dc6ecf28f331e2f7.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmR3J8DOuuPlu5ATLiNdtmKILfo3noX+HM0MTSmRVrQwsJSUQT82MnfAnF0sTeepJ7fLpwO
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/22] update-rcd.bbclass: handle both sysvinit and systemd features being present
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:30 -0000

Run the helper if the sysvinit feature is present, or if the systemd feature is
present but the systemd class hasn't been inherited.  We want to run in the
latter case as systemd has sysvinit compatibility, but we don't want to always
run so that pure systemd images don't have redundant sysvinit files.

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



