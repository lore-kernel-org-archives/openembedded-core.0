Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1E56AD3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:36:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5OEauIX000595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:36:56 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 24 Jun 2013 07:36:56 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:47:15 -0500
Message-ID: <1372085235-30550-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] buildtools-tarball: Change the way the SDK is sanitized
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
X-List-Received-Date: Mon, 24 Jun 2013 14:36:55 -0000
Content-Type: text/plain

The previous method of shrinking down the scale of the environment-setup
file would not work properly when the target is configured with multilibs.

In addition, the configured machine name and similar settings could leak
into the SDK naming.  This was resolved by clearing the SDK generated
files and generating our own custom files.

Note, the name of the environment-setup now is suffixed with the SDK_SYS.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index f8024f9..8b68f71 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -49,8 +49,15 @@ inherit meta
 inherit populate_sdk
 
 create_sdk_files_append () {
-	rm -f ${SDK_OUTPUT}/${SDKPATH}/site-config*
-	
-	cat ${SDK_OUTPUT}/${SDKPATH}/environment-setup* | grep " PATH=\|OECORE_NATIVE_SYSROOT" > ${WORKDIR}/envtmp
-	mv ${WORKDIR}/envtmp ${SDK_OUTPUT}/${SDKPATH}/environment-setup*
+	rm -f ${SDK_OUTPUT}/${SDKPATH}/site-config-*
+	rm -f ${SDK_OUTPUT}/${SDKPATH}/environment-setup-*
+	rm -f ${SDK_OUTPUT}/${SDKPATH}/version-*
+
+	# Generate new (mini) sdk-environment-setup file
+	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
+	touch $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
+	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
+
+	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 }
-- 
1.8.3.1


