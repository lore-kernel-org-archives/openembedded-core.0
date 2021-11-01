Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4ABC433FE
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 00:03:56 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.37856.1635725034067232822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 17:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JrjO2o1v;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635725035;
  x=1667261035;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ytcskl8ZsapF9uPbhrJvE9lFtgbG73hPO2+RqCsLoQQ=;
  b=JrjO2o1vXxtYduq4WaHLI1CPvlK4BZvkgugD/CettyrY6gHmw4yFlgg3
   XTKkeIrKvUs+qlRpvrOA8IcGC0qFoIL2PlJcOLXospMpOVhkHlPBg4iGw
   EU9wKVh/vbUDdow+tU3+qR4TtACdG4AEhXu1jxUEJCZqmeZXCu0eONNwc
   KLEUDcFevxHOeup3xCluLl4PPLt+JEi+webqtytjd7voVN7cr+iDD8m72
   2oyWqdd+4J7xB+AkFsfepZYvi1vfOsLJ3j49GO4uPOoyCQvqmQI5Xhdqa
   NQY35f2VqqQWiiWWhaceho41HfvGvM9HXrwJLvSU1wT/LL3m0OlLzUcGj
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv4 3/4] apt: Do not install /var/log/apt
Date: Mon, 1 Nov 2021 01:03:42 +0100
Message-ID: <20211101000343.18979-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211101000343.18979-1-pkj@axis.com>
References: <20211101000343.18979-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 00:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157697

/var/log is normally a link to /var/volatile/log and /var/volatile is a
tmpfs mount. So anything created in /var/log will not be available when
the tmpfs is mounted.

Also some whitespace clean up.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/apt/apt_2.2.4.bb | 30 ++++++++++++++------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_2.2.4.bb b/meta/recipes-devtools/apt/apt_2.2.4.bb
index 29fc49fb39..3d88371169 100644
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
 }
 
-# Avoid non-reproducible -src package
-do_install:append () {
-        sed -i -e "s,${B},,g" \
-            ${B}/apt-pkg/tagfile-keys.cc
+do_install:append() {
+	# Remove /var/log/apt. /var/log is normally a link to /var/volatile/log
+	# and /var/volatile is a tmpfs mount. So anything created in /var/log
+	# will not be available when the tmpfs is mounted.
+	rm -rf ${D}${localstatedir}/log
+
+	# Avoid non-reproducible -src package
+	sed -i -e "s,${B},,g" ${B}/apt-pkg/tagfile-keys.cc
 }

