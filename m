Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD655D29C50
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:41:12 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41745.1768848068390843463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYx+9PC9;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-501480765a0so8338651cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 10:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768848067; x=1769452867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ/pWdMJpe3ubB2wClVkyoH385226025Y36MSAB88bE=;
        b=IYx+9PC9dU4UtenQx26FM+c5FYHek4uyJuDxnlSqdzeZupVnJVQlHzOxnAqOAcZnzC
         1VfRUvb6Bd1vdEoOGhXxIvTFcEFezc14A8kGearp6oLBQWnRvkeYLpJihbxgqGcXuv3O
         wOKoPcM/QUgxTx3KP57y2nMKkkxW4tyMYajhlPWLKmzxEO0+adVrcJZAqnrbtYkutpgO
         KvnlaBCC1FyFOMc9a2gMO8u9r36RC/7KYGfT96c0sj0rPdthSUPYBudVZEqZTK4vJUyN
         uH9nH6PGxsuvPF7NDBPoVx9btO3Y9g65Emo7db5vMAaC8S9t/y2nedSuCL38ECTan2Kx
         iWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768848067; x=1769452867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJ/pWdMJpe3ubB2wClVkyoH385226025Y36MSAB88bE=;
        b=boP0gxpGmT1yZ0vX+Mz4tqHKjhBy6FHxijLIT0g9MhDhfyMZujxaO4GLyPyUjzVWoE
         Iw6avZ4XjdJ/dtb7Hx9rDb1CFP6mYiOR3ej6tkNYmtbGLA9fYhjMtHMzxY9rANE7dtqS
         i5Dxo2nFb3pzwBgWA1sk+QMaaSV1pmNB0t6/ax570syvO9UkirQ2IO9NMrabw6f1V0XQ
         tUpW8ymMe4bcJi9mJYm7nSvaFzWsbmh++4FhmB+MA4Ct8e4/ruMQ80I3o+EPnPC0aG+y
         rKg/Kzb5UsFhUmgE0jk3JQyl68FpeyiMSHejJE4YKZiEjLNgHq6wKAu3D8TZuXerSBYk
         B5hw==
X-Gm-Message-State: AOJu0Yw7QlBsX9XLgAu/6n/MQLFdt40TzHJG0eK1OkWlwyU6eesRJS+6
	/UVo8A+9Z+b8NDsEXt6j7aO/sWLY6/elWqhrqOErLoSGHSzrW1Ao6wWpXuGhSXLLF6l4uQ==
X-Gm-Gg: AY/fxX4l9nhKI0CIDXfixC1aREPsw08jGj2dv5cZCCDtJR5PRJ8oUknrCoT9INUXuOa
	OnuVaJ/mkrOs/HpWeeE/VQfBF0R0JYKEOD6lR7Lv2QUZU+TMdM9riN/Wu4YGtdvg2VZNA+j4GMe
	E8018i/e5Olnt9ul0IVmBXZJw4LDoqre6Qd/jPCBnMr3NKo2JmYI3FhYWYD3cu8qOVNiZNzgNw2
	2szCBm3Yn5UlyOdWSXq2+IR4spUbZvzMjzVvjYpzzv3JVGd3QrYs6Y/R7odiTyNl7ZsEeKJWw1p
	oONIh0qDXvyh9Uro43S4s85KxaUIUF37DgvX5Zk9z0SZFkVkPFBWywNnowrCB1iaLyYwnF7CoRa
	oITA8LsUMkkRYZ5nG15ARkDyj6uz48RtGdkeMyucNB5zUKPwbNT/1gyYpKQVBtfMYy5wygU92+f
	X6TnBWONbjIn6dcOrOnkW5Lyi/GO8ugrvHa83DfR2L2Q5X0hf2HHkkp3Y=
X-Received: by 2002:a05:622a:40d:b0:501:46db:6b18 with SMTP id d75a77b69052e-502a15e4b14mr136788131cf.2.1768848067135;
        Mon, 19 Jan 2026 10:41:07 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1c3a5b3sm77805701cf.0.2026.01.19.10.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:41:06 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v4 1/1] improve_kernel_cve_report: Add a bbclass support
Date: Mon, 19 Jan 2026 13:40:50 -0500
Message-ID: <20260119184051.2878026-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119184051.2878026-1-valentin.boudevin@gmail.com>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260119184051.2878026-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229632

The script improve_kernel_cve_report.py doesn't have a bbclass.
It can be useful to have one to generate improved cve-check files at
every run.

This commit contains three classes:

-improve_kernel_cve_report-base.bbclass: Base class which contains the
tasks to perform improve_kernel_cve_report.py initialization and
execution.
-improve_kernel_cve_report-spdx-2.2.bbclass: Set
IMPROVE_KERNEL_SPDX_FILE variable for SPDX-2.2 builds and set
IMPROVE_KERNEL_PREFERRED_PROVIDER to require "create-spdx-2.2" in
INHERIT
-improve_kernel_cve_report-spdx.bbclass: Set IMPROVE_KERNEL_SPDX_FILE
variable for SPDX-3.0 projectsi and IMPROVE_KERNEL_PREFERRED_PROVIDER to
"create-spdx" to requires it in INHERIT

These three new .bbclass files can be used to generate a new output in
tmp/deploy/images with a .scouted.json file in addition to the existing
.json cve-check file.

The new .scouted.json is based on the cve-check file and the SBOM to
generate this improved cve-check file with extra entries found by the
script improve_kernel_cve_report.py.

It only requires to use "inherit" on an image recipe (e.g. on
core-image-minimal).

The bbclass "improve_kernel_cve_report-spdx-2.2.bbclass" can be used if
"create-spdx-2.2" is configured in INHERIT, and "create-spdx" is
removed.

INHERIT:remove = "create-spdx"
INHERIT:append = " create-spdx-2.2"

By default, projects use SPDX-3.0 and don't require any additional
configuration.

It also works offline and/or with custom repos thanks to the variables:

-IMPROVE_KERNEL_CVE_SRC_URI: Use to set SRC_URI for "vulns" repository
-IMPROVE_KERNEL_CVE_SRCREV: Use to fix a SRCREV for "vulns" repository.
By default the class use AUTOREV to get the latest commit available but
will require a fix commit if used offline.
-IMPROVE_KERNEL_CVE_NETWORK:
Use DL_DIR folder as to find the source "vulns" repository and set
offline mode
-IMPROVE_KERNEL_CVE_WORKDIR: Working directory for the class
-IMPROVE_KERNEL_CVE_DESTSUFFIX: Suffix used to clone the "vulns"
repository IMPROVE_KERNEL_CVE_UNPACK_DIR: Folder to unpack the "vulns"
directory

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../improve_kernel_cve_report-base.bbclass    | 149 ++++++++++++++++++
 ...improve_kernel_cve_report-spdx-2.2.bbclass |   4 +
 .../improve_kernel_cve_report-spdx.bbclass    |   4 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-base.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx.bbclass

diff --git a/meta/classes/improve_kernel_cve_report-base.bbclass b/meta/classes/improve_kernel_cve_report-base.bbclass
new file mode 100644
index 0000000000..9d3be08203
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-base.bbclass
@@ -0,0 +1,149 @@
+# Settings for the vulns git repository configuration
+IMPROVE_KERNEL_CVE_SRC_URI ?= "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https"
+IMPROVE_KERNEL_CVE_SRCREV ?= "${@bb.fetch2.get_autorev(d)}"
+IMPROVE_KERNEL_CVE_NETWORK ?= "1"
+IMPROVE_KERNEL_CVE_WORKDIR ?= "${WORKDIR}/vulns"
+IMPROVE_KERNEL_CVE_DESTSUFFIX ?= "git"
+IMPROVE_KERNEL_CVE_UNPACK_DIR ?= "${IMPROVE_KERNEL_CVE_WORKDIR}/${IMPROVE_KERNEL_CVE_DESTSUFFIX}"
+
+# Settings for SPDX support
+IMPROVE_KERNEL_PREFERRED_PROVIDER ?= ""
+IMPROVE_KERNEL_SPDX_FILE ?= ""
+
+python __anonymous() {
+    srcrev = d.getVar("IMPROVE_KERNEL_CVE_SRCREV", True) or ""
+    network = d.getVar("IMPROVE_KERNEL_CVE_NETWORK", True) or "0"
+    # Check the IMPROVE_KERNEL_SPDX_FILE variable was set
+    if not d.getVar("IMPROVE_KERNEL_SPDX_FILE"):
+        bb.fatal("improve_kernel_cve: IMPROVE_KERNEL_SPDX_FILE is not set. Need to inherit improve_kernel_cve_report-spdx-2.2 or improve_kernel_cve_report-spdx")
+        return
+    # Check if networking is enabled to set SRC_URI
+    if network == "0":
+        d.appendVar("SRC_URI", " ${IMPROVE_KERNEL_CVE_SRC_URI};name=improve-kernel-cve;destsuffix=${IMPROVE_KERNEL_CVE_DESTSUFFIX}")
+    # Check offline mode with AUTOREV-like SRCREV
+    if network == "0" and srcrev.strip() in ("${AUTOREV}", "AUTOINC", "INVALID"):
+        bb.fatal("improve_kernel_cve: Offline mode but SRCREV is set to AUTOREV/AUTOINC/INVALID. Cannot proceed without network access or use a fixed SRCREV.")
+    d.setVar("SRCREV_improve-kernel-cve", d.getVar("IMPROVE_KERNEL_CVE_SRCREV"))
+    # Check which SPDX class is inherited
+    inherits = (d.getVar("INHERIT") or "")
+    if "create-spdx-2.2" in inherits:
+        bb.build.addtask("do_scout_extra_kernel_vulns", "do_build", "do_rootfs", d)
+    elif "create-spdx" in inherits:
+        bb.build.addtask('do_scout_extra_kernel_vulns', 'do_build', 'do_create_image_sbom_spdx', d)
+}
+
+python do_clean:append() {
+    import os, glob
+    deploy_dir = d.expand('${DEPLOY_DIR_IMAGE}')
+    for f in glob.glob(os.path.join(deploy_dir, '*scouted.json')):
+        bb.note("Removing " + f)
+        os.remove(f)
+}
+
+python do_clone_kernel_cve() {
+    import subprocess
+    import shutil, os
+    # Check if the system is using SPDX 3.0
+    inherit_var = d.getVar("INHERIT")
+    preferred_provider = d.getVar("IMPROVE_KERNEL_PREFERRED_PROVIDER")
+    if preferred_provider not in inherit_var:
+        bb.warn(f"improve_kernel_cve: Requires the class {preferred_provider} enable in INHERIT variable.")
+        return
+    network_allowed = d.getVar("IMPROVE_KERNEL_CVE_NETWORK") == "1"
+    workdir = d.getVar("IMPROVE_KERNEL_CVE_WORKDIR")
+    unpack_dir = d.getVar("IMPROVE_KERNEL_CVE_UNPACK_DIR")
+    # Remove existing unpacked directory if any
+    if os.path.exists(workdir):
+        shutil.rmtree(workdir)
+    # Prepare fetcher
+    src_uri_list = (d.getVar('SRC_URI') or "").split()
+    cve_uris = []
+    for uri in src_uri_list:
+        if "name=improve-kernel-cve" in uri:
+            cve_uris.append(uri)
+    if not cve_uris:
+        bb.note("No CVE exclusions SRC_URI found, skipping fetch")
+        return
+    fetcher = bb.fetch2.Fetch(cve_uris, d)
+    # Clone only if network is allowed
+    if network_allowed:
+        fetcher.download()
+    else:
+        # Offline mode without network access
+        bb.note("IMPROVE_KERNEL_CVE_NETWORK=0: Skipping online fetch. Checking local downloads in DL_DIR...")
+        have_sources = False
+        dl_dir = d.getVar("DL_DIR")
+        srcrev = d.getVar("SRCREV_improve-kernel-cve")
+        bb.note(f"Checking for sources for SRCREV: {srcrev}")
+        # Check SRCREV is NOT set to AUTOREV
+        if srcrev.strip() in ("${AUTOREV}", "AUTOINC", "INVALID"):
+            bb.fatal("improve-kernel-cve: Offline mode but SRCREV is set to AUTOREV/AUTOINC/INVALID. Cannot proceed without network access or use a fixed SRCREV.")
+            return
+        # Loop through the fetcher's expanded URL data
+        for ud in fetcher.expanded_urldata():
+            ud.setup_localpath(d)
+            # Check mirror tarballs first
+            for mirror_fname in ud.mirrortarballs:
+                mirror_path = os.path.join(dl_dir, mirror_fname)
+                if os.path.exists(mirror_path):
+                    bb.note(f"Found mirror tarball: {mirror_path}")
+                    have_sources = True
+                    break
+            # If no mirror, check original download path
+            if not have_sources and ud.localpath and os.path.exists(ud.localpath):
+                bb.note(f"Found local download: {ud.localpath}")
+                have_sources = True
+            if not have_sources:
+                bb.fatal("improve-kernel-cve: Offline mode but required source is missing.\n"f"SRC_URI = {ud.url}")
+                return
+    # Unpack into the standard work directory
+    fetcher.unpack(unpack_dir)
+    # Remove the folder ${PN} set by unpack
+    subdirs = [d for d in os.listdir(unpack_dir) if os.path.isdir(os.path.join(unpack_dir, d))]
+    if len(subdirs) == 1:
+        srcdir = os.path.join(unpack_dir, subdirs[0])
+        for f in os.listdir(srcdir):
+            shutil.move(os.path.join(srcdir, f), unpack_dir)
+        shutil.rmtree(srcdir)
+}
+do_clone_kernel_cve[network] = "${IMPROVE_KERNEL_CVE_NETWORK}"
+do_clone_kernel_cve[nostamp] = "1"
+do_clone_kernel_cve[doc] = "Clone the latest kernel vulnerabilities from https://git.kernel.org/pub/scm/linux/security/vulns.git"
+addtask clone_kernel_cve after do_fetch before do_scout_extra_kernel_vulns
+
+do_scout_extra_kernel_vulns() {
+    new_cve_report_file="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json"
+    improve_kernel_cve_script="${COREBASE}/scripts/contrib/improve_kernel_cve_report.py"
+
+    # Check that IMPROVE_KERNEL_SPDX_FILE is set and the file exists
+    if [ -z "${IMPROVE_KERNEL_SPDX_FILE}" ] || [ ! -f "${IMPROVE_KERNEL_SPDX_FILE}" ]; then
+        bbwarn "improve_kernel_cve: IMPROVE_KERNEL_SPDX_FILE is empty or file not found: ${IMPROVE_KERNEL_SPDX_FILE}"
+        return 0
+    fi
+    if [ ! -f "${CVE_CHECK_MANIFEST_JSON}" ]; then
+        bbwarn "improve_kernel_cve: CVE_CHECK file not found: ${CVE_CHECK_MANIFEST_JSON}. Skipping extra kernel vulnerabilities scouting."
+        return 0
+    fi
+    if [ ! -f "${improve_kernel_cve_script}" ]; then
+        bbwarn "improve_kernel_cve: improve_kernel_cve_report.py not found in ${COREBASE}."
+        return 0
+    fi
+    if [ ! -d "${IMPROVE_KERNEL_CVE_WORKDIR}" ]; then
+        bbwarn "improve_kernel_cve: Vulnerabilities data not found in ${IMPROVE_KERNEL_CVE_WORKDIR}."
+        return 0
+    fi
+
+    #Run the improve_kernel_cve_report.py script
+    bbplain "improve_kernel_cve: Using SPDX file for extra kernel vulnerabilities scouting: ${IMPROVE_KERNEL_SPDX_FILE}"
+    python3 "${improve_kernel_cve_script}" \
+        --spdx "${IMPROVE_KERNEL_SPDX_FILE}" \
+        --old-cve-report "${CVE_CHECK_MANIFEST_JSON}" \
+        --new-cve-report "${new_cve_report_file}" \
+        --datadir "${IMPROVE_KERNEL_CVE_WORKDIR}"
+    bbplain "Improve CVE report with extra kernel cves: ${new_cve_report_file}"
+
+    #Create a symlink as every other JSON file in tmp/deploy/images
+    ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}.scouted.json
+}
+do_scout_extra_kernel_vulns[nostamp] = "1"
+do_scout_extra_kernel_vulns[doc] = "Scout extra kernel vulnerabilities and create a new enhanced version of the cve_check file in the deploy directory"
\ No newline at end of file
diff --git a/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass b/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
new file mode 100644
index 0000000000..45b483134d
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
@@ -0,0 +1,4 @@
+IMPROVE_KERNEL_PREFERRED_PROVIDER = "create-spdx-2.2"
+IMPROVE_KERNEL_SPDX_FILE = "${DEPLOY_DIR}/spdx/2.2/${@d.getVar('MACHINE').replace('-', '_')}/recipes/recipe-${PREFERRED_PROVIDER_virtual/kernel}.spdx.json"
+
+inherit improve_kernel_cve_report-base
\ No newline at end of file
diff --git a/meta/classes/improve_kernel_cve_report-spdx.bbclass b/meta/classes/improve_kernel_cve_report-spdx.bbclass
new file mode 100644
index 0000000000..3849f66aaf
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-spdx.bbclass
@@ -0,0 +1,4 @@
+IMPROVE_KERNEL_PREFERRED_PROVIDER = "create-spdx"
+IMPROVE_KERNEL_SPDX_FILE = "${SPDXIMAGEDEPLOYDIR}/${IMAGE_LINK_NAME}.spdx.json"
+
+inherit improve_kernel_cve_report-base
\ No newline at end of file

