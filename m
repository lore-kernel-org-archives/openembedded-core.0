Return-Path: <toshikazu-n@nec.com>
Received: from esa15.hc221-79.ap.iphmx.com (esa15.hc221-79.ap.iphmx.com
	[139.138.31.214])
	by mail.openembedded.org (Postfix) with ESMTP id AE6DE61A6A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 07:47:13 +0000 (UTC)
IronPort-SDR: f/I35/OFLg+Cm52Jw3Mk9f3WRjFRWiaTS7+FaBX1YFhRilGgAqtfyORB+kZ9tU0yA3iP+V1KHf
	QWx2ksmsA+6Q+ex9lOv3ncf7HLctjqDUVpgGW2SU5mB4Wtk9UiqOAndjRo+xKuAJpV6VfpdjHv
	59NBIl4rfo5heUhHTBuRSTMr/NdUTCQS6SpugP341dsNCxBiX2VPPHK4rHL3C+5pGMRiJRuxU1
	88A6eZCu2DB7MX++dg9Rt8LqKA40KsK07vME9CKPri0NsC3J+kqaclYIvU/gKO9IjEdWf2NdGF
	v5s=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F5BQAT8mVe/68jj9JkHQEBAQkBEQU?=
	=?us-ascii?q?FAYF7gimBQQEBMCqNGKNOCQEBAQ4vBAEBhEMCgg8kOBMCAwEBAQMCBQEBBgE?=
	=?us-ascii?q?BAQEBAQQEAgJpBAEBBwoCAYROIQQBAQUKAUOGOQIBAxJnEFFXGSKDBIJ7mVI?=
	=?us-ascii?q?BgSg+AiMBPwEMgQWLMoVKgy+BPoE4h0qGPT+EY4oYIgSWeoErl3+CRnyFbo9?=
	=?us-ascii?q?+GoJJjG+LfS2qQoFpI0SBFE0jUIJsUBgNWJwcMgEBMY5pAQE?=
X-IronPort-AV: E=Sophos;i="5.70,532,1574089200"; d="scan'208";a="10086127"
X-NEC-Delivered: true
Received: from tyo175.gate.nec.co.jp ([210.143.35.175])
	by ob1.hc221-79.ap.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	09 Mar 2020 16:40:07 +0900
Received: from mailsv39.nec.co.jp (mailsv39.nec.co.jp [210.143.35.198])
	by tyo175.gate.nec.co.jp (8.15.1/8.15.1) with ESMTP id 0297e5Fw012704; 
	Mon, 9 Mar 2020 16:40:05 +0900
Received: from gisptrpm001.jp.nec.com ([10.49.113.41])
	by mailsv39.nec.co.jp (8.15.1/8.15.1) with ESMTP id 0297e5rq015012;
	Mon, 9 Mar 2020 16:40:05 +0900
Received: from GISPTRPM001.localhost.localdomain (localhost [127.0.0.1])
	by gisptrpm001.jp.nec.com (Postfix) with SMTP id B680110002E6E;
	Mon,  9 Mar 2020 16:40:05 +0900 (JST)
Received: from gisptrpm001.jp.nec.com (localhost [127.0.0.1])
	by GISPTRPM001.localhost.localdomain (Open ADVANCED MAIL);
	Mon, 9 Mar 2020 16:40:05 +0900
Received: from localhost.localdomain (unknown [10.27.189.215])
	by gisptrpm001.jp.nec.com (Postfix) with ESMTP id A53C72004B05B;
	Mon,  9 Mar 2020 16:40:05 +0900 (JST)
From: Toshikazu Nakayama <toshikazu-n@nec.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 16:35:09 +0900
Message-Id: <1583739309-11200-3-git-send-email-toshikazu-n@nec.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583739309-11200-1-git-send-email-toshikazu-n@nec.com>
References: <1583739309-11200-1-git-send-email-toshikazu-n@nec.com>
Subject: [RFC PATCH 2/2] vuln-cve_image: rootfs manifest about vulnerability
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
X-List-Received-Date: Mon, 09 Mar 2020 07:47:14 -0000

A rootfs post command function vuln_cve_make_manifests() generates
some manifests about CVE_REPORTS list variable where files are generated
in per package task. A vuln_cve_make_manifests() gather these files about
installed packages in image from sstate directory to deploy manifest files
specified in CVE_MANIFEST to CVE_MANIFEST_DIR.

If CVE_MANIFEST_POPULATES is valid, vuln_cve_make_manifests() populate
manifest with "No vulnerability task support packages" which are installed
but not inherit vuln-cve and populate package contents with name, version
and installed package names.

And for the image recipe itself, prepare VULNFUNC_IMAGE_CLASS plugin which
may append summary header as image manifest such as CVE database freshness
which is inserted at the top of manifest files.

Signed-off-by: Toshikazu Nakayama <toshikazu-n@nec.com>
---
 meta/classes/vuln-cve.bbclass       |  18 +++++-
 meta/classes/vuln-cve_image.bbclass | 111 ++++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/vuln-cve_image.bbclass

diff --git a/meta/classes/vuln-cve.bbclass b/meta/classes/vuln-cve.bbclass
index 0c7b78c..f916aa8 100644
--- a/meta/classes/vuln-cve.bbclass
+++ b/meta/classes/vuln-cve.bbclass
@@ -171,12 +171,24 @@ VULNFUNC_JUDGE_CVE = 'list'
 VULNFUNC_JUDGE_CVE = ""
 VULNFUNC_REPORT_CVE[type] = 'list'
 VULNFUNC_REPORT_CVE = ""
+VULNFUNC_IMAGE_CLASS[type] = 'list'
+VULNFUNC_IMAGE_CLASS = ""
 python do_vulnerability() {
+    g = globals()
+    manifest = d.getVar('CVE_MANIFEST_DIR', True)
+    if manifest:
+        # inherit vuln-cve_image from image recipe
+        image = d.getVar('IMAGE_BASENAME', True)
+        destdir = os.path.join(d.getVar('VULNSTATEDIR', True), image)
+        bb.utils.mkdirhier(destdir)
+        for func in d.getVar('VULNFUNC_IMAGE_CLASS', True).split() or "":
+            if func in g:
+                g[func](d, destdir)
+        return
+
     pn = d.getVar('PN', True)
     destdir = os.path.join(d.getVar('VULNSTATEDIR', True), pn)
     bb.utils.mkdirhier(destdir)
-    g = globals()
-
     cvelist = []
     # Gather potential CVE list by using CPE matching
     for scan in (d.getVar('VULNFUNC_SCAN_CVE', True) or "").split():
@@ -272,6 +284,8 @@ do_vulnerability[sstate-outputdirs] = "${VULN_CVE_DIRECTORY}"
 do_vulnerability[dir] = "${VULNSTATEDIR}/${PN}"
 do_vulnerability[cleandirs] = "${VULNSTATEDIR}"
 do_vulnerability[nostamp] = "1"
+# Raising for global "INHERIT += vuln-cve" variable usage.
+IMAGE_CLASSES_append = " vuln-cve_image"
 
 python do_vulnerability_setscene() {
     sstate_setscene(d)
diff --git a/meta/classes/vuln-cve_image.bbclass b/meta/classes/vuln-cve_image.bbclass
new file mode 100644
index 0000000..46cfdb3
--- /dev/null
+++ b/meta/classes/vuln-cve_image.bbclass
@@ -0,0 +1,111 @@
+# This class deploy CVE manifest for installed packages in rootfs
+CVE_REPORTS[type] = 'list'
+CVE_CREATE_MANIFEST ??= "1"
+CVE_REPORTS ?= "cve.summary cve.patchlist"
+CVE_MANIFEST[cve.summary] = "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve.sumary"
+CVE_MANIFEST[cve.patchlist] = "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve.patchlist"
+CVE_MANIFEST_DIR ?= "${DEPLOY_DIR_IMAGE}"
+CVE_MANIFEST_POPULATES ??= ""
+
+# If image build without INHERIT usage but inherit vuln-cve_image in recipe.
+inherit vuln-cve
+python vuln_cve_make_manifests() {
+    vulnstatedir = d.getVar('VULN_CVE_DIRECTORY', True)
+    destdir = d.getVar('CVE_MANIFEST_DIR', True)
+    bb.utils.mkdirhier(destdir)
+
+    from oe.rootfs import image_list_installed_packages
+    pkg_type = d.getVar('PACKAGE_CLASSES', True).replace("package_", "").split()[0]
+    pkg_dic = {}
+    notask = []
+    def is_notask(sstatedir):
+        if not os.path.exists(sstatedir):
+            return True
+        try:
+            import time
+            from datetime import datetime
+            elapsed = time.time() - os.path.getctime(sstatedir)
+            if elapsed >= 5 * 60 * 60:
+                # If package quit to inherit vuln-cve but not cleansstate yet,
+                # rootfs task can not detect it immediately.
+                # As results, manifest includes such package unfortunately.
+                #
+                # If sstate-dir stamp elapsed more than 5 hours from created,
+                # forced clean sstate-dir to exclude it from manifest.
+                bb.warn("%s got staled about vulnerability sstate, "
+                        "force to exclude from manifest" % pn)
+                bb.utils.remove(sstatedir, recurse=True)
+                return True
+        except OSError:
+            pass
+        return False
+
+    for pkg in image_list_installed_packages(d):
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
+                                'runtime-reverse', pkg)
+        pkgdata = oe.packagedata.read_pkgdatafile(pkg_info)
+        pkg_name = os.path.basename(os.readlink(pkg_info))
+        pn = pkgdata['PN']
+        if is_notask(os.path.join(vulnstatedir, pn)):
+            if not pn in notask:
+                notask.append(pn)
+            continue
+        elif pn in pkg_dic:
+            if pkg_name in pkg_dic[pn][pkg_type]:
+                continue
+            pkg_dic[pn][pkg_type].append(pkg_name)
+            continue
+        pkg_dic[pn] = {}
+        pkg_dic[pn]['pv'] = pkgdata['PV']
+        pkg_dic[pn][pkg_type] = [ pkg_name ]
+        pkg_dic[pn]['ssdir'] = os.path.join(vulnstatedir, pn)
+
+    from datetime import datetime
+    time_now = "%s" % datetime.now()
+    image = d.getVar('IMAGE_BASENAME', True)
+    image_sstate = os.path.join(vulnstatedir, image)
+    link_name = d.getVar("IMAGE_LINK_NAME")
+    do_populates = d.getVar('CVE_MANIFEST_POPULATES', True)
+    for rep in d.getVar('CVE_REPORTS', True).split():
+        manifest = d.getVarFlag('CVE_MANIFEST', rep, True)
+        manifest = os.path.join(destdir, manifest)
+        manifest_link = os.path.join(destdir, "%s.%s" % (link_name, rep))
+        if os.path.exists(os.path.realpath(manifest_link)):
+            bb.utils.remove(os.path.realpath(manifest_link))
+            bb.utils.remove(manifest_link)
+        # Header for this image
+        desc = []
+        if (os.path.exists(os.path.join(image_sstate, rep))):
+            # Insert private header if prepared for this manifest.
+            with open(os.path.join(image_sstate, rep), "r") as r:
+                desc.append(r.read())
+        else:
+            desc.append("%s: generated at %s\n" % (image, time_now))
+        if do_populates and len(notask) > 0:
+            notask = sorted(notask)
+            desc.append("\n")
+            desc.append("No vulnerability task support packages\n")
+            import textwrap
+            excludes =  textwrap.wrap("[%s]" % ', '.join(notask), 76)
+            desc.append(" %s\n" % '\n  '.join(excludes))
+        with open(manifest, 'w') as m:
+            m.write("%s\n" % ''.join(desc))
+        desc.clear()
+        for pn in sorted(pkg_dic):
+            write_msg = ""
+            if do_populates:
+                write_msg += "%s <%s> %s(%s)\n" % (pn, pkg_dic[pn]['pv'], pkg_type,
+                                                   ', '.join(pkg_dic[pn][pkg_type]))
+            if os.path.exists(os.path.join(pkg_dic[pn]['ssdir'], rep)):
+                with open(os.path.join(pkg_dic[pn]['ssdir'], rep), "r") as r:
+                    write_msg += r.read()
+            if not write_msg:
+                continue
+            desc.append(write_msg)
+        with open(manifest, 'a') as m:
+            m.write("%s" % '\n'.join(desc))
+            os.symlink(os.path.basename(manifest), manifest_link)
+            bb.plain("Image CVE report (%s) stored in: %s" % (rep, manifest))
+}
+ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'vuln_cve_make_manifests; ' if d.getVar('CVE_CREATE_MANIFEST') == '1' else ''}"
+do_rootfs[recrdeptask] += "${@'do_vulnerability' if d.getVar('CVE_CREATE_MANIFEST') == '1' else ''}"
-- 
2.7.4


