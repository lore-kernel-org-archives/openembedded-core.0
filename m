Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 451E4771A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:19 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id j18so62127556ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+rnZs7SjxPFy0Zwasf4y5/jWfgDdABe6LP5LG7F+uww=;
	b=kCiLVJjYaWTeeIwPx6u6EWNE7rN6yPLHKTfSCdSOF86pgH2Tex5kIu/tNP986h4FwD
	MqEo6ruAOF1YxawaaqM4togAUwx005oOdSfWwCMtvWTCyhXHBgc22g2wP+DeIx3fPtvC
	FeLXNz/exELIGB4sJaUi6BH9rC/c9wN6YgJIb9eblv0gUrDhIYagI285RWgp+5jUN18h
	rPzOuyS17I80vzkwRHEElfywmL79D5Rrr+hEn+2s7s1cLPN20zJ1zbqDUa5upGB5AQqE
	mXs/f9XkRKmVCh+EY0l0v0VpHLRgS9jlcvkEMmWdkdEmGRi28+1/1JmbKGvpf2Co6Azw
	Qyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+rnZs7SjxPFy0Zwasf4y5/jWfgDdABe6LP5LG7F+uww=;
	b=E2IWD1+ifInoxTpXqa9pzoZi9EpYci74gsrCHOGUM9M9ev21CJLC4HrSdtFTMZheWT
	4P8WbRgXp8ea4lx1wAaN12jTZtswp2MqL8pdAHMu/3CLO7Z1nJqyO78qfjSQqQtfOPSi
	PgEphqTWwxK2Z4azNE4mUC2ObrWEhxIk6tbG51GY03BW2hwYXItnXBtgl3oHoIP7pJL/
	46s9c/JbppgKTQfwS4okZZqdHGmd1RriH0B5FlfjmFrLAiVXHa04pFN/DB6c7c8AtjmH
	Sl6QSD0XopfPPDLGBSp3/WQzOzCiYzi1zTx8rCWyzf4dCPDfb3PGVr/SVmOhml3N2VdG
	me8A==
X-Gm-Message-State: AIkVDXIqpxc4CBTc9EZ5lAg+uLIYV1H7Up60+wQylK96ZIqsVV0ZkZlk4reSTy9jJgCmJCO7
X-Received: by 10.107.34.213 with SMTP id i204mr14396326ioi.203.1484921600424; 
	Fri, 20 Jan 2017 06:13:20 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:19 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:37 +0100
Message-Id: <efdf857fe7212ad4a7d8205f623c5e1a487f68ae.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 06/12] ovmf_git.bb: enable parallel compilation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2017 14:13:20 -0000

The Fedora srpm [1] seems to have no problems with parallel
compilation, so let's also use that for the target. The native
tools however indeed have dependency problems:

| test_Ecc_CParser (CheckPythonSyntax.Tests) ... gcc -o ../bin/EfiRom -L/fast/build/ostro/x86/tmp-glibc/sysroots/x86_64-linux/usr/lib -L/fast/build/ostro/x86/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/fast/build/ostro/x86/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/fast/build/ostro/x86/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-rpath,/fast/build/ostro/x86/tmp-glibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/fast/build/ostro/x86/tmp-glibc/sysroots/x86_64-linux/lib -Wl,-O1 EfiRom.o -L../libs -lCommon
| /usr/bin/ld: cannot find -lCommon
| collect2: error: ld returned 1 exit status

ERROR: Task (virtual:native:.../meta/recipes-core/ovmf/ovmf_git.bb:do_compile) failed with exit code '1'

[1] https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/edk2.spec

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 895ed6c..9989025 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -14,7 +14,7 @@ SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
 
 inherit deploy
 
-PARALLEL_MAKE = ""
+PARALLEL_MAKE_class-native = ""
 
 S = "${WORKDIR}/git"
 
@@ -94,6 +94,7 @@ do_compile_class-native() {
 
 do_compile_class-target() {
     export LFLAGS="${LDFLAGS}"
+    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n')}"
     OVMF_ARCH="X64"
     if [ "${TARGET_ARCH}" != "x86_64" ] ; then
         OVMF_ARCH="IA32"
@@ -111,7 +112,7 @@ do_compile_class-target() {
     bbnote FIXED_GCCVER is ${FIXED_GCCVER}
     build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
 
-    ${S}/OvmfPkg/build.sh -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
+    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
     ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.fd
     ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.code.fd
     ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/ovmf.vars.fd
-- 
git-series 0.9.1

