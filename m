Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C88A3787B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 19:49:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 11:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,405,1505804400"; 
   d="scan'208";a="3105428"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2017 11:49:03 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 11:48:50 -0800
Message-Id: <1510861730-82471-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 4/4] sudo: improve reproducibility
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
X-List-Received-Date: Thu, 16 Nov 2017 19:49:03 -0000

Delete various build host references from the internally
generated file sudo_usage.h. The references get compiled into
executables, which leads to non-reproducible builds.
The removed references (configure options) were only used as part
of the sudo "usage", and even then only when ran as root.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 8c16d83..80ec0ae 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -27,6 +27,12 @@ EXTRA_OECONF_append_libc-musl = " --disable-hardening "
 
 # mksigname/mksiglist are used on build host to generate source files
 do_compile_prepend () {
+	# Remove build host references from sudo_usage.h
+	sed -i  \
+	    -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's,--build=${BUILD_SYS},,g' \
+	    -e 's,--host=${HOST_SYS},,g' \
+	    ${B}/src/sudo_usage.h
 	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC="$BUILD_CC" CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C lib/util mksigname mksiglist
 }
 
-- 
2.7.4


