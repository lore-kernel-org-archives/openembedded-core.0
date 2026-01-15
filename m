Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68155D44C6B
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 15:34:24 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38646.1768491260752857464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 07:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZE/d5TIG;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c52c948d45so18550385a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 07:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768491260; x=1769096060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQHjixwCRG0Ci7tOgQBah1p1SAg0Zi/mYaw0iWy4Mwo=;
        b=ZE/d5TIGOou3UK8Z15rjC37/ugNVy9YbmjZVW9whCeT8zjxf61QkQ774ZUHcJplLdI
         gVVPmncKhvMP53viMR7tUUdE8rlKsMoApyAryObs4S+0mGd/lKzicWzX4Hyo7GYh0orA
         BCzgzwXKEWqdr31AkTQt9YYiCVj5bLx29bfxnXsCGVwmrFY+K+fmJTZ0AgzO/b269qKC
         TNb2FapNrmYPKS20X9SdVBhamKHuvB8Ih2PjTDYDjGcfGTRRcQJYvJHMPl75eEqlSwng
         RH3RFJf2/B/EGLmcRfF0+N5Y5YVvtxAvWcA+0n218H+P44EQFM0ITtGFt4oCwi29Ug9v
         Cq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768491260; x=1769096060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQHjixwCRG0Ci7tOgQBah1p1SAg0Zi/mYaw0iWy4Mwo=;
        b=lC2bdRlMu1yAlBGhSc/96Jb8y/vwQ8j8DRadgLL40HWk8YunUR2W27SrfyKZWErE1f
         ATHNAE3pi8Xm623KHpsxWiPxxHQ8RiRquN7bvPlkva7nl/i656DacHPgPR3zShwpcpET
         UHfoFR/Nh19Tj9qokKnNIZ7dEPPzosS9lbW9EB8Xyg5ByoiAYiGP9psbMvQXf+7+oFx1
         glpCTR/zE2PgDX5Hwjxraac9TJxSmgQXD0kpykvlZFMZVar2Uh3TscslSPsSEIMPxNO9
         jAYWX+WtM3KvtWUW9ShU0EG/oh80oI49SbzYz0ycyP9FZpTOFOTEh/O5a+gqaLhqypkq
         h8lQ==
X-Gm-Message-State: AOJu0Yx6CjBEZKGtkDhVg0MLLvj18d+RHVQTkSwnmk0G3Hp14OnLSzAH
	tSr7hNV+X6bh07CMPOappMX6DbvolNvTcW+E/cQl2lIJ5VR3Mqm5IvsEFhwhXPL43MPy1g==
X-Gm-Gg: AY/fxX7/3JtLApFpSruFl+oPl6f4iQh+50CAKZhTS+g1UQXqI1W1bXKAgdMh0fxCwOb
	bl4yzYhYcvDbifO6NqSopgtt4bXBloKCH8mJrlpBZMReN9U5yr7T6o6AGTmh3ZfCrofTpkhJjkg
	VQo1tLgk/lqu6ELw60WKzWlcr3K4B2rEAHKdErAPBqRFbZUuKxGyBvUyI49uUfyOy5c03Xxpj3x
	rhmZZ5moS7dYyWxOdRR1L4g05qb1tUe/kWfXI/dO6y93V/mGcSUA2n6Gy0PGsEuUwP0/F4K7v8e
	ntaTUrEDJA/aALUsPnZxqPkYhM+8fRC98Z+nPtvhn8WH19LSCi6Z0VWxwkhDu11EvGoJyYyCpOU
	HOxExk8+wVhutEUuW7eRhTSIUzp+3qP/e4DfUTcCgYUh12fRWqbjt5oQSnAQPt3moWpffjt8sJE
	nQhVvRzDEkLDu0NFVSxeezqD+wjLP2eJE4ztguKm2DmfgWHkOsZOZZoCY=
X-Received: by 2002:a05:6214:4782:b0:890:7e6e:df23 with SMTP id 6a1803df08f44-89274217928mr57606546d6.0.1768491258386;
        Thu, 15 Jan 2026 07:34:18 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772346f8sm204173136d6.35.2026.01.15.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:34:18 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v2 1/1] improve_kerne_cve_report: Add a bbclass support
Date: Thu, 15 Jan 2026 10:34:11 -0500
Message-ID: <20260115153412.1454732-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115153412.1454732-1-valentin.boudevin@gmail.com>
References: <20260115153412.1454732-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 15:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229420

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
 ...improve_kernel_cve_report-spdx-2.2.bbclass | 117 ++++++++++++++++++
 .../improve_kernel_cve_report-spdx.bbclass    | 117 ++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx.bbclass

diff --git a/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass b/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
new file mode 100644
index 0000000000..b22941fb32
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
@@ -0,0 +1,117 @@
+IMPROVE_KERNEL_CVE_SRC_URI ?= "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https"
+IMPROVE_KERNEL_CVE_SRCREV ?= "${@bb.fetch2.get_autorev(d)}"
+IMPROVE_KERNEL_CVE_NETWORK ?= "1"
+
+SRC_URI:append = "${IMPROVE_KERNEL_CVE_SRC_URI};name=improve-kernel-cve"
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
+    debug_source_path = d.getVar("IMPROVE_KERNEL_DEBUG_SOURCES_PATH")
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
index 0000000000..6b68db044e
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-spdx.bbclass
@@ -0,0 +1,117 @@
+IMPROVE_KERNEL_CVE_SRC_URI ?= "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https"
+IMPROVE_KERNEL_CVE_SRCREV ?= "${@bb.fetch2.get_autorev(d)}"
+IMPROVE_KERNEL_CVE_NETWORK ?= "1"
+
+SRC_URI:append = "${IMPROVE_KERNEL_CVE_SRC_URI};name=improve-kernel-cve"
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
+    debug_source_path = d.getVar("IMPROVE_KERNEL_DEBUG_SOURCES_PATH")
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

