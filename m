Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017CBC982F6
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:12:57 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5021.1768590776223785141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3Xx8zs2;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-5014501ba93so3385671cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590775; x=1769195575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3r4vCAmVb1yuth0uHEXvy90JjcKpbBBXHoapIEFApI=;
        b=b3Xx8zs2BvLwLpGKl2B/wgyV56i0zDYKQTfS4Xbo2ooetLW3TuPKTmwlNWwqfRyxc4
         kkib5BoTNAmFm+hz+RpwZ0ZUCkkXyWMYo0rrKf0o3vINg0+9JTWMMmu7gxn+RTyZlS5y
         AZPuUrjDGisefU0NrK7mt8k5CLBU1ZnjC54SCMs8ihLTn8msoySSBsWkEPDiCJEoAbzH
         gR0jXOAfEsZCQp5uYNodF8y4vwL1PDnUl5WvRH5DMVmxkXVybMBCmDyRrxyR8jVwct4C
         SxeXDf42xY/3MiTohc8f9xdrtKjv4GF26Dgfc0Mq9EOzQdD3vqKAOI6za+xaUIe0Z6d+
         k3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590775; x=1769195575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3r4vCAmVb1yuth0uHEXvy90JjcKpbBBXHoapIEFApI=;
        b=PhxGLWd77DmyoI2X5jYtJwmcsXTVsqLd3zqzPHWMnY0sgiqiopxJlnDSH4mIwdrI49
         J6qSPuPmLqM84+q4XBfGYZ8D9BiIeX8jNp0hcndY/EEiA2IxDFItOLSj1zN5CQWjDLFA
         52BIH8Hg6KhkwcV/S6G3X55Z5ScbzBYTyOHGFMA1aKnhwcx+zK73irORatZup+cGA5n7
         OCP1ErBUFyYMwdYSX7J/aEFdq1/x2NGuiFlb/a2qkVfbFGLxWn3cYLAq9QyIwU45S8NG
         jmPElT0ZG5LujCQ4cZU6GnotIT2njO6jIFBLcqa03OWEiakR2kJjTS1D3qSaC4RoqxjS
         nBng==
X-Gm-Message-State: AOJu0YylfPu6HRAFBOZQcqtXRW5N+ktp72senLiDNdcSJs/oWN6P8aqS
	VprXo5LHfQt+75egALVwPmZiHx1+csUQeGdQ6l66NyJDSWWcz8zgA6A7BCofOho6Iak2OQ==
X-Gm-Gg: AY/fxX4LotuImotSWFGehnBr9WWg6RCBhAZNzgHNGeSwp3SeE3T3BKhWLWxRv+i8b8r
	RDaWUylORciSDylR5hI+IMhuepNiGJU8zlijCNZcGABhcOXPnVqkKCxymgePofWUpGAjtQa02KG
	9dUqn8fCGyJ3PqZv1xqF5GwmxfJ3zf/HTEohOijh78SaMrSZZoNEK98OeBpd57V4jY7fxnQoh1Z
	g/4XTL7AOZgFdk3QNidkbyA6yOqITvGkY74vdD60ju70rm3mZN+QlNQo0zTfHWcURVhennhvN0B
	vEcPrwzkicC6Np4WtmOzpwx70OO/xXF4GjhTDZyHE1xdRlqIXGI+sx+aIzJqvd1UcmK4/3+6vaE
	jUxLuWZeTvP5OkIYCWtER+rTTLTBvZnXzfbnCjxERN56ND/IV/gyYu6Ie3KGMdSA671KdLOC7F8
	B/wFPXGaFFwIhvKRw3OSoUP82+/bK3UAjUldXufjtcPSFqZy50i6Tmi4E=
X-Received: by 2002:ac8:7fc3:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-502a1735f4fmr49166441cf.11.1768590775087;
        Fri, 16 Jan 2026 11:12:55 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71bf2b0sm287446685a.12.2026.01.16.11.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:12:54 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	antonin.godard@bootlin.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v5 2/4] generate-cve-exclusions: Add a .bbclass
Date: Fri, 16 Jan 2026 14:05:18 -0500
Message-ID: <20260116190520.118714-4-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116190520.118714-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229560

Add a new class named kernel-generate-cve-exclusions.bbclass to
generate-cve-exclusions to use this script at every run.

Two steps for testing:
1) Inherit this class in the kernel recipe with "inherit
   kernel-generate-cve-exclusions.bbclass"
2) Turn the variable ENABLE_KERNEL_CVE_EXCLUSIONS to "1".
3) Use the following command to generate a cvelistV5 entry with a JSON
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
*ENABLE_KERNEL_CVE_EXCLUSIONS: Enable/Disable this class (off by default
to not affect linux-yocto OE example)
*GENERATE_CVE_EXCLUSIONS_SRC_URI and GENERATE_CVE_EXCLUSIONS_SRCREV can
be used to change the source repository or fix a commit with SRCREV
(usefull for deterministic testing)
*GENERATE_CVE_EXCLUSIONS_NETWORK can be set to 0 to provide an offline
mode based on DL_DIR directory.
*GENERATE_CVE_EXCLUSIONS_WORKDIR path used as a working directory for
this class
*GENERATE_CVE_EXCLUSIONS_DESTSUFFIX suffix used for the git unpack
*GENERATE_CVE_EXCLUSIONS_UNPACK_DIR path of the unpack for the git
repository

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../kernel-generate-cve-exclusions.bbclass    | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 meta/classes/kernel-generate-cve-exclusions.bbclass

diff --git a/meta/classes/kernel-generate-cve-exclusions.bbclass b/meta/classes/kernel-generate-cve-exclusions.bbclass
new file mode 100644
index 0000000000..cd81cc5899
--- /dev/null
+++ b/meta/classes/kernel-generate-cve-exclusions.bbclass
@@ -0,0 +1,135 @@
+# Generate CVE exclusions for the kernel build (set to "1" to enable)
+ENABLE_KERNEL_CVE_EXCLUSIONS ?= "0"
+
+# CVE exclusions source repository settings
+GENERATE_CVE_EXCLUSIONS_SRC_URI ?= "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https"
+GENERATE_CVE_EXCLUSIONS_SRCREV ?= "${@bb.fetch2.get_autorev(d)}"
+GENERATE_CVE_EXCLUSIONS_NETWORK ?= "1"
+GENERATE_CVE_EXCLUSIONS_WORKDIR ?= "${WORKDIR}/cvelistV5"
+GENERATE_CVE_EXCLUSIONS_DESTSUFFIX ?= "git"
+GENERATE_CVE_EXCLUSIONS_UNPACK_DIR ?= "${GENERATE_CVE_EXCLUSIONS_WORKDIR}/${GENERATE_CVE_EXCLUSIONS_DESTSUFFIX}"
+
+python __anonymous() {
+    # Only run if CVE exclusions are enabled
+    if d.getVar("ENABLE_KERNEL_CVE_EXCLUSIONS", True) == "1":
+        srcrev = d.getVar("GENERATE_CVE_EXCLUSIONS_SRCREV", True) or ""
+        network = d.getVar("GENERATE_CVE_EXCLUSIONS_NETWORK", True) or "0"
+        # Check offline mode with AUTOREV-like SRCREV
+        if network == "0" and srcrev.strip() in ("${AUTOREV}", "AUTOINC", "INVALID"):
+            bb.fatal("generate-cve-exclusions: Offline mode but SRCREV is set to AUTOREV/AUTOINC/INVALID. "
+                     "Cannot proceed without network access or use a fixed SRCREV.")
+        d.appendVar("SRC_URI", " ${GENERATE_CVE_EXCLUSIONS_SRC_URI};name=generate-cve-exclusions;destsuffix=${GENERATE_CVE_EXCLUSIONS_DESTSUFFIX}")
+        d.setVar("SRCREV_generate-cve-exclusions", d.getVar("GENERATE_CVE_EXCLUSIONS_SRCREV"))
+}
+
+python do_clone_cvelistV5() {
+    import subprocess
+    import shutil, os
+    # Only run if CVE exclusions are enabled
+    if not d.getVar("ENABLE_KERNEL_CVE_EXCLUSIONS") == "1":
+        return
+    network_allowed = d.getVar("GENERATE_CVE_EXCLUSIONS_NETWORK") == "1"
+    workdir = d.getVar("GENERATE_CVE_EXCLUSIONS_WORKDIR")
+    unpack_dir = d.getVar("GENERATE_CVE_EXCLUSIONS_UNPACK_DIR")
+    # Remove existing unpacked directory if any
+    if os.path.exists(workdir):
+        shutil.rmtree(workdir)
+    # Prepare fetcher
+    src_uri_list = (d.getVar('SRC_URI') or "").split()
+    cve_uris = []
+    for uri in src_uri_list:
+        if "name=generate-cve-exclusions" in uri:
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
+        bb.note("GENERATE_CVE_EXCLUSIONS_NETWORK=0: Skipping online fetch. Checking local downloads in DL_DIR...")
+        have_sources = False
+        dl_dir = d.getVar("DL_DIR")
+        srcrev = d.getVar("SRCREV_generate-cve-exclusions")
+        bb.note(f"Checking for sources for SRCREV: {srcrev}")
+        # Check SRCREV is NOT set to AUTOREV
+        if srcrev.strip() in ("${AUTOREV}", "AUTOINC", "INVALID"):
+            bb.fatal("generate-cve-exclusions: Offline mode but SRCREV is set to AUTOREV/AUTOINC/INVALID. Cannot proceed without network access or use a fixed SRCREV.")
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
+                bb.fatal("generate-cve-exclusions: Offline mode but required source is missing.\n"f"SRC_URI = {ud.url}")
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
+    bb.note("Vulnerabilities repo unpacked into: %s" % unpack_dir)
+}
+do_clone_cvelistV5[network] = "${GENERATE_CVE_EXCLUSIONS_NETWORK}"
+do_clone_cvelistV5[nostamp] = "1"
+do_clone_cvelistV5[doc] = "Clone CVE information from the CVE Project: https://github.com/CVEProject/cvelistV5.git"
+addtask clone_cvelistV5 before do_generate_cve_exclusions
+
+do_generate_cve_exclusions() {
+    # Only run if CVE exclusions are enabled
+    if [ "${ENABLE_KERNEL_CVE_EXCLUSIONS}" != "1" ]; then
+        return 0
+    fi
+    generate_cve_exclusions_script=${COREBASE}/scripts/contrib/generate-cve-exclusions.py
+    if [ ! -f "${generate_cve_exclusions_script}" ]; then
+        bbwarn "generate-cve-exclusions.py not found in ${COREBASE}."
+        return 0
+    fi
+    if [ ! -d "${GENERATE_CVE_EXCLUSIONS_UNPACK_DIR}" ]; then
+        bbwarn "CVE exclusions source directory not found in ${GENERATE_CVE_EXCLUSIONS_UNPACK_DIR}."
+        return 0
+    fi
+    python3 "${generate_cve_exclusions_script}" \
+        "${GENERATE_CVE_EXCLUSIONS_UNPACK_DIR}" \
+        ${LINUX_VERSION} \
+        --output-json > ${GENERATE_CVE_EXCLUSIONS_WORKDIR}/cve-exclusion_${LINUX_VERSION}.json
+    bbplain "CVE exclusions generated for kernel version ${LINUX_VERSION} at ${GENERATE_CVE_EXCLUSIONS_WORKDIR}/cve-exclusion_${LINUX_VERSION}.json."
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

