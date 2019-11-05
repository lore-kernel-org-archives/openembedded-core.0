Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 875647F987
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:50 +0000 (UTC)
IronPort-SDR: 0w07BWDJi8mIjdLJ4MantDY366RjTzYGuzZch1W4mFiV93zsdfvxmgFVt6DZmZy0NfUlgDAxVQ
	JCyITfidJPCYhmAKvaNWn6ONNlqwCWbfAwMON7mE4+Bjy7qUn+wUvig1W+C+Uwq/0iQ1ysxJTB
	JxUMvu8W2bVIasBBki0vGYjSGdOrtk1ssME5IprNmziYgtCQFryHgAxNBPqQF1EIlqrnJwZ7E+
	K1kmkhwqx5Mm6bcCQ+ntcIKKVqDaqzprN2b8SsbWUsKcGgQV5JqKqTaSftlL3f2cQkKPOsxY0K
	9rM=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2200444"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:32 +0100
Message-Id: <3a254e65f99dfb710301a0b3b3ea05e5bb9569e5.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 2/9] meson.bbclass: Remove the MESON_*_ARGS variables
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:51 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/meson.bbclass | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 115d1aedcb..5c0139f02a 100644
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
@@ -76,7 +71,7 @@ def meson_endian(prefix, d):
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -93,10 +88,10 @@ llvm-config = 'llvm-config8.0.0'
 
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


