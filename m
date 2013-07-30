Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5BFB6B412
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:49:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6U1o01f002886
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 18:50:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 29 Jul 2013 18:49:59 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Jul 2013 09:50:04 +0800
Message-ID: <bc3108ce8eea753d38dc70187fface31e6178e71.1375073005.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375073005.git.Qi.Chen@windriver.com>
References: <cover.1375073005.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/1] buildtools-tarball: unset OECORE_NATIVE_SYSROOT
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
X-List-Received-Date: Tue, 30 Jul 2013 01:50:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

When building a qemu image inside the environment created by the
buildtools-tarball, the qemu image cannot be started, as the runqemu
script uses the tunctl binary which cannot be found inside the sysroot
directory of the buildtools-tarball.

The buildtools-tarball is inherently a tool set instead of a fully
functional SDK, so leaving the OECORE_NATIVE_SYSROOT variable in the
environment will mess things up.

However, we do need a line of 'OECORE_NATIVE_SYSROOT=xxx' in the environment
setup script so that the SDK can be extracted and relocated correctly.

That's why this patch unsets the variable instead of removing it from the
environment setup script.

[YOCTO #4939]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9771497..1f8f142 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -59,7 +59,11 @@ create_sdk_files_append () {
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
 	touch $script
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
+	# OECORE_NATIVE_SYSROOT variable needs to be in $script so that the
+	# relocate script can find the ld-linux.so.
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-
+	# buildtools-tarball is inherently a tool set instead of a fully functional SDK.
+	# Leaving OECORE_NATIVE_SYSROOT in environment will mess things up.
+	echo 'unset OECORE_NATIVE_SYSROOT' >> $script
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 }
-- 
1.7.9.5


