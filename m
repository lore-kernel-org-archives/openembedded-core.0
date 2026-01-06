Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE244CEFD09
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:47:02 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100228.1767732417685355633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QrKDQT+z;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c0b24cc4ddso11929785a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767732417; x=1768337217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJRUHEguu+JhdDL/0vyuj5JhzWdgaK1jCzeaAdqwBI0=;
        b=QrKDQT+zhq1dK5PWEfKhUKaklEFUCnsmLenjsp8lBLdOTt/A+++xUxCvgHLdu9N/zl
         OWOIq1t63fybdRTDaqCLtDqG/eLphBWpnngBtuZsB9EkORt62W4SDuLek1mCVy/n+VTI
         Zuk2/rAWGX8QsMS0bMzfQTmJQWTRlTS14fHO7iVojtAeCOvKx/9U8kC+J2Xq/qu2Z599
         ML70oZkSIFVGzy7pKrs3mJcWBXmBuOjvFxhXt1/wpFHgilyGePORA8jUYjy0sIZan9qo
         kz2IMNVi8Uu7HnwEedu2sKRGUlTCVCk4sAfOCQ/2MPRrPhJq2N+5J0tynTtkliJcttFi
         c+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732417; x=1768337217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GJRUHEguu+JhdDL/0vyuj5JhzWdgaK1jCzeaAdqwBI0=;
        b=PqZJS7hYgwvc/4Zlv18jPuVLtcBhxLYc9phZMpGVgk97+ZRjRV7hvZjXnBFTmU3kyM
         kd0XARdb6u2X/Jg86eza1DBlwb/JQRAgzfVIDTZ7YWeFxtrOGO5s//E+NpzLCD0iR1t1
         rV6xf3D5jOPLJ2KoHseDaISAXNflg5xgHnt5wf4RgaBe+hsXoZFK9F5v9XH6qvEzzN5I
         UhSvAow2kWal5l1w5+50pE4tbZGToPH2/ciBffYfGJ32VUZvXVVvFxi2XTFTwyUAWMc1
         NhVcYmS8SHXKKKWGGedpyuBMaXktkmMFWwRRbLczCh1PRFMuXerCtHbH47QrPrInDLrl
         LmpQ==
X-Gm-Message-State: AOJu0YyrpYIe6J5DdcPdw7DarvwxhVApZGrCVefYHHG+rjQ6dZ7g2QWy
	G4wEQaOoW8iyr+C/0hxIceTTcBZQqowqX0cpWOVZ/zjgaACkRVz1zQ03wOMF2U86px8qZw==
X-Gm-Gg: AY/fxX4l5ffM0PS+MjK38z+eyCYUFhlziUYn/qySlBTN1r1Q6B8ErOHT9z5h2oeWvfJ
	qYV0Habk6D5wJ76jGGTg0UhEGytWOHDXyK+PAsfap+UZrDrPD9S658hPHuDHcsiOwMDwD8QV72L
	qPb0lCAR4kapgTzNZm0VQYEWZd8ZHjmFlRHDPCMnGrOEmlYYl1erQ9B3Moy2xD6k364n5K0INWW
	CoHM8Elt39labTbKzDYYacdmcdnusIrNBGEzMDMsz7qHdsRn8QnweiZIMUNlhRNHt0Jh3dmmvf+
	4Afynd1j5/Cpn8+IO8lyF4zrxlUWoaNSRgJuzg2G/7Z5bi2VVzddWdMy+bRhLtBSoHg1520TKh1
	d3uarmDWoh1VmRlgF1NLxFNvmECtwZHTX4L4qyUjd0Jq6D/02DA1Z/lPvu23Ldp89S9Q7K3hqUO
	KcCcXiRyoch6tUeOrLXQxI8Gags0N9SWaxvOoajJ/+E+D7vRtFxLk6LREP91JiZ8RCEw==
X-Google-Smtp-Source: AGHT+IFKsXkOYDdVFs4FLnOa2OFXOKfvsG3Kt664/xQDKnph2026kCCV9/x0Jtqye/eoUCaN7Js6jA==
X-Received: by 2002:a05:6214:27ec:b0:88f:ca7a:6c3a with SMTP id 6a1803df08f44-890840b7d83mr3592816d6.0.1767732416580;
        Tue, 06 Jan 2026 12:46:56 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm20361976d6.8.2026.01.06.12.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:46:56 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v3 2/4] generate-cve-exclusions: Add a .bbclass
Date: Tue,  6 Jan 2026 15:46:44 -0500
Message-ID: <20260106204646.3417382-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
References: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228926

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

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 meta/classes/generate-cve-exclusions.bbclass | 67 ++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta/classes/generate-cve-exclusions.bbclass

diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/generate-cve-exclusions.bbclass
new file mode 100644
index 0000000000..254ea5531d
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
+addtask clone_cvelistV5 before do_generate_cve_exclusions
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
+addtask generate_cve_exclusions after do_clone_cvelistV5
+
+python do_cve_check:prepend() {
+    import os
+    import json
+
+    workdir = d.getVar("CVE_EXCLUSIONS_WORKDIR")
+    kernel_version = d.getVar("LINUX_VERSION")
+    json_input_file = os.path.join(workdir, "cve-exclusion_%s.json" % kernel_version)
+
+    if os.path.exists(json_input_file):
+        with open(json_input_file, 'r', encoding='utf-8') as f:
+            cve_data = json.load(f)
+        cve_status_dict = cve_data.get("cve_status", {})
+        count = 0
+        for cve_id, info in cve_status_dict.items():
+            if info.get("active", True):
+                # Skip active CVEs
+                continue
+            d.setVarFlag("CVE_STATUS", cve_id, info.get("message", ""))
+            count += 1
+
+        bb.note("Loaded %d CVE_STATUS entries from JSON output for kernel %s" % (count, kernel_version))
+    else:
+        bb.warn("CVE exclusion JSON not found: %s. Skipping CVE_STATUS updates" % json_input_file)
+}
\ No newline at end of file

