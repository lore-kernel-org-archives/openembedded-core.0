Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id E4015772C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:46 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id o141so29829999itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rVv/kq8x39BPMqdQjP2LmeSeAFKqM9Le7RBCWkFTr64=;
	b=ddUwSqzmsGxdZzaCvjw2OIG8+cMSh5HvxDnkkOCXG1/7guo8RMbT+fF2OUeQpm1jBC
	JN41RJ7Bn5QxK2lCkxfhovkvIyPKWCnPHIuf97VwuyjYUugDANGRBXYKFbQD0p6prG+e
	RR9GjJRdbTYQJlF5oKWCGuREWZmLpUTdGAqJCYQ5UUKfQ34A/1oPTRDgFuFikvRVMGCL
	HjrRkriXLo/S+rDx+2Vr5Gt6zM4ObLduSkRpCHMFhh97wH2I00RzJmLwm90ywS6D64aY
	U9UmTv10zrcfbvvgL44lC4jIDhse1+Iz73XNZXQMfwzsJcH0sm1ChMJhK2d8gR3TxtB2
	qPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rVv/kq8x39BPMqdQjP2LmeSeAFKqM9Le7RBCWkFTr64=;
	b=K72fE3BtboVAA6QW2C/CVTs8kiasNinYJcKRhqUtpmDHn/VMR7J52MCrqGZqYuVsu8
	7/TFvsDzarTgv0d+4N+ECjJZUFBJsUSmGOF9xT9UySU94LkcaYZKX8X4JEKbTOFJUnne
	r+DhW1zJ6haIJbENnTTd4/T576YPvALo/LiNq7qVFRcjqcGlbhh6yeiTOslhoZVfl+w1
	ccdgxq2iHdz4o5FztlYc6Y+wf3ZU+8a3ZDB2ufBL3Tbp0UPtvf5/J8bAH8b2btNlCUJM
	+JWW2ntLaW1YOFgmfn2i+03TCcwpT5JbQgn8At7bJnwYiQERubYSCWnc7Blsv/zE5gp4
	701g==
X-Gm-Message-State: AIkVDXJCDZQEuGQA1XK4bDGOaWcnCGQiXyesyri4Q/4cBkm6TVK9n+L9npGTFI8f5dkSjpAN
X-Received: by 10.36.60.7 with SMTP id m7mr7444093ita.7.1482325907715;
	Wed, 21 Dec 2016 05:11:47 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203]) by smtp.gmail.com with ESMTPSA id
	o65sm12103726ioe.15.2016.12.21.05.11.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:46 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:26 +0100
Message-Id: <3b1fda1a385e78c1ef5692b123fafd66078a2a5e.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
Subject: [PATCH 5/9] ovmf_git.bb: enable parallel compilation
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:47 -0000

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
index d0441d1..67e65b8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 
 SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
 
-PARALLEL_MAKE = ""
+PARALLEL_MAKE_class-native = ""
 
 S = "${WORKDIR}/git"
 
@@ -92,6 +92,7 @@ do_compile_class-native() {
 
 do_compile_class-target() {
     export LFLAGS="${LDFLAGS}"
+    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n')}"
     OVMF_ARCH="X64"
     if [ "${TARGET_ARCH}" != "x86_64" ] ; then
         OVMF_ARCH="IA32"
@@ -109,7 +110,7 @@ do_compile_class-target() {
     bbnote FIXED_GCCVER is ${FIXED_GCCVER}
     build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
 
-    ${S}/OvmfPkg/build.sh -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
+    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
     ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.fd
 }
 
-- 
2.1.4


