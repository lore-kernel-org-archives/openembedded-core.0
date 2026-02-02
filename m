Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B93E7FDDC
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:08:29 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1432.1770066500025799338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fs250xLD;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-50151954d0bso2052131cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066499; x=1770671299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZdBkn29gWzeBKhf++n4nRAtrMGmyumUIcPf6D4vvkM=;
        b=Fs250xLDvbc6c7euB+UvhtT3AE8bTNWMBAFEqq21Zv8klnkSE1QgAmGK55akwkfxbF
         rFbrjfFyrn5iPejpJ+uKV2Mp+07UbCzNL/UYUruZYIfadrdzDD6Taj349znIXipQXeBg
         lpBAz3eL35EIkQNZ78oeuoepxX13k+rH0lU1UKqbEb4whptx5BJQmDqC+xj5VwhizG88
         RhWIjA1JJ8fhPXGdcNu7CGOJF7ffa6MbOURXF5FUnKfzfxjPqXG4D4rJHkionse44Fcb
         kdTw6bdlcnuJQIAsqQS3vE/Eh9OIKfm2mjZqzv7bLzhQX9vz+o/b6+ahtOLfq3OyYgpP
         c6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066499; x=1770671299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZdBkn29gWzeBKhf++n4nRAtrMGmyumUIcPf6D4vvkM=;
        b=s4jKof7PocvJl9CTGNNLwFG3/Kwe6usFysnLz4elQb6sc1Wt5Jy4dNd6mqOS8D10Fy
         QqpiDKSW+4XC96Ftj5LLJrdOvMHAOw52yPzVrMJMEYwlBbuScbumzja33ePTT797MxPA
         Q20IMn/+mbQoJOQnHDIF6I3O3PuQY+bomdlxMYaOdYdjtdaJ+yDz5FYNyf4JeHyfIfNr
         pkLcx1QPP40k7101N5CYOfZ4uAQ2wyd/6BsgRRrn8pPDTt3eISgHKFMDq1lDep5l7ZEV
         P3kfyre0F2xuwT3dAxHt29ev2ccR0bS6rsCuxJmarDdM0++4BwwBTFSZy1wR/k3xBOUx
         ugHQ==
X-Gm-Message-State: AOJu0YxCxPcn87Dw6bxHeTe9ETMtC1PZhUtUtF557nKEsMuCit/ni9wx
	ti1YCvDwywsmrWze5aRax5ywI7nHugiTNxwxbpWOJn7/nxHsi3h+Ixw+IFgRJd3WzkTjUA==
X-Gm-Gg: AZuq6aIPVM91TBRaNtrbx9zcXwKxdJA+noRDXGYDRVvcMYm4kIUbUDqAPxr3Ty3X2Dy
	LX3cqOhSWCe14EVdv24uQCIvUiiAoZ8jHNt/CNkxLWD1SIdTyxf2hd23QlvuVMT8aiLYFjMRwj9
	vXiwSE+dHV67UmTzUpcUN0pEk223mLLOHcfME1khFEOPEqp//uzaq3kcTwAQKe5l9YVJdDiM3wL
	hnAkj47ykfeRs+IJcrQLDigisyZAiJ5dm6iIYY4A24geRU3DV10E0ZtcX4l2OKhzyGljLiASFZD
	QobCBTlXjb6XsuSiwYWqYN4z5qRoF+QSImLxZmIticggdybM4TOKU9hySY8AGQqQZ1mier+A6jI
	HROxgSJzOrcWd+T9LOYA/UIssFbIV5Cvno/7cqXrFNmwRPhOSSl7aaXBhb83W1nHwk03ekdhSWN
	K6f8o6jDc2HljDL1SjyFQBhV85z2vqrEYT+Q2lMLcUFTL7TkS8OPp3cWw=
X-Received: by 2002:ac8:5d46:0:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-505d2122b1emr145344861cf.1.1770066498872;
        Mon, 02 Feb 2026 13:08:18 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337bb9a30sm117547431cf.23.2026.02.02.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:08:18 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 2/2] improve_kernel_cve_report: Add a bbclass support
Date: Mon,  2 Feb 2026 16:08:11 -0500
Message-ID: <20260202210811.2136027-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202210811.2136027-1-valentin.boudevin@gmail.com>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260202210811.2136027-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 21:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230406

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
INHERIT.

-improve_kernel_cve_report-spdx-3.0.bbclass: Set
IMPROVE_KERNEL_SPDX_FILE variable for SPDX-3.0 project, and set
IMPROVE_KERNEL_PREFERRED_PROVIDER to "create-spdx" to requires it in
INHERIT.

-improve_kernel_cve_report.bbclass: Include this class when you don't
care what version of SPDX you get.

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

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../improve_kernel_cve_report-base.bbclass    | 64 +++++++++++++++++++
 ...improve_kernel_cve_report-spdx-2.2.bbclass |  4 ++
 ...improve_kernel_cve_report-spdx-3.0.bbclass |  4 ++
 .../classes/improve_kernel_cve_report.bbclass |  3 +
 4 files changed, 75 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-base.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-3.0.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report.bbclass

diff --git a/meta/classes/improve_kernel_cve_report-base.bbclass b/meta/classes/improve_kernel_cve_report-base.bbclass
new file mode 100644
index 0000000000..8bc6000903
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-base.bbclass
@@ -0,0 +1,64 @@
+# Settings for SPDX support
+
+# Setting to specify preferred provider for kernel SPDX file ("create-spdx" or "create-spdx-2.2")
+IMPROVE_KERNEL_PREFERRED_PROVIDER ?= ""
+# Setting to specify the path to the SPDX file to be used for extra kernel vulnerabilities scouting
+IMPROVE_KERNEL_SPDX_FILE ?= ""
+
+python __anonymous() {
+    if bb.data.inherits_class("create-spdx-2.2", d):
+        if not d.getVar("IMPROVE_KERNEL_PREFERRED_PROVIDER") == "create-spdx-2.2":
+            bb.fatal("improve_kernel_cve_report: IMPROVE_KERNEL_PREFERRED_PROVIDER is set to '%s', but 'create-spdx-2.2' class is inherited. Please check your configuration." % d.getVar("IMPROVE_KERNEL_PREFERRED_PROVIDER"))
+        bb.build.addtask("do_scout_extra_kernel_vulns", "do_build", "do_rootfs", d)
+    elif bb.data.inherits_class("create-spdx", d):
+        if not d.getVar("IMPROVE_KERNEL_PREFERRED_PROVIDER") == "create-spdx":
+            bb.fatal("improve_kernel_cve_report: IMPROVE_KERNEL_PREFERRED_PROVIDER is set to '%s', but 'create-spdx' class is inherited. Please check your configuration." % d.getVar("IMPROVE_KERNEL_PREFERRED_PROVIDER"))
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
+    if [ ! -d "${STAGING_DATADIR_NATIVE}/vulns-native" ]; then
+        bbwarn "improve_kernel_cve: Vulnerabilities data not found in ${STAGING_DATADIR_NATIVE}/vulns-native."
+        return 0
+    fi
+
+    #Run the improve_kernel_cve_report.py script
+    bbplain "improve_kernel_cve: Using SPDX file for extra kernel vulnerabilities scouting: ${IMPROVE_KERNEL_SPDX_FILE}"
+    python3 "${improve_kernel_cve_script}" \
+        --spdx "${IMPROVE_KERNEL_SPDX_FILE}" \
+        --old-cve-report "${CVE_CHECK_MANIFEST_JSON}" \
+        --new-cve-report "${new_cve_report_file}" \
+        --datadir "${STAGING_DATADIR_NATIVE}/vulns-native"
+    bbplain "Improve CVE report with extra kernel cves: ${new_cve_report_file}"
+
+    #Create a symlink as every other JSON file in tmp/deploy/images
+    ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}.scouted.json
+}
+do_scout_extra_kernel_vulns[depends] += "vulns-native:do_populate_sysroot"
+do_scout_extra_kernel_vulns[nostamp] = "1"
+do_scout_extra_kernel_vulns[doc] = "Scout extra kernel vulnerabilities and create a new enhanced version of the cve_check file in the deploy directory"
+addtask scout_extra_kernel_vulnsate_cve_exclusions after do_prepare_recipe_sysroot
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
diff --git a/meta/classes/improve_kernel_cve_report-spdx-3.0.bbclass b/meta/classes/improve_kernel_cve_report-spdx-3.0.bbclass
new file mode 100644
index 0000000000..3849f66aaf
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report-spdx-3.0.bbclass
@@ -0,0 +1,4 @@
+IMPROVE_KERNEL_PREFERRED_PROVIDER = "create-spdx"
+IMPROVE_KERNEL_SPDX_FILE = "${SPDXIMAGEDEPLOYDIR}/${IMAGE_LINK_NAME}.spdx.json"
+
+inherit improve_kernel_cve_report-base
\ No newline at end of file
diff --git a/meta/classes/improve_kernel_cve_report.bbclass b/meta/classes/improve_kernel_cve_report.bbclass
new file mode 100644
index 0000000000..7b237d1e22
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report.bbclass
@@ -0,0 +1,3 @@
+# Include this class when you don't care what version of SPDX you get; it will
+# be updated to the latest stable version that is supported
+inherit improve_kernel_cve_report-spdx-3.0
\ No newline at end of file

