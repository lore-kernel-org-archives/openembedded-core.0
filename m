Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D293C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 19:26:00 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.10803.1647717958796807115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bBMSVvWm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r13so768716wrr.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MknIQXYjS59Q3xib6N6E64nnRG55ImMIt4PWFVjJKnI=;
        b=bBMSVvWmu/KIq1lMQZFpaFnfknrhWkBDfixXDcR9xKcf7YRd9Y3LVPcmMcVI10EvUT
         m2qN4kVOyhpXHpm946r8todeVYpSLhIIq8Xv9Hlv67im0s+LvjHNjmVtZr8G1+Zz3MsD
         BDaK3XQZoTFKTPRX2cZhNdlXsg8bOp5ta1MIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MknIQXYjS59Q3xib6N6E64nnRG55ImMIt4PWFVjJKnI=;
        b=zfNZEwJKkM16U8xo4gt44ZrTHAeILyOy4f/8dPaTurm+GFpNpkqIqeeE67yND70LdL
         1EE/8DpyjyCfRbTVeuMVNZ0BjwhKuhFqBFjyE4X+iIHrbQLkKf8ZSeMakr1UL2hlKDWE
         YneDhrZAJqrL+1QKYq6Z0NLGdXn4JMyM6QrgM1+t7ecliZtJP7gEe/S2BWRAkN0DaEZB
         2DGEhOwaDunmffxEkKkETj7mAc6WeUjVV4+QnU06mKBWFVCeKivd+Q8knUNhbsMhIQwm
         iw4mOOtbuZAqYkKFS89j2CEo26NL+soAT4fg/WUmnp2s/3zmqEyv5Fu+dkzgKHITjzg9
         J5og==
X-Gm-Message-State: AOAM532jw1DJs7jvVk/EPiuvFbIAWUSwoBh+vK+jth2i41qnlMzrvMOC
	opjSeDz80bQJpHFYZptHsoxjCrHEcXQyAysv
X-Google-Smtp-Source: 
 ABdhPJyyWh3tRyM7+yZrNxMBpNPfvFfcqLcAzHm9Ypre2rounD5jpTBO4Q5Q/Lx9s32aB3/IqlnI7g==
X-Received: by 2002:adf:816b:0:b0:203:7fae:a245 with SMTP id
 98-20020adf816b000000b002037faea245mr12718723wrm.619.1647717956752;
        Sat, 19 Mar 2022 12:25:56 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3ad7:b7e1:8044:d0f5])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b00203fa70b4ebsm4491163wry.53.2022.03.19.12.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 12:25:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [RFC PATCH] kernel: Add kernel-cve-tool support to help monitor
 kernel CVEs
Date: Sat, 19 Mar 2022 19:25:55 +0000
Message-Id: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 19:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163476

This adds support for a random kernel CVE monitoring tool which can be
run as a specific task against a kernel:

$ bitbake linux-yocto -c checkcves
[...]
Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 135 (100% match, 100% complete)
NOTE: Executing Tasks
WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for be80a1d3f9dbe5aee79a325964f7037fe2d92f30:CVE-2021-4204 (NOT FOR THIS VERSION)
WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 20b2aff4bc15bda809f994761d5719827d66c0b4:CVE-2022-0500 (NOT FOR THIS VERSION)
WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 55749769fe608fa3f4a075e42e89d237c8e37637:CVE-2021-4095 (NOT FOR THIS VERSION)
WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 4fbcc1a4cb20fe26ad0225679c536c80f1648221:CVE-2022-26490 (NOT FOR THIS VERSION)
WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for dbbf2d1e4077bab0c65ece2765d3fc69cf7d610f:CVE-2019-15239 (NOT FOR THIS VERSION)
WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 89f3594d0de58e8a57d92d497dea9fee3d4b9cda:CVE-2022-24958 (NOT FOR THIS VERSION)
WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 1bfba2f4270c64c912756fc76621bbce959ddf2e:CVE-2020-25220 (NOT FOR THIS VERSION)
NOTE: Tasks Summary: Attempted 627 tasks of which 626 didn't need to be rerun and all succeeded.

Posted as an RFC to see what people think of this. I make no claims
on how useful it is/isn't but wanted to show integration isn't difficult
and provide some inspiration for ideas.

Details on the tool in question: https://github.com/madisongh/kernel-cve-tool

I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass                   | 10 ++++++++++
 .../kernel-cve-tool/kernel-cve-tool_git.bb    | 20 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4f304eb9c7a..a842747b9d9 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -753,6 +753,16 @@ addtask sizecheck before do_install after do_strip
 
 inherit kernel-artifact-names
 
+do_checkcves () {
+	cd ${S}
+	kernel-cve-tool -P ${STAGING_DATADIR_NATIVE}/kernel-cvedb
+	while read -r line; do 
+		bbwarn "Should consider cherry-pick for $line"; 
+	done < ${S}/cherry-picks.list
+}
+do_checkcves[depends] = "kernel-cve-tool-native:do_populate_sysroot"
+addtask checkcves after do_configure
+
 kernel_do_deploy() {
 	deployDir="${DEPLOYDIR}"
 	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
diff --git a/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb b/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
new file mode 100644
index 00000000000..d2402bae052
--- /dev/null
+++ b/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
@@ -0,0 +1,20 @@
+HOMEPAGE = "https://github.com/madisongh/kernel-cve-tool/"
+SRC_URI = "git://github.com/madisongh/kernel-cve-tool;protocol=https;branch=master;name=tool \
+           git://github.com/nluedtke/linux_kernel_cves.git;protocol=https;branch=master;destsuffix=cvedb;name=data"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=850b17d75c13807fada69140cf7cacc5"
+
+SRCREV_FORMAT ?= "tool_data"
+SRCREV_tool = "eb177abea3745d8576a725646effcce25f34302e"
+SRCREV_data = "b51a576dfbbd4d343b33bed0aa1fc4e095911938"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools_build_meta
+
+do_install:append () {
+	install -d ${D}${datadir}/kernel-cvedb
+	cp -r ${WORKDIR}/cvedb/* ${D}${datadir}/kernel-cvedb
+}
+
+BBCLASSEXTEND = "native"
-- 
2.32.0


