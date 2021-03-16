Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.173.1615923486879854026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 12:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E34E0D6E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 12:38:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B7A83F70D
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 12:38:05 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ovmf: make output binaries reproducible
Date: Tue, 16 Mar 2021 19:38:02 +0000
Message-Id: <20210316193802.3145147-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

OVMF is mostly reproducible, but the final .efi binaries have a 'NM10'
segment in that references the original input file, and this input file
has the build path in.

This can be solved by passing --zero to GenFw so that this segment is
zero'd out in release builds.

[ YOCTO #14264 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ovmf/ovmf/zero.patch | 84 ++++++++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb     |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/zero.patch

diff --git a/meta/recipes-core/ovmf/ovmf/zero.patch b/meta/recipes-core/ovm=
f/ovmf/zero.patch
new file mode 100644
index 0000000000..af7a9d31f6
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/zero.patch
@@ -0,0 +1,84 @@
+Pass --zero to GenFw in release builds so that the sections that link back=
 to
+the intermediate binaries (containing build paths) are removed.
+
+Upstream-Status: Pending (discussion at https://bugzilla.tianocore.org/sho=
w_bug.cgi?id=3D3256)
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 6303b065802c9427c718fda129360189b79316e7 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 16 Mar 2021 16:49:49 +0000
+Subject: [PATCH] Strip build paths
+
+---
+ OvmfPkg/AmdSev/AmdSevX64.dsc | 1 +
+ OvmfPkg/Bhyve/BhyveX64.dsc   | 1 +
+ OvmfPkg/OvmfPkgIa32.dsc      | 2 ++
+ OvmfPkg/OvmfPkgIa32X64.dsc   | 1 +
+ OvmfPkg/OvmfPkgX64.dsc       | 1 +
+ OvmfPkg/OvmfXen.dsc          | 1 +
+ 6 files changed, 7 insertions(+)
+
+diff --git a/OvmfPkg/Bhyve/BhyveX64.dsc b/OvmfPkg/Bhyve/BhyveX64.dsc
+index 4a1cdf5aca..132f55cf69 100644
+--- a/OvmfPkg/Bhyve/BhyveX64.dsc
++++ b/OvmfPkg/Bhyve/BhyveX64.dsc
+@@ -76,6 +76,7 @@=0D
+   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
+   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
+ !endif=0D
++  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
+ =0D
+   #=0D
+   # Disable deprecated APIs.=0D
+diff --git a/OvmfPkg/OvmfPkgIa32.dsc b/OvmfPkg/OvmfPkgIa32.dsc
+index 1eaf3e99c6..ce20f09df8 100644
+--- a/OvmfPkg/OvmfPkgIa32.dsc
++++ b/OvmfPkg/OvmfPkgIa32.dsc
+@@ -90,6 +90,8 @@=0D
+ =0D
+ !include NetworkPkg/NetworkBuildOptions.dsc.inc=0D
+ =0D
++  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
++=0D
+ [BuildOptions.common.EDKII.DXE_RUNTIME_DRIVER]=0D
+   GCC:*_*_*_DLINK_FLAGS =3D -z common-page-size=3D0x1000=0D
+   XCODE:*_*_*_DLINK_FLAGS =3D -seg1addr 0x1000 -segalign 0x1000=0D
+diff --git a/OvmfPkg/OvmfPkgIa32X64.dsc b/OvmfPkg/OvmfPkgIa32X64.dsc
+index 4a5a430147..97cc438250 100644
+--- a/OvmfPkg/OvmfPkgIa32X64.dsc
++++ b/OvmfPkg/OvmfPkgIa32X64.dsc
+@@ -84,6 +84,7 @@=0D
+   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
+   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
+ !endif=0D
++  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
+ =0D
+   #=0D
+   # Disable deprecated APIs.=0D
+diff --git a/OvmfPkg/OvmfPkgX64.dsc b/OvmfPkg/OvmfPkgX64.dsc
+index d4d601b444..f544fb04bf 100644
+--- a/OvmfPkg/OvmfPkgX64.dsc
++++ b/OvmfPkg/OvmfPkgX64.dsc
+@@ -84,6 +84,7 @@=0D
+   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
+   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
+ !endif=0D
++  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
+ =0D
+   #=0D
+   # Disable deprecated APIs.=0D
+diff --git a/OvmfPkg/OvmfXen.dsc b/OvmfPkg/OvmfXen.dsc
+index 507029404f..fcaa35acf1 100644
+--- a/OvmfPkg/OvmfXen.dsc
++++ b/OvmfPkg/OvmfXen.dsc
+@@ -74,6 +74,7 @@=0D
+   GCC:*_*_X64_GENFW_FLAGS   =3D --keepexceptiontable=0D
+   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable=0D
+ !endif=0D
++  RELEASE_*_*_GENFW_FLAGS =3D --zero=0D
+ =0D
+   #=0D
+   # Disable deprecated APIs.=0D
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 95ebbcc683..896b3b6320 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0004-ovmf-Update-to-latest.patch \
+           file://zero.patch \
            "
=20
 PV =3D "edk2-stable202102"
--=20
2.25.1

