Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADEE731C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:38:32 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id 203so20131875ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+rnZs7SjxPFy0Zwasf4y5/jWfgDdABe6LP5LG7F+uww=;
	b=XkOOSN4Suq4NpL2zuRYANh+SJbd+S6nuYW4gPJUuOOnAcZpWx0xnIXd/JY31HdlEJO
	Ky6qhV9d+pFeEPPOWPJU0pEQAGZYRvWjasJg8PLoKAHWobl81gcZzAAZHKZhI9XKSjDx
	aZWSarUi1tKHFWYUJfVeOLOB+3oFmBI6j3WfNi+jTPPNX7ptLdlt4rOO5cJZ23j+aajP
	L9a8HTIoTyFscukvccHyce3CM1Xb1eS57z5MjWX8wUySGWtS+YMLhAN2Jc281SfFN8eR
	xesBlQFTmas4CyZYmvKUDqACsFZNcNwfcEPg4AozOzl8WEM7Wka68Xc5eP2/zjNf741j
	PJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+rnZs7SjxPFy0Zwasf4y5/jWfgDdABe6LP5LG7F+uww=;
	b=a4Puqr+xTG6YVEthois4mTIGUjzBQNnrqZgpRctLcb7gUvgKtVTzCAUKirPceQLb7Q
	PjBckMQG9pZqB+Gm7BYzI78m16Qo3d6lGC8NAZfnFRYrIp2G6xjxJ2hEXUFW/w/X1rfw
	mn1/iQ8+TKKcOJUFjYDs30MIHKuIQV8rK8Ou8kyGao9AOTJisCRE175yCRYoYLS7hi6i
	sRGBDSa8YPaaPgza0poK5+LQwkd9YPyyW1/4KTFIXu1Ja4Ik957M77mQs/up+tz6jLvY
	5qDX15Pd+SaUsJA4qePDFDrs3V9nIuXFd7wL8TznQWzoCTOME3DRmRx5FosMyjNpm29E
	25SA==
X-Gm-Message-State: AIkVDXIbt0DoqDUWw5EArTwtf6Mm8jMGYQDyWbFdPLAHXUludT9C0kgb9sCXiliQ5lu4EcNb
X-Received: by 10.36.104.15 with SMTP id v15mr1380987itb.104.1484919512708;
	Fri, 20 Jan 2017 05:38:32 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id e24sm1362361itd.6.2017.01.20.05.38.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 05:38:31 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:38:02 +0100
Message-Id: <32c71c6e0510c09fa47a8f6fe01555bf8655bf53.1484919259.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 05/12] ovmf_git.bb: enable parallel compilation
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
X-List-Received-Date: Fri, 20 Jan 2017 13:38:32 -0000

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

