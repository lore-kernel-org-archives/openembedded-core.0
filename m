Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF42BD4661A
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:12:07 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2692.1768504323924445475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtKWHT/F;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c536b26d6dso25132885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504323; x=1769109123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpYkTMfA2OslrFG9/X7EeskZxp9N+HDBUuSbAv2YFjM=;
        b=JtKWHT/Fx9DKktod1ViuMARUMC13Wss5hfco0D8qNCj2uVSNjETykk4UDjVSwULYRg
         q5PGT6WfsfnH8ppSWXRO/+R4394O6pZfpohl5whgoQNH5nTx89SuQq4qOQW/vmOzT2+6
         NP72vxDFXryvnOA8YKprcuL2QU/YHZuyY3qJ1k1ewF3tq/JtBAZ6KtylMPq2bt+wdCKw
         tpzIXkUq4kxW8STepwlx3SCJ0Z1r84fUXymTY+q5uFXiZsSben9YRs847O1ujz0+Fmnc
         4xmsyq52W2wF9OzWHxt0tulL7+lieOzEoF4e0ypb3yC7GlcnUevTqU4hOdYi68iqXN6V
         vjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504323; x=1769109123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XpYkTMfA2OslrFG9/X7EeskZxp9N+HDBUuSbAv2YFjM=;
        b=M+Dz8xwK0jjmG5ICc9wyQ27ZC5PtGLO5fCUasQE5LJOGvEHxsIaErQXeWpi58jg6W9
         SlwYlLEp0tLumJ1rjaltbg1fOCbHI4gGNz72EtrE87n3PhWS2tLBE/TjbsX2b9SkCD4x
         3if7zbMi6YxuyhyBnuVtAq4w3Hq2LXnJDrXXGVSljQ7Hf2F7uaeiVLJFHODj80fYTNmW
         LCk6Lkx5V+aLt83VjddWmxB6UQUwdHUoENps5+8ulIB5GpzZ10OQjcGEeNzH9cz3CPly
         d6IbJpGlJlpeL9Ujq9UkwLygpM8FrQiNsZ6LYL5AgtJ3VEN5tgkYZR5/K+npjFlspAnI
         VcbQ==
X-Gm-Message-State: AOJu0YzvrEPML99262yadDzgIKk4zyk3faQNzT6V41tlDnczqcPMd82G
	A0Fe8S7PnvO8eMVRAw70qOsxYqIzPBQZM6pXv5qDbfBFaVuCV5I7YUwxJvMIdjQNwm5CGg==
X-Gm-Gg: AY/fxX6H6Tfj3udpGVK6hxNJ9vmVb+2exc502NhdyMV1i+9fSd/TgCBOglg7x5Kdjqq
	GhfIGkZMf4yKiU1+8hNikf/LHQLL4n7LI7X3Cr0tSUhxwvnDOIn6uqiPvDpTd3O3pMnp2FvwjhW
	30IVstWNdvKzJfSyTBaLS9TRqsuIf77zfROkgdV/c8pyjrzfAfvMzz97mQzADWXoIRWKNIbjm3H
	O4WXkn/RPixlKRm0/yCa74KV1dOIt0EaXo/4T8XFuErjd5y+8vLrml9kKGxDpyP0ritlZObEyp1
	mDi2lvOP5+cyUa5N6NYbtFXubk4jvtrdnNVvQHOpC11PfcqzuwoFSlVM7bIRY9KGLnIhBNVgAIv
	zY47W27QLBV1K5cay1ua8+9Cdmo3+VJt6QbyMRPjOZOXuxhlLSvqcv7aQksl0WHDmXLuG9kT/1b
	3chVk6wSIMSJqElxbqae5aRLCuNEVlui7dbI3RF7WhzpTHh54F6j5AoYc=
X-Received: by 2002:a05:620a:298f:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c6a67b1298mr55015485a.9.1768504322798;
        Thu, 15 Jan 2026 11:12:02 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ad820sm19228085a.10.2026.01.15.11.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:12:02 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v3 1/1] improve_kerne_cve_report: Add a bbclass support
Date: Thu, 15 Jan 2026 14:11:59 -0500
Message-ID: <20260115191159.2278346-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115191159.2278346-1-valentin.boudevin@gmail.com>
References: <20260115191159.2278346-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229435

The script improve_kernel_cve_report.py doesn't have a bbclass.
It can be usefull to have one to generate improved cve-check files at
every run.

This two new class can be used to generate a new file in
tmp/deploy/images with a .scouted.json in addition to the existing .json
cve-check file.

The new .scouted.json is based on the cve-check file and the SBOM to
generate this improved cve-check file with extra entries found by the
script improve_kernel_cve_report.py.

It only requires an inherit on an image recipe (e.g. on
core-image-minimal).

The bbclass "improve_kernel_cve_report-spdx-2.2.bbclass" can be used in
"create-spdx-2.2" is configured in INHERIT for SPDX2.2 projects.

The bbclass "improve_kernel_cve_report-spdx.bbclass" contains the
default behaviour for SPDX 3.0 projects.

It can be add to core-image-minimal in a second step if revelant.

It also works offline and/or with custom repos thanks to the variables:
IMPROVE_KERNEL_CVE_SRC_URI, IMPROVE_KERNEL_CVE_SRCREV, and
IMPROVE_KERNEL_CVE_NETWORK.

Without the network, the DL_DIR folder will be used as a reference to
use stored version of the source repo.

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 ...improve_kernel_cve_report-spdx-2.2.bbclass | 116 ++++++++++++++++++
 .../improve_kernel_cve_report-spdx.bbclass    | 116 ++++++++++++++++++
 2 files changed, 232 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx.bbclass

diff --git a/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass b/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
new file mode 100644
index 0000000000..42404c0ccc
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
@@ -0,0 +1,116 @@
+IMPROVE_KERNEL_CVE_SRC_URI ?= "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https"
+IMPROVE_KERNEL_CVE_SRCREV ?= "${@bb.fetch2.get_autorev(d)}"
+IMPROVE_KERNEL_CVE_NETWORK ?= "1"
+
+SRC_URI:append = " ${IMPROVE_KERNEL_CVE_SRC_URI};name=improve-kernel-cve"
+SRCREV_improve-kernel-cve = "${IMPROVE_KERNEL_CVE_SRCREV}"
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
+    check_spdx = d.getVar("INHERIT")
+    network_allowed = d.getVar("IMPROVE_KERNEL_CVE_NETWORK") == "1"
+    rootdir = os.path.join(d.getVar("WORKDIR"), "vulns")
+    # Check if the system is using SPDX 2.2
+    if "create-spdx-2.2" not in check_spdx:
+        bb.warn(f"improve_kernel_cve_report-spdx-2.2: Requires SPDX 2.2 enable.")
+        return
+    # Remove existing unpacked directory if any
+    if os.path.exists(rootdir):
+        shutil.rmtree(rootdir)
+    # Prepare fetcher
+    src_uri_list = (d.getVar('SRC_URI') or "").split()
+    fetcher = bb.fetch2.Fetch(src_uri_list, d)
+    # Clone only if network is allowed
+    if network_allowed:
+        fetcher.download()
+    else:
+        # Offline mode without network access
+        bb.note("IMPROVE_KERNEL_CVE_NETWORK=0: Skipping online fetch. Checking local downloads in DL_DIR...")
+        have_sources = False
+        dl_dir = d.getVar("DL_DIR")
+        srcrev = d.getVar("SRCREV")
+        # Check SRCREV is NOT set to AUTOREV
+        if srcrev.strip() in ("${AUTOREV}", "AUTOINC"):
+            bb.warn("Offline mode but SRCREV is set to AUTOREV/AUTOINC. Cannot proceed without network access.")
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
+                bb.warn("Offline mode but required source is missing.\n"f"SRC_URI = {ud.url}")
+                return
+    # Unpack into the standard work directory
+    fetcher.unpack(rootdir)
+    # Remove the folder ${PN} set by unpack
+    subdirs = [d for d in os.listdir(rootdir) if os.path.isdir(os.path.join(rootdir, d))]
+    if len(subdirs) == 1:
+        srcdir = os.path.join(rootdir, subdirs[0])
+        for f in os.listdir(srcdir):
+            shutil.move(os.path.join(srcdir, f), rootdir)
+        shutil.rmtree(srcdir)
+    bb.note("Vulnerabilities repo unpacked into: %s" % rootdir)
+}
+do_clone_kernel_cve[network] = "${IMPROVE_KERNEL_CVE_NETWORK}"
+do_clone_kernel_cve[nostamp] = "1"
+do_clone_kernel_cve[doc] = "Clone the latest kernel vulnerabilities from https://git.kernel.org/pub/scm/linux/security/vulns.git"
+addtask clone_kernel_cve after do_fetch before do_scout_extra_kernel_vulns
+
+do_scout_extra_kernel_vulns() {
+    original_cve_check_file="${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.json"
+    new_cve_report_file="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json"
+    improve_kernel_cve_script="${COREBASE}/scripts/contrib/improve_kernel_cve_report.py"
+    spdx_file="${DEPLOY_DIR}/spdx/2.2/${@d.getVar('MACHINE').replace('-', '_')}/recipes/recipe-${PREFERRED_PROVIDER_virtual/kernel}.spdx.json"
+
+    #Check that all required files are present
+    if [ ! -f "${spdx_file}" ]; then
+        bbwarn "improve_kernel_cve_report-spdx-2.2: No SPDX 2.2 file found in ${spdx_file}."
+        return 0
+    fi
+    if [ ! -f "${original_cve_check_file}" ]; then
+        bbwarn "improve_kernel_cve_report-spdx-2.2: CVE_CHECK file not found: ${original_cve_check_file}. Skipping extra kernel vulnerabilities scouting."
+        return 0
+    fi
+    if [ ! -f "${improve_kernel_cve_script}" ]; then
+        bbwarn "improve_kernel_cve_report-spdx-2.2: improve_kernel_cve_report.py not found in ${COREBASE}."
+        return 0
+    fi
+    if [ ! -d "${WORKDIR}/vulns" ]; then
+        bbwarn "improve_kernel_cve_report-spdx-2.2: Vulnerabilities data not found in ${WORKDIR}/vulns."
+        return 0
+    fi
+
+    #Run the improve_kernel_cve_report.py script
+    bbplain "improve_kernel_cve_report-spdx-2.2: Using SPDX file for extra kernel vulnerabilities scouting: ${spdx_file}"
+    python3 "${improve_kernel_cve_script}" \
+        --spdx "${spdx_file}" \
+        --old-cve-report "${original_cve_check_file}" \
+        --new-cve-report "${new_cve_report_file}" \
+        --datadir "${WORKDIR}/vulns"
+    bbplain "Improve CVE report with extra kernel cves: ${new_cve_report_file}"
+
+    #Create a symlink as every other JSON file in tmp/deploy/images
+    ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}.scouted.json
+}
+do_scout_extra_kernel_vulns[nostamp] = "1"
+do_scout_extra_kernel_vulns[doc] = "Scout extra kernel vulnerabilities and create a new enhanced version of the cve_check file in the deploy directory"
+addtask scout_extra_kernel_vulns after do_image_complete do_rootfs before do_build
\ No newline at end of file
diff --git a/meta/classes/improve_kernel_cve_report-spdx.bbclass b/meta/classes/improve_kernel_cve_report-spdx.bbclass
new file mode 100644
index 0000000000..44b79f23cf
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-spdx.bbclass
@@ -0,0 +1,116 @@
+IMPROVE_KERNEL_CVE_SRC_URI ?= "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https"
+IMPROVE_KERNEL_CVE_SRCREV ?= "${@bb.fetch2.get_autorev(d)}"
+IMPROVE_KERNEL_CVE_NETWORK ?= "1"
+
+SRC_URI:append = " ${IMPROVE_KERNEL_CVE_SRC_URI};name=improve-kernel-cve"
+SRCREV_improve-kernel-cve = "${IMPROVE_KERNEL_CVE_SRCREV}"
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
+    check_spdx = d.getVar("INHERIT")
+    network_allowed = d.getVar("IMPROVE_KERNEL_CVE_NETWORK") == "1"
+    rootdir = os.path.join(d.getVar("WORKDIR"), "vulns")
+    # Check if the system is using SPDX 3.0
+    if "create-spdx" not in check_spdx:
+        bb.warn(f"improve_kernel_cve_report-spdx: Requires SPDX 3.0 enable.")
+        return
+    # Remove existing unpacked directory if any
+    if os.path.exists(rootdir):
+        shutil.rmtree(rootdir)
+    # Prepare fetcher
+    src_uri_list = (d.getVar('SRC_URI') or "").split()
+    fetcher = bb.fetch2.Fetch(src_uri_list, d)
+    # Clone only if network is allowed
+    if network_allowed:
+        fetcher.download()
+    else:
+        # Offline mode without network access
+        bb.note("IMPROVE_KERNEL_CVE_NETWORK=0: Skipping online fetch. Checking local downloads in DL_DIR...")
+        have_sources = False
+        dl_dir = d.getVar("DL_DIR")
+        srcrev = d.getVar("SRCREV")
+        # Check SRCREV is NOT set to AUTOREV
+        if srcrev.strip() in ("${AUTOREV}", "AUTOINC"):
+            bb.warn("Offline mode but SRCREV is set to AUTOREV/AUTOINC. Cannot proceed without network access.")
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
+                bb.warn("Offline mode but required source is missing.\n"f"SRC_URI = {ud.url}")
+                return
+    # Unpack into the standard work directory
+    fetcher.unpack(rootdir)
+    # Remove the folder ${PN} set by unpack
+    subdirs = [d for d in os.listdir(rootdir) if os.path.isdir(os.path.join(rootdir, d))]
+    if len(subdirs) == 1:
+        srcdir = os.path.join(rootdir, subdirs[0])
+        for f in os.listdir(srcdir):
+            shutil.move(os.path.join(srcdir, f), rootdir)
+        shutil.rmtree(srcdir)
+    bb.note("Vulnerabilities repo unpacked into: %s" % rootdir)
+}
+do_clone_kernel_cve[network] = "${IMPROVE_KERNEL_CVE_NETWORK}"
+do_clone_kernel_cve[nostamp] = "1"
+do_clone_kernel_cve[doc] = "Clone the latest kernel vulnerabilities from https://git.kernel.org/pub/scm/linux/security/vulns.git"
+addtask clone_kernel_cve after do_fetch before do_scout_extra_kernel_vulns
+
+do_scout_extra_kernel_vulns() {
+    original_cve_check_file="${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.json"
+    new_cve_report_file="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json"
+    improve_kernel_cve_script="${COREBASE}/scripts/contrib/improve_kernel_cve_report.py"
+    spdx_file="${SPDXIMAGEDEPLOYDIR}/${IMAGE_LINK_NAME}.spdx.json"
+
+    #Check that all required files are present
+    if [ ! -f "${spdx_file}" ]; then
+        bbwarn "improve_kernel_cve_report-spdx: No SPDX3.0 file found in ${spdx_file}."
+        return 0
+    fi
+    if [ ! -f "${original_cve_check_file}" ]; then
+        bbwarn "improve_kernel_cve_report-spdx: CVE_CHECK file not found: ${original_cve_check_file}. Skipping extra kernel vulnerabilities scouting."
+        return 0
+    fi
+    if [ ! -f "${improve_kernel_cve_script}" ]; then
+        bbwarn "improve_kernel_cve_report-spdx: improve_kernel_cve_report.py not found in ${COREBASE}."
+        return 0
+    fi
+    if [ ! -d "${WORKDIR}/vulns" ]; then
+        bbwarn "improve_kernel_cve_report-spdx: Vulnerabilities data not found in ${WORKDIR}/vulns."
+        return 0
+    fi
+
+    #Run the improve_kernel_cve_report.py script
+    bbplain "improve_kernel_cve_report-spdx: Using SPDX file for extra kernel vulnerabilities scouting: ${spdx_file}"
+    python3 "${improve_kernel_cve_script}" \
+        --spdx "${spdx_file}" \
+        --old-cve-report "${original_cve_check_file}" \
+        --new-cve-report "${new_cve_report_file}" \
+        --datadir "${WORKDIR}/vulns"
+    bbplain "Improve CVE report with extra kernel cves: ${new_cve_report_file}"
+
+    #Create a symlink as every other JSON file in tmp/deploy/images
+    ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}.scouted.json
+}
+do_scout_extra_kernel_vulns[nostamp] = "1"
+do_scout_extra_kernel_vulns[doc] = "Scout extra kernel vulnerabilities and create a new enhanced version of the cve_check file in the deploy directory"
+addtask scout_extra_kernel_vulns after do_create_image_sbom_spdx before do_build
\ No newline at end of file

