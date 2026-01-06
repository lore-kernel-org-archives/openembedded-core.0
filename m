Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445D4CEFD00
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:42:12 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98754.1767728526290531053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 11:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvC4rlj3;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8b29aebdf3cso24537485a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728525; x=1768333325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=emZ9me8L4mWzW2gz1B1t3T54K39BOjKLhz9DWA2euFA=;
        b=fvC4rlj3l8ZjMYfwff6ce9JlQOmLTZ/yWM2kdqPNjWauDtVqIIgOw7xkqXItKc84cr
         P2RTlsUVEkeJoNfhU89FrJ+5LSAlqVu9u7h20emFHJCzuWgvi4R5QEXHZNyFEgPSr4SP
         KWe+FeL/EYa+60zk8UO6DlVRDyyvngJ6IO8MO5RJPBNrqujI+iGtAZKvs9GGeiCOmusT
         K97+5AUKLBtuIT2r6a+3FUTVIgwoBIOlF7a4Ytkd13GMdx+3L1Fv2e/z8sKQXpAxSdxK
         G/L0j3KaAKlVIGTA5DeY1alRivtoZa8boGDjQXKBbzyr+oKHtTDuJSnPbAFT/mzfFgdY
         Z5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728525; x=1768333325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emZ9me8L4mWzW2gz1B1t3T54K39BOjKLhz9DWA2euFA=;
        b=ZuYKaTrx7X0c+bGG1r4TK2qGoqjAOb4GJIeLf/YvsSsuxsC876IY2M5iabgVZsfoL9
         ckY305t6H8AXSoXlTuGebeiLom8Hz4Ydn0bxl1NFBvwTrTOjHAWbV8MpvGeewVXL19XM
         k1sgc0VjAhYNKpZWgw4aFcEnfSvl+4l7MNYpMHMqkykGLGe1gKyZhuc1O3me72AWx/0j
         fE16/1QmIPDzjlBpPhpyitQ6tppJxp1suzvi8yn3oER1ca1sXf0K5q87b5V9wZGc5RuJ
         vJruCMVSi+zN2lPd8AtQJcJXrpMiIRVCbT9rKrsaDSce8/Y9zBLCO8HG0Kq5Php8juG/
         HG/Q==
X-Gm-Message-State: AOJu0Ywbglh5K0JHbhhIbNlFLCT+h7xBJ4iGBjGw8Bmd/hWL77p46Yr6
	+IPem9ok/Grh1cwVgoEBjtb5RP46IV0+zss/DKtZPntvBZpq3nTkXd9Z9M+5fqNr6PaZVg==
X-Gm-Gg: AY/fxX7UOM2S1LNo7KwjTT3VPHL1hEKfVhTVJaD8EjVTf1QxFC87/FvZmya48vQKPxB
	mZNy0jPurak6VWHMMgCOSuk5oiD9KqyxQWp1p+Pdh1sL3t61nvz816wJ0Exi+qEvUAVhro6ioZi
	GOkMJ1v2QquWHYK+21jXaWsd84dLVgk6BJn0i7SKrXnn5Vv7xXPRra4CcZZu9EssqY5Ly4TxaRT
	UazD49/6QnE4BnI4ept/Hrhm0Zb8Pgrsl5b5hiaw1quTuTiYZJyaTFLcRS7zq6jhxT1FXt6SbVl
	kbXjtWFf07KUEDC0/4KmwQf3uebR/4dUZJ8KRey1x/QzYBvhbTFb0EUa8JJ57sjFDgEg/hSFP7e
	MVpc7jRyejMCbPLs0b3FA41J7CaM0IVZKJvdMv1MpF4nZwGbJWl8DzVhgaGoBBfYHmgos1zx+36
	abD0UevRoFKX2doDGiwC+jPIaSf/mq6fxRfHz5m0ZxYoi4heHOszjtOW8=
X-Google-Smtp-Source: AGHT+IGTUN6p2sa35c6NEIMZPsSFQ4GfVbsResMaqUYL6yNy+qDUcDKBgypBE5i5SmscPhBVtslJ9g==
X-Received: by 2002:a05:620a:29c1:b0:89d:4a69:1502 with SMTP id af79cd13be357-8c37eb76e90mr413723585a.3.1767728525050;
        Tue, 06 Jan 2026 11:42:05 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53129fsm224702485a.44.2026.01.06.11.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:42:04 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH] improve_kerne_cve_report: Add a bbclass support
Date: Tue,  6 Jan 2026 14:42:02 -0500
Message-ID: <20260106194202.3402355-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228923

The script improve_kernel_cve_report.py doesn't have a bbclass.
It can be usefull to have one to generate improved cve-check files at
every run.

This new class can be used to generate a new file in tmp/deploy/images
with a .scouted.json in addition to the existing .json cve-check file.

The new .scouted.json is based on the cve-check file and the SBOM (SPDX3
mandatory) to generate this improved cve-check file with extra entries
found by the script improve_kernel_cve_report.py.

It only requires an inherit on an image recipe (e.g. "inherit
improve_kernel_cve_report" in core-image-minimal).

It can be add to core-image-minimal in a second step if revelant.
---
 .../classes/improve_kernel_cve_report.bbclass | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report.bbclass

diff --git a/meta/classes/improve_kernel_cve_report.bbclass b/meta/classes/improve_kernel_cve_report.bbclass
new file mode 100644
index 0000000000..5c496252b4
--- /dev/null
+++ b/meta/classes/improve_kernel_cve_report.bbclass
@@ -0,0 +1,71 @@
+python do_clean:append() {
+    import os, glob
+    if bb.utils.contains('INHERIT', 'create-spdx-2.2', 'false', 'true', d):
+        deploy_dir = d.expand('${DEPLOY_DIR_IMAGE}')
+        for f in glob.glob(os.path.join(deploy_dir, '*scouted.json')):
+            bb.note("Removing " + f)
+            os.remove(f)
+}
+
+python do_clone_kernel_cve() {
+    import subprocess
+    import shutil, os
+    check_spdx = d.getVar("INHERIT")
+    rootdir = os.path.join(d.getVar("WORKDIR"), "vulns")
+    # Check if the feature is enabled and if SPDX 2.2 is not used
+    if "create-spdx-2.2" not in check_spdx:
+        d.setVar("SRC_URI", "git://git.kernel.org/pub/scm/linux/security/vulns.git;branch=master;protocol=https")
+        d.setVar("SRCREV", "${AUTOREV}")
+        src_uri = (d.getVar('SRC_URI') or "").split()
+        # Fetch the kernel vulnerabilities sources
+        fetcher = bb.fetch2.Fetch(src_uri, d)
+        fetcher.download()
+        # Unpack into the standard work directory
+        fetcher.unpack(rootdir)
+        # Remove the folder ${PN} set by unpack
+        subdirs = [d for d in os.listdir(rootdir) if os.path.isdir(os.path.join(rootdir, d))]
+        if len(subdirs) == 1:
+            srcdir = os.path.join(rootdir, subdirs[0])
+            for f in os.listdir(srcdir):
+                shutil.move(os.path.join(srcdir, f), rootdir)
+            shutil.rmtree(srcdir)
+        bb.note("Vulnerabilities repo unpacked into: %s" % rootdir)
+    elif "create-spdx-2.2" in check_spdx:
+        bb.warn(f"improve_kernel_cve_report: Extra Kernel CVEs Scouting is desactivate because incompatible with SPDX 2.2.")
+}
+do_clone_kernel_cve[network] = "1"
+do_clone_kernel_cve[nostamp] = "1"
+do_clone_kernel_cve[doc] = "Clone the latest kernel vulnerabilities from https://git.kernel.org/pub/scm/linux/security/vulns.git"
+addtask clone_kernel_cve after
+
+do_scout_extra_kernel_vulns() {
+    spdx_file="${SPDXIMAGEDEPLOYDIR}/${IMAGE_LINK_NAME}.spdx.json"
+    original_cve_check_file="${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.json"
+    new_cve_report_file="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json"
+    improve_kernel_cve_script="${COREBASE}/scripts/contrib/improve_kernel_cve_report.py"
+
+    if ${@bb.utils.contains('INHERIT', 'create-spdx-2.2', 'true', 'false', d)}; then
+        bbwarn "improve_kernel_cve_report: Skipping extra kernel vulnerabilities scouting because incompatible with SPDX 2."
+        return 0
+    elif [ ! -f "${spdx_file}" ]; then
+        bbwarn "improve_kernel_cve_report: SPDX file not found: ${spdx_file}. Skipping extra kernel vulnerabilities scoutings."
+        return 0
+    elif [ ! -f "${original_cve_check_file}" ]; then
+        bbwarn "improve_kernel_cve_report: CVE_CHECK file not found: ${original_cve_check_file}. Skipping extra kernel vulnerabilities scouting."
+        return 0
+    fi
+
+    #Launch the new script to improve the cve report
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
-- 
2.43.0


