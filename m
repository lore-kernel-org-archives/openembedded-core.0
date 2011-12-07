Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RYNNF-0002I3-4n
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 20:41:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2011 11:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99763182"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.36])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2011 11:35:01 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 11:34:45 -0800
Message-Id: <b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323286080.git.elizabeth.flanagan@intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 6/8] [YOCTO #1776] license: manifest and license path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 19:41:49 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

This is a fairly large commit, so I want to step through some of
what this accomplishes:

1. Additional licenses

I've added/modified/corrected some of the common licenses
within OE-core in prep. for a major license audit. Most of these
are in SPDX format. A few, there is no OSI equivalent.

2. Additional SPDX mappings

I've added some additional SPDX mappings to account for removing
some duplicate licenses. (ie GPL-2 and GPL-2.0 were the same)
I've also remapped a few things to more accurately reflect what
they should be pointing at.

Note: Artistic/LGPL/GPL/MPL. Quite a few LICENSE fields list these
licenses. They make no sense and need auditing. In a future commit
I have some fixes to particularly egregious LICENSE fields, but
a full audit should be done. I've listed to obvious candidates at:

https://wiki.yoctoproject.org/wiki/License_Audit

3. License manifest

We now have a license manifest generation that occurs in rootfs for
everything BUT .deb. This requires the changes Paul Eggleton has
done to rootfs_* particularly the list_installed_packages function.
The manifest is accurate during a parallel bitbake now (Weee!) and
is prime for my planned SPDX format manifest during the next period.

4. License manifest on image.

We also want the ability to add licenses to the image. This
functionality is also in base-files and will be stripped out in my
next commit. The manifest is not added by default and is a two var
setting in license.conf:

If I want *just* the manifest on the image (small) then I set:
COPY_LIC_MANIFEST = "1"

This copies the manifest to:

/usr/share/common-licenses/license.manifest

If I want the actual PKG license text on the image (much larger)
I need to set both both COPY_LIC_MANIFEST and COPY_LIC_DIRS in
license.conf. This will create:

/usr/share/common-licenses/(package name)/(licenses in LIC_SRC_URI)

Word of warning. This can be larger than wanted depending on image
and is probably ripe for linking licenses, but I ran out of time this
week to get that done.

5. Custom License search path.

We now have the ability to add licenses to the build without touching
common-licenses. This is set via license.conf:

LICENSE_PATH += "/path/to/custom/licenses"

You want to make sure the license is unique. license.bbclass picks the
first license it finds.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass                       |  219 +++++---
 meta/conf/licenses.conf                            |   54 ++-
 meta/files/common-licenses/AFL-1                   |   92 ---
 meta/files/common-licenses/AFL-2                   |  155 ------
 meta/files/common-licenses/AGPL-3                  |  213 -------
 meta/files/common-licenses/APL-1                   |  327 -----------
 meta/files/common-licenses/APSL-1                  |  334 -----------
 meta/files/common-licenses/APSL-2                  |  337 -----------
 meta/files/common-licenses/Adobe                   |   14 +
 meta/files/common-licenses/Apache-1                |   59 --
 meta/files/common-licenses/Apache-2                |  203 -------
 meta/files/common-licenses/Artistic                |  131 -----
 meta/files/common-licenses/Artistic-1              |   97 ----
 meta/files/common-licenses/Artistic-2              |  202 -------
 meta/files/common-licenses/BSL-1                   |   25 -
 meta/files/common-licenses/BitstreamVera           |  160 ++++++
 meta/files/common-licenses/CATOSL-1                |  335 -----------
 meta/files/common-licenses/CC-BY-1                 |  185 -------
 meta/files/common-licenses/CC-BY-2                 |  205 -------
 meta/files/common-licenses/CC-BY-3                 |  283 ----------
 meta/files/common-licenses/CC-BY-NC-1              |  194 -------
 meta/files/common-licenses/CC-BY-NC-2              |  220 --------
 meta/files/common-licenses/CC-BY-NC-3              |  297 ----------
 meta/files/common-licenses/CC-BY-NC-ND-1           |  146 -----
 meta/files/common-licenses/CC-BY-NC-ND-2           |  209 -------
 meta/files/common-licenses/CC-BY-NC-ND-3           |  272 ---------
 meta/files/common-licenses/CC-BY-NC-SA-1           |  209 -------
 meta/files/common-licenses/CC-BY-NC-SA-2           |  242 --------
 meta/files/common-licenses/CC-BY-NC-SA-3           |  320 -----------
 meta/files/common-licenses/CC-BY-ND-2              |  194 -------
 meta/files/common-licenses/CC-BY-ND-3              |  259 ---------
 meta/files/common-licenses/CC-BY-SA-1              |  201 -------
 meta/files/common-licenses/CC-BY-SA-2              |  227 --------
 meta/files/common-licenses/CC-BY-SA-3              |  319 -----------
 meta/files/common-licenses/CDDL-1                  |  313 -----------
 meta/files/common-licenses/CECILL-1                |  462 ----------------
 meta/files/common-licenses/CECILL-2                |  451 ---------------
 meta/files/common-licenses/CPAL-1                  |  435 ---------------
 meta/files/common-licenses/CPL-1                   |  250 ---------
 meta/files/common-licenses/CUA-OPL-1               |  482 ----------------
 meta/files/common-licenses/DSSSL                   |   49 ++
 meta/files/common-licenses/ECL-1                   |   61 --
 meta/files/common-licenses/ECL-2                   |  218 --------
 meta/files/common-licenses/EDL-1.0                 |   13 +
 meta/files/common-licenses/EFL-1                   |   30 -
 meta/files/common-licenses/EFL-2                   |   27 -
 meta/files/common-licenses/EPL-1                   |  204 -------
 meta/files/common-licenses/EUPL-1                  |  302 ----------
 meta/files/common-licenses/Elfutils-Exception      |   12 +
 meta/files/common-licenses/ErlPL-1                 |  293 ----------
 meta/files/common-licenses/FSF-Unlimited           |    4 +
 meta/files/common-licenses/Frameworx-1             |  181 ------
 meta/files/common-licenses/FreeType                |  170 ++++++
 meta/files/common-licenses/GPL-1                   |  259 ---------
 meta/files/common-licenses/GPL-1.0+                |  252 ---------
 meta/files/common-licenses/GPL-2                   |   23 -
 .../common-licenses/GPL-2,0-with-GCC-exception     |   17 -
 .../common-licenses/GPL-2,0-with-font-exception    |   18 -
 meta/files/common-licenses/GPL-2.0+                |  132 -----
 .../common-licenses/GPL-2.0-with-GCC-exception     |   13 +-
 .../common-licenses/GPL-2.0-with-font-exception    |   14 +-
 meta/files/common-licenses/GPL-3                   |   70 ---
 meta/files/common-licenses/GPL-3.0                 |  224 ++++++++-
 meta/files/common-licenses/GPL-3.0+                |    3 -
 meta/files/common-licenses/IPL-1                   |  222 --------
 meta/files/common-licenses/LGPL-2                  |  461 ----------------
 meta/files/common-licenses/LGPL-2.0                |  189 ++++++-
 meta/files/common-licenses/LGPL-2.0+               |  173 ------
 meta/files/common-licenses/LGPL-2.1+               |  176 ------
 meta/files/common-licenses/LGPL-3                  |  147 -----
 meta/files/common-licenses/LGPL-3.0                |   53 +-
 meta/files/common-licenses/LGPL-3.0+               |   66 ---
 meta/files/common-licenses/LPL-1                   |  213 -------
 meta/files/common-licenses/LPPL-1                  |  422 --------------
 meta/files/common-licenses/MIT-style               |    1 -
 meta/files/common-licenses/MPL-1                   |  433 ---------------
 meta/files/common-licenses/NASA-1                  |  246 ---------
 meta/files/common-licenses/NPOSL-3                 |  206 -------
 meta/files/common-licenses/OASIS                   |   13 +
 meta/files/common-licenses/OCLC-2                  |  207 -------
 meta/files/common-licenses/OFL-1                   |   96 ----
 meta/files/common-licenses/OLDAP-2                 |   54 --
 meta/files/common-licenses/OSL-1                   |  172 ------
 meta/files/common-licenses/OSL-1.0                 |    2 +-
 meta/files/common-licenses/OSL-2                   |  171 ------
 meta/files/common-licenses/OSL-3                   |  157 ------
 meta/files/common-licenses/PHP-3                   |   70 ---
 meta/files/common-licenses/Proprietary             |    1 +
 meta/files/common-licenses/Python-2                |  192 -------
 meta/files/common-licenses/QPL-1                   |   96 ----
 meta/files/common-licenses/RPL-1                   |  582 --------------------
 meta/files/common-licenses/RPSL-1                  |  535 ------------------
 meta/files/common-licenses/SPL                     |  519 -----------------
 meta/files/common-licenses/Simple-2                |   53 --
 meta/files/common-licenses/UCB                     |   26 +
 meta/files/common-licenses/VSL-1                   |   54 --
 meta/files/common-licenses/Watcom-1                |  389 -------------
 meta/files/common-licenses/XFree86-1               |   50 --
 meta/files/common-licenses/YPL-1                   |  140 -----
 meta/files/common-licenses/ZPL-1                   |   60 --
 meta/files/common-licenses/ZPL-2                   |   44 --
 meta/files/common-licenses/Zimbra-1                |  140 -----
 meta/files/common-licenses/eCos-2                  |   38 --
 103 files changed, 1119 insertions(+), 17671 deletions(-)
 delete mode 100644 meta/files/common-licenses/AFL-1
 delete mode 100644 meta/files/common-licenses/AFL-2
 delete mode 100644 meta/files/common-licenses/AGPL-3
 delete mode 100644 meta/files/common-licenses/APL-1
 delete mode 100644 meta/files/common-licenses/APSL-1
 delete mode 100644 meta/files/common-licenses/APSL-2
 create mode 100644 meta/files/common-licenses/Adobe
 delete mode 100644 meta/files/common-licenses/Apache-1
 delete mode 100644 meta/files/common-licenses/Apache-2
 delete mode 100644 meta/files/common-licenses/Artistic
 delete mode 100644 meta/files/common-licenses/Artistic-1
 delete mode 100644 meta/files/common-licenses/Artistic-2
 delete mode 100644 meta/files/common-licenses/BSL-1
 create mode 100644 meta/files/common-licenses/BitstreamVera
 delete mode 100644 meta/files/common-licenses/CATOSL-1
 delete mode 100644 meta/files/common-licenses/CC-BY-1
 delete mode 100644 meta/files/common-licenses/CC-BY-2
 delete mode 100644 meta/files/common-licenses/CC-BY-3
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-1
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-2
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-3
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-ND-1
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-SA-1
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3
 delete mode 100644 meta/files/common-licenses/CC-BY-ND-1
 delete mode 100644 meta/files/common-licenses/CC-BY-ND-2
 delete mode 100644 meta/files/common-licenses/CC-BY-ND-3
 delete mode 100644 meta/files/common-licenses/CC-BY-SA-1
 delete mode 100644 meta/files/common-licenses/CC-BY-SA-2
 delete mode 100644 meta/files/common-licenses/CC-BY-SA-3
 delete mode 100644 meta/files/common-licenses/CDDL-1
 delete mode 100644 meta/files/common-licenses/CECILL-1
 delete mode 100644 meta/files/common-licenses/CECILL-2
 delete mode 100644 meta/files/common-licenses/CPAL-1
 delete mode 100644 meta/files/common-licenses/CPL-1
 delete mode 100644 meta/files/common-licenses/CUA-OPL-1
 create mode 100644 meta/files/common-licenses/DSSSL
 delete mode 100644 meta/files/common-licenses/ECL-1
 delete mode 100644 meta/files/common-licenses/ECL-2
 create mode 100644 meta/files/common-licenses/EDL-1.0
 delete mode 100644 meta/files/common-licenses/EFL-1
 delete mode 100644 meta/files/common-licenses/EFL-2
 delete mode 100644 meta/files/common-licenses/EPL-1
 delete mode 100644 meta/files/common-licenses/EUPL-1
 create mode 100644 meta/files/common-licenses/Elfutils-Exception
 delete mode 100644 meta/files/common-licenses/ErlPL-1
 create mode 100644 meta/files/common-licenses/FSF-Unlimited
 delete mode 100644 meta/files/common-licenses/Frameworx-1
 create mode 100644 meta/files/common-licenses/FreeType
 delete mode 100644 meta/files/common-licenses/GPL-1
 delete mode 100644 meta/files/common-licenses/GPL-1.0+
 delete mode 100644 meta/files/common-licenses/GPL-2
 delete mode 100644 meta/files/common-licenses/GPL-2,0-with-GCC-exception
 delete mode 100644 meta/files/common-licenses/GPL-2,0-with-font-exception
 delete mode 100644 meta/files/common-licenses/GPL-2.0+
 delete mode 100644 meta/files/common-licenses/GPL-3
 delete mode 100644 meta/files/common-licenses/GPL-3.0+
 delete mode 100644 meta/files/common-licenses/IPL-1
 delete mode 100644 meta/files/common-licenses/LGPL-2
 delete mode 100644 meta/files/common-licenses/LGPL-2.0+
 delete mode 100644 meta/files/common-licenses/LGPL-2.1+
 delete mode 100644 meta/files/common-licenses/LGPL-3
 delete mode 100644 meta/files/common-licenses/LGPL-3.0+
 delete mode 100644 meta/files/common-licenses/LPL-1
 delete mode 100644 meta/files/common-licenses/LPPL-1
 delete mode 120000 meta/files/common-licenses/MIT-style
 delete mode 100644 meta/files/common-licenses/MPL-1
 delete mode 100644 meta/files/common-licenses/NASA-1
 delete mode 100644 meta/files/common-licenses/NPOSL-3
 create mode 100644 meta/files/common-licenses/OASIS
 delete mode 100644 meta/files/common-licenses/OCLC-2
 delete mode 100644 meta/files/common-licenses/OFL-1
 delete mode 100644 meta/files/common-licenses/OLDAP-2
 delete mode 100644 meta/files/common-licenses/OSL-1
 delete mode 100644 meta/files/common-licenses/OSL-2
 delete mode 100644 meta/files/common-licenses/OSL-3
 delete mode 100644 meta/files/common-licenses/PHP-3
 create mode 100644 meta/files/common-licenses/Proprietary
 delete mode 100644 meta/files/common-licenses/Python-2
 delete mode 100644 meta/files/common-licenses/QPL-1
 delete mode 100644 meta/files/common-licenses/RPL-1
 delete mode 100644 meta/files/common-licenses/RPSL-1
 delete mode 100644 meta/files/common-licenses/SPL
 delete mode 100644 meta/files/common-licenses/Simple-2
 create mode 100644 meta/files/common-licenses/UCB
 delete mode 100644 meta/files/common-licenses/VSL-1
 delete mode 100644 meta/files/common-licenses/Watcom-1
 delete mode 100644 meta/files/common-licenses/XFree86-1
 delete mode 100644 meta/files/common-licenses/YPL-1
 delete mode 100644 meta/files/common-licenses/ZPL-1
 delete mode 100644 meta/files/common-licenses/ZPL-2
 delete mode 100644 meta/files/common-licenses/Zimbra-1
 delete mode 100644 meta/files/common-licenses/eCos-2

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 8c6e2d2..8c64e4c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -1,17 +1,12 @@
 # Populates LICENSE_DIRECTORY as set in distro config with the license files as set by
 # LIC_FILES_CHKSUM.
 # TODO:
-# - We should also enable the ability to put the generated license directory onto the
-#  rootfs
-# - Gather up more generic licenses
-# - There is a real issue revolving around license naming standards. See license names
-#  licenses.conf and compare them to the license names in the recipes. You'll see some
-#  differences and that should be corrected.
+# - There is a real issue revolving around license naming standards.
 
 LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
 LICSSTATEDIR = "${WORKDIR}/license-destdir/"
 
-addtask populate_lic after do_patch before do_package
+addtask populate_lic after do_patch before do_compile
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
@@ -22,33 +17,122 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 #
 # We should really discuss standardizing this field, but that's a longer term goal.
 # For now, we can do this and it should grab the most common LICENSE naming variations.
-
-#GPL variations
-SPDXLICENSEMAP[GPL] = "GPL-1"
-SPDXLICENSEMAP[GPLv2] = "GPL-2"
-SPDXLICENSEMAP[GPLv3] = "GPL-3"
+#
+# Changing GPL mapping to GPL-2 as it's not very likely to be GPL-1
+# We should NEVER have a GPL/LGPL without a version!!!!
+# Any mapping to MPL/LGPL/GPL should be fixed
+# see: https://wiki.yoctoproject.org/wiki/License_Audit
+
+# GPL variations
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
 
 #LGPL variations
-SPDXLICENSEMAP[LGPL] = "LGPL-2"
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2"
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
 
 #MPL variations
-SPDXLICENSEMAP[MPL] = "MPL-1"
-SPDXLICENSEMAP[MPLv1] = "MPL-1"
-SPDXLICENSEMAP[MPLv1.1] = "MPL-1"
+SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
+SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
+SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
 
 #MIT variations
 SPDXLICENSEMAP[MIT-X] = "MIT"
+SPDXLICENSEMAP[MIT-style] = "MIT"
 
 #Openssl variations
 SPDXLICENSEMAP[openssl] = "OpenSSL"
 
+#Python variations
+SPDXLICENSEMAP[PSF] = "Python-2.0"
+SPDXLICENSEMAP[PSFv2] = "Python-2.0"
+SPDXLICENSEMAP[Python-2] = "Python-2.0"
+
+#Apache variations
+SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
+SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
+
+#Artistic variations
+SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
+SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
+
+#Academic variations
+SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
+SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
+SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
+SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
+
 #Other variations
-SPDXLICENSEMAP[AFL2.1] = "AFL-2"
-SPDXLICENSEMAP[EPLv1.0] = "EPL-1"
+SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
+
+license_create_manifest() {
+    mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
+    # Get list of installed packages
+    list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
+    INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
+    # list of installed packages is broken for deb
+    if [ ${IMAGE_PKGTYPE} != "deb" ]; then
+
+        for pkg in ${INSTALLED_PKGS}; do
+            # not the best way to do this but licenses are not arch dependant iirc
+            files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
+            for filename in $files; do
+                pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
+                pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
+                # check to see if the package name exists in the manifest. if so, bail.
+                if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
+                    # exclude local recipes
+                    if [ ! ${pkged_pn} == "*locale*" ]; then
+                        echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                        echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                        echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                        for lic in ${pkged_lic}; do
+                            if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
+                                echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                            else
+                                echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                            fi
+                        done
+                        echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                    fi
+                fi
+            done
+        done
+    fi
+
+    # Two options here:
+    # - Just copy the manifest
+    # - Copy the manifest and the license directories
+    # This will make your image a bit larger, however 
+    # if you are concerned about license compliance 
+    # and delivery this should cover all your bases
+
+    if [ -n ${COPY_LIC_MANIFEST} ]; then
+        mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
+        cp ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
+        if [ -n ${COPY_LIC_DIRS} ]; then
+            for pkg in ${INSTALLED_PKGS}; do
+                mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
+                for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
+                    # Really don't need to copy the generics as they're 
+                    # represented in the manifest and in the actual pkg licenses
+                    # Doing so would make your image quite a bit larger
+                    if [ ! ${lic} == "generic_*" ]; then
+                        cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+                    fi
+                done
+            done
+        fi
+    fi
+
+}
+
 
 python do_populate_lic() {
     """
@@ -59,6 +143,26 @@ python do_populate_lic() {
     import shutil
     import oe.license
 
+    # All the license types for the package
+    license_types = d.getVar('LICENSE', True)
+    # All the license files for the package
+    lic_files = d.getVar('LIC_FILES_CHKSUM', True)
+    pn = d.getVar('PN', True)
+    # The base directory we wrangle licenses to
+    destdir = os.path.join(d.getVar('LICSSTATEDIR', True), pn)
+    # The license files are located in S/LIC_FILE_CHECKSUM.
+    srcdir = d.getVar('S', True)
+    # Directory we store the generic licenses as set in the distro configuration
+    generic_directory = d.getVar('COMMON_LICENSE_DIR', True)
+    license_source_dirs = []
+    license_source_dirs.append(generic_directory)
+    try:
+        additional_lic_dirs = d.getVar('LICENSE_DIR', True).split()
+        for lic_dir in additional_lic_dirs:
+            license_source_dirs.append(lic_dir)
+    except:
+        pass
+
     class FindVisitor(oe.license.LicenseVisitor):
         def visit_Str(self, node):
             #
@@ -70,54 +174,38 @@ python do_populate_lic() {
             find_license(node.s.replace("+", "").replace("*", ""))
             self.generic_visit(node)
 
-    def copy_license(source, destination, file_name):
-        try:
-            bb.copyfile(os.path.join(source, file_name), os.path.join(destination, file_name))
-        except:
-            bb.warn("%s: No generic license file exists for: %s at %s" % (pn, file_name, source))
-            pass
-
-    def link_license(source, destination, file_name):
-        try:
-            os.symlink(os.path.join(source, file_name), os.path.join(destination, "generic_" + file_name))
-        except:
-            bb.warn("%s: Could not symlink: %s at %s to %s at %s" % (pn, file_name, source, file_name, destination))
-            pass
-
     def find_license(license_type):
         try:
             bb.mkdirhier(gen_lic_dest)
         except:
             pass
-
+        spdx_generic = None
+        license_source = None
         # If the generic does not exist we need to check to see if there is an SPDX mapping to it
-        if not os.path.isfile(os.path.join(generic_directory, license_type)):
-            if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
-                # Great, there is an SPDXLICENSEMAP. We can copy!
-                bb.note("We need to use a SPDXLICENSEMAP for %s" % (license_type))
-                spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
-                copy_license(generic_directory, gen_lic_dest, spdx_generic)
-                link_license(gen_lic_dest, destdir, spdx_generic)
-            else:
-                # And here is where we warn people that their licenses are lousy
-                bb.warn("%s: No generic license file exists for: %s at %s" % (pn, license_type, generic_directory))
-                bb.warn("%s: There is also no SPDXLICENSEMAP for this license type: %s at %s" % (pn, license_type, generic_directory))
-                pass
-        elif os.path.isfile(os.path.join(generic_directory, license_type)):
-            copy_license(generic_directory, gen_lic_dest, license_type)
-            link_license(gen_lic_dest, destdir, license_type)
-
-    # All the license types for the package
-    license_types = d.getVar('LICENSE', True)
-    # All the license files for the package
-    lic_files = d.getVar('LIC_FILES_CHKSUM', True)
-    pn = d.getVar('PN', True)
-    # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR', True), pn)
-    # The license files are located in S/LIC_FILE_CHECKSUM.
-    srcdir = d.getVar('S', True)
-    # Directory we store the generic licenses as set in the distro configuration
-    generic_directory = d.getVar('COMMON_LICENSE_DIR', True)
+        for lic_dir in license_source_dirs:
+            if not os.path.isfile(os.path.join(lic_dir, license_type)):
+                if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
+                    # Great, there is an SPDXLICENSEMAP. We can copy!
+                    bb.debug(1, "We need to use a SPDXLICENSEMAP for %s" % (license_type))
+                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
+                    license_source = lic_dir
+                    break
+            elif os.path.isfile(os.path.join(lic_dir, license_type)):
+                spdx_generic = license_type
+                license_source = lic_dir
+                break
+
+        if spdx_generic and license_source:
+            # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
+            # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
+            ret = bb.copyfile(os.path.join(license_source, spdx_generic), os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type))
+            # If the copy didn't occur, something horrible went wrong and we fail out
+            if not ret:
+                bb.warn("%s for %s could not be copied for some reason. It may not exist. WARN for now." % (spdx_generic, pn))
+        else:
+            # And here is where we warn people that their licenses are lousy
+            bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
+            pass
 
     try:
         bb.mkdirhier(destdir)
@@ -139,11 +227,9 @@ python do_populate_lic() {
         srclicfile = os.path.join(srcdir, path)
         ret = bb.copyfile(srclicfile, os.path.join(destdir, os.path.basename(path)))
         # If the copy didn't occur, something horrible went wrong and we fail out
-        if ret is False or ret == 0:
+        if not ret:
             bb.warn("%s could not be copied for some reason. It may not exist. WARN for now." % srclicfile)
 
-    gen_lic_dest = os.path.join(d.getVar('LICENSE_DIRECTORY', True), "common-licenses")
-
     v = FindVisitor()
     try:
         v.visit_string(license_types)
@@ -156,8 +242,9 @@ do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
+ROOTFS_POSTINSTALL_COMMAND += "license_create_manifest; "
+
 python do_populate_lic_setscene () {
 	sstate_setscene(d)
 }
 addtask do_populate_lic_setscene
-
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index e81434d..e2f6149 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -1,5 +1,51 @@
-SRC_DISTRIBUTE_LICENSES += "GPL GPLv2 BSD LGPL Apache-2.0 QPL AFL"
-SRC_DISTRIBUTE_LICENSES += "MIT Sleepycat Classpath Perl PSF PD Artistic"
-SRC_DISTRIBUTE_LICENSES += "bzip2 zlib ntp cron libpng netperf openssl"
-SRC_DISTRIBUTE_LICENSES += "Info-ZIP tcp-wrappers"
+# These aren't actually used anywhere that I can tell
+# They may be in the future (or are used by someone else
+# For completion sake, I've updated them
+SRC_DISTRIBUTE_LICENSES += "AAL Adobe AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0"
+SRC_DISTRIBUTE_LICENSES += "AGPL-3.0 ANTLR-PD Apache-1.0 Apache-1.1 Apache-2.0"
+SRC_DISTRIBUTE_LICENSES += "APL-1.0 APSL-1.0 APSL-1.1 APSL-1.2 APSL-2.0"
+SRC_DISTRIBUTE_LICENSES += "Artistic-1.0 Artistic-2.0 BitstreamVera BSD"
+SRC_DISTRIBUTE_LICENSES += "BSD-2-Clause BSD-3-Clause BSD-4-Clause BSL-1.0"
+SRC_DISTRIBUTE_LICENSES += "CATOSL-1.1 CC0-1.0 CC-BY-1.0 CC-BY-2.0 CC-BY-2.5"
+SRC_DISTRIBUTE_LICENSES += "CC-BY-3.0 CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5"
+SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-3.0 CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.0"
+SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY-NC-SA-1.0"
+SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0"
+SRC_DISTRIBUTE_LICENSES += "CC-BY-ND-1.0 CC-BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0"
+SRC_DISTRIBUTE_LICENSES += "CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0"
+SRC_DISTRIBUTE_LICENSES += "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C"
+SRC_DISTRIBUTE_LICENSES += "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 DSSSL"
+SRC_DISTRIBUTE_LICENSES += "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0 EFL-2.0"
+SRC_DISTRIBUTE_LICENSES += "Elfutils-Exception Entessa EPL-1.0 ErlPL-1.1"
+SRC_DISTRIBUTE_LICENSES += "EUDatagrid EUPL-1.0 EUPL-1.1 Fair Frameworx-1.0"
+SRC_DISTRIBUTE_LICENSES += "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0"
+SRC_DISTRIBUTE_LICENSES += "GPL-2.0 GPL-2.0-with-autoconf-exception"
+SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-classpath-exception"
+SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-font-exception"
+SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-GCC-exception"
+SRC_DISTRIBUTE_LICENSES += "GPL-2-with-bison-exception GPL-3.0"
+SRC_DISTRIBUTE_LICENSES += "GPL-3.0-with-autoconf-exception"
+SRC_DISTRIBUTE_LICENSES += "GPL-3.0-with-GCC-exception"
+SRC_DISTRIBUTE_LICENSES += "gSOAP-1 gSOAP-1.3b HPND IPA IPL-1.0 ISC LGPL-2.0"
+SRC_DISTRIBUTE_LICENSES += "LGPL-2.1 LGPL-3.0 Libpng LPL-1.02 LPPL-1.0 LPPL-1.1"
+SRC_DISTRIBUTE_LICENSES += "LPPL-1.2 LPPL-1.3c MirOS MIT Motosoto MPL-1.0"
+SRC_DISTRIBUTE_LICENSES += "MPL-1.1 MS-PL MS-RL Multics NASA-1.3 Nauman NCSA"
+SRC_DISTRIBUTE_LICENSES += "NGPL Nokia NPOSL-3.0 NTP OASIS OCLC-2.0 ODbL-1.0"
+SRC_DISTRIBUTE_LICENSES += "OFL-1.1 OGTSL OLDAP-2.8 OpenSSL OSL-1.0 OSL-2.0"
+SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
+SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
+SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD Simple-2.0 Sleepycat"
+SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C
+SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.1 Xnet YPL-1.1"
+SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
 
+
+# Additional license directories. Add your custom licenses directories this path.
+# LICENSE_PATH += "${COREBASE}/custom-licenses"
+
+# Set if you want the license.manifest copied to the image
+#COPY_LIC_MANIFEST = "1"
+
+# If you want the pkg licenses copied over as well you must set 
+# both COPY_LIC_MANIFEST and COPY_LIC_DIRS
+#COPY_LIC_DIRS = "1"



