Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA7ED73E8E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 21:10:22 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25890.1769721019802060966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 13:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ke3xJwIQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8946f000d75so1859486d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 13:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769721019; x=1770325819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF+NAd+xB0whLcp0r0w6eP2XbiHLAttvuw3ON64g3X4=;
        b=Ke3xJwIQ3MKZaAZInhGNKBnpq0ogxwYDHAqSylO5UDy9Hri0DKnc3AiLGZ7c7GcIZL
         smXbr1CMozl3Sb7Pl7STVBhEXnULSaFDLAYdMv2SvOFWE4SX34B+mj0/h/dpJ/Fn+0dt
         +RxP8JOALYQjDXSvj75P0Kw9OmdPvT2+iLuR7Oc1rbgjouPEy1MZJCTl4ZnL0uMmMehp
         5lIJihClu0IpF3gFSa6UGWz3be4OeJqeCmyI19mp9R7ZqsjcgjJMnhfLFmP5Y+JR4l5o
         LzdQW0jO1AhMHM6s8PY6p4c6FK/HudzFrvUD6idiFUSbVNDVod9PEv1e/eiHDB2MPc7k
         N2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721019; x=1770325819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WF+NAd+xB0whLcp0r0w6eP2XbiHLAttvuw3ON64g3X4=;
        b=UEiZyWxkHZPgHFS4Ts2qkRIGccMgr0i16yC4jL3hzKoGU5Aad/NpJT4lqMAoRQgrry
         E53BFS684aFEpdneFbQ+ktc2zYT7ihMFV1Sn7QvOO2V04vI98zyKtdOwVwc1PNTT1stX
         RkRxUTftFB1oKEGu/exCHr7Zy7Jyr2w9wBDmDmJXPw7KvL7sw3BxPasddBTZcem3TqSe
         XqMeK3okhUzp9FRWdDlWJJ6jM7bRdcpyCiLDpnH0dum5zpf9GH+lgK6E8qzWJ0J6VnJ6
         3LGzCcTmxSPbVu5EnMpEIaKbXd3+N7Ua4ANkZYGxFaqdkMLPnb5lYhMsam8731QSD2vh
         vsBg==
X-Gm-Message-State: AOJu0YxUpSrzXeaPke/nBMDKtWg7lOdU60ARm8DtTekrIfPQKwD9cVHm
	sng1vvs0AE7OGeDPD6jDUgDCd6eBjbex22Viau9TL1yeI9Y5sc+rfnV09iI25Mq2Y5q8WQ==
X-Gm-Gg: AZuq6aIiVOl6jNDXUJUmnAJy1+qsMpEwO1gTnSa+SFLOUFvm5adjJBwz9WreW71GC6P
	a1Q5WtzBgG/M3jEGJSLfWbJ1H0NC0FriDp9hErw/jCUK2PbYLreQi78pXoL6jX+Kgd/5NGMjNsf
	SbWf4RqMrrckUU9OP4QDRKsuFjis72AKBMrXJBP4sb6b9UKCpVqvSYpQ6I4IDfM9+AVo0gDjxb0
	ILOTMtkdT90KBjgzsr0HktFf3Yqj/m6EjQNR8y9qsZ+lk9RggoC7CBy8dD8Rpq9PZNqdYm80QRM
	4I1C1RIf/k8PZ7Rulf/vt06pVbAIoRryPFp+lDlb6ZcWXw20TryC9K5rj9+urjW9C18fifuD3FN
	GYGHqS2viOYzxr/I5HGvgdC0rrfQNwyXZMf7CdHW88kNLpLoFzjyQXivN0tFvEWqlkXIkOH6iD2
	V4JrWwPP5iydiiUysKIqql/gYHFY9lLdYkzBJJu8ALKFEf15cav3hccNw=
X-Received: by 2002:a05:6214:6010:b0:894:9d32:6160 with SMTP id 6a1803df08f44-894e9db4741mr9638766d6.0.1769721018723;
        Thu, 29 Jan 2026 13:10:18 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a5fb1sm45251326d6.9.2026.01.29.13.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:10:18 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 3/4] kernel-generate-cve-exclusions: Add a .bbclass
Date: Thu, 29 Jan 2026 16:10:11 -0500
Message-ID: <20260129211012.623827-4-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129211012.623827-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260129211012.623827-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 21:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230162

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

