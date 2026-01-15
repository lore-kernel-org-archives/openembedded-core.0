Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF49BD46616
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:03:47 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2516.1768503817700286042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MrWOrwOz;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c52c670401so17607885a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503817; x=1769108617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rloV7sh7pHwmiy1slhgkhgMg5d4boS9+0ypHCZYSD/M=;
        b=MrWOrwOzp5k/AR8iST8uUx3bT7Guqekjzj7X2GPtVEBwRZd2PqehuleZePMolHsW1T
         bUGfshjJxueO5d6qQXR0LPBUsDx4uj1T/tZdue96tBv0qZ7kpHWuYK/CY5XOEeI4h7YA
         cvq/gMWC6O2M4daRdNVnPjAQkYTu5vF6/UsAnDoAISmMrRT1yd+4TKTyFIa+JQNouw0/
         YkZ8qbotk8fLnRtLKvpJc4o/VEoqtgAM2A8wZ4uXdjL7cePcIFwAyn4AamhWlomM4Zmd
         B0Jqpk+nxiV04qLiuqfhSBZ33NH2pnkjMWq39ArunV7Iil6fBEbCS3jJaiwAMbrA1P1J
         8BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503817; x=1769108617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rloV7sh7pHwmiy1slhgkhgMg5d4boS9+0ypHCZYSD/M=;
        b=CHxfTdYLt7SRB8Rey9NAbNrkW1knEBCInrFvE+zWDQ+PLRRxcVXbzJ62gvKKdpouyd
         AfRyjZ8nY4FpCNTlfE/1rx+OKhkvco8jVRHowal6gaMbb3NRv1PNDCsgxvw8/WQEecM7
         Uobe+O7TNPFXUItDU5Qi7JGN0CNGhXLdYY/T+03xi168QdQ01h9hNQT76EBN/rLS8efe
         WWJskwVTKICrAM6EnVQWEBtgwiRFPP1WNWAtCnXrHLyJ9OboYOSbSTHvLbiqY+tIQGGJ
         bVfbXcco8HW+kqxZBq1a+eSsYwElMsAMVW4MPmt4hSoLT2RzRNAaeS76hUo8RNE/DeCb
         DDJg==
X-Gm-Message-State: AOJu0YxhjMJdnXcN/zlby5/46MMkuoBO/ZB5THkDyzC9orpVTxNYR9DV
	bknLn4+nmCXe4F4jLFHR87ayFQDI14HAF/5/MJAf/obSJoi4X3Gt6Xdv+y00xMOOMvlcIw==
X-Gm-Gg: AY/fxX7ZfB4pO7yzih/3a6R7T2e9dr3cGmoI7Leo18PYjpnx/LRvE9HrL3NXrr7oy1H
	ZTMtolJ8M9s7G7PPG5yT1Uy8PKflOJRAXdzACm224FBcHVZD6CzQNnLRG6O2yD6ILjFRg/HpSED
	wva2Ks1SuyHDXz9CZDRof7gcqs/0E59DixSeGtFFx0erhnrQnFn6qifSMyuQ8VjHy6UpME6bJUL
	DJmID9zPfn2+UauXDqZljaxVGYZ7asN2FVLBBSq2qDE6htn5Fa15E0vdsJMrPBgBjnd6pCecTPT
	hTgkOSC2UUQb82rEJvgDbfZfNzCVEWeqQRa3Vwh+sjmpLiDtt4BZ4bwCGRa2MWXlv7uFkHn+clo
	BzI7OZG5M2VmGMe6miXCtTgc3gTijH2Rhsj3n2OhbAQDncI6r/+vSHvNF/K0U0Rtj/Iz6S3vR6g
	dlHuABp2PbSYvjWbBxcNpApKqvXpUhHt8W9wQASMXN5TYjV5lAOzVdJbY=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr59966485a.5.1768503816142;
        Thu, 15 Jan 2026 11:03:36 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c06e5sm17016385a.16.2026.01.15.11.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:03:35 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v4 2/4] generate-cve-exclusions: Add a .bbclass
Date: Thu, 15 Jan 2026 14:03:28 -0500
Message-ID: <20260115190331.2276779-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
References: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229429

Add a .bbclass to generate-cve-exclusions to use this script at every
run.

Two steps for testing:
1) Inherit this class in the kernel recipe with "inherit
   generate-cve-exclusions.bbclass"
2) Use the following command to generate a cvelistV5 entry with a JSON
   file in in ${WORKDIR}/cvelistV5/ :
   "bitbake linux-yocto -c generate-cve-exclusions"

The JSON file can then be parsed in the following run by cve-check.

This class contains several methods:

*do_clone_cvelistV5: Clone the cvelistV5 repo in
${WORKDIR}/cvelistV5/git

(e.g. bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/
linux-yocto/6.18.1+git/cvelistV5/git)

*do_generate_cve_exclusions: Use the script generate-cve-exclusions.py.
It uses the new "--output-json" argument to generate a JSON file as an
output stored in ${WORKDIR}/cvelistV5//cve-exclusion_${LINUX_VERSION}.json

*do_cve_check:prepend: Parse the previously generated JSON file to set
the variable CVE_STATUS corretly

The class also provides some variables:
*GENERATE_CVE_EXCLUSIONS_SRC_URI and GENERATE_CVE_EXCLUSIONS_SRCREV can
be used to change the source repository or fix a commit with SRCREV
(usefull for deterministic testing)
*GENERATE_CVE_EXCLUSIONS_NETWORK can be set to 0 to provide an offline
mode based on DL_DIR directory.
*GENERATE_CVE_EXCLUSIONS_WORKDIR path used as a working directory for
this class

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 meta/classes/generate-cve-exclusions.bbclass | 97 ++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta/classes/generate-cve-exclusions.bbclass

diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/generate-cve-exclusions.bbclass
new file mode 100644
index 0000000000..163f23ecee
--- /dev/null
+++ b/meta/classes/generate-cve-exclusions.bbclass
@@ -0,0 +1,97 @@
+GENERATE_CVE_EXCLUSIONS_SRC_URI ?= "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix=git"
+GENERATE_CVE_EXCLUSIONS_SRCREV ?= "${@bb.fetch2.get_autorev(d)}"
+GENERATE_CVE_EXCLUSIONS_NETWORK ?= "1"
+GENERATE_CVE_EXCLUSIONS_WORKDIR ?= "${WORKDIR}/cvelistV5"
+
+SRC_URI:append = " ${GENERATE_CVE_EXCLUSIONS_SRC_URI};name=generate-cve-exclusions"
+SRCREV_generate-cve-exclusions = "${GENERATE_CVE_EXCLUSIONS_SRCREV}"
+
+python do_clone_cvelistV5() {
+    import subprocess
+    import shutil, os
+    network_allowed = d.getVar("GENERATE_CVE_EXCLUSIONS_NETWORK") == "1"
+    rootdir = d.getVar("GENERATE_CVE_EXCLUSIONS_WORKDIR")
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
+        bb.note("GENERATE_CVE_EXCLUSIONS_NETWORK=0: Skipping online fetch. Checking local downloads in DL_DIR...")
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
+do_clone_cvelistV5[network] = "${GENERATE_CVE_EXCLUSIONS_NETWORK}"
+do_clone_cvelistV5[nostamp] = "1"
+do_clone_cvelistV5[doc] = "Clone CVE information from the CVE Project: https://github.com/CVEProject/cvelistV5.git"
+addtask clone_cvelistV5 before do_generate_cve_exclusions
+
+do_generate_cve_exclusions() {
+    generate_cve_exclusions_script=$(find ${COREBASE} -name "generate-cve-exclusions.py")
+    if [ -z "${generate_cve_exclusions_script}" ]; then
+        bbfatal "generate-cve-exclusions.py not found in ${COREBASE}."
+    fi
+    python3 "${generate_cve_exclusions_script}" \
+        "${GENERATE_CVE_EXCLUSIONS_WORKDIR}/git" \
+        ${LINUX_VERSION} \
+        --output-json > ${GENERATE_CVE_EXCLUSIONS_WORKDIR}/cve-exclusion_${LINUX_VERSION}.json
+}
+do_generate_cve_exclusions[nostamp] = "1"
+do_generate_cve_exclusions[doc] = "Generate CVE exclusions for the kernel build. (e.g., cve-exclusion_6.12.inc)"
+addtask generate_cve_exclusions after do_clone_cvelistV5 before do_cve_check
+
+python do_cve_check:prepend() {
+    import os
+    import json
+    workdir = d.getVar("GENERATE_CVE_EXCLUSIONS_WORKDIR")
+    kernel_version = d.getVar("LINUX_VERSION")
+    json_input_file = os.path.join(workdir, "cve-exclusion_%s.json" % kernel_version)
+    if os.path.exists(json_input_file):
+        with open(json_input_file, 'r', encoding='utf-8') as f:
+            cve_data = json.load(f)
+        cve_status_dict = cve_data.get("cve_status", {})
+        count = 0
+        for cve_id, info in cve_status_dict.items():
+            if info.get("active", True):
+                continue
+            d.setVarFlag("CVE_STATUS", cve_id, info.get("message", ""))
+            count += 1
+        bb.note("Loaded %d CVE_STATUS entries from JSON output for kernel %s" % (count, kernel_version))
+}
\ No newline at end of file

