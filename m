Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAAB6B3F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 03:36:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r723avwc021022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2013 20:36:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 1 Aug 2013 20:36:56 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 11:37:08 +0800
Message-ID: <2743307e4802ce4564558a9dd9da55b039247040.1375414558.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375414558.git.Qi.Chen@windriver.com>
References: <cover.1375414558.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] buildtools-tarball: do not export OECORE_NATIVE_SYSROOT
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
X-List-Received-Date: Fri, 02 Aug 2013 03:36:57 -0000
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
Thus, instead of exporting OECORE_NATIVE_SYSROOT, we use a comment here.

[YOCTO #4939]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9771497..1e46308 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -59,7 +59,10 @@ create_sdk_files_append () {
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
 	touch $script
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-
+	# In order for the self-extraction script to correctly extract and set up things,
+	# we need a 'OECORE_NATIVE_SYSROOT=xxx' line in environment setup script.
+	# However, buildtools-tarball is inherently a tool set instead of a fully functional SDK,
+	# so instead of exporting the variable, we use a comment here.
+	echo '#OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 }
-- 
1.7.9.5


