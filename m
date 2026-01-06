Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE3CCEFD0D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 21:02:13 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100603.1767733327007487738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 13:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VMtu7e0W;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8b2da4fb076so22216985a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 13:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767733326; x=1768338126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRT8r2i3a5t6omSLB10XNVu77c4TvDHGSPBgsb/7Vok=;
        b=VMtu7e0WPa6Lmpz+UTO96v3W7Ou47S11e8qvmXclkWe34m7Vbi6zIJaEgL9MrMPVW1
         qQQlpT8wpAbbkV2Na+GZx/DBmFWc7XEX7mtcbBebybHknSadZmhb1yTAsNHXir/mUuqG
         4xlScNcXt1hf6l0VF6YGbImSirFMGPra5W1GU77UabjfcBj0fICe83tysuLkGuKSeUnX
         audzm5zls4fItmRONhgPhEd6jLv3UkGLkhpZp7Gdo9wEVJqHmOOgnYocSDS/NfbpAT1k
         5f6HC8cwhbl0+fuWcTlq0VctQ16L/iyBcSayP0Rfwm/Sly7RklBaYr2NiCojeLR6zVA5
         Mwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767733326; x=1768338126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRT8r2i3a5t6omSLB10XNVu77c4TvDHGSPBgsb/7Vok=;
        b=RRSRjl6RqLyHT5bXzv1+xG7FGDo25eTY+f3e21BYq7INh0ewRthNwiVToqWqq5hprm
         nhkXuDOx2duGNISNl2RtucK2Q+zLUPx/dq5wKxWxw5k49ZYYG1uUN+UiXxQ24g2LDJNf
         ckrR9D6ZDMsWZRf9JIb/mwi/TClvLpbrB7sZMEul6O9iiDbUH6bdnp7+/CzlTtUyf98P
         0Zb/VhmndFWRX1wGqGRvK+0nualJEql9UKtmz5/l0VbQAqWWrzhSXTRD+TpcbWyAUdhI
         aOqVCGzXgmXD2J33HFjfaQKIjMDQCB58ivoI/N8zKcOyVXNpKqtuJGzefhRkfcf/i3sD
         eZew==
X-Gm-Message-State: AOJu0Ywn9lT5Dsmt26n33LiLFFdHGt6AlUhP9n0vP7KPGoF5sTxX+6df
	OkAKTh4buzuccfpVj5mEN5Hm8S7i0dg/bmkGBulGmTqAATgSDNIQI3NU3albMDH7pL5WhQ==
X-Gm-Gg: AY/fxX57PU2JVsd13kG+EmgT1gvibPnM1n5Z3gQbgSA9oPGfaoFdh7vexiGnsG2E5+p
	8IHPIUJHsfnQ2DcJSdZkvAAtkvOHqcj888jB/sQdacbWo3+54XUVOe6F34udkGE9mKvXdi7rH4n
	zPtLKKcKslOXcyLqVrga4kwdOGnNp8CVwxR61AQJSQZXbkfhwgv9X13kQHLZ7QVyaBYVsoAP6Rh
	mRyR/03xcdsZhb3oJIVB/0PWO2/LYetypeWu1tzQZEk8GupSwdwZEx82c8InziYmbEH3e5DjX0C
	nlFqnJCKZX9JWsTIL1nhuotHjnDXvmCfVYFE1UWRcBbnMZZVyjWq4zrhS6PQnPECglCM3dN0mAu
	MFDhz8Sk8YEfCpgXMjt3zAAMUdMIT0U0ZhrN4BK35ag3QinIYpi6tpqKCs8NN8D+aR5eYJPDu6d
	M2oqVC72ye4w4TOcMzOxwF3Qx44ZWDd+qGYZAQXilqOCWVgvxe3jYIOMk=
X-Google-Smtp-Source: AGHT+IHWUlClj1jRvz4HCfkY/WXvh+QmamRkMC0uA3CEJuR1uTHwK0qOMPRgPbaGmiokS0S2kQmoOw==
X-Received: by 2002:a05:620a:170a:b0:8b2:e177:ddb2 with SMTP id af79cd13be357-8c389416d7bmr19047585a.6.1767733325759;
        Tue, 06 Jan 2026 13:02:05 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a97fesm237941985a.4.2026.01.06.13.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 13:02:05 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH 1/1] improve_kerne_cve_report: Add a bbclass support
Date: Tue,  6 Jan 2026 16:02:03 -0500
Message-ID: <20260106210203.3420369-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 21:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228932

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

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
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

