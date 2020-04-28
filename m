Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6714.1588078791518335936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 05:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03SCxJp2019087
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 05:59:40 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 05:59:27 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
Date: Tue, 28 Apr 2020 15:57:46 +0300
Message-ID: <20200428125747.27422-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Extend the functionality provided by commit [1] to the SDK as well. This way we
can make sure that nativesdk-binutils finds SDK libraries first rather than
host ones.

This is useful for example when trying to build the linux kernel using
nativesdk-gcc. This scenario currently fails because it tries to link to host
libraries rather than SDK host ones:

make x86_64_defconfig
make bzImage
...
error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel
Makefile:1101: recipe for target 'prepare-objtool' failed
make: *** [prepare-objtool] Error 1
....
/../../../../x86_64-wrlinuxsdk-linux/bin/ld: /lib/x86_64-linux-gnu/libpthread.so.0: undefined reference to `__libc_vfork@GLIBC_PRIVATE'
...

[1] 15049c610b [buildtools-tarball: Add an ld.so.conf for nativesdk-binutils]

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass       | 5 +++++
 meta/recipes-core/meta/buildtools-tarball.bb | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ef0d8bef58..6a1ebc8c02 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -185,6 +185,11 @@ fakeroot create_sdk_files() {
 	# Escape special characters like '+' and '.' in the SDKPATH
 	escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
+
+       mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
+       echo '${SDKPATHNATIVE}${libdir}
+${SDKPATHNATIVE}${base_libdir}
+include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 }
 
 python check_sdk_sysroots() {
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 977b6a5e1d..c49802eef8 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -76,10 +76,6 @@ create_sdk_files_append () {
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
-	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-	echo '${SDKPATHNATIVE}${libdir}
-${SDKPATHNATIVE}${base_libdir}
-include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
 		echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
-- 
2.17.1

