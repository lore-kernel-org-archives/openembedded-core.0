Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 84E76773EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:31:10 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id j18so62947337ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+rnZs7SjxPFy0Zwasf4y5/jWfgDdABe6LP5LG7F+uww=;
	b=dIwWlInbZw1rHrT09V0alVvaXwEhcwi10pOg2chAhVrMVaIOS+CIB0+dv7EHt7bB/v
	Mo1E9/Gf0/Stx099HgdzuVqxF4R20JGCxULQNlkN26YCUVN5bDm5/1zrAKgdYTyfvJ5i
	RmQwOAT4gDgFPuLwgjbZfV84vI9o3x9VsqZHa7XkhDbyu4+s20UDrBihm+3wAqDTla25
	WIfaI/vrLtCfCN81VrFOsK10FfW7TLq6Bfj7yWaKWBpDsT1lS4O/S+VyKCHFQ0YoszPd
	P9vDwNDZD6hghU4ej8p+4R3ZLSZuMpy3Lfw7aHIMljpIOE1s3SsZPTnfbOH0VB6w2Xs5
	lY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+rnZs7SjxPFy0Zwasf4y5/jWfgDdABe6LP5LG7F+uww=;
	b=LAlavpqKbPe9Jn3RtqC+/P+eEac4nPnbMcLEUZfPay6RdZmWia20L6MlOHNz69HJNR
	fxg7gh6EniGs1L4xrhngRiu1zlVZNU4uuy2pTbj/w8VuL5A/MwmE5Dm+AGZn+Jft8t0q
	bKsstWc4LcP02G2tCzKw/mQEn+vk/w/c67EJxE5qfjzZM2wIABLXfIoPuJ+0vc1zQiIr
	w29+A1SmD+1CXhgOiEoJZuexpiVVd0+3UevlpMeZBEmM+te0tWrQ77d1JA7X9/61VsgV
	KLULumDD6GLC4B9nxE8JHdhVnc2lJTOQza9cszsTNTqaHyqHWpUxsu7Na19Q9YLzgGgV
	ubUA==
X-Gm-Message-State: AIkVDXKmzHgGg/POYY+4MFL57fo9gGU5/KqDtE9H979OHSHsdvG25GS1oGEIAzh8aeDRJr8u
X-Received: by 10.107.8.194 with SMTP id h63mr8728837ioi.70.1485531070773;
	Fri, 27 Jan 2017 07:31:10 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46]) by smtp.gmail.com with ESMTPSA id
	a128sm1542174itg.22.2017.01.27.07.31.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 07:31:09 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 16:30:36 +0100
Message-Id: <490488c41245bf39385a93f6507a5eff3678b3b5.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 06/12] ovmf_git.bb: enable parallel compilation
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
X-List-Received-Date: Fri, 27 Jan 2017 15:31:10 -0000

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

