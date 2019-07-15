Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA8A27ED80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 11:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 781A9183AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:55 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CZde1wit_Dhn
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 893B9183B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 726381A06B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 675641A069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 5BD2CFC4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x6FBPp0c031971
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x6FBPpbs031970
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Jul 2019 13:25:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 13:25:48 +0200
Message-Id: <20190715112549.31924-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] meson.bbclass: Remove the MESON_*_ARGS variables
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
X-List-Received-Date: Mon, 15 Jul 2019 11:25:55 -0000
Content-Transfer-Encoding: 8bit

The options in ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} are already passed
via ${CC}/${CXX} and there is no reason to pass them a second time. Thus
we can remove MESON_TOOLCHAIN_ARGS. And when it is removed, the other
MESON_*_ARGS variables revert to the standard CFLAGS, CXXFLAGS and
LDFLAGS, so just use them directly instead.

Apart from the obvious improvement with not passing a lot of options
twice, this also solves a problem where -pie would be passed on the
command line in a way that it would prevent building any dynamic
libraries using meson if using a toolchain that is not built with
--enable-default-pie and if security_flags.inc is used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/meson.bbclass | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0edbfc1815..70b3653738 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -30,11 +30,6 @@ MESONOPTS = " --prefix ${prefix} \
               -Dcpp_args='${BUILD_CPPFLAGS} ${BUILD_CXXFLAGS}' \
               -Dcpp_link_args='${BUILD_LDFLAGS}'"
 
-MESON_TOOLCHAIN_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
-MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
-MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
-
 EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
@@ -78,7 +73,7 @@ def meson_endian(prefix, d):
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -95,10 +90,10 @@ llvm-config = 'llvm-config8.0.0'
 
 [properties]
 needs_exe_wrapper = true
-c_args = ${@meson_array('MESON_C_ARGS', d)}
-c_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
-cpp_args = ${@meson_array('MESON_CPP_ARGS', d)}
-cpp_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
+c_args = ${@meson_array('CFLAGS', d)}
+c_link_args = ${@meson_array('LDFLAGS', d)}
+cpp_args = ${@meson_array('CXXFLAGS', d)}
+cpp_link_args = ${@meson_array('LDFLAGS', d)}
 gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
 [host_machine]
-- 
2.21.0


