Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E097CEFCEB
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:28:32 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96787.1767724109558161467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 10:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fTGzmJtj;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8b2da4fb076so20306185a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 10:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724108; x=1768328908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy/zyFrUZHh3XWg7UTuLp4q/9dgFFbI4+nRFp9/3xKI=;
        b=fTGzmJtjRBZkfXeIBvKnvza6PcAnn7mGOFTRx42CDIt1ZNsZEbPJoZU2XwONe6U0eU
         INGslm5bkkW/yB1m5plhgUUyKrKJSbCphgU3ZiqEpCaLWhg/9W0/hHoLrKe0PqVTJs/O
         R6AU3UGN0X4zoX/zxETveityamfTTAOTfBs4tSEUOHqL+IW+2bCkLqQLSYg8bdUst0HG
         nP2ykRpHMlhwwP817s08f3DxIPdlXfraHhu5Kqg2q0soIet+XOyrE70z7Ed47zgSoFuI
         gdOVnic2z3ZgF0N6/BycifDyOAQOr/O6i6svMnMkV2EhIN1TUCrqJBWyMT7lLO0Imyi/
         ZraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724108; x=1768328908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oy/zyFrUZHh3XWg7UTuLp4q/9dgFFbI4+nRFp9/3xKI=;
        b=QqBUo3o8m9jIk2gHvcJRodNtfXEUvVZvMDrXw0vOm9sdcon8RN2ZTFcTXFtD6YcWXA
         yvh7JuFfC69edMk/8par52s/npi9Xcigf12tjYAte31QUNcno0oljGSISR5C0n/5BUCP
         zIAgOWQVBnhxIjrcu4NU3mBPmrdo1AAy8YOxM+Z0URrkzSxE0AYP11HbeYrVz98M++ML
         +VaWRhmZIOxSmhMeKi+kHTQaxKsY7Oc3bg32SmWSNHAKoi5hw/mmIO6PxhQAb5YoV+QM
         euJKfcGr8b64TaXfy7UfTHUkU8/pe/6oqE30T97RmogiUKDFjdX5WFMYBL8tNlI38Jox
         g2Gw==
X-Gm-Message-State: AOJu0YzF8mOTjlRSAurQ5Z9IhG/0sm/13IpGwHmSE+4l2EkK5UyD/xC+
	X+mhGi3fZM4B+JV1N5LD9Kdl1koGoRl5QaWs5r0ms9PfGz8SWWXWlFbRtiXFhCe13xUgkw==
X-Gm-Gg: AY/fxX5+/tup10pTxOIPg9oV39dnSDGB9EgmNvCaCZ7aW99hr9ctkcdguWuow+/yQ9O
	3Ey6wknmk1bzPLCB9bfI4d+DVLnfqmlocm6whVt1UNWHWXDSEepZ5Y2V0f+VxvN62aHP3G9aMtp
	Xyf6NUYWw+QEI/4qAol6CCuOAwhGg+zCx/uH/pu0eoLHX6yRx7tkBPP2iXeYVxDrWiJXmsiFS6P
	eIN2AGY/ape/opaDpEemHqyhnPqje+zKcQgs9dbAj9Y+oA1t8d7UV0Otzr99ZIi3tz3u2IpfS4u
	nliYv+5eZDGkmEUp+0oRHeMB7UPFEPjEjF/nNOirBidSaS0FiFdTXIT8Gp0D8aAiQoyPABg84m+
	+3HcizCA77bxNWAvoDUtMUE5FJWiNpx3TeGYun28jSg0nyOm5W/nwxjqZNOSpPL2O6qJ84ELgVH
	IqFrkKUnL93c4mpWf9PEGYtxHHimED0x4pfkI2l7h8o9aHRB3QwgT3eCk=
X-Google-Smtp-Source: AGHT+IHJ3cIOZQBxU0q3TjGGAPnFvJ9kQcchxv9GpERmsCoD9JOaETom2KWJr1lFAT08IL91ZVuLog==
X-Received: by 2002:a05:620a:1917:b0:8b2:e177:ddb2 with SMTP id af79cd13be357-8c37ebc6664mr390980085a.6.1767724108510;
        Tue, 06 Jan 2026 10:28:28 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a97fesm214003185a.4.2026.01.06.10.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:28:28 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH 2/4] generate-cve-exclusions: Add a .bbclass
Date: Tue,  6 Jan 2026 13:28:20 -0500
Message-ID: <20260106182822.3377881-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106182822.3377881-1-valentin.boudevin@gmail.com>
References: <20260106182822.3377881-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 18:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228910

Add a .bbclass to generate-cve-exclusions to use this script at every
run.
This class needs to be inherit by the linux kernel recipe.

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
---
 meta/classes/generate-cve-exclusions.bbclass | 67 ++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta/classes/generate-cve-exclusions.bbclass

diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/generate-cve-exclusions.bbclass
new file mode 100644
index 0000000000..3e34ba563d
--- /dev/null
+++ b/meta/classes/generate-cve-exclusions.bbclass
@@ -0,0 +1,67 @@
+CVE_EXCLUSIONS_WORKDIR ?= "${WORKDIR}/cvelistV5"
+CVELISTV5_PATH ?= "${CVE_EXCLUSIONS_WORKDIR}/git"
+
+python do_clone_cvelistV5() {
+    import subprocess
+    import shutil, os
+    rootdir = d.getVar("CVELISTV5_PATH")
+    d.setVar("SRC_URI", "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https")
+    d.setVar("SRCREV", "${AUTOREV}")
+    src_uri = (d.getVar('SRC_URI') or "").split()
+    # Fetch the kernel vulnerabilities sources
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+    fetcher.download()
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
+do_clone_cvelistV5[network] = "1"
+do_clone_cvelistV5[nostamp] = "1"
+do_clone_cvelistV5[doc] = "Clone CVE information from the CVE Project: https://github.com/CVEProject/cvelistV5.git"
+addtask clone_cvelistV5 after do_fetch before do_generate_cve_exclusions
+
+do_generate_cve_exclusions() {
+    generate_cve_exclusions_script=$(find ${COREBASE} -name "generate-cve-exclusions.py")
+    if [ -z "${generate_cve_exclusions_script}" ]; then
+        bbfatal "generate-cve-exclusions.py not found in ${COREBASE}."
+    fi
+    python3 "${generate_cve_exclusions_script}" \
+        ${CVELISTV5_PATH} \
+        ${LINUX_VERSION} \
+        --output-json > ${CVE_EXCLUSIONS_WORKDIR}/cve-exclusion_${LINUX_VERSION}.json
+}
+do_generate_cve_exclusions[nostamp] = "1"
+do_generate_cve_exclusions[doc] = "Generate CVE exclusions for the kernel build. (e.g., cve-exclusion_6.12.inc)"
+addtask generate_cve_exclusions after do_clone_cvelistV5 before do_cve_check
+
+python do_cve_check:prepend() {
+    import os
+    import json
+
+    workdir = d.getVar("CVE_EXCLUSIONS_WORKDIR")
+    kernel_version = d.getVar("LINUX_VERSION")
+    json_input_file = os.path.join(workdir, "cve-exclusion_%s.json" % kernel_version)
+
+    # Parse JSON
+    with open(json_input_file, 'r', encoding='utf-8') as f:
+        cve_data = json.load(f)
+
+    cve_status_dict = cve_data.get("cve_status", {})
+
+    if os.path.exists(json_input_file):
+        count = 0
+        for cve_id, info in cve_status_dict.items():
+            if info.get("active", True):
+                # Skip active CVEs
+                continue
+            d.setVarFlag("CVE_STATUS", cve_id, info.get("message", ""))
+            count += 1
+    bb.note("Loaded %d CVE_STATUS entries from JSON output for kernel %s" % (count, kernel_version))
+}
\ No newline at end of file
-- 
2.43.0


