Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7207D7C786
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:30:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5O9The3014114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 02:29:58 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 24 Jun 2019 02:29:38 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2019 17:29:37 +0800
Message-ID: <1561368577-265361-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] scons: fix conflict during do_rootfs
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
X-List-Received-Date: Mon, 24 Jun 2019 09:30:08 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
file /usr/bin/scons conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
file /usr/bin/scons-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
file /usr/bin/scons-configure-cache conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
file /usr/bin/scons-configure-cache-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
file /usr/bin/scons-time conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
file /usr/bin/scons-time-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
file /usr/bin/sconsign conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
file /usr/bin/sconsign-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/python/python-scons_3.0.5.bb  | 14 +++++++++++++-
 meta/recipes-devtools/python/python3-scons_3.0.5.bb | 14 +++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-scons_3.0.5.bb b/meta/recipes-devtools/python/python-scons_3.0.5.bb
index 939c15b..94c2d07 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.5.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.5.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
 UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit setuptools
+inherit setuptools update-alternatives
 
 RDEPENDS_${PN} = "\
   python-fcntl \
@@ -22,3 +22,15 @@ RDEPENDS_${PN} = "\
   python-shell \
   python-pprint \
   "
+
+ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsign-3.0.5"
+ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
+ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
+ALTERNATIVE_TARGET[scons-configure-cache] = "${bindir}/scons-configure-cache"
+ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] = "${bindir}/scons-configure-cache-3.0.5"
+ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
+ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
+ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
+ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
+
+ALTERNATIVE_PRIORITY = "20"
diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
index 7fb75a6..6e240d8 100644
--- a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
 UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit setuptools3
+inherit setuptools3 update-alternatives
 
 do_install_prepend() {
     sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/script/*
@@ -27,3 +27,15 @@ RDEPENDS_${PN} = "\
   python3-pickle \
   python3-pprint \
   "
+
+ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsign-3.0.5"
+ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
+ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
+ALTERNATIVE_TARGET[scons-configure-cache] = "${bindir}/scons-configure-cache"
+ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] = "${bindir}/scons-configure-cache-3.0.5"
+ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
+ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
+ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
+ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
+
+ALTERNATIVE_PRIORITY = "30"
-- 
2.7.4


