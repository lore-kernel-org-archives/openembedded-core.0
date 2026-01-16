Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042D0C982F3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:12:57 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5245.1768590771225402927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e43tN0s3;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-5014501ba93so3385561cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590770; x=1769195570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRT8r2i3a5t6omSLB10XNVu77c4TvDHGSPBgsb/7Vok=;
        b=e43tN0s3+c4FzKNt5nYqkrcWX2iyw6Qs773BQOvdIivJV2tclZBqp3AZ4nFxtsmW+M
         VBV3YUwY6qLZuiO9TAdoGEGqefh//cDHYNiDi4zP0hLtkiUm4eIoB/7ARGSVSXjZHFNm
         aHNGo79PSX5g9pRiiEI8IgYAiuKJnhbaUGsXBfH8tZF8Vn1DMGTpQYVzZXlbtU5mi7zO
         ccqZ5zDuIWdme1t8X001uy4LOF2OkP5eGoyBGVH+sl920mzoJlACbTjHKIZypdk3yalz
         ZGwQL4iS9aI6CC/i+JbxsjTPpXKpNs3FRp6U44qgc11JWWvj8CbCz5JGn87oj0unW0oH
         qevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590770; x=1769195570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dRT8r2i3a5t6omSLB10XNVu77c4TvDHGSPBgsb/7Vok=;
        b=HKmwzEy0KcyFhOWhoHYRWPq7NFHmZKI90CCVD634lASvj9SaKloNx9TvdHDUnUXxAS
         rkFb78dm21PGc9RB4TcNeYeZAXtbJV4wIdxnKkcBGxvJifYHi6ILeB+x5TCZTTS4rbeK
         382KBX3fhL1VNsCaMToqkC86Yx9HAzZ6LaJ3ZGrzoqxAJ5CUNe0fjsKpn9Xri0ylNJNV
         KOYHmOQB6K6VmUwNWSm9iTfCS+kTrE/tzk4kNufoqlTQ+myEARmJ+xz3f7SqTSGm0IhY
         lAnwU3gMmAfu7W0/6jy9UqRceboIhNnynYt8E3QFOtt/GjRdOWDHfTd1ztqTsRln/y0Z
         uEwg==
X-Gm-Message-State: AOJu0YwRFQBsR5t8Ckd/AG+gVxYPib2QOSkIQr2mpJJ1eTw3UaP91MFI
	qwqf/qtvsAklgD7QILdMX1BejEhOBGhgr1UAnBbgcSBsnSEMjqlmDP3UfCe/YhQjPw6cIw==
X-Gm-Gg: AY/fxX7BnrxakIGIJme9ur1u97KHfFJSM9RSqJCkgFXxvFI/5vMsB8l1EfInYJhutxI
	pUdOE4CS7miCCEg6fWBowHuUC0wL+MzfC55XHLNMYzbrFcjfvG2a1hxPf6yn8WXR8ubz/VzKM+W
	/NdMZcIeptNb8a8g7u+Kdy9G62vKXQRU9cHjnhmzKj44JLW2mbc5FFRRA6WwhRqQS+Ac5TzHB8e
	4OvrgCsZBgID9EoMVnwJ0LihYdeNShbcxyFgLixbEvXmrf+1aQC2O2tueCfn82gZkVfFvIYD3Jj
	7Ui11XKkypVSuCQyTx6VRcN2InVTMMbVBzuSdUmhA9yTbaybWxWtpLUPy3oN/Y43+p9ydQbq6Ks
	BgiBDsHE/xrWUBM51U4I2eXH8cFLwPQD7f9Vs6F3RhNyMvzCLUjCpBzAK4bYEt6pQu6vmOTaMAw
	xRxjF8QwiSz2dfPAeNadCzNQAKa7roF1AqmzwwBuruTTEAAkFQlu65q+Z5wY1gJJyW5A==
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c6a67cb0bbmr423073385a.10.1768590770017;
        Fri, 16 Jan 2026 11:12:50 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71bf2b0sm287446685a.12.2026.01.16.11.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:12:49 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	antonin.godard@bootlin.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH 1/1] improve_kerne_cve_report: Add a bbclass support
Date: Fri, 16 Jan 2026 14:05:15 -0500
Message-ID: <20260116190520.118714-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <188AFCD98EA3E578.3200434@lists.openembedded.org>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229557

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

