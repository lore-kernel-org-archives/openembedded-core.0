Return-Path: <mike.looijmans@topic.nl>
Received: from jax4mhob15.registeredsite.com (jax4mhob15.registeredsite.com
	[64.69.218.103])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6C66021B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 14:45:34 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.204])
	by jax4mhob15.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	02KEjYUH017052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 10:45:34 -0400
Received: (qmail 14829 invoked by uid 0); 20 Mar 2020 14:45:34 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid)
	(mike@milosoftware.com@83.128.90.119)
	by 0 with ESMTPA; 20 Mar 2020 14:45:34 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2020 15:45:20 +0100
Message-Id: <20200320144520.16732-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2] classes/populate_sdk_base: Implement xz compression options
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
X-List-Received-Date: Fri, 20 Mar 2020 14:45:35 -0000

Building an SDK on a machine with 8GB RAM resulted in excessive swapping
due to the xz compressor using ~20GB of memory. This is because xz is
being called with "-T 0 -9".

To allow tuning the compression versus memory usage, introduce a variable
named SDK_XZ_OPTIONS that defaults to a more sane default:
SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
The use of XZ_DEFAULTS fixes the excessive memory usage.
The SDK_XZ_COMPRESSION_LEVEL variable allows overriding the speed vs
compression. In an office or development environment the extra time
spent on compressing a few percent more is just not worth it.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index d03465b6fc..179ed93979 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -48,6 +48,8 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 # Default archived SDK's suffix
 SDK_ARCHIVE_TYPE ?= "tar.xz"
+SDK_XZ_COMPRESSION_LEVEL ?= "-9"
+SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {
@@ -58,7 +60,7 @@ python () {
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 -9 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-- 
2.17.1


