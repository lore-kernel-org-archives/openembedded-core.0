Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 884EE78276
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 20:24:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 12:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,315,1511856000"; d="scan'208";a="164250096"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 04 Jan 2018 12:24:09 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 12:24:01 -0800
Message-Id: <1515097444-25092-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515097444-25092-1-git-send-email-juro.bystricky@intel.com>
References: <1515097444-25092-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/5] gcc-runtime: improve reproducibility
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
X-List-Received-Date: Thu, 04 Jan 2018 20:24:08 -0000

Remove various build host references from packages:

libstdc++
libstdc++-staticdev
gcc-runtime-dbg

The references are removoved by correctly setting various compiler
-fdebug-prefix-map settings. There are two main issues:
The default DEBUG_PREFIX_MAP variable references WORKDIR, however,
gcc sources are in a shared folder (work-shared)/
Additionally, DWARF info seems to store symlink names but gcc
seems to resolve symlink names referenced in -fdebug-prefix-map.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d3d4bd3..7629fa5 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -34,6 +34,18 @@ RUNTIMETARGET_remove_libc-musl = "libmpx"
 # libmudflap
 # libgfortran needs separate recipe due to libquadmath dependency
 
+SLIB = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+SLIB_NEW = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
+DEBUG_PREFIX_MAP_class-target = " \
+   -fdebug-prefix-map=${WORKDIR}/recipe-sysroot= \
+   -fdebug-prefix-map=${WORKDIR}/recipe-sysroot-native= \
+   -fdebug-prefix-map=${SLIB}=${SLIB_NEW} \
+   -fdebug-prefix-map=${SLIB}/include=${SLIB_NEW}/libstdc++-v3/../include \
+   -fdebug-prefix-map=${SLIB}/libiberty=${SLIB_NEW}/libstdc++-v3/../libiberty \
+   -fdebug-prefix-map=${B}=${SLIB_NEW} \
+   "
+
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
 	for d in libgcc ${RUNTIMETARGET}; do
-- 
2.7.4


