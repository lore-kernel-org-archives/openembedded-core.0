Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id C582871B86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:45 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id r185so51339367ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZrUyGBOqJzIH2vj8WuFB5ia9xj8XgaNNEKViRLT9xyk=;
	b=WYeehh8Ok7b+gFypcmN0O7g8cYxq5rFCs3kRWfY+HGtPDiHUnFP73rN7v+oyW1TZAO
	AWfhK3+Tgdpy8CCFkfUTxQDtLLEzMetkxh1SiG+c3XwYqjXDpLzWcDkklssxkqwCqoAJ
	+ekJwAzaE8leNWu2oGPot9WoTF/PDY6RM/P+ai2geK4fcRCW/wEpvGIax0QNgvjcbTYv
	nblgZvKYeZHCh3WZrwYJdqyQcUchCMXKAOl47XDihqqQ5YwoUPso1IG7gpX5kIQcxEaT
	aEUmR+RGsAqHKy7aV6KyPPDerU1orCv/0hJdZoWjeAFYY9jwchrj6/MDmNYUfOH0th2Y
	U0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZrUyGBOqJzIH2vj8WuFB5ia9xj8XgaNNEKViRLT9xyk=;
	b=WSFvFbFyjk1R3ibOHq8Nuw7Ag0bomxkaPc4jRg0n3xIRsNDd9+sxGGRXv51RGkzZ/8
	gvT4rKwV8Q05oeOBHP776ZZinYcOToY2gilfy54198+XSL1O1QBoewMAPuWk+DPKnC8l
	xBs4txCAgvBDR2OWoskJ1QiMhCi9KE/VF2N0sRETnvCoqzOnNR8MRQq1py0tukX3j0PC
	fmbTW569MafpmTlqz3r/mCCEvbJanzMwgwsABs3kerKpLIbF/5+oECupIMS/wvybEHI7
	fpPJsPPpuPEjfi4st0qKlVz9/0qeWxmGiBnNtyhfQjJNd1kXy9c/OlzoM5MfGhb7ibfU
	BwfQ==
X-Gm-Message-State: AIkVDXJI1szQhaH/MQO+j0Oeg+Suj6mVKAHQxYWbpSl0ODjBbjC2nF5Paajia8m50py3NVXE
X-Received: by 10.36.103.198 with SMTP id u189mr3784159itc.9.1484064465747;
	Tue, 10 Jan 2017 08:07:45 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	m196sm1391971iom.14.2017.01.10.08.07.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:44 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:21 +0100
Message-Id: <7b185d5b891ac55ec7d07c05154acb1ac9dacee0.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
Subject: [PATCH v2 05/11] ovmf_git.bb: enable parallel compilation
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:46 -0000

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
2.1.4


