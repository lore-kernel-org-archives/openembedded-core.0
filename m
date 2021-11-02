Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646C1C433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 19:57:30 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.584.1635883049243947166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 12:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=g4t78QfV;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635883049;
  x=1667419049;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IRbA2+1lPBPdBFu+IVKi0LWchqj1qivSWO022PqZpYw=;
  b=g4t78QfV9EMVfJbsZUVPg4F17S9ect4wjDLB8HTdnRO2oY8lCteQ5Rh9
   GSHnivGcX0KLylNUojZAAbWBaJ4qQG+eCc1rF9BF0NDWjp5RnrFN7Jqbk
   Ej83uNdV7TlL7fF0gunudWlxUPrlXgcwZADRXumq71NvnLwqPUoVEV8N4
   pNlJWNZNBVQj5Y7bNFclr5RqUQBVJbjA+QR3zio1tXUyxNjRVne26H34Q
   U3hsuvQjb67780feUdU3Tz29Z+ltUFxbJom+azn+TkumAkSWcpaQQZBvi
   geJnxDGl42xK5gdN3dFE+L8cf/ZsA9CSrRaiRBGcYSrhdmUTbooC19SgK
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv5 1/2] apt: Do not install /var/log/apt for target
Date: Tue, 2 Nov 2021 20:57:24 +0100
Message-ID: <20211102195725.26219-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 19:57:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157812

/var/log is normally a link to /var/volatile/log and /var/volatile is a
tmpfs mount. So anything created in /var/log will not be available when
the tmpfs is mounted.

Also some whitespace clean up.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv5: Only remove /var/log/apt for target.

 meta/recipes-devtools/apt/apt_2.2.4.bb | 30 ++++++++++++++------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_2.2.4.bb b/meta/recipes-devtools/apt/apt_2.2.4.bb
index 29fc49fb39..4e710e11a8 100644
--- a/meta/recipes-devtools/apt/apt_2.2.4.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.4.bb
@@ -51,9 +51,8 @@ EXTRA_OECMAKE:append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DWITH_TESTS=False \
 "
 
-do_configure:prepend () {
-    echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
-
+do_configure:prepend() {
+	echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
 }
 
 # Unfortunately apt hardcodes this all over the place
@@ -61,7 +60,7 @@ FILES:${PN} += "${prefix}/lib/dpkg ${prefix}/lib/apt"
 RDEPENDS:${PN} += "bash perl dpkg"
 
 customize_apt_conf_sample() {
-    cat > ${D}${sysconfdir}/apt/apt.conf.sample << EOF
+	cat > ${D}${sysconfdir}/apt/apt.conf.sample << EOF
 Dir "${STAGING_DIR_NATIVE}/"
 {
    State "var/lib/apt/"
@@ -114,22 +113,25 @@ EOF
 }
 
 do_install:append:class-native() {
-    customize_apt_conf_sample
+	customize_apt_conf_sample
 }
 
 do_install:append:class-nativesdk() {
-    customize_apt_conf_sample
+	customize_apt_conf_sample
 }
 
-
 do_install:append:class-target() {
-    #Write the correct apt-architecture to apt.conf
-    APT_CONF=${D}/etc/apt/apt.conf
-    echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
+	# Write the correct apt-architecture to apt.conf
+	APT_CONF=${D}${sysconfdir}/apt/apt.conf
+	echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
+
+	# Remove /var/log/apt. /var/log is normally a link to /var/volatile/log
+	# and /var/volatile is a tmpfs mount. So anything created in /var/log
+	# will not be available when the tmpfs is mounted.
+	rm -rf ${D}${localstatedir}/log
 }
 
-# Avoid non-reproducible -src package
-do_install:append () {
-        sed -i -e "s,${B},,g" \
-            ${B}/apt-pkg/tagfile-keys.cc
+do_install:append() {
+	# Avoid non-reproducible -src package
+	sed -i -e "s,${B},,g" ${B}/apt-pkg/tagfile-keys.cc
 }

