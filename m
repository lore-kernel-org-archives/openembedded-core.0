Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 543 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Mar 2020 12:32:01 UTC
Received: from jax4mhfb01.myregisteredsite.com
	(jax4mhfb01.myregisteredsite.com [64.69.218.94])
	by mail.openembedded.org (Postfix) with ESMTP id 76C7E60B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 12:32:01 +0000 (UTC)
Received: from jax4mhob04.myregisteredsite.com
	(jax4mhob04.myregisteredsite.com [64.69.218.84])
	by jax4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	02ICN0TE010208 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 08:23:00 -0400
Received: from mailpod.hostingplatform.com
	(atl4qobmail03pod0.registeredsite.com [10.30.71.205])
	by jax4mhob04.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	02ICMAte025467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 08:22:10 -0400
Received: (qmail 15215 invoked by uid 0); 18 Mar 2020 12:22:10 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid)
	(mike@milosoftware.com@83.128.90.119)
	by 0 with ESMTPA; 18 Mar 2020 12:22:10 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2020 13:21:56 +0100
Message-Id: <20200318122156.23599-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] classes/populate_sdk_base: Implement xz compression options
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
X-List-Received-Date: Wed, 18 Mar 2020 12:32:01 -0000

Building an SDK on a machine with 8GB RAM resulted in excessive swapping
due to the xz compressor using ~20GB of memory. This is because xz is
being called with "-T 0 -9".

To allow tuning the compression versus memory usage, introduce a variable
named SDK_XZ_OPTIONS that defaults to a more sane default:
SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${XZ_COMPRESSION_LEVEL}"
Thus, inherit any XZ tuning already done, and allow users to specify
overrides for this task in their config by supplying SDK_XZ_OPTIONS.
Since XZ_COMPRESSION_LEVEL defaults to -9 this does not change the standard
behavior.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/populate_sdk_base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index d03465b6fc..13247e42e5 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -48,6 +48,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 # Default archived SDK's suffix
 SDK_ARCHIVE_TYPE ?= "tar.xz"
+SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${XZ_COMPRESSION_LEVEL}"
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {
@@ -58,7 +59,7 @@ python () {
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 -9 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-- 
2.17.1


