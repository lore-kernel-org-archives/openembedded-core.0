Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SheOl-0003fn-9C
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 12:13:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5LA3CuR007768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 03:03:12 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 21 Jun 2012 03:03:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 18:04:04 +0800
Message-ID: <43117c408ee5a090f94b1a9638f9056d87be9077.1340272953.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1340272953.git.liezhi.yang@windriver.com>
References: <cover.1340272953.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] autogen-native 5.12: fix ccache issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 10:13:59 -0000
Content-Type: text/plain

The autogen-native built error on FC17:

ccache: failed to create /dev/null/.ccache

This is because the gcc of FC17 is a symlink to ccache, so the ccache
will always be used regardless to the user's setting, ccache uses
$HOME/.ccache as the CCACHE_DIR if it has not been set, and autogen set
HOME=/dev/null.

Assign CCACHE_DIR the default value to preven it uses $HOME/.ccache
would fix the error.

[YOCTO #2554]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../autogen/autogen-native_5.12.bb                 |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
index eb3721d..e80d555 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.12.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
@@ -28,6 +28,26 @@ inherit autotools native
 export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
 export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache"
 
+#
+# The do_compile_prepend is used for fixing a build error on FC17, the
+# gcc of FC17 is a symlink to ccache, if we don't set the CCACHE_DIR,
+# there would be an error:
+#
+# ccache: failed to create /dev/null/.ccache
+#
+# This is because ccache uses $HOME/.ccache as the CCACHE_DIR if it has
+# not been set, and autogen set HOME=/dev/null.
+#
+# Assign CCACHE_DIR the default value so that it would not use
+# $HOME/.ccache would fix the error.
+#
+do_compile_prepend() {
+	if [ "${CCACHE_DIR}" = "" ]; then
+		export CCACHE_DISABLE=true
+		export CCACHE_DIR=$HOME
+	fi
+}
+
 do_install_append () {
 	create_wrapper ${D}/${bindir}/autogen \
 		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-- 
1.7.1



