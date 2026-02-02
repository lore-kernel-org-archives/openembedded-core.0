Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9441E7FDDB
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 20:55:49 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1153.1770065739821776974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 12:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vx9b8RTf;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c71214052eso62769785a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 12:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065739; x=1770670539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF+NAd+xB0whLcp0r0w6eP2XbiHLAttvuw3ON64g3X4=;
        b=Vx9b8RTf8syAg5QB9vdyf03ReA9JtK327xvKJ+BMxQXLgVy0DFE0jGDvWOQh6fFB24
         zj45j/esGTODvzmRA7eApAl1wUNXdIkht/WsjmWFAPzZM3PJbW9qSpMYF4grGsHWyUeY
         cZfx/XAVlG0vtuJRAXVCYJiMNtsFeWQEA8ctE03NhmxgfW9PWxiJOep/4xEBnlar1VcH
         mZ2TIBMnrncWmuGn37B59J1rZT4ZPAN3rQyq7M27yTQzk6ZPq8URWLaVZSnWUQ4dRCAe
         oZZKJTOFCQ5K36C9klGieJKcgH21ziGhNtVtVU5XXyQRdk1pCgWrFuzhceHuvxZRU+FC
         kW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065739; x=1770670539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WF+NAd+xB0whLcp0r0w6eP2XbiHLAttvuw3ON64g3X4=;
        b=YIX8kUfQ9lOrdZ8E1b7XR4LcHepMD7NnRD8RTw1cXhTlQbR4eoA64fS6S9hK6j1Fbe
         WE2/Qb5hecfzJkV1KbOc/VDaO5bqo7HLFWejXH48fM0EPbarMh9W/2kyhchWSjRqf2je
         T+8D+UlZdJsmz0qZ/4StU4C7PY7tJ+te8yM1XSkvSofBNRa5Teczqf20hfOmr5iDrSHU
         C8NBDSJp9f7vpQY1W2nibmkaHm2tlfrAGbm7MN4pyt2uPiP57e/Swg6GgNmGbS6mj0m9
         5oHoKeW7EXX9I0Do1LGiOtIDWscfHHbLVCpVsjGcZnWh0PL9rvHSJfFDxAvue9extoxV
         CaJQ==
X-Gm-Message-State: AOJu0Yw3S7kVGMS8Y6GpC6bxtLfxPWqj+l5rQEAP0umGoVUBVWouFjKN
	kytBnJjIGdAQOR9IMHHJfoZPqkyBAT+m7XTkmrSZwVdb1DvD/LruMNZ1m4OrPhzl
X-Gm-Gg: AZuq6aKLGbT63GVDHliFTbwneJk2Pr8RBZc+qK4ZJNJzpg9XVrc9fiUBHKoJPQ1qxp+
	vRsbU3yl5bdFIRyu1rRQubGf4NGPukzbysOEvvpozuU7e/MwCCzbh9M3ZCjZgQBwcHifIWnVHJ/
	FfAvaOUf07FBBp8OpbYRkqCXw+xXRiwCMDfTC2H/plCMqvDGFeergqu/51x6IMIsuC60WvE+CQl
	ezDbCRIM2E94sHkBe1T345gi0AOT2gMeo6aOzxLf1yw/WBgFuwWApbXE3HTU7qm+IC/AcWJFbYH
	8rcZVi2dL0nTalr+me9az1D4ZZ64tl8TReHCrk/Q/FbZtCTQm7+T329RdPEqi8DNK8dpkfXfOYa
	LAy8rtqGUXA6FXlguoNhxdioLx1oDfUi+ilOnT1z+IlXDaErtoDOuQ7UqGK5EH73D5tYE/H7Osy
	aVq6DwzepUxtOgxRtS31Cix/K4/hVw9vZf6g9c1JjwFO6468B7MEui0rg=
X-Received: by 2002:a05:620a:178d:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c9eb32aaeamr1284737785a.8.1770065738710;
        Mon, 02 Feb 2026 12:55:38 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d28c71sm1356221285a.33.2026.02.02.12.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:55:38 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v7 3/4] kernel-generate-cve-exclusions: Add a .bbclass
Date: Mon,  2 Feb 2026 15:52:29 -0500
Message-ID: <20260202205231.2134908-4-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202205231.2134908-1-valentin.boudevin@gmail.com>
References: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
 <20260202205231.2134908-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 20:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230402

Add a new class named kernel-generate-cve-exclusions.bbclass to
generate-cve-exclusions to use this script at every run.

Two steps for testing:

1) inherit this class in the kernel recipe with "inherit
   kernel-generate-cve-exclusions.bbclass"
2) Use the following command to generate cve exclusions .json, and .inc
   file : "bitbake linux-yocto -c "do_generate_cve_exclusions"

This class contains several methods:

*do_generate_cve_exclusions: Use the script generate-cve-exclusions.py.
It uses the new "--output-json-file" argument to generate a JSON file as
an output stored in ${GENERATE_CVE_EXCLUSIONS_OUTPUT_JSON}, and a .inc
file in ${GENERATE_CVE_EXCLUSIONS_OUTPUT_INC}

*do_cve_check:prepend: Parse the previously generated JSON file to set
the variable CVE_STATUS corretly

The class also provides some variables:

*GENERATE_CVE_EXCLUSIONS_OUTPUT_JSON: path of the output JSON file used
to set CVE_STATUS
*GENERATE_CVE_EXCLUSIONS_OUTPUT_INC: cve exclusions .inc file output
path. Not used directly by this class (needs to be inherit manually).

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../kernel-generate-cve-exclusions.bbclass    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta/classes/kernel-generate-cve-exclusions.bbclass

diff --git a/meta/classes/kernel-generate-cve-exclusions.bbclass b/meta/classes/kernel-generate-cve-exclusions.bbclass
new file mode 100644
index 0000000000..8efa32f6a1
--- /dev/null
+++ b/meta/classes/kernel-generate-cve-exclusions.bbclass
@@ -0,0 +1,46 @@
+# Generate CVE exclusions for the kernel build (set to "1" to enable)
+GENERATE_CVE_EXCLUSIONS_OUTPUT_JSON = "${WORKDIR}/temp/cve-exclusion_${LINUX_VERSION}.json"
+GENERATE_CVE_EXCLUSIONS_OUTPUT_INC  = "${WORKDIR}/temp//cve-exclusion_${LINUX_VERSION}.inc"
+
+do_generate_cve_exclusions() {
+    # Check for required files and directories
+    generate_cve_exclusions_script=${COREBASE}/scripts/contrib/generate-cve-exclusions.py
+    if [ ! -f "${generate_cve_exclusions_script}" ]; then
+        bbwarn "generate-cve-exclusions.py not found in ${generate_cve_exclusions_script}."
+        return 0
+    fi
+    if [ ! -d "${STAGING_DATADIR_NATIVE}/cvelistv5-native" ]; then
+        bbwarn "CVE exclusions source directory not found in ${STAGING_DATADIR_NATIVE}/cvelistv5-native."
+        return 0
+    fi
+    # Generate the CVE exclusions JSON & INC file
+    python3 "${generate_cve_exclusions_script}" \
+        "${STAGING_DATADIR_NATIVE}/cvelistv5-native" \
+        ${LINUX_VERSION} \
+        --output-json-file "${GENERATE_CVE_EXCLUSIONS_OUTPUT_JSON}" \
+        --output-inc-file "${GENERATE_CVE_EXCLUSIONS_OUTPUT_INC}"
+    bbplain "CVE exclusions generated for kernel version ${LINUX_VERSION} at ${GENERATE_CVE_EXCLUSIONS_OUTPUT_INC} and ${GENERATE_CVE_EXCLUSIONS_OUTPUT_JSON}."
+}
+do_generate_cve_exclusions[depends] += "cvelistv5-native:do_populate_sysroot"
+do_generate_cve_exclusions[nostamp] = "1"
+do_generate_cve_exclusions[doc] = "Generate CVE exclusions for the kernel build. (e.g., cve-exclusion_6.12.json)"
+addtask generate_cve_exclusions after do_prepare_recipe_sysroot before do_cve_check
+
+python do_cve_check:prepend() {
+    import os
+    import json
+    workdir = d.getVar("${STAGING_DATADIR_NATIVE}/cvelistv5-native")
+    kernel_version = d.getVar("LINUX_VERSION")
+    json_input_file = d.getVar("GENERATE_CVE_EXCLUSIONS_OUTPUT_JSON")
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

