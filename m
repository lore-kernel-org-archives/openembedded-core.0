Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C2ECEFCF2
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:10:22 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98063.1767726617456624962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 11:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RPjvXJEG;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8b1bb9c3c04so24713585a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726616; x=1768331416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11Q8dUO29PtB2BgvNTdqJEjxg/WcHN3+/b9BoeWwkmc=;
        b=RPjvXJEGCWg5OghbLd5xkeURp+h6nHi6Q+lKHn8MLdm027kI1MBRGytIoTb0R2Wcb+
         Uj7iIraRySrxhyOwIj9V8bnpJ+UudFU/sNMbcJ/RaNPflwb7pSoi59+6NB0cpAbSODYF
         M8kbdYrDjnFoKZN7EFoK018rJSVkrMBnjvPyqOEdhgJp5uVPA51FEsuNEt5HyclVyyyp
         ce/u6bn7gvxKBM4SZ4OL7f832h2xOIYqyD+yTwb2Bf46XHeKIbqEPGwq6Gl34NzY4M/K
         gE/y2z2qXs9bVCY1VXdGvw6VMo9Ls0G/Ozxc4yrjcWWKi8OJStkubhlEizheBfLo49ca
         2jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726616; x=1768331416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11Q8dUO29PtB2BgvNTdqJEjxg/WcHN3+/b9BoeWwkmc=;
        b=JFOr47qReVXvcRO5aTsSPTYJweZDqCubtXeNRgT4Mo8UTES71VTA3SjhCfGQx6B904
         mG/1Dv7voytejAgqbXS+67KBofw93LCemyscwxf3Spz800D97hDO+jN2FmEBC7tOLIMJ
         gq8RKT2ovG0oUMdNBw9DLKtfJ4b1245mrVdLT8Tj2LmzkKLVpx1mxRuWEazUBuK74gD5
         VlpL672LiJOnyLjHf3kuz4Yh6hrG0tVLCavvqu+J6O6VD4aJ7c+FJxU01aq6QkI74SvL
         EE+qGPNfXvhk9KfT3NAYCkZMCp+5MD6lsFnsUBkcMV8OYczOQwh9BqVTkza1oNi8tlVg
         qdnQ==
X-Gm-Message-State: AOJu0YwZisAKBw+l0w6WMnrs61/xiFNMHJssvkiubN9V/HObV7WPCgYs
	TRfk5lz99kC1EVTPlo8alh/OCsSBZtKIdSDz3AEXp9B8Finta3PYuRjAx29mpBkeqWe8mA==
X-Gm-Gg: AY/fxX6+3toi1vPgXis2RGgfeSPhZ2Ybndo9Z2sJ64dqFEs8IL/+WXRtWH+OU3Uuw/Q
	JaCnaTPw9H2SLM4SSXxY2KXa7UA0bWWf+KpD0c9kFgjFjvTzXaQEerVfqRXQLlzzSXY69G9Ewkt
	yqqHbe+lRIvskA2E+VKO2Jicrc569yfTYNO16NuJxzRItCspGocpCz1YUeSh9Ga9UtLZu4AkZNU
	EdXHtj9oKpt8ncm39rUydhfuKwDZ5UGOdAMOExv/eYyUuLRDrH1T58/AdhsAmRuYmQqenzwe4yp
	hv8Rk4uif/T/tiMF9BhbgwrNcOcitA+zya1xfv2EBbbEjfLCmqg5pQkD193MdZEQaUJY05dW6rB
	B6aIwnMV+lFSm0gr2YJBvpUNVxw7BcPwNfD701nssAi1myBdxp8lJGhqTkJkqkdWUk1lYJzCeYz
	6VZSbqCUe4mfr1/YfldnHkhn74tusUQEbSjszfBvg134R69tHvOxkpQrg=
X-Google-Smtp-Source: AGHT+IFV7wzWK8tjiGlzi5lHvXfLxNPJW8sV5eYK84rSaW035ZciWJiQ3B8kQU2JazokCFdS+wjgNA==
X-Received: by 2002:a05:620a:bcd:b0:8b2:e5c6:b4a2 with SMTP id af79cd13be357-8c37eb59e96mr414642085a.1.1767726616404;
        Tue, 06 Jan 2026 11:10:16 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51c05csm220480485a.30.2026.01.06.11.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:10:16 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [[PATCH v2] 2/4] generate-cve-exclusions: Add a .bbclass
Date: Tue,  6 Jan 2026 14:09:59 -0500
Message-ID: <20260106191001.3385117-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
References: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228918

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
-- 
2.43.0


